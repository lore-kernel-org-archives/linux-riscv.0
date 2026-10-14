Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274B2CC6B1D
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 02:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDGgcoC6nWI0SofPavWBDbHPoSNSUx7BajF7foshRZg=; b=zdQ866iXls4Csx
	IVdkqUejvEk7pXPbMSzHXfKdFl22U9Q6qP1ylqYlYdKI4yKzMENh7d8HlEeuUL5b8NclDrhgpZnOx
	dibpN97CB3mCZKy0jC1Cf2CWPSwPGX/SyeHQSHxAYiTJyIc9PAIGMZSpjrvpnHJUNjOPhTLYRh6QT
	eHt6CWh12uyJA/xXV10qAhWRh6VF1fBlkMGGEdSB84fQzhxpaDJyW5xj8GTy3TfBHVFv51MoupnF4
	mq5PW9C3wdBNR8f/KKVR0BbS00bj9ePCLuuAlZeYI7a1r9izywqtKGye2mmVh8UwPuiDqO+J0qlOc
	L0IDsoywhu23V7ePBLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGoV4-0000000ELxu-46Bo;
	Wed, 14 Oct 2026 02:13:50 +0000
Received: from [2406:e500:4420:2::706] (helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGoV1-0000000ELxL-1x0X
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 02:13:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCKsOxmhvEAskGPCC1zzH3/f0C43cSOkp6wWMG0bawokvtPJ14QJiU6L4SkADCduv+unDHGi1Jqv7qpB899Zp52UfBniBXCEiO2mYXKfO4Gd+FZbRZWtkfODZpp8E+TJ6pf4i0Yi0rsz5Q95Cy/9G3+lbbK2GD9l/av0MBC8nmbaub7EsbDHgzXs7D8/7RkhVwylAoY7fOHfoKdFMYIARcA7RwnDe9qBMJQCLvCjpMPsnPCUx1jXMHrEuVxUMd3C0K0VDhMsNyqkruxIkWQs+NoP+KR9cVyvt9qqu5+neA2t4TMeAfzdnYYkG+eD+HbItn3IHoKHGP0iCJspD75E9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LqSBaWPl/cp9oQon3SA/D8Kl/0dwZeWMhbGM0lqGMQ=;
 b=bN+t5OP9XFF9lI58zIZklHn3unNzs/EzmNFwN3Y34HWAmpvq433euAmWWkKds5HIi/gsjUJW5VHrT2nK2JvZXS20+7slXMjCNcO+F6hQjbJ18X5u9AFmvUrPrdm54MFgCVqlEfRpvmgTe+8hCXFkXeobqwzNOCNXCJVmSb3Rcph2W6LHKOSKPC48DtQ0+ckRz21HkSoYMb2m73oymFxj0XvKj6tFir63xmlLTK3bMrn5JSG6qNmq4n5LA7up1xsHtTvqCbpbQNnjAvSsi7tdxinzKKFehLnxJM4hw1Z7xlmlSvrQSmHAP60WQDGEPK5HALrEwcIOyZcp+tU/N9+hyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1266.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 02:13:00 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.012; Wed, 14 Oct 2026 02:13:00 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 10/15] clk: starfive: Add StarFive JHB100 Peripheral-0
 clock driver
Thread-Topic: [PATCH v6 10/15] clk: starfive: Add StarFive JHB100 Peripheral-0
 clock driver
Thread-Index: AQHdVyFLtRYIiaWikEG1xy6rsy3j47b5uLaAgAKcGLA=
Date: Wed, 14 Oct 2026 02:13:00 +0000
Message-ID: <ZQ4PR01MB120299579A8998CC303F04ADF29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-11-changhuang.liang@starfivetech.com>
 <179180050742.66744.4988353309640403131.b4-review@b4>
In-Reply-To: <179180050742.66744.4988353309640403131.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1266:EE_
x-ms-office365-filtering-correlation-id: 9b411e2f-0ba5-4eb2-c52a-08df2998ac03
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|10067099003|18002099003|22082099003|3023799007|38070700021|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info: 5DsHoMYa0ScnMg+LXJ8Nolm10bv786HOIn39xXJqSxt78eIjpub8YEWz0Xe+7D2S410RSaienO/puciH90kiNu7e6ggGRXGeeHsyVrDexRPDCUqQbFKPJZOVOkqeLUaBOYX4h4YH67c/xChYN6svQYNA4RuJqk4ofqUBRQqiW8AEY8ZmWhfKahAYC80rpVr/TCkzvsax5seanQmweUIn+9CuRi6W/zazs16cPrFDRramrhjbCLU9iOIYSL3y/TfOufD8VLVWOIsbCSU2xd2sYvY5d6ZaMk1wrr0QOKJqgzP/40FJojy6joZI4huIoIpPVnUib21+UZV5qevnRcwOHCMyO+cMi9KQnfgxjOfHfQ8UqxL5yv5pVN8fgY4XnTTQY85o+3wrQ1sidc9AD1Cx8pTjWH0uA1mwFkUovu9+hKeSsrhVh9Q+EV3UZjy7yxGP332iKCxmHcKV4psUfBAv1XIyXKV04YiJ+S/VHJQ2FKQ5kSW7Nn74sCvb/193VbPC8OeW0BhNYl5kQEg5y8tIbEZzCxJ5TY6eUMg7Bw1ZYmesLFc5iu5Vh5vRfChjVU4f
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(10067099003)(18002099003)(22082099003)(3023799007)(38070700021)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzgzMXJQTXl5NDV2VnhHZXBNTHIxMlBuMWhkU3ppOGJFRmlkVXhMVzdzVTRo?=
 =?utf-8?B?ZnZ1NEJrZnk2SjFNUmNYYW9uQzBFMDdaZTF4bi94Ynl4ZWNBS25jUHhJTHBS?=
 =?utf-8?B?Zzh6d2JIOGFnNTdNb3lsZitPVVAwSWJGeldtVTVDV29uS1lSUnhrNndwWWgr?=
 =?utf-8?B?VWRNRmFYajUvUEYvaGJhS3pDbWlBckNTb3p4a3NRUTBGNFRZYWpnYTZ0c0Ur?=
 =?utf-8?B?TDhoUUhBcFNpTyt3c3NiRG1odHUzMUd0OTNCYTRVWUFEaVZUdExrUmJaeEI4?=
 =?utf-8?B?dnU3d1AzSE5BN29OMVQ2czgxQnduTDZjUzBtallKZGZsdnllL2dsZFJhbGl3?=
 =?utf-8?B?Wml0VXRTSGFzK1NCcW5PaVJhanZTb085SjlVRkd3UnJ2Q0EwTDUvVTBZUzlX?=
 =?utf-8?B?TjNaUDl5em43SUhad2JFZHBBTzhEV0FjckIvalQrOW9ZSXlQWi9Db2IySWdW?=
 =?utf-8?B?a245RE5iL2t6bGdsaXl4TlRtc0huVjZFd3d4Z3QzSG5ERGNadWF5S0pRYkpz?=
 =?utf-8?B?aUM5ZjZiWUZxeDJNU0lhdzd5Uk9GTmw3RHVMbWpQekVwaFY2QSt6dmQ4RE5D?=
 =?utf-8?B?RXprMHJSSTMyZmYyamRwR2dsblcwQ0NhUjUxbDVodjRrOWVzK3hIUWVrQVF1?=
 =?utf-8?B?VnQxdFdJWkVNb1Zid0cwdmFOS1NJQVp4Zi8wd2ZmclI3bWFmUnBZNkdHRzI4?=
 =?utf-8?B?UnhLemtVYjQxTG5lVW1icjJqM3J5bzArWUtlTTFCRXRUYk14Y1JkK0Jad3o0?=
 =?utf-8?B?ck9RendwNEMxZmZCT0pBSHRIbmxPbXB0Qy9KYWVqS1AxWnV1cXJMc08yNXF0?=
 =?utf-8?B?WU1QZ3Q2bm03Qjg0clR1TkkyYS9ROTd2ZEdOenBITmswZm5lOHdxRjNhbklV?=
 =?utf-8?B?R1hMWnRDNHJCSDllUHhpWmttck1pdXdBQ3VOZ2F6TTluV01tdjFaL2FieWhU?=
 =?utf-8?B?Ty9xckV4OFBObmNPZlQvYXNUQU5RZWFsZ01KdDlhbUxUYTZNY2U0anU1WXBV?=
 =?utf-8?B?QjRSNmlRcFg1SWhaZ0huQ3Z4NEhHRDA5OXhPYmFMUU1IQ2ZVeTVZNmYyeTBZ?=
 =?utf-8?B?S1BldjZtZVpSeGZhMzdBLzlRUTg1bGJvYS9wa1gyRU1RN3JLdlZmYjBsWFhQ?=
 =?utf-8?B?amxLbHFvRmR5N1lwNjBNM0NWcGJ0M1Eybll5QVdCT052SDFvYnN1SGNFMFUr?=
 =?utf-8?B?YXZTeUVaR2RrRmc2RGVUbFV4TVpJdHZhOEsvRU1FeEFkaFFPN1JSNHNMaU1s?=
 =?utf-8?B?MGZOUkRpTzU4MjJoS2h6SmxiYVR1ZWw2WnAyeUlwbkpXdUZONWVrL0hvZEpq?=
 =?utf-8?B?WGdBWmlJTHdJMXBrOVdsNDRITEpLd1o4d0crVXV6RFE3YVJJWW9NQ3JmczI3?=
 =?utf-8?B?RmtYUWZ6RkxUM2RXQ0t4RmFyU01mQ251bmZVUXc1UnJ6cWF2QVlXUGFzd0c5?=
 =?utf-8?B?VHlCUjlIcE1HU05JRldUNEtzVnJTZnVLZEhlVjFTNEErdW5KcytXWDZ4Wldj?=
 =?utf-8?B?WVhETTFyWElpc3lrYkpTWWN5SkhPSGRxR1JjdlhLeStiLy9uWjZUYndzeXh1?=
 =?utf-8?B?U2xSejYrdWk2QkJsNDhzRjFnblVTUnVQVCt4T0hLSHArcmFzNkovc3ZJdE9O?=
 =?utf-8?B?VkhndkVBamNYZlN2T1JJWFVHT2ZHajBvMUtVM04yMkRFbkFVNEloaW03a0RG?=
 =?utf-8?B?Z0hpRmpzWER0Z0FnV0ZxNGhDVHlMaWNhTzA3TEJQV3pkemtxMXpoZUZOb0ZY?=
 =?utf-8?B?ak13aVgydU1acFFHOXBVU2Y1YUxTOWx1SHptY1Ezc0paS0ZSZUsyVVdCVGwx?=
 =?utf-8?B?ckJCcVJQZDFRUkVFa0lnUVNmbzIrWHNGdklDNzVaU241aU9aNGhqUHhBN3Vo?=
 =?utf-8?B?c3A3K3VkaCtTYkpQd0MrRFpTREZuaVkvdkR3V3VVQS93Y3VrbW9kNnZWbmZI?=
 =?utf-8?B?OWJ3dWs5cWNLYXpENjdwelQxZWZtSy9QSERKd1ozZCtpWFBxd2w3Yll1U0p2?=
 =?utf-8?B?aTBVYmk2Sy81VGd4YjVRSVlUeWVBb0ZCOG82WE9wb2RHdy8rVzhRbWo2bU1G?=
 =?utf-8?B?ZnJnQm1wNEtKYURqbExDMDVIYnVNamR0cGRJRUJDTGxPMUoyTkRsRllNTUFq?=
 =?utf-8?B?S1lLd3NRSFZQODNMS01LM0hCV2EydWd6TFpPbHJDa1gva2x1MThyT0JpZXlh?=
 =?utf-8?B?K29jcVZyWWoyZVBTWWpKemFYUloyaVN2TjE1Zlk2UUFGbmswYUtPUDJNQ0ww?=
 =?utf-8?B?WFdwYm92NmgxYmQrU05CUElBOHJDN01KREhWbmNuUzQyaFE5UUxzZ2MvSjhn?=
 =?utf-8?B?N3dlYVVjUGRwT2t6MFNzMXNmeDdrNGpKU3RCMVFkYUg4STRrOERmL3R3WHlo?=
 =?utf-8?Q?9dTyqcgkO2IxEG9Q=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b411e2f-0ba5-4eb2-c52a-08df2998ac03
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 02:13:00.7436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQbiaIGbAucYc++qAPZFliJsXW4YhY5HWVGRd9cX0VCGcIn81xH0ACBECRF3LkXbSyZvjcWDabwLcHy0oBM8WXTwcZhnGr9AFeVDZbGKwLoJIjew2/M1ndASZf4/lROt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_191347_663362_94AE07A2 
X-CRM114-Status: GOOD (  28.97  )
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

Hi, Jerome

> > Add driver for the StarFive JHB100 Peripheral-0 clock controller.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/clk/starfive/Kconfig                  |  10 +
> >  drivers/clk/starfive/Makefile                 |   1 +
> >  .../clk/starfive/clk-starfive-jhb100-per0.c   | 617 ++++++++++++++++++
> >  3 files changed, 628 insertions(+)
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per0.c
> >
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index cfaac934a8e0..b2a05bbb450f 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -73,6 +73,16 @@ config CLK_STARFIVE_JH7110_VOUT
> >  	  Say yes here to support the Video-Output clock controller
> >  	  on the StarFive JH7110 SoC.
> >
> > +config CLK_STARFIVE_JHB100_PER0
> > +	bool "StarFive JHB100 peripheral-0 clock support"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	select CLK_STARFIVE_JH71X0
> > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> > +	default ARCH_STARFIVE
> > +	help
> > +	  Say yes here to support the peripheral-0 clock controller
> > +	  on the StarFive JHB100 SoC.
> > +
> >  config CLK_STARFIVE_JHB100_SYS0
> >  	bool "StarFive JHB100 system-0 clock support"
> >  	depends on ARCH_STARFIVE || COMPILE_TEST diff --git
> > a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile index
> > 29cdef20575e..352717886295 100644
> > --- a/drivers/clk/starfive/Makefile
> > +++ b/drivers/clk/starfive/Makefile
> > @@ -11,6 +11,7 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+=
> clk-starfive-jh7110-stg.o
> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
> clk-starfive-jh7110-vout.o
> >
> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+=
> clk-starfive-jhb100-per0.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> clk-starfive-jhb100-sys0.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+=
> clk-starfive-jhb100-sys1.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+=
> clk-starfive-jhb100-sys2.o
> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > new file mode 100644
> > index 000000000000..ef6e6906cd2f
> > --- /dev/null
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > @@ -0,0 +1,617 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * StarFive JHB100 Peripheral-0 Clock Driver
> > + *
> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + *
> > + */
> > +
> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-starfive-jh71x0.h"
> > +
> > +#define JHB100_PER0CLK_NUM_CLKS
> 	(JHB100_PER0CLK_MAIN_ICG_EN_TRNG + 1)
> > +
> > +/* external clocks */
> > +#define JHB100_PER0CLK_OSC
> 	(JHB100_PER0CLK_NUM_CLKS + 0)
> > +#define JHB100_PER0CLK_PLL6
> 	(JHB100_PER0CLK_NUM_CLKS + 1)
> > +#define JHB100_PER0CLK_CFG_400
> 	(JHB100_PER0CLK_NUM_CLKS + 2)
> > +#define JHB100_PER0CLK_CFG_800
> 	(JHB100_PER0CLK_NUM_CLKS + 3)
> > +#define JHB100_PER0CLK_NCNOC_INIT
> 	(JHB100_PER0CLK_NUM_CLKS + 4)
> > +#define JHB100_PER0CLK_NCNOC_TARG
> 	(JHB100_PER0CLK_NUM_CLKS + 5)
> > +
> > +static const char * const jhb100_per0_ext_clk[] = {
> > +	"osc",
> > +	"pll6",
> > +	"cfg_400",
> > +	"cfg_800",
> > +	"ncnoc_init",
> > +	"ncnoc_targ",
> > +};
> > +
> > +/*
> > + * Regarding the CLK_IS_CRITICAL flag:
> > + *   What is special here is the UART*-related clocks. On the JHB100, the
> secure
> > + *   core may consume one UART, while the AP core consumes another.
> Different
> > + *   core boards may select different UARTs, so we usually want to keep
> all UART*
> > + *   clocks always on to prevent the AP core from turning off the clock for
> the
> > + *   secure core's UART.
> > + *   UART0-3 are usually used by the HOST side, and there will be no
> driver on
> > + *   the BMC side to consume these clocks. Therefore, these clocks need
> to be
> > + *   enabled for the host to consume.
> 
> So you are forcefully enabling 14 clocks for 1 to 4 clocks that may or may not
> be used.
> This is not how this should work. You just enable clock randomly hoping it will
> cover your use case. If you are managing the clock for these secure core, it
> clearly shows you need a driver for it.

Can I keep the clocks for uart0-3 as CLK_IS_CRITICAL here? On the JHB100 BMC SoC, 
uart0-3 are provided for the host to read and write registers via eSPI. On our BMC 
side, we need to ensure the clocks are always on to provide host access.

> 
> > + *
> > + * Regarding the CLK_IGNORE_UNUSED flag:
> > + *   Clocks flagged CLK_IGNORE_UNUSED are not consumed by any
> driver. The flag
> > + *   keeps them in their hardware default state (enabled) instead of
> letting
> > + *   the clock framework gate them once it disables unused clocks.  If
> this
> > + *   flag needs to be removed later, it must be ensured that these clocks
> will
> > + *   not be disabled even if they are not consumed.
> 
> Why ? you are ignoring all sorts of thing in there like i3c. If the i3c bus is
> unused, the clock should be disabled. If it is actively used, why don't you have
> a driver for it ?
> 
> Throwing CLK_IGNORE_UNUSED and CLK_IS_CRITICAL at the majority of
> your clocks is not OK.

Will remove CLK_IGNORE_UNUSED flag.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
