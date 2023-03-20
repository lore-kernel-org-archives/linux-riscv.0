Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B82C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqD58tm5/KXn9eopSAZE+CyAKLXBj4lzvMVWTe6HS9E=; b=jTwoIrMrw5AiRt
	nCAj53kedkkTOqjabM8XW1i6/QY4q7vvW/CPAp2JMkJR1j9eowkxzvSjfQeKz8jHJIjatGwXLiSZT
	ULu7H4FaVcIc7De7yr7HuHPEy5G0WRS6IlGeCTZME1cZplla58KGMQ6qBRD6pIsdADmsneyaQk9MW
	OY7UOHRY2ieMdJphsX42u6qd2OnZ/ccLWTqLPyqX3IUcZBuFCxFO/NvqAbcNSQ2Qfq2z7cuNLFJIQ
	ehEjg/uoch3Z/xnAvSPLhTYV83VFc3du0U/v3Ut5DmPY02FVquxgnFKaOtjUAAUzCrS+q/V2RY1oT
	ugwMT7O2zqzhUxavFAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCuO-008enB-0B;
	Mon, 20 Mar 2023 10:38:32 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCuD-008ecl-0E
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 10:38:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 33EAE24E289;
	Mon, 20 Mar 2023 18:37:59 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 18:37:59 +0800
Received: from ubuntu.localdomain (183.27.97.64) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 20 Mar
 2023 18:37:58 +0800
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
Subject: [PATCH v6 08/21] reset: starfive: Extract the common JH71X0 reset code
Date: Mon, 20 Mar 2023 18:37:37 +0800
Message-ID: <20230320103750.60295-9-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230320103750.60295-1-hal.feng@starfivetech.com>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_033821_582825_4B16167E 
X-CRM114-Status: GOOD (  21.98  )
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

Extract the common JH71X0 reset code for reusing them to
support JH7110 SoC.

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh7100.c    | 49 ++++++++++++
 .../reset/starfive/reset-starfive-jh71x0.c    | 76 ++++++-------------
 .../reset/starfive/reset-starfive-jh71x0.h    |  5 +-
 3 files changed, 76 insertions(+), 54 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
index 5a68327c1f6a..9d7cb4ed8869 100644
--- a/drivers/reset/starfive/reset-starfive-jh7100.c
+++ b/drivers/reset/starfive/reset-starfive-jh7100.c
@@ -10,6 +10,55 @@
 
 #include "reset-starfive-jh71x0.h"
 
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
+static int __init jh7100_reset_probe(struct platform_device *pdev)
+{
+	void __iomem *base = devm_platform_ioremap_resource(pdev, 0);
+
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	return reset_starfive_jh7100_register(&pdev->dev, pdev->dev.of_node,
+					      base + JH7100_RESET_ASSERT0,
+					      base + JH7100_RESET_STATUS0,
+					      jh7100_reset_asserted,
+					      JH7100_RSTN_END,
+					      THIS_MODULE);
+}
+
 static const struct of_device_id jh7100_reset_dt_ids[] = {
 	{ .compatible = "starfive,jh7100-reset" },
 	{ /* sentinel */ }
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index 114a13c4b8a6..3577444a89c6 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -10,51 +10,18 @@
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
-#include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
 
 #include "reset-starfive-jh71x0.h"
 
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
 struct jh7100_reset {
 	struct reset_controller_dev rcdev;
 	/* protect registers against concurrent read-modify-write */
 	spinlock_t lock;
-	void __iomem *base;
+	void __iomem *assert;
+	void __iomem *status;
+	const u64 *asserted;
 };
 
 static inline struct jh7100_reset *
@@ -69,9 +36,9 @@ static int jh7100_reset_update(struct reset_controller_dev *rcdev,
 	struct jh7100_reset *data = jh7100_reset_from(rcdev);
 	unsigned long offset = BIT_ULL_WORD(id);
 	u64 mask = BIT_ULL_MASK(id);
-	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + offset * sizeof(u64);
-	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(u64);
-	u64 done = jh7100_reset_asserted[offset] & mask;
+	void __iomem *reg_assert = data->assert + offset * sizeof(u64);
+	void __iomem *reg_status = data->status + offset * sizeof(u64);
+	u64 done = data->asserted ? data->asserted[offset] & mask : 0;
 	u64 value;
 	unsigned long flags;
 	int ret;
@@ -125,10 +92,10 @@ static int jh7100_reset_status(struct reset_controller_dev *rcdev,
 	struct jh7100_reset *data = jh7100_reset_from(rcdev);
 	unsigned long offset = BIT_ULL_WORD(id);
 	u64 mask = BIT_ULL_MASK(id);
-	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(u64);
+	void __iomem *reg_status = data->status + offset * sizeof(u64);
 	u64 value = readq(reg_status);
 
-	return !((value ^ jh7100_reset_asserted[offset]) & mask);
+	return !((value ^ data->asserted[offset]) & mask);
 }
 
 static const struct reset_control_ops jh7100_reset_ops = {
@@ -138,25 +105,28 @@ static const struct reset_control_ops jh7100_reset_ops = {
 	.status		= jh7100_reset_status,
 };
 
-int jh7100_reset_probe(struct platform_device *pdev)
+int reset_starfive_jh7100_register(struct device *dev, struct device_node *of_node,
+				   void __iomem *assert, void __iomem *status,
+				   const u64 *asserted, unsigned int nr_resets,
+				   struct module *owner)
 {
 	struct jh7100_reset *data;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->base))
-		return PTR_ERR(data->base);
-
 	data->rcdev.ops = &jh7100_reset_ops;
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = JH7100_RSTN_END;
-	data->rcdev.dev = &pdev->dev;
-	data->rcdev.of_node = pdev->dev.of_node;
+	data->rcdev.owner = owner;
+	data->rcdev.nr_resets = nr_resets;
+	data->rcdev.dev = dev;
+	data->rcdev.of_node = of_node;
+
 	spin_lock_init(&data->lock);
+	data->assert = assert;
+	data->status = status;
+	data->asserted = asserted;
 
-	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
+	return devm_reset_controller_register(dev, &data->rcdev);
 }
-EXPORT_SYMBOL_GPL(jh7100_reset_probe);
+EXPORT_SYMBOL_GPL(reset_starfive_jh7100_register);
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index 318d7a0e096a..1fc5a648c8d8 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -6,6 +6,9 @@
 #ifndef __RESET_STARFIVE_JH71X0_H
 #define __RESET_STARFIVE_JH71X0_H
 
-int jh7100_reset_probe(struct platform_device *pdev);
+int reset_starfive_jh7100_register(struct device *dev, struct device_node *of_node,
+				   void __iomem *assert, void __iomem *status,
+				   const u64 *asserted, unsigned int nr_resets,
+				   struct module *owner);
 
 #endif /* __RESET_STARFIVE_JH71X0_H */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
