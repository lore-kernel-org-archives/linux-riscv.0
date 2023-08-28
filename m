Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3745AC83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 16:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLa5beIsaKq6gCJPRZkEInssWYAsr+NBby8vwcOeBEI=; b=DE6wJtlIB587nf
	dlJqii6cN0f3Ql2zOQzqziBPJZAH6FPmEMPZshgCqGEAL4JGyv5wvflyMGM1Xx3xWQVsyZBTbIcL2
	+8FmCEIb0wWD+GeihA1b59P2fmmsdKXlHNcOYflfJcM51RL3Uydmp80GYbKzZYpF2SHzbvZ2nR/Hq
	2UoeJXaWAl3/P82ieES6fVmWhX718hw8GLE9KiYTvoF38Pxp/IR74OOGib8BtaV4/KL6HgdJplTh7
	kqNfQi9+yf2D8JQL83rcT4HbZ7IN1/Z0w1lsm3xr9WiWGB0/p1Azrym0kvGX7V9URo7STEF6+Azbs
	BPslmXaqjT0AryN4qeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qafY6-009wed-2p;
	Mon, 28 Aug 2023 16:57:10 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qafY3-009wdk-0g
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 16:57:10 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A50E13F65E
	for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693241821;
	bh=/HH1I+FxaPyMqvr2xW4lvphl2+/GSXm7Z7s+Wycc9k0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rEdznWTViG3Z7Q2W3WpWm9ejafPZm13la4brmow6UB890HGqhd2Yq1RyzakeDhgUX
	 NeBBx46NOw5Qiaa6kKzV+hkFEGuYjwcRQakhns7EMf8vs1fQR3O/vcKq+nBO6jvEAS
	 LzgEdjzr4hXN6QTSKGb1ACUZNaU4nxC893PygVurBdXJjpOj72ZW7jecK0aPn0j4Ce
	 SPomKFpadSpAN2uyWk2e8O1ocGRXZGiXGdSrhPdcYsIKRccBVfmzYWudrhm1iV0hHa
	 p823CzvfjV+cGJIYJccAyTf/suz70fZ8ZlIuTrN1XQwmgLzM0ogNIBp4Lbl1DayENk
	 NazdYJ8tx8BCw==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40ea01f3e3bso41165111cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 09:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693241820; x=1693846620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HH1I+FxaPyMqvr2xW4lvphl2+/GSXm7Z7s+Wycc9k0=;
        b=QOiGYifRv8ktZNpjNWJq4NQH+UiEhf7Ebm8cqLQ8DUAo23Tne3QIfM+Ea/9o1+k53s
         co+icCC5jx50PNPmzU/MFhXvWCbz/fMWSXavV7+0YIKMrxxtBFuy7F/2gsAsgaA3pNBv
         HyNsXoUTL1EZCwvCGQUGJrYdUXnz5obN265kh3dq7UUswAWb6040niBdo25+GVW+R9ri
         g9G/LmaHX8Yl+ne7G0b49Q8vdfuxjVkoZKvWhe0vilPZHG96qTmDLpmIx8Yo8IyvNsf6
         J1PEzS7eLD7HrOgQIS9FJ2pxEJs+wtyfXX3A1GOA0xBZvKTqyugb2wHbnH5OO3Vk+9iV
         PK6Q==
X-Gm-Message-State: AOJu0YxDgF4C2o3YNALzqKzWQzuPLzOc2gchCjsyIeNQkxkWdnLa83Ny
	gOZVNwl8Tlq4FbfM0S/kuwnLcVLk4mDY+wGFdMYRxCoi92hUuGwuIN24cCvTw7HV8QGIX9W9q1+
	keqCPxBYjzhAFubKUab638FIvmVaOXnTDTVH+u6l+I+nctzOvuCbpcSnOipmiYw==
X-Received: by 2002:a05:622a:15d1:b0:410:a54d:dea4 with SMTP id d17-20020a05622a15d100b00410a54ddea4mr27046698qty.48.1693241820715;
        Mon, 28 Aug 2023 09:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy6qGsOYe081xFAOiF7yVbryLOTebDnrPXjzGkrbEoB+oJWBgJ1Fnrc2eSywhNv6BM5h0fFVg624X5B1zXAnw=
X-Received: by 2002:a05:622a:15d1:b0:410:a54d:dea4 with SMTP id
 d17-20020a05622a15d100b00410a54ddea4mr27046659qty.48.1693241820325; Mon, 28
 Aug 2023 09:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230827091710.1483-1-jszhang@kernel.org> <20230827091710.1483-4-jszhang@kernel.org>
 <maj7mkdtkhp3z7xzcwvopnup3lhm5h5wyxz3j2ljryjbwpwilx@xdizgwctqukn> <ZOzAO5xhWdGcBXD1@xhacker>
In-Reply-To: <ZOzAO5xhWdGcBXD1@xhacker>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 28 Aug 2023 18:56:43 +0200
Message-ID: <CAJM55Z--LznLXZcg6cdxqAMUiN1zzsa6_YZVVNOM=K6eMrOqXw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: add glue layer for T-HEAD
 TH1520 SoC
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime@web.codeaurora.org, 
	Coquelin@web.codeaurora.org, Simon Horman <simon.horman@corigine.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_095707_654037_3F487896 
X-CRM114-Status: GOOD (  37.72  )
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

On Mon, 28 Aug 2023 at 17:55, Jisheng Zhang <jszhang@kernel.org> wrote:
> On Mon, Aug 28, 2023 at 04:40:19PM +0300, Serge Semin wrote:
> > On Sun, Aug 27, 2023 at 05:17:10PM +0800, Jisheng Zhang wrote:
> > > Add dwmac glue driver to support the dwmac on the T-HEAD TH1520 SoC.
> > >
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
> > >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> > >  .../net/ethernet/stmicro/stmmac/dwmac-thead.c | 302 ++++++++++++++++++
> > >  3 files changed, 314 insertions(+)
> > >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > index 06c6871f8788..1bf71804c270 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > > @@ -216,6 +216,17 @@ config DWMAC_SUN8I
> > >       stmmac device driver. This driver is used for H3/A83T/A64
> > >       EMAC ethernet controller.
> > >
> > > +config DWMAC_THEAD
> > > +   tristate "T-HEAD dwmac support"
> > > +   depends on OF && (ARCH_THEAD || COMPILE_TEST)
> > > +   select MFD_SYSCON
> > > +   help
> > > +     Support for ethernet controllers on T-HEAD RISC-V SoCs
> > > +
> > > +     This selects the T-HEAD platform specific glue layer support for
> > > +     the stmmac device driver. This driver is used for T-HEAD TH1520
> > > +     ethernet controller.
> > > +
> > >  config DWMAC_IMX8
> > >     tristate "NXP IMX8 DWMAC support"
> > >     default ARCH_MXC
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > index 5b57aee19267..d73171ed6ad7 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > > @@ -27,6 +27,7 @@ obj-$(CONFIG_DWMAC_STI)           += dwmac-sti.o
> > >  obj-$(CONFIG_DWMAC_STM32)  += dwmac-stm32.o
> > >  obj-$(CONFIG_DWMAC_SUNXI)  += dwmac-sunxi.o
> > >  obj-$(CONFIG_DWMAC_SUN8I)  += dwmac-sun8i.o
> > > +obj-$(CONFIG_DWMAC_THEAD)  += dwmac-thead.o
> > >  obj-$(CONFIG_DWMAC_DWC_QOS_ETH)    += dwmac-dwc-qos-eth.o
> > >  obj-$(CONFIG_DWMAC_INTEL_PLAT)     += dwmac-intel-plat.o
> > >  obj-$(CONFIG_DWMAC_GENERIC)        += dwmac-generic.o
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > new file mode 100644
> > > index 000000000000..85135ef05906
> > > --- /dev/null
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> > > @@ -0,0 +1,302 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * T-HEAD DWMAC platform driver
> > > + *
> > > + * Copyright (C) 2021 Alibaba Group Holding Limited.
> > > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > + *
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/of_net.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include "stmmac_platform.h"
> > > +
> > > +#define GMAC_CLK_EN                        0x00
> > > +#define  GMAC_TX_CLK_EN                    BIT(1)
> > > +#define  GMAC_TX_CLK_N_EN          BIT(2)
> > > +#define  GMAC_TX_CLK_OUT_EN                BIT(3)
> > > +#define  GMAC_RX_CLK_EN                    BIT(4)
> > > +#define  GMAC_RX_CLK_N_EN          BIT(5)
> > > +#define  GMAC_EPHY_REF_CLK_EN              BIT(6)
> > > +#define GMAC_RXCLK_DELAY_CTRL              0x04
> > > +#define  GMAC_RXCLK_BYPASS         BIT(15)
> > > +#define  GMAC_RXCLK_INVERT         BIT(14)
> > > +#define  GMAC_RXCLK_DELAY_MASK             GENMASK(4, 0)
> > > +#define  GMAC_RXCLK_DELAY_VAL(x)   FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> > > +#define GMAC_TXCLK_DELAY_CTRL              0x08
> > > +#define  GMAC_TXCLK_BYPASS         BIT(15)
> > > +#define  GMAC_TXCLK_INVERT         BIT(14)
> > > +#define  GMAC_TXCLK_DELAY_MASK             GENMASK(4, 0)
> > > +#define  GMAC_TXCLK_DELAY_VAL(x)   FIELD_PREP(GMAC_RXCLK_DELAY_MASK, (x))
> > > +#define GMAC_PLLCLK_DIV                    0x0c
> > > +#define  GMAC_PLLCLK_DIV_EN                BIT(31)
> > > +#define  GMAC_PLLCLK_DIV_MASK              GENMASK(7, 0)
> > > +#define  GMAC_PLLCLK_DIV_NUM(x)            FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
> > > +#define GMAC_GTXCLK_SEL                    0x18
> > > +#define  GMAC_GTXCLK_SEL_PLL               BIT(0)
> > > +#define GMAC_INTF_CTRL                     0x1c
> > > +#define  PHY_INTF_MASK                     BIT(0)
> > > +#define  PHY_INTF_RGMII                    FIELD_PREP(PHY_INTF_MASK, 1)
> > > +#define  PHY_INTF_MII_GMII         FIELD_PREP(PHY_INTF_MASK, 0)
> > > +#define GMAC_TXCLK_OEN                     0x20
> > > +#define  TXCLK_DIR_MASK                    BIT(0)
> > > +#define  TXCLK_DIR_OUTPUT          FIELD_PREP(TXCLK_DIR_MASK, 0)
> > > +#define  TXCLK_DIR_INPUT           FIELD_PREP(TXCLK_DIR_MASK, 1)
> > > +
> > > +#define GMAC_GMII_RGMII_RATE       125000000
> > > +#define GMAC_MII_RATE              25000000
> > > +
> > > +struct thead_dwmac {
> > > +   struct plat_stmmacenet_data *plat;
> > > +   struct regmap *apb_regmap;
> > > +   struct device *dev;
> > > +   u32 rx_delay;
> > > +   u32 tx_delay;
> > > +};
> > > +
> > > +static int thead_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
> > > +{
> > > +   struct thead_dwmac *dwmac = plat->bsp_priv;
> > > +   u32 phyif;
> > > +
> > > +   switch (plat->interface) {
> > > +   case PHY_INTERFACE_MODE_MII:
> > > +           phyif = PHY_INTF_MII_GMII;
> > > +           break;
> > > +   case PHY_INTERFACE_MODE_RGMII:
> > > +   case PHY_INTERFACE_MODE_RGMII_ID:
> > > +   case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +   case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +           phyif = PHY_INTF_RGMII;
> > > +           break;
> > > +   default:
> > > +           dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > +                   plat->interface);
> > > +           return -EINVAL;
> > > +   };
> > > +
> > > +   regmap_write(dwmac->apb_regmap, GMAC_INTF_CTRL, phyif);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> > > +{
> > > +   struct thead_dwmac *dwmac = plat->bsp_priv;
> > > +   u32 txclk_dir;
> > > +
> > > +   switch (plat->interface) {
> > > +   case PHY_INTERFACE_MODE_MII:
> > > +           txclk_dir = TXCLK_DIR_INPUT;
> > > +           break;
> > > +   case PHY_INTERFACE_MODE_RGMII:
> > > +   case PHY_INTERFACE_MODE_RGMII_ID:
> > > +   case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +   case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +           txclk_dir = TXCLK_DIR_OUTPUT;
> > > +           break;
> > > +   default:
> > > +           dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > +                   plat->interface);
> > > +           return -EINVAL;
> > > +   };
> > > +
> > > +   regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> > > +{
> > > +   struct thead_dwmac *dwmac = priv;
> > > +   struct plat_stmmacenet_data *plat = dwmac->plat;
> > > +   unsigned long rate;
> > > +   u32 div;
> > > +
> > > +   switch (plat->interface) {
> > > +   /* For MII, rxc/txc is provided by phy */
> > > +   case PHY_INTERFACE_MODE_MII:
> > > +           return;
> > > +
> > > +   case PHY_INTERFACE_MODE_RGMII:
> > > +   case PHY_INTERFACE_MODE_RGMII_ID:
> > > +   case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +   case PHY_INTERFACE_MODE_RGMII_TXID:
> >
> > > +           rate = clk_get_rate(plat->stmmac_clk);
> > > +           if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
> > > +               rate % GMAC_MII_RATE != 0) {
> > > +                   dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
> > > +                   return;
> > > +           }
> > > +
> > > +           regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
> > > +
> > > +           switch (speed) {
> > > +           case SPEED_1000:
> > > +                   div = rate / GMAC_GMII_RGMII_RATE;
> > > +                   break;
> > > +           case SPEED_100:
> > > +                   div = rate / GMAC_MII_RATE;
> > > +                   break;
> > > +           case SPEED_10:
> > > +                   div = rate * 10 / GMAC_MII_RATE;
> > > +                   break;
> > > +           default:
> > > +                   dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > > +                   return;
> > > +           }
> > > +           regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> > > +                              GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
> > > +
> > > +           regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> > > +                              GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
> >
> > This chunk looks like a hard-coded implementation of the
> > CLK_SET_RATE_GATE Tx-clocks rate setup which parental clock is the
> > "stmmaceth" clock. I suggest to move it to the respective driver, add
> > a "tx" clock to the bindings and use the common clock kernel API
> > methods here only.
>
> I did consider your solution before writing the code, here are the
> reasons why I dropped it:
>
> There's no any clk IP here, the HW just puts several
> gmac related control bits here, such as rx/tx delay, bypass, invert
> interface choice, clk direction. From this point of view, it looks more
> like a syscon rather than clk.

Hi Jisheng.

That's not really a compelling argument to do the clock manipulation
here. Look at the StarFive JH7110 PLL clock driver. It's exactly a
clock driver for just the registers controlling the PLLs among the
other syscon registers.

> Secondly, I see other SoCs did similar for this case, such as
> dwmac-visconti, dwmac-meson8b, dwmac-ipq806x, dwmac-socfpga and so on.
> They met similar issue as the above.
>
> PS: here is the initial th1520 clk driver, as is seen, the clk IP is
> different from the control logic here.
>
> https://lore.kernel.org/linux-riscv/20230515054402.27633-1-frank.li@vivo.com/
>
> Thanks
>
> >
> > > +           break;
> > > +   default:
> > > +           dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > +                   plat->interface);
> > > +           return;
> > > +   }
> > > +}
> > > +
> > > +static int thead_dwmac_enable_clk(struct plat_stmmacenet_data *plat)
> > > +{
> > > +   struct thead_dwmac *dwmac = plat->bsp_priv;
> > > +   u32 reg;
> > > +
> > > +   switch (plat->interface) {
> > > +   case PHY_INTERFACE_MODE_MII:
> > > +           reg = GMAC_RX_CLK_EN | GMAC_TX_CLK_EN;
> > > +           break;
> > > +
> > > +   case PHY_INTERFACE_MODE_RGMII:
> > > +   case PHY_INTERFACE_MODE_RGMII_ID:
> > > +   case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +   case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +           /* use pll */
> > > +           regmap_write(dwmac->apb_regmap, GMAC_GTXCLK_SEL, GMAC_GTXCLK_SEL_PLL);
> > > +
> >
> > > +           reg = GMAC_TX_CLK_EN | GMAC_TX_CLK_N_EN | GMAC_TX_CLK_OUT_EN |
> > > +                 GMAC_RX_CLK_EN | GMAC_RX_CLK_N_EN;
> >
> > Similarly settings these flags looks like just clock gates which can
> > also be moved to the clock driver.
> >
> > > +           break;
> > > +
> > > +   default:
> > > +           dev_err(dwmac->dev, "unsupported phy interface %d\n",
> > > +                   plat->interface);
> > > +           return -EINVAL;
> > > +   }
> > > +
> > > +   regmap_write(dwmac->apb_regmap, GMAC_CLK_EN, reg);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int thead_dwmac_init(struct platform_device *pdev,
> > > +                       struct plat_stmmacenet_data *plat)
> > > +{
> > > +   struct thead_dwmac *dwmac = plat->bsp_priv;
> > > +   int ret;
> > > +
> > > +   ret = thead_dwmac_set_phy_if(plat);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   ret = thead_dwmac_set_txclk_dir(plat);
> > > +   if (ret)
> > > +           return ret;
> > > +
> > > +   regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
> > > +                GMAC_RXCLK_DELAY_VAL(dwmac->rx_delay));
> > > +   regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
> > > +                GMAC_TXCLK_DELAY_VAL(dwmac->tx_delay));
> > > +
> > > +   thead_dwmac_fix_speed(dwmac, SPEED_1000, 0);
> > > +
> > > +   return thead_dwmac_enable_clk(plat);
> > > +}
> > > +
> > > +static int thead_dwmac_probe(struct platform_device *pdev)
> > > +{
> > > +   struct plat_stmmacenet_data *plat;
> > > +   struct stmmac_resources stmmac_res;
> > > +   struct thead_dwmac *dwmac;
> > > +   struct device_node *np = pdev->dev.of_node;
> > > +   u32 delay_ps;
> > > +   int ret;
> > > +
> > > +   ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> > > +   if (ret)
> > > +           return dev_err_probe(&pdev->dev, ret,
> > > +                                "failed to get resources\n");
> > > +
> >
> > > +   plat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> >
> > This can be replaced with devm_stmmac_probe_config_dt() so the
> > stmmac_remove_config_dt() invocation would be dropped.
> >
> > > +   if (IS_ERR(plat))
> > > +           return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> > > +                                "dt configuration failed\n");
> > > +
> > > +   dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> > > +   if (!dwmac) {
> > > +           ret = -ENOMEM;
> > > +           goto err_remove_config_dt;
> > > +   }
> > > +
> > > +   if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay_ps))
> > > +           dwmac->rx_delay = delay_ps;
> > > +   if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay_ps))
> > > +           dwmac->tx_delay = delay_ps;
> > > +
> > > +   dwmac->apb_regmap = syscon_regmap_lookup_by_phandle(np, "thead,gmacapb");
> > > +   if (IS_ERR(dwmac->apb_regmap)) {
> > > +           ret = dev_err_probe(&pdev->dev, PTR_ERR(dwmac->apb_regmap),
> > > +                               "Failed to get gmac apb syscon\n");
> > > +           goto err_remove_config_dt;
> > > +   }
> > > +
> > > +   dwmac->dev = &pdev->dev;
> > > +   dwmac->plat = plat;
> > > +   plat->bsp_priv = dwmac;
> > > +   plat->fix_mac_speed = thead_dwmac_fix_speed;
> > > +
> >
> > > +   ret = thead_dwmac_init(pdev, plat);
> > > +   if (ret)
> > > +           goto err_remove_config_dt;
> > > +
> > > +   ret = stmmac_dvr_probe(&pdev->dev, plat, &stmmac_res);
> >
> > This can be replaced with:
> > plat->init = thead_dwmac_init;
> > ret = devm_stmmac_pltfr_probe();
> >
> > > +   if (ret)
> > > +           goto err_remove_config_dt;
> > > +
> > > +   return 0;
> > > +
> >
> > > +err_remove_config_dt:
> > > +   stmmac_remove_config_dt(pdev, plat);
> > > +
> > > +   return ret;
> >
> > This can be dropped if devm_stmmac_probe_config_dt() is utilized.
> >
> > > +}
> > > +
> > > +static const struct of_device_id thead_dwmac_match[] = {
> >
> > > +   { .compatible = "thead,th1520-dwmac" },
> >
> > See my comment to the bindings about the compatible string suffix.
> >
> > > +   { }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, thead_dwmac_match);
> > > +
> > > +static struct platform_driver thead_dwmac_driver = {
> > > +   .probe = thead_dwmac_probe,
> >
> > > +   .remove_new = stmmac_pltfr_remove,
> >
> > This can be dropped if devm_stmmac_probe_config_dt() and
> > devm_stmmac_pltfr_probe() are utilized.
> >
> > > +   .driver = {
> > > +           .name = "thead-dwmac",
> > > +           .pm = &stmmac_pltfr_pm_ops,
> > > +           .of_match_table = thead_dwmac_match,
> > > +   },
> > > +};
> > > +module_platform_driver(thead_dwmac_driver);
> > > +
> > > +MODULE_AUTHOR("T-HEAD");
> > > +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
> >
> > > +MODULE_DESCRIPTION("T-HEAD dwmac platform driver");
> >                               ^
> >                               |
> > Capitalize? ------------------+
> >
> > -Serge(y)
> >
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.40.1
> > >
> > >
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
