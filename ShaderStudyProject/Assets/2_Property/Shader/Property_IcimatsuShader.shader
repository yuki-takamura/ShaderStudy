Shader "Custom/Property_IchimatsuShader"
{
	Properties
	{
		_Color ("Color", Color) = (1,1,1,1)
		_SecondColor("Second Color", Color) = (0, 0, 0, 0)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0

		_Num("Number Of Blocks", Float) = 10
	}
	SubShader
	{
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
		fixed4 _SecondColor;
		float _Num;

		void surf (Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;

			fixed4 col = fixed4(0, 0, 0, 0);
			fixed4 Color = _Color;
			fixed4 SecondColor = _SecondColor;

			if (IN.uv_MainTex.x * _Num % 2 < 1)
			{
				if (IN.uv_MainTex.y * _Num % 2 < 1)
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
				if (IN.uv_MainTex.y * _Num % 2 < 1)
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
