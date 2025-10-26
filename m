Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79209CCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRlAS4kq5+KTo4S/Ec5oqkYknjbNhaMYx42bVu8VCqg=; b=dBDobe9dtT1Bkd
	s+CKDVMASiHQ1Ryi08LfA8iJHbjW6zFckSzYfI0ZOe3pGkvPb+l8LxphfuYKesDONpZ/kwMktu7BT
	GVTOSmQyTRyoPyS72gU7biMQ/l9wspuFjs8gbbC2p9pbewigz8tHaoJ4b9btFJGxLxkNaDh46c19b
	YAhvf+oZUExcBgaU6rSkqvd4wWaTrp5Ksn4SVyGyTVl6KEZMegYdAbjlgh3SuF1TN9jcO0Z71S6G9
	ywcWbC5IdyFPZ7Is2BL+qmPz6ekz++2SOAddCtY5UOTTsZ4948s7zIQZ5lW6Hclo+gPe04j7m1LaF
	hWgTrEfchmG1DXsqt1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1Rm-0000000COkQ-2AJ1;
	Sun, 26 Oct 2025 14:10:15 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1Rk-0000000COis-0Yh6
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 14:10:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761487807; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BviB6YiiOcewpc0fCLAcKWETwsCQKkD6bGgrAcAu1Z9weYQVx9WvheIl/Y2StbiUVlISVE9sZOq7/a3DhjhpHLA6rAtIdh+YNzFRqgjYVbbDU9E5uA8E1dTPQr/Mxf4+l7CFuHm25Fkva/xYCBUSzHV9Ja1fm3oJg2nv+yT5UIk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761487807; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jHP/6RDvwWyvKixSAxf0D+whd18XnHOKn8W+hNMh8Fo=; 
	b=PWOTc3kd27BpSJQ4sqFld7FfEzVdgiM9JJVgwI731/V7lnQD6k3GJukjMpIJxbGSlsd9DsnQsE3RLvkvgt3t1wmHDi+Cc3+uTU40YP5BafcT2VYCKQlT6+b69lCyhJhQ1R1fKAB4LAi2VolyfV6DlwQIH7IdxOBqowttrPRNuCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761487807;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=jHP/6RDvwWyvKixSAxf0D+whd18XnHOKn8W+hNMh8Fo=;
	b=JoaKbOzGI6RvQ+i0gpNZVHgLoxOpIzoMX5meJHGt1Tf825OvXVgyeJsdM4LcfFPh
	sUdmKQ0UQCWVqUxllKq24hEmJP4bNf6rFRsdD6tYmDDSDsqR586zd3uLevcBBbQes0z
	eCqHSmPf5qusF8vXms0qtEUHqambFOOgedRtR9lo=
Received: by mx.zohomail.com with SMTPS id 1761487802477241.33342991791199;
	Sun, 26 Oct 2025 07:10:02 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 26 Oct 2025 22:00:44 +0800
Subject: [PATCH v2 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
MIME-Version: 1.0
Message-Id: <20251026-dr1v90-cru-v2-4-43b67acd6ddd@pigmoral.tech>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
In-Reply-To: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761487753; l=6089;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=Lw10ST1cV5ekHn6n8HmhZ/HoD7ZY5pb31bl/maT+org=;
 b=Ucinhnrow6OUTOt8hL7WhpfpyhpT3lcWFc1ywsKcOiw4GgNtsnTsH97icx6NfPlIeyQLPwzyv
 e4BuPwhTrbjA5ERXQSMOWX5DhfXheITxw4s2yndsM+Od86V8qZd3hqe
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_071012_207739_B726D35D 
X-CRM114-Status: GOOD (  16.90  )
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

Add reset controller support for the Anlogic DR1V90 SoC, which is an
auxiliary device associated with the Clock and Reset Unit (CRU). All
resets are active-low.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/reset/Kconfig        |   9 +++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-dr1v90.c | 135 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 78b7078478d46d484ce031f527a933c81a838b1d..61fb2b3c9928bb478e3d219182f21ff76b9c0705 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -73,6 +73,15 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216 or the BCM2712.
 
+config RESET_DR1V90
+	tristate "Anlogic DR1V90 reset controller"
+	depends on ARCH_ANLOGIC || COMPILE_TEST
+	select AUXILIARY_BUS
+	default ARCH_ANLOGIC
+	help
+	  This enables the reset controller driver for Anlogic DR1V90 SoCs
+	  provided by the CRU unit.
+
 config RESET_EYEQ
 	bool "Mobileye EyeQ reset controller"
 	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index f7934f9fb90bbd28e0e4f5b83add5444f51b7360..2909f32320a2ef9a2c0cb4b2751ff5b41f43a1fb 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_DR1V90) += reset-dr1v90.o
 obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
diff --git a/drivers/reset/reset-dr1v90.c b/drivers/reset/reset-dr1v90.c
new file mode 100644
index 0000000000000000000000000000000000000000..eb9064e3ab454fb39adc1ad426f458e39bb6169e
--- /dev/null
+++ b/drivers/reset/reset-dr1v90.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include "linux/device.h"
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/anlogic,dr1v90-cru.h>
+
+struct dr1v90_reset_map {
+	u32 offset;
+	u32 bit;
+};
+
+struct dr1v90_reset_controller {
+	struct reset_controller_dev rcdev;
+	void __iomem *base;
+};
+
+static inline struct dr1v90_reset_controller *
+to_dr1v90_reset_controller(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct dr1v90_reset_controller, rcdev);
+}
+
+static const struct dr1v90_reset_map dr1v90_resets[] = {
+	[RESET_OCM]		= { 0x74, BIT(4)},
+	[RESET_QSPI]		= { 0x74, BIT(5)},
+	[RESET_SMC]		= { 0x74, BIT(6)},
+	[RESET_WDT]		= { 0x74, BIT(7)},
+	[RESET_DMAC_AXI]	= { 0x74, BIT(8)},
+	[RESET_DMAC_AHB]	= { 0x74, BIT(9)},
+	[RESET_NPU]		= { 0x74, BIT(12)},
+	[RESET_JPU]		= { 0x74, BIT(13)},
+	[RESET_DDRBUS]		= { 0x74, BIT(14)},
+	[RESET_NIC_HP0]		= { 0x78, BIT(0)},
+	[RESET_NIC_HP1]		= { 0x78, BIT(1)},
+	[RESET_NIC_GP0M]	= { 0x78, BIT(4)},
+	[RESET_NIC_GP1M]	= { 0x78, BIT(5)},
+	[RESET_GPIO]		= { 0x78, BIT(8)},
+	[RESET_IPC]		= { 0x78, BIT(12)},
+	[RESET_USB0]		= { 0x7C, BIT(0)},
+	[RESET_USB1]		= { 0x7C, BIT(1)},
+	[RESET_GBE0]		= { 0x7C, BIT(4)},
+	[RESET_GBE1]		= { 0x7C, BIT(5)},
+	[RESET_SDIO0]		= { 0x7C, BIT(8)},
+	[RESET_SDIO1]		= { 0x7C, BIT(9)},
+	[RESET_UART0]		= { 0x7C, BIT(12)},
+	[RESET_UART1]		= { 0x7C, BIT(13)},
+	[RESET_SPI0]		= { 0x7C, BIT(16)},
+	[RESET_SPI1]		= { 0x7C, BIT(17)},
+	[RESET_CAN0]		= { 0x7C, BIT(20)},
+	[RESET_CAN1]		= { 0x7C, BIT(21)},
+	[RESET_TTC0]		= { 0x7C, BIT(24)},
+	[RESET_TTC1]		= { 0x7C, BIT(25)},
+	[RESET_I2C0]		= { 0x7C, BIT(28)},
+	[RESET_I2C1]		= { 0x7C, BIT(29)}
+};
+
+static int dr1v90_reset_control_update(struct reset_controller_dev *rcdev,
+				       unsigned long id, bool assert)
+{
+	struct dr1v90_reset_controller *rstc = to_dr1v90_reset_controller(rcdev);
+	u32 offset = dr1v90_resets[id].offset;
+	u32 bit = dr1v90_resets[id].bit;
+	u32 reg;
+
+	reg = readl(rstc->base + offset);
+	if (assert)
+		reg &= ~bit;
+	else
+		reg |= bit;
+	writel(reg, rstc->base + offset);
+
+	return 0;
+}
+
+static int dr1v90_reset_control_assert(struct reset_controller_dev *rcdev,
+				       unsigned long id)
+{
+	return dr1v90_reset_control_update(rcdev, id, true);
+}
+
+static int dr1v90_reset_control_deassert(struct reset_controller_dev *rcdev,
+					 unsigned long id)
+{
+	return dr1v90_reset_control_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops dr1v90_reset_control_ops = {
+	.assert = dr1v90_reset_control_assert,
+	.deassert = dr1v90_reset_control_deassert,
+};
+
+static int dr1v90_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct dr1v90_reset_controller *rstc;
+	struct device *dev = &adev->dev;
+
+	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
+	if (!rstc)
+		return -ENOMEM;
+
+	rstc->base = of_iomap(dev->parent->of_node, 0);
+	rstc->rcdev.dev = dev;
+	rstc->rcdev.nr_resets = ARRAY_SIZE(dr1v90_resets);
+	rstc->rcdev.of_node = dev->parent->of_node;
+	rstc->rcdev.ops = &dr1v90_reset_control_ops;
+	rstc->rcdev.owner = THIS_MODULE;
+
+	return devm_reset_controller_register(dev, &rstc->rcdev);
+}
+
+static const struct auxiliary_device_id dr1v90_reset_ids[] = {
+	{
+		.name = "anlogic_dr1v90_cru.reset"
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, dr1v90_reset_ids);
+
+static struct auxiliary_driver dr1v90_reset_driver = {
+	.probe = dr1v90_reset_probe,
+	.id_table = dr1v90_reset_ids,
+};
+module_auxiliary_driver(dr1v90_reset_driver);
+
+MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");
+MODULE_DESCRIPTION("Anlogic DR1V90 reset controller driver");
+MODULE_LICENSE("GPL");

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
