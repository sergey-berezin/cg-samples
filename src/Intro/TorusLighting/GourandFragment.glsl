#version 330 core

in vec4 vertexColor;

out vec4 fragColor;

void main()
{
    fragColor = vertexColor;
}