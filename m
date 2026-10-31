Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290E606A31A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 12:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BvAPprwe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXbPWG3P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qp6jnWP7zzzAZD6FfO1X7Krfu42njyXFts7fJuUObcA=; b=BvAPprwelfrt0w+h02W6QDhkoe
	Fv/pFsa6PVOxf/RIYutkTJFvFObVh48WSQl0imyrTWi6zuJbt1rfA+B+96JFVrjccgYyK00xvLVau
	UqTTC0OsFPW05ASzKvh2Sb9cUoEu4c32u6hk1aA+RgnotUoDyY4p2BrEY/i/V21Fo+hdUpg+rYdQp
	p48g/us/2z5dM3b2qCtNATET/l2i8dZ1cZrLa3qomag4Mu1wl3kzRpQIsg56Qhotf3Gj36SKFcqId
	53YsPgrL7S4WxPgSWOE//KUDLMbyOy3TsVA/HI5jWiioeLsXYBs4Y3qFAE2TSOkrauylfaOHC4yy0
	tba7rnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7xm-0000000DIJl-48yG;
	Sat, 31 Oct 2026 12:13:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7xl-0000000DIJY-3p7I;
	Sat, 31 Oct 2026 12:13:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 126F9600D4;
	Sat, 31 Oct 2026 12:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2511F00A02;
	Sat, 31 Oct 2026 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793448812;
	bh=PJd/nptdnC1n5bUkePO/xl7mlQ8XownhXVpCQRExh0U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FXbPWG3PToGgxptpFnojITlre50TZXpXDLBX+NT4iMla4bSOz5galxm8v5qdpA26h
	 CCQ7t20EsGWoDSg5NgTYXfhwNJWQVfm6zSsLjtO5spPXTX1iBn45jzsQJxnhu6nBq+
	 qvPrcJUOHBNcch1rV6CW961oPFsDni+TtxfMcCgvhzlpdVVo0AdmcOol63RZxusY2c
	 VEvQdsw9opJbNVXCTzX/b+ow9cBHba9frY4Z9KwSWgn+RtyWJYHT4hAOBxkMm6nDDW
	 tot/gRYIC8+J44v2m4UfHXxzjdic89RLwEPhAqivKRsV7XY/uhURxenMV/yYyNdmr4
	 fuU5HWdvtpzxQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/2] phy: add a driver for T-Head TH1520 USB PHY
From: Manivannan Sadhasivam <mani@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
In-Reply-To: <20261009090444.3319517-3-zhengxingda@iscas.ac.cn>
References: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
 <20261009090444.3319517-3-zhengxingda@iscas.ac.cn>
Date: Sat, 31 Oct 2026 17:43:00 +0530
Message-Id: <179344878055.5901.6127263477546911730.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8331; i=mani@kernel.org;
 h=from:subject:message-id; bh=dId6tLZSjtbmcyoI3RlGhmmOJqb+GkYVdFxndwegmJU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5dtbWWVyN85bSTsl8lATWrpjOwJm1s8rYWEPt
 vlgZcQAVqqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXbWwAKCRBVnxHm/pHO
 9WOyB/9hAjdmWUSwLj1dOBWKc8cCMv4RiTQJItriqmItKTyp0heV2M7Bw4ucM0e2PqCgmxy+Xjj
 tIriEvjTRSI/0WyQGW3eEfEK1vNPLbFhIlGYsYBZL1ri6DKyQbaGZSEwpgJZVx9bN3OAhOgujbf
 vw9T13gv4O050TRLr2jPx7uUsqO9Jpr/6tPYSGZbLlnj+aJMzf2IHUEL0eUlB2CCPIsOwM5B5Zn
 q9v+7J4wP5uIY1U2wtsr481rlxKasTfuMMszYnsppLJQ/Qm6LBWUt5R+wv//6rn14uLZO08wLFd
 b7c5NjW4fGI9qt3cWZ2WTz13K4J2utZx8XGrMh+KQGykj8Gd
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-09 17:04 +0800, Icenowy Zheng wrote:
> The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> some PHY parameters exported as another system controller along with it.
> 
> A few PHY parameters have unusable defaults. Add a driver that programs
> them before releasing the PHY from reset in addition to
> clock/reset/regulator management.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v3:
> - Use fsleep() to replace udelay(), and add proper inclusion of
>   linux/delay.h for this function. (fsleep() suggested by Drew and
>   inclusion suggested by Sashiko)
> - Adapt Drew's suggestion on the wording of the commit message's 2nd
>   paragraph.
> Changes in v2:
> - Removed unreferenced register names.
> - Changed the behavior to leaving bus clock on instead of binding it to
>   the regmap.
> - Removed early return for reset deassert failure in phy exit callback.
> - Tweaked the Kconfig item (removed default value and added "select
>   REGMAP_MMIO).
> 
>  drivers/phy/Kconfig                |   1 +
>  drivers/phy/Makefile               |   1 +
>  drivers/phy/thead/Kconfig          |  12 ++
>  drivers/phy/thead/Makefile         |   2 +
>  drivers/phy/thead/phy-th1520-usb.c | 181 +++++++++++++++++++++++++++++
>  5 files changed, 197 insertions(+)
>  create mode 100644 drivers/phy/thead/Kconfig
>  create mode 100644 drivers/phy/thead/Makefile
>  create mode 100644 drivers/phy/thead/phy-th1520-usb.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19f3b7d12b7d4..a05019020ee09 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -200,6 +200,7 @@ source "drivers/phy/st/Kconfig"
>  source "drivers/phy/starfive/Kconfig"
>  source "drivers/phy/sunplus/Kconfig"
>  source "drivers/phy/tegra/Kconfig"
> +source "drivers/phy/thead/Kconfig"
>  source "drivers/phy/ti/Kconfig"
>  source "drivers/phy/xilinx/Kconfig"
>  
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index d7aa516bcc49e..0ac5b21477619 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -52,5 +52,6 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>  					   starfive/	\
>  					   sunplus/	\
>  					   tegra/	\
> +					   thead/	\
>  					   ti/		\
>  					   xilinx/
> diff --git a/drivers/phy/thead/Kconfig b/drivers/phy/thead/Kconfig
> new file mode 100644
> index 0000000000000..ba0ceac54c1b0
> --- /dev/null
> +++ b/drivers/phy/thead/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config PHY_TH1520_USB

Can you name this PHY driver based on some family or means other than SoC name?
Naming the driver per SoC usually ends up confusing as more SoCs will end up
reusing them.

> +	tristate "USB PHY driver for T-Head TH1520 SoC"
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	depends on COMMON_CLK
> +	depends on HAS_IOMEM
> +	depends on OF
> +	depends on RESET_CONTROLLER
> +	select GENERIC_PHY
> +	select REGMAP_MMIO
> +	help
> +	  Enable support for the USB PHY on the T-Head TH1520 SoC.
> diff --git a/drivers/phy/thead/Makefile b/drivers/phy/thead/Makefile
> new file mode 100644
> index 0000000000000..5b459bc7004bd
> --- /dev/null
> +++ b/drivers/phy/thead/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_TH1520_USB) += phy-th1520-usb.o
> diff --git a/drivers/phy/thead/phy-th1520-usb.c b/drivers/phy/thead/phy-th1520-usb.c
> new file mode 100644
> index 0000000000000..6cb0e51401374
> --- /dev/null
> +++ b/drivers/phy/thead/phy-th1520-usb.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
> + *
> + * Authors:
> + * Icenowy Zheng <zhengxingda@iscas.ac.cn>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +
> +#define USB_SYSCON_OFFSET		0xf000
> +
> +/* All the below registers are in the USB syscon region */
> +#define USB_SSP_EN			0x34
> +#define USB_SSP_EN_REF_SSP_EN		BIT(0)
> +
> +#define USB_SYS				0x3c
> +#define USB_SYS_COMMONONN		BIT(0)
> +
> +/* The last register according to the manual */
> +#define USB_TEST_REG3			0x5c
> +
> +struct th1520_usb_phy {
> +	struct platform_device *pdev;
> +	struct phy *phy;
> +	struct regmap *regmap;
> +	struct clk *ref_clk;
> +	struct reset_control *phy_reset;
> +};
> +
> +static int th1520_usb_phy_init(struct phy *phy)
> +{
> +	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = clk_prepare_enable(th1520_phy->ref_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_assert(th1520_phy->phy_reset);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	/*
> +	 * Do some initial PHY setup:
> +	 * - Set COMMONONN to allow the PHY to automatically power down.
> +	 * - Set REF_SSP_EN to enable feeding reference clock to SuperSpeed
> +	 *   PHY clock PLL.
> +	 */
> +	regmap_set_bits(th1520_phy->regmap, USB_SYS, USB_SYS_COMMONONN);
> +	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN, USB_SSP_EN_REF_SSP_EN);
> +
> +	ret = reset_control_deassert(th1520_phy->phy_reset);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	fsleep(10);
> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(th1520_phy->ref_clk);
> +	return ret;
> +}
> +
> +static int th1520_usb_phy_exit(struct phy *phy)
> +{
> +	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = reset_control_assert(th1520_phy->phy_reset);
> +	clk_disable_unprepare(th1520_phy->ref_clk);
> +

Sashiko has some comment here. I believe reset_control_assert() is not going to
fail, but still it would be better to follow proper semantics.

> +	return ret;
> +}
> +
> +static const struct phy_ops th1520_usb_phy_ops = {
> +	.init		= th1520_usb_phy_init,
> +	.exit		= th1520_usb_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct regmap_config phy_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = USB_TEST_REG3,
> +};
> +
> +static int th1520_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct th1520_usb_phy *th1520_phy;
> +	struct reset_control *bus_reset;
> +	struct clk *bus_clk;
> +	void __iomem *base;
> +	int ret;
> +
> +	th1520_phy = devm_kzalloc(dev, sizeof(*th1520_phy), GFP_KERNEL);
> +	if (!th1520_phy)
> +		return -ENOMEM;
> +
> +	th1520_phy->pdev = pdev;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	th1520_phy->ref_clk = devm_clk_get(dev, "ref");
> +	if (IS_ERR(th1520_phy->ref_clk))
> +		return PTR_ERR(th1520_phy->ref_clk);
> +
> +	/* Enable the bus clock and leave it that way */
> +	bus_clk = devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(bus_clk))
> +		return PTR_ERR(bus_clk);
> +
> +	/* De-assert the bus reset and leave it that way */
> +	bus_reset = devm_reset_control_get_exclusive_deasserted(dev, "bus");
> +	if (IS_ERR(bus_reset))
> +		return PTR_ERR(bus_reset);
> +
> +	th1520_phy->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
> +	if (IS_ERR(th1520_phy->phy_reset))
> +		return PTR_ERR(th1520_phy->phy_reset);
> +
> +	/*
> +	 * Schematics of several boards (Lichee Module 4A/Milk-V Meles)
> +	 * describe this power rail as always-on.

Make use of 80 columns.

> +	 */
> +	ret = devm_regulator_get_enable(dev, "avdd33-usb3");
> +	if (ret)
> +		return ret;
> +
> +	th1520_phy->regmap = devm_regmap_init_mmio(dev,
> +						   base + USB_SYSCON_OFFSET,
> +						   &phy_regmap_config);
> +	if (IS_ERR(th1520_phy->regmap))
> +		return dev_err_probe(dev, PTR_ERR(th1520_phy->regmap),
> +				     "Failed to init regmap\n");
> +
> +	th1520_phy->phy = devm_phy_create(dev, dev->of_node, &th1520_usb_phy_ops);
> +	if (IS_ERR(th1520_phy->phy)) {
> +		dev_err(dev, "failed to create PHY\n");

dev_err_probe()

- Mani



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
