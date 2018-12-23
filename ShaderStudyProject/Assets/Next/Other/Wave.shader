Shader "Custom/Wave" {
	Properties
	{
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}

		_Normal("Normal Tex", 2D) = "bump"{}
		_Normal2("Normal Tex2", 2D) = "bump"{}

		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		sampler2D _Normal;
		sampler2D _Normal2;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;

			float2 w = float2(cos(_Time.y * 0.2), 0);
			float2 h = float2(0, sin(_Time.y * 0.2));

			half3 n = UnpackNormal(tex2D(_Normal, IN.uv_MainTex + w));
			half3 n2 = UnpackNormal(tex2D(_Normal2, IN.uv_MainTex + h));
			o.Normal = (n + n2) * 0.5;
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
