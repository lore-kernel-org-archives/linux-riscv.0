Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44808C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 03:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGfKK2KdzYJ2fS0Bgez6QyDQRV+A0+ADbZhL7RelwF4=; b=p9BFcZ/pAszNM8
	gqtPvbiCQOB64/1cPTfnOr2PMDaDwO52RAmmugSJByaqlv+RRtLm4HwsnKd103UxKemzZAS9sZRBf
	7XDql/sBfWBCv3SpHAWZ4kvT5tf5/w5K1DBijh6QIisYm7weSSDWqvNY2VgUe+fIKY5dx+bo71E6g
	Sygtx/XMy77k27C54QTI2S5Kk2y02Vcchsak+RujjAm+4G7EbMG65TGPbVDBhzCGgMRfJk3FNnEMn
	cpVQoSIV2T2w5cJLyMnpq0LWuxvxNbdIgbyJNjYIKGloHeqeODHfwbmHTUBZhJSqTauPyLMv2kdn3
	KEs7Djk6A1vUMcVkh4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poyox-003uvi-1K;
	Wed, 19 Apr 2023 03:49:27 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poyot-003urE-1R
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 03:49:26 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9189824E250;
	Wed, 19 Apr 2023 11:48:42 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:48:37 +0800
Received: from ubuntu.localdomain (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:48:36 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 3/6] soc: starfive: Modify ioremap to regmap
Date: Tue, 18 Apr 2023 20:48:29 -0700
Message-ID: <20230419034833.43243-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419034833.43243-1-changhuang.liang@starfivetech.com>
References: <20230419034833.43243-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_204923_815750_F44027ED 
X-CRM114-Status: GOOD (  16.59  )
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

Modify ioremap to regmap which can be compatible with the syscon
interface, such as:
struct regmap *syscon_node_to_regmap(struct device_node *np)
Convenient introduction of syscon operation.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/soc/starfive/jh71xx_pmu.c | 43 +++++++++++++++++--------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh71xx_pmu.c
index 7d5f50d71c0d..306218c83691 100644
--- a/drivers/soc/starfive/jh71xx_pmu.c
+++ b/drivers/soc/starfive/jh71xx_pmu.c
@@ -6,13 +6,13 @@
  */
 
 #include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/regmap.h>
 #include <dt-bindings/power/starfive,jh7110-pmu.h>
 
 /* register offset */
@@ -59,7 +59,7 @@ struct jh71xx_pmu_match_data {
 struct jh71xx_pmu {
 	struct device *dev;
 	const struct jh71xx_pmu_match_data *match_data;
-	void __iomem *base;
+	struct regmap *base;
 	struct generic_pm_domain **genpd;
 	struct genpd_onecell_data genpd_data;
 	int irq;
@@ -75,11 +75,14 @@ struct jh71xx_pmu_dev {
 static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool *is_on)
 {
 	struct jh71xx_pmu *pmu = pmd->pmu;
+	unsigned int val;
 
 	if (!mask)
 		return -EINVAL;
 
-	*is_on = readl(pmu->base + JH71XX_PMU_CURR_POWER_MODE) & mask;
+	regmap_read(pmu->base, JH71XX_PMU_CURR_POWER_MODE, &val);
+
+	*is_on = val & mask;
 
 	return 0;
 }
@@ -130,7 +133,7 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 		encourage_hi = JH71XX_PMU_SW_ENCOURAGE_DIS_HI;
 	}
 
-	writel(mask, pmu->base + mode);
+	regmap_write(pmu->base, mode, mask);
 
 	/*
 	 * 2.Write SW encourage command sequence to the Software Encourage Reg (offset 0x44)
@@ -140,21 +143,21 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 	 *   Then write the lower bits of the command sequence, followed by the upper
 	 *   bits. The sequence differs between powering on & off a domain.
 	 */
-	writel(JH71XX_PMU_SW_ENCOURAGE_ON, pmu->base + JH71XX_PMU_SW_ENCOURAGE);
-	writel(encourage_lo, pmu->base + JH71XX_PMU_SW_ENCOURAGE);
-	writel(encourage_hi, pmu->base + JH71XX_PMU_SW_ENCOURAGE);
+	regmap_write(pmu->base, JH71XX_PMU_SW_ENCOURAGE, JH71XX_PMU_SW_ENCOURAGE_ON);
+	regmap_write(pmu->base, JH71XX_PMU_SW_ENCOURAGE, encourage_lo);
+	regmap_write(pmu->base, JH71XX_PMU_SW_ENCOURAGE, encourage_hi);
 
 	spin_unlock_irqrestore(&pmu->lock, flags);
 
 	/* Wait for the power domain bit to be enabled / disabled */
 	if (on) {
-		ret = readl_poll_timeout_atomic(pmu->base + JH71XX_PMU_CURR_POWER_MODE,
-						val, val & mask,
-						1, JH71XX_PMU_TIMEOUT_US);
+		ret = regmap_read_poll_timeout_atomic(pmu->base, JH71XX_PMU_CURR_POWER_MODE,
+						      val, val & mask,
+						      1, JH71XX_PMU_TIMEOUT_US);
 	} else {
-		ret = readl_poll_timeout_atomic(pmu->base + JH71XX_PMU_CURR_POWER_MODE,
-						val, !(val & mask),
-						1, JH71XX_PMU_TIMEOUT_US);
+		ret = regmap_read_poll_timeout_atomic(pmu->base, JH71XX_PMU_CURR_POWER_MODE,
+						      val, !(val & mask),
+						      1, JH71XX_PMU_TIMEOUT_US);
 	}
 
 	if (ret) {
@@ -190,14 +193,14 @@ static void jh71xx_pmu_int_enable(struct jh71xx_pmu *pmu, u32 mask, bool enable)
 	unsigned long flags;
 
 	spin_lock_irqsave(&pmu->lock, flags);
-	val = readl(pmu->base + JH71XX_PMU_TIMER_INT_MASK);
+	regmap_read(pmu->base, JH71XX_PMU_TIMER_INT_MASK, &val);
 
 	if (enable)
 		val &= ~mask;
 	else
 		val |= mask;
 
-	writel(val, pmu->base + JH71XX_PMU_TIMER_INT_MASK);
+	regmap_write(pmu->base, JH71XX_PMU_TIMER_INT_MASK, val);
 	spin_unlock_irqrestore(&pmu->lock, flags);
 }
 
@@ -206,7 +209,7 @@ static irqreturn_t jh71xx_pmu_interrupt(int irq, void *data)
 	struct jh71xx_pmu *pmu = data;
 	u32 val;
 
-	val = readl(pmu->base + JH71XX_PMU_INT_STATUS);
+	regmap_read(pmu->base, JH71XX_PMU_INT_STATUS, &val);
 
 	if (val & JH71XX_PMU_INT_SEQ_DONE)
 		dev_dbg(pmu->dev, "sequence done.\n");
@@ -220,8 +223,8 @@ static irqreturn_t jh71xx_pmu_interrupt(int irq, void *data)
 		dev_err(pmu->dev, "p-channel fail event.\n");
 
 	/* clear interrupts */
-	writel(val, pmu->base + JH71XX_PMU_INT_STATUS);
-	writel(val, pmu->base + JH71XX_PMU_EVENT_STATUS);
+	regmap_write(pmu->base, JH71XX_PMU_INT_STATUS, val);
+	regmap_write(pmu->base, JH71XX_PMU_EVENT_STATUS, val);
 
 	return IRQ_HANDLED;
 }
@@ -271,7 +274,7 @@ static int jh71xx_pmu_probe(struct platform_device *pdev)
 	if (!pmu)
 		return -ENOMEM;
 
-	pmu->base = devm_platform_ioremap_resource(pdev, 0);
+	pmu->base = device_node_to_regmap(np);
 	if (IS_ERR(pmu->base))
 		return PTR_ERR(pmu->base);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
