#version 330 core
out vec4 FragColor;

out vec3 FragPos;
in vec3 Normal;
in vec2 TexCoord;

out uniform iTime;
out vec3 Normal;
out vec2 TexCoord;
out vec3 WorldPos;

void main()
{
    WorldPos= vec3(model * vec4(aPos + vec3(sin(iTime + aPos.y * 2),1,sin(iTime+aPos.x * 2)), 1.0));
    FragPos = WorldPos;
    Normal = mat3(transpose(model)) * aNormal;
    TexCoord = aTexCoord;

    gl_Position = projection * view * vec4(FragPos, 1.0);
}