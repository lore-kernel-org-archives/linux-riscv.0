Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC04BE92FE3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 02:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvZhHrt2GTpaaeOLClzBbLCKvTG6y5ucVeEi6c0tjdI=; b=jjx69Y96/R5NJn
	KK8q4mrxp4/OpLpE7EjzDb0L17Sm6jSKP5l6rq0Gm/aKiu3Yx4zpcNwbIkJECPXAm61CjSmE3TNGA
	wTfukokFYGFWqroy65ZQqlRZRUKpY3u3+qWLjMVvP+Hh5CWNjzi02+to8ParLw7EOQZZOg/9vXBZz
	HD5u7hgVHzpmK3vv5MQO2pgF0m/Ndt9Qccp4o9xhT30GwRiMZFFkJtJbW5xfsAFk1nlW/tjeVW18T
	xmBj5lUWrpjo8w9WgZeesiLuITBJxvuLNMqIlXMmDc4Kce8zV8rSJcA/0gYbLIE7Fkis54cgHlS5f
	yoGPJb7cNVVHtbF+L3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPcV-00000004Jlm-3ei1;
	Tue, 30 Dec 2025 02:37:59 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPcP-00000004Jhx-1rPt;
	Tue, 30 Dec 2025 02:37:56 +0000
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowACXQW3oOlNpIqZOAg--.5334S6;
	Tue, 30 Dec 2025 10:37:43 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 4/5] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Date: Tue, 30 Dec 2025 10:37:23 +0800
Message-ID: <20251230023725.15966-5-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXQW3oOlNpIqZOAg--.5334S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Kw47tw4xuw15uw4ftF4ktFb_yoWDtr15pF
	W5Ca4fKrn7tF4fuw4xGFyDGF9IqwnrAry3tw1Skas8XF97tr1UZasaqFyrZr1qyF1DGFW3
	t3Z8Jay29F17AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjfUOyIUUUUUU
X-Originating-IP: [223.160.207.108]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_183754_039716_8288ADA0 
X-CRM114-Status: GOOD (  18.77  )
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

Add driver for the USB 2.0 PHY in Canaan K230 SoC, which supports PHY
initialization, power management and USB mode switching.

Add Kconfig/Makefile under drivers/phy/canaan/.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 drivers/phy/Kconfig               |   1 +
 drivers/phy/Makefile              |   1 +
 drivers/phy/canaan/Kconfig        |  14 ++
 drivers/phy/canaan/Makefile       |   2 +
 drivers/phy/canaan/phy-k230-usb.c | 272 ++++++++++++++++++++++++++++++
 5 files changed, 290 insertions(+)
 create mode 100644 drivers/phy/canaan/Kconfig
 create mode 100644 drivers/phy/canaan/Makefile
 create mode 100644 drivers/phy/canaan/phy-k230-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 678dd0452f0a..95e630749350 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -105,6 +105,7 @@ source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
+source "drivers/phy/canaan/Kconfig"
 source "drivers/phy/freescale/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
 source "drivers/phy/ingenic/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index bfb27fb5a494..f07c68f2e283 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -17,6 +17,7 @@ obj-y					+= allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
 					   cadence/	\
+					   canaan/	\
 					   freescale/	\
 					   hisilicon/	\
 					   ingenic/	\
diff --git a/drivers/phy/canaan/Kconfig b/drivers/phy/canaan/Kconfig
new file mode 100644
index 000000000000..1ff8831846d5
--- /dev/null
+++ b/drivers/phy/canaan/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Canaan platforms
+#
+config PHY_CANAAN_USB
+	tristate "Canaan USB2 PHY Driver"
+	depends on (ARCH_CANAAN || COMPILE_TEST) && OF
+	select GENERIC_PHY
+	help
+	Enable this driver to support the USB 2.0 PHY controller
+	on Canaan K230 RISC-V SoCs. This PHY controller
+	provides physical layer functionality for USB 2.0 devices.
+	If you have a Canaan K230 board and need USB 2.0 support,
+	say Y or M here.
diff --git a/drivers/phy/canaan/Makefile b/drivers/phy/canaan/Makefile
new file mode 100644
index 000000000000..d73857ba284e
--- /dev/null
+++ b/drivers/phy/canaan/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_CANAAN_USB)		+= phy-k230-usb.o
diff --git a/drivers/phy/canaan/phy-k230-usb.c b/drivers/phy/canaan/phy-k230-usb.c
new file mode 100644
index 000000000000..668618fb2188
--- /dev/null
+++ b/drivers/phy/canaan/phy-k230-usb.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Canaan usb PHY driver
+ *
+ * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define TEST_CTL3_OFFSET	0x0C
+#define CTL0_OFFSET		0x00
+#define CTL1_OFFSET		0x04
+#define USB_IDPULLUP0		BIT(4)
+#define USB_DMPULLDOWN0		BIT(8)
+#define USB_DPPULLDOWN0		BIT(9)
+
+/* USB control register 0 in HiSysConfig system controller */
+/* PLL Integral Path Tune */
+#define USB_CTL0_PLLITUNE_MASK		GENMASK(23, 22)
+
+/* PLL Proportional Path Tune */
+#define USB_CTL0_PLLPTUNE_MASK		GENMASK(21, 18)
+
+/* PLL Bandwidth Adjustment */
+#define USB_CTL0_PLLBTUNE_MASK		GENMASK(17, 17)
+
+/* VReg18 Bypass Control */
+#define USB_CTL0_VREGBYPASS_MASK	GENMASK(16, 16)
+
+/* Retention Mode Enable */
+#define USB_CTL0_RETENABLEN_MASK	GENMASK(15, 15)
+
+/* Reserved Request Input */
+#define USB_CTL0_RESREQIN_MASK		GENMASK(14, 14)
+
+/* External VBUS Valid Select */
+#define USB_CTL0_VBUSVLDEXTSEL0_MASK	GENMASK(13, 13)
+
+/* OTG Block Disable Control */
+#define USB_CTL0_OTGDISABLE0_MASK	GENMASK(12, 12)
+
+/* Drive VBUS Enable */
+#define USB_CTL0_DRVVBUS0_MASK		GENMASK(11, 11)
+
+/* Autoresume Mode Enable */
+#define USB_CTL0_AUTORSMENB0_MASK	GENMASK(10, 10)
+
+/* HS Transceiver Asynchronous Control */
+#define USB_CTL0_HSXCVREXTCTL0_MASK	GENMASK(9, 9)
+
+/* USB 1.1 Transmit Data */
+#define USB_CTL0_FSDATAEXT0_MASK	GENMASK(8, 8)
+
+/* USB 1.1 SE0 Generation */
+#define USB_CTL0_FSSE0EXT0_MASK		GENMASK(7, 7)
+
+/* USB 1.1 Data Enable */
+#define USB_CTL0_TXENABLEN0_MASK	GENMASK(6, 6)
+
+/* Disconnect Threshold */
+#define USB_CTL0_COMPDISTUNE0_MASK	GENMASK(5, 3)
+
+/* Squelch Threshold */
+#define USB_CTL0_SQRXTUNE0_MASK		GENMASK(2, 0)
+
+/* USB control register 1 in HiSysConfig system controller */
+/* Data Detect Voltage */
+#define USB_CTL1_VDATREFTUNE0_MASK	GENMASK(23, 22)
+
+/* VBUS Valid Threshold */
+#define USB_CTL1_OTGTUNE0_MASK		GENMASK(21, 19)
+
+/* Transmitter High-Speed Crossover */
+#define USB_CTL1_TXHSXVTUNE0_MASK	GENMASK(18, 17)
+
+/* FS/LS Source Impedance */
+#define USB_CTL1_TXFSLSTUNE0_MASK	GENMASK(16, 13)
+
+/* HS DC Voltage Level */
+#define USB_CTL1_TXVREFTUNE0_MASK	GENMASK(12, 9)
+
+/* HS Transmitter Rise/Fall Time */
+#define USB_CTL1_TXRISETUNE0_MASK	GENMASK(8, 7)
+
+/* USB Source Impedance */
+#define USB_CTL1_TXRESTUNE0_MASK	GENMASK(6, 5)
+
+/* HS Transmitter Pre-Emphasis Current Control */
+#define USB_CTL1_TXPREEMPAMPTUNE0_MASK	GENMASK(4, 3)
+
+/* HS Transmitter Pre-Emphasis Duration Control */
+#define USB_CTL1_TXPREEMPPULSETUNE0_MASK	GENMASK(2, 2)
+
+/* charging detection */
+#define USB_CTL1_CHRGSRCPUENB0_MASK	GENMASK(1, 0)
+
+#define K230_PHY_CTL0_VAL \
+( \
+	FIELD_PREP(USB_CTL0_PLLITUNE_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_PLLPTUNE_MASK, 0xC) | \
+	FIELD_PREP(USB_CTL0_PLLBTUNE_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL0_VREGBYPASS_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL0_RETENABLEN_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL0_RESREQIN_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_VBUSVLDEXTSEL0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_OTGDISABLE0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_DRVVBUS0_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL0_AUTORSMENB0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_HSXCVREXTCTL0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_FSDATAEXT0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_FSSE0EXT0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_TXENABLEN0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL0_COMPDISTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL0_SQRXTUNE0_MASK, 0x3) \
+)
+
+#define K230_PHY_CTL1_VAL \
+( \
+	FIELD_PREP(USB_CTL1_VDATREFTUNE0_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL1_OTGTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL1_TXHSXVTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL1_TXFSLSTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL1_TXVREFTUNE0_MASK, 0x3) | \
+	FIELD_PREP(USB_CTL1_TXRISETUNE0_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL1_TXRESTUNE0_MASK, 0x1) | \
+	FIELD_PREP(USB_CTL1_TXPREEMPAMPTUNE0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL1_TXPREEMPPULSETUNE0_MASK, 0x0) | \
+	FIELD_PREP(USB_CTL1_CHRGSRCPUENB0_MASK, 0x0) \
+)
+
+struct k230_usb_phy {
+	struct regmap *regmap;
+	u32 reg_ctl_offset;
+	u32 reg_test_offset;
+	struct clk *clk;
+};
+
+static int k230_usb_phy_power_on(struct phy *_phy)
+{
+	struct k230_usb_phy *phy = phy_get_drvdata(_phy);
+	int ret;
+	u32 val;
+
+	ret = clk_prepare_enable(phy->clk);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(phy->regmap, phy->reg_ctl_offset + CTL0_OFFSET,
+			   K230_PHY_CTL0_VAL);
+	if (ret)
+		goto err_disable_clk;
+
+	ret = regmap_write(phy->regmap, phy->reg_ctl_offset + CTL1_OFFSET,
+			   K230_PHY_CTL1_VAL);
+	if (ret)
+		goto err_disable_clk;
+
+	val |= USB_IDPULLUP0 | USB_DMPULLDOWN0 | USB_DPPULLDOWN0;
+
+	ret = regmap_update_bits(phy->regmap, phy->reg_test_offset +
+				 TEST_CTL3_OFFSET, val, val);
+	if (ret)
+		goto err_disable_clk;
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(phy->clk);
+	return ret;
+}
+
+static int k230_usb_phy_power_off(struct phy *_phy)
+{
+	struct k230_usb_phy *phy = phy_get_drvdata(_phy);
+	int ret;
+	u32 val;
+
+	val = USB_DMPULLDOWN0 | USB_DPPULLDOWN0;
+
+	ret = regmap_update_bits(phy->regmap, phy->reg_test_offset +
+				 TEST_CTL3_OFFSET, val, 0);
+	if (ret)
+		return ret;
+
+	clk_disable_unprepare(phy->clk);
+
+	return 0;
+}
+
+static const struct phy_ops k230_usb_phy_ops = {
+	.power_on = k230_usb_phy_power_on,
+	.power_off = k230_usb_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static int k230_usb_phy_probe(struct platform_device *pdev)
+{
+	int ret;
+	u32 offset;
+	struct regmap *regmap;
+	struct phy *generic_phy;
+	struct k230_usb_phy *phy;
+	struct phy_provider *provider;
+	struct device *dev = &pdev->dev;
+
+	regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get syscon regmap\n");
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->regmap = regmap;
+
+
+	ret = of_property_read_u32_index(dev->of_node, "reg", 0, &offset);
+	if (ret)
+		return dev_err_probe(dev, ret, "missing first reg offset\n");
+	phy->reg_test_offset = offset;
+
+	ret = of_property_read_u32_index(dev->of_node, "reg", 2, &offset);
+	if (ret)
+		return dev_err_probe(dev, ret, "missing second reg offset\n");
+	phy->reg_ctl_offset = offset;
+
+	phy->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(phy->clk))
+		return dev_err_probe(dev, PTR_ERR(phy->clk),
+				     "failed to get clock\n");
+
+	generic_phy = devm_phy_create(dev, dev->of_node, &k230_usb_phy_ops);
+
+	if (IS_ERR(generic_phy))
+		return dev_err_probe(dev, PTR_ERR(generic_phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(generic_phy, phy);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register phy provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id k230_usb_phy_of_match[] = {
+	{ .compatible = "canaan,k230-usb-phy" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, k230_usb_phy_of_match);
+
+static struct platform_driver k230_usb_phy_driver = {
+	.probe = k230_usb_phy_probe,
+	.driver = {
+		.name = "k230-usb-phy",
+		.of_match_table = k230_usb_phy_of_match,
+	},
+};
+module_platform_driver(k230_usb_phy_driver);
+
+MODULE_DESCRIPTION("Canaan Kendryte K230 USB 2.0 PHY driver");
+MODULE_AUTHOR("Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>");
+MODULE_LICENSE("GPL");
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
