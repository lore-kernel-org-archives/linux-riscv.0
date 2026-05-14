Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F066ECD37AC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 01:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTI590EXCLPeheddvaBHPfKp40eC9IEWo3VESctWYuU=; b=oGIT6FI4zjn0Xc
	m2G0gJxMAZ5o22YvMFBL1O+h0oX75nPBvSMO9ol6kTBVtE3HVcAmk6bgWcjmoglVcop1RfMgROrWF
	4i/xu6fqHpPhEmqj5wzNSOxtQlm4/BJaUZL+iTkS2Ua0CEWBUmavAD4X92/6fg7GOwmiQZvoHjasw
	A3gOSbpKqaA+aZTf9wscvjTiw4hx57xHAnNUC29MuPh+MV0RcR+oKFpIHkXX9GSF+cOrohZC3qPOG
	jEXyUOZCdVJVmoJS0cgl2bNtnOClM5RzhbLQhPxDBDmnLWAfyWc6KfzwqHMwoaRF/NRS/S18n6Gi+
	AQGhM4Heb1e6ByEL6i3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKYV-00000004E8g-2g2R;
	Thu, 14 May 2026 01:08:03 +0000
Received: from mail-sh0chn02on2072c.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72c] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKYT-00000004E7O-1Nc3
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 01:08:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBaO1RKLip6GF2Njy7GgGZIymM8oA6UEdV9RVo3iJPjqe3bESNzTt+rgs6wFPnJOkKUCPsUFQbx9nn8n1/adVPclv6r+5xlorftDZCBR/2E1KODZa5Gbjfmecu4WOUoFmlrRap34f3S/KY/6VFea/fpQrhpk1/w4UXvweWeoc6HTSGvJhwOzR9cfNil5jUXj6g6jaMTP+I2WOFq4lYanfuLH3lGi0h4WJUgLBh9S+5d4DymUIce1mzRDZleWh0mLVRnySkapncBVnxrySd3mdBpiOMWtzVJhLCp4967LMMneueaRaq1kJolMLDY1FnxXdt9f7iqOwblGWQBYmSW/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+h8rJObvQ0MqX2k5GhF/PyqPVQMp2H73l/ONl2hiUA=;
 b=SDe+z6mDIoqQRnqM+qqUAlJPB2FCCBYbGqnuvwdMLE+Yo96wQ/FqkgJwzho5k7N8sg6M/URz+EUZvdJetJAUWq5TRbAtaqCpxUzsnhguLj8rIFDoNyTH4CmSeXscdzeJ8yoplFb0slJbkOL6c9Apgxc7kZgFMb3sVd/9NeumzlvLj+ymhCGn+z+TS0cMYpZKTV4kI3Z7nhV95THBk2J1o6Esj9mloPAxH/zMMb4Wnt+tOZLzG5Rs1uSiAa5w6Xz5TBvNuSSlkTKH/wnqStD7cBpVIx78sWSyH7xALTDTGzaVRO6jloaUkPAUMo1IwzV6R4DrN0BmAtaBnG9WIDeo5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.24; Thu, 14 May
 2026 01:07:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 01:07:37 +0000
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
Subject: Re: [PATCH v2 11/12] soc: starfive: Add socinfo driver for JHB100 SoC
Thread-Topic: [PATCH v2 11/12] soc: starfive: Add socinfo driver for JHB100
 SoC
Thread-Index: AQHc4epWeSXninZZ8UOuEt2E6vxAdbYKqmKAgAB57HCAATHvAIAAYbRw
Date: Thu, 14 May 2026 01:07:37 +0000
Message-ID: <ZQ4PR01MB1202150D76C700778EB29978F2072@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
 <20260512083521.3448-12-changhuang.liang@starfivetech.com>
 <20260512-mushroom-helpless-0815d0885abb@spud>
 <ZQ4PR01MB120205CCC0A3229824701640F2062@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260513-headstand-hertz-bf31fe6c1938@spud>
In-Reply-To: <20260513-headstand-hertz-bf31fe6c1938@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
x-ms-office365-filtering-correlation-id: fd76e494-cd09-4f26-2a49-08deb1553076
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|56012099003|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info: Q4doAHX33k7OMLni/lhDQrPhbOXDqnhJBIxDBMNBy7EnRpufHQPBbfahqmuCThZT4CGZgexjga+6Dzzu75mL/ea1kagWtP+ZslaE0ttBrklqedj1n1HpRoqprMXYzSGAwwH3AeqNPdfzOQpkAZbl8DTKuSi7c/Zv4mHvO/pmJJDT3exkysZZZHIGgbb3GTwe3itC6Dsn5DK7cMmGx+i7+r1paP+Gr0URZlgQ3wISDt5tjcgg2pCjtDzBXbYTGf5hf9lJSPIu8HIUfUW1L6bmpx2jPYTPKbwyLDrJO7MHYfRZnu6vJmGgsS2NhCOeeXTp9pYcfVmH61CF6Q6iLNeueQu+kdHZvbA+fcnN/poEcDPESObDJYzilgIGXgvqP5yqgS/oQb18JFD2DFOUFPYXvWHq7SNXrS56J4USfECOs8UpPu2g2l1b7VRPcS+ta5dWZaQmaW+h+KWPrY7KFy5SRoI9Bv6J/s1OkvSz+CBUK7k5T6Oa1H1i+jo/Vp4wLbDJcjh7A0MayoIy22wPwvLLvOP9cJ/+F0wTJFILKdebxDQxhCmc/K/ylH0geC+EnNwn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?icrd6dTJABLfEr+DoX95v4SDi2ciNE6ILFx+46jBVagsMd8fwe+U5fqmlqXQ?=
 =?us-ascii?Q?2SuX1yGPdjg1pr4MEJY2RN2GGWE+/u1baXy6H3Tm+9HTDlIuxEX27aC6BN/Q?=
 =?us-ascii?Q?fIzww8VSkbMMR3Vl1OJHKDOhG4Yu+FP+kV6BmWWumbazRwCGUsBS083rUE21?=
 =?us-ascii?Q?u0dGzjuP5Z49hEKGwOyOJS7IMI5TQ8xRy9f3TmZvLfHBmtipIFHKhk5lujdI?=
 =?us-ascii?Q?kVauVh6TlrQdTdDTJM8WxYGAT0v/E0DOky90dmkBY9s5NAJNEjBQCVpJYqlw?=
 =?us-ascii?Q?FJcBh+YA0mGyx6uq9Fk/iYuiPrZsCqRiy1X8fBgv8mq3szSaDQKX9ndPggZL?=
 =?us-ascii?Q?pvDSliRKs3e+UEDUzj0glPQ5vGhGQUnQKpNilBADaNDAOCwmEzyQEi3pVvgj?=
 =?us-ascii?Q?GpqcshV55xpEcKhWHKFrF6R6nMVNstp+sE2ZXVslfZEqtIj/JoQ82VPgGJup?=
 =?us-ascii?Q?3RVI6UCsyvFWEz3ZT9KF/lJnHTxgm21Q1XeRzyohLA/R0BBlDoVTI+yPZ2VZ?=
 =?us-ascii?Q?//uqMUuDKsC05yj+5/QUSIqHFHOgnNlA5sH1gpWFIfQYidVirJVNzpAt88m7?=
 =?us-ascii?Q?UjzenXZWCCaNUovC2pJoQGB2mY+5TlG+Wi7HA6mq+go/sEvSRViv2THFrYKK?=
 =?us-ascii?Q?+pWuJsSoNBDsgHQJ99zjrTZ8IzCY9MZj505zcYgBBP4SYrkng87WFbtKk8QM?=
 =?us-ascii?Q?5jINPtc5fO5YU8i9fffQF5/cSFJ2VQcDeb16GH7cGpfspvSKvfko6ga3w48T?=
 =?us-ascii?Q?81eqxpdiumHm2BrVMS4Wv7eatPocUbfl+RJW65+lbpI5IuhEk4eIqRr+rDFt?=
 =?us-ascii?Q?KrNVJX1XMSuzFwQj1Ve2XOIEGtiqARWfe6475pyxSfbHeBgMOeVG2/1fveU5?=
 =?us-ascii?Q?EIK8fI0/FBgI0jDgnOPozaP+RIsYL75IkT5qolBOt/92P+/z6VTUZ3gxqKo6?=
 =?us-ascii?Q?ZrpuXWIrrTd8oJSl4Olwr26U4MTyYX9z0JSIonEFbvJr0L4pn5am02UuXsue?=
 =?us-ascii?Q?MfLDV58zmfwJkio32PhbA34mSwrJgMwuoYzek1UFHAfyM/PROr0MoxQ1Yore?=
 =?us-ascii?Q?igkQkFi9TTWXh/swcUo3+Z19Z84IOFYPZgoeHnPzONAbwvJ85dSwnD4qJQEb?=
 =?us-ascii?Q?3AS8kqNMAqZBCuYdfmsQ6bZ4dG95sY/mnbvfAeczhpSyh8nCyHT5OiAigaEJ?=
 =?us-ascii?Q?xVgDMS+6HnhHX7L10QdLyIwuggumF2pawjIYMJAm8mBMuPgXzCvkuEz+8IMm?=
 =?us-ascii?Q?m8mwj2W2igVFElxtevA2ByOj02itYZTmKPQw6aG8C3St4gNsurdgTBRjJnDy?=
 =?us-ascii?Q?1YTUAJm8Y3ckQmLZDY1l/+ipuhbBdC4SPSDRlD2r1qSZhaf5q89i3FjhcQwU?=
 =?us-ascii?Q?XlJGhNRtwzK91MnYUqomPPE/lhGSGo6n2fKoXAZ40FWwuEY2ofE9yvKvT+GH?=
 =?us-ascii?Q?vODTHs5D1j2qFMaWSfsEwgw35aCk0UcVvfBly2o0EEVxrWVDFtD72Zy5ksMK?=
 =?us-ascii?Q?Iln1QZV3+B4s8ugCtr0tRBpYSHVi7T24GM83BUQJGXmNlvdOyCHM/zwSd2bV?=
 =?us-ascii?Q?6YdpthX/ip6y8O8+gUyKz8/9OWS/vurmYncQBu2SXYp8xBSH23j8AmQiaT1b?=
 =?us-ascii?Q?CMDC7/MHmmEwj4wJEZwQExXXgpAu3F85tZ6yzsoLITErdJlqxT8WLRiO+T9c?=
 =?us-ascii?Q?4Pc1yMRJznGe6sQ1PBb4OHpMwRO1UmP2fb+qS9XwPfe36GfMIvoh3V7jwQRV?=
 =?us-ascii?Q?ycBoBSI/PNvVfbP+Yt+/RC0sDepRLq0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: fd76e494-cd09-4f26-2a49-08deb1553076
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 01:07:37.5490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ta4/59TWeTCVdpwO8K0VVULhuMNRsO15XgR+twmThNaw2SdyTJXKYAidqHhbPIik7g0uY697i2f3eIDzAvtjhvjhjaiXxkuR1RZqnwDHWp3bpN6XssltOeKXYsopbejn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_180801_366840_2D3410E3 
X-CRM114-Status: GOOD (  30.44  )
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

> On Wed, May 13, 2026 at 01:01:46AM +0000, Changhuang Liang wrote:
> > Hi, Conor
> >
> > Thanks for the review.
> >
> > > On Tue, May 12, 2026 at 01:35:20AM -0700, Changhuang Liang wrote:
> > > > Add socinfo driver for JHB100 SoC. Currently available for
> > > > distinguishing between the two reversions, A0 and A1.
> > > >
> > > > Signed-off-by: Changhuang Liang
> > > > <changhuang.liang@starfivetech.com>
> > > > ---
> > > >  MAINTAINERS                                   |  5 ++
> > > >  drivers/soc/Kconfig                           |  1 +
> > > >  drivers/soc/Makefile                          |  1 +
> > > >  drivers/soc/starfive/Kconfig                  |  6 ++
> > > >  drivers/soc/starfive/Makefile                 |  2 +
> > > >  drivers/soc/starfive/socinfo/Kconfig          | 11 +++
> > > >  drivers/soc/starfive/socinfo/Makefile         |  2 +
> > > >  drivers/soc/starfive/socinfo/jhb100-socinfo.c | 80
> > > > +++++++++++++++++++
> > > >  8 files changed, 108 insertions(+)  create mode 100644
> > > > drivers/soc/starfive/Kconfig  create mode 100644
> > > > drivers/soc/starfive/Makefile  create mode 100644
> > > > drivers/soc/starfive/socinfo/Kconfig
> > > >  create mode 100644 drivers/soc/starfive/socinfo/Makefile
> > > >  create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS index
> > > > 6f6aac7cea95..66175f453d20 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -25613,6 +25613,11 @@ S:	Maintained
> > > >  F:	drivers/reset/starfive/reset-starfive-jhb1*
> > > >  F:	include/dt-bindings/reset/starfive,jhb1*.h
> > > >
> > > > +STARFIVE JHB100 SOCINFO DRIVER
> > > > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > > > +S:	Maintained
> > > > +F:	drivers/soc/starfive/
> > >
> > > FWIW, this is not what I asked for in v1, this should remain the
> > > full path to the driver. I wanted you to add this directory back to
> > > the "STARFIVE SOC DRIVERS" entry, since it's me that'll be applying
> patches for this driver.
> >
> > Sorry, I misunderstood what you meant.
> >
> > >
> > > > +
> > > >  STARFIVE JHB100 SYSCON
> > > >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > > >  S:	Maintained
> > > > diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig index
> > > > a2d65adffb80..b3b01fc38139 100644
> > > > --- a/drivers/soc/Kconfig
> > > > +++ b/drivers/soc/Kconfig
> > > > @@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
> > > >  source "drivers/soc/rockchip/Kconfig"
> > > >  source "drivers/soc/samsung/Kconfig"
> > > >  source "drivers/soc/sophgo/Kconfig"
> > > > +source "drivers/soc/starfive/Kconfig"
> > > >  source "drivers/soc/sunxi/Kconfig"
> > > >  source "drivers/soc/tegra/Kconfig"
> >
> > [...]
> >
> > > > +	pr_info("StarFive %s SoC rev(%s)\n", attrs->soc_id,
> > > > +attrs->revision);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +early_initcall(starfive_socinfo_init);
> > >
> > > Does this really need to be an early initcall btw?
> >
> > Yes, there are some drivers that need to use soc_device_match() to
> > match different revisions, in order to handle the processes caused by
> differences between revisions.
> > So there's no harm in initializing this driver earlier.
> 
> Other socinfo drivers use device_initcall, can you use that instead?

This is at the same priority level as most drivers. If some drivers use
 soc_device_match() and are registered earlier than this driver, issues
 may arise. It might be possible to lower the level by using subsys_initcall.

What do you think?

Best Regards,
Changhuang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
