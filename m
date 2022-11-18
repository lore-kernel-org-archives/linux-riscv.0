Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB7DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 01:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oz/TwL3Fy3iGHVeDtLHdcV4tNwfwdzbpuBzzw6UV3H8=; b=G/NTrtPiZewA84
	RHZfrbXj2UTLN+dYMhuzXS21ff1b7uDJCllZyjDzo9eQEZ7PzKLcTaJCOSyIYLcbP0kkDUwBIsiu3
	SZB7d1qlzTMxgM/aj9fBNyKOafkhGTbQ51pwlbuL67X0tm8RANkUL7zVLkuVeyzPPlUTVG4P3Bplk
	MxEcaGzwUDmQWPPhdQFhN0fF6+GiihAQ18dfW6hwsCONeVg6FPeIrxKpVbR7RX8CYujXobEYeiq8C
	8NzcHbdSi0bI07zoPWez0iyi10D38Mlcu2G30Gzxp0cXi5bzOnQZ3FVHhKhvRYipta1kQXCrYO404
	RtBKEdY1RqD7IzTKYMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpqt-00171X-Ee; Fri, 18 Nov 2022 01:07:31 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpql-0016uK-UQ
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 01:07:26 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D7A3124E02F;
	Fri, 18 Nov 2022 09:06:33 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:33 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:33 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 06/14] reset: starfive: jh71x0: Use 32bit I/O on 32bit registers
Date: Fri, 18 Nov 2022 09:06:19 +0800
Message-ID: <20221118010627.70576-7-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118010627.70576-1-hal.feng@starfivetech.com>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_170724_291018_49442DE6 
X-CRM114-Status: GOOD (  16.82  )
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

We currently use 64bit I/O on the 32bit registers. This works because
there are an even number of assert and status registers, so they're only
ever accessed in pairs on 64bit boundaries.

There are however other reset controllers for audio and video on the
JH7100 SoC with only one status register that isn't 64bit aligned so
64bit I/O results in an unaligned access exception.

Switch to 32bit I/O in preparation for supporting these resets too.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh7100.c    | 14 ++++-----
 .../reset/starfive/reset-starfive-jh71x0.c    | 31 +++++++++----------
 .../reset/starfive/reset-starfive-jh71x0.h    |  2 +-
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
index 4be8510f1dd9..42c0034d0b37 100644
--- a/drivers/reset/starfive/reset-starfive-jh7100.c
+++ b/drivers/reset/starfive/reset-starfive-jh7100.c
@@ -30,16 +30,16 @@
  * lines don't though, so store the expected value of the status registers when
  * all lines are asserted.
  */
-static const u64 jh7100_reset_asserted[2] = {
+static const u32 jh7100_reset_asserted[4] = {
 	/* STATUS0 */
-	BIT_ULL_MASK(JH7100_RST_U74) |
-	BIT_ULL_MASK(JH7100_RST_VP6_DRESET) |
-	BIT_ULL_MASK(JH7100_RST_VP6_BRESET) |
+	BIT(JH7100_RST_U74 % 32) |
+	BIT(JH7100_RST_VP6_DRESET % 32) |
+	BIT(JH7100_RST_VP6_BRESET % 32),
 	/* STATUS1 */
-	BIT_ULL_MASK(JH7100_RST_HIFI4_DRESET) |
-	BIT_ULL_MASK(JH7100_RST_HIFI4_BRESET),
+	BIT(JH7100_RST_HIFI4_DRESET % 32) |
+	BIT(JH7100_RST_HIFI4_BRESET % 32),
 	/* STATUS2 */
-	BIT_ULL_MASK(JH7100_RST_E24) |
+	BIT(JH7100_RST_E24 % 32),
 	/* STATUS3 */
 	0,
 };
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index fa80912ef08e..8f3204273a0b 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -8,7 +8,6 @@
 #include <linux/bitmap.h>
 #include <linux/device.h>
 #include <linux/io.h>
-#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
@@ -19,7 +18,7 @@ struct jh71x0_reset {
 	spinlock_t lock;
 	void __iomem *assert;
 	void __iomem *status;
-	const u64 *asserted;
+	const u32 *asserted;
 };
 
 static inline struct jh71x0_reset *
@@ -32,12 +31,12 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
-	unsigned long offset = BIT_ULL_WORD(id);
-	u64 mask = BIT_ULL_MASK(id);
-	void __iomem *reg_assert = data->assert + offset * sizeof(u64);
-	void __iomem *reg_status = data->status + offset * sizeof(u64);
-	u64 done = data->asserted ? data->asserted[offset] & mask : 0;
-	u64 value;
+	unsigned long offset = id / 32;
+	u32 mask = BIT(id % 32);
+	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
+	void __iomem *reg_status = data->status + offset * sizeof(u32);
+	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
+	u32 value;
 	unsigned long flags;
 	int ret;
 
@@ -46,15 +45,15 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 
 	spin_lock_irqsave(&data->lock, flags);
 
-	value = readq(reg_assert);
+	value = readl(reg_assert);
 	if (assert)
 		value |= mask;
 	else
 		value &= ~mask;
-	writeq(value, reg_assert);
+	writel(value, reg_assert);
 
 	/* if the associated clock is gated, deasserting might otherwise hang forever */
-	ret = readq_poll_timeout_atomic(reg_status, value, (value & mask) == done, 0, 1000);
+	ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) == done, 0, 1000);
 
 	spin_unlock_irqrestore(&data->lock, flags);
 	return ret;
@@ -88,10 +87,10 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
-	unsigned long offset = BIT_ULL_WORD(id);
-	u64 mask = BIT_ULL_MASK(id);
-	void __iomem *reg_status = data->status + offset * sizeof(u64);
-	u64 value = readq(reg_status);
+	unsigned long offset = id / 32;
+	u32 mask = BIT(id % 32);
+	void __iomem *reg_status = data->status + offset * sizeof(u32);
+	u32 value = readl(reg_status);
 
 	return !((value ^ data->asserted[offset]) & mask);
 }
@@ -105,7 +104,7 @@ static const struct reset_control_ops jh71x0_reset_ops = {
 
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
-				   const u64 *asserted, unsigned int nr_resets,
+				   const u32 *asserted, unsigned int nr_resets,
 				   bool is_module)
 {
 	struct jh71x0_reset *data;
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index 3c70982dd56e..e6b27110de48 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -8,7 +8,7 @@
 
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
-				   const u64 *asserted, unsigned int nr_resets,
+				   const u32 *asserted, unsigned int nr_resets,
 				   bool is_module);
 
 #endif /* __RESET_STARFIVE_JH71X0_H */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
