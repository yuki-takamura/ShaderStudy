Shader "Custom/ChangeColorWithCSharp"
{
	Properties
	{
		_HogeFloat("Hoge FloatA", Float) = 0
		_HogeRange("Hoge Range", Range(0, 1)) = 1
		_HogeColor("Hoge Color", Color) = (1, 0, 0, 0)
		_HogeTex("Hoge Texture", 2D) = "white"{}

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

		float _HogeFloat;
		float _HogeRange;
		float4 _HogeColor;
		sampler2D _HogeTex;
		
		float4 _Color;
		void surf (Input IN, inout SurfaceOutputStandard o)
		{
			o.Albedo = _Color;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
