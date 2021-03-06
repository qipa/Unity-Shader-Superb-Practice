﻿

Shader "ShaderSuperb/Session13/23-BlitCopy"
{
	Properties
	{
		_MainTex ("Texture", any) = "" {}
		_Color("Multiplicative color", Color) = (1.0, 1.0, 1.0, 1.0)
	}

	SubShader 
	{ 
		Pass 
		{
 			ZTest Always Cull Off ZWrite Off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 2.0

			#include "UnityCG.cginc"

			sampler2D _MainTex;
			uniform float4 _MainTex_ST;
			uniform float4 _Color;

			struct appdata_t {
				float4 vertex : POSITION;
				float2 texcoord : TEXCOORD0;
			};

			struct v2f {
				float4 vertex : SV_POSITION;
				float2 texcoord : TEXCOORD0;
			};

			v2f vert (appdata_t v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.texcoord = TRANSFORM_TEX(v.texcoord.xy, _MainTex);
				return o;
			}

			fixed4 frag (v2f i) : SV_Target
			{
				return tex2D(_MainTex, i.texcoord) * _Color;
			}
			ENDCG 

		}
	}
	
	Fallback Off 
}

