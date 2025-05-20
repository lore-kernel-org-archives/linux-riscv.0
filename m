Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DA1C54754
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 02:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXGBc1oSXSvjdK8QHx81ew6Oxjmtbd3OCNXRR/e1ZEY=; b=KiBFxP8qSDcBRo
	iL1B+P62SowmKc0FNw1srp+vm2XoMjpqrh7zqxyiujM66vJPdNJmBAbwDKSvJmyhHLqzwvW+Aj2jG
	o+AeO0LkqGR3nkw1zZ7GyNMRX7Oc97mwIK1PEr8IXOk0k9QJUB2PqmIxRZYYGQDQ2sjn1UiVXFsix
	JytdfGOVxJxqB74ZY6OjpVxSHnMJt7mjDa0KEE3Cm1gdqLU6SOjSj2Uh+p5sAEiH+EHjLmKyc3Bit
	48PC/ZU9YWDL0dGJ9B3IRinS5kzc+L2chJlBijLCGUgiMG0G18yInlIS8W6n9N1sKTytpWh7zsMc7
	p7KGsYovbjVg8WPdl9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCjH-0000000BKq3-28R1;
	Tue, 20 May 2025 02:29:19 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCjD-0000000BKmU-1WIG;
	Tue, 20 May 2025 02:29:17 +0000
Received: from localhost (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15a4db0bb;
	Tue, 20 May 2025 10:28:59 +0800 (GMT+08:00)
Date: Tue, 20 May 2025 10:28:58 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
Message-ID: <aCvo6h1wF7yrrzTV@jean.localdomain>
References: <20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn>
 <20250517-b4-k1-usb3-phy-v2-v3-4-e0655613a163@whut.edu.cn>
 <4110276c-8c64-4fd2-b166-c016509bc8a3@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4110276c-8c64-4fd2-b166-c016509bc8a3@linaro.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU0fVktDQ0seSkseTklKTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISk5MT1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a96eb85d66203a1kunmc62b929663898
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NVE6Aio4ITE1MiMOTQMyCzA0
	LhUaCktVSlVKTE9MTEtDSk9LSk5PVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFMT0pNNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_192915_621682_9B8CC606 
X-CRM114-Status: GOOD (  32.82  )
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

On Mon, May 19, 2025 at 03:10:24PM +0200, neil.armstrong@linaro.org wrote:
> On 17/05/2025 16:25, Ze Huang wrote:
> > Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY which
> > implements PIPE3(125MHz) interface for USB3.0. Currently, only USB mode
> > is supported; PCIe support is not included in this change.
> 
> Please add proper comments in the code expliciting PCIe PHY is not yet
> implemented.
> 

OK, will do

> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
> >   drivers/phy/spacemit/Kconfig          |   8 ++
> >   drivers/phy/spacemit/Makefile         |   1 +
> >   drivers/phy/spacemit/phy-k1-combphy.c | 248 ++++++++++++++++++++++++++++++++++
> >   3 files changed, 257 insertions(+)
> > 
> > diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> > index 0136aee2e8a2f5f484da136b26f80130794b992c..ccc6bf9ea49f4988a27f79a4dcd024b18cbd78b0 100644
> > --- a/drivers/phy/spacemit/Kconfig
> > +++ b/drivers/phy/spacemit/Kconfig
> > @@ -11,3 +11,11 @@ config PHY_SPACEMIT_K1_USB2
> >   	help
> >   	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
> >   	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> > +
> > +config PHY_SPACEMIT_K1_COMBPHY
> > +	tristate "SpacemiT K1 PCIe/USB3 combo PHY support"
> > +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> > +	depends on COMMON_CLK
> > +	select GENERIC_PHY
> > +	help
> > +	  USB3/PCIe Combo PHY Support for SpacemiT K1 SoC
> > diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> > index fec0b425a948541b39b814caef0b05e1e002d92f..1fd0c65f2c5cd10ea2f70e43e62c70588d1ffae9 100644
> > --- a/drivers/phy/spacemit/Makefile
> > +++ b/drivers/phy/spacemit/Makefile
> > @@ -1,2 +1,3 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_PHY_SPACEMIT_K1_COMBPHY)	+= phy-k1-combphy.o
> >   obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> > diff --git a/drivers/phy/spacemit/phy-k1-combphy.c b/drivers/phy/spacemit/phy-k1-combphy.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..1f2ee3351e2bb5adf04e4e2fcfdb03cd75f70847
> > --- /dev/null
> > +++ b/drivers/phy/spacemit/phy-k1-combphy.c
> > @@ -0,0 +1,248 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * SpacemiT K1 PCIE/USB3 PHY driver
> > + *
> > + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > + * Copyright (C) 2025 Ze Huang <huangze@whut.edu.cn>
> > + */
> > +
> > +#include <dt-bindings/phy/phy.h>
> > +#include <linux/clk.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +#include <linux/usb/of.h>
> > +
> > +#define COMBPHY_USB_REG1		0x68
> > +#define  COMBPHY_USB_REG1_VAL		0x00
> > +#define COMBPHY_USB_REG2		0x48
> > +#define  COMBPHY_USB_REG2_VAL		0x603a2276
> > +#define COMBPHY_USB_REG3		0x08
> > +#define  COMBPHY_USB_REG3_VAL		0x97c
> > +#define COMBPHY_USB_REG4		0x18
> > +#define  COMBPHY_USB_REG4_VAL		0x00
> > +#define  COMBPHY_USB_TERM_SHORT_MASK	0x3000
> > +#define  COMBPHY_USB_TERM_SHORT_VAL	0x3000
> > +#define COMBPHY_USB_PLL_REG		0x08
> > +#define  COMBPHY_USB_PLL_MASK		0x01
> > +#define  COMBPHY_USB_PLL_VAL		0x01
> > +#define COMBPHY_USB_LFPS_REG		0x58
> > +#define  COMBPHY_USB_LFPS_MASK		0x700
> > +#define  COMBPHY_USB_LFPS_THRES_DEFAULT	0x03
> > +
> > +#define COMBPHY_MODE_SEL	BIT(3)
> > +#define COMBPHY_WAIT_TIMEOUT	1000
> > +
> > +struct spacemit_combphy_priv {
> > +	struct device *dev;
> > +	struct phy *phy;
> > +	struct reset_control *phy_rst;
> > +	void __iomem *phy_ctrl;
> > +	void __iomem *phy_sel;
> > +	bool rx_always_on;
> > +	u8 lfps_threshold;
> > +	u8 type;
> > +};
> > +
> > +static void spacemit_reg_update(void __iomem *reg, u32 offset, u32 mask, u32 val)
> > +{
> > +	u32 tmp;
> > +
> > +	tmp = readl(reg + offset);
> > +	tmp = (tmp & ~(mask)) | val;
> > +	writel(tmp, reg + offset);
> > +}
> 
> With regmap you could avoid this and directly use regmap_update_bits(), same for patch 3
> 

Will follow

> > +
> > +static int spacemit_combphy_wait_ready(struct spacemit_combphy_priv *priv,
> > +				       u32 offset, u32 mask, u32 val)
> > +{
> > +	u32 reg_val;
> > +
> > +	return read_poll_timeout(readl, reg_val, (reg_val & mask) == val,
> > +				 1000, COMBPHY_WAIT_TIMEOUT * 1000, false,
> > +				 priv->phy_ctrl + offset);
> > +}
> 
> It's used once, no need to add a separate function, and with regmap you could use regmap_read_poll_timeout()
> 

Will follow

> > +
> > +static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
> > +{
> > +	int ret = 0;
> > +
> > +	switch (priv->type) {
> > +	case PHY_TYPE_USB3:
> > +		spacemit_reg_update(priv->phy_sel, 0, 0, COMBPHY_MODE_SEL);
> > +		break;
> > +	default:
> > +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
> > +		ret = -EINVAL;
> > +		break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int spacemit_combphy_init_usb(struct spacemit_combphy_priv *priv)
> > +{
> > +	void __iomem *base = priv->phy_ctrl;
> > +	int ret;
> > +
> > +	writel(COMBPHY_USB_REG1_VAL, base + COMBPHY_USB_REG1);
> > +	writel(COMBPHY_USB_REG2_VAL, base + COMBPHY_USB_REG2);
> > +	writel(COMBPHY_USB_REG3_VAL, base + COMBPHY_USB_REG3);
> > +	writel(COMBPHY_USB_REG4_VAL, base + COMBPHY_USB_REG4);
> > +
> > +	ret = spacemit_combphy_wait_ready(priv, COMBPHY_USB_PLL_REG,
> > +					  COMBPHY_USB_PLL_MASK,
> > +					  COMBPHY_USB_PLL_VAL);
> > +
> > +	dev_dbg(priv->dev, "USB3 PHY init lfps threshold %d\n", priv->lfps_threshold);
> > +	spacemit_reg_update(base, COMBPHY_USB_LFPS_REG,
> > +			    COMBPHY_USB_LFPS_MASK,
> > +			    (priv->lfps_threshold << 8));
> > +
> > +	if (priv->rx_always_on)
> > +		spacemit_reg_update(base, COMBPHY_USB_REG4,
> > +				    COMBPHY_USB_TERM_SHORT_MASK,
> > +				    COMBPHY_USB_TERM_SHORT_VAL);
> > +
> > +	if (ret)
> > +		dev_err(priv->dev, "USB3 PHY init timeout!\n");
> 
> You're leaving the PHY initialized, even on a timeout, is it expected ?
> 

You're right. I overlooked that case.

Will move dev_err and return logic next to phy init.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
