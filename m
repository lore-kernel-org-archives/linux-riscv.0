Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74826CCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nC69FvPt5s3cARuHvnrBmcV1Xl5pUzxhAF1OuZJvtoM=; b=4lvuyUJFOany4c
	v9w84Tz4KYZiW6EGalyVZ46gjm48kxW6fl/qDn+Oaw2ZQplGmmRMHv67kw3HjnjuNe3SWqIL1jVDq
	oAGMgIg74gtGFAlhTQOy+YNKDCw8fYSwGMqzNTPVDQeUCSht+SU5Wkyd1BRKwFWtVGIGFDRrbmESe
	sY8PyXkf7Y08nRmNR7HxnJrHfaByNuomnj734f4WnsoLO3nQK+eSUg53Iorsl4irumIqauxMeKMUO
	vbjEmVvv4GxVPuzuhwZjkG7V58GTWro0DtsaGM/g0x4mXvmCpy6mTfhdNXmfkAZwEsVP89e5E5jYj
	cPOM6MTePPUSDZlOx0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQAM-00000005KPf-0VRs;
	Mon, 10 Nov 2025 11:34:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQAJ-00000005KP4-2Ell
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 11:34:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIQA5-00029j-Da; Mon, 10 Nov 2025 12:34:17 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIQA5-0080xe-0H;
	Mon, 10 Nov 2025 12:34:17 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIQA4-000000009M4-4BQp;
	Mon, 10 Nov 2025 12:34:17 +0100
Message-ID: <2fabead977bee651800790f6b0d6323ffdc372c5.camel@pengutronix.de>
Subject: Re: [PATCH v7 1/5] reset: mpfs: add non-auxiliary bus probing
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, claudiu.beznea@tuxon.dev
Cc: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	 <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, 
	valentina.fernandezalanis@microchip.com, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 12:34:16 +0100
In-Reply-To: <20251110-evict-gratified-bb816e2799a2@spud>
References: <20251110-zookeeper-femur-68a0ae346397@spud>
	 <20251110-evict-gratified-bb816e2799a2@spud>
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_033431_574340_5DA0B099 
X-CRM114-Status: GOOD (  27.28  )
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

On Mo, 2025-11-10 at 11:23 +0000, Conor Dooley wrote:
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
> v7:
> - move entirely to regmap
> - use clear/set instead of update
> 
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
>  drivers/clk/microchip/clk-mpfs.c |  4 +-
>  drivers/reset/Kconfig            |  1 +
>  drivers/reset/reset-mpfs.c       | 92 +++++++++++++++++++-------------
>  include/soc/microchip/mpfs.h     |  3 +-
>  4 files changed, 61 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 484893e68b67..ee58304913ef 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -38,7 +38,7 @@ static const struct regmap_config mpfs_clk_regmap_config = {
>  	.reg_stride = 4,
>  	.val_bits = 32,
>  	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> -	.max_register = REG_SUBBLK_CLOCK_CR,
> +	.max_register = REG_SUBBLK_RESET_CR,
>  };
>  
>  /*
> @@ -502,7 +502,7 @@ static inline int mpfs_clk_old_format_probe(struct mpfs_clock_data *clk_data,
>  	if (IS_ERR(clk_data->regmap))
>  		return PTR_ERR(clk_data->regmap);
>  
> -	return mpfs_reset_controller_register(dev, clk_data->base + REG_SUBBLK_RESET_CR);
> +	return mpfs_reset_controller_register(dev, clk_data->regmap);
>  }
>  
>  static int mpfs_clk_probe(struct platform_device *pdev)
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
> index f6fa10e03ea8..d00212450990 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -7,13 +7,16 @@
>   *
>   */
>  #include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>

Not used anymore.

[...] 
> @@ -176,12 +196,12 @@ static const struct auxiliary_device_id mpfs_reset_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
>  
> -static struct auxiliary_driver mpfs_reset_driver = {
> -	.probe		= mpfs_reset_probe,
> +static struct auxiliary_driver mpfs_reset_aux_driver = {
> +	.probe		= mpfs_reset_adev_probe,
>  	.id_table	= mpfs_reset_ids,
>  };
>  
> -module_auxiliary_driver(mpfs_reset_driver);
> +module_auxiliary_driver(mpfs_reset_aux_driver);
>  
>  MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
>  MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
> index 0bd67e10b704..ec04c98a8b63 100644
> --- a/include/soc/microchip/mpfs.h
> +++ b/include/soc/microchip/mpfs.h
> @@ -14,6 +14,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/of_device.h>
> +#include <linux/regmap.h>

You don't have to #include <linux/regmap.h> here, a forward declaration

  struct regmap;

would suffice.
 
>  struct mpfs_sys_controller;
>  
> @@ -44,7 +45,7 @@ struct mtd_info *mpfs_sys_controller_get_flash(struct mpfs_sys_controller *mpfs_
>  
>  #if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
>  #if IS_ENABLED(CONFIG_RESET_POLARFIRE_SOC)
> -int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base);
> +int mpfs_reset_controller_register(struct device *clk_dev, struct regmap *map);
>  #else
>  static inline int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base) { return 0; }
>  #endif /* if IS_ENABLED(CONFIG_RESET_POLARFIRE_SOC) */

With the superfluous cleanup include fixed.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

and

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be merged with the reset of the series.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
