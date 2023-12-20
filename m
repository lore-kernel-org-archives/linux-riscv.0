Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38ECC41535
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 01:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqYs6lIAAhVkimEBciHY2/QsMwt2kibF2kQ8Sdl8Ado=; b=qxbfKNREUsOGi/
	3/GikLmYOXOcH1rsgqJ5Mcb1zOCVNYDpyjkCoI6/YzlWQ3VPg8UIQm7dD89tHKPusxtGJsulZ3Neb
	mkJpB0jEMfmKWLYZxCyxvX/Tyci/f8OvEY1Neb9bYNshVAIBJoybcFvwYj/afLwtLK1z5icZbDBd4
	EqbzEoVwMzGRjLU0cY6sdXb/gfKkK/QTL70nGfpkUW1pea1N5OpCO7EPBQVUQOw/wAJYb6nVrmpMF
	KyvYxrwrxNhZ7/yo16Y8JyxxmPJJG2p6QZp58NXzZG6Aie9DknsFq6H6mebcQB++IYlFaxTH1ZXOL
	mHByIUxNpLHXJ5yQdZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlUv-00FuZz-0t;
	Wed, 20 Dec 2023 01:35:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlUs-00FuVa-08
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 01:35:44 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1408124DBFD;
	Wed, 20 Dec 2023 09:35:16 +0800 (CST)
Received: from EXMBX063.cuchost.com (172.16.7.63) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 20 Dec
 2023 09:35:15 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX063.cuchost.com
 (172.16.7.63) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 20 Dec
 2023 09:35:15 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 20 Dec 2023 09:35:15 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"kernel@esmil.dk" <kernel@esmil.dk>, "conor@kernel.org" <conor@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "Hal
 Feng" <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator
 driver
Thread-Topic: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock
 generator driver
Thread-Index: AQHaKDp8qa+gHWDJHkGDh0MGWRuwVrCfD58AgAXCtdCAAc4FgIAJXVZwgABwgACAAQqwwA==
Date: Wed, 20 Dec 2023 01:35:15 +0000
Message-ID: <88f5651b913d4b2f9e9c76ecf8429aac@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-7-jeeheng.sia@starfivetech.com>
 <CAJM55Z_VgBGvCPuvwmQahMcMfuWKnOKpZ9bBbbhei_Teu5Apeg@mail.gmail.com>
 <9ae86c6786bc4ac7b93c971ba00084a6@EXMBX066.cuchost.com>
 <CAJM55Z9GVFGuwqe=zLXQvBwDfVSz4eA2EXDd4sqWVCKJF2J+fg@mail.gmail.com>
 <d35d3cf480064c69b1125ba07d615446@EXMBX066.cuchost.com>
 <CAJM55Z_XZVBKr05X4QeCeDO_iMZh-FbKsikcNsDPK7iKuVEodw@mail.gmail.com>
In-Reply-To: <CAJM55Z_XZVBKr05X4QeCeDO_iMZh-FbKsikcNsDPK7iKuVEodw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [175.136.135.142]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_173542_371499_32477E51 
X-CRM114-Status: GOOD (  26.96  )
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



> -----Original Message-----
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Sent: Wednesday, December 20, 2023 1:40 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; Emil Renner Berthing <emil.renner.berthing@canonical.com>; kernel@esmil.dk;
> conor@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> 
> JeeHeng Sia wrote:
> >
> >
> > > -----Original Message-----
> > > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > Sent: Wednesday, December 13, 2023 7:57 PM
> > > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; Emil Renner Berthing <emil.renner.berthing@canonical.com>; kernel@esmil.dk;
> > > conor@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com;
> > > aou@eecs.berkeley.edu; mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; Hal Feng
> > > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon
> Tan
> > > <leyfoon.tan@starfivetech.com>
> > > Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> > >
> > > JeeHeng Sia wrote:
> > > > > -----Original Message-----
> > > > > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > > Sent: Saturday, December 9, 2023 12:25 AM
> > > > > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> > > > > krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> > > > > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> > > > > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > > > > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org;
> Leyfoon
> > > Tan
> > > > > <leyfoon.tan@starfivetech.com>
> > > > > Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> > > > >
> > > > > Sia Jee Heng wrote:
> > > > > > Add support for JH8100 System clock generator.
> > > > > >
> > > > > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > > > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > > > > ---
> > > > > >  MAINTAINERS                                   |   8 +
> > > > > >  drivers/clk/starfive/Kconfig                  |   9 +
> > > > > >  drivers/clk/starfive/Makefile                 |   1 +
> > > > > >  drivers/clk/starfive/clk-starfive-common.h    |   9 +-
> > > > > >  drivers/clk/starfive/jh8100/Makefile          |   3 +
> > > > > >  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
> > > > > >  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++++++
> > > > > >  7 files changed, 495 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 drivers/clk/starfive/jh8100/Makefile
> > > > > >  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
> > > > > >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
> > > ...
> > > > > > diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> > > > > > index 012f7ee83f8e..6cb3ce823330 100644
> > > > > > --- a/drivers/clk/starfive/Makefile
> > > > > > +++ b/drivers/clk/starfive/Makefile
> > > > > > @@ -10,3 +10,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
> > > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
> > > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> > > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
> > > > > > +obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)	+= jh8100/
> > > > >
> > > > > I don't really see why do you need a special subdirectory for the JH8100? The
> > > > > JH7110 drivers do fine without it.
> > > > Each subfolder can represent a different platform, making it easier to
> > > > locate and maintain platform-specific code. Since the code is expected
> > > > to grow in the future, let's start organizing it in a folder-based structure
> > > > for easier maintenance at a later stage.
> > >
> > > Yes, but that's not what you're doing here. You're making just one of the 3
> > > almost identical drivers be different for no good reason.
> > I will restructure it for the other 2 platforms.
> 
> That would be less bad, but you still haven't explained why you need to move
> everything around like that:
> https://lore.kernel.org/linux-riscv/CAJM55Z_3Mty2LftPVkQC1wbwtGeznMMAk9mAjH_GoNuL7CKtaQ@mail.gmail.com/
> 
> I don't think just "too many files" is a very good argument here. Just look at
> drivers/clk/sunxi
Thanks. Given that the trend is not to use subfolders to differentiate the platform
clock driver, I am okay with removing the subfolder and following the naming
convention from the JH71xx's file name.
> 
> /Emil
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
