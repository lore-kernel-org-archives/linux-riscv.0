Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB6C369A2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgPW0Cq8S9t6XgDyPZ8bCr9P1jA/FY6oo24rN8RzT8U=; b=hSz6s1nNVhReI1
	EBAFJHFHU9cA5rm2mVP7bqerzB13Mp/GjSJhBa1fC2ZdA2TKuckLuEbPpnu47G2y4O9ArnasR+/Un
	niZL/FCFtluGQoIJogOJgq1QipB1idy/4W0xrXb9Bzjll0GsUba/9f5JMiFlZE8iW+4t0EcybCyR4
	/D/1XI4TXVGGAkpROGgrai5QK1TfdT3uwprtkSbjdtqpurs0wiJJf2NafZAahODJELwvsWsigkrWQ
	8sA78Hb+aqO46Qpg+ovYLfISKYXGBY9p0rs777SKdSc600e9EcR7m2rWSnV79JyFe10HmPg1e/6u+
	ajreASsJogJG7I63XxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gXX-00000008ung-2zVR;
	Thu, 10 Apr 2025 01:17:11 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gWe-00000008ueY-2sFh
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 01:16:18 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2F9F5343294;
	Thu, 10 Apr 2025 01:16:14 +0000 (UTC)
Date: Thu, 10 Apr 2025 01:16:11 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
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
Message-ID: <20250410011611-GYC19359@gentoo>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_181616_747632_C7B9E80D 
X-CRM114-Status: GOOD (  30.07  )
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

Hi Inochi,

On 08:57 Thu 10 Apr     , Inochi Amaoto wrote:
> On Thu, Apr 10, 2025 at 08:54:51AM +0800, Inochi Amaoto wrote:
> > On Thu, Apr 10, 2025 at 12:37:56AM +0000, Yixun Lan wrote:
> > > On 14:37 Tue 08 Apr     , Alex Elder wrote:
> > > > On 4/1/25 12:24 PM, Haylen Chu wrote:
> > > > > The clock tree of K1 SoC contains three main types of clock hardware
> > > > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > > > 
> > > > > All register operations are done through regmap to ensure atomiciy
> > > > > between concurrent operations of clock driver and reset,
> > > > > power-domain driver that will be introduced in the future.
> > > > > 
> > > > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > > 
> > > > I have a few more comments here but I think this is getting very
> > > > close to ready.  You addressed pretty much everything I mentioned.
> > > > 
> > > > > ---
> > > > >   drivers/clk/Kconfig               |    1 +
> > > > >   drivers/clk/Makefile              |    1 +
> > > > >   drivers/clk/spacemit/Kconfig      |   18 +
> > > > >   drivers/clk/spacemit/Makefile     |    5 +
> > > > >   drivers/clk/spacemit/apbc_clks    |  100 +++
> > > > >   drivers/clk/spacemit/ccu-k1.c     | 1316 +++++++++++++++++++++++++++++
> > > > >   drivers/clk/spacemit/ccu_common.h |   48 ++
> > > > >   drivers/clk/spacemit/ccu_ddn.c    |   83 ++
> > > > >   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
> > > > >   drivers/clk/spacemit/ccu_mix.c    |  268 ++++++
> > > > >   drivers/clk/spacemit/ccu_mix.h    |  218 +++++
> > > > >   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
> > > > >   drivers/clk/spacemit/ccu_pll.h    |   86 ++
> > > > >   13 files changed, 2348 insertions(+)
> > > > >   create mode 100644 drivers/clk/spacemit/Kconfig
> > > > >   create mode 100644 drivers/clk/spacemit/Makefile
> > > > >   create mode 100644 drivers/clk/spacemit/apbc_clks
> > > > >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > > > >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > > > 
> > > > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > > > index 713573b6c86c..19c1ed280fd7 100644
> > > > > --- a/drivers/clk/Kconfig
> > > > > +++ b/drivers/clk/Kconfig
> > > > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > > > >   source "drivers/clk/sifive/Kconfig"
> > > > >   source "drivers/clk/socfpga/Kconfig"
> > > > >   source "drivers/clk/sophgo/Kconfig"
> > > > > +source "drivers/clk/spacemit/Kconfig"
> > > > >   source "drivers/clk/sprd/Kconfig"
> > > > >   source "drivers/clk/starfive/Kconfig"
> > > > >   source "drivers/clk/sunxi/Kconfig"
> > > > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > > > index bf4bd45adc3a..42867cd37c33 100644
> > > > > --- a/drivers/clk/Makefile
> > > > > +++ b/drivers/clk/Makefile
> > > > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > > > >   obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > > > >   obj-y					+= socfpga/
> > > > >   obj-y					+= sophgo/
> > > > > +obj-y					+= spacemit/
> > > > >   obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > > > >   obj-y					+= sprd/
> > > > >   obj-$(CONFIG_ARCH_STI)			+= st/
> > > > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > > > new file mode 100644
> > > > > index 000000000000..4c4df845b3cb
> > > > > --- /dev/null
> > > > > +++ b/drivers/clk/spacemit/Kconfig
> > > > > @@ -0,0 +1,18 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > +
> > > > > +config SPACEMIT_CCU
> > > > > +	tristate "Clock support for SpacemiT SoCs"
> > > > 
> > > > I don't know the answer to this, but...  Should this be a Boolean
> > > > rather than tristate?  Can a SpacemiT K1 SoC function without the
> > > > clock driver built in to the kernel?
> > > > 
> > > I agree to make it a Boolean, we've already made pinctrl driver Boolean
> > > and pinctrl depend on clk, besides, the SoC is unlikely functional
> > > without clock built in as it's such critical..
> > > 
> > 
> > I disagree. The kernel is only for spacemit only, and the pinctrl
> 
> Sorry for a mistake, this first "only" should be "not".
> 
> > should also be a module. It is the builder's right to decide whether
> > the driver is builtin or a module. In this view, you should always
> > allow the driver to be built as a module if possible.
> > 
No, we've already made pinctrl as Boolean (still depend on ARCH_SPACEMIT)
if people don't want this feature, he/she can disable CONFIG_ARCH_SPACEMIT

https://github.com/torvalds/linux/blob/master/drivers/pinctrl/spacemit/Kconfig#L7
-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
