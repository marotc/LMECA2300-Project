#include "animation.h"

static double P_max(Particle** p, int n_p);
static double P_min(Particle** p, int n_p);
static double u_max(Particle** p, int n_p);
static double u_min(Particle** p, int n_p);

Animation* Animation_new(int n_p,double timeout, Grid* grid, double R_p, Vector** edges, int n_e){
  Animation* animation = (Animation*) malloc(sizeof(Animation));

  animation->timeout = timeout;
  animation->n_p = n_p;

  animation->window = bov_window_new(1024, 780, "Project: SPH");
  bov_window_set_color(animation->window, (GLfloat[]){0.9f, 0.85f, 0.8f, 0.0f});
  bov_window_enable_help(animation->window);

  GLfloat(*data)[8] = malloc(sizeof(data[0])*n_p);
  animation->bov_particles = bov_particles_new(data, n_p, GL_DYNAMIC_DRAW);
  bov_points_set_width(animation->bov_particles, R_p);

  free(data);

  animation->n_e = n_e;
  animation->domain = load_Domain(edges, n_e);
  bov_points_set_width(animation->domain, 0.001);
  bov_points_set_color(animation->domain,(GLfloat[]){1.0, 0.0, 0.0, 1.0});

  if (grid != NULL){
    animation->grid = load_Grid(grid);
  }
	else{
    animation->grid = NULL;
  }

  return animation;
}

void Animation_free(Animation* animation){
  bov_points_delete(animation->bov_particles);
  if(animation->domain = NULL){
    bov_points_delete(animation->domain);
  }
	if(animation->grid != NULL)
		bov_points_delete(animation->grid);
	bov_window_delete(animation->window);
	free(animation);
}
bov_points_t* load_Domain(Vector** edges, int n_e){
  GLfloat(*data)[2] = malloc(sizeof(data[0])*n_e);
  for(int i = 0 ; i < n_e;i ++){
    data[i][0] = edges[2*i]->X[0];
    data[i][1] = edges[2*i]->X[1];
    // printf("noeud %d :\t (%f,%f)\n", i, data[i][0], data[i][1]);
  }
  bov_points_t *points = bov_points_new(data, n_e, GL_STATIC_DRAW);
  free(data);
	return points;
}

bov_points_t* load_Grid(Grid* grid){
	int nLines = (grid->nCellx + 1) + (grid->nCelly + 1);
	GLfloat(*data)[2] = malloc(sizeof(data[0])*2*nLines);
	for (int i = 0;i < (grid->nCellx + 1);i++)
	{
		data[2 * i][0] = grid->left + i*grid->h;
		data[2 * i][1] = grid->bottom;
		data[2 * i + 1][0] = grid->left + i*grid->h;
		data[2 * i + 1][1] = grid->top;
	}
	int shift = 2 * (grid->nCellx + 1);
	for (int j = 0;j < (grid->nCelly + 1);j++)
	{
		data[shift + 2 * j][0] = grid->left;
		data[shift + 2 * j][1] = grid->bottom + j*grid->h;
		data[shift + 2 * j + 1][0] = grid->right;
		data[shift + 2 * j + 1][1] = grid->bottom + j*grid->h;
	}
	bov_points_t *points = bov_points_new(data, 2*nLines, GL_STATIC_DRAW);
	bov_points_set_width(points, 0.001);
	double L = grid->h*grid->nCellx;

	free(data);
	return points;
}

static void colormap(float v, float color[3]){
  float v1 = 3.5*(v-0.7);
	float v2 = 1.25*v;
	float v3 = fminf(0.5,v)*2.0;

	// color[0] = -v1*v1+1.0f;
	// color[1] = 6.0f*v2*v2*(1.0f-v2);
	// color[2] = 5.5f*v3*(1.0f-v3)*(1.0f-v3);

	/* alternative: classical jet colormap */
	color[0] = 1.5 - 4.0 * fabs(v - 0.75);
	color[1] = 1.5 - 4.0 * fabs(v - 0.5 );
	color[2] = 1.5 - 4.0 * fabs(v - 0.25);
}

static void fillData(GLfloat (*data)[8], Particle** particles, int n_p){
  double Pmax = P_max(particles, n_p);
  double Pmin = P_min(particles, n_p);
  double umax = u_max(particles, n_p);
  double umin = u_min(particles, n_p);
	for(int i=0; i<n_p; i++) {
    // printf("i = %d/%d\n",i,n_p);
    Particle* p = particles[i];
		data[i][0] = p->fields->x->X[0]; // x (rand between -100 and 100)
		data[i][1] = p->fields->x->X[1]; // y (rand between -100 and 100)
		data[i][2] = p->fields->u->X[0]; // speed x (not used by default visualization)
		data[i][3] = p->fields->u->X[1]; // speed y (not used by default visualization)
		data[i][4] = 0;
		data[i][5] = 0;
		data[i][6] = 0;
		// data[i][7] = 0;
    // double P = p->fields->P;
    double u = sqrt(pow(p->fields->u->X[0],2) + pow(p->fields->u->X[1],2));
    double field;
    // if(Pmax == Pmin){
    //   field = 0.0;
    // }
    // else{
    //   field = (P - Pmin)/(Pmax - Pmin);
    // }
    if(umax == umin){
      field = 0.0;
    }
    else{
      field = (u - umin)/(umax - umin);
    }

		colormap(field, &data[i][4]); // fill color
		data[i][7] = 0.8f; // transparency
  }
}
void show(Particle** particles, Animation* animation, int iter, bool wait, bool grid){
  int n_p = animation->n_p;
  //------------------------ UPDATE PARTICLES ----------------------------------
  GLfloat(*data)[8] = malloc(sizeof(data[0])*n_p);
	fillData(data, particles, n_p);
  bov_points_t* bov_particles = animation->bov_particles;
  bov_particles = bov_particles_update(bov_particles, data,n_p);
  free(data);

  // --------------------------- SCREENSHOT ------------------------------------
  char screenshot_name[64] = "moving_circle_";
	char int_string[32];
	sprintf(int_string, "%d", iter);
	strcat(screenshot_name, int_string);
  int SCREENSHOT_STEP = 100;

  // -------------------------- CREATE THE WINDOW ------------------------------
  bov_window_t* window = animation->window;
  double tbegin = bov_window_get_time(window);
  double timeout = animation->timeout;

  // ------------------------------ SHOW ---------------------------------------
  if(!wait){
    while(bov_window_get_time(window) - tbegin < timeout){
      if(animation->grid != NULL && grid)
				bov_lines_draw(window,animation->grid,0, BOV_TILL_END);
    bov_particles_draw(window, animation->bov_particles, 0, BOV_TILL_END);
    bov_line_loop_draw(window, animation->domain,0,BOV_TILL_END);
    if (iter%SCREENSHOT_STEP == 0) {
      bov_window_screenshot(window, screenshot_name);
    }
    bov_window_update(window);
    }
	}
  // ----------------------- Keep it open if it is the end ---------------------
  else {
    while (!bov_window_should_close(window)) {
      if (animation->grid != NULL && grid)
        bov_lines_draw(window, animation->grid, 0, BOV_TILL_END);
      bov_particles_draw(window, animation->bov_particles, 0, BOV_TILL_END);
      bov_line_loop_draw(window, animation->domain,0,BOV_TILL_END);
      bov_window_screenshot(window, screenshot_name);
      bov_window_update_and_wait_events(window);
    }
  }
}






static double P_max(Particle** p, int n_p){
  double Pmax = p[0]->fields->P;
  for(int i = 1; i < n_p ; i++){
    // printf("i = %d/%d\n",i,n_p);
    if(p[i]->fields->P > Pmax){
      Pmax = p[i]->fields->P;
    }
  }
  return Pmax;
}
static double P_min(Particle** p, int n_p){
  double Pmin = p[0]->fields->P;
  for(int i = 1; i < n_p ; i++){
    // printf("i = %d/%d\n",i,n_p);
    if(p[i]->fields->P < Pmin){
      Pmin = p[i]->fields->P;
    }
  }
  return Pmin;
}
static double u_max(Particle** p, int n_p){
  double Pmax = sqrt(pow(p[0]->fields->u->X[0],2) + pow(p[0]->fields->u->X[1],2));
  for(int i = 1; i < n_p ; i++){
    // printf("i = %d/%d\n",i,n_p);
    if(sqrt(pow(p[i]->fields->u->X[0],2) + pow(p[i]->fields->u->X[1],2)) > Pmax){
      Pmax = sqrt(pow(p[i]->fields->u->X[0],2) + pow(p[i]->fields->u->X[1],2));
    }
  }
  return Pmax;
}
static double u_min(Particle** p, int n_p){
  double Pmin = sqrt(pow(p[0]->fields->u->X[0],2) + pow(p[0]->fields->u->X[1],2));
  for(int i = 1; i < n_p ; i++){
    // printf("i = %d/%d\n",i,n_p);
    if(sqrt(pow(p[i]->fields->u->X[0],2) + pow(p[i]->fields->u->X[1],2)) < Pmin){
      Pmin = sqrt(pow(p[i]->fields->u->X[0],2) + pow(p[i]->fields->u->X[1],2));
    }
  }
  return Pmin;
}
