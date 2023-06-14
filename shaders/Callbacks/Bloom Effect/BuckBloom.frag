#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

// https://www.shadertoy.com/view/4dlBWl

#define WEBCAM_RESOLUTION 512.0

void mainImage()
{
	vec2 uv = fragCoord.xy / iResolution.xy;

	// Sobel operator
	float offset = 1.0 / WEBCAM_RESOLUTION;
	vec3 o = vec3(-offset, 0.0, offset);
	vec4 gx = vec4(0.0);
	vec4 gy = vec4(0.0);
	vec4 t;
	gx += texture(iChannel0, uv + o.xz);
	gy += gx;
	gx += 1.0 * texture(iChannel0, uv + o.xy);
	t = texture(iChannel0, uv + o.xx);
	gx += t;
	gy -= t;
	gy += 1.0 * texture(iChannel0, uv + o.yz);
	gy -= 1.0 * texture(iChannel0, uv + o.yx);
	t = texture(iChannel0, uv + o.zz);
	gx -= t;
	gy += t;
	gx -= 1.0 * texture(iChannel0, uv + o.zy);
	t = texture(iChannel0, uv + o.zx);
	gx -= t;
	gy -= t;
	vec4 grad = sqrt(gx * gx + gy * gy);

	// Apply bloom effect only to yellow colors
	vec4 bloom = vec4(0.0);
	float bloomIntensity = 0; // Adjust the bloom intensity
	float bloomThreshold = 0; // Adjust the bloom threshold

	if (grad.r > bloomThreshold || grad.g > bloomThreshold || grad.b > bloomThreshold) {
		if (texture(iChannel0, uv).r > 0.8 && texture(iChannel0, uv).g > 0.8 && texture(iChannel0, uv).b < 0.2) {
			bloom = grad * bloomIntensity;
		}
	}

	// Blur the bloom effect
	int blurRadius = 5; // Adjust the blur radius
	vec4 blur = vec4(0.0);
	for (int i = -blurRadius; i <= blurRadius; i++) {
		for (int j = -blurRadius; j <= blurRadius; j++) {
			vec2 offset = vec2(float(i), float(j)) / iResolution.xy;
			blur += texture(iChannel0, uv + offset);
		}
	}
	blur /= float((blurRadius * 2 + 1) * (blurRadius * 2 + 1));

	// Blend the blurred bloom with the original image
	vec4 finalColor = texture(iChannel0, uv) + bloom + blur;

	fragColor = finalColor;
	gl_FragColor.a = flixel_texture2D(bitmap, openfl_TextureCoordv).a;
}
