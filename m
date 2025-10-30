Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B690CCF9FC
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQnG5e9qATRq8e4DpA2I//zrhwrjsVkr+F1SGiiJOZM=; b=yv4aHxiMngrWY0
	sDGWAbdfioMa04d1TMixZ5GgEdnEpOILdh/rWfGVVWeB20U0dbyKez6s4VLKfVjgj7GOr4MPnFtXx
	gc4RJRrQEdUncKmIZ56uTop2wlNs0SFybFNJmF4N35YEtL2Dr/CuyjxEDU/oKUONantVDutvdo45l
	znMtadM1eEglqeLIgzAyFpZn4t/irga7TlsZGayAyVKhMm1waGxp5jp9z5qWPZRVUm56ms5pKZCKd
	XYNC7SEYIHxfI8cOO+qs8AKvAIhQuULHn50tAgBhp1KPb9WP3xFFehmsaLxOgNcclQ1lXEiOQQx6t
	kyBlgNsxRmeC3FXO06Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEStT-00000004DA9-0q9j;
	Thu, 30 Oct 2025 13:40:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEStQ-00000004D9f-45Md
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 13:40:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEStC-0002QT-NZ; Thu, 30 Oct 2025 14:40:30 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEStC-006DiW-0z;
	Thu, 30 Oct 2025 14:40:30 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vEStC-00000000AGH-0uQV;
	Thu, 30 Oct 2025 14:40:30 +0100
Message-ID: <4e3c3c3d6c1a0d2905a90e5f1c0b2cb8f67bc43b.camel@pengutronix.de>
Subject: Re: [PATCH v6 1/7] reset: mpfs: add non-auxiliary bus probing
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, claudiu.beznea@tuxon.dev
Cc: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	 <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, 
	valentina.fernandezalanis@microchip.com, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 30 Oct 2025 14:40:30 +0100
In-Reply-To: <20251029-macarena-neglector-318431fec367@spud>
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
	 <20251029-macarena-neglector-318431fec367@spud>
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_064045_033876_9855F53B 
X-CRM114-Status: GOOD (  24.98  )
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

On Mi, 2025-10-29 at 16:11 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While the auxiliary bus was a nice bandaid, and meant that re-writing
> the representation of the clock regions in devicetree was not required,
> it has run its course. The "mss_top_sysreg" region that contains the
> clock and reset regions, also contains pinctrl and an interrupt
> controller, so the time has come rewrite the devicetree and probe the
> reset controller from an mfd devicetree node, rather than implement
> those drivers using the auxiliary bus. Wanting to avoid propagating this
> naive/incorrect description of the hardware to the new pic64gx SoC is a
> major motivating factor here.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v6:
> - depend on MFD_SYSCON
> - return regmap_update_bits() result directly instead of an additional
>   return 0
> 
> v4:
> - Only use driver specific lock for non-regmap writes
> 
> v2:
> - Implement the request to use regmap_update_bits(). I found that I then
>   hated the read/write helpers since they were just bloat, so I ripped
>   them out. I replaced the regular spin_lock_irqsave() stuff with a
>   guard(spinlock_irqsave), since that's a simpler way of handling the two
>   different paths through such a trivial pair of functions.
> ---
>  drivers/reset/Kconfig      |  1 +
>  drivers/reset/reset-mpfs.c | 79 ++++++++++++++++++++++++++++++--------
>  2 files changed, 63 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 78b7078478d4..0ec4b7cd08d6 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -200,6 +200,7 @@ config RESET_PISTACHIO
>  config RESET_POLARFIRE_SOC
>  	bool "Microchip PolarFire SoC (MPFS) Reset Driver"
>  	depends on MCHP_CLK_MPFS
> +	depends on MFD_SYSCON
>  	select AUXILIARY_BUS
>  	default MCHP_CLK_MPFS
>  	help
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index f6fa10e03ea8..25de7df55301 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -7,13 +7,16 @@
>   *
>   */
>  #include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> -#include <linux/slab.h>
> +#include <linux/regmap.h>
>  #include <linux/reset-controller.h>
> +#include <linux/slab.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
>  #include <soc/microchip/mpfs.h>
>  
> @@ -27,11 +30,14 @@
>  #define MPFS_SLEEP_MIN_US	100
>  #define MPFS_SLEEP_MAX_US	200
>  
> +#define REG_SUBBLK_RESET_CR	0x88u
> +
>  /* block concurrent access to the soft reset register */
>  static DEFINE_SPINLOCK(mpfs_reset_lock);
>  
>  struct mpfs_reset {
>  	void __iomem *base;
> +	struct regmap *regmap;
>  	struct reset_controller_dev rcdev;
>  };
>  
> @@ -46,41 +52,46 @@ static inline struct mpfs_reset *to_mpfs_reset(struct reset_controller_dev *rcde
>  static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
>  
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	if (rst->regmap)
> +		return regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), BIT(id));

This could use regmap_set_bits().

> +
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
>  
>  	reg = readl(rst->base);
>  	reg |= BIT(id);
>  	writel(reg, rst->base);

Since I've just seen this in the i.MX8ULP series [1], it would be
cleaner to convert the aux driver to regmap as well. The readl/writel()
code paths could be dropped then.

[1] https://lore.kernel.org/lkml/20251029135229.890-1-laurentiumihalcea111@gmail.com/

[...]
>  static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
>  
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	if (rst->regmap)
> +		return regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), 0);

And this could use regmap_clear_bits().

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
