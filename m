Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278BFCCF2C1
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGqwYQ2TNwl6S02Tsg1Txy88DmL+FXOoy+FAviXi9/4=; b=4IIBAztTxjRfAd
	91GcM5idBhiPEoVt6Ev9y2d/iUgZ/h1deTxYhymYxrFqpm5CivxW+0baoqhtwrPXjLXIgx0uokmS5
	pIa9u/6ij6OaK/8A6Qhgpynxehzb4mB7s6oLjuS0+OiGu7sJL/IzpP5tBcvU6rb43lV9YdCgi1JEN
	p1p7NdXoMk9zRRPNpKDd9fziwH9e0wKVvbsAYxGIf+PTXicGwxWYNFdToIV6J382UQcO4IpUjAFJ3
	qrJWZfgYKxqhN79Kh+V8bW0NDqDa/cw6mFqU4UcURsdnH15J/7C2eYLSyFpg89YSfLiB8G4hbBIdl
	CQYv7GK3HD/DEwspK6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlPW-00000001cC2-1rfn;
	Mon, 19 Jan 2026 09:18:58 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlPS-00000001cAn-2vD8;
	Mon, 19 Jan 2026 09:18:56 +0000
Received: from duge-virtual-machine (unknown [223.160.206.18])
	by APP-01 (Coremail) with SMTP id qwCowADXf2vI9m1pXbZKBQ--.4971S5;
	Mon, 19 Jan 2026 17:18:09 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	conor@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Date: Mon, 19 Jan 2026 17:17:52 +0800
Message-ID: <20260119091753.294073-4-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119091753.294073-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260119091753.294073-1-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXf2vI9m1pXbZKBQ--.4971S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Kw47tw4xuw15trWktFWkZwb_yoWDtw1DpF
	WrA34fKrn7tF4fAw4xGFWDGFyFqanFyry7tw12k398XFy7tr1UZa4ftryrZrnYyFs8GrW3
	t3Z8Xay29FsxCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7VUbpwZ7UUUUU==
X-Originating-IP: [223.160.206.18]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_011855_311348_164360BA 
X-CRM114-Status: GOOD (  19.75  )
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
initialization and power management.

Add Kconfig/Makefile under drivers/phy/canaan/.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 drivers/phy/Kconfig               |   1 +
 drivers/phy/Makefile              |   1 +
 drivers/phy/canaan/Kconfig        |  14 ++
 drivers/phy/canaan/Makefile       |   2 +
 drivers/phy/canaan/phy-k230-usb.c | 271 ++++++++++++++++++++++++++++++
 5 files changed, 289 insertions(+)
 create mode 100644 drivers/phy/canaan/Kconfig
 create mode 100644 drivers/phy/canaan/Makefile
 create mode 100644 drivers/phy/canaan/phy-k230-usb.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 142e7b0ef2ef..e37bcceef65a 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -150,6 +150,7 @@ source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
 source "drivers/phy/cadence/Kconfig"
+source "drivers/phy/canaan/Kconfig"
 source "drivers/phy/freescale/Kconfig"
 source "drivers/phy/hisilicon/Kconfig"
 source "drivers/phy/ingenic/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index dcbb060c8207..8cef0a447986 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -22,6 +22,7 @@ obj-y					+= allwinner/	\
 					   apple/	\
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
index 000000000000..e4bd98aa4e89
--- /dev/null
+++ b/drivers/phy/canaan/phy-k230-usb.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Canaan usb PHY driver
+ *
+ * Copyright (C) 2025 Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#define CTL0_OFFSET		0x00
+#define CTL1_OFFSET		0x04
+#define TEST_CTL3_OFFSET	0x0c
+
+#define USB_IDPULLUP0		BIT(4)
+#define USB_DMPULLDOWN0		BIT(8)
+#define USB_DPPULLDOWN0		BIT(9)
+
+#define MAX_PHYS		2
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
+	FIELD_PREP(USB_CTL0_PLLPTUNE_MASK, 0xc) | \
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
+struct k230_usb_phy_global {
+	u32 reg_test_offset[MAX_PHYS];
+	u32 reg_ctl_offset[MAX_PHYS];
+	void __iomem *base;
+};
+
+struct k230_usb_phy_instance {
+	struct k230_usb_phy_global *global;
+	int index;
+};
+
+static int k230_usb_phy_power_on(struct phy *_phy)
+{
+	struct k230_usb_phy_instance *phy_inst = phy_get_drvdata(_phy);
+	struct k230_usb_phy_global *global = phy_inst->global;
+	u32 val;
+
+	writel(K230_PHY_CTL0_VAL, global->base +
+	       global->reg_ctl_offset[phy_inst->index] + CTL0_OFFSET);
+
+	writel(K230_PHY_CTL1_VAL, global->base +
+	       global->reg_ctl_offset[phy_inst->index] + CTL1_OFFSET);
+
+	val = readl(global->base +
+		    global->reg_test_offset[phy_inst->index] +
+		    TEST_CTL3_OFFSET);
+
+	val |= USB_IDPULLUP0;
+	if (phy_inst->index == 1)
+		val |= (USB_DMPULLDOWN0 | USB_DPPULLDOWN0);
+	else
+		val &= ~(USB_DMPULLDOWN0 | USB_DPPULLDOWN0);
+
+	writel(val, global->base +
+	       global->reg_test_offset[phy_inst->index] +
+	       TEST_CTL3_OFFSET);
+
+	return 0;
+}
+
+static int k230_usb_phy_power_off(struct phy *_phy)
+{
+	struct k230_usb_phy_instance *phy_inst = phy_get_drvdata(_phy);
+	struct k230_usb_phy_global *global = phy_inst->global;
+	u32 val;
+
+	val = readl(global->base +
+		    global->reg_test_offset[phy_inst->index] +
+		    TEST_CTL3_OFFSET);
+
+	val &= ~(USB_DMPULLDOWN0 | USB_DPPULLDOWN0);
+
+	writel(val, global->base +
+	       global->reg_test_offset[phy_inst->index] +
+	       TEST_CTL3_OFFSET);
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
+static struct phy *k230_usb_phy_xlate(struct device *dev,
+				      const struct of_phandle_args *args)
+{
+	struct k230_usb_phy_global *global = dev_get_drvdata(dev);
+	struct k230_usb_phy_instance *phy_inst;
+	struct phy *phy;
+
+	if (args->args[0] >= MAX_PHYS)
+		return ERR_PTR(-EINVAL);
+
+	phy_inst = devm_kzalloc(dev, sizeof(*phy_inst), GFP_KERNEL);
+	if (!phy_inst)
+		return ERR_PTR(-ENOMEM);
+
+	phy_inst->global = global;
+	phy_inst->index = args->args[0];
+
+	phy = devm_phy_create(dev, NULL, &k230_usb_phy_ops);
+	if (IS_ERR(phy))
+		return ERR_PTR(PTR_ERR(phy));
+
+	phy_set_drvdata(phy, phy_inst);
+
+	return phy;
+}
+
+static int k230_usb_phy_probe(struct platform_device *pdev)
+{
+	struct k230_usb_phy_global *global;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+
+	global = devm_kzalloc(dev, sizeof(*global), GFP_KERNEL);
+	if (!global)
+		return -ENOMEM;
+	dev_set_drvdata(dev, global);
+
+	global->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(global->base))
+		return dev_err_probe(dev, PTR_ERR(global->base),
+				     "ioremap failed\n");
+
+	global->reg_test_offset[0] = 0x70;
+	global->reg_ctl_offset[0] = 0xb0;
+	global->reg_test_offset[1] = 0x90;
+	global->reg_ctl_offset[1] = 0xb8;
+
+	provider = devm_of_phy_provider_register(dev, k230_usb_phy_xlate);
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
