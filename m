Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F3EC28B30
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Mar 2025 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkgH/sYKiGQs8YNdan1JiWGjRwcWUU8ypXD8O4jrgB4=; b=KbYIrj2xgLte/4
	TfdVOY8GeMFqYa4EiIbSxRmy+YB1uoIjCtxwCQpwahnk8yyipfGLHx4u+U5Ft33cAu6u0aaM2k5A6
	PGmkIQUyGVzgIk/gVRqgWGAbORwBWJ0M+bUd0Kb2AcpycawIHQBEmWgT+POAkMZof66m/20OqVRqs
	HMI6D9h/0Btk1LdowA6SaKAAxlQpiPxf01ZthDEEiV/IuRx4BXpQXw0ZcHh920HQNm6gMjuiQVnDy
	fAN8t99EbADLr8bm3mMjWG8VniQsHNfJblcQr2XhgR+msJ8Y5BmjjCL+RnJcQpLGjQFXH6Jx8M2y4
	880YOmm+6Wk3XUF1F0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twH7W-00000000uhO-38FI;
	Sun, 23 Mar 2025 08:55:50 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twH7T-00000000ugp-0Izr
	for linux-riscv@lists.infradead.org;
	Sun, 23 Mar 2025 08:55:48 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 67FEEEC59F1;
	Sun, 23 Mar 2025 01:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1742720143; bh=42KjRZG4Ec7xBTXyyzIFb+83EFkreEJzD1byDRrYTvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YB0GOurS6e7ntM1c3szslhrVmNfTs29qW3DmV+4LusNNm/ZbyPsW22qezs41sbOmi
	 Ny4wYzkogpnaK/lDgdomhH262gh1l0gCMIKIeH9v/0zD3Eq7NTZ9XbIUi9i3vB5wvt
	 UYbntCXgGgr/w2Y4lkeATFRgAD/zQr9PbYURbHuZO66z8MQwrfluHDwgzqis3RLRb9
	 FdsrvWv6O9MSbWvEO8y1YS/kTw4A+T7UDqVWlM+7krZn8dYOPd9R7DCnGN9Ct/rtfo
	 scuWnLfZ1ycbhEbCyyZFHKC7Jb44vmqFqKcpyUlw6HPaEjZGuFzNkOpP2XXX7L5ZS3
	 hnHNxcqmvj/Dw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxXVrxWgCf42; Sun, 23 Mar 2025 01:55:40 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 58C7DEC59EE;
	Sun, 23 Mar 2025 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1742720140; bh=42KjRZG4Ec7xBTXyyzIFb+83EFkreEJzD1byDRrYTvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NCQDlCUcrc4vhN8OBM1cEf/Rw4Catjgu4eGkIeUvAN8bFaEzI8TBhnHzzvDGmYclf
	 PPhmMpX7zIrmDfxICl/VQ0B2nMb+X4LzAEslEZga5vKaLZoHyMXO5ivn3K+UgTpiTN
	 kGiit+2e9HxwtIs4sXD8doRmPzhC9bWR7jfIF/yjCiJLaGHOh+JGH7FYHuwPv9xeBO
	 4st5JpY68yfbJuljaEgSgQYJ4okfB/DfuMO5QpKLrXt5DgkFh+6tfS6RtAcoL30Sz4
	 TN6tvJ1SYgWkY0fOb88bQy/kPUo7mj/nO2rxj0xpcIVKRM+IaOAxEkX9968uLu0Oq8
	 sWkVC4OpSoTEQ==
Date: Sun, 23 Mar 2025 08:55:28 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 3/5] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <Z9_MgAZE53eQ-FV8@ketchup>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-5-heylenay@4d2.org>
 <20250318053736-GYA2516@gentoo>
 <xwo2jjqy634z4rimgyrbjmxlgzxzauxmqzl57qr5oasph74qwj@7we45fnhwfzh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xwo2jjqy634z4rimgyrbjmxlgzxzauxmqzl57qr5oasph74qwj@7we45fnhwfzh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_015547_454577_EE97FF13 
X-CRM114-Status: GOOD (  22.26  )
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

On Tue, Mar 18, 2025 at 01:43:52PM +0800, Inochi Amaoto wrote:
> On Tue, Mar 18, 2025 at 05:37:36AM +0000, Yixun Lan wrote:
> > Hi Haylen Chu:
> > 
> > On 17:57 Thu 06 Mar     , Haylen Chu wrote:
> > > The clock tree of K1 SoC contains three main types of clock hardware
> > > (PLL/DDN/MIX) and has control registers split into several multifunction
> > > devices: APBS (PLLs), MPMU, APBC and APMU.
> > > 
> > > All register operations are done through regmap to ensure atomiciy
> > > between concurrent operations of clock driver and reset,
> > > power-domain driver that will be introduced in the future.
> > > 
> > > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > > ---
> > >  drivers/clk/Kconfig               |    1 +
> > >  drivers/clk/Makefile              |    1 +
> > >  drivers/clk/spacemit/Kconfig      |   20 +
> > >  drivers/clk/spacemit/Makefile     |    5 +
> > >  drivers/clk/spacemit/ccu-k1.c     | 1714 +++++++++++++++++++++++++++++
> > >  drivers/clk/spacemit/ccu_common.h |   47 +
> > >  drivers/clk/spacemit/ccu_ddn.c    |   80 ++
> > >  drivers/clk/spacemit/ccu_ddn.h    |   48 +
> > >  drivers/clk/spacemit/ccu_mix.c    |  284 +++++
> > >  drivers/clk/spacemit/ccu_mix.h    |  246 +++++
> > >  drivers/clk/spacemit/ccu_pll.c    |  146 +++
> > >  drivers/clk/spacemit/ccu_pll.h    |   76 ++
> > >  12 files changed, 2668 insertions(+)
> > >  create mode 100644 drivers/clk/spacemit/Kconfig
> > >  create mode 100644 drivers/clk/spacemit/Makefile
> > >  create mode 100644 drivers/clk/spacemit/ccu-k1.c
> > >  create mode 100644 drivers/clk/spacemit/ccu_common.h
> > >  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> > >  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> > >  create mode 100644 drivers/clk/spacemit/ccu_mix.c
> > >  create mode 100644 drivers/clk/spacemit/ccu_mix.h
> > >  create mode 100644 drivers/clk/spacemit/ccu_pll.c
> > >  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > > 
> > > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > > index 713573b6c86c..19c1ed280fd7 100644
> > > --- a/drivers/clk/Kconfig
> > > +++ b/drivers/clk/Kconfig
> > > @@ -517,6 +517,7 @@ source "drivers/clk/samsung/Kconfig"
> > >  source "drivers/clk/sifive/Kconfig"
> > >  source "drivers/clk/socfpga/Kconfig"
> > >  source "drivers/clk/sophgo/Kconfig"
> > > +source "drivers/clk/spacemit/Kconfig"
> > >  source "drivers/clk/sprd/Kconfig"
> > >  source "drivers/clk/starfive/Kconfig"
> > >  source "drivers/clk/sunxi/Kconfig"
> > > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > > index bf4bd45adc3a..42867cd37c33 100644
> > > --- a/drivers/clk/Makefile
> > > +++ b/drivers/clk/Makefile
> > > @@ -145,6 +145,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
> > >  obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
> > >  obj-y					+= socfpga/
> > >  obj-y					+= sophgo/
> > > +obj-y					+= spacemit/
> > >  obj-$(CONFIG_PLAT_SPEAR)		+= spear/
> > >  obj-y					+= sprd/
> > >  obj-$(CONFIG_ARCH_STI)			+= st/
> > > diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
> > > new file mode 100644
> > > index 000000000000..76090cd85668
> > > --- /dev/null
> > > +++ b/drivers/clk/spacemit/Kconfig
> > > @@ -0,0 +1,20 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +

Hi Inochi, Yixun,

> > > +config SPACEMIT_CCU
> > > +	tristate "Clock support for Spacemit SoCs"
> > > +	default y
> > similar reason to pinctrl with these patches [1], [2]
> > I'd suggest switch to "bool + default ARCH_SPACEMIT" 
> > 
> > Link: https://lore.kernel.org/all/20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org [1]
> > Link: https://lore.kernel.org/all/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be [2]
> > 
> 
> Clk subsystem prefers no defalt and set it in defconfig,
> so should no default there.

Thanks for these hints, I will drop default and set the configuration in
defconfig, in which case it seems okay to keep it as bool.

> Regards,
> Inochi

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
