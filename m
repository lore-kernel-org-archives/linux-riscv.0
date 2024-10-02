Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EDDCF31B7
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHhsmn1jSqBBh4+rQ4y2S928tyg2nJkPSr6tLtI/4SA=; b=g+/H5DSZi3Wnej
	LnvA5D1Ud1G7TFM8fpOaXcpNuZ7tsBJAEMVLv1OpgJHqRWiuavKWDCADxybXp4M2KVl52iHI5mJEF
	LGoNCMf6lYYsKw9Hm4ZDOA2c4EXfRTVHTupdR9XxlRHhy266Zgbl6dzSRRbThkpFrN0WiBaXj10zw
	/aPe+FVc8ZJbYPHIY0No1jWgWcQ5ZYQeQgF4dpT7b1iHaW4g4dvYaQJk/4NW3v8BTfyTkAQgxpRPN
	VW3WEDlDYaAz7OKNdsTumi6aXp/Ny8JZh7Bb4GuLHJwFlVkxxOILdW/qsjPFE93oVWDLwyJo+OOjm
	YS6yxdk7mtWzzx9IrVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svy4S-00000005m3j-31nW;
	Wed, 02 Oct 2024 12:03:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svy1G-00000005l4y-1CL4
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 11:59:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svy0q-0001HD-Pn; Wed, 02 Oct 2024 13:59:24 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svy0p-0036LM-NJ; Wed, 02 Oct 2024 13:59:23 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svy0k-0007fY-1z;
	Wed, 02 Oct 2024 13:59:18 +0200
Message-ID: <07764ea71869cc1c1f95200bcb4e0888fd705dec.camel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] reset: mpfs: add non-auxiliary bus probing
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, 
 valentina.fernandezalanis@microchip.com, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome
 Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-riscv@lists.infradead.org,  linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 02 Oct 2024 13:59:18 +0200
In-Reply-To: <20241002-breeze-anywhere-4114da636ec6@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
	 <20241002-breeze-anywhere-4114da636ec6@spud>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_045950_353266_3CDAF277 
X-CRM114-Status: GOOD (  20.00  )
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

On Mi, 2024-10-02 at 11:48 +0100, Conor Dooley wrote:
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
>  drivers/reset/reset-mpfs.c | 83 ++++++++++++++++++++++++++++++++------
>  1 file changed, 71 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index 710f9c1676f93..ac72e0fc405ed 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -9,10 +9,12 @@
>  #include <linux/auxiliary_bus.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
>  #include <soc/microchip/mpfs.h>
> @@ -27,14 +29,37 @@
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
> +static inline u32 mpfs_reset_read(struct mpfs_reset *rst)
> +{
> +	u32 ret;
> +
> +	if (rst->regmap)
> +		regmap_read(rst->regmap, REG_SUBBLK_RESET_CR, &ret);
> +	else
> +		ret = readl(rst->base);
> +
> +	return ret;
> +}
> +
> +static inline void mpfs_reset_write(struct mpfs_reset *rst, u32 val)
> +{
> +	if (rst->regmap)
> +		regmap_write(rst->regmap, REG_SUBBLK_RESET_CR, val);
> +	else
> +		writel(val, rst->base);
> +}
> +
>  static inline struct mpfs_reset *to_mpfs_reset(struct reset_controller_dev *rcdev)
>  {
>  	return container_of(rcdev, struct mpfs_reset, rcdev);
> @@ -51,9 +76,9 @@ static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>  
>  	spin_lock_irqsave(&mpfs_reset_lock, flags);
>  
> -	reg = readl(rst->base);
> +	reg = mpfs_reset_read(rst);
>  	reg |= BIT(id);
> -	writel(reg, rst->base);
> +	mpfs_reset_write(rst, reg);

This should use regmap_update_bits() in the regmap case, same in
mpfs_deassert().

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
