Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7C8C5AD5A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAUPPe5CcdM+nVmJB0wxjU2No5mZdDUSCcxicsYoJio=; b=XrPAH+MsczpOLr
	ayZekvJBxg2AWWmoRS+6lYuJWL/FtmvlPvs2CU/wRzmuXG7YVF7WLccVNQQJ/wX9newyPCOtUhsSV
	figRueVKFpfvFuEEMNdbzPrMGND283Wkvs4bcJxryfdqQ3P67WZEFt36zHzHdCGjBtrotMJDdLYrM
	dbZLgE6H4GTAk+Gl7XGMQZ/dTEMhzmBodmMBJLahsuW0Mq+fXa45GxPbtVZKeuGb0NxebEF0P69Ku
	ISUYrf9NLrkE96DUSV7cd8xGWH4C5gSh04SkAucfx6R/yEdzHFEtUGyudRcpIwOZ5CH5TvAYFKjLC
	lIjII8De2Imua3wqiLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6L2-0000000Fuj3-1WZn;
	Wed, 12 Aug 2026 10:37:36 +0000
Received: from mail-sh0chn02on2093.outbound.protection.partner.outlook.cn ([139.219.146.93] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Ky-0000000FuiB-3e66
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 10:37:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPORAul9HRdoL+TgXpsEoq+MY7czBsejlaBD2Hea1lXnXrHDzOY9yaOvlVNXiW6ykPV37yr5QzdAO64sOMjsfcYWQFgjNgkh8h/bgQAIOMB7x4oX9wND3Odt5VFLYQ5vkD2412DgkPLJGhG6zJ+HUblDiVLVWn0ZETABB2bdwZWJsId1YuDUZjnZIAgNcQXyVvZ8CUH42CXnTh755orts4h2ai2NDB4vmemEoV8Y+i4FrTlgN3CbA9HQAiUR5WK7RFocUZWN2jg3C1IdgwjX9+E0ibRXfkleCnk3tqBpnThXlOOEBdsfTmHfrt2YODWevXBcjWMEtFzDA0g7KiljHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBpMuSIudmHS12y4XRGyMdOAaB6DU+PJVvWsTpXFXJY=;
 b=ATHJaR5NseKGYoYbScRfypG6c1V+bo4XQAJYFlVTELUxhcl65PCFks1Wk+TZRWgFXOZiXln/vAgNQMb21Dsc0xOEmGs3pmRpkHTQ4KUr4ZoxlS/RgEZ0h7BE8IUmJv0IwD5kzSjgavKgs/JNd7bI0leno1B7WaQbiYekN+qPFAMaHGy5jtFxgPS3SxVs+DIUqPkpK40oURN9Un6EI+dpZ65JE23NLqXK2zvkke9AXYcTY8v2Srl3uDiIGlK1zs7EHvIAV4cOe+M0Wb9hJM23rOdhfaY2gTbY55pDUg+Mrbyl95eAgyOknBjjKt10lmXXgPHp3//iH4J8G3KHQDqPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1251.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Wed, 12 Aug
 2026 10:37:16 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Wed, 12 Aug 2026 10:37:16 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	<inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang
	<keguang.zhang@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Topic: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Index: AQHdJ6GQ5ts+ksAe6k+ENksiQTa0y7aXdLuAgADirHCAAL8NAIABJ12Q
Date: Wed, 12 Aug 2026 10:37:16 +0000
Message-ID: <ZQ4PR01MB1202DDE6C255441E1FC4F916F2DC2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
 <20260810-caress-rack-45615c8d9747@spud>
 <ZQ4PR01MB120276A1DA91FAC19C852F14F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260811-populace-afflicted-40a40e0f484c@spud>
In-Reply-To: <20260811-populace-afflicted-40a40e0f484c@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1251:EE_
x-ms-office365-filtering-correlation-id: 87edb5ab-1330-431d-a165-08def85dad97
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10067099003|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: FPmU/DJpWIqGXbYXayd1vJeb36j3sexqOydqy9NCVpaYe6eq5Y5dws0yiMVVPXXaNTl41jFpeo2W3gRnoQB39ZmerguAlq+ayC1UdVe2NZsIG06vx416aTWxMjyXA0yY+RPYWXNRAjiCjLv4joajzcV3rNeBVQxrHsFVq2b5UrZ2Pk9/1eYzqhv+AACbmchQMVRh93KNQUcAFO6VlY7QvoO/2PLjJKubXuX2Co5kNfa/uN5clQ1eJWYjT+i4uLQCSyT5oSHqu8F2IeXXe1OM9YoAwOIffDhpJei1nnXAt+KeakaO0PmIDMyNjpO0vHx89rq5RSQRvJe0w6XA2S/DkE0Su268ikmqQZPV5BExkYGQF+aN0WNcziSPjy6WYy4yuj5HpxTZ9h41ct51rzP+hUTZnKh0DN1OZQ8iEjSf7ojWHha8FyeOsbHQwTRy8BpEX6w1T0yx8G3bE3eMfKkD+vUNpWOh94QUk6rAugec6LZa86VJvxpdKumHQkTCevQjcdONxoIu02N0P9X/SypF+tvhwBaVAdTb1d396fO5KyVMqrTL3fMxlZ1QKz55GZH5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ARy4ANKMlTYnMLIK/yU8lKIzJmHYKZooJhrROu3x+i10GI2LR9kwGefVjHTu?=
 =?us-ascii?Q?Vg4DnexRlnepDLZSVLo5lRbv9GWADjZTZd9mv+5DUdyoJOAAwN9DejYQeJvA?=
 =?us-ascii?Q?6nhoqzYUW5+4yPkQe2ebUjqY4P/tUwda+S6brMu6MtmdMzEG2ju+KnmqpjRh?=
 =?us-ascii?Q?QpG6AMT6ZmKgdyisdQBakKgKhGPAML2U97t4dxwVAhj/WRoTmzHlz4gzYcYk?=
 =?us-ascii?Q?X4k0sRu4eusZ+ELzFaPwtc1+9BJ/nt1RsWrGgWEoTWbCaqIblq/eFWi8E6/E?=
 =?us-ascii?Q?qpygnKbDidgHOdBGqRDZr3p9V2Q1QnvD2u3HdA8fdFKtRZEUYFHsVP5Wgdgf?=
 =?us-ascii?Q?oCelbUBSFUBbw3Dr8YPRrIYrwqwXsZ1Uk9YgS9hzJ41c2qN0cKwOuaqUlxn3?=
 =?us-ascii?Q?FFQP3qVsr23NwY9J0FgqW/AXnmvZcVaZEnPLvowJb5/ZatgD1MJ2EZG7rKMi?=
 =?us-ascii?Q?QQWg5QTvXs9eDcausOnZB+GdkfrjEJ7kCCwZGB9nAldruQqFFij6CF98CjAy?=
 =?us-ascii?Q?IC3rqcEzmluxb2zjd9PIU45MRXkZ14BpkaSUZiDtZZZ24IEJIHpTyvodRP2P?=
 =?us-ascii?Q?I1OO1NAGKFMNu7Jfp5a8soXm4tuoao477M4Rcj8p4OSnfxJhxYKnsqcjKqnX?=
 =?us-ascii?Q?jM5z8YPzgONMBkRoIyBWJEVa7ql4F6bZGtxF9TVLPP3bBnnyJ0p9RRWSLLwT?=
 =?us-ascii?Q?CihNWOFn/GlvifhemQcvWCmTsQyo/fg6orbRQyJ5EQrJdzD+spncVkSIgc0s?=
 =?us-ascii?Q?NXnTAxEhP1ap18BH9eoQCLmy0vWgO5Xea2cgtuhITxTCHnRRd4UqLZYWB19R?=
 =?us-ascii?Q?oGohwGpNy6o4HwjzE4x+VRXh0Z89wo8zJSMkcow3wOF9yvVefzpRXWsuhQij?=
 =?us-ascii?Q?BQGXA5uYiEA4vgGHEj/ThMchX3N+sdYXr3tlwjPrE58Qq9H4Tu0Kgem5P9rJ?=
 =?us-ascii?Q?rRIoGiq2MgfXzy/nw0k/8k9/cHNZmvKdjHZwmmMmtjsoSMl5wVyCjww3ZNXy?=
 =?us-ascii?Q?7aO/LF7W9PdS7O03FJJ+f/zQpCMSfZujXkh4dHzkOQoUPM9sCGjSoBxLOqxs?=
 =?us-ascii?Q?mnofghFu8yVby0UeqwjgLMDREOEmciexWVFZo1OfFOw2Vsvs2c6W9h6tdxsn?=
 =?us-ascii?Q?oQzs7GDvvMDv7eIuu6EGEbj5MLeal3UsPFn3w8Kxb92ioOFKnI+lEfQuo9pD?=
 =?us-ascii?Q?GbanKICkKS88UnE3GpWdK6WJrCOX5OLoZg/e3oEvLGTJuZ6rnGL38hyBTLiL?=
 =?us-ascii?Q?HR4hyo0DAqGGPmoaVZ1Rlo7bKH4NgZncJVkAa8d5MsT5S17gP+C/l6aJ7bhN?=
 =?us-ascii?Q?abLhuVDC6MXMXMp+4Jc7Hs40Zog3M3qAE1FROfv68z5JlqGpec9jIZz2dUCF?=
 =?us-ascii?Q?IX+dxG7CmUMOVamkOH8cVi0GtXuax/eerYbfl0VutdqahVAClW5EHmMI7HgF?=
 =?us-ascii?Q?Q7cyURx2+JCL6bUoc5a5N4fx+yrEdsu/LGCG+z/jtSg1GZeJTxVq1FFaqru2?=
 =?us-ascii?Q?wfhlmzxoimZeLSOXYhx24Z0oDMKD6wNQFjDFm8n9lPxrjJUINBDKklH1fGq2?=
 =?us-ascii?Q?cShW2Pt6iey0zr2xwlBeRllVu5ixVlG/BVELRTHWdoIhdxWdYmCqTy0lC9cT?=
 =?us-ascii?Q?0EXZsJsdNdStOc5m/jBQWtp8pPtq/hjNp5zGlBZPrUV+lzLaFdLmk1mHli9V?=
 =?us-ascii?Q?UFKPAwEEUEwyFZLy1B2mJGQlW3VfWdGzAISVmJfHeWkHR4v+xVAxiOSyxlUJ?=
 =?us-ascii?Q?l/3gNj3/7p3Yk+cjF/imAy1eejFtP8c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 87edb5ab-1330-431d-a165-08def85dad97
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 10:37:16.0968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i104mYlo9PGTLHE9jgHSyVInfLHbPlOtb9/FqNjtoX+F/EEq2Ej2Ja7s7S2WfR7B3jrY5i7t1PPw0gll1XP7BNgrXErRvAiMzqfzObwGji3sADiLC0IFW8PAeTYBF4yF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_033732_908350_E3A52014 
X-CRM114-Status: GOOD (  15.56  )
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

Hi, Conor

Thanks for the review.

> On Tue, Aug 11, 2026 at 05:36:19AM +0000, Changhuang Liang wrote:
> 
> > > On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:
> 
> > > > +static int __init starfive_socinfo_init(void) {
> > > > +	struct soc_device_attribute *attrs;
> > > > +	struct soc_device *soc_dev;
> > > > +	const char *machine = NULL;
> > > > +	struct device_node *np;
> > > > +	struct regmap *regmap;
> > > > +	char rev_char;
> > > > +	u32 rev_id;
> > > > +	int ret;
> > > > +
> > > > +	np = of_find_compatible_node(NULL, NULL,
> > > > +"starfive,jhb100-sys0-syscon");
> > >
> > > Remind me again why this is not just probed as an mfd cell from the
> > > syscon driver?
> > >
> > > (Hint: please put this info in the commit message).
> >
> > The discussion result with Krzysztof at that time is recorded here:
> > https://lore.kernel.org/all/20260405-strong-watchful-marmot-fdfad6@quo
> > ll/
> >
> > One register should not be treated as a separate device node.
> 
> That's a different question. In the case of an mfd cell probed from the syscon
> driver there would be no devicetree modifications required compared to what
> you have now. e.g. sg2044-topsys.c

This seems feasible, and I can introduce this modification in the next version.

Best Regards,
Changhuang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
