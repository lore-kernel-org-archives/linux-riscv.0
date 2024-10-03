Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6C3CF31BF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 05:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdljj6T0kjuFRwjyB4vh8RXJ6Ala6ieVHK+iY2jIfjs=; b=Zb1HRDmSqp/TXv
	yFKIiLxmDyJoZA08ce6KUrHkcMa5++LGIGWIXQqnDG1pSzs/Rwn3shRtdhRizH2WDfWBmgi7UavA5
	P1I9vWRZDkD77BOSTg9ljvEyG2NVKcofdABs9UYWshOG8C1ZAHAU+Yt/mD+OPydrVr2nX/BLL98dn
	u5lQddRes70uoDv74yqpTfepui+fTWgbhU2qG4ApWw+dFqbZz+BVDtou/akoQ6ykMAuQvLPNHlcrm
	FsFAkZL3uSke53uBN4tzUecwDkqtAObtojL/oDv1gV4UV/qjN4xZ/z/V9nm7lz8wP70J1lJ0nWPZc
	D/lcroT9dLWQzI98hHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swElZ-00000008EvH-2sIV;
	Thu, 03 Oct 2024 05:52:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swElW-00000008EtY-0cUb
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 05:52:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20b95359440so4167215ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 22:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727934761; x=1728539561; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PWqERqg3U39KNd0HaWAEa6vnW1C/QZVmIPIZ8zAz/+s=;
        b=ZwT9W39YwzoellUuB47jaXj5xNgD1dx3JeT9VZz9IsDYKcywjpsikVWP6jKvodQkQY
         LZabvPiZ6IjRms0x8b0geGC7W6O/I76BPhkJYDx6aHXASWN16LZHQxN7AVNKFanVhakL
         42NxD7eNcLmwsThQBg8ok29D+t97m9nA+d+zrcF/Jh4T7pHbQMMytmRtBx6En+WqoBYy
         SubmwLpIqutNwV5HGEMByWP3PjgYKKQeoRaJy/r0Kfhv6/Crr10vCEkTZGiNGqqpe6u0
         zJR8Up3GtZue50Y1SDQMOVnmve2loSdlDc9XAF1DR4SCtg0rkT96f8BqFIJjH6gZNRBC
         FqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727934761; x=1728539561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWqERqg3U39KNd0HaWAEa6vnW1C/QZVmIPIZ8zAz/+s=;
        b=VL96bpNy64YL1hCq1cGfDuMzxd+RWO8qPYRnN4BNgg7B4hwzgSP8bNfbV0nTeQG5m7
         QYgSj2uRcPnNcwTTWy1kne56ENLkbA9xW+th3Ba0s0o1KDcRFIfSpIPx/kVJifj6zF73
         j6qHGpdmFlNjalyV2IAvfmWG+Z1lxpRyMpVrS0qKGN75HYK65PqPqvotGho0jFN0JNy8
         gnv43h8/MqOO2VfT8lEsYrEXKw5ZYc6kNAjHeKVADHDAp+DDalec0+JfQ146GPDi5xKJ
         Vmja/5GIw7K6zQjjnUwVV14n9DDDERL8RDYiJrIglC0J2spa7Hi8N7FlrC5HejaXWapA
         CZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgrT2ih9gEtvwK8/TmHq6bINCh0s/U3Z/cPJpScPGnVu4jY/CPFXe37KyHzPEypkVVCN3JmSgRJ5YJ3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe08UEqHNoaH8EHcffhX4GSy79cXbU2iIGw5KAUw4ADNXkKnYr
	iuUO1UcrZAhknqISD4pu6JIFdzfI+oEXouWFnLwd5ZJJux8tl6ELZvQu5AMYvsI=
X-Google-Smtp-Source: AGHT+IHwG+qEvOVXqNgTsAzSqC6vFZ7T7Hg9FDqIn4lMxAVd8/F6MYaOVHqMKlTTCKJ0rlJTtIqTqA==
X-Received: by 2002:a17:902:c947:b0:20b:7388:f74 with SMTP id d9443c01a7336-20bc59f06a6mr79326325ad.12.1727934760837;
        Wed, 02 Oct 2024 22:52:40 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20bef70706esm2181765ad.291.2024.10.02.22.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 22:52:40 -0700 (PDT)
Date: Wed, 2 Oct 2024 22:52:38 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] net: stmmac: Add glue layer for T-HEAD TH1520 SoC
Message-ID: <Zv4xJge/rmMNzLAY@x1>
References: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
 <20240930-th1520-dwmac-v3-2-ae3e03c225ab@tenstorrent.com>
 <CAJM55Z-+-Ca3kNuNkTpfea8jYEDTdojhx=gM__MScVyT3Yomog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-+-Ca3kNuNkTpfea8jYEDTdojhx=gM__MScVyT3Yomog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_225242_236235_8C109434 
X-CRM114-Status: GOOD (  31.62  )
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

On Tue, Oct 01, 2024 at 02:48:13AM -0700, Emil Renner Berthing wrote:
> Drew Fustini wrote:
> > From: Jisheng Zhang <jszhang@kernel.org>
> >
> > Add dwmac glue driver to support the DesignWare-based GMAC controllers
> > on the T-HEAD TH1520 SoC.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > [esmil: rename plat->interface -> plat->mac_interface,
> >         use devm_stmmac_probe_config_dt()]
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > [drew: convert from stmmac_dvr_probe() to devm_stmmac_pltfr_probe()]
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >  MAINTAINERS                                       |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig       |  11 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile      |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 291 ++++++++++++++++++++++
> >  4 files changed, 304 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9e50107efb37..1d24863c01df 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19946,6 +19946,7 @@ F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
> >  F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> >  F:	arch/riscv/boot/dts/thead/
> >  F:	drivers/clk/thead/clk-th1520-ap.c
> > +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> >  F:	drivers/pinctrl/pinctrl-th1520.c
> >  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > index 05cc07b8f48c..82030adaf16e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -228,6 +228,17 @@ config DWMAC_SUN8I
> >  	  stmmac device driver. This driver is used for H3/A83T/A64
> >  	  EMAC ethernet controller.
> >
> > +config DWMAC_THEAD
> > +	tristate "T-HEAD dwmac support"
> > +	depends on OF && (ARCH_THEAD || COMPILE_TEST)
> > +	select MFD_SYSCON
> > +	help
> > +	  Support for ethernet controllers on T-HEAD RISC-V SoCs
> > +
> > +	  This selects the T-HEAD platform specific glue layer support for
> > +	  the stmmac device driver. This driver is used for T-HEAD TH1520
> > +	  ethernet controller.
> > +
> >  config DWMAC_IMX8
> >  	tristate "NXP IMX8 DWMAC support"
> >  	default ARCH_MXC
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > index c2f0e91f6bf8..d065634c6223 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -28,6 +28,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
> >  obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
> >  obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
> >  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
> > +obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
> >  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
> >  obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
> >  obj-$(CONFIG_DWMAC_LOONGSON1)	+= dwmac-loongson1.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > new file mode 100644
> > index 000000000000..f2f94539c0d2
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > @@ -0,0 +1,291 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * T-HEAD DWMAC platform driver
> > + *
> > + * Copyright (C) 2021 Alibaba Group Holding Limited.
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + *
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_net.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +#define GMAC_CLK_EN			0x00
> > +#define  GMAC_TX_CLK_EN			BIT(1)
> > +#define  GMAC_TX_CLK_N_EN		BIT(2)
> > +#define  GMAC_TX_CLK_OUT_EN		BIT(3)
> > +#define  GMAC_RX_CLK_EN			BIT(4)
> > +#define  GMAC_RX_CLK_N_EN		BIT(5)
> > +#define  GMAC_EPHY_REF_CLK_EN		BIT(6)
> > +#define GMAC_RXCLK_DELAY_CTRL		0x04
> > +#define  GMAC_RXCLK_BYPASS		BIT(15)
> > +#define  GMAC_RXCLK_INVERT		BIT(14)
> > +#define  GMAC_RXCLK_DELAY_MASK		GENMASK(4, 0)
> > +#define  GMAC_RXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> > +#define GMAC_TXCLK_DELAY_CTRL		0x08
> > +#define  GMAC_TXCLK_BYPASS		BIT(15)
> > +#define  GMAC_TXCLK_INVERT		BIT(14)
> > +#define  GMAC_TXCLK_DELAY_MASK		GENMASK(4, 0)
> > +#define  GMAC_TXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> > +#define GMAC_PLLCLK_DIV			0x0c
> > +#define  GMAC_PLLCLK_DIV_EN		BIT(31)
> > +#define  GMAC_PLLCLK_DIV_MASK		GENMASK(7, 0)
> > +#define  GMAC_PLLCLK_DIV_NUM(x)		FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
> > +#define GMAC_GTXCLK_SEL			0x18
> > +#define  GMAC_GTXCLK_SEL_PLL		BIT(0)
> > +#define GMAC_INTF_CTRL			0x1c
> > +#define  PHY_INTF_MASK			BIT(0)
> > +#define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
> > +#define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
> > +#define GMAC_TXCLK_OEN			0x20
> > +#define  TXCLK_DIR_MASK			BIT(0)
> > +#define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
> > +#define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
> > +
> > +#define GMAC_GMII_RGMII_RATE	125000000
> > +#define GMAC_MII_RATE		25000000
> > +
> > +static const struct regmap_config regmap_config = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +};
> > +
> > +struct thead_dwmac {
> > +	struct plat_stmmacenet_data *plat;
> > +	struct regmap *apb_regmap;
> > +	struct device *dev;
> > +};
> > +
> > +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> > +{
> > +	struct thead_dwmac *dwmac = plat->bsp_priv;
> > +	u32 phyif;
> > +
> > +	switch (plat->mac_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		phyif = PHY_INTF_MII_GMII;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		phyif = PHY_INTF_RGMII;
> > +		break;
> > +	default:
> > +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > +			plat->mac_interface);
> > +		return -EINVAL;
> > +	};
> > +
> > +	return regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
> > +}
> > +
> > +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> > +{
> > +	struct thead_dwmac *dwmac = plat->bsp_priv;
> > +	u32 txclk_dir;
> > +
> > +	switch (plat->mac_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		txclk_dir = TXCLK_DIR_INPUT;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		txclk_dir = TXCLK_DIR_OUTPUT;
> > +		break;
> > +	default:
> > +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > +			plat->mac_interface);
> > +		return -EINVAL;
> > +	};
> > +
> > +	return regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
> > +}
> > +
> > +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> > +{
> > +	struct plat_stmmacenet_data *plat;
> > +	struct thead_dwmac *dwmac = priv;
> > +	unsigned long rate;
> > +	u32 div;
> > +
> > +	plat = dwmac->plat;
> > +
> > +	switch (plat->mac_interface) {
> > +	/* For MII, rxc/txc is provided by phy */
> > +	case PHY_INTERFACE_MODE_MII:
> > +		return;
> > +
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		rate = clk_get_rate(plat->stmmac_clk);
> > +		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
> > +		    rate % GMAC_MII_RATE != 0) {
> > +			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
> > +			return;
> > +		}
> > +
> > +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
> > +
> > +		switch (speed) {
> > +		case SPEED_1000:
> > +			div = rate / GMAC_GMII_RGMII_RATE;
> > +			break;
> > +		case SPEED_100:
> > +			div = rate / GMAC_MII_RATE;
> > +			break;
> > +		case SPEED_10:
> > +			div = rate * 10 / GMAC_MII_RATE;
> > +			break;
> > +		default:
> > +			dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > +			return;
> > +		}
> > +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> > +				   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
> > +
> > +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> > +				   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
> > +		break;
> > +	default:
> > +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > +			plat->mac_interface);
> > +		return;
> > +	}
> > +}
> > +
> > +static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
> > +{
> > +	struct thead_dwmac *dwmac = plat->bsp_priv;
> > +	int err;
> > +	u32 reg;
> > +
> > +	switch (plat->mac_interface) {
> > +	case PHY_INTERFACE_MODE_MII:
> > +		reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
> > +		break;
> > +
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		/* use pll */
> > +		err = regmap_write(dwmac->apb_regmap, GMAC_GTXCLK_SEL, GMAC_GTXCLK_SEL_PLL);
> > +		if (err)
> > +			return dev_err_probe(dwmac->dev, err,
> > +					     "failed to set phy interface\n");
> > +
> > +		reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
> > +		      GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;
> > +		break;
> > +
> > +	default:
> > +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > +			plat->mac_interface);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return regmap_write(dwmac->apb_regmap, GMAC_CLK_EN, reg);
> > +}
> > +
> > +static int thead_dwmac_init(struct platform_device *pdev, void *priv)
> > +{
> > +	struct thead_dwmac *dwmac = priv;
> > +	int ret;
> > +
> > +	ret = thead_dwmac_set_phy_if(dwmac->plat);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = thead_dwmac_set_txclk_dir(dwmac->plat);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
> > +			   GMAC_RXCLK_DELAY_VAL(0));
> > +	if (ret)
> > +		return dev_err_probe(dwmac->dev, ret,
> > +				     "failed to set GMAC RX clock delay\n");
> > +
> > +	ret = regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
> > +			   GMAC_TXCLK_DELAY_VAL(0));
> > +	if (ret)
> > +		return dev_err_probe(dwmac->dev, ret,
> > +				     "failed to set GMAC TX clock delay\n");
> > +
> > +	return thead_dwmac_enable_clk(dwmac->plat);
> > +}
> > +
> > +static int thead_dwmac_probe(struct platform_device *pdev)
> > +{
> > +	struct stmmac_resources stmmac_res;
> > +	struct plat_stmmacenet_data *plat;
> > +	struct thead_dwmac *dwmac;
> > +	void __iomem *apb;
> > +	int ret;
> > +
> > +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to get resources\n");
> > +
> > +	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > +	if (IS_ERR(plat))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> > +				     "dt configuration failed\n");
> > +
> > +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> > +	if (!dwmac)
> > +		return -ENOMEM;
> > +
> > +	apb = devm_platform_ioremap_resource(pdev, 1);
> > +	if (IS_ERR(apb))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(apb),
> > +				     "Failed to remap gmac apb registers\n");
> > +
> > +	dwmac->apb_regmap = devm_regmap_init_mmio(&pdev->dev, apb, &regmap_config);
> > +	if (IS_ERR(dwmac->apb_regmap))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->apb_regmap),
> > +				     "Failed to access gmac apb registers\n");
> 
> Why do you need to convert the APB range to a regmap? As far as I can tell it's
> just regular 32bit memory mapped registers, so should work fine with just
> readl()/writel()

Good point, I don't think there is any benefit to using regmap. I will
change the next revision to use writel() instead. I just tested this and
the network interface still works okay.

Thanks,
Drew

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index f2f94539c0d2..df2fe0fdd128 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -13,7 +13,6 @@
 #include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
-#include <linux/regmap.h>
 
 #include "stmmac_platform.h"
 
@@ -52,15 +51,9 @@
 #define GMAC_GMII_RGMII_RATE	125000000
 #define GMAC_MII_RATE		25000000
 
-static const struct regmap_config regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-};
-
 struct thead_dwmac {
 	struct plat_stmmacenet_data *plat;
-	struct regmap *apb_regmap;
+	void __iomem *apb_base;
 	struct device *dev;
 };
 
@@ -85,7 +78,8 @@ static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
 		return -EINVAL;
 	};
 
-	return regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
+	writel(phyif, dwmac->apb_base + GMAC_INTF_CTRL);
+	return 0;
 }
 
 static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
@@ -109,7 +103,8 @@ static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
 		return -EINVAL;
 	};
 
-	return regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
+	writel(txclk_dir, dwmac->apb_base + GMAC_TXCLK_OEN);
+	return 0;
 }
 
 static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
@@ -117,7 +112,7 @@ static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int m
 	struct plat_stmmacenet_data *plat;
 	struct thead_dwmac *dwmac = priv;
 	unsigned long rate;
-	u32 div;
+	u32 div, reg;
 
 	plat = dwmac->plat;
 
@@ -137,7 +132,7 @@ static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int m
 			return;
 		}
 
-		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
+		writel(FIELD_PREP(GMAC_PLLCLK_DIV_EN, 0), dwmac->apb_base + GMAC_PLLCLK_DIV);
 
 		switch (speed) {
 		case SPEED_1000:
@@ -153,11 +148,10 @@ static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int m
 			dev_err(dwmac->dev, "invalid speed %u\n", speed);
 			return;
 		}
-		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
-				   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
 
-		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
-				   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
+		reg = FIELD_PREP(GMAC_PLLCLK_DIV_EN, 1) |
+		      FIELD_PREP(GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
+		writel(reg, dwmac->apb_base + GMAC_PLLCLK_DIV);
 		break;
 	default:
 		dev_err(dwmac->dev, "unsupported phy interface %d\n",
@@ -169,7 +163,6 @@ static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int m
 static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
 {
 	struct thead_dwmac *dwmac = plat->bsp_priv;
-	int err;
 	u32 reg;
 
 	switch (plat->mac_interface) {
@@ -182,11 +175,7 @@ static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		/* use pll */
-		err = regmap_write(dwmac->apb_regmap, GMAC_GTXCLK_SEL, GMAC_GTXCLK_SEL_PLL);
-		if (err)
-			return dev_err_probe(dwmac->dev, err,
-					     "failed to set phy interface\n");
-
+		writel(GMAC_GTXCLK_SEL_PLL, dwmac->apb_base + GMAC_GTXCLK_SEL);
 		reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
 		      GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;
 		break;
@@ -197,7 +186,8 @@ static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
 		return -EINVAL;
 	}
 
-	return regmap_write(dwmac->apb_regmap, GMAC_CLK_EN, reg);
+	writel(reg, dwmac->apb_base + GMAC_CLK_EN);
+	return 0;
 }
 
 static int thead_dwmac_init(struct platform_device *pdev, void *priv)
@@ -213,17 +203,8 @@ static int thead_dwmac_init(struct platform_device *pdev, void *priv)
 	if (ret)
 		return ret;
 
-	ret = regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
-			   GMAC_RXCLK_DELAY_VAL(0));
-	if (ret)
-		return dev_err_probe(dwmac->dev, ret,
-				     "failed to set GMAC RX clock delay\n");
-
-	ret = regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
-			   GMAC_TXCLK_DELAY_VAL(0));
-	if (ret)
-		return dev_err_probe(dwmac->dev, ret,
-				     "failed to set GMAC TX clock delay\n");
+	writel(GMAC_RXCLK_DELAY_VAL(0), dwmac->apb_base + GMAC_RXCLK_DELAY_CTRL);
+	writel(GMAC_TXCLK_DELAY_VAL(0), dwmac->apb_base + GMAC_TXCLK_DELAY_CTRL);
 
 	return thead_dwmac_enable_clk(dwmac->plat);
 }
@@ -255,13 +236,9 @@ static int thead_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(apb),
 				     "Failed to remap gmac apb registers\n");
 
-	dwmac->apb_regmap = devm_regmap_init_mmio(&pdev->dev, apb, &regmap_config);
-	if (IS_ERR(dwmac->apb_regmap))
-		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->apb_regmap),
-				     "Failed to access gmac apb registers\n");
-
 	dwmac->dev = &pdev->dev;
 	dwmac->plat = plat;
+	dwmac->apb_base = apb;
 	plat->bsp_priv = dwmac;
 	plat->fix_mac_speed = thead_dwmac_fix_speed;
 	plat->init = thead_dwmac_init;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
