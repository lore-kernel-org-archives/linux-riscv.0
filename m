Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A8D606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GoP82AXy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Gd+ay7SQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WdChZUl+UnraAwXVOv0o9wUdrfeHqEufj7rps+HWWs4=; b=GoP82AXyP4FgnDqdch2DJEU2J9
	XVJ+eylEdPsKVjxFhpfVieCxsG+h79l3YfTxWS/KecXMQkMz2km6ldSNMJMlQ+YCcBzjv25oGWfX1
	Fg7SDx4MI9tD75xtjipPwnk/QPTai2b+Do42AD3Z/4UJFBquS1+oPDccSYE9xgyguARkicGu/1rXl
	5OB8V5AGi2mUcGvYuBTFnCm8xIEfY5JRRNQ/UggjCFwN6N11YGarvhGDgdjVOW/12WBAnTpBmuwFg
	CdSStQDKndwJRJbqVN3d7wBulQsMC85y6XPL5/f7wTY61nT3y8r8krYnc8BJqbWK7OzNe2GAx4nic
	8itXZ12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdyO-0000000E9oH-3fX9;
	Thu, 26 Nov 2026 18:13:32 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdyM-0000000E9nk-3Pnu
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:13:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=li2X4in1jIqrc8r62inD123m9bxpmE6j75wd/Hxa9hZs09MsvzNsWchKbI3jD/d03xoAOlvEcZFc6eQkMiuf2GOVgI0Mw16xqS6/i2ZM1pNsA/SgzngfAvxKXua021J9nQlcHfkUgZUhtu8J8ysmPA2t2vO6YI5PPGo2JLnPbK0CLIxhOkQp0Naw29plGhKAHnR9UQy9p9jCHrQwRsueiTBN5PasWeup/GNLKT8anDUsAm9tKfw/GbAHh9qahWIi9yGkRmn1nBkrriSxzwgDCLM3Lah3NyxbNg31wUusTKhEtuKppPzuCm56Gikxv7lcj1bArJGRdJFYdUJEFTVK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Og/6ItpYLdDb9DptQGR8VpwrI/WymvsAZCm+cfn3KOc=;
 b=rtRPMaHHZNpXc8DcYZB3ve/chz0xvtPhhY+r0wQ51T7R0TVzvD97QQnX4sJE9GN8O4v6XY8n8rJiM0oxLRE3DXsraR9pqxQrLT/zJ9dRW/63BCDKDC3MCSKwSvcTuH+nJNEqbztFjhfzOKYN3s45YGpynNdoGwH3LlVZ+lk+hJXaQCZyQHVKj8oLsfosklRNtFUb+SGkVvuOVGU8i0C8tdO03bPHf3ONE6dLPe3QvUhKsDXDUSUtzX44fwGMn9wWgnirQ2mnDSl6jwW7HpYesNNaLl5Ti5dFsFe8NKhX+bUvYk67VyBL3WZQqACeFNPe+rbTmya3Hh72b3OwfUJMoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og/6ItpYLdDb9DptQGR8VpwrI/WymvsAZCm+cfn3KOc=;
 b=Gd+ay7SQhWF4p3nsWg+7vr6EUXnNCNdet/DcKa/RBrpu9sS3/540jVdjGNXwJgq/srS/f2EamFzRfp5r+X8Qp0TmPCgL3NPPEMhMsQmjKQIz9NixljIiy31CCvFea3jPnDnuQ4s704Kzxxn3MtmZIlbpwrTWuemyRt0SXhTQljg3gGkDtdc7x7CSJIMxUce9a2YGtIRW6gmuS19HowpcH0ku2Yr/28weOO8s2wewu49UPENjiZt2NlsArfhgOualUMb2jN1G0Ng36iYfKGlwXuQ7nI62lYFLP+KMIvqswej8bRr30F4e4SHLECZIxOuWFwgDlLiAqOcfJdklPdXAdg==
Received: from AS8PR04MB7590.eurprd04.prod.outlook.com (2603:10a6:20b:23d::24)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 18:13:24 +0000
Received: from AS8PR04MB7590.eurprd04.prod.outlook.com
 ([fe80::3470:a76d:78f7:317f]) by AS8PR04MB7590.eurprd04.prod.outlook.com
 ([fe80::3470:a76d:78f7:317f%7]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 18:13:23 +0000
From: "Marouene Boubakri (OSS)" <marouene.boubakri@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>, "Marouene Boubakri (OSS)"
	<marouene.boubakri@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas
 Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>, Samuel Holland
	<samuel.holland@sifive.com>, Radu Rendec <radu@rendec.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Thread-Topic: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Thread-Index: AQHdatMP2AQQGuFOIU2hvXLOlFPo97cbK6SAgCWHqWCAABb7gIAAAFQAgAAB9IA=
Date: Thu, 26 Nov 2026 18:13:23 +0000
Message-ID: <AS8PR04MB7590C0DA427CB58BB7EE26A0FC422@AS8PR04MB7590.eurprd04.prod.outlook.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
 <20261102-salsa-cartel-dd4f4b2a9639@spud>
 <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>
 <20261126-sage-subscript-abb9ea294ca2@spud>
 <20261126-resale-roast-ec3dc50ca350@spud>
In-Reply-To: <20261126-resale-roast-ec3dc50ca350@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-11-26T18:11:45.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB7590:EE_|FRWPR04MB11246:EE_
x-ms-office365-filtering-correlation-id: f9150172-d2bd-4d60-75b5-08df4be8f5c3
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|19092799006|261022105027099003|11063799006|4143699003|261028144727099003|10067099003|5023799004|261021121427099003|261102123227099003|56012099006|261026121527099003|261009223027099003|261026140227099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: eeJhdD4Gd/XB4Ug7tl04+yk/7T0VjKZyDLSbJDqzaiSI3MeGaWf6CE9/0pKxkV624rAihvBVcax6lcLoh3Wsf2V1LmMGkbjju4B6nT/9YYTgUSRvZlwlvhg2GC7nCV/Elqp1Lu3zH1rXSIxHbE15tGQpMKAHBKQNSZ8ZT4bY/mQyxrT1te4U57IOTDOOrj9LX3wIWSqBnhlvYXREGVhSUQfRQXBFLoYw2tie6v/lNdXeHsxU/ifReJ7gmXDfHmU0car7ifYqlXgMDLUZbjm7M9I+awslN58upaeAh+AHR+eYDxqxrO2vVKtTOztdJCp6N6pHBq2Z46skcnBtfXud9PE4GzVQXeSA2aVQ3CpgT4GTn93e19aK1lpmC7YtnEhyFBeVTy/KIPX2TswYW/vZSphQjC7fBzuHLZduXHmTUEnB9EILQQ3fV+XtNODg5u1kKg9o81FC8Je9eHH6uaBtQFWw9VT46q7g32gfFWpa14CXMombOmRNUhdtEvw74seEc3rA6MzeOZG68MHTvmf2rFh5fDQag5JAWPJ3iGVWwFkgb4mUhLHQWMOIKqYvZRD2uEWcO6KiiwiIS/4qn1YcNLAWEAD/RBqysxALU3GVAKYwrOn7LqB3xP97hi3Vn5pY4DecJPx9q7m5QPZgm6jrHOlJmAupyupEchTunYcNH3R0l+oqK/xTjBJS59aASOPIy1GIffe9Aewp4GshqRyfn5BO78pGv7WjWMZTAiaqq/k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7590.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(19092799006)(261022105027099003)(11063799006)(4143699003)(261028144727099003)(10067099003)(5023799004)(261021121427099003)(261102123227099003)(56012099006)(261026121527099003)(261009223027099003)(261026140227099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnowcjVOU2wxU3JiZ25mVGFCUFh6S0xrZkRZUkhmZktlWm5ZQTZWandkdklI?=
 =?utf-8?B?NXA2UW4ybGduTHBPbVNxNFM4ZUpnbzVVanY5NDU1d1RZUlNQR3Y4S2JBYnA2?=
 =?utf-8?B?TktqRHRUNmxHNG9hUmxMVG9pZlNsRTVSMDVpYzBTK3krb3JrdE9qRFMyNWxm?=
 =?utf-8?B?b2VwR1V5UnJpaTVLdHgvaGw0QkpPN215dzV0bWQzN1JBT3JWL1dxcmI5Y1hB?=
 =?utf-8?B?OWFCMTdML094OUxYeVE1d3Q4dFc5bGUrWTY1NWFXaVdBS2VZZ0t4VnJ6blFo?=
 =?utf-8?B?eEF1Q3hXU0p2WlJqRXVmd1UrZ0VqNDdxa0wzNEJzbVlaaWhzcGs1OGpQQXhK?=
 =?utf-8?B?ZGcxRHh0UWdGTGxMYzU1L1JhRFkvOFZja2JaWEM4ajd0U0p3cWdqeHBvVyth?=
 =?utf-8?B?RTFOcTNuckZsa1NhS2NOaDdwdmM0OXVZNWNkeTB2Mm1INVJNUW9XN01qdWF4?=
 =?utf-8?B?VG9VamM0MElmNXAzalZUVVFGQkVQKzJGKzlsV3BaTEVSWVNKcWkyVUIwMzB4?=
 =?utf-8?B?SnlRRmMrUkFUMDVwSkJldVFrRFFEWlNocDd4YmlNUXhRdXRnblUzZjJJRTcr?=
 =?utf-8?B?WEtuSmt6cDRtK2NTY1dxUUxhWVBMNDBuMzVmRTRaMVl4QTNBK0tPSHl5cHoz?=
 =?utf-8?B?Uzd0UnVOUERaZFlhQ2htUXF5eVN6MFFTM0RmdWxuNjhnL01zazBLUmt2Ylc2?=
 =?utf-8?B?WkdSdlhMVUtCaHFkWDRtYjlPcGFhem11b3haMlFSM0NRQ1AyQnVuc0I5NCt1?=
 =?utf-8?B?Z3JyMFhtajNoSHhLOXluU2w3UzJzUHRJOWpRbVptOFptVVRtbHZVVDV5QVZZ?=
 =?utf-8?B?ejk4cG14UXlmS1Z1T0paTjN0U1J1K0Rxb3Mva1hjY3d4MERvUDJ2SXBlNjZ1?=
 =?utf-8?B?ZnlaNnVKZFBnL081V2hCZWRXbXR1UlFOb1MxTnNaZFRGcU82SlhTSExTc0Q3?=
 =?utf-8?B?NHJ6dUdzaWU5V1pjZjhaaW5WdTQ5alBjbEhhZ1Vjc1pEcS9WZGJGM3ZSQlc5?=
 =?utf-8?B?UHMraGUvTWEzOXhVcHhsR0V0L3VXeTNHOExQZDN6TUFCWmY4eFRObHJJU2h0?=
 =?utf-8?B?bXYwZEdiTkJZRUNKNFEyeFhxYjRpT3Y4RFcrSkRUVjVCVmlWYit4VVdkdlpW?=
 =?utf-8?B?ZkdLMXhBc1FQWkUwb2tiL1lXaTY0VkFuZ0Jnd3oyNThDSThVNENkVlAwRDlI?=
 =?utf-8?B?S00raXNzWEwvZlpXclhsVVFpK243Wmt0UmNOQmh5bGJOdlZZVGt3THFNRFNu?=
 =?utf-8?B?cDlkeFlmVzFXSkNUaURCSlhNRWtGS25lZS9hdndEb3dZV2JxUXh5ZFJ3eFVP?=
 =?utf-8?B?V1QyanUySmV0VDM5czAxakNjTVhyWWN4T2dZSlgxcG5jWEUvNUF5TmNzclVS?=
 =?utf-8?B?ZnlkSHBrWTJzMmVxY3F6QmR5M0lDNElYc2cvckZOVnNCWDJvUnpvZjJzZlZw?=
 =?utf-8?B?MjE1SnlXQW5Md1BuVGxUVlJhaVZ6Sm5EeG05c2tEN00zUmp3NVI2RnQxUXJi?=
 =?utf-8?B?bGltY0R2OU1COUlmS0xvaWFnaHk2RXZnNXQzcTU2M0hvRWM5TXliR2s4d2V4?=
 =?utf-8?B?QWpwdnJMNmZUd3dZT1l4SW1oRjduNG8xZFBJdnNVblJET0dhTjR1NmVOeHBD?=
 =?utf-8?B?MVh2WjJOa0VlQThrNmtPTitVY0loWnRFY3dPRzVXMUpQNEpXUDlFT2Ixc283?=
 =?utf-8?B?SjRvSXFzQW5GWDQxTW4rc0dueDFORllXZ3Vtb2cySWtlZWs3ZDg3MFdpZG1j?=
 =?utf-8?B?RXVaUFZkYU1MU2dpODRncmJsa0hCWU5ibFFGdmhjUUorVUxtRFIrc0FFcU82?=
 =?utf-8?B?YitXZnF1VGg2Q3RFV2FPR29ma1ZVb3lOUnUwMFNvd0FlT282aDh6ZHF1dDhE?=
 =?utf-8?B?VXUwY1Nzc01SVHE4UGcxUGNieEVsOUZHeElFNW9NNzh6L3h1aWVkRjNEaFFz?=
 =?utf-8?B?L1FhLzZsYkhEN3Z6TkpnczlpV0ZWNmFxTmFmVTAwcW95U2tSZ016WXZVN2hF?=
 =?utf-8?B?WkxFRVZtRExZZUxnU2JXL1owRnhGcm1WWFJ1WkZiZlR0NkphNTBDR2ZDcTFw?=
 =?utf-8?B?UVBQUHp1S1hIYTVLd3oxdXIxcXB4WjJTSnVOaU8xcFRLUXpENGQrNUt0YnNR?=
 =?utf-8?B?VGpRRytVVzF6MnFqK2pyZ0dLdGZkRDFGaU51dEZPZng3RWlJazgrUTR2MkZK?=
 =?utf-8?B?SkNwUXNqcjhqMEpBUzV2UFM0YTJCak8veFZQNjMyMVYzZ3MySG9WU3NKaVVi?=
 =?utf-8?B?YlF6VTQwdEpna2Zha0ZqcElZcU43MVVxSjZYV0ozK3duWU9JODRvZ0o2ZFc1?=
 =?utf-8?B?bHRuVnNZc1BNdkxYSVlVbkl5RDJEOFk1ZS9QSGRmd3R0SEpkQXh3QT09?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7590.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9150172-d2bd-4d60-75b5-08df4be8f5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 18:13:23.7612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzgUkeiurFGALSo3lYCcD5+akOCacWdjPa8O1WBV6Iqlv93maPyg5/9Otd+kn2zBtuhb8vTdaruk0mjtMdHzf2PHb5QHRkr64mHJTMIZ2Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101330_876082_076AC4BC 
X-CRM114-Status: GOOD (  21.63  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


NXP Public
On Thu, Nov 26, 2026 at 06:00:05PM +0000, Conor Dooley wrote:
> On Thu, Nov 26, 2026 at 04:38:56PM +0000, Marouene Boubakri (OSS) wrote:
> > Hi Conor,
> >
> > Thanks for the review, and for the acks on patches 1 to 4.
> >
> >
> > NXP Confidential
> > On Mon, Nov 02, 2026 at 07:30:41PM +0000, Conor Dooley wrote:
> > > > +RISC-V OPENHW GROUP SoC SUPPORT
> > > > +M: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> > > > +L: linux-riscv@lists.infradead.org
> > > > +S: Maintained
> > > > +F: Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> > > > +F: arch/riscv/boot/dts/openhwgroup/
> > >
> > > There's no git tree here, are you expecting me to apply the
> > > patches for your platform?
> >
> > Yes, if that is okay with you. I don't have a tree for this: the
> > platform is small and I expect very few patches. I will review and
> > test whatever comes in for it. I can add your tree as T: in this
> > entry, or list the directory under RISC-V MISC SOC SUPPORT instead, whichever you prefer.
> > If the platform grows I am happy to set up a tree and send you pull
> > requests instead.
>
> Sure, I suppose I can. Keep this entry and add the dts dir to my misc
> entry.


> I see you've already send v2. I can always deal with the MAINTAINERS stuff on application if v2 is okay.

Thanks, that works for me. If a v3 is needed I will fold the MAINTAINERS change in.

Please ignore the "NXP Confidential" line in my replies. My email client added it, nothing in this thread is confidential.

Thanks,
Maro
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
