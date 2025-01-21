Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7455C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dutCkHpxOX0tDtjpTYnRwa3278AcJfzy/oSGw+ZW0E=; b=qVphAAzwTwGHY7
	zs1PwbGW08I02teXzKIhzfG8FtCzXVspdsXcX5dCf41kX8yEIUrzOJlXVghH5tVlLLTYFEISgPUj1
	BTs7RJdcsp6I+pfk63AUmIwDQ9uVoPMo20QCM1nPUWPNCJ8sIV/hj2/tE4Bquk7Z8JqM8168QGAam
	hHosug/YILjee+mQKFEkKiw75Ys/rShqKsMmfEosVUzOgdCmUq25UMafD+ijAZoWV/szABZZHoQjK
	CZdG44/GXuUF2g2D7L7wLP5r77BuEoYs2PTHkNqe3TE8vIZh5gmiDjY+bCVNTM1qFycctX71N3GT1
	ix54Kj6BI0NPvKnLLbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9oV-00000007Hpi-1qyT;
	Tue, 21 Jan 2025 08:40:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9oT-00000007HpL-0ari
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 08:40:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ta9o8-0002nl-E3; Tue, 21 Jan 2025 09:40:24 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ta9o6-0014s0-2e;
	Tue, 21 Jan 2025 09:40:22 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ta9o6-0001o9-2I;
	Tue, 21 Jan 2025 09:40:22 +0100
Message-ID: <8f231c35fbb7304ee781d9c8d1eaeaf5753374de.camel@pengutronix.de>
Subject: Re: [RFC v3 08/18] reset: thead: Add TH1520 reset controller driver
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
Date: Tue, 21 Jan 2025 09:40:22 +0100
In-Reply-To: <20250120172111.3492708-9-m.wilczynski@samsung.com>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
	 <CGME20250120172129eucas1p236f71df4e30f821f7682263ee8ecec06@eucas1p2.samsung.com>
	 <20250120172111.3492708-9-m.wilczynski@samsung.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_004045_209495_E10C06A5 
X-CRM114-Status: GOOD (  29.52  )
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

On Mo, 2025-01-20 at 18:21 +0100, Michal Wilczynski wrote:
> Introduce reset controller driver for the T-HEAD TH1520 SoC. The
> controller manages hardware reset lines for various SoC subsystems, such
> as the GPU.

This statement is confusing, given the implementation only handles a
single (GPU) reset control.

> By exposing these resets via the Linux reset subsystem,
> drivers can request and control hardware resets to reliably initialize
> or recover key components.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/reset/Kconfig        |  10 +++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-th1520.c | 144 +++++++++++++++++++++++++++++++++++
>  4 files changed, 156 insertions(+)
>  create mode 100644 drivers/reset/reset-th1520.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1b6e894500ef..18382a356b12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20197,6 +20197,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	drivers/pmdomain/thead/
> +F:	drivers/reset/reset-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  F:	include/dt-bindings/firmware/thead,th1520-aon.h
>  F:	include/linux/firmware/thead/thead,th1520-aon.h
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
> index 000000000000..e4278f49c62f
> --- /dev/null
> +++ b/drivers/reset/reset-th1520.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/regmap.h>
> +
> + /* register offset in VOSYS_REGMAP */
> +#define TH1520_GPU_RST_CFG		0x0
> +#define TH1520_GPU_RST_CFG_MASK		GENMASK(2, 0)
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
> +static inline struct th1520_reset_priv *
> +to_th1520_reset(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct th1520_reset_priv, rcdev);
> +}
> +
> +static void th1520_rst_gpu_enable(struct regmap *reg)
> +{
> +	int val;
> +
> +	/* if the GPU is not in a reset state it, put it into one */
> +	regmap_read(reg, TH1520_GPU_RST_CFG, &val);
> +	if (val)
> +		regmap_update_bits(reg, TH1520_GPU_RST_CFG,
> +				   TH1520_GPU_RST_CFG_MASK, 0x0);
> +
> +	/* rst gpu clkgen */
> +	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_CLKGEN_RST);
> +
> +	/*
> +	 * According to the hardware manual, a delay of at least 32 clock
> +	 * cycles is required between de-asserting the clkgen reset and
> +	 * de-asserting the GPU reset. Assuming a worst-case scenario with
> +	 * a very high GPU clock frequency, a delay of 1 microsecond is
> +	 * sufficient to ensure this requirement is met across all
> +	 * feasible GPU clock speeds.
> +	 */
> +	udelay(1);
> +
> +	/* rst gpu */
> +	regmap_set_bits(reg, TH1520_GPU_RST_CFG, TH1520_GPU_SW_GPU_RST);

This sequence of TH1520_GPU_RST_CFG register accesses should be
protected by a lock.

[...]
> +static int th1520_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
> +
> +	th1520_rst_gpu_disable(priv->map);
> +
> +	return 0;
> +}
> +
> +static int th1520_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
> +
> +	th1520_rst_gpu_enable(priv->map);
> +
> +	return 0;
> +}
> +
> +static int th1520_reset_xlate(struct reset_controller_dev *rcdev,
> +			      const struct of_phandle_args *reset_spec)
> +{
> +	return 0;
> +}

These all explicitly handle only a single reset control, which is in
conflict with the commit message of this patch and the dt-binding
patch. Will more reset controls be added to this driver in the future?


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
