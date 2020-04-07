#include "SPH_operator.h"

double div_u(Particle* pi, Kernel kernel){
  double divergence = 0;

  double rho_i = pi->param->rho;
  double h = pi->param->h;
  Vector* fi = pi->fields->u;
  Vector* xi = pi->fields->x;

  ListNode* node = pi->neighbors->head;
  while(node != NULL){
    Particle* pj = node->v;
    double mj = pj->param->mass;
    Vector* fj = pj->fields->u;
    Vector* xj = pj->fields->x;

    Vector* dW = grad_kernel(xi ,xj,h, kernel);
    Vector* fj_fi = diff(fj,fi);
    double dot_prod = dot(fj_fi,dW);

    divergence += dot_prod*mj;

    Vector_free(fj_fi);
    Vector_free(dW);
    node = node->next;
  }

  return divergence/rho_i;
}


Vector* grad_P(Particle* pi, Kernel kernel){
  Vector* grad = Vector_new(pi->fields->u->DIM);

  double fi = pi->fields->P;
  double rho_i = pi->param->rho;
  double h = pi->param->h;
  Vector* xi = pi->fields->x;

  ListNode* node = pi->neighbors->head;
  while(node != NULL){
    Particle* pj = node->v;
    double fj = pj->fields->P;
    double mj = pj->param->mass;
    double rho_j = pj->param->rho;
    Vector* xj = pj->fields->x;

    Vector* dW = grad_kernel(xi ,xj,h, kernel);
    double a = fi/(rho_i*rho_i) + fj/(rho_j*rho_j);
    Vector* inner = times(dW,a*mj);
    sum_into(grad, inner);

    Vector_free(inner);
    Vector_free(dW);
    node = node->next;
  }
  times_into(grad,-1.0/rho_i);
  return grad;
}


Vector* lapl_u(Particle* pi, Kernel kernel){
  Vector* lapl = Vector_new(pi->fields->u->DIM);

  double h = pi->param->h;
  Vector* fi = pi->fields->u;
  Vector* xi = pi->fields->x;

  ListNode* node = pi->neighbors->head;
  while(node != NULL){
    Particle* pj = node->v;
    double mj = pj->param->mass;
    double rho_j = pj->param->rho;
    Vector* fj = pj->fields->u;
    Vector* xj = pj->fields->x;

    Vector* dW = grad_kernel(xi ,xj,h, kernel);
    Vector* fi_fj = diff(fi,fj);
    Vector* xi_xj = diff(xi,xj);
    double dist_xixj = dist(xi,xj);
    double dot_prod = dot(xi_xj, dW)/dist_xixj;
    Vector* inner = times(fi_fj,dot_prod*mj/rho_j);
    sum_into(lapl,inner);

    Vector_free(dW);
    Vector_free(fi_fj);
    Vector_free(xi_xj);
    Vector_free(inner);

    node = node->next;
  }
  times_into(lapl,2);
  return lapl;
}