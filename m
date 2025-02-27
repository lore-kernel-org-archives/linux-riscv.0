Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871F0C197BF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 22:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amm3QMHn4e7JJmupO9DV5DcUljm2ccBpvv7rRZ3iN2I=; b=KKSOzWBpPtRvHb
	uJwFS84WenM6l3/pPz5Gqgf+KEEEiIYsGGgr58boz0UPbVA30v9nq8dokQiTzYUX1ZdFFs3SjXBmN
	zW9qgOm+UUpxXT2K1IsGW0sLQ/QlmnaspmOEyn3CMAPGXd8pihal1cRwrl4/ZCpA/x+XIsSI7w7fn
	DTNPgm1tvFVPzPTHBpVqZYSzdGS/iZswRpJB+zc1KVFR3Lp1nPl/JY9lNZsKSWJXmbyd9NxN2N82Z
	pUcM6zliL4V9/wd16Bm270j/ulgdn+DGo2dGDWlnm6SujCSKM1MepLkxSONBpDbvm2GQlvCItzDdv
	espIfIWHhQZVmTHUnUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnlxd-00000008xTH-123N;
	Thu, 27 Feb 2025 22:02:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnlvF-00000008x7x-2WWp;
	Thu, 27 Feb 2025 22:00:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BD021516;
	Thu, 27 Feb 2025 14:00:14 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A6013F5A1;
	Thu, 27 Feb 2025 13:59:55 -0800 (PST)
Date: Thu, 27 Feb 2025 21:57:32 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Ulf
 Hansson <ulf.hansson@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 02/10] pinctrl: sunxi: add driver for Allwinner V853
Message-ID: <20250227215732.5f5753d9@minigeek.lan>
In-Reply-To: <20250205125225.1152849-3-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
	<20250205125225.1152849-3-szemzo.andras@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_140001_733261_D1AD3644 
X-CRM114-Status: GOOD (  24.41  )
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

On Wed,  5 Feb 2025 13:52:17 +0100
Andras Szemzo <szemzo.andras@gmail.com> wrote:

Hi,

> The V853 family has multiple package variants, from BGA to QFN88.
> The latter has co-packaged DRAM and fewer pins, and less features (pin muxes).
> All family members can be supported by a single driver, as the available pins
> with allowed muxes is the same across the devices.
> 
> This new pinctrl driver depends on the new sunxi device-tree based mux support
> patch series [1].
> 
> [1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/
> 
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> ---
>  drivers/pinctrl/sunxi/Kconfig              |  5 ++
>  drivers/pinctrl/sunxi/Makefile             |  1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c | 53 ++++++++++++++++++++++
>  3 files changed, 59 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
> 
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
> index a78fdbbdfc0c..fac9c61039e2 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -81,6 +81,11 @@ config PINCTRL_SUN9I_A80_R
>  	default MACH_SUN9I
>  	select PINCTRL_SUNXI
>  
> +config PINCTRL_SUN8I_V853
> +	bool "Support for the Allwinner V853/V851S/V851SE PIO"
> +	default MACH_SUN8I
> +	select PINCTRL_SUNXI
> +
>  config PINCTRL_SUN20I_D1
>  	bool "Support for the Allwinner D1 PIO"
>  	default MACH_SUN8I || (RISCV && ARCH_SUNXI)
> diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
> index 2ff5a55927ad..8937b56b2ef4 100644
> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
>  obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
>  obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
>  obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
> +obj-$(CONFIG_PINCTRL_SUN8I_V853)	+= pinctrl-sun8i-v853.o
>  obj-$(CONFIG_PINCTRL_SUN20I_D1)		+= pinctrl-sun20i-d1.o
>  obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
>  obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
> new file mode 100644
> index 000000000000..fb2112ee12d0
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Allwinner V853 SoC pinctrl driver.
> + *
> + * Copyright (c) 2025 Andras Szemzo <szemzo.andras@gmail.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#include "pinctrl-sunxi.h"
> +
> +static const u8 v853_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
> +/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  */
> +	{ 22,  0, 12, 23, 18,  7,  8, 16,  5 };
> +
> +static const unsigned int v853_irq_bank_map[] = { 0, 2, 3, 4, 5, 6, 7, 8 };
> +
> +static const u8 v853_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
> +/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI */
> +	{ 14,  0, 14, 14, 14, 14, 14, 14, 14 };
> +
> +static struct sunxi_pinctrl_desc v853_pinctrl_data = {
> +	.irq_banks = ARRAY_SIZE(v853_irq_bank_map),
> +	.irq_bank_map = v853_irq_bank_map,
> +	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +};
> +
> +static int v853_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_dt_table_init(pdev, v853_nr_bank_pins,
> +					   v853_irq_bank_muxes,
> +					   &v853_pinctrl_data,
> +					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
> +					   SUNXI_PINCTRL_ELEVEN_BANKS);

This last flag doesn't apply: it would put the offset for the
POW_MOD_SEL registers at 0x380, but the manual says it's 0x340, as with
the previous SoCs.
I compared the rest against the A523 driver, and the V853 specific bits
against the manual: they match, so with that line removed:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> +}
> +
> +static const struct of_device_id v853_pinctrl_match[] = {
> +	{ .compatible = "allwinner,sun8i-v853-pinctrl", },
> +	{}
> +};
> +
> +static struct platform_driver v853_pinctrl_driver = {
> +	.probe	= v853_pinctrl_probe,
> +	.driver	= {
> +		.name		= "sun8i-v853-pinctrl",
> +		.of_match_table	= v853_pinctrl_match,
> +	},
> +};
> +builtin_platform_driver(v853_pinctrl_driver);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
