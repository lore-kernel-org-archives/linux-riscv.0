Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83D0C41535
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 01:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cn4+irfgAbNDP61WGe21B1/p0ZemBpmP2naWhBABJNI=; b=21DmIYLJzxPU/J
	hq3ONEmgp3XJawmVD5YdnOcJ3qIiMV8Q3fzagmNtMXFlUIcaw9EOdJOMJJbcncumZSNGze6iQRgEs
	EvLvuHlJHwtDzLeIpt0yZnXghy2eeOoBKOA6hnslP+iYhCeDt21s79VzgT33QUR+ZlWP2AsHjJIb4
	YSxAByDmxR0VMzuMEkemBlafFJAG28Bd+BMwawsh15deRu9u1vzpwsiU4QtzAvG/EsiJ++1dle3ts
	FNXnxG2W9M0MbRdn1oyItyCLlv6afJdivcASF2B3h0BC0WthuPiPA3mQUT2oaU1e0SKL81CL+9I67
	4mrOKqrsveCSi0Mg1XAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlZR-00Fv7r-2u;
	Wed, 20 Dec 2023 01:40:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFlZN-00Fv3k-2c
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 01:40:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1B9EC8008;
	Wed, 20 Dec 2023 09:39:58 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 20 Dec
 2023 09:39:58 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 20 Dec
 2023 09:39:36 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 20 Dec 2023 09:39:36 +0800
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
Thread-Index: AQHaKDp8qa+gHWDJHkGDh0MGWRuwVrCfD58AgAXCtdCAAc4FgIAK2SJw
Date: Wed, 20 Dec 2023 01:39:36 +0000
Message-ID: <07a8ac42184f440fae1b0d13db4e43cc@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-7-jeeheng.sia@starfivetech.com>
 <CAJM55Z_VgBGvCPuvwmQahMcMfuWKnOKpZ9bBbbhei_Teu5Apeg@mail.gmail.com>
 <9ae86c6786bc4ac7b93c971ba00084a6@EXMBX066.cuchost.com>
 <CAJM55Z9GVFGuwqe=zLXQvBwDfVSz4eA2EXDd4sqWVCKJF2J+fg@mail.gmail.com>
In-Reply-To: <CAJM55Z9GVFGuwqe=zLXQvBwDfVSz4eA2EXDd4sqWVCKJF2J+fg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [175.136.135.142]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_174022_285463_FD2D9D5E 
X-CRM114-Status: GOOD (  40.72  )
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
> Sent: Wednesday, December 13, 2023 7:57 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; Emil Renner Berthing <emil.renner.berthing@canonical.com>; kernel@esmil.dk;
> conor@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> 
> JeeHeng Sia wrote:
> > > -----Original Message-----
> > > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > Sent: Saturday, December 9, 2023 12:25 AM
> > > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> > > krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> > > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> > > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon
> Tan
> > > <leyfoon.tan@starfivetech.com>
> > > Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> > >
> > > Sia Jee Heng wrote:
> > > > Add support for JH8100 System clock generator.
> > > >
> > > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > > ---
> > > >  MAINTAINERS                                   |   8 +
> > > >  drivers/clk/starfive/Kconfig                  |   9 +
> > > >  drivers/clk/starfive/Makefile                 |   1 +
> > > >  drivers/clk/starfive/clk-starfive-common.h    |   9 +-
> > > >  drivers/clk/starfive/jh8100/Makefile          |   3 +
> > > >  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
> > > >  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++++++
> > > >  7 files changed, 495 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/clk/starfive/jh8100/Makefile
> > > >  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
> > > >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
> ...
> > > > diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> > > > index 012f7ee83f8e..6cb3ce823330 100644
> > > > --- a/drivers/clk/starfive/Makefile
> > > > +++ b/drivers/clk/starfive/Makefile
> > > > @@ -10,3 +10,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
> > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
> > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
> > > > +obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)	+= jh8100/
> > >
> > > I don't really see why do you need a special subdirectory for the JH8100? The
> > > JH7110 drivers do fine without it.
> > Each subfolder can represent a different platform, making it easier to
> > locate and maintain platform-specific code. Since the code is expected
> > to grow in the future, let's start organizing it in a folder-based structure
> > for easier maintenance at a later stage.
> 
> Yes, but that's not what you're doing here. You're making just one of the 3
> almost identical drivers be different for no good reason.
> 
> > > > diff --git a/drivers/clk/starfive/clk-starfive-common.h b/drivers/clk/starfive/clk-starfive-common.h
> > > > index fed45311360c..ec30af0658cf 100644
> > > > --- a/drivers/clk/starfive/clk-starfive-common.h
> > > > +++ b/drivers/clk/starfive/clk-starfive-common.h
> > > > @@ -103,6 +103,13 @@ struct starfive_clk_data {
> > > >  	.parents = { [0] = _parent },						\
> > > >  }
> > > >
> > > > +#define STARFIVE_GINV(_idx, _name, _flags, _parent)[_idx] = {			\
> > > > +	.name = _name,								\
> > > > +	.flags = _flags,							\
> > > > +	.max = STARFIVE_CLK_ENABLE | STARFIVE_CLK_INVERT,			\
> > > > +	.parents = { [0] = _parent },						\
> > > > +}
> > > > +
> > > >  struct starfive_clk {
> > > >  	struct clk_hw hw;
> > > >  	unsigned int idx;
> > > > @@ -114,7 +121,7 @@ struct starfive_clk_priv {
> > > >  	spinlock_t rmw_lock;
> > > >  	struct device *dev;
> > > >  	void __iomem *base;
> > > > -	struct clk_hw *pll[3];
> > > > +	struct clk_hw *pll[8];
> > >
> > > These extra slots are just used for fixed factor dummy PLLs right now, similar
> > > to how the JH7110 first used them and later had to rework drivers and device
> > > trees for the proper PLL driver.
> > Yes, its intention is similar to JH8100. We will submit other clock
> > domains and PLL at later stage but not so soon.
> > >
> > > This time around I'd much rather you work on getting the PLL driver in first,
> > > so we don't need all that churn.
> > I am sorry but we started development on FPGA. Unfortunately, the PLL driver
> > and other domains are planned to be finished at a later stage. I have tried
> > to minimize the churn as much as possible.
> 
> It's awesome that you're beginning upstreaming early, but if you don't have
> this in silicon yet, how do you even know that this driver works?
> 
> If you're just using this for testing on FPGAs you can create dummy fixed
> clocks in the device tree for the PLLs that this driver can consume.  Then
> later when you have a PLL driver you can replace those fixed clocks with the
> output of that driver.
The PLL fixed clocks were created in the C code. I interpret this message
as a suggestion to create a PLL fixed clock in the DT?
> 
> /Emil
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
