Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBB9E77188
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jan 2025 07:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhf/35GYkjtuxTnw4tWXOMrbiyIY0B5qcRuhHKoII1w=; b=h/fQhMgSO1UHK1
	emKBXq4ZdKrWszTJ2zDOyq+WyzTCB+kNYyNlCsp2FNLUAs6H4BUAwhR1aLWSovTmBNubFA+l8z/iV
	6CKGgKV50vGFTJxeatvsCweYZSvvq0qF20/pVNsgUNTE/rJYv/j2Ukt/TS4S99uttko1rlo3zFkDg
	faacbik3KR4fRqAdbMSVb+4bVX57rkL0MSude8W2RclDxBuw8vf4Gsmp6phdLcHBJ73IZrMw95lCj
	N2KAsRKvjlBAq52ZILcP0YZoUdXMMvd86l7/oCr0WAE05M5gG162wYIukvhKNtWRwiaxffBT6bODO
	C1YJzU+Y2ddMOzYoTtLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsh5-00000002G5j-2f21;
	Sun, 12 Jan 2025 07:47:35 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWsh3-00000002G5C-0hn3
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jan 2025 07:47:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kc/bECGruIf7XZXfRNE+aUORmVR9h3P0OXn/PitTOW/MHGLHXsdWawlLK7GK0oxhWwfQQGi9MhZnyqUFAR+6d7e3XWC9bBWXLzluwXMdA5yYogJT564DwUMkRJEJdV7Td+SPgNCwEYSp9mAX3RV0AuYDqIeuSUs/Fh32vvgZtU39zRp6nocsFBggDYTXF1sXKDSEq47zA9la9t7coXnnf0HLvCt9DZIqDJR6yjEJbJmIPWX8T/ki1BqxcHlwd6vnPsuIYUAHb8Q/VSUs5LLu87xDsueyO8L8Bbrusa4nJopFDjmWKg1i066V1LTWw2PbDZnMGS7/ZTd+910dv5X0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSNRoDW7dpssSVhOCqBUYBcVkOBS4rBkHN6zUvSqpX4=;
 b=xDY1uOpn0ruXvmlhFa5q/XTfYSqlPK9Igzv1e+ITRX+p5PbR94renaNmO+wYOCKyBMe6r7/h+Ez5dJDIpF5Xi5I6N8zt3rdkKQz4wzmvuX8WGxRQRFAM6ZUk/YHG957tPlDpxFZtkA1uoa5E0cuNcge/lOX68qiEowyvZOZv2G7+R/LfnQ3vea0ult0XyQc040ekgkBItNDK2P82gGtYGDAQDGJw29rfjNuCgYsi2KkoAsjMsLy/orJK5bzf8m/XUR0fNl4JlEDRGUQnxp21PfYSHQjbQ9ZJw/o1K2yB3XkRzaDJebzHhdCfPiSuF9YXQeO6na8OJCn6luJIPwQDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSNRoDW7dpssSVhOCqBUYBcVkOBS4rBkHN6zUvSqpX4=;
 b=V8yG6YpdHr0MQswO+r0G8lzrtqW0WJ/Mlh0n3+u4h10LzG00jZ6Rv48ti5Q6+37BHRr7/W0jlhjn6BSfdnTaAnThxXiYtt6yp9w1r+nGy1JQaTQU/2ppNm4EFbWWnQjgqaq4oDZ0qbNMk2Wj2u3MX3tjVrMvdIMnTZM8e00wi+o=
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com (2603:10a6:803:82::16)
 by GVXPR09MB6683.eurprd09.prod.outlook.com (2603:10a6:150:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.16; Sun, 12 Jan
 2025 07:47:24 +0000
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7]) by VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7%3]) with mapi id 15.20.8335.011; Sun, 12 Jan 2025
 07:47:23 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Rob Herring <robh@kernel.org>
CC: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: add
 risc-v,aplic hart indexes
Thread-Topic: [PATCH v4 1/2] dt-bindings: interrupt-controller: add
 risc-v,aplic hart indexes
Thread-Index: AQHbYosGIWPQH4ymlUi1FapWJWhTyLMQMhuAgAKPwOc=
Date: Sun, 12 Jan 2025 07:47:23 +0000
Message-ID: <VI1PR09MB2333E8B63445C266F455B55E941E2@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
 <20250109113814.3254448-2-vladimir.kondratiev@mobileye.com>
 <20250110162043.GA2975507-robh@kernel.org>
In-Reply-To: <20250110162043.GA2975507-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB2333:EE_|GVXPR09MB6683:EE_
x-ms-office365-filtering-correlation-id: bd35dd79-134d-4212-cdea-08dd32dd5a1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVhPK2M4Y2hBZHJ2ODN6Ti9jYzBYNW5BN0dKSzZCOHdrUm9zd2lyUDNJTmhG?=
 =?utf-8?B?SzVDeXV2V0NrZ0RKbWttOExFaS85Q05QOUhJSEJuRktFbXFhbjlOSkQ1Zm5Q?=
 =?utf-8?B?Z3NYbm9XTE1rdXZGRTNxcncxTnIwSGlDUDRSN0NpWVF5SGgvb0MzUUxCQ3Y5?=
 =?utf-8?B?K1lPVUVKeEM3OFpsd2xvaXo5Yk9jTko3ZHRVOVc4c25UaHlhblJQZnhJZVNL?=
 =?utf-8?B?SU9pTG5acmcxQ3dsTE0wQmZTQ3dxZHRsOVJXTnM0OHcrVk1lc1lzdE02UThO?=
 =?utf-8?B?T2p0Vm9PQnZyWmR4cU5uVWFvd1pDb2dnbm1POFlSNGs1OVhBVGREWlVUZmNV?=
 =?utf-8?B?SnNWNTRubkhIREMyQVo2d3BId05nQWhkMDQyKzVMamE1Nkl5ZVExKzRhdjRU?=
 =?utf-8?B?RnZtVC9GMnhab3dWdnBPY3plYTdpWTR2SWw0eTdCaFhUa0hrd1RmRWhaTEVD?=
 =?utf-8?B?a1l3RDdKcVYzNnArZDRYcy9VVjBheFlkbnZNTmwvbDVPK2ZNZG5aTkVqNTVy?=
 =?utf-8?B?cU8yaVRsalUyR1prdy9NNE5QV3VQR1g1VitNTG1WSDVsVlFPakNEWWx1b3NG?=
 =?utf-8?B?a1oxRnl3RWx5ekRMcVRWMEovdHZrWTAvOEZGN0VzZ0RXVnFkZkd3UzUxZ2xx?=
 =?utf-8?B?Z2NSTTBUSTVrSllGWHdORFRaYkQ4cVlpY08xWTZFc3A4OFp4ZzErOGNubkxo?=
 =?utf-8?B?WnVJQWJmMGxvTHY3RVBJMzlZM1JFOS81clg1cU9oRkRYMnlSS0t4dkg2Vks5?=
 =?utf-8?B?ZVZweGlWdWJWSGd5aDc0RlMzUC95SHhRSmxwVDlnMi9IS0NwOTJLeU40bXdM?=
 =?utf-8?B?ZVdTdVJhdks0Zy9yU1lyTDAzeEllV3dscU96ZUtJdnMvQXNZUGVOWW1XbEJx?=
 =?utf-8?B?U2NsdmxsZnR4WmxMN2x2aHYxVHgyRFhUcitsbDRkbFFtMjAvdXhaNXQ2aXQx?=
 =?utf-8?B?SXV4QkF1eXZCZ0xhWjNnaHlNSFlvZFRSQTNRZUFEOGJQajZlL1FzSkdwd1hY?=
 =?utf-8?B?OFZsdENmRjNyQUd6a0xJUHI1T0tNYUN4ZDRmWm5xMzRHZEZ2Vyt5Ly9VaDdJ?=
 =?utf-8?B?cmh5cGxKazBoVHJTN0RZdGw1aXdBNGVtZE1IK3ZIZ0FQMnpXcktyMmFRemJI?=
 =?utf-8?B?RllXUGRVdU12ZjdRYnUrdjVtSTNtY3JRRXVrUDBSKzAvblAzNm5aa2ZGZHFh?=
 =?utf-8?B?Um96RTFCVXlaNk4yZkhDQUVxUXdOMUNqcnd6QUdIemJEUjk4ODZmQmpqSUIz?=
 =?utf-8?B?ZHJkTk1QK3JPV3lQZE1wRXVTams4T2xXSENDQkJ3NllRUEprUzMzbm02NFhQ?=
 =?utf-8?B?VUFtc2hVMzI1WkJKYURXK1FHc1hTVVJxeUtLTWlENWZXTWJtYytnQ0NmeHo1?=
 =?utf-8?B?WEp4Mm56TUN4KzRQS2hleUFZem5hYklrWDNJQUZNNHFPVEYyMFI1NXZIa0Vv?=
 =?utf-8?B?b3F6NVNKSWs4blp2bXZYWC9ac09ML2lsUk9rV2VnSVdQTE15aVNSdWlKQ0kw?=
 =?utf-8?B?WkpQZysrd1VCdkFTS0Y4YnZQTXFYVkNGeVVlaGUxTWlaV2JQeHIzQUhTc2VK?=
 =?utf-8?B?Y1ZFbDFMWnBtOE8vbGFxTExvZnNZU3FRMkUwdjczbnRKeThUUmo1YUlWOHQ2?=
 =?utf-8?B?RW1iZE12V0dBWWlNRkZ5Um5jWWwyRnFQREc3a2szaWhPYWhLa29sMHhFVkRR?=
 =?utf-8?B?RnNKYVNjUFhLSlFobjF3d1BUQXBMZlRBc0g1enBMMk0wMDY1elFXUm4zZDRQ?=
 =?utf-8?B?WUtXVm05RFp2UzJMb2gwS3Zuam9JUGQwbEwydlNabnBmME1JZEdzZUY3cVZ6?=
 =?utf-8?B?cS9UUHlUaHJTZjZweWJTNWREbHBhMDNnb0dkWVV0QjNBTVVDL0FvUkpKSUtG?=
 =?utf-8?Q?kIEGPR7dUBW7T?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB2333.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmdaN01Oa0hBdnNOdFhNd3ZRblBSMmpIbTJZTlR5bVc2NmErWVBUOVdvdk9L?=
 =?utf-8?B?d3R4MWpKMStMVW1qdTd1MW1YOFFvOVpHeGJ4SEwxQk9yRFl2ZFZxSjlPT3hK?=
 =?utf-8?B?eEtwZWhzdTRjamtiRmNEMFFkajFLaGxMcW5nNGZDTGc3WlNjeUYxTzJpbU5F?=
 =?utf-8?B?cHJmNitwNG1NV1B3bG9uQjBTN1FkR1dwK1FnSW9GcFk1WVpWSndLRng2ZktH?=
 =?utf-8?B?dFZhdWdFbHBBYlBBSE8zeTdJWHNvYW9TbkxUTVUzTDcySVNIdXR2M2Y4Z1Vs?=
 =?utf-8?B?dVRsZEFyQVFvTVFXOUROZWZmNldydm9GUnk4S21kMVVXcWpoRWFod0NKdVA5?=
 =?utf-8?B?NkhaT1ZKY0VWb2tpRzg1dURUQ1dqa3RqSlBSY2NnSlJpakhJcjdXR2dVaDMx?=
 =?utf-8?B?YmtieHFVMVV5UjV3Ti9kY0pCcGRCUmRvRVg1UWRkalE2alh1MC9nKzRlMU5X?=
 =?utf-8?B?MktwUVAxUVVPdk13cnhaN0hDY0VXWVRsMFRFOXp0K00wNkVhMmZHSFZDMFNn?=
 =?utf-8?B?VHJqVktONk5vNlNnYVMzTVNlQ2Rsd3VYSkJJc3lwSmRqZmp2eW52QlgzMHVr?=
 =?utf-8?B?ODhNS0lDZlRQWWRuYkRaNFIyaHNoQkp5dkZKNVBRcU9LMWo2d0lKaE5tVHk2?=
 =?utf-8?B?YU9lQ0pib0NlSnBaWWlocDZ5eUtGcjFOZlF2NEJLMGUrU3pqbGhrSHIvckFp?=
 =?utf-8?B?N2w4TzR2RWtTR1ZMOStzRGo1RElwdVBmMUkxdG1BcnBsYzMxM1lvd2NMbFFP?=
 =?utf-8?B?aEVXclc5L0VIS2xqMWY2U01NdzRCbVlrUnBlSkZ0RWZlTEdCNGVXMXNuRlpL?=
 =?utf-8?B?djFKR2U0QTVWejN4a0I4YS9lakV2MzVaajd2bGxvemxDODRZV2pBUXkyZTh1?=
 =?utf-8?B?Wk1sakRRQXdyQWJvUGpMTVdLc2ErWVFPbVFuK2k3N3NLSmhuaXpoRGoveXpa?=
 =?utf-8?B?b3RVK2tjbU12VGU1b244bEI5UHpUeW9FWWxybjJNb1NtbHpkRXpmTkhNNVlN?=
 =?utf-8?B?Y29jdERlbzFyaUM5QW9USE9vdytHdjNZV204d3F3ayt3aGxoUjkydTUxWW8v?=
 =?utf-8?B?MnlSYUFXUDNDdXJtc0NBTGw0eVNkWWpKVGlLdkxiYWMwMkRucFlCanFNOXVE?=
 =?utf-8?B?TWgwN2t4UnZ6dW5qc2crZGlvenlUWDFKaDdUZFVuUVJZLzBKa1JKOGdXZ3V4?=
 =?utf-8?B?WkxxVGJ2aFZHbUNXNmptNjZzcFp2N1hqU1hsK0tvTXMwWGV3aXh3OUUrZHI4?=
 =?utf-8?B?UTZrUzBZVHhXcDlSZ2VpL2ZqRHFZVmxadW5RdHIzMGp5SnAyVk9MRlpxbytu?=
 =?utf-8?B?UEcvc3UzQUErZVFleE8rK3dFeHUyV1U0QXVXMWtod3B3bXFiSU5oSVhkSXJq?=
 =?utf-8?B?OTBuelZLUDJvVUYvVm9YS1dWM3dxRWxrM2dPREsyQmlsVnVVc1VmWmRXdERQ?=
 =?utf-8?B?N01LS1dWaVZmWVlNeDRqTUtjRzNIV1FhQ2VPZ0phTnlRdjNhTHB5czh5L2lQ?=
 =?utf-8?B?Q3pBYkMzRTJHYzczWXBKek1LRzlQTFlIY2tDSFQ4MHpXTGhDdm5TQ2VqUzEy?=
 =?utf-8?B?T0VzTE1qeTJvaFVDY0NSc3l5UDd4aUpOaUUvMEh1SmVES0FOT2hGbGlRWTJS?=
 =?utf-8?B?NHVoSnZ3djYyOWxpdFhGVHR5dmxMdnc5WXZSVE1Sajk0cnhjQUhRcVdGaTQ1?=
 =?utf-8?B?M01rajFaU1FscitRSS8wenlmVnY0dDVZZ0JFaXFpNi85UW14THA0dFYwYStm?=
 =?utf-8?B?S2FOQk1ZT0d5WUFFRXRhY01mSTE0MHJPcitsZlhGSklFSnN1ZDNWSWZLWVNw?=
 =?utf-8?B?TjVnZE43bWlSbTFHRE90SlpkQUgvem83dDQwQ0tMWGtiTWFPeFRtSW05dXRJ?=
 =?utf-8?B?aEVJN1ZyMWl0aXpnZzREa1ZpbjFIN2dMNU9FRW9tVzZxbkpTWjhDdHZ1bE9v?=
 =?utf-8?B?anN1Qk9scDZGdzZPYjFXVTZQUGN0L0w3aVcyM1JWdURzZ1RoWDhoY2R4SFl2?=
 =?utf-8?B?RkZQbC85WXV0b3hYbmZBTFovNUc2Ni9zL3RtNUdRdmgvOGcyK2hldTdSbU4x?=
 =?utf-8?B?ck1ibDRGTlFvK0RMdUdBaEFuam15ZkdKdEgrMm9DM0sxR1RxRWpxTXNvYkow?=
 =?utf-8?Q?gtLhJb+sOzUx/9oyb09gBQFLH?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB2333.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd35dd79-134d-4212-cdea-08dd32dd5a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 07:47:23.7074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7dUaje0Sx6HZWurUXaGd9I/r5HS0oad4OBGDx4963RlKY1dnVQq+KA4r7hXGWBIyi/GGo+KmUOuo2EXiPAACSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR09MB6683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_234733_393901_6162713A 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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

Cj5Xb3VsZG4ndCB1c2luZyB0aGUgJ2NwdXMnIHByb3BlcnR5IGxpbmtpbmcgdG8gZWFjaCBjcHUv
aGFydCBub2RlIHdvcms/Cgo+Um9iCgpIaSwKCnVuZm9ydHVuYXRlbHksIHBlci1DUFUgcHJvcGVy
dHkgd291bGQgbm90IHdvcmsuICJoYXJ0IGluZGV4IiBkZWZpbmVkIHBlcgppbnRlcnJ1cHQgZG9t
YWluLCBhbmQgZGlmZmVyZW50IGNvbnRyb2xsZXJzIG1heSBkZWZpbmUgaXQgZGlmZmVyZW50bHku
ClRoaXMgaXMgZnJvbSB0aGUgIjQuMyBIYXJ0IGluZGV4IG51bWJlcnMiIHNlY3Rpb24gb2YgdGhl
IGludGVycnVwdHMgc3BlYyBmb3VuZCBhdApodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Yt
YWlhCgpXaXRoaW4gYSBnaXZlbiBpbnRlcnJ1cHQgZG9tYWluLCBlYWNoIG9mIHRoZSBkb21haW7i
gJlzIGhhcnRzIGhhcyBhIHVuaXF1ZSBpbmRleApudW1iZXIgaW4gdGhlIHJhbmdlIDAgdG8gMl4x
NCDiiJIgMSAoPSAxNiwzODMpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
