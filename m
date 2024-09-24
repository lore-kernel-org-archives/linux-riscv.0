Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593E8CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRrMoSL39VOIoGbi3lze1D+eRCWPm/y0MlowmZnY41k=; b=ZiTvLKjx0WHv+R
	yBsuIm3ji1OiPu/R0WpbphSaoOJgdwn1CNxfYihBOvX6uUYzzELKy65SD6KBFJ4V1bywRwR9vJfD7
	mi+RGlGGrD9bySNhRa9L0tjfW0Lwkkg5FmfLt+D3o+lrvYuXBnBMWo3HK5BwK0StegmEtGNplGHrd
	tEIEgn/3fuWbhGQqR5FswkoCDQ3hWezqjxEcQ0CzCsjsK3c5xxGTQ+XssTGpfxJ6bH8U76ye2aZeJ
	lOoid3CrVHKRaKJUITY+96/5HOj2RwSSUPfFFjdZewWI5tXd2h44md/o6DoM6gkSFADRbcLa+1ZRO
	QS8gaDycW61FEeXu3akQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1gT-00000001ldZ-3s6Z;
	Tue, 24 Sep 2024 09:18:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1fm-00000001lV3-2upt
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Sep 2024 09:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KKJxXY2xgHvavjMVMREVlYAE0zC1oEFWDw21VlbnYG4=; b=eIJdoAL/0PrymS66JbqD52xSH4
	LwFVnfa/EaemjIVSXqYUy4NI+MWnOYpWdR1qQ+E+IfJ9oHz8VpB3E6PllMsPe89IomGwGUyLRMUM/
	ZbhRXGM+yj26j/J8QJ5QvyFEH0Ep2rhlCwF3kBSi+JvoRNMqeMNYBnenS3PtmrR5WUdl453iwxgWT
	5vWFibZs7EA1RDmQahx1n7sRPRKeB641cDU2V2t3OabJSlRI5LEpeKNRmFeXx5LClHZGlULT95O03
	YKlOaUgkJNrXK7kWBUwftK6XbtcjeM7Vk9CZW+LDIwZ9XRsvooq63MfE2fed3TLJcRGm5ke2Gnczt
	tKZyDfSQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1fj-00000001niq-1eSr
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 09:17:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1st1fS-0001Uj-WD; Tue, 24 Sep 2024 11:17:11 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1st1fS-001Ay4-H8; Tue, 24 Sep 2024 11:17:10 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1st1fS-0003vw-1b;
	Tue, 24 Sep 2024 11:17:10 +0200
Message-ID: <e0a8da323575ec46dff2df5f804513ea64f11ca8.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: canaan: Add reset driver for Kendryte K230
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Junhui Liu <liujh2818@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Junhui Liu
	 <liujh2818@outlook.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Tue, 24 Sep 2024 11:17:10 +0200
In-Reply-To: <20240924-k230-reset-v1-2-d0cdc11989eb@outlook.com>
References: <20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com>
	 <20240924-k230-reset-v1-2-d0cdc11989eb@outlook.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_101727_810551_3E834E13 
X-CRM114-Status: GOOD (  31.95  )
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

On Di, 2024-09-24 at 14:00 +0800, Junhui Liu wrote:
> From: Junhui Liu <liujh2818@outlook.com>
> 
> Add support for the resets on Canaan Kendryte K230 SoC.
> 
> Signed-off-by: Junhui Liu <liujh2818@outlook.com>
> ---
>  drivers/reset/Kconfig      |   8 ++
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-k230.c | 321 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 330 insertions(+)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 5484a65f66b95374e25bac31f539a2dd92ae007e..716c676e9b934dd3d2b1ee28f2c43ef38daf7dba 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -133,6 +133,14 @@ config RESET_K210
>  	  Say Y if you want to control reset signals provided by this
>  	  controller.
>  
> +config RESET_K230
> +	bool "Reset controller driver for Canaan Kendryte K230 SoC"
> +	depends on (ARCH_CANAAN || COMPILE_TEST) && OF
> +	help
> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
> +	  Say Y if you want to control reset signals provided by this
> +	  controller.
> +
>  config RESET_LANTIQ
>  	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>  	default SOC_TYPE_XWAY
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 4411a2a124d7de29808fcf36d0829393fc79af72..f02c35607ba88947e868d33ead70e9ec91a85636 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>  obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>  obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>  obj-$(CONFIG_RESET_K210) += reset-k210.o
> +obj-$(CONFIG_RESET_K230) += reset-k230.o
>  obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>  obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9c693e1cee35dd725bebb6916002f846e8b4003b
> --- /dev/null
> +++ b/drivers/reset/reset-k230.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2016-2017 Linaro Ltd.
> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
> + * Copyright (C) 2024 Junhui Liu <liujh2818@outlook.com>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +#include <linux/delay.h>
> +#include <dt-bindings/reset/canaan,k230-rst.h>
> +
> +/**
> + * enum k230_rst_type - K230 reset types
> + * @RST_TYPE_CPU0: Reset type for CPU0
> + *	Automatically clears, has write enable and done bit, active high
> + * @RST_TYPE_CPU1: Reset type for CPU1
> + *	Manually clears, has write enable and done bit, active high
> + * @RST_TYPE_FLUSH: Reset type for CPU L2 cache flush
> + *	Automatically clears, has write enable, no done bit, active high
> + * @RST_TYPE_HW_DONE: Reset type for hardware auto clear
> + *	Automatically clears, no write enable, has done bit, active high
> + * @RST_TYPE_SW_DONE: Reset type for software manual clear
> + *	Manually clears, no write enable and done bit,
> + *	active high if ID is RST_SPI2AXI, otherwise active low
> + */
> +enum k230_rst_type {
> +	RST_TYPE_CPU0 = 0,
> +	RST_TYPE_CPU1,
> +	RST_TYPE_FLUSH,
> +	RST_TYPE_HW_DONE,
> +	RST_TYPE_SW_DONE,
> +};
> +
> +struct k230_rst_map {
> +	u32			offset;
> +	enum k230_rst_type	type;
> +	u32			done;
> +	u32			reset;
> +};
> +
> +struct k230_rst {
> +	struct reset_controller_dev	rcdev;
> +	struct device			*dev;
> +	void __iomem			*base;
> +	spinlock_t			lock;
> +};
> +
> +static const struct k230_rst_map k230_resets[] = {
> +	[RST_CPU0]		= { 0x4,  RST_TYPE_CPU0,    BIT(12), BIT(0) },
> +	[RST_CPU1]		= { 0xc,  RST_TYPE_CPU1,    BIT(12), BIT(0) },
> +	[RST_CPU0_FLUSH]	= { 0x4,  RST_TYPE_FLUSH,   0,       BIT(4) },
> +	[RST_CPU1_FLUSH]	= { 0xc,  RST_TYPE_FLUSH,   0,       BIT(4) },
> +	[RST_AI]		= { 0x14, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_VPU]		= { 0x1c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_HS]		= { 0x2c, RST_TYPE_HW_DONE, BIT(4),  BIT(0) },
> +	[RST_HS_AHB]		= { 0x2c, RST_TYPE_HW_DONE, BIT(5),  BIT(1) },
> +	[RST_SDIO0]		= { 0x34, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_SDIO1]		= { 0x34, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
> +	[RST_SDIO_AXI]		= { 0x34, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
> +	[RST_USB0]		= { 0x3c, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_USB1]		= { 0x3c, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
> +	[RST_USB0_AHB]		= { 0x3c, RST_TYPE_HW_DONE, BIT(30), BIT(0) },
> +	[RST_USB1_AHB]		= { 0x3c, RST_TYPE_HW_DONE, BIT(31), BIT(1) },
> +	[RST_SPI0]		= { 0x44, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_SPI1]		= { 0x44, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
> +	[RST_SPI2]		= { 0x44, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
> +	[RST_SEC]		= { 0x4c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_PDMA]		= { 0x54, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_SDMA]		= { 0x54, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
> +	[RST_DECOMPRESS]	= { 0x5c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_SRAM]		= { 0x64, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
> +	[RST_SHRM_AXIM]		= { 0x64, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
> +	[RST_SHRM_AXIS]		= { 0x64, RST_TYPE_HW_DONE, BIT(31), BIT(3) },
> +	[RST_NONAI2D]		= { 0x6c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_MCTL]		= { 0x74, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_ISP]		= { 0x80, RST_TYPE_HW_DONE, BIT(29), BIT(6) },
> +	[RST_ISP_DW]		= { 0x80, RST_TYPE_HW_DONE, BIT(28), BIT(5) },
> +	[RST_DPU]		= { 0x88, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_DISP]		= { 0x90, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_GPU]		= { 0x98, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_AUDIO]		= { 0xa4, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
> +	[RST_TIMER0]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(0) },
> +	[RST_TIMER1]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(1) },
> +	[RST_TIMER2]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(2) },
> +	[RST_TIMER3]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(3) },
> +	[RST_TIMER4]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(4) },
> +	[RST_TIMER5]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(5) },
> +	[RST_TIMER_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(6) },
> +	[RST_HDI]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(7) },
> +	[RST_WDT0]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(12) },
> +	[RST_WDT1]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(13) },
> +	[RST_WDT0_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(14) },
> +	[RST_WDT1_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(15) },
> +	[RST_TS_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(16) },
> +	[RST_MAILBOX]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(17) },
> +	[RST_STC]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(18) },
> +	[RST_PMU]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(19) },
> +	[RST_LS_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(0) },
> +	[RST_UART0]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(1) },
> +	[RST_UART1]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(2) },
> +	[RST_UART2]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(3) },
> +	[RST_UART3]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(4) },
> +	[RST_UART4]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(5) },
> +	[RST_I2C0]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(6) },
> +	[RST_I2C1]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(7) },
> +	[RST_I2C2]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(8) },
> +	[RST_I2C3]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(9) },
> +	[RST_I2C4]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(10) },
> +	[RST_JAMLINK0_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(11) },
> +	[RST_JAMLINK1_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(12) },
> +	[RST_JAMLINK2_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(13) },
> +	[RST_JAMLINK3_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(14) },
> +	[RST_CODEC_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(17) },
> +	[RST_GPIO_DB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(18) },
> +	[RST_GPIO_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(19) },
> +	[RST_ADC]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(20) },
> +	[RST_ADC_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(21) },
> +	[RST_PWM_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(22) },
> +	[RST_SHRM_APB]		= { 0x64, RST_TYPE_SW_DONE, 0,       BIT(1) },
> +	[RST_CSI0]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(0) },
> +	[RST_CSI1]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(1) },
> +	[RST_CSI2]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(2) },
> +	[RST_CSI_DPHY]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(3) },
> +	[RST_ISP_AHB]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(4) },
> +	[RST_M0]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(7) },
> +	[RST_M1]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(8) },
> +	[RST_M2]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(9) },
> +	[RST_SPI2AXI]		= { 0xa8, RST_TYPE_SW_DONE, 0,       BIT(0) }
> +};
> +
> +#define to_k230_rst(p) container_of((p), struct k230_rst, rcdev)

Consider turning this into an inline function.

> +static void k230_rst_clear_done(struct k230_rst *rstc, unsigned long id,
> +				bool write_en)
> +{
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&rstc->lock, flags);

You could use guard(spinlock_irqsave)(&rstc->lock) to save a few lines.

> +	reg = readl(rstc->base + rmap->offset);
> +
> +	/* write 1 to clear */
> +	reg |= rmap->done;
> +	if (write_en)
> +		reg |= rmap->done << 16;
> +
> +	writel(reg, rstc->base + rmap->offset);
> +
> +	spin_unlock_irqrestore(&rstc->lock, flags);
> +}
> +
> +static int k230_rst_wait_and_clear_done(struct k230_rst *rstc, unsigned long id,
> +					bool write_en)
> +{
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	u32 reg;
> +	int ret;
> +
> +	ret = readl_poll_timeout(rstc->base + rmap->offset, reg,
> +				 reg & rmap->done, 10, 1000);
> +	if (ret) {
> +		dev_err(rstc->dev, "Wait for reset done timeout\n");
> +		return ret;
> +	}
> +
> +	k230_rst_clear_done(rstc, id, write_en);
> +
> +	return 0;
> +}
> +
> +static void k230_rst_update(struct k230_rst *rstc, unsigned long id,
> +			    bool assert, bool write_en, bool active_low)
> +{
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&rstc->lock, flags);

Same as above, maybe use guard(spinlock_irqsave)(&rstc->lock).

> +
> +	reg = readl(rstc->base + rmap->offset);
> +
> +	if (assert ^ active_low)
> +		reg |= rmap->reset;
> +	else
> +		reg &= ~rmap->reset;
> +
> +	if (write_en)
> +		reg |= rmap->reset << 16;
> +
> +	writel(reg, rstc->base + rmap->offset);
> +
> +	spin_unlock_irqrestore(&rstc->lock, flags);
> +}
> +
> +static int k230_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct k230_rst *rstc = to_k230_rst(rcdev);
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	int ret;
> +
> +	switch (rmap->type) {
> +	case RST_TYPE_CPU0:

I'd expect this and the other self-clearing resets to return -ENOTSUPP,
as reset_control_assert() most likely won't return with the reset line
still asserted.

> +		k230_rst_clear_done(rstc, id, true);
> +		k230_rst_update(rstc, id, true, true, false);
> +		ret = k230_rst_wait_and_clear_done(rstc, id, true);
> +		break;

This should be implemented in k230_rst_reset().

> +	case RST_TYPE_CPU1:
> +	case RST_TYPE_FLUSH:
> +		k230_rst_update(rstc, id, true, true, false);
> +		break;
> +	case RST_TYPE_HW_DONE:
> +		k230_rst_clear_done(rstc, id, false);
> +		k230_rst_update(rstc, id, true, false, false);
> +		ret = k230_rst_wait_and_clear_done(rstc, id, false);

Same for RST_TYPE_FLUSH and RST_TYPE_HW_DONE.

> +		break;
> +	case RST_TYPE_SW_DONE:
> +		k230_rst_update(rstc, id, true, false,
> +				id == RST_SPI2AXI ? false : true);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int k230_rst_deassert(struct reset_controller_dev *rcdev,
> +			     unsigned long id)
> +{
> +	struct k230_rst *rstc = to_k230_rst(rcdev);
> +	int ret;

Here ret should be initialized to 0.

> +
> +	switch (k230_resets[id].type) {
> +	case RST_TYPE_CPU0:
> +		break;
> +	case RST_TYPE_CPU1:
> +		k230_rst_update(rstc, id, false, true, false);
> +		ret = k230_rst_wait_and_clear_done(rstc, id, true);

This looks odd, but maybe that's how the hardware works. To be sure,
you are waiting for the done bit *after* manually deasserting the
reset, on purpose?

> +		break;
> +	case RST_TYPE_FLUSH:
> +	case RST_TYPE_HW_DONE:
> +		break;
> +	case RST_TYPE_SW_DONE:
> +		k230_rst_update(rstc, id, false, false,
> +				id == RST_SPI2AXI ? false : true);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;

Currently this returns an uninitialized value for the self-clearing
resets (RST_TYPE_CPU0, RST_TYPE_FLUSH, and RST_TYPE_HW_DONE).

> +}
> +
> +static int k230_rst_reset(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	int ret;
> +
> +	ret = k230_rst_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	udelay(10);

Is this delay enough for all consumers?
Is this delay needed for the resets that wait for the done bit after
assertion (RST_TYPE_CPU0 and RST_TYPE_HW_DONE)?

> +
> +	return k230_rst_deassert(rcdev, id);
> +}
> +
> +static const struct reset_control_ops k230_rst_ops = {
> +	.reset		= k230_rst_reset,
> +	.assert		= k230_rst_assert,
> +	.deassert	= k230_rst_deassert,
> +};
> +
> +static int k230_rst_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct k230_rst *rstc;
> +
> +	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
> +	if (!rstc)
> +		return -ENOMEM;
> +
> +	rstc->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rstc->base))
> +		return PTR_ERR(rstc->base);
> +
> +	spin_lock_init(&rstc->lock);
> +
> +	rstc->dev		= dev;
> +	rstc->rcdev.owner	= THIS_MODULE;
> +	rstc->rcdev.ops		= &k230_rst_ops;
> +	rstc->rcdev.nr_resets	= ARRAY_SIZE(k230_resets);
> +	rstc->rcdev.of_node	= dev->of_node;
> +
> +	return devm_reset_controller_register(dev, &rstc->rcdev);
> +}
> +
> +static const struct of_device_id k230_rst_match[] = {
> +	{ .compatible = "canaan,k230-rst", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, k230_rst_match);
> +
> +static struct platform_driver k230_rst_driver = {
> +	.probe = k230_rst_probe,
> +	.driver = {
> +		.name = "k230-rst",
> +		.of_match_table = k230_rst_match,
> +	}
> +};
> +module_platform_driver(k230_rst_driver);
> +
> +MODULE_AUTHOR("Junhui Liu <liujh2818@outlook.com>");
> +MODULE_DESCRIPTION("Canaan K230 reset driver");
> +MODULE_LICENSE("GPL v2");

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
