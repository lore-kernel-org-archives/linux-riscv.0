Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4FAC6FA8F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+0om3Khdk8YQNx8Es2EYWpp+SqrxBbf5S7IUS7lYoM=; b=A6CgrNFB7guTqU
	dh2nrhj3qzTCLuu5mVMHi8OQGNjq6+O0aSLtuKDrCVsysCj7z7eVjiBi2vUqLcnDyOB0guPBa16R1
	3BFoJwBmh2tys3iNbB/y9/AHTc04yOmh26DekyUShNlO7o+AQpx33v+9rDb8dJ5qF4vk4Z6rwXqED
	cBrivd//7220mm4rdUvqc10huKy/23lmEPdBAnQ7N82rH5CCxW5WzDfVD/DgwGkJmJ1UQn1IGE86e
	rFwSLcPIgS8DBx253vh8QGGODDizC5tF8N36DaubD9XSkr0QT9vVbw46qxYh3h5RXlWwS/qhgiSkv
	nnhwhHR2KOdhSFoKl6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qawmr-00BOpl-2G;
	Tue, 29 Aug 2023 11:21:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qawmn-00BOpI-2I;
	Tue, 29 Aug 2023 11:21:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFBA46404E;
	Tue, 29 Aug 2023 11:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F38EC433C8;
	Tue, 29 Aug 2023 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693308088;
	bh=QTVKl11mTqctnAFSquSoohAOA1GFh91gwHOo+og+hr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JstpJtw7DGYzvksl+Civ1nFzOIcDWQTcePiyINetcPRyn2LF80/c0SvWQF3Fvvzgh
	 1LRvblQePlJ2s/04I5YPK9uZynYQVTI9Fa84UAkz46LuyMVzmPIiFxDN2yOW8KwEeL
	 BfWeBH6GdPCafGln4FuBZnQ3m0hVB+3mNKiea/4DHndexDmXY8J0GbLvKftkZ1VW6W
	 PYIIdowG9IyAm8sr5kO6yOVTCn92q4EOneAbyeE2Rg6ei+sZ0+zI9SNrdAqNbzdEML
	 3KAHxgTGFAWlVuigKrfk1LSYcVfnV1C85cwBNQapNvdNV3GtmwD3b0GdaEwQW8x6fp
	 HU4Es633uWqmg==
Date: Tue, 29 Aug 2023 19:09:36 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Maxime@web.codeaurora.org,
	Coquelin@web.codeaurora.org,
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: add glue layer for T-HEAD
 TH1520 SoC
Message-ID: <ZO3R8KXx4dHp/YjZ@xhacker>
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-4-jszhang@kernel.org>
 <maj7mkdtkhp3z7xzcwvopnup3lhm5h5wyxz3j2ljryjbwpwilx@xdizgwctqukn>
 <ZOzAO5xhWdGcBXD1@xhacker>
 <logkjnuiq2jgrphv4y7bqy523zsj6pskafwzpfdg6grvk5m7jk@hgucfu4e6azo>
 <ZO1jWUa7xgZuHdRH@xhacker>
 <4fhck6gnoenwuvlzxky433c4lj3enc7kwgko77stzrgllgm2lr@5cnhz57twx42>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fhck6gnoenwuvlzxky433c4lj3enc7kwgko77stzrgllgm2lr@5cnhz57twx42>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_042129_861306_402A7D6E 
X-CRM114-Status: GOOD (  52.81  )
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

On Tue, Aug 29, 2023 at 01:07:39PM +0300, Serge Semin wrote:
> On Tue, Aug 29, 2023 at 11:17:45AM +0800, Jisheng Zhang wrote:
> > On Mon, Aug 28, 2023 at 08:30:50PM +0300, Serge Semin wrote:
> > > On Mon, Aug 28, 2023 at 11:41:47PM +0800, Jisheng Zhang wrote:
> > > > On Mon, Aug 28, 2023 at 04:40:19PM +0300, Serge Semin wrote:
> > > > > On Sun, Aug 27, 2023 at 05:17:10PM +0800, Jisheng Zhang wrote:
> > > > > > Add dwmac glue driver to support the dwmac on the T-HEAD TH1520 SoC.
> > > > > > 
> > > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > > ---
> > > > > >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
> > > > > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> > > > > >  .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 302 ++++++++++++++++++
> > > > > >  3 files changed, 314 insertions(+)
> > > > > >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > > > > 
> > > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > > > > index 06c6871f8788..1bf71804c270 100644
> > > > > > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > > > > @@ -216,6 +216,17 @@ config DWMAC_SUN8I
> > > > > >  	  stmmac device driver. This driver is used for H3/A83T/A64
> > > > > >  	  EMAC ethernet controller.
> > > > > >  
> > > > > > +config DWMAC_THEAD
> > > > > > +	tristate "T-HEAD dwmac support"
> > > > > > +	depends on OF && (ARCH_THEAD || COMPILE_TEST)
> > > > > > +	select MFD_SYSCON
> > > > > > +	help
> > > > > > +	  Support for ethernet controllers on T-HEAD RISC-V SoCs
> > > > > > +
> > > > > > +	  This selects the T-HEAD platform specific glue layer support for
> > > > > > +	  the stmmac device driver. This driver is used for T-HEAD TH1520
> > > > > > +	  ethernet controller.
> > > > > > +
> > > > > >  config DWMAC_IMX8
> > > > > >  	tristate "NXP IMX8 DWMAC support"
> > > > > >  	default ARCH_MXC
> > > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > > > > index 5b57aee19267..d73171ed6ad7 100644
> > > > > > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > > > > @@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
> > > > > >  obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
> > > > > >  obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
> > > > > >  obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
> > > > > > +obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
> > > > > >  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
> > > > > >  obj-$(CONFIG_DWMAC_INTEL_PLAT)	+= dwmac-intel-plat.o
> > > > > >  obj-$(CONFIG_DWMAC_GENERIC)	+= dwmac-generic.o
> > > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..85135ef05906
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > > > > @@ -0,0 +1,302 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > +/*
> > > > > > + * T-HEAD DWMAC platform driver
> > > > > > + *
> > > > > > + * Copyright (C) 2021 Alibaba Group Holding Limited.
> > > > > > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > > > > + *
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/bitfield.h>
> > > > > > +#include <linux/mfd/syscon.h>
> > > > > > +#include <linux/module.h>
> > > > > > +#include <linux/of.h>
> > > > > > +#include <linux/of_device.h>
> > > > > > +#include <linux/of_net.h>
> > > > > > +#include <linux/platform_device.h>
> > > > > > +#include <linux/regmap.h>
> > > > > > +
> > > > > > +#include "stmmac_platform.h"
> > > > > > +
> > > > > > +#define GMAC_CLK_EN			0x00
> > > > > > +#define  GMAC_TX_CLK_EN			BIT(1)
> > > > > > +#define  GMAC_TX_CLK_N_EN		BIT(2)
> > > > > > +#define  GMAC_TX_CLK_OUT_EN		BIT(3)
> > > > > > +#define  GMAC_RX_CLK_EN			BIT(4)
> > > > > > +#define  GMAC_RX_CLK_N_EN		BIT(5)
> > > > > > +#define  GMAC_EPHY_REF_CLK_EN		BIT(6)
> > > > > > +#define GMAC_RXCLK_DELAY_CTRL		0x04
> > > > > > +#define  GMAC_RXCLK_BYPASS		BIT(15)
> > > > > > +#define  GMAC_RXCLK_INVERT		BIT(14)
> > > > > > +#define  GMAC_RXCLK_DELAY_MASK		GENMASK(4, 0)
> > > > > > +#define  GMAC_RXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> > > > > > +#define GMAC_TXCLK_DELAY_CTRL		0x08
> > > > > > +#define  GMAC_TXCLK_BYPASS		BIT(15)
> > > > > > +#define  GMAC_TXCLK_INVERT		BIT(14)
> > > > > > +#define  GMAC_TXCLK_DELAY_MASK		GENMASK(4, 0)
> > > > > > +#define  GMAC_TXCLK_DELAY_VAL(x)	FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> > > > > > +#define GMAC_PLLCLK_DIV			0x0c
> > > > > > +#define  GMAC_PLLCLK_DIV_EN		BIT(31)
> > > > > > +#define  GMAC_PLLCLK_DIV_MASK		GENMASK(7, 0)
> > > > > > +#define  GMAC_PLLCLK_DIV_NUM(x)		FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
> > > > > > +#define GMAC_GTXCLK_SEL			0x18
> > > > > > +#define  GMAC_GTXCLK_SEL_PLL		BIT(0)
> > > > > > +#define GMAC_INTF_CTRL			0x1c
> > > > > > +#define  PHY_INTF_MASK			BIT(0)
> > > > > > +#define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
> > > > > > +#define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
> > > > > > +#define GMAC_TXCLK_OEN			0x20
> > > > > > +#define  TXCLK_DIR_MASK			BIT(0)
> > > > > > +#define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
> > > > > > +#define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
> > > > > > +
> > > > > > +#define GMAC_GMII_RGMII_RATE	125000000
> > > > > > +#define GMAC_MII_RATE		25000000
> > > > > > +
> > > > > > +struct thead_dwmac {
> > > > > > +	struct plat_stmmacenet_data *plat;
> > > > > > +	struct regmap *apb_regmap;
> > > > > > +	struct device *dev;
> > > > > > +	u32 rx_delay;
> > > > > > +	u32 tx_delay;
> > > > > > +};
> > > > > > +
> > > > > > +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> > > > > > +{
> > > > > > +	struct thead_dwmac *dwmac = plat->bsp_priv;
> > > > > > +	u32 phyif;
> > > > > > +
> > > > > > +	switch (plat->interface) {
> > > > > > +	case PHY_INTERFACE_MODE_MII:
> > > > > > +		phyif = PHY_INTF_MII_GMII;
> > > > > > +		break;
> > > > > > +	case PHY_INTERFACE_MODE_RGMII:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > > > > > +		phyif = PHY_INTF_RGMII;
> > > > > > +		break;
> > > > > > +	default:
> > > > > > +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > > > > +			plat->interface);
> > > > > > +		return -EINVAL;
> > > > > > +	};
> > > > > > +
> > > > > > +	regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> > > > > > +{
> > > > > > +	struct thead_dwmac *dwmac = plat->bsp_priv;
> > > > > > +	u32 txclk_dir;
> > > > > > +
> > > > > > +	switch (plat->interface) {
> > > > > > +	case PHY_INTERFACE_MODE_MII:
> > > > > > +		txclk_dir = TXCLK_DIR_INPUT;
> > > > > > +		break;
> > > > > > +	case PHY_INTERFACE_MODE_RGMII:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > > > > > +		txclk_dir = TXCLK_DIR_OUTPUT;
> > > > > > +		break;
> > > > > > +	default:
> > > > > > +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > > > > +			plat->interface);
> > > > > > +		return -EINVAL;
> > > > > > +	};
> > > > > > +
> > > > > > +	regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> > > > > > +{
> > > > > > +	struct thead_dwmac *dwmac = priv;
> > > > > > +	struct plat_stmmacenet_data *plat = dwmac->plat;
> > > > > > +	unsigned long rate;
> > > > > > +	u32 div;
> > > > > > +
> > > > > > +	switch (plat->interface) {
> > > > > > +	/* For MII, rxc/txc is provided by phy */
> > > > > > +	case PHY_INTERFACE_MODE_MII:
> > > > > > +		return;
> > > > > > +
> > > > > > +	case PHY_INTERFACE_MODE_RGMII:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > > > > > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > > > > 
> > > > > > +		rate = clk_get_rate(plat->stmmac_clk);
> > > > > > +		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
> > > > > > +		    rate % GMAC_MII_RATE != 0) {
> > > > > > +			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
> > > > > > +			return;
> > > > > > +		}
> > > > > > +
> > > > > > +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
> > > > > > +
> > > > > > +		switch (speed) {
> > > > > > +		case SPEED_1000:
> > > > > > +			div = rate / GMAC_GMII_RGMII_RATE;
> > > > > > +			break;
> > > > > > +		case SPEED_100:
> > > > > > +			div = rate / GMAC_MII_RATE;
> > > > > > +			break;
> > > > > > +		case SPEED_10:
> > > > > > +			div = rate * 10 / GMAC_MII_RATE;
> > > > > > +			break;
> > > > > > +		default:
> > > > > > +			dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > > > > > +			return;
> > > > > > +		}
> > > > > > +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> > > > > > +				   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
> > > > > > +
> > > > > > +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> > > > > > +				   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
> > > > > 
> > > > > This chunk looks like a hard-coded implementation of the
> > > > > CLK_SET_RATE_GATE Tx-clocks rate setup which parental clock is the
> > > > > "stmmaceth" clock. I suggest to move it to the respective driver, add
> > > > > a "tx" clock to the bindings and use the common clock kernel API
> > > > > methods here only.
> > > > 
> > > > I did consider your solution before writing the code, here are the
> > > > reasons why I dropped it:
> > > > 
> > > 
> > > > There's no any clk IP here, the HW just puts several
> > > > gmac related control bits here, such as rx/tx delay, bypass, invert
> > > > interface choice, clk direction. 
> > > 
> > > You omitted the essential part of your code which I pointed out.
> > > 
> > > > From this point of view, it looks more
> > > > like a syscon rather than clk.
> > > 
> 
> > > Toggling control bits is surely the syscon work. But gating a parental
> > > clock, settings up the parental clock _divider_ and ungating the clock
> > > back is the clock controller function. So it means your syscon is just
> > > a normal multi-function device, which one of the function is the clock
> > > controller.
> > > 
> > > It's not like your situation is unique. For instance in case of a SoC
> > > I was working with recently Clock Control Unit (CCU) was actually a
> > > multi-function device which had:
> > > 1. PLLs and Dividers supplying the clocks to the SoC components.
> > 
> > Hi Serge,
> > 
> > This is the big difference between your case and TH1520 gmac.
> 
> AFAICS my PCIe-part of the syscon is a similar story as your GMAC
> CSRs: enabled/disable several clock gates, setup a ref-clock divider,
> multiple flags with reset function and multiple flags/fields for the
> PCIe-controller tunings. All of that intermixed in a few registers. A
> similar thing was for the SATA-controller.
> 
> > (PS: @Emil, I read your comments in another reply. IIUC, jh7110 puts a
> > real clk IP for gmac tx clock purpose)
> > 
> 
> > However, There's no real clk IP in the TH1520 gmac related syscon, yep, div
> > and enable are some what clock related bits, but that's all, no more, no less.
> 
> These bits/fields are the clock-controller function of the syscon.
> Based on that your syscon is a multi-functional device which support
> the GMAC tunings and controls a reference clock gating/dividing.  The
> outputs from the clock gate and divider gets to be supplied to the
> TH1520 GMAC.
> 
> BTW Seeing you have only 0x20 bytes utilized in the glue driver I
> guess those registers chunk is a part of a bigger CSR space. Is it?

Nope, the 4KB reg space is dedicated to gmac control, and isn't
a part of a big reg space, and only 0~0x20 of the address space is used.

> 
> > So even in this case, another abstraction layer via. clk subsystem is still
> > preferred? IOW, a seperate clk driver for the gmac?
> 
> That's what I was told in a situation when I was trying to use a
> syscon to switch between the two parental clocks:
> https://lore.kernel.org/linux-ide/20220517201332.GB1462130-robh@kernel.org/
> 
> In your case IMO it is more preferred at the very least because it
> gives a more correct device description. Your bindings currently do
> not define the Tx/Rx reference clocks meanwhile the TH1520 GMAC do
> have them.
> 

Thank you, I will modify the code towards clk direction.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
