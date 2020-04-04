static GLchar particles_geom[]={" /*************************************************************************\n"
"  * BOV 0.1\n"
"  * A wrapper around OpenGL and GLFW (www.glfw.org) to draw simple 2D\n"
"  * graphics.\n"
"  *------------------------------------------------------------------------\n"
"  * Copyright (c) 2019-2020 C\n"
"lestin Marot <marotcelestin@gmail.com>\n"
"  *\n"
"  * This software is provided 'as-is', without any express or implied\n"
"  * warranty. In no event will the authors be held liable for any damages\n"
"  * arising from the use of this software.\n"
"  *\n"
"  * Permission is granted to anyone to use this software for any purpose,\n"
"  * including commercial applications, and to alter it and redistribute it\n"
"  * freely, subject to the following restrictions:\n"
"  *\n"
"  * 1. The origin of this software must not be misrepresented; you must not\n"
"  *    claim that you wrote the original software. If you use this software\n"
"  *    in a product, an acknowledgment in the product documentation would\n"
"  *    be appreciated but is not required.\n"
"  *\n"
"  * 2. Altered source versions must be plainly marked as such, and must not\n"
"  *    be misrepresented as being the original software.\n"
"  *\n"
"  * 3. This notice may not be removed or altered from any source\n"
"  *    distribution.\n"
"  *\n"
"  *************************************************************************/\n"
"\n"
"#version 150 core\n"
"\n"
"layout (std140) uniform objectBlock\n"
"{\n"
"	vec4 fillColor;\n"
"	vec4 outlineColor;\n"
"	vec2 localPos;\n"
"	vec2 localScale;\n"
"	float width;\n"
"	float marker;\n"
"	float outlineWidth;\n"
"	// float rotation;\n"
"	int space_type; // 0: normal sizes, 1: unzoomable, 2: unmodifable pixel size\n"
"};\n"
"\n"
"layout (std140) uniform worldBlock\n"
"{\n"
"	vec2 resolution;\n"
"	vec2 translate;\n"
"	float zoom;\n"
"};\n"
"\n"
"layout(points) in;\n"
"layout(triangle_strip, max_vertices = 4) out;\n"
"\n"
"in vec2 speedVert[1];\n"
"in vec4 dataVert[1];\n"
"\n"
"out vec2 posGeom;\n"
"flat out vec2 speedGeom;\n"
"flat out vec4 dataGeom;\n"
"flat out float pixelSize;\n"
"\n"
"void main()\n"
"{\n"
"	float minRes = min(resolution.x, resolution.y);\n"
"	vec2 resRatio = minRes / resolution;\n"
"\n"
"	// for particles, space_type has no effect\n"
"	vec2 scaling = resRatio * zoom;\n"
"	vec2 translation = resRatio * zoom * (localPos + translate);\n"
"	pixelSize = 2.0 / (minRes * zoom);\n"
"\n"
"	float w = width + pixelSize;\n"
"\n"
"	vec2 p = gl_in[0].gl_Position.xy * localScale;\n"
"\n"
"	vec2 center = p * scaling + translation;\n"
"	vec2 upRight = center + w * scaling;\n"
"	vec2 downLeft = center - w * scaling;\n"
"\n"
"	// a bit of culling\n"
"	if(any(lessThanEqual(upRight, -vec2(1.0))) ||\n"
"	   any(greaterThanEqual(downLeft, vec2(1.0))))\n"
"		return;\n"
"\n"
"	vec2 upLeft = vec2(downLeft.x, upRight.y);\n"
"	vec2 downRight = vec2(upRight.x, downLeft.y);\n"
"\n"
"	speedGeom = speedVert[0];\n"
"	dataGeom = dataVert[0];\n"
"\n"
"	posGeom = vec2(-w, w);\n"
"	gl_Position = vec4(upLeft, 0.0, 1.0);\n"
"	EmitVertex();\n"
"	posGeom = vec2(-w);\n"
"	gl_Position = vec4(downLeft, 0.0, 1.0);\n"
"	EmitVertex();\n"
"	posGeom = vec2(w);\n"
"	gl_Position = vec4(upRight, 0.0, 1.0);\n"
"	EmitVertex();\n"
"	posGeom = vec2(w, -w);\n"
"	gl_Position = vec4(downRight, 0.0, 1.0);\n"
"	EmitVertex();\n"
"	EndPrimitive();\n"
"}\n"
};
