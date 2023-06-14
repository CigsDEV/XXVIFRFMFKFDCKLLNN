#version 330 core

in vec2 texCoord;
uniform sampler2D textureSampler;

out vec4 fragColor;

void main() {
    // Sample the texture color
    vec4 texColor = texture(textureSampler, texCoord);

    // Define the glowing color
    vec4 glowColor = vec4(1.0, 0.5, 0.0, 1.0); // Example glowing color (orange)

    // Calculate the intensity based on the texture color
    float intensity = texColor.r * 0.3 + texColor.g * 0.59 + texColor.b * 0.11;
    intensity = smoothstep(0.5, 1.0, intensity); // Apply a smoothstep function for a smoother glow transition

    // Combine the texture color with the glowing color
    vec4 finalColor = texColor + glowColor * intensity;

    fragColor = finalColor;
}
