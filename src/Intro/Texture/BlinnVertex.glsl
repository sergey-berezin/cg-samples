#version 330 core

uniform vec4 LightPosition = vec4(0,0,0,1);

in vec3 position;
in vec3 normal;
in vec2 tex;

out vec3 eyeSurfaceNormal;
out vec3 eyeLightDirection;
out vec3 eyeSurfacePosition;
out vec2 texCoords;

uniform mat4 mv;
uniform mat4 mvp;
uniform mat3 nm;

void main()
{
	vec4 pos =	mv * vec4(position, 1);	
	eyeSurfacePosition = pos.xyz / pos.w;
	vec3 eyeLightPosition   = LightPosition.xyz / LightPosition.w; 

	eyeSurfaceNormal   = normalize(nm * normal);
	eyeLightDirection  = normalize(eyeLightPosition - eyeSurfacePosition);

	texCoords = vec2(tex.x*5, tex.y);
	
	gl_Position = mvp * vec4(position, 1);
}