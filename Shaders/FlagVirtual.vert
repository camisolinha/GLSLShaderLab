#version 330 core

layout(location = 0) in vec3 aPos;
layout(location = 1) in vec3 aNormal;
layout(location = 2) in vec2 aTexCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform float iTime;

out vec3 FragPos;
out vec3 Normal;
out vec2 TexCoord;

void main()
{
    vec3 pos = aPos;

    float freq = 4.0;
    float amp = 0.1; 
    float speed = 2.0;

    float attenuation = pow(aPos.x, 2.0); 
    float wave = sin(aPos.x * freq + iTime * speed) * amp * attenuation;

    pos.y += wave; 
    pos.z += wave * 0.3; 

    FragPos = vec3(model * vec4(pos, 1.0));

    Normal = mat3(transpose(inverse(model))) * aNormal;

    TexCoord = aTexCoord;

    gl_Position = projection * view * vec4(FragPos, 1.0);
}
