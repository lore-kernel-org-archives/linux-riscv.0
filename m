Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE903C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 02:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlNLA6Mo8HBKveAQCBqK4NGRyuTIINHh8mG/6KrB7X4=; b=QDWf/E1W7YLzl7
	7Im/toHjyahXcyJYjVcURzkKKOdzrwK5TjLOeCtiPSygxQW5qU5Mf6TA+1/bFa+jaF8AY0As7ltsF
	Fe1Y8bsUB6iAFVpevxRHMH4/rCPNdaP+9egUc8xZl21f/ZaN7dTcG/0hm1nwLX9MNMBd3Z0IQCjWd
	kC60Nz7q85Ko9K+WEJljPHtMIuNXPGj13iVVshjAA5IfPoO3xtpOo/KvW7cMVZyktOhOtp/POXuxd
	3yeZQkKhPbEgVR4BwbEGro2f6UmT/xv5fbW1AyNdoQ2lslqCuxyH/HJCa9Q+mFKSwlHbhjBPOuNDi
	JaFFqLOaORqw5NYGACLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIgl-006LI3-Td; Tue, 21 Feb 2023 02:47:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIga-006L18-E3
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 02:47:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 67AFE24E1FB;
	Tue, 21 Feb 2023 10:46:56 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 10:46:56 +0800
Received: from localhost.localdomain (183.27.98.67) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 10:46:55 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 05/19] reset: starfive: Factor out common JH71X0 reset code
Date: Tue, 21 Feb 2023 10:46:31 +0800
Message-ID: <20230221024645.127922-6-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221024645.127922-1-hal.feng@starfivetech.com>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_184721_013424_1DE5B8BC 
X-CRM114-Status: GOOD (  28.68  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

The StarFive JH7100 SoC has additional reset controllers for audio and
video, but the registers follow the same structure. On the JH7110 the
reset registers don't get their own memory range, but instead follow the
clock control registers. The registers still follow the same structure
though, so let's factor out the common code to handle all these cases.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 MAINTAINERS                                   |   4 +-
 drivers/reset/starfive/Kconfig                |   4 +
 drivers/reset/starfive/Makefile               |   2 +
 .../reset/starfive/reset-starfive-jh7100.c    | 150 +---------------
 .../reset/starfive/reset-starfive-jh71x0.c    | 162 ++++++++++++++++++
 .../reset/starfive/reset-starfive-jh71x0.h    |  11 ++
 6 files changed, 182 insertions(+), 151 deletions(-)
 create mode 100644 drivers/reset/starfive/reset-starfive-jh71x0.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jh71x0.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7026d96b7802..3fca3316b857 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19926,11 +19926,11 @@ F:	Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
 F:	drivers/pinctrl/starfive/
 F:	include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
 
-STARFIVE JH7100 RESET CONTROLLER DRIVER
+STARFIVE JH71X0 RESET CONTROLLER DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
 F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
-F:	drivers/reset/starfive/reset-starfive-jh7100.c
+F:	drivers/reset/starfive/reset-starfive-jh71*
 F:	include/dt-bindings/reset/starfive-jh7100.h
 
 STATIC BRANCH/CALL
diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index cddebdba7177..9d15c4110e40 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -1,8 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+config RESET_STARFIVE_JH71X0
+	bool
+
 config RESET_STARFIVE_JH7100
 	bool "StarFive JH7100 Reset Driver"
 	depends on SOC_STARFIVE || COMPILE_TEST
+	select RESET_STARFIVE_JH71X0
 	default SOC_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7100 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index 670d049423f5..f6aa12466fad 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
+
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
index fc44b2fb3e03..5a68327c1f6a 100644
--- a/drivers/reset/starfive/reset-starfive-jh7100.c
+++ b/drivers/reset/starfive/reset-starfive-jh7100.c
@@ -5,158 +5,10 @@
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
 
-#include <linux/bitmap.h>
-#include <linux/io.h>
-#include <linux/io-64-nonatomic-lo-hi.h>
-#include <linux/iopoll.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
-#include <linux/reset-controller.h>
-#include <linux/spinlock.h>
 
-#include <dt-bindings/reset/starfive-jh7100.h>
-
-/* register offsets */
-#define JH7100_RESET_ASSERT0	0x00
-#define JH7100_RESET_ASSERT1	0x04
-#define JH7100_RESET_ASSERT2	0x08
-#define JH7100_RESET_ASSERT3	0x0c
-#define JH7100_RESET_STATUS0	0x10
-#define JH7100_RESET_STATUS1	0x14
-#define JH7100_RESET_STATUS2	0x18
-#define JH7100_RESET_STATUS3	0x1c
-
-/*
- * Writing a 1 to the n'th bit of the m'th ASSERT register asserts
- * line 32m + n, and writing a 0 deasserts the same line.
- * Most reset lines have their status inverted so a 0 bit in the STATUS
- * register means the line is asserted and a 1 means it's deasserted. A few
- * lines don't though, so store the expected value of the status registers when
- * all lines are asserted.
- */
-static const u64 jh7100_reset_asserted[2] = {
-	/* STATUS0 */
-	BIT_ULL_MASK(JH7100_RST_U74) |
-	BIT_ULL_MASK(JH7100_RST_VP6_DRESET) |
-	BIT_ULL_MASK(JH7100_RST_VP6_BRESET) |
-	/* STATUS1 */
-	BIT_ULL_MASK(JH7100_RST_HIFI4_DRESET) |
-	BIT_ULL_MASK(JH7100_RST_HIFI4_BRESET),
-	/* STATUS2 */
-	BIT_ULL_MASK(JH7100_RST_E24) |
-	/* STATUS3 */
-	0,
-};
-
-struct jh7100_reset {
-	struct reset_controller_dev rcdev;
-	/* protect registers against concurrent read-modify-write */
-	spinlock_t lock;
-	void __iomem *base;
-};
-
-static inline struct jh7100_reset *
-jh7100_reset_from(struct reset_controller_dev *rcdev)
-{
-	return container_of(rcdev, struct jh7100_reset, rcdev);
-}
-
-static int jh7100_reset_update(struct reset_controller_dev *rcdev,
-			       unsigned long id, bool assert)
-{
-	struct jh7100_reset *data = jh7100_reset_from(rcdev);
-	unsigned long offset = BIT_ULL_WORD(id);
-	u64 mask = BIT_ULL_MASK(id);
-	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + offset * sizeof(u64);
-	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(u64);
-	u64 done = jh7100_reset_asserted[offset] & mask;
-	u64 value;
-	unsigned long flags;
-	int ret;
-
-	if (!assert)
-		done ^= mask;
-
-	spin_lock_irqsave(&data->lock, flags);
-
-	value = readq(reg_assert);
-	if (assert)
-		value |= mask;
-	else
-		value &= ~mask;
-	writeq(value, reg_assert);
-
-	/* if the associated clock is gated, deasserting might otherwise hang forever */
-	ret = readq_poll_timeout_atomic(reg_status, value, (value & mask) == done, 0, 1000);
-
-	spin_unlock_irqrestore(&data->lock, flags);
-	return ret;
-}
-
-static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
-			       unsigned long id)
-{
-	return jh7100_reset_update(rcdev, id, true);
-}
-
-static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
-				 unsigned long id)
-{
-	return jh7100_reset_update(rcdev, id, false);
-}
-
-static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	int ret;
-
-	ret = jh7100_reset_assert(rcdev, id);
-	if (ret)
-		return ret;
-
-	return jh7100_reset_deassert(rcdev, id);
-}
-
-static int jh7100_reset_status(struct reset_controller_dev *rcdev,
-			       unsigned long id)
-{
-	struct jh7100_reset *data = jh7100_reset_from(rcdev);
-	unsigned long offset = BIT_ULL_WORD(id);
-	u64 mask = BIT_ULL_MASK(id);
-	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(u64);
-	u64 value = readq(reg_status);
-
-	return !((value ^ jh7100_reset_asserted[offset]) & mask);
-}
-
-static const struct reset_control_ops jh7100_reset_ops = {
-	.assert		= jh7100_reset_assert,
-	.deassert	= jh7100_reset_deassert,
-	.reset		= jh7100_reset_reset,
-	.status		= jh7100_reset_status,
-};
-
-static int __init jh7100_reset_probe(struct platform_device *pdev)
-{
-	struct jh7100_reset *data;
-
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->base))
-		return PTR_ERR(data->base);
-
-	data->rcdev.ops = &jh7100_reset_ops;
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = JH7100_RSTN_END;
-	data->rcdev.dev = &pdev->dev;
-	data->rcdev.of_node = pdev->dev.of_node;
-	spin_lock_init(&data->lock);
-
-	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
-}
+#include "reset-starfive-jh71x0.h"
 
 static const struct of_device_id jh7100_reset_dt_ids[] = {
 	{ .compatible = "starfive,jh7100-reset" },
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
new file mode 100644
index 000000000000..114a13c4b8a6
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JH7100 SoC
+ *
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/iopoll.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+
+#include "reset-starfive-jh71x0.h"
+
+#include <dt-bindings/reset/starfive-jh7100.h>
+
+/* register offsets */
+#define JH7100_RESET_ASSERT0	0x00
+#define JH7100_RESET_ASSERT1	0x04
+#define JH7100_RESET_ASSERT2	0x08
+#define JH7100_RESET_ASSERT3	0x0c
+#define JH7100_RESET_STATUS0	0x10
+#define JH7100_RESET_STATUS1	0x14
+#define JH7100_RESET_STATUS2	0x18
+#define JH7100_RESET_STATUS3	0x1c
+
+/*
+ * Writing a 1 to the n'th bit of the m'th ASSERT register asserts
+ * line 32m + n, and writing a 0 deasserts the same line.
+ * Most reset lines have their status inverted so a 0 bit in the STATUS
+ * register means the line is asserted and a 1 means it's deasserted. A few
+ * lines don't though, so store the expected value of the status registers when
+ * all lines are asserted.
+ */
+static const u64 jh7100_reset_asserted[2] = {
+	/* STATUS0 */
+	BIT_ULL_MASK(JH7100_RST_U74) |
+	BIT_ULL_MASK(JH7100_RST_VP6_DRESET) |
+	BIT_ULL_MASK(JH7100_RST_VP6_BRESET) |
+	/* STATUS1 */
+	BIT_ULL_MASK(JH7100_RST_HIFI4_DRESET) |
+	BIT_ULL_MASK(JH7100_RST_HIFI4_BRESET),
+	/* STATUS2 */
+	BIT_ULL_MASK(JH7100_RST_E24) |
+	/* STATUS3 */
+	0,
+};
+
+struct jh7100_reset {
+	struct reset_controller_dev rcdev;
+	/* protect registers against concurrent read-modify-write */
+	spinlock_t lock;
+	void __iomem *base;
+};
+
+static inline struct jh7100_reset *
+jh7100_reset_from(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct jh7100_reset, rcdev);
+}
+
+static int jh7100_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	unsigned long offset = BIT_ULL_WORD(id);
+	u64 mask = BIT_ULL_MASK(id);
+	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + offset * sizeof(u64);
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(u64);
+	u64 done = jh7100_reset_asserted[offset] & mask;
+	u64 value;
+	unsigned long flags;
+	int ret;
+
+	if (!assert)
+		done ^= mask;
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	value = readq(reg_assert);
+	if (assert)
+		value |= mask;
+	else
+		value &= ~mask;
+	writeq(value, reg_assert);
+
+	/* if the associated clock is gated, deasserting might otherwise hang forever */
+	ret = readq_poll_timeout_atomic(reg_status, value, (value & mask) == done, 0, 1000);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+	return ret;
+}
+
+static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	return jh7100_reset_update(rcdev, id, true);
+}
+
+static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return jh7100_reset_update(rcdev, id, false);
+}
+
+static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	int ret;
+
+	ret = jh7100_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return jh7100_reset_deassert(rcdev, id);
+}
+
+static int jh7100_reset_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	unsigned long offset = BIT_ULL_WORD(id);
+	u64 mask = BIT_ULL_MASK(id);
+	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(u64);
+	u64 value = readq(reg_status);
+
+	return !((value ^ jh7100_reset_asserted[offset]) & mask);
+}
+
+static const struct reset_control_ops jh7100_reset_ops = {
+	.assert		= jh7100_reset_assert,
+	.deassert	= jh7100_reset_deassert,
+	.reset		= jh7100_reset_reset,
+	.status		= jh7100_reset_status,
+};
+
+int jh7100_reset_probe(struct platform_device *pdev)
+{
+	struct jh7100_reset *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return PTR_ERR(data->base);
+
+	data->rcdev.ops = &jh7100_reset_ops;
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.nr_resets = JH7100_RSTN_END;
+	data->rcdev.dev = &pdev->dev;
+	data->rcdev.of_node = pdev->dev.of_node;
+	spin_lock_init(&data->lock);
+
+	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+}
+EXPORT_SYMBOL_GPL(jh7100_reset_probe);
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
new file mode 100644
index 000000000000..318d7a0e096a
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+#ifndef __RESET_STARFIVE_JH71X0_H
+#define __RESET_STARFIVE_JH71X0_H
+
+int jh7100_reset_probe(struct platform_device *pdev);
+
+#endif /* __RESET_STARFIVE_JH71X0_H */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
