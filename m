Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F83C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Cc:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tG4G/VbrLYDYp2sJiCejaDKeC1t2KHkbrTVvD/qV7CE=; b=y5owx5NDTp4tRpv9syroi6RaEq
	A55jCioSOFj51mIpnkraevxsMPz/3YZkpCbKZcIVFQ14D9cj+PJoSywb1jdZb2HZZYcsLslXyHpvY
	TyO24xfcCyHmNHg/hlyrTftaS/+p3L+7Vc9KbFa4qw7pPTGQjcerRKXdyqxa4ikov4o1ga1Nl4F51
	VNU/dUo36l1qeUBqC9F085R9hxIj5ubEXsWsMOp5npL0xfujS5fodAKsp3glY738iyf5DpRUKAueT
	JzmZKukHyDRb7B7HjpjQu19M2PhlK6wXuX5oC1kX3pZ62qTplgQi+QrMlVtH5KErKiTTMo+inPwhX
	2MZqGbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virjO-00000006oLL-3jHF;
	Thu, 22 Jan 2026 10:16:02 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virjL-00000006oKI-0GUJ;
	Thu, 22 Jan 2026 10:16:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyufKJqF38zjivLfEBUu2KJWAEhGgJwgqAEIvq+8tRs+v0JxXuPbrq4OZVDFaPbjk2Q3RpO6VXDE3jqHIATEzX61zF2Cv312j/MlT6MkNowbt6ePsn3ckuNVH+MDpAj1VULVHSBr7yw2fXLA/6/Bl7X7zX5V0NeON3mTt3NJgSuY3eaf3f37I7eskvUiYbMTIAc9R33tXD3H0TfKpwobVb1KEDwpNsbpXtux2oQ8oUXHG+ZHbBSBpoBwFHWBo7zijy5BxJRHAFULpmYAiwDgrakGQS9DtY9bnqS2vYEqyMb/zedpEhk2gv/BLls3KQhurDzNqQN7VNpCcBBbqaUC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peii8Ggb7SGWOg6fXNcTJAG19niEhzEQI6P42wroAF0=;
 b=TgEPYhVQIW9Wk3N4Ssy3J0uQmbMYRbvfxgVwpYUN7Ub3MaNrTeOl0J53qnVJ2raTQoTZBUvtdszCkqpkPEd3fiGzC6caNF1Y3nyJkboVxBA1VV5Gczb95Rwp+U12TtPs16AJsnSwVx86++OBK2GbkJ8aqMpoQ9CQkAS+i9dZ4CJIdBU8qFXza0wezVQZm6DWLZsgwBS+oI7Cn0DM8sBV1FxbTHlBAMYX+O242ZsmHw76WRNTTb/XXUJbTQWok00OfxtHiaVva6/Lzd9CtSEuDxKNuF8sSFJ+9uTMpnmeReQkE/gHvZqBnSm1Wq+R7ddKFSOFs9uFSoR/r44I5B06uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by SEYPR06MB5790.apcprd06.prod.outlook.com (2603:1096:101:b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 10:15:47 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::30b6:5b0d:1b00:5a01%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 10:15:47 +0000
Message-ID: <8479971d-a0ee-4fb7-8cea-82e5f86d3b8e@linumiz.com>
Date: Thu, 22 Jan 2026 11:15:39 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paulk@sys-base.io
Subject: Re: [PATCH v3 1/6] phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS
 in combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134724.447131-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20251116134724.447131-1-kuba@szczodrzynski.pl>
X-ClientProxiedBy: BMXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::15) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|SEYPR06MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d416b34-d450-4a8e-abb3-08de599f359d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OW0zVkRMSHg0bFNwbUlzaXdXWkdjVzNuY0Q5Vm1YbFhmL2QrWVZWak9vc1lZ?=
 =?utf-8?B?U084cDh5LzRBRjM0NHBLN09kTnBKL29YdTB5Nk02Q0JqRjJTaDBHOEJwMFRI?=
 =?utf-8?B?UVc3UTRZelR3cjhpeWRFN3QrNjAxaTJ4MWxrRElEUVNzaUdQUUtxT2NRM3Rj?=
 =?utf-8?B?aGZEQmNwTE14RFc1dTZVMlhFM2hUVzVqd1FYb3dsVloxTGg0cjNJOURDcS9Y?=
 =?utf-8?B?S0JQYnlJd0JPWUd0SzF2aVZnb3JCcjdMNEtlaVJiTGVhdUliS0gzMlQ1WWJw?=
 =?utf-8?B?Q0liMDl1bEE3K1VzT2JySjRwR2t0MEpYekJ4ekR5RTJlZTNSWXp1NWhsb1Jn?=
 =?utf-8?B?SS9YOS8rcnMyTjUxNnZNU0RHb2pVMnh0eFdXOGFUclJsVCtXVkd6aTRlY3BL?=
 =?utf-8?B?OE52cmk0NmVOdG92NFFQeit1RDFLMkpBNVgxdjNDdGVDak4yRXdwOHZ6akJz?=
 =?utf-8?B?OU5OZ0wrTTBVRDRuUmFCeURhaVUxNmw2bmtKRktiZUNYZnZoeFpQSk1wLzBo?=
 =?utf-8?B?UWNPaTk4bGI2aE4xZ3BQR3Y2b0swYllSWnZDRy8zbU9rZE00MytaZlVMVGtu?=
 =?utf-8?B?NVVLVmJaZGZsYllzZTFwKy9vazlQbVZXVU9IUzJWeE9lY21JYVhqZEhpaVBy?=
 =?utf-8?B?RFVqMWhVeEkzSmMycXdEOWZIdVB4ZDhabXEwU0RrZ0N5akJEaEJSL2pYU3Fr?=
 =?utf-8?B?dmN4WGYzaFg3SGRiblFRZlZEUXp2dndxQXRTakJ3Tllrdktpc3hTUEg3bHpq?=
 =?utf-8?B?eFEvQWFxS1YybEIvZXBUOWVlUXFiRjM5SXc5NFNLVDMvUGNoWERrYmxxdGU1?=
 =?utf-8?B?SGtQVXZYN3VtZ1pLVC85cWtRd3NiVkNlZzRHK1hnYkpQWWN0VDY4Zmd5KzdZ?=
 =?utf-8?B?TjBHdVVJY0IrV0xpeU9RcGhtUHRGbmxYQWNQTnE2cVVuR01IZnMwZ2prcmpp?=
 =?utf-8?B?eVdjeXA3YXV5S1NMOHNobWZQZW5NN2ZsZndUdHFTTWJRek9WWVA5L3VPZGRS?=
 =?utf-8?B?Y1hGcU5idXZVZUgzZUlzN3hiSHd1OEtISG9uZ3oyVG1WZU9wbVVGeklVcWUr?=
 =?utf-8?B?ckJueDhXb005WEFWM3VCVTg5RUMydDZXWHRKMnJHWHVEWUsrRlpyNiswQTdr?=
 =?utf-8?B?TFFKQTJMMUMxTTQ3Q0RwNE15N09DOVVnUlR2Z01nM1Q1a2hzMjRhQnA1eHYx?=
 =?utf-8?B?YVVzYzlDamVPWlpGckNIek4rMmpoVU40b3NTUUVKT2U5S0RCcjhZY05pUDF0?=
 =?utf-8?B?cmNzVXNPeVV4czFLRzY3dENTcnpIK2I2ZmdtUmc1VGFxekl3V2lGNlhMTEVG?=
 =?utf-8?B?MWZDMHFXYWY4eE9tZGk1VVViekl4dUluZEJ6REd2bk5wbnp0S0NObXI2Q2ZZ?=
 =?utf-8?B?ZExlc3hWT093cVRsZjM1cEZiTVU1c01OenB5bXNPdTJ6RzRSQnBHa1hZOUk5?=
 =?utf-8?B?QUswb09IWDBXREU5ZmpaRXNrT3UrSFN3dm5yYVNrZlJWaXRkazVNaXF3b2t4?=
 =?utf-8?B?T2VTZUJaeUpGandVN1lSYzlPa0xEQStxNkt2QS9QRjhuMjkvQkpkQ3NvUEVa?=
 =?utf-8?B?TTFzWk9vOWR5R0lhb01xeFB2UHJVc1l1ZGQ0MkNaM29uajZZY1ZaNGw2SlN1?=
 =?utf-8?B?OXlUSHltZkpaK1NLZ1BmNmFWQTZOc29lTWRRQzNjOUlJZTRwR0EwbHBueTRq?=
 =?utf-8?B?TjVJTmc2RWtXaGRMOHE2WjNUdFNMR3RET29wNmVjZUZhY0FLVEFPbU9Fb25z?=
 =?utf-8?B?dlVFcFRnZnY2TUpDdy9RUTM3aTVXY3BNOWN1MDhJRTlpUG55VjFJeXRNVnVY?=
 =?utf-8?B?dmtGWFYwbTVwc0FWbHdUZXlTUDBLdTlUc3Z2VTVJUU5OMUZsOVNVd1UwRTRJ?=
 =?utf-8?B?aTN2NGt3NEpCUGVrblcrUEJ3MUxDSmYxaklTWUo5K2c4cjhmb1BMRHVqTndt?=
 =?utf-8?B?cTFoZmJCUTBiN3BFczlYRkZNSjAwRmEzWG5aRmVVb1RaWUp3c2t4M3Rud0dj?=
 =?utf-8?B?Zk52RFFMQnlmVktDcFhYQjUwZjRSa3cwK0Y3aytIVWhFQVB1SDlVNUhtd0ta?=
 =?utf-8?B?clE3SmhVV04zc3FseGJlcDBOK1VrQjlvTFRXMTJHd05UZDA0eHlhdlI5cW1r?=
 =?utf-8?B?Yk1Ma1c2Rkc0SC9OSGFpUE42bVBpNStLY0xFM0w1Z2R1bElGaDhJYys1dVdn?=
 =?utf-8?B?WGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6935.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUpFNGY3Qzh2V1RZa1pDU2k3UzJQL1BrTmlVQkdXSGJxMm9SRjhwWC80ZGZi?=
 =?utf-8?B?VEl2Y2loUDlDZ0lLc1dkQ1dHVkJTSVZ5ZVZpWGpyVmlJd0djZHI4dE5kMnNM?=
 =?utf-8?B?cjVENWJtZ3BJV1FER2RocmUxa25HZ2RhbEhOREord2k4NXM3d1RZWTNNaU5u?=
 =?utf-8?B?aEtLOUhhblRGNW9lZlVvL0orTTE1RWlVU3liWWxjV0tkbEMxUS9WM3hjaGE2?=
 =?utf-8?B?WVozeWlSNk9aMG9hMW53WWx2M1NVZnNpZmgxb3ZYRzRaVHJtSzlHSUNFTW5l?=
 =?utf-8?B?QUUzL2ZqQlFTODlJd0pWMkMxVThlZ1B5bUNwektQZHV3eGRhNUZHYjRmOUR0?=
 =?utf-8?B?dk95OHorOGc3Y0dET05YTGpydkFkTThDcG1kMzZtZzcrOVlCaUtlSldHY2dY?=
 =?utf-8?B?L2FpUnljeko2ZXpmQndNekYyQzRQcloxVDhWYWxIckFJNFFLb0ZHZHFXM2I0?=
 =?utf-8?B?MTBQZStlVHBzOWZOMDhWL2JoZkRTNTNTbmdyV0hHbDRydHY0MnNLZFhYVkVI?=
 =?utf-8?B?LzN3aVFXNEsxOGxyWDJaRXFIcStYVHREbDh4TS9lQWlsVENXR3IzbnZ5T0h4?=
 =?utf-8?B?TTRGWXo3ZGhIVnM3a1VabTdVeUs0bTFVZ2pYcmFYeXFBZGJPaS9PdGdraGlo?=
 =?utf-8?B?a2NGMnVCVG5PS3psUzEycnlZWm9nTHBLN2Zlb3NmZG05Y0Z1dGRwVE1pTkI0?=
 =?utf-8?B?NVUvOXBhNmJyWm90eTdzYlB6cnhFT1hXMklKdS9FN1Zhb2ZRTDA2dktXbHRv?=
 =?utf-8?B?QWtQYzl2NGFsTjlseUI0TU5FVkVoVHR5VWF2RE42TVA5ZjI3a0FLakgrZ2FW?=
 =?utf-8?B?UXUwWE9RZmNXWS83M2tISFBqaWd1YXl4KzRHUUp1R2kyS29iOXRrYlhyMERM?=
 =?utf-8?B?czkzaWVHNnpMSmNGQ3NPdU9tcEtieUNHY2N5RW5vdFpYVHFlOVgyUWxQdXdD?=
 =?utf-8?B?VHN3cjNVcHlEM0dETXVQMGRTNFNaNFB5WGZ6WkFKWE0vWE9qMEk1NjNDbkhS?=
 =?utf-8?B?aStpZ0o2SDA2VE9ScGNoWmdlSE5FL0YrSXNWZ0l5ZGZjR2ZzT0dwQ201ZXcw?=
 =?utf-8?B?ZUUyODBCbWhZYVZJd2Y4TGYrbHdJUXMwV1VURFlFSjRLemRhWFpCVlZ5ZzVB?=
 =?utf-8?B?NTg2ZUhkTThSZHB6WmNsUktYRTkrWmNwQzBxNGhpOFg4R1pEbURGWmo3eFpU?=
 =?utf-8?B?TWw3STdMSWp6N0xkR1hJZlUvQk5nRU92ZGdHZ0NmaWhEV1ZjVk15bGw5VDRY?=
 =?utf-8?B?dzFvY0U3STFOcjlXL0h6RzJhc05hRG5Xa0luallaOGoydDdDWXRBTnpyMVdI?=
 =?utf-8?B?VDZPeHM0c1psWC9oaHFEcGh4SWR1NHN5aW5CK1JSSWNwendlWHRJZ0JWc2lO?=
 =?utf-8?B?UTVsSE4zRmdXSHMxaCtMRlRNK0F6YkJ2Y2hOc0prbHh2VkhlQzlIeHYxTlFO?=
 =?utf-8?B?WFR3R3lyVlRMSm0wTEZvR1VRQXo1dzFQeEZ2dVVDV3VaRnNia1VGOU9zN2do?=
 =?utf-8?B?QU11Rkl2QkNOaVY1WWd6cE1WVld2RENpQ3FIZHdiSEhJd0phUlluaUV5TjlH?=
 =?utf-8?B?b2pHY09YQ1hJd0hrRFNNQWZNTGZ0SzY5Yk0wVUMwWHhIbXVKbjU4WVd4dHJx?=
 =?utf-8?B?TVZzdFkxc1dSYXZQM2NhdUwzWmhZVUdOQ3hwZGdVdVZRako3TG9EN25RU3R3?=
 =?utf-8?B?cGZJeTRJbVEreHF2emR0cFJSRmpIL2hreVA0a2huVi9qUW54ZXMrN0lmVjA0?=
 =?utf-8?B?VHI3ZDFnWnp5SmRHZ0tLeWpMd3NTM05QVlBZTEYvVVJhcnl0dllBYnh1TFFY?=
 =?utf-8?B?V2Rod2tORDU0TUJybUVrSWYrODBacU56OGZMUGttT21yaEVzNWJuS21hSGlz?=
 =?utf-8?B?WU0wOVNGWWFzRVEwU3pJWGxmQU9rbnkxMklyNWRkSGNpejlHdERqMGxHWmx2?=
 =?utf-8?B?WWo2SCtqemxtYnN1aVpXK1FGMDZrdVZYTkNQM0czUU9iTk5xeXl4ckVaQlNN?=
 =?utf-8?B?di9vcUsyVUVLS0VnckFQTzVUa0orQ05PSmlHT2dJL3lzRnJvMmMySmhVL3dp?=
 =?utf-8?B?aHBPWTNmWWJkY0hqTG9DYko1bWZ3czRyRjNYcnpERHg5WU0zaU85MEVSR3Zw?=
 =?utf-8?B?RkZPQjl5b3ZVRG5oUUpiOVdKSTNiMExpR3FxZ0hhWStSeENTR1graU5OQzda?=
 =?utf-8?B?MnhHSHhaREVtVVFlUGl2MnRsUURWenlMVkh2VXEyZHY2NWlrK3RHc0ltTEYv?=
 =?utf-8?B?WjhCUFZCa29oWldDeVNlOWcvcHUrTVV6SWcxaFBCQmVSRXcrRVdXZk9jSUZp?=
 =?utf-8?B?Q29meHBMVFQrcVdYdzBJWVdQZU1XVkx1QzlSVHZjVWtkT2VoK1k4UT09?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d416b34-d450-4a8e-abb3-08de599f359d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:15:46.9403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZS28ABboNn50kAevuHRdSUpyY/U5ifRPywiiwarsHjN+2IFpsWT2/dOnZnyCfez5hilToa5u1FC3f4NHY0+5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_021559_222645_5ED9761A 
X-CRM114-Status: GOOD (  24.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RGVhciBLdWJhLAoKT24gMTEvMTYvMjUgMjo0NyBQTSwgS3ViYSBTemN6b2RyennFhHNraSB3cm90
ZToKPiBTb21lIEFsbHdpbm5lciBjaGlwcyAobm90YWJseSB0aGUgRDFzL1QxMTMgYW5kIHRoZSBB
MTAwKSBoYXZlIGEgImNvbWJvCj4gTUlQSSBEU0kgRC1QSFkiIHdoaWNoIGlzIHJlcXVpcmVkIHdo
ZW4gdXNpbmcgc2luZ2xlLWxpbmsgTFZEUzAuCj4gCj4gSW4gdGhpcyBtb2RlLCB0aGUgRFNJIHBl
cmlwaGVyYWwgaXMgbm90IHVzZWQgYW5kIHRoZSBQSFkgaXMgbm90Cj4gY29uZmlndXJlZCBmb3Ig
RFNJLiBJbnN0ZWFkLCB0aGUgQ09NQk9fUEhZX1JFR3ggcmVnaXN0ZXJzIGFyZSBzZXQgdG8KPiBl
bmFibGUgTFZEUyBvcGVyYXRpb24uCj4gCj4gRW5hYmxlIHRoZSBQSFkgZHJpdmVyIHRvIHdvcmsg
aW4gTFZEUyBtb2RlIG9uIGNoaXBzIHdpdGggYSBjb21ibyBELVBIWS4KPiAKPiBBbHNvIGNoYW5n
ZSB0aGUgU1VONTBJX0NPTUJPX1BIWV9SRUcxIG1hY3JvIG5hbWVzIHRvIHJlZmxlY3QgdGhlIGNv
cnJlY3QKPiByZWdpc3RlciBuYW1lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEt1YmEgU3pjem9kcnp5
xYRza2kgPGt1YmFAc3pjem9kcnp5bnNraS5wbD4KPiAtLS0KPiAgZHJpdmVycy9waHkvYWxsd2lu
bmVyL3BoeS1zdW42aS1taXBpLWRwaHkuYyB8IDcwICsrKysrKysrKysrKysrKysrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waHkvYWxsd2lubmVyL3BoeS1zdW42aS1taXBpLWRwaHkuYyBiL2Ry
aXZlcnMvcGh5L2FsbHdpbm5lci9waHktc3VuNmktbWlwaS1kcGh5LmMKPiBpbmRleCAzNmVhYjk1
MjcuLjU3MDM1YjNhNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BoeS9hbGx3aW5uZXIvcGh5LXN1
bjZpLW1pcGktZHBoeS5jCj4gKysrIGIvZHJpdmVycy9waHkvYWxsd2lubmVyL3BoeS1zdW42aS1t
aXBpLWRwaHkuYwo+IEBAIC0xNjYsOCArMTY2LDggQEAKPiAgI2RlZmluZSBTVU41MElfQ09NQk9f
UEhZX1JFRzBfRU5fQ1AJCUJJVCgwKQo+ICAKPiAgI2RlZmluZSBTVU41MElfQ09NQk9fUEhZX1JF
RzEJCTB4MTE0Cj4gLSNkZWZpbmUgU1VONTBJX0NPTUJPX1BIWV9SRUcyX1JFR19WUkVGMVA2KG4p
CSgoKG4pICYgMHg3KSA8PCA0KQo+IC0jZGVmaW5lIFNVTjUwSV9DT01CT19QSFlfUkVHMl9SRUdf
VlJFRjBQOChuKQkoKG4pICYgMHg3KQo+ICsjZGVmaW5lIFNVTjUwSV9DT01CT19QSFlfUkVHMV9S
RUdfVlJFRjFQNihuKQkoKChuKSAmIDB4NykgPDwgNCkKPiArI2RlZmluZSBTVU41MElfQ09NQk9f
UEhZX1JFRzFfUkVHX1ZSRUYwUDgobikJKChuKSAmIDB4NykKPiAgCj4gICNkZWZpbmUgU1VONTBJ
X0NPTUJPX1BIWV9SRUcyCQkweDExOAo+ICAjZGVmaW5lIFNVTjUwSV9DT01CT19QSFlfUkVHMl9I
U19TVE9QX0RMWShuKQkoKG4pICYgMHhmZikKPiBAQCAtMTgxLDcgKzE4MSw5IEBAIHN0cnVjdCBz
dW42aV9kcGh5Owo+ICAKPiAgc3RydWN0IHN1bjZpX2RwaHlfdmFyaWFudCB7Cj4gIAl2b2lkCSgq
dHhfcG93ZXJfb24pKHN0cnVjdCBzdW42aV9kcGh5ICpkcGh5KTsKPiArCXZvaWQJKCpsdmRzX3Bv
d2VyX29uKShzdHJ1Y3Qgc3VuNmlfZHBoeSAqZHBoeSk7Cj4gIAlib29sCXJ4X3N1cHBvcnRlZDsK
PiArCWJvb2wJaXNfY29tYm9fZHBoeTsKPiAgfTsKPiAgCj4gIHN0cnVjdCBzdW42aV9kcGh5IHsK
PiBAQCAtMjIyLDYgKzIyNCwxOCBAQCBzdGF0aWMgaW50IHN1bjZpX2RwaHlfY29uZmlndXJlKHN0
cnVjdCBwaHkgKnBoeSwgdW5pb24gcGh5X2NvbmZpZ3VyZV9vcHRzICpvcHRzKQo+ICAJcmV0dXJu
IDA7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgc3VuNmlfZHBoeV9zZXRfbW9kZShzdHJ1Y3QgcGh5
ICpwaHksIGVudW0gcGh5X21vZGUgbW9kZSwgaW50IHN1Ym1vZGUpCj4gK3sKPiArCXN0cnVjdCBz
dW42aV9kcGh5ICpkcGh5ID0gcGh5X2dldF9kcnZkYXRhKHBoeSk7Cj4gKwo+ICsJaWYgKG1vZGUg
PT0gUEhZX01PREVfTFZEUyAmJiAhZHBoeS0+dmFyaWFudC0+aXNfY29tYm9fZHBoeSkgewoKQXQg
dGhpcyBzdGFnZSBtb2RlIHdpbGwgYmUgUEhZX01PREVfSU5WQUxJRCBieSBkZWZhdWx0LiBTbyB0
aGUgY29uc3VtZXIgZmFpbHMgd2l0aCBzZXRfbW9kZSBieQpkZWZhdWx0LgoKSU1PIHNldF9tb2Rl
IHNoYWxsIHNldCAKKyAgICAgICBkcGh5LT5tb2RlID0gbW9kZTsKKyAgICAgICBkcGh5LT5zdWJt
b2RlID0gc3VibW9kZTsKCmluIHRoZSBzdW42aV9kcGh5IGFuZCByZXRhaW4gZm9yIHRoZSBuZXh0
IGNhbGxzIGxpa2UgcG93ZXIgb24uCgo+ICsJCS8qIE5vdCBhIGNvbWJvIEQtUEhZOiBMVkRTIGlz
IG5vdCBzdXBwb3J0ZWQuICovCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICsJcmV0
dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHN1bjZpX2EzMV9taXBpX2RwaHlfdHhfcG93
ZXJfb24oc3RydWN0IHN1bjZpX2RwaHkgKmRwaHkpCj4gIHsKPiAgCXU4IGxhbmVzX21hc2sgPSBH
RU5NQVNLKGRwaHktPmNvbmZpZy5sYW5lcyAtIDEsIDApOwo+IEBAIC0zMjksNiArMzQzLDQzIEBA
IHN0YXRpYyB2b2lkIHN1bjUwaV9hMTAwX21pcGlfZHBoeV90eF9wb3dlcl9vbihzdHJ1Y3Qgc3Vu
NmlfZHBoeSAqZHBoeSkKPiAgCXVkZWxheSgxKTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgc3Vu
NTBpX2ExMDBfbWlwaV9kcGh5X2x2ZHNfcG93ZXJfb24oc3RydWN0IHN1bjZpX2RwaHkgKmRwaHkp
Cj4gK3sKPiArCXJlZ21hcF93cml0ZShkcGh5LT5yZWdzLCBTVU41MElfQ09NQk9fUEhZX1JFRzEs
Cj4gKwkJICAgICBTVU41MElfQ09NQk9fUEhZX1JFRzFfUkVHX1ZSRUYxUDYoNCkgfAo+ICsJCSAg
ICAgU1VONTBJX0NPTUJPX1BIWV9SRUcxX1JFR19WUkVGMFA4KDMpKTsKPiArCj4gKwlyZWdtYXBf
d3JpdGUoZHBoeS0+cmVncywgU1VONTBJX0NPTUJPX1BIWV9SRUcwLAo+ICsJCSAgICAgU1VONTBJ
X0NPTUJPX1BIWV9SRUcwX0VOX0NQKTsKPiArCXVkZWxheSg1KTsKPiArCj4gKwlyZWdtYXBfdXBk
YXRlX2JpdHMoZHBoeS0+cmVncywgU1VONTBJX0NPTUJPX1BIWV9SRUcwLAo+ICsJCQkgICBTVU41
MElfQ09NQk9fUEhZX1JFRzBfRU5fTFZEUywKPiArCQkJICAgU1VONTBJX0NPTUJPX1BIWV9SRUcw
X0VOX0xWRFMpOwo+ICsJdWRlbGF5KDUpOwo+ICsKPiArCXJlZ21hcF91cGRhdGVfYml0cyhkcGh5
LT5yZWdzLCBTVU41MElfQ09NQk9fUEhZX1JFRzAsCj4gKwkJCSAgIFNVTjUwSV9DT01CT19QSFlf
UkVHMF9FTl9DT01CT0xETywKPiArCQkJICAgU1VONTBJX0NPTUJPX1BIWV9SRUcwX0VOX0NPTUJP
TERPKTsKPiArCXVkZWxheSg1KTsKPiArCj4gKwlyZWdtYXBfdXBkYXRlX2JpdHMoZHBoeS0+cmVn
cywgU1VONTBJX0NPTUJPX1BIWV9SRUcwLAo+ICsJCQkgICBTVU41MElfQ09NQk9fUEhZX1JFRzBf
RU5fTUlQSSwKPiArCQkJICAgU1VONTBJX0NPTUJPX1BIWV9SRUcwX0VOX01JUEkpOwo+ICsKPiAr
CXJlZ21hcF93cml0ZShkcGh5LT5yZWdzLCBTVU42SV9EUEhZX0FOQTRfUkVHLAo+ICsJCSAgICAg
U1VONklfRFBIWV9BTkE0X1JFR19FTl9NSVBJIHwKPiArCQkgICAgIFNVTjZJX0RQSFlfQU5BNF9S
RUdfSUIoMikpOwo+ICsKPiArCXJlZ21hcF93cml0ZShkcGh5LT5yZWdzLCBTVU42SV9EUEhZX0FO
QTNfUkVHLAo+ICsJCSAgICAgU1VONklfRFBIWV9BTkEzX0VOX0xET1IgfAo+ICsJCSAgICAgU1VO
NklfRFBIWV9BTkEzX0VOX0xET0QpOwo+ICsKPiArCXJlZ21hcF93cml0ZShkcGh5LT5yZWdzLCBT
VU42SV9EUEhZX0FOQTJfUkVHLCAwKTsKPiArCj4gKwlyZWdtYXBfd3JpdGUoZHBoeS0+cmVncywg
U1VONklfRFBIWV9BTkExX1JFRywgMCk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgc3VuNmlfZHBo
eV90eF9wb3dlcl9vbihzdHJ1Y3Qgc3VuNmlfZHBoeSAqZHBoeSkKPiAgewo+ICAJdTggbGFuZXNf
bWFzayA9IEdFTk1BU0soZHBoeS0+Y29uZmlnLmxhbmVzIC0gMSwgMCk7Cj4gQEAgLTQ5Miw2ICs1
NDMsMTMgQEAgc3RhdGljIGludCBzdW42aV9kcGh5X3Bvd2VyX29uKHN0cnVjdCBwaHkgKnBoeSkK
PiAgewo+ICAJc3RydWN0IHN1bjZpX2RwaHkgKmRwaHkgPSBwaHlfZ2V0X2RydmRhdGEocGh5KTsK
PiAgCj4gKwlpZiAocGh5LT5hdHRycy5tb2RlID09IFBIWV9NT0RFX0xWRFMgJiYgZHBoeS0+dmFy
aWFudC0+aXNfY29tYm9fZHBoeSkgewoKKyAgICAgICBpZiAoZHBoeS0+bW9kZSA9PSBQSFlfTU9E
RV9MVkRTICYmIGRwaHktPnZhcmlhbnQtPmlzX2NvbWJvX2RwaHkpIHsKCmNvbXBhcmVkIGxpa2Ug
dGhpcy4KClRoYW5rcywKUGFydGhpYmFuCgo+ICsJCWlmICghZHBoeS0+dmFyaWFudC0+bHZkc19w
b3dlcl9vbikKPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJZHBoeS0+dmFyaWFudC0+bHZkc19w
b3dlcl9vbihkcGh5KTsKPiArCQlyZXR1cm4gMDsKPiArCX0KPiArCj4gIAlzd2l0Y2ggKGRwaHkt
PmRpcmVjdGlvbikgewo+ICAJY2FzZSBTVU42SV9EUEhZX0RJUkVDVElPTl9UWDoKPiAgCQlyZXR1
cm4gc3VuNmlfZHBoeV90eF9wb3dlcl9vbihkcGh5KTsKPiBAQCAtNTE0LDYgKzU3MiwxMSBAQCBz
dGF0aWMgaW50IHN1bjZpX2RwaHlfcG93ZXJfb2ZmKHN0cnVjdCBwaHkgKnBoeSkKPiAgCXJlZ21h
cF93cml0ZShkcGh5LT5yZWdzLCBTVU42SV9EUEhZX0FOQTNfUkVHLCAwKTsKPiAgCXJlZ21hcF93
cml0ZShkcGh5LT5yZWdzLCBTVU42SV9EUEhZX0FOQTRfUkVHLCAwKTsKPiAgCj4gKwlpZiAocGh5
LT5hdHRycy5tb2RlID09IFBIWV9NT0RFX0xWRFMgJiYgZHBoeS0+dmFyaWFudC0+aXNfY29tYm9f
ZHBoeSkgewo+ICsJCXJlZ21hcF93cml0ZShkcGh5LT5yZWdzLCBTVU41MElfQ09NQk9fUEhZX1JF
RzEsIDApOwo+ICsJCXJlZ21hcF93cml0ZShkcGh5LT5yZWdzLCBTVU41MElfQ09NQk9fUEhZX1JF
RzAsIDApOwo+ICsJfQo+ICsKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IEBAIC01MzMsNiArNTk2
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaHlfb3BzIHN1bjZpX2RwaHlfb3BzID0gewo+ICAJ
LmNvbmZpZ3VyZQk9IHN1bjZpX2RwaHlfY29uZmlndXJlLAo+ICAJLnBvd2VyX29uCT0gc3VuNmlf
ZHBoeV9wb3dlcl9vbiwKPiAgCS5wb3dlcl9vZmYJPSBzdW42aV9kcGh5X3Bvd2VyX29mZiwKPiAr
CS5zZXRfbW9kZQk9IHN1bjZpX2RwaHlfc2V0X21vZGUsCj4gIAkuaW5pdAkJPSBzdW42aV9kcGh5
X2luaXQsCj4gIAkuZXhpdAkJPSBzdW42aV9kcGh5X2V4aXQsCj4gIH07Cj4gQEAgLTYxOSw2ICs2
ODMsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bjZpX2RwaHlfdmFyaWFudCBzdW42aV9hMzFf
bWlwaV9kcGh5X3ZhcmlhbnQgPSB7Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bjZpX2Rw
aHlfdmFyaWFudCBzdW41MGlfYTEwMF9taXBpX2RwaHlfdmFyaWFudCA9IHsKPiAgCS50eF9wb3dl
cl9vbgk9IHN1bjUwaV9hMTAwX21pcGlfZHBoeV90eF9wb3dlcl9vbiwKPiArCS5sdmRzX3Bvd2Vy
X29uCT0gc3VuNTBpX2ExMDBfbWlwaV9kcGh5X2x2ZHNfcG93ZXJfb24sCj4gKwkuaXNfY29tYm9f
ZHBoeQk9IHRydWUsCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBzdW42aV9kcGh5X29mX3RhYmxlW10gPSB7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
