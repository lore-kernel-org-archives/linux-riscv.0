Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED86CA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=933ttBJorqEemrQHOO/e/0sSPDnO45IHiA8O5wOX0rY=; b=lJADmq85Fdop2n
	roI+XKnHjQoz/MXdCKlxd8aJxCjZ6kfU1SAYUyXFXPUKbkP1UvTdjFGIJsTYGRs/34DPDGE47h8TS
	i+43Lfhl0OSOvlt4bhRJi2K33zQ6jaWQLXhYvZO7rE1tT2GQv0W3h01eTOvNVLOxLPUk7rPSq3kUw
	tMKqDO8vAN2PKGVjhCnKLQePqBtWz6V0j2jsVRZysebB+Sx64ReARLNdPRkr9Nljkejm/Pqx3HAZP
	KvrUg5Vlnke/CQRTdvyunEBGapWtooKKzYKgNQkQAj5ja9yXMDLp0XMJQT6xsIvkS98bK5vFO7zsl
	nbeHoGP695u5p85rAHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBu1S-000000065fR-1DbP;
	Wed, 30 Sep 2026 13:06:58 +0000
Received: from mail-westcentralusazon11013062.outbound.protection.outlook.com ([40.93.201.62] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBu1Q-000000065eJ-00aZ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 13:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nS4fm1J0AP11QCPK1Yjb4z/iQZ7UM5im1W1A8Gt7YMNoxgNZAg816npDVItbG+N3l4LKPB/OIxlFF4KvGbF1MgVM2aaK/zaK8j84IkDsmoJtdux0024ACm85Fn90o+yUAV8M5iMspFGxsEyd2o8lb0YTcp0LbGYlvqPf2+ye/Kudk/gd0FZH4i2xQfTNkooxqdQonbTBEs4mAmG9ib3hGinuEllkJrmxKLyc9LmDJUV3RJbN347C2VU+6m5ZGfQZ/NPvz3rlniAiDkkXLmH5WQMe2rlUl1s1Hb3ULXx0xeQ2tsu+VLeAJDOiYgeFlrcsqnCXO1fd+6D3SPUgCMlOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvN9lJ0jKZWnk+bin6XuuPVM3F8CjXCjmxPmyOEMku8=;
 b=HVVLOTh0v34gFeLUvMP4dX1j5jIgxG5JQXzODw+8Gtfr502YgnUR07n45zhzWT0aEL+BpgVa5R9fEH1qcS+9pwSyHyERqmDxdsoqWonpjd8KZUEgYRn/XtbWEfHuOxTjANqXtZpoU2I3+aOQZ0IjhCX5poNaDLNnhWRW25Go6eVqbHbIlf20RaqFeZnHBCHKs2F+Tkmmh5KxKorrSXjmSGD3W7Q+t9KGwL2Dyb+E/+voKQZ7xv3OQajCs8INuvyowM2I6LWdjUwKejA1Y6548Ohg3QF3etJ0rfa4yavZHqVhodtW0DKsVz4mfs9ac/HCc1I0Ms9L3Lb0imi9bkr6Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvN9lJ0jKZWnk+bin6XuuPVM3F8CjXCjmxPmyOEMku8=;
 b=VSLz8i9ovhd2T5cLQCrc0qSONtYxqfhJaLXO0pwr8zis0hc5GA/MFC5RsS7RCBunBR4C2xW+M1PqHgx22FqY/xOrb6p/JHX/BQdaO4AoZgMq5dCrulwlb8rwDiU880gr7i/9HxWcSavzGafJqX+UN6eL9GiT5/A8/p6PDe7l778=
Received: from BY5PR04MB7025.namprd04.prod.outlook.com (2603:10b6:a03:22f::17)
 by MN2PR04MB6926.namprd04.prod.outlook.com (2603:10b6:208:1e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 13:06:48 +0000
Received: from BY5PR04MB7025.namprd04.prod.outlook.com
 ([fe80::97f1:60bb:2ae8:6f01]) by BY5PR04MB7025.namprd04.prod.outlook.com
 ([fe80::97f1:60bb:2ae8:6f01%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 13:06:46 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Yulin Lu <luyulin@eswincomputing.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Pritesh Patel
	<pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti
	<andi.shyti@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Min Lin
	<linmin@eswincomputing.com>
Subject: Re: [PATCH v4 6/7] riscv: dts: eswin: add I2C controller support
Thread-Topic: [PATCH v4 6/7] riscv: dts: eswin: add I2C controller support
Thread-Index: AQHdUNyMNOO4QQT2+UGfT/qoqAORjA==
Date: Wed, 30 Sep 2026 13:06:46 +0000
Message-ID: <BY5PR04MB70253B3321460DCF7ADB54DF838B2@BY5PR04MB7025.namprd04.prod.outlook.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-7-pinkesh.vaghela@einfochips.com>
 <a55c26e3-1bf0-4ba1-b8b9-14ad76a44a14@sifive.com>
In-Reply-To: <a55c26e3-1bf0-4ba1-b8b9-14ad76a44a14@sifive.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=76548b96-2cef-412a-9c44-4e9e26db14aa;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2026-09-30T12:58:33Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB7025:EE_|MN2PR04MB6926:EE_
x-ms-office365-filtering-correlation-id: d602bee0-e883-438e-0aa4-08df1ef3ae9d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|55112099003|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: rR11SzoVtqaQn4cQSl07Wh5ZxZWzU6r8p5VrBWRjF0Uc8Q2NKrZuA99ZTxx7IVioxwOXE26+5oZ0XjadqtcRWSV0SK521lu10/zH5tS3/3tRUNk1n1R6NzHqTqBq8m7xw8qXacfgtVirqv9N+9J+tfh1njGUsJSvtzSV7d8QKteaOQXRgpDY2fEucn8sHmpxVkdajIhA2njfaD/NVRA4tSSdRAO0xLZQykil5hUj9KHX3tQJAgh+NIbh2WN/CmjNpjJgC+hg1kxU+J8x1Z+g67fdUxR/pLAgWb5tFUqcaZ99rE9FvNV3+7bcWDFn5xT95KjV5KkWBiP1EEtRN1l0xjJp/bM3H2WpnM7hqlWi8uiXXNGXLnpz59ANW1atEkXaFohqY9XONrSjUB5ig0bDI9dlwM6v0DR466jDlmfAJmgjQ33dDkHD5iixZ4Mgp+CN0flMdY7EGQYnQrnb+3/gbN5sZhJLHmr8S0++fdqyILycw7e+mBADfRxPolV2i2bOBKpAP9V2e1majHzOegSoqephq310aYnMJJopjJ3zuPrp8yfGuDXavD8j7MC+BoGWdLumEUQm333IJJH8HxRaEfvH1zNyL7Y8990+gJ06wXLAvJqWQXwD35s0KBJbtKBW/nd8Ew7hAPVvSmTrvTb/91NbYnHgf2C7taaC5M3rvWoy+yIUIclvozs0WXjKvcGNo5XOotI78qmT7yYiI8wj58XnGkIEWm/dFpNTo6DR3XI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB7025.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(55112099003)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWxWbFVVWnE4cGdmSWY5S1dDMCtIUlVDUFNVRFRPa1V5d0Vmc0dWNnhFeWVU?=
 =?utf-8?B?alFvL051V1VHMFN2MCtROW9jNkpzVk9mOWUxeW1BNWhKekRyR0pEbnI0Qm8v?=
 =?utf-8?B?ODh1QWRjNkZ3K2ptcnRCT3JMcmlDeE9uZVI5VmZuOTh4bGphbENxRHU0S0w1?=
 =?utf-8?B?QllFT3JNbGtIekNTdEtESU5VdEdjcDBXeU9WdzFyaUR5S2c0MjhrZWZ6ang5?=
 =?utf-8?B?SlBPditRbWZpS0hyV245Y2Y5UGxCdzRzbHd0UkY4Q2VMZzdQWE1ObjRnVURt?=
 =?utf-8?B?TmR5cmMvRllFRzJjeGlabkpieWt4RVBJa1BjdFRzanZza1J3dWZjZmVGVWVi?=
 =?utf-8?B?ZE12NkZncmZzTmZjcjJFaVFUTVZiRmtTV3B4K0RNM3FIY3JYd3F5TmR5SFc3?=
 =?utf-8?B?WjRUeFlWY2NobVViUktCNFhOdXVrZCtVK0RPQXR6ZmNlSFhVTFJuSnRsR2Zv?=
 =?utf-8?B?ZFVEcFBYdXZOTkJadHg0MkV2TkxWVE94cUErR3NjRkJib1Vud2xIZXA5QW1M?=
 =?utf-8?B?VmtPckRhZlRmT1d3czVTV1dBL2ZOMkt1MlMwUmNrV2FrZHRld3ZUSUFHbUtl?=
 =?utf-8?B?djdUckFoN3RIUFBQMHpMSkRwZ0wwcTMyL2JUSmI4WFJJQ0RhT2FNZUZwejUv?=
 =?utf-8?B?elRsbEJhSkI0eHlaWlZibXhYclI3azYxWWw1eFdQS3BSZG5wbjdzWG1ibHAr?=
 =?utf-8?B?OXd2WWZLNU9EcW93UWx1ZFR3ZVREeU1DcjVHL2p4OFQrV0lXNGtUYTd2dSt4?=
 =?utf-8?B?RzluajFvanRXZDhMemtIUTY3WjNvdVI1d2diaWdjNS9veW1kN0lvSWoxalJF?=
 =?utf-8?B?eDd2RHR1bEFVMW5jd2hXeTlHaVZJRi8rOWl0T0JtY0U1WTY0cFYrS0xJV0hl?=
 =?utf-8?B?OW14cDhXdmZaVithb3JSajdsUzd2Q1pCLzZWZ1p4d2s4QlVPRUZkSTlRZ2Uv?=
 =?utf-8?B?cnVyY3lSb0FKY3BYUVBLSm1JalZ0WEhYSW1kM3MzWDlFS3F6bzRYR2hCTCtM?=
 =?utf-8?B?SGoyM2lHY21Ca1c5dG1MbkVycjllZ2hQQ2hqYlB6MUhUdEI3OUEyaTZvcHFx?=
 =?utf-8?B?aVc5V0sxbml2MTZtWThvYUxTNnJwOWxMNVZvMnZwNWhYSm1WVldWZ3NLWTR3?=
 =?utf-8?B?d2ZNZzlqSUFDbGY1Q2s2S1Z0a2tQbTZuQXNRTVVNMW8zQmtFT2JnVjhxdEJv?=
 =?utf-8?B?VGlxMDBpVzRjRUNNYWhrSk1LNzlzb042Rk02OFNCNHVTUDF0ZG9RTlQwYnN2?=
 =?utf-8?B?K2FNZzRUSXI1aW1JVzZzK2hRNzRWNXQ0MHBpaWo4TXRCVzM4M1pmTXp3V2hE?=
 =?utf-8?B?VTNac1FPaFY0YThGbThqNmhtN0RsTEJVa0pmeUdsdG1seFZaQW5paUd0eXRq?=
 =?utf-8?B?cmhjeDBjYXZ1YlVKNVF0NisxNXpKbTVNTmQ0U1dObU55VStLelF4NTRkYVZP?=
 =?utf-8?B?WG0yQmZ0aEZwREZqZGoycWhEdXdjbXFMSjFZNmx2eG9qRU4yOThFUXkzaEJF?=
 =?utf-8?B?RnZkNFNKeHowUUZtTUZlOWJSNm5zcEVxY29tYnpwMXJaYXlsZk9UWlppVUpD?=
 =?utf-8?B?dGw2RnB2Q3BFMTlZdFlXNm1mb3NYd294akxhMGVPNVNGdmFOQUVRenNnaTJt?=
 =?utf-8?B?cXdmWDgvcFErMHVpWUNjejMwR2d3R1lQdHI4QVI4em9VYkZ1RFlWNEwzNTNS?=
 =?utf-8?B?dmlkNjRreHpxZUJWQ3dSaCtNMkV5UzQ1Y1ljVFpoSWJEbTFlNjB3ZE5HMzJT?=
 =?utf-8?B?TEtDS25pbkhCeDZiNmNEN214RDl6UktMOHU0a0k2V1FndFJNZ0t1ZUxHWFhr?=
 =?utf-8?B?STlSY2lBTzJhOW1kNVdxY0RCdXRML3h2K1A2VzVBcXBJdEV2OWI5RDhwazJE?=
 =?utf-8?B?Wlk5dFozTW9EaEsyV3A1Zkh0ZWZEK0NldFZveTNUcW9Da1paQzEvd05qem1Q?=
 =?utf-8?B?UUtnWGpFQWcrYzFQN3dNczV5bE9qcXhzVktzcTNmYWdVUUcvNU5Da1QyTUln?=
 =?utf-8?B?MnBWZ3ByOUFhdkMxS3UrVkVHbDRrSEdkSzUvT3hqWGRsUHVRMk84RlNIdHVJ?=
 =?utf-8?B?K0dJVFhZR0REVEpwNXp3QWhXVWZJaEVEQnBzbG1EUHcySGNtejNRdTJIUk5F?=
 =?utf-8?B?TE0yRlEwMkZsWTJyaVRuZG9LcS9mNjBqZHFkNHpFbmZaYTRLSHVpZ1ZYY0J4?=
 =?utf-8?B?V3B2T21tOVN4TGxYZ2tqT2VaUzBSb2Q2UWVJZmFUcjBCckJvcTN3V1NxMzEz?=
 =?utf-8?B?VEhjRWp5UWs1MVQvSjY2dmFFM3F5dTJVajRSVVNvNUVNbFFhMUpCRjlrd1VH?=
 =?utf-8?B?OXYzZjhGZVMxTEp0bDk0TnV4aXh1eTFwNEs5dVRSZlNiODdvMmJnSm1kM2hs?=
 =?utf-8?Q?pY51UuFJa9zBIC5c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB7025.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d602bee0-e883-438e-0aa4-08df1ef3ae9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 13:06:46.5100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2kx+DtKH9i3UpQq+Mp3H7d1+B4SPgUtIMrSbRIdkbFtkNjH4LFvRmDWlkBFjEQ7aMq1EcAX9DKeIvogCZcG5t2/IuwFe6mF0+Qt5D8ORVBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_060656_114470_9D2984C2 
X-CRM114-Status: GOOD (  16.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Samuel,

> -----Original Message-----
> From: Samuel Holland <samuel.holland@sifive.com>
> Sent: Tuesday, September 29, 2026 6:40 PM
> To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Cc: Yulin Lu <luyulin@eswincomputing.com>; Darshan Prajapati
> <darshan.prajapati@einfochips.com>; Pritesh Patel
> <pritesh.patel@einfochips.com>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Paul
> Walmsley <pjw@kernel.org>; Palmer Dabbelt <palmer@dabbelt.com>; Albert
> Ou <aou@eecs.berkeley.edu>; Alexandre Ghiti <alex@ghiti.fr>; Andi Shyti
> <andi.shyti@kernel.org>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; linux-i2c@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> riscv@lists.infradead.org; Min Lin <linmin@eswincomputing.com>
> Subject: [External] Re: [PATCH v4 6/7] riscv: dts: eswin: add I2C controller
> support
> 
> Hi Pinkesh,
> 
> On 2026-08-14 2:00 AM, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >
> > Add I2C nodes for EIC7700 SoC.
> > Also add nodes for corresponding slave devices in dts file and enable
> > them for HiFive Premier P550 board
> >
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  .../dts/eswin/eic7700-hifive-premier-p550.dts |  56 +++++++
> >  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 156 ++++++++++++++++++
> >  2 files changed, 212 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > index 3101fd90d171..5dddcf13fd25 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> > @@ -130,6 +130,62 @@ &gpio111_pins {
> >       input-disable;
> >  };
> >
> > +&aon_i2c0 {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&i2c10_pins>;
> > +
> > +     eeprom@50 {
> > +             compatible = "atmel,24c02";
> > +             reg = <0x50>;
> > +     };
> > +};
> > +
> > +&aon_i2c1 {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&i2c11_pins>;
> > +
> > +     adc@10 {
> > +             compatible = "microchip,pac1934";
> > +             reg = <0x10>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             channel@1 {
> > +                     reg = <0x1>;
> > +                     shunt-resistor-micro-ohms = <1000>;
> > +                     label = "VDD_SOM";
> > +             };
> > +
> > +             channel@2 {
> > +                     reg = <0x2>;
> > +                     shunt-resistor-micro-ohms = <1000>;
> > +                     label = "VDD_SOC";
> > +             };
> > +
> > +             channel@3 {
> > +                     reg = <0x3>;
> > +                     shunt-resistor-micro-ohms = <1000>;
> > +                     label = "VDD_CPU";
> > +             };
> > +
> > +             channel@4 {
> > +                     reg = <0x4>;
> > +                     shunt-resistor-micro-ohms = <1000>;
> > +                     label = "VDD_LPDDR";
> > +             };
> > +     };
> > +
> > +     power-sensor@44 {
> > +             compatible = "ti,ina226";
> > +             reg = <0x44>;
> > +             #io-channel-cells = <1>;
> > +             label = "sys_power";
> > +             shunt-resistor = <1000>;
> > +     };
> > +};
> > +
> >  &pinctrl {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&gpio0_pins>, <&gpio5_pins>, <&gpio11_pins>, diff
> > --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > index 771a88645d83..c13432d14504 100644
> > --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -315,6 +315,162 @@ uart4: serial@50940000 {
> >                       status = "disabled";
> >               };
> >
> > +             i2c0: i2c@50950000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x50950000 0x0 0x8000>;
> > +                     interrupts = <105>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C0_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C0>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> 
> Each controller that has only one possible pinmux should reference the
> corresponding pinctrl nodes, so it doesn't have to be duplicated in every
> board DTS.

We will update this in next version.

> 
> > +             };
> > +
> > +             i2c1: i2c@50960000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x50960000 0x0 0x8000>;
> > +                     interrupts = <106>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C1_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C1>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             i2c2: i2c@50970000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x50970000 0x0 0x8000>;
> > +                     interrupts = <107>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C2_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C2>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             i2c3: i2c@50980000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x50980000 0x0 0x8000>;
> > +                     interrupts = <108>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C3_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C3>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             i2c4: i2c@50990000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x50990000 0x0 0x8000>;
> > +                     interrupts = <109>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C4_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C4>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             i2c5: i2c@509a0000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x509a0000 0x0 0x8000>;
> > +                     interrupts = <110>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C5_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C5>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             i2c6: i2c@509b0000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x509b0000 0x0 0x8000>;
> > +                     interrupts = <111>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C6_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C6>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             i2c7: i2c@509c0000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x509c0000 0x0 0x8000>;
> > +                     interrupts = <112>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C7_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C7>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             i2c8: i2c@509d0000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x509d0000 0x0 0x8000>;
> > +                     interrupts = <113>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C8_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C8>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             i2c9: i2c@509e0000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x509e0000 0x0 0x8000>;
> > +                     interrupts = <114>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_LSP_I2C9_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_I2C9>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             aon_i2c0: i2c@51830000 {
> 
> Please keep nodes sorted (the aon block controllers go below GPIO, etc.).

As per DTS coding style document [1], "Order of Nodes" states that
"Nodes on any bus, thus using unit addresses for children, shall be ordered by unit
address in ascending order. Alternatively for some subarchitectures, nodes of the 
same type can be grouped together, e.g. all I2C controllers one after another even
if this breaks unit address ordering."

Do you still prefer to change order?

[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Regards,
Pinkesh

> 
> Regards,
> Samuel
> 
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x51830000 0x0 0x8000>;
> > +                     interrupts = <290>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_AON_I2C0_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_ANO0>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             aon_i2c1: i2c@51838000 {
> > +                     compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> > +                     reg = <0x0 0x51838000 0x0 0x8000>;
> > +                     interrupts = <291>;
> > +                     clocks = <&clk EIC7700_CLK_GATE_AON_I2C1_PCLK>;
> > +                     clock-names = "ref";
> > +                     clock-frequency = <100000>;
> > +                     resets = <&reset EIC7700_RESET_ANO1>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> >               gpio@51600000 {
> >                       compatible = "snps,dw-apb-gpio";
> >                       reg = <0x0 0x51600000 0x0 0x80>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
