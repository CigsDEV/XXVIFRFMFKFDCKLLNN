//header
#pragma header
//vec2 and floats
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;

// definitions
#define iChannel0 bitmap
#define iChannel1 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main


void mainImage( out vec4 o, vec2 i ) { 
    o = step(texture(iChannel0, i/8.).r, texture(iChannel1,i/iResolution.xy));
    pow(texture(iChannel0, i/8.).r, .45) < texture(iChannel1,i/iResolution.xy).r  ? o++ : o;
}



//open_fl is NEEDED. 

//https://www.shadertoy.com/view/Mds3zn