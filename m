Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A85C79FAA
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3N5dM+IJ3En+nRBiTAyPPCNar5IpRJ+BNl7X7V8QKY4=; b=Z5GR05/lVEB3ky
	Gk+WuwCcQPNR/00by2s4+qght/Qd71jfIAOPIYzh7aQeIi7ZTqVgtu5pYtdyyZr917uRcXETza/v0
	PoDc+f4cSKu8k6Ru6fohlFGvRnvOZ0j3i79tsBs2OVRftbeC53Onxf4wRYSn4mZvFrlA9U14B6SjR
	vftqQChd88Sl6DVRBzgzHwh6jOCR3XNqH5ykPCdgT5KKFCF8cpx1q8M2cq6BrbE7wND/nJmm7b0fr
	0fJp2upcjtLYoye9LT0/W8alFGFlnobcxC/Z6yDL1pADEoOvgupoEr5dgB0slzigUc96SYBVf1ekN
	TWd6Vk7ID4QLCfqAt5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CAr-0000000Avgv-0XnC;
	Wed, 09 Sep 2026 06:52:49 +0000
Received: from mail-bjschn02on2071b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4CAn-0000000AvgI-0f4w
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 06:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxz26fLuuY+RQFx1oJsQQu6B8wtoLY46VDjBznZktyI+ASom8P5SXxGeB+0XSn6un4xhlJXe02y9l/Ha5SbsStRq8SWWcsY9UWGC/ajU9pGHZTV8ePOQHzQRoJs5CUCuCWE9E7BV8EuJJxzVQ+1tHiu+TLPNsv79D5f4Ej6mQXpz9Zag84ToeQTYDJGLnHeIIfCiXNu09sZNvUZAdfqBqOfzJP+AJRo+k6uNmMyXzybkPApvG1dFMzZVS3GhprAv18Pq8mi4wcJQTubWK0wHI1gVPR2JMLcCNzcBStX/z7bvcuJjWsJqsu9VULTK2kTG+laugZGNTnYzAQ1ozP5iSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH3tnC1x8QVRnqZUzBW+dfu+TqsW/CuW6tcUfPCyCBg=;
 b=RZTxBL3vExyBjBrat5ffIBMFn/BQkU5Fhk2//VVJf//CFDXChEbUOUa47nxTP/TNqvwaG6gjw7rWbt33okMGaRD/E4gz84SZjqpb/bZxR3AobxA40SUvyEhXT+5h0/bFNc9waSUk5lU6SRBx8/zLqI9NpVu20qlap2kjzrHFV4dbW6/Et1BAsWNuF0w/X93eMsw4TTW0f2WvTyh5hWStX1tGeDJ2Ow3Nlsm5yv/DAkFsD1DlKqXygQXc2q1vkhWDfGDYPVLDUwEcDEx/otcfgj5HCj4fpyK9nszBrAT0J4gC6n5p5D4MwJm7dkzOtrOeOarkb5lLx5kJbV4L/wwHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Wed, 9 Sep
 2026 06:52:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Wed, 9 Sep 2026 06:52:06 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHdN2ImqvaIx8mSbUaeHyzzD+v1QLa0qs+AgAEkaZCAAHWtgIAAA1cAgAABZ4CAAAK9MIAPhrWAgAANmpA=
Date: Wed, 9 Sep 2026 06:52:06 +0000
Message-ID: <ZQ4PR01MB1202D6E0502B941B170D1C56F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
 <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
 <ZQ4PR01MB1202123864865439817E1549F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <95b7ad43-9c68-4830-a35c-7cb29ca9b75f@kernel.org>
In-Reply-To: <95b7ad43-9c68-4830-a35c-7cb29ca9b75f@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
x-ms-office365-filtering-correlation-id: c48e9432-93bb-4cd8-cd0c-08df0e3edcfa
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|56012099006|4143699003|38070700021|10067099003|921020|18002099003|22082099003;
x-microsoft-antispam-message-info: xz6TClkQJXOz2rEAF9sHlS03udZ9f6U0O8STOng6HPTihzC1rfCkHD2n8Zx4axbehxFhNx0SXUVgPvxS1Uaqz9k9FL4zBMnGrxdQ0MWe2BKPoxW4rIQVFieGphJHifU7Kir851F0USN028QayiRPRzTRbSIBDcx/Y0YEUh3zc0zX0/cZy3prLNrcEWvIKxjV+CQbrVTJ7FwiJOURRpWXPM07BXtIUo8u3tG0KwU0X0oClkGAFYfpdIXaqD6yb/UQCXpZTaG7vEnmNgvtV1DnPo2/bNZIM5DbYoQwvq9KEB4tvacsGlG3i/8xK4NF4vxO3z2urHSidrLzGZNJoxdiBPQ5Qcib/7Jz8ShdZ2K/jN25GltmIfWxC5+r326KzXfPag10QEFMq7/16ZTE0SLZuTcffAxBGe/nrxDQqpheYMB6s+dWQCA9s9qnMAA63mkcm0X5Ox+0xoZQsvO5cyr2hwQ4MOIBhm66Wk1dNkI66ESGgIqTMBy5h7Lo+4vTm2MBMDwjTQQxMvSZlsg1HQZ88NhyteCf0fA7J71ifB71Fs5oVBb+pv4R9RqlhrZoqTWAdTyyeeUAW/+Cm6dHo5MQ3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(38070700021)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akhYcUd5ZHBaS2JjaUNRQy9NVEtjSkQ5TzFOT09VRk9VRXdmWlZlbmlEeXF6?=
 =?utf-8?B?bGY4WWVsYUVVQ0xFaFhwSmxFNWxjdzcxMk14S2k3TWlBNUhZUTZLdmZJMy94?=
 =?utf-8?B?dWFESXVyZWtZaWpEUGNEbGNNekhPWTdEVkpmWlMyYWROdmFUNjNiRnBHS1Nk?=
 =?utf-8?B?TFpNZ3A1OWp4cG5pZENxZk9VVEJtTW94L1JTbDdMWWJwdW0wWHNvcTZlY2tY?=
 =?utf-8?B?VFFuZkJyem5IRmV4SWM4Y3p2RU1BUExyYnBLRUxTZ0h3NUxjdTJqZmJzZnRZ?=
 =?utf-8?B?aEVSdFpBV3h1TGpHTFEvdndOWFNKMkFPVE1mbk1mbmFsZ0QyZEF4VDd6aXlI?=
 =?utf-8?B?MVFHMEFjOVUzK0Q1TDY5YXN2U0ZvTSswbUJCcEQ1cUxKVUVpb0lDZCtZQ0Fl?=
 =?utf-8?B?Wmp0L3I2aDRVc0ZaL3lwUngyL0dVVHQxYUtGMHJFWm1CN2xibnpyclIzcVJm?=
 =?utf-8?B?bmUrT1NYdzJicGxCN0NVV1ZXNTFZQzJzTnBRUWRvVGtPU0JKTUVGUjdCeGdJ?=
 =?utf-8?B?RWZhRHQ1N2dLdjBBUTNHenpZQzFXdlQrTUFtaW82VUR2MWlxT1hwbWZyaFV3?=
 =?utf-8?B?c2o2NTNEZktabEx5dVB4VHdrVEt0dDFJclozNWN2OVgyZ205MjJjVS9Wa0l4?=
 =?utf-8?B?dGR2aFJQMUN3YyszWXRxU1YydEhwanVBWUpUTldUalh1TFEyZU9ZK0JyRkZL?=
 =?utf-8?B?MW5nVVE1Z2hBNTJEWEJBYXJITTV3ZExkUys0QnEwWS9jUlhBT1BCdjJET2o2?=
 =?utf-8?B?U2VNaTUyRnZkbjhLSmx4SlZtNDdIQ04vQzhaWEYxRVV4Zi9RYUF3SEFndFJH?=
 =?utf-8?B?cUMybjdyem9TS1lhUDVHWnZ0cEk4QjVNRGFRejRiRjFnaVUwcUVkeGRJZ2s2?=
 =?utf-8?B?RU1hMi9mUWt1U3ptRCtaOTZ4NGpjZDRCcFh5ZXJ0Y1NFWEZLZ3U3Y2tkelhy?=
 =?utf-8?B?OTZPa1RCa3crNVVTek55Q3BXbFJTQVFjQTVxenVLd3FoenJUOHBhdnJwUFJM?=
 =?utf-8?B?azBVa2hKNlh5WVE3a2ovV3ROUkE2ZkluZWhxazc4cWJxUS9TV2c0dkVQWjkz?=
 =?utf-8?B?Y2VzeTlMUzRUb2dWazk4KzRqRUN2cmVXL0YzM1ZoY0xidEdzK1hJeThsek5o?=
 =?utf-8?B?cE5kM3NpeS9KcUF2Sm1LcStIU2tOZ2o0WnF2anl0aENYY0hBZStlR2hWMEov?=
 =?utf-8?B?QnN6RXZmZTY4Q2ljbjRTTmtlWlBEZEs1WWJPSlp3NWdLNFpycjVITXhKZkdT?=
 =?utf-8?B?TVl5Z3FPWHNXVm5GS0hiSU5vSk1hSVp5Y0pUekZUL3UrekY3eHhENng0anBL?=
 =?utf-8?B?TEFBQlY2K3I5empWZ1ZqcTVDYm5BMjNvQUFHd3VDcnFHZldpanpWZUVkU3Q2?=
 =?utf-8?B?MVFCcTA3VFI1RXBwalVuUFB6elAyc0R5bVZMYkJ6OStrZXJVNm95eDlEVi9W?=
 =?utf-8?B?YWFYQXc1UlY0enl0aGRLNDBzU0R4LzllZ2trK2RwUXp3TWlIQWhIM3JHSkkx?=
 =?utf-8?B?WTdIU1ZDa2t5T1M3WnM0RFdiUTFaeTRxMFl0Q3BBWFZENFFMODdXbjU3VDRx?=
 =?utf-8?B?NGJIcXBMMnhsYTNESllKK1c0eTdGajFnMHIrYmYyVjN0WGRjK3YwSHhXaHZS?=
 =?utf-8?B?ZnRlbno3SEZ4UFRWZEhldTgwSzVHOTZudDY5c2psdEl2VVhjelNHUS9NY0Ri?=
 =?utf-8?B?Rmx4d2VPWFZCNHh2UFpQdHZlZ0JBVzF4VnM2RERyL29HaG05V3ZURUMwSlNB?=
 =?utf-8?B?MXAyOW44eFlnTTZZMHphb1lzR3dMaDZleHRRVnRnQmg1d1c1MXdqR3R5VkJR?=
 =?utf-8?B?Ykl0WG91RWFMdWp4N2w0TE9ub0lDUVloZkNsYmR0bXcrQ1djSjF3Ly9RY2Nq?=
 =?utf-8?B?MGVXN1Bnc2tWRjdzUlo3QlM0U0MyN3ZaSnI1a1QyMi9Wb2RTRmt6T2h6K21h?=
 =?utf-8?B?SjdvNTJvSkw0M2ZNT0Y5cXN3dlA2N1dUMmV6a0xFZHlZcUJOOThvUW5NL2NV?=
 =?utf-8?B?clJQZUZpUWFETm1GRTNaRVExUW1iRU5uVm9mQ3FlNUY1azRZTFNuTXV0UXhG?=
 =?utf-8?B?cm5CVktlUjJVQVZKNkgrbnNiSkVzd3VZUkJrM0xkYUFLaFdCbWJMTkVEQ1R6?=
 =?utf-8?B?a1ZBWFkrSHFDWlBQNTUzckpqTFEvT3JWRGUvTlZvaHlhNmZ5cCtueEF1Y1hG?=
 =?utf-8?B?UFVrTkJqazdaRmhFT3JkWmlPdDJIOFVSc2pQcG5CZVVDYnhwcGFhQlZrZmw0?=
 =?utf-8?B?WG1QQm0vME1QT2RMb2ZHV3VrY290REJpT2FHZy9VZThtYVlrR2ZNS2MydXBP?=
 =?utf-8?B?ZUllZzBYdXUyQlFqYmNldVhFY0JXcmRJK3dJckVtbXZJVjRwNzFIQTJzRSs1?=
 =?utf-8?Q?tFNvMmT9DSHM+CPE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c48e9432-93bb-4cd8-cd0c-08df0e3edcfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 06:52:06.7566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YjnSHWixTXRE5Foiy9MKxgnOHpHRmnSvWLKsIN5r7Kx7HDYJtwsSiTM/ZPh7qx8SeAq+TeLs3g4/SNh9cumk7sk+HJFVhCVATkWxKeyE3RIG7sVUfPUcz2XlC1E+ZT7i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_235245_202285_239C591E 
X-CRM114-Status: GOOD (  29.44  )
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

Hi, Krzysztof,

> On 30/08/2026 10:57, Changhuang Liang wrote:
> > Hi, Krzysztof
> >
> > Thanks for the review.
> >
> >> On 30/08/2026 10:42, Changhuang Liang wrote:
> >>> Hi, Krzysztof
> >>>
> >>> Thanks for the review.
> >>>
> >>>> On 30/08/2026 03:29, Changhuang Liang wrote:
> >>>>> Hi, Krzysztof
> >>>>>
> >>>>> Thanks for the review.
> >>>>>
> >>>>>> On 29/08/2026 04:57, Changhuang Liang wrote:
> >>>>>>> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> >>>>>>> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> >>>>>>> +
> >>>>>>> +/* sys0 pad numbers */
> >>>>>>> +#define PADNUM_SYS0_GPIO_A0				0
> >>>>>>> +#define PADNUM_SYS0_GPIO_A1				1
> >>>>>>> +#define PADNUM_SYS0_GPIO_A2				2
> >>>>>>> +#define PADNUM_SYS0_GPIO_A3				3
> >>>>>>
> >>>>>> I could not find how your driver uses these, so are you sure it's
> >>>>>> a binding constant for the SW?
> >>>>>
> >>>>> Yes, these are not used in the driver, but in PATCH 6/8/10/12,
> >>>>> etc., some definitions for other GPIOs are still used. Therefore,
> >>>>> I have uniformly defined them in the binding, and they will be
> >>>>> provided to the
> >>>> device tree for use later.
> >>>>
> >>>> I am confused. The driver in these patches 6/8/10/12 does include
> >>>> the header but does not use them. Why do you include unused
> >>>> headers? Or what is exactly the use?
> >>>
> >>> I'm sorry, I missed one thing. Actually, the current patches
> >> 4/6/8/10/12/14/16/18/20 all use this:
> >>>
> >>> For example, in patch 4:
> >>>
> >>> static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0[] =
> {
> >>> 	{ .func = "auxpwrgood",		.val = 1 },
> >>> 	{ .func = "gpio",		.val = 0,
> >>> 	  .max_pin =
> >> JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A2) },
> >>> 	{ .func = "gpio",		.val = 1,
> >>> 	  .max_pin =
> >> JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A3) },
> >>> 	{ .func = "hbled",		.val = 1 },
> >>> 	{ .func = "pe2rst_out",		.val = 0 },
> >>> };
> >>>
> >>> These definitions are used in `struct jhb100_pinctrl_func_maps` or
> >>> `struct
> >> pinvref_desc`.
> >>
> >> OK, I was looking for PADNUM_SYS0_GPIO_A0.
> >>
> >> Why do you need unused constants? The constants in binding headers
> >> are interface between DTS and drivers, not hardware values. You do
> >> not need to store there hardware values, so what is the benefit of
> >> defining PADNUM_SYS0_GPIO_A0? Why can't PADNUM_SYS0_GPIO_A2
> start at
> >> index 0?
> >
> > Here, it is also provided for use by the device tree later. For example:
> >
> > 	auxpowergood0_pins: auxpowergood0-grp {
> > 		auxpowergood0-pins {
> > 			pins = <PADNUM_SYS0_GPIO_A0>;
> > 			function = "auxpwrgood";
> > 			input-enable;
> > 		};
> > 	};
> >
> > 	auxpowergood1_pins: auxpowergood1-grp {
> > 		auxpowergood1-pins {
> > 			pins = <PADNUM_SYS0_GPIO_A1>;
> > 			function = "auxpwrgood";
> > 			input-enable;
> > 		};
> > 	};
> >
> > The pins property corresponds to the specific GPIO offset, so
> PADNUM_SYS0_GPIO_A2 cannot start at index 0.
> 
> Did you even read my reply? Or you just respond whatever to tick the
> checkbox of responding to maintainer?
> 
> AGAIN:
> "You do not need to store there hardware values"
> 
> Do you understand the term ABI between software and DTS? Is in this term
> anything about your actual hardware numbers? No.

You are right, and I now see I was answering a different question than the one
You asked. 

So I'd like to double-check: in the next v8 version, I'll place the currently unmodified 
`starfive,jhb100-pinctrl.h` under `arch/riscv/boot/dts/starfive/`. For the macro 
definitions used by the driver (e.g., `PADNUM_SYS0_GPIO_A2`, `PADNUM_SYS0_GPIO_A3`), 
I'm not entirely sure where to put those driver-used definitions now. My plan is to place 
them directly into the relevant domain (`sys0`) file `pinctrl-starfive-jhb100-<domain>.c`. 
Would this change be acceptable?

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
