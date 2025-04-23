Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DBEC369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6ngl1+0ADvtoLmF7oRz05TKCweto37x1Npb99xqn6A=; b=TiSXT3ShMAsiJ4
	GDNt0YDuzMFIJ7HroEfQYkThOit0ngYy/i0I+zlNmGPasJ4GLXOdo0Nv/SNMarYp/8Fq4/taQMSWz
	N8nvkeakcQljY1RRqOvAUxL8ZS2a30coxH8mKIbjEU3i2Z7qvS/GApRRHXO7dHb3FoDSNPMakgrJP
	tupcBz7sOPG3rKEWVymgCrrWxz7V/UimGLX0xgHjINAQDv1R8VYtEG7eKfvM7zhWq1tqj2GCK0CLb
	g6ccF9BlMzDd4snfboms3YeArkm3FO6obRegWJrqSvbPwkgGGxEBBwibD6C3nSfpWsCVQnu4kL6sL
	pXZD6wJXNRUjgFpi3CtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XXj-0000000AD22-0nDE;
	Wed, 23 Apr 2025 10:41:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Wdy-0000000A1yG-446d
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 09:43:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u7Wde-0002qo-Gv; Wed, 23 Apr 2025 11:43:30 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u7Wdd-001h9v-2B;
	Wed, 23 Apr 2025 11:43:29 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u7Wdd-000TPY-1v;
	Wed, 23 Apr 2025 11:43:29 +0200
Message-ID: <15c2be97e1b58e7be182299d27e17996b47e8414.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: canaan: add reset driver for Kendryte K230
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Wed, 23 Apr 2025 11:43:29 +0200
In-Reply-To: <20250420-k230-reset-v2-2-f1b4a016e438@pigmoral.tech>
References: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
	 <20250420-k230-reset-v2-2-f1b4a016e438@pigmoral.tech>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_024351_163678_E5DC10CF 
X-CRM114-Status: GOOD (  33.33  )
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

On So, 2025-04-20 at 01:09 +0800, Junhui Liu wrote:
> Add support for the resets on Canaan Kendryte K230 SoC. The driver
> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
> clear resets.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> 
> ---
> The reset management module in the K230 SoC also provides reset time
> control registers. For RST_TYPE_CPU0, RST_TYPE_CPU1 and RST_TYPE_SW_DONE,
> the time period when reset is applyed/removed but the clock is stopped
> can be set up to 15*0.25 = 3.75 us. For some RST_TYPE_HW_DONE cases, the
> time period can be set up to 255*0.25 = 63.75 us. For RST_TYPE_FLUSH,
> the reset bit will automatically cleared by hardware when flush done.
> 
> Although the current reset driver does not support configuration of
> reset time registers, delay has been added to the assert, deassert and
> reset functions to accommodate the longest reset time.
> 
> Besides, although some reset types have done bits, the reference manual
> does not explicitly indicate whether the hardware removes reset or the
> clock stop time period has passed when done bits toggle. Therefore, I
> think it is a safer way to keep delay for reset types with done bits.
> 
> link: https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
> ---
>  drivers/reset/Kconfig      |   9 ++
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-k230.c | 355 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 365 insertions(+)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1aed7ba2f72819f7a 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -140,6 +140,15 @@ config RESET_K210
>  	  Say Y if you want to control reset signals provided by this
>  	  controller.
>  
> +config RESET_K230
> +	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
> +	depends on ARCH_CANAAN || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
> +	  Say Y if you want to control reset signals provided by this
> +	  controller.
> +
>  config RESET_LANTIQ
>  	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>  	default SOC_TYPE_XWAY
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804e1321b167815a4b 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>  obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>  obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>  obj-$(CONFIG_RESET_K210) += reset-k210.o
> +obj-$(CONFIG_RESET_K230) += reset-k230.o
>  obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>  obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..492d2274893675b0ff1967426c8fa9e75aed1791
> --- /dev/null
> +++ b/drivers/reset/reset-k230.c
> @@ -0,0 +1,355 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2016-2017 Linaro Ltd.
> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +
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
> +	RST_TYPE_CPU0,
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

Add a comment, this locks register read-modify-write.

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

The TRM calls these HISYS. Is this shortened to HS on purpose?

[...]

> +static int k230_rst_reset(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct k230_rst *rstc = to_k230_rst(rcdev);
> +	const struct k230_rst_map *rmap = &k230_resets[id];
> +	u32 reg;
> +	int ret = 0;
> +
> +	switch (rmap->type) {
> +	case RST_TYPE_CPU0:
> +		k230_rst_clear_done(rstc, id, true);
> +		k230_rst_update(rstc, id, true, true, false);
> +		ret = k230_rst_wait_and_clear_done(rstc, id, true);
> +
> +		/*
> +		 * The time period when reset is applied and removed but the
> +		 * clock is stopped for RST_TYPE_CPU0 can be set up to 7.5us.
> +		 * Delay 10us to ensure proper reset timing.
> +		 */
> +		udelay(10);
> +
> +		break;
> +	case RST_TYPE_FLUSH:
> +		k230_rst_update(rstc, id, true, true, false);
> +
> +		/* Wait flush request bit auto cleared by hardware */
> +		ret = readl_poll_timeout(rstc->base + rmap->offset, reg,
> +					!(reg & rmap->reset), 10, 1000);
> +		if (ret)
> +			dev_err(rstc->dev, "Wait for flush done timeout\n");
> +
> +		break;
> +	case RST_TYPE_HW_DONE:
> +		k230_rst_clear_done(rstc, id, false);
> +		k230_rst_update(rstc, id, true, false, false);
> +		ret = k230_rst_wait_and_clear_done(rstc, id, false);
> +
> +		/*
> +		 * The time period when reset is applied and removed but the
> +		 * clock is stopped for RST_TYPE_HW_DONE can be set up to
> +		 * 127.5us. Delay 200us to ensure proper reset timing.
> +		 */
> +		udelay(200);

Consider using usleep_range(), or fsleep().

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
