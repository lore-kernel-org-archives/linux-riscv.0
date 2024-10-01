Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC5BCE7D06
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9iCO0np90MmvbcWy76uO92ZVV/dx5WL9SomTfjN06zc=; b=MFjRAHiaRd5a3Of7d32G/ET5K4
	Sm62KQGNUzqjB4XGEhigHrvbcvCQeeEx/WBjbjGZgvlHFajIH5LhV4eLWBQSee3DqXvSUCHqe0wto
	eC/peNb1kRLb3XjEhiL3VE4Po8KO878iQpsE/hmQXZSK/zZZ4/uDH3hlRZLElCnhnICbztAPN17Z7
	qHJiViiGtqEbfOJ9IV5yVhjMJXoSq7NzcxJrqhPnGPWDws6qfR8a+5NjA6I18MTOsrsTQ6uDVRHGK
	p+aIpyC9e4qfurQFePzNNecPxijl2W5uONYvxJlvUV6ZoLdoLz2FY+XAomw7tymBlk1r2qG7W0iXk
	7m8SRxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZVl-00000002H1y-3uMR;
	Tue, 01 Oct 2024 09:49:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZUW-00000002GsW-1LWz
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 09:48:26 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D9B213F5B4
	for <linux-riscv@lists.infradead.org>; Tue,  1 Oct 2024 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727776095;
	bh=osTvtKpGwAlLFzEF8tB9y1dyMDT5cC+kYvp/pLMwhcU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ZUY+0G/iF2GVq4YjXt9xosWlB4wyKI2Quv7jGYMUYU8eA4qAgn4a4f5GLbuczacmK
	 mMY1Q9u9RZE9IbQwT7sShs94z1utl+V0HArNZE/3T35Dcy0iU7JhrXDkIw/T29sZVe
	 Z77YFqwngJPTZOuFRixNPhz6V9pZOaht8jVhPEz974C2vNNYwu8JbQmuT+QwqS5yF5
	 HdAZGcnF55eE49TLQusD+1KUaTmmqK6lLAd4mv08/1EJBSEnBFr2Nb6nxq5xrkUncP
	 NFWqaVwFS2dWK+D/MMbnuYaoZ2D6yjI/KIKz1c8sfCqDVFftHJBbi1ibknseVfSNND
	 lYmH2JYJCV1Mg==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2874478f8beso3597763fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 02:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727776094; x=1728380894;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osTvtKpGwAlLFzEF8tB9y1dyMDT5cC+kYvp/pLMwhcU=;
        b=NlS2dqad6lc50Lj6ua9KtVW73qVdRo4coDGAlB/IT2wNdngsv17uP7vYbHeVbnlbfs
         DQG+4rsZLgRaxcnd2n6wqjhqP9HiUoTR2o8a1AeygUUhUpEsx521XYh5a8AOQDGMEuyx
         BBH0UMt/2KeXdrVgDBhPogk/tRj1IXq6ShHWLJhNAV8n0rAMPirA+N+CCDNupkb++gZU
         FncEFOQUHlHGdXiNj4buGxQktUt9I2Hy3701xkopUvCZ18aZMT4rCPn8agReDpK0/Zcn
         VqSR34E09KU9h4MRvj78sYu7HtmrI8jY2LfP21FaFOPChtz9lm6sddDQWKDtiWWD+6ms
         8epg==
X-Forwarded-Encrypted: i=1; AJvYcCWXqGcAtsleD/pnw5k+PpmdlsxWlm6IA9y+rGm6P1LuykgmWr6yohCwGLJO7vzZoDcZ5U5FUTbfiTN8wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQIhPuffhFFD90cQ/gP/lESdk0iF3euSFRKI15qQDpCZbKCjta
	6SlJP5ovysg8zgfb5nwKi1VJSjIcf8C400RmIyHYWo8dvCsjPBW6Pkni8bNFF/7F9Rlc+FJMMz8
	kC1FPKLM5todlckeQBOcPg4oPH/W71ydJo4L7mkRfcr6EsMg8qcjW0i4vIvPC++2ozbmezj8vWP
	a76dATrhKqgtcAc1glclNcctdMKF4lkMbUhozyN3vOV6a8wZPu8h2WzQGp
X-Received: by 2002:a05:6870:808c:b0:287:ef4:6695 with SMTP id 586e51a60fabf-28710bccd55mr12074835fac.31.1727776094512;
        Tue, 01 Oct 2024 02:48:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp6/9r3W7qqQb8DhujSjcEBlXChBMK6q7Y6dkSefhHq4ePSAKcVgpl1bmG6eAEXTMoJSFxLUQSVmSTjRejP+8=
X-Received: by 2002:a05:6870:808c:b0:287:ef4:6695 with SMTP id
 586e51a60fabf-28710bccd55mr12074803fac.31.1727776094118; Tue, 01 Oct 2024
 02:48:14 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Oct 2024 02:48:13 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240930-th1520-dwmac-v3-2-ae3e03c225ab@tenstorrent.com>
References: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com> <20240930-th1520-dwmac-v3-2-ae3e03c225ab@tenstorrent.com>
Mime-Version: 1.0
Date: Tue, 1 Oct 2024 02:48:13 -0700
Message-ID: <CAJM55Z-+-Ca3kNuNkTpfea8jYEDTdojhx=gM__MScVyT3Yomog@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] net: stmmac: Add glue layer for T-HEAD TH1520 SoC
To: Drew Fustini <dfustini@tenstorrent.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_024824_901617_705D7FF9 
X-CRM114-Status: GOOD (  27.75  )
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

Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Add dwmac glue driver to support the DesignWare-based GMAC controllers
> on the T-HEAD TH1520 SoC.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> [esmil: rename plat->interface -> plat->mac_interface,
>         use devm_stmmac_probe_config_dt()]
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe()]
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  MAINTAINERS                                       |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig       |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile      |   1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 291 ++++++++++++++++++++++
>  4 files changed, 304 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9e50107efb37..1d24863c01df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19946,6 +19946,7 @@ F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
>  F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:	drivers/pinctrl/pinctrl-th1520.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 05cc07b8f48c..82030adaf16e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -228,6 +228,17 @@ config DWMAC_SUN8I
>  	  stmmac device driver. This driver is used for H3/A83T/A64
>  	  EMAC ethernet controller.
>
> +config DWMAC_THEAD
> +	tristate "T-HEAD dwmac support"
> +	depends on OF && (ARCH_THEAD || COMPILE_TEST)
> +	select MFD_SYSCON
> +	help
> +	  Support for ethernet controllers on T-HEAD RISC-V SoCs
> +
> +	  This selects the T-HEAD platform specific glue layer support for
> +	  the stmmac device driver. This driver is used for T-HEAD TH1520
> +	  ethernet controller.
> +
>  config DWMAC_IMX8
>  	tristate "NXP IMX8 DWMAC support"
>  	default ARCH_MXC
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index c2f0e91f6bf8..d065634c6223 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
>  obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
>  obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
>  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
> +obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
>  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
>  obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
>  obj-$(CONFIG_DWMAC_LOONGSON1)	+= dwmac-loongson1.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> new file mode 100644
> index 000000000000..f2f94539c0d2
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * T-HEAD DWMAC platform driver
> + *
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + *
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "stmmac_platform.h"
> +
> +#define GMAC_CLK_EN			0x00
> +#define  GMAC_TX_CLK_EN			BIT(1)
> +#define  GMAC_TX_CLK_N_EN		BIT(2)
> +#define  GMAC_TX_CLK_OUT_EN		BIT(3)
> +#define  GMAC_RX_CLK_EN			BIT(4)
> +#define  GMAC_RX_CLK_N_EN		BIT(5)
> +#define  GMAC_EPHY_REF_CLK_EN		BIT(6)
> +#define GMAC_RXCLK_DELAY_CTRL		0x04
> +#define  GMAC_RXCLK_BYPASS		BIT(15)
> +#define  GMAC_RXCLK_INVERT		BIT(14)
> +#define  GMAC_RXCLK_DELAY_MASK		GENMASK(4, 0)
> +#define  GMAC_RXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> +#define GMAC_TXCLK_DELAY_CTRL		0x08
> +#define  GMAC_TXCLK_BYPASS		BIT(15)
> +#define  GMAC_TXCLK_INVERT		BIT(14)
> +#define  GMAC_TXCLK_DELAY_MASK		GENMASK(4, 0)
> +#define  GMAC_TXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> +#define GMAC_PLLCLK_DIV			0x0c
> +#define  GMAC_PLLCLK_DIV_EN		BIT(31)
> +#define  GMAC_PLLCLK_DIV_MASK		GENMASK(7, 0)
> +#define  GMAC_PLLCLK_DIV_NUM(x)		FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
> +#define GMAC_GTXCLK_SEL			0x18
> +#define  GMAC_GTXCLK_SEL_PLL		BIT(0)
> +#define GMAC_INTF_CTRL			0x1c
> +#define  PHY_INTF_MASK			BIT(0)
> +#define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
> +#define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
> +#define GMAC_TXCLK_OEN			0x20
> +#define  TXCLK_DIR_MASK			BIT(0)
> +#define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
> +#define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
> +
> +#define GMAC_GMII_RGMII_RATE	125000000
> +#define GMAC_MII_RATE		25000000
> +
> +static const struct regmap_config regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +struct thead_dwmac {
> +	struct plat_stmmacenet_data *plat;
> +	struct regmap *apb_regmap;
> +	struct device *dev;
> +};
> +
> +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 phyif;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		phyif = PHY_INTF_MII_GMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		phyif = PHY_INTF_RGMII;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	};
> +
> +	return regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
> +}
> +
> +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 txclk_dir;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		txclk_dir = TXCLK_DIR_INPUT;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		txclk_dir = TXCLK_DIR_OUTPUT;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	};
> +
> +	return regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
> +}
> +
> +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct plat_stmmacenet_data *plat;
> +	struct thead_dwmac *dwmac = priv;
> +	unsigned long rate;
> +	u32 div;
> +
> +	plat = dwmac->plat;
> +
> +	switch (plat->mac_interface) {
> +	/* For MII, rxc/txc is provided by phy */
> +	case PHY_INTERFACE_MODE_MII:
> +		return;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		rate = clk_get_rate(plat->stmmac_clk);
> +		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
> +		    rate % GMAC_MII_RATE != 0) {
> +			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
> +			return;
> +		}
> +
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
> +
> +		switch (speed) {
> +		case SPEED_1000:
> +			div = rate / GMAC_GMII_RGMII_RATE;
> +			break;
> +		case SPEED_100:
> +			div = rate / GMAC_MII_RATE;
> +			break;
> +		case SPEED_10:
> +			div = rate * 10 / GMAC_MII_RATE;
> +			break;
> +		default:
> +			dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +			return;
> +		}
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> +				   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
> +
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> +				   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return;
> +	}
> +}
> +
> +static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	int err;
> +	u32 reg;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		/* use pll */
> +		err = regmap_write(dwmac->apb_regmap, GMAC_GTXCLK_SEL, GMAC_GTXCLK_SEL_PLL);
> +		if (err)
> +			return dev_err_probe(dwmac->dev, err,
> +					     "failed to set phy interface\n");
> +
> +		reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
> +		      GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;
> +		break;
> +
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	}
> +
> +	return regmap_write(dwmac->apb_regmap, GMAC_CLK_EN, reg);
> +}
> +
> +static int thead_dwmac_init(struct platform_device *pdev, void *priv)
> +{
> +	struct thead_dwmac *dwmac = priv;
> +	int ret;
> +
> +	ret = thead_dwmac_set_phy_if(dwmac->plat);
> +	if (ret)
> +		return ret;
> +
> +	ret = thead_dwmac_set_txclk_dir(dwmac->plat);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
> +			   GMAC_RXCLK_DELAY_VAL(0));
> +	if (ret)
> +		return dev_err_probe(dwmac->dev, ret,
> +				     "failed to set GMAC RX clock delay\n");
> +
> +	ret = regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
> +			   GMAC_TXCLK_DELAY_VAL(0));
> +	if (ret)
> +		return dev_err_probe(dwmac->dev, ret,
> +				     "failed to set GMAC TX clock delay\n");
> +
> +	return thead_dwmac_enable_clk(dwmac->plat);
> +}
> +
> +static int thead_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct stmmac_resources stmmac_res;
> +	struct plat_stmmacenet_data *plat;
> +	struct thead_dwmac *dwmac;
> +	void __iomem *apb;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to get resources\n");
> +
> +	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> +				     "dt configuration failed\n");
> +
> +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> +	if (!dwmac)
> +		return -ENOMEM;
> +
> +	apb = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(apb))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(apb),
> +				     "Failed to remap gmac apb registers\n");
> +
> +	dwmac->apb_regmap = devm_regmap_init_mmio(&pdev->dev, apb, &regmap_config);
> +	if (IS_ERR(dwmac->apb_regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->apb_regmap),
> +				     "Failed to access gmac apb registers\n");

Why do you need to convert the APB range to a regmap? As far as I can tell it's
just regular 32bit memory mapped registers, so should work fine with just
readl()/writel()

/Emil

> +
> +	dwmac->dev = &pdev->dev;
> +	dwmac->plat = plat;
> +	plat->bsp_priv = dwmac;
> +	plat->fix_mac_speed = thead_dwmac_fix_speed;
> +	plat->init = thead_dwmac_init;
> +
> +	return devm_stmmac_pltfr_probe(pdev, plat, &stmmac_res);
> +}
> +
> +static const struct of_device_id thead_dwmac_match[] = {
> +	{ .compatible = "thead,th1520-gmac" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, thead_dwmac_match);
> +
> +static struct platform_driver thead_dwmac_driver = {
> +	.probe = thead_dwmac_probe,
> +	.driver = {
> +		.name = "thead-dwmac",
> +		.pm = &stmmac_pltfr_pm_ops,
> +		.of_match_table = thead_dwmac_match,
> +	},
> +};
> +module_platform_driver(thead_dwmac_driver);
> +
> +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
> +MODULE_AUTHOR("Drew Fustini <drew@pdp7.com>");
> +MODULE_DESCRIPTION("T-HEAD DWMAC platform driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
