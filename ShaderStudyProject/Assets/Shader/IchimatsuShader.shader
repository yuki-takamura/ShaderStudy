Shader "Custom/IchimatsuShader" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;

			fixed4 col = fixed4(0, 0, 0, 0);
			fixed4 Color = fixed4(1, 1, 1, 1);
			fixed4 SecondColor = fixed4(0, 0, 0, 1);

			if (IN.uv_MainTex.x * 10 % 2 < 1)
			{
				if (IN.uv_MainTex.y * 10 % 2 < 1)
				{
					col = Color;
				}
				else
				{
					col = SecondColor;
				}
			}
			else
			{
				if (IN.uv_MainTex.y * 10 % 2 < 1)
				{
					col = SecondColor;
				}
				else
				{
					col = Color;
				}
			}

			//o.Albedo = c.rgb;
			o.Albedo = col;
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
