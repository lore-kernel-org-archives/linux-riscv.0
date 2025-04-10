Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFA5C369A5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 00:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ttqe/Uv23Vq4E3IPpz69BbCwMtYWOHR6NSH2ehmyR70=; b=UnvU47JP2o3Sxd
	2JNtfkxxWOzg/GwxYAZXWpVrOtY/3hSDi/0Efs03BWkRktyiZNP6n/QSM3BV8qpCe6tPpz2kZTOau
	tvhnpohdTCUKh+FpcMF8/tnQVkRCKwKmgVSi5AE2QiHwiUZml9YoubNjny574D/BNf/1JiG+0maZ1
	PTrkJvyb+79rxmuriAwP9KTBycTBwmP7hXgbpq99g5IgN9VmeJzT8h7N9lUGJD5yGfqY1qkIo5SC+
	q8xLQSMZgKGoqpZHnv7yPLRyYYfFhcwN2cS23yGxwCE2IgHrUbzKUwe1153mkDOxVqygHJ099BWYC
	XlvWGx1Tsf0f70fUdb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2fvh-00000008qZg-43Lp;
	Thu, 10 Apr 2025 00:38:05 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2fvg-00000008qZ6-08BL
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 00:38:05 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 12FDC3432CF;
	Thu, 10 Apr 2025 00:38:00 +0000 (UTC)
Date: Thu, 10 Apr 2025 00:37:56 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <20250410003756-GYA19359@gentoo>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_173804_131135_895D94EE 
X-CRM114-Status: GOOD (  29.16  )
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

On 14:37 Tue 08 Apr     , Alex Elder wrote:
> On 4/1/25 12:24 PM, Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and has control registers split into several multifunction
> > devices: APBS (PLLs), MPMU, APBC and APMU.
> > 
> > All register operations are done through regmap to ensure atomiciy
> > between concurrent operations of clock driver and reset,
> > power-domain driver that will be introduced in the future.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 
> I have a few more comments here but I think this is getting very
> close to ready.  You addressed pretty much everything I mentioned.
> 
> > ---
> >   drivers/clk/Kconfig               |    1 +
> >   drivers/clk/Makefile              |    1 +
> >   drivers/clk/spacemit/Kconfig      |   18 +
> >   drivers/clk/spacemit/Makefile     |    5 +
> >   drivers/clk/spacemit/apbc_clks    |  100 +++
> >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> >   drivers/clk/spacemit/ccu_common.h |   48 ++
> >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> >   13 files changed, 2348 insertions(+)
> >   create mode 100644 drivers/clk/spacemit/Kconfig
> >   create mode 100644 drivers/clk/spacemit/Makefile
> >   create mode 100644 drivers/clk/spacemit/apbc_clks
> >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 713573b6c86c..19c1ed280fd7 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> >   source "drivers/clk/sifive/Kconfig"
> >   source "drivers/clk/socfpga/Kconfig"
> >   source "drivers/clk/sophgo/Kconfig"
> > +source "drivers/clk/spacemit/Kconfig"
> >   source "drivers/clk/sprd/Kconfig"
> >   source "drivers/clk/starfive/Kconfig"
> >   source "drivers/clk/sunxi/Kconfig"
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index bf4bd45adc3a..42867cd37c33 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> >   obj-y					+= socfpga/
> >   obj-y					+= sophgo/
> > +obj-y					+= spacemit/
> >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> >   obj-y					+= sprd/
> >   obj-$(CONFIG_ARCH_STI)			+= st/
> > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > new file mode 100644
> > index 000000000000..4c4df845b3cb
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/Kconfig
> > @@ -0,0 +1,18 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config SPACEMIT_CCU
> > +	tristate "Clock support for SpacemiT SoCs"
> 
> I don't know the answer to this, but...  Should this be a Boolean
> rather than tristate?  Can a SpacemiT K1 SoC function without the
> clock driver built in to the kernel?
> 
I agree to make it a Boolean, we've already made pinctrl driver Boolean
and pinctrl depend on clk, besides, the SoC is unlikely functional
without clock built in as it's such critical..

> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > +	select MFD_SYSCON
> > +	help
> > +	  Say Y to enable clock controller unit support for SpacemiT SoCs.
> > +
> > +if SPACEMIT_CCU
> > +
> > +config SPACEMIT_K1_CCU
> > +	tristate "Support for SpacemiT K1 SoC"
> 
> If you decide SPACEMIT_CCU needs to be Boolean, this one should
> be Boolean too.
> 
[...] 
> > +	CCU_PLL_RATE(1600000000UL, 0x0050cd61, 0x43eaaaab),
> > +	CCU_PLL_RATE(1800000000UL, 0x0050cd61, 0x4b000000),
> > +	CCU_PLL_RATE(2000000000UL, 0x0050dd62, 0x2aeaaaab),
> > +	CCU_PLL_RATE(2457600000UL, 0x0050dd64, 0x330ccccd),
> > +	CCU_PLL_RATE(3000000000UL, 0x0050dd66, 0x3fe00000),
> > +	CCU_PLL_RATE(3200000000UL, 0x0050dd67, 0x43eaaaab),
> > +};
> > +
> > +CCU_PLL_DEFINE(pll1, pll1_rate_tbl, APBS_PLL1_SWCR1, APBS_PLL1_SWCR3, MPMU_POSR,
> > +	       POSR_PLL1_LOCK, CLK_SET_RATE_GATE);
> > +CCU_PLL_DEFINE(pll2, pll2_rate_tbl, APBS_PLL2_SWCR1, APBS_PLL2_SWCR3, MPMU_POSR,
> > +	       POSR_PLL2_LOCK, CLK_SET_RATE_GATE);
> > +CCU_PLL_DEFINE(pll3, pll3_rate_tbl, APBS_PLL3_SWCR1, APBS_PLL3_SWCR3, MPMU_POSR,
> > +	       POSR_PLL3_LOCK, CLK_SET_RATE_GATE);
> > +
> 
> I suspect Yixun would like you to have lines like the next one be
> 84 characters wide--slighly wider than the 80 column limit.
> 
> I'm not going to ask you to change it (but he might).
> 
Yes, I do prefer 100 cloumn.. please check more of this files

But anyway, I can bear with it if clk subsystem maintainer have enforced
80 column policy for the whole clk subsystem, to make consistent

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
