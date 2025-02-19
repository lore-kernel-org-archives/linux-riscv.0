Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0291C021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiIAlTNnZ25wmyXioIuHCLuMQYtELpPWTct0vlrEEFs=; b=GiDeFID6wcimT8
	E/dgR4xIAV0zdx7R7UQ3+/4zzEmIuGlA+Cx5MgDigTq3YVbufGsRTMn1er9txm5QyIzvgVFC/6uyM
	bRl0F+Ziw82UUxjzYLSjQTgvIZqJc7GTVYO6OVxUqSurbNXPmRFnp73aHd5S4RiQdQO9URf/BBs6p
	YipCk64BOqsXTTrbbIax3z2v6/aStbynaG+insJ3MAdAmSxGAZV0KwDrBo0uOwvCL4dV9+Lxn53e5
	pjT8edtizVDOAndRadJKrjo4u+SKjEJKL2zNnLBHKTZ7LYUW8GHWVdi20eHNCTp1FZ14D0QHZUVbh
	TzOo+Vf79w95Uu2+tABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklak-0000000DQsc-1xPr;
	Wed, 19 Feb 2025 15:02:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklai-0000000DQr9-0Bgq
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 15:02:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkla9-0004IU-Do; Wed, 19 Feb 2025 16:01:49 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkla6-001mdz-12;
	Wed, 19 Feb 2025 16:01:46 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkla6-0009xm-0e;
	Wed, 19 Feb 2025 16:01:46 +0100
Message-ID: <ef2026c28b9e6d59a98f6f33eb14f3b762454423.camel@pengutronix.de>
Subject: Re: [PATCH v5 12/21] reset: thead: Add TH1520 reset controller
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
 jassisinghbrar@gmail.com,  paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu,  frank.binns@imgtec.com, matt.coster@imgtec.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
  airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org,  m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Date: Wed, 19 Feb 2025 16:01:46 +0100
In-Reply-To: <20250219140239.1378758-13-m.wilczynski@samsung.com>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
	 <CGME20250219140305eucas1p26317b54727c68cf069458d270e06d962@eucas1p2.samsung.com>
	 <20250219140239.1378758-13-m.wilczynski@samsung.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_070224_235659_E658DB2C 
X-CRM114-Status: GOOD (  25.37  )
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

On Mi, 2025-02-19 at 15:02 +0100, Michal Wilczynski wrote:
> Add reset controller driver for the T-HEAD TH1520 SoC that manages
> hardware reset lines for various subsystems. The driver currently
> implements support for GPU reset control, with infrastructure in place
> to extend support for NPU and Watchdog Timer resets in future updates.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/reset/Kconfig        |  10 +++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-th1520.c | 141 +++++++++++++++++++++++++++++++++++
>  4 files changed, 153 insertions(+)
>  create mode 100644 drivers/reset/reset-th1520.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 819686e98214..e4a0a83b4c11 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20425,6 +20425,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	drivers/pmdomain/thead/
> +F:	drivers/reset/reset-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  F:	include/dt-bindings/power/thead,th1520-power.h
>  F:	include/dt-bindings/reset/thead,th1520-reset.h
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 5b3abb6db248..fa0943c3d1de 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -272,6 +272,16 @@ config RESET_SUNXI
>  	help
>  	  This enables the reset driver for Allwinner SoCs.
>  
> +config RESET_TH1520
> +	tristate "T-HEAD 1520 reset controller"
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  This driver provides support for the T-HEAD TH1520 SoC reset controller,
> +	  which manages hardware reset lines for SoC components such as the GPU.
> +	  Enable this option if you need to control hardware resets on TH1520-based
> +	  systems.
> +
>  config RESET_TI_SCI
>  	tristate "TI System Control Interface (TI-SCI) reset driver"
>  	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 677c4d1e2632..d6c2774407ae 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
>  obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
> +obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
>  obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
>  obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
>  obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> new file mode 100644
> index 000000000000..d6816c86ba95
> --- /dev/null
> +++ b/drivers/reset/reset-th1520.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/reset/thead,th1520-reset.h>
> +
> + /* register offset in VOSYS_REGMAP */
> +#define TH1520_GPU_RST_CFG		0x0
> +#define TH1520_GPU_RST_CFG_MASK		GENMASK(1, 0)
> +
> +/* register values */
> +#define TH1520_GPU_SW_GPU_RST		BIT(0)
> +#define TH1520_GPU_SW_CLKGEN_RST	BIT(1)
> +
> +struct th1520_reset_priv {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *map;
> +};
> +
> +struct th1520_reset_map {
> +	u32 bit;
> +	u32 reg;
> +};
> +
> +static const struct th1520_reset_map th1520_resets[] = {
> +	[TH1520_RESET_ID_GPU] = {
> +		.bit = TH1520_GPU_SW_GPU_RST,
> +		.reg = TH1520_GPU_RST_CFG,
> +	},
> +	[TH1520_RESET_ID_GPU_CLKGEN] = {
> +		.bit = TH1520_GPU_SW_CLKGEN_RST,
> +		.reg = TH1520_GPU_RST_CFG,
> +	}

I expect the NPU and WDT resets will be added to this list later?

> +};
> +
> +static inline struct th1520_reset_priv *
> +to_th1520_reset(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct th1520_reset_priv, rcdev);
> +}
> +
> +static int th1520_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
> +	const struct th1520_reset_map *reset;
> +
> +	if (id >= ARRAY_SIZE(th1520_resets))
> +		return -EINVAL;

This check is not necessary. The core will have checked this in
of_reset_simple_xlate() before returning the reset control.

> +
> +	reset = &th1520_resets[id];
> +
> +	return regmap_update_bits(priv->map, reset->reg, reset->bit, 0);
> +}
> +
> +static int th1520_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
> +	const struct th1520_reset_map *reset;
> +
> +	if (id >= ARRAY_SIZE(th1520_resets))
> +		return -EINVAL;

This check is not necessary.

> +
> +	reset = &th1520_resets[id];
> +
> +	return regmap_update_bits(priv->map, reset->reg, reset->bit,
> +				  reset->bit);
> +}
> +
> +static const struct reset_control_ops th1520_reset_ops = {
> +	.assert	= th1520_reset_assert,
> +	.deassert = th1520_reset_deassert,
> +};
> +
> +static const struct regmap_config th1520_reset_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.fast_io = true,
> +};
> +
> +static int th1520_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct th1520_reset_priv *priv;
> +	void __iomem *base;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->map = devm_regmap_init_mmio(dev, base,
> +					  &th1520_reset_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	/* Initialize GPU resets to asserted state */
> +	ret = regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
> +				 TH1520_GPU_RST_CFG_MASK, 0);
> +	if (ret)
> +		return ret;
> +
> +	priv->rcdev.owner = THIS_MODULE;
> +	priv->rcdev.nr_resets = 2;

Better use ARRAY_SIZE(th1520_resets) here, this will simplify adding
further resets in the future. With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
