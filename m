Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6BBC7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 06:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w86jatbMGA5wMtYxkzr++gnQNO7vz00pgL6+8MTeKK0=; b=QsYA48V46y06WV
	zjOSxHKx/98u4eqe7OVjCWU3I47oMkPOyh9dnuRQ/NaWj6UwTq6uUzmTJVRZ0Fm/I6yYu1ekISv13
	P6020FPYcpQgqC/VWIwA/OxVpnzwYcMyDbvh+P8d5wLzinC6Wtls+8IM1/ebhq5VU0dg+UivCUX22
	H8ILbf/N8zEitc9oVthLtLc5rLGrcn6VYeFyowfjz+wZPvty8F/x400EcqSgkEI+Y5N5mJLFYX0yU
	n6CPHFOOGUms5xSUELbyqQO3GrvB5Vw3Zj3b8F7uZ8i+KVvhCFJ4HRm80QE7sbz2iAEoaTUqQNKm3
	IhZzty4GeAT7d7BgHcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm7nr-00GcaA-1n;
	Tue, 11 Apr 2023 06:48:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm7nn-00GcQA-20
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 06:48:29 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A84DE24E226;
	Tue, 11 Apr 2023 14:47:48 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 14:47:48 +0800
Received: from ubuntu.localdomain (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 14:47:47 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 5/7] soc: starfive: Use call back to parse device tree resources
Date: Mon, 10 Apr 2023 23:47:41 -0700
Message-ID: <20230411064743.273388-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_234827_989457_622B6C2F 
X-CRM114-Status: GOOD (  15.98  )
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

Different compatible parse device tree resources work in different ways.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/soc/starfive/jh71xx_pmu.c | 54 ++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh71xx_pmu.c
index 98f6849d61de..990db6735c48 100644
--- a/drivers/soc/starfive/jh71xx_pmu.c
+++ b/drivers/soc/starfive/jh71xx_pmu.c
@@ -57,10 +57,14 @@ struct jh71xx_domain_info {
 	u8 bit;
 };
 
+struct jh71xx_pmu;
+
 struct jh71xx_pmu_match_data {
 	const struct jh71xx_domain_info *domain_info;
 	int num_domains;
 	u8 pmu_type;
+	int (*pmu_parse_dt)(struct platform_device *pdev,
+			    struct jh71xx_pmu *pmu);
 };
 
 struct jh71xx_pmu {
@@ -251,6 +255,31 @@ static irqreturn_t jh71xx_pmu_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int jh7110_pmu_general_parse_dt(struct platform_device *pdev,
+				       struct jh71xx_pmu *pmu)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	pmu->base = device_node_to_regmap(np);
+	if (IS_ERR(pmu->base))
+		return PTR_ERR(pmu->base);
+
+	pmu->irq = platform_get_irq(pdev, 0);
+	if (pmu->irq < 0)
+		return pmu->irq;
+
+	ret = devm_request_irq(dev, pmu->irq, jh71xx_pmu_interrupt,
+			       0, pdev->name, pmu);
+	if (ret)
+		dev_err(dev, "failed to request irq\n");
+
+	jh71xx_pmu_int_enable(pmu, JH71XX_PMU_INT_ALL_MASK & ~JH71XX_PMU_INT_PCH_FAIL, true);
+
+	return 0;
+}
+
 static int jh71xx_pmu_init_domain(struct jh71xx_pmu *pmu, int index)
 {
 	struct jh71xx_pmu_dev *pmd;
@@ -296,23 +325,20 @@ static int jh71xx_pmu_probe(struct platform_device *pdev)
 	if (!pmu)
 		return -ENOMEM;
 
-	pmu->base = device_node_to_regmap(np);
-	if (IS_ERR(pmu->base))
-		return PTR_ERR(pmu->base);
-
-	pmu->irq = platform_get_irq(pdev, 0);
-	if (pmu->irq < 0)
-		return pmu->irq;
-
-	ret = devm_request_irq(dev, pmu->irq, jh71xx_pmu_interrupt,
-			       0, pdev->name, pmu);
-	if (ret)
-		dev_err(dev, "failed to request irq\n");
+	spin_lock_init(&pmu->lock);
 
 	match_data = of_device_get_match_data(dev);
 	if (!match_data)
 		return -EINVAL;
 
+	if (match_data->pmu_parse_dt) {
+		ret = match_data->pmu_parse_dt(pdev, pmu);
+		if (ret) {
+			dev_err(dev, "failed to parse dt\n");
+			return ret;
+		}
+	}
+
 	pmu->genpd = devm_kcalloc(dev, match_data->num_domains,
 				  sizeof(struct generic_pm_domain *),
 				  GFP_KERNEL);
@@ -332,9 +358,6 @@ static int jh71xx_pmu_probe(struct platform_device *pdev)
 		}
 	}
 
-	spin_lock_init(&pmu->lock);
-	jh71xx_pmu_int_enable(pmu, JH71XX_PMU_INT_ALL_MASK & ~JH71XX_PMU_INT_PCH_FAIL, true);
-
 	ret = of_genpd_add_provider_onecell(np, &pmu->genpd_data);
 	if (ret) {
 		dev_err(dev, "failed to register genpd driver: %d\n", ret);
@@ -383,6 +406,7 @@ static const struct jh71xx_pmu_match_data jh7110_pmu = {
 	.num_domains = ARRAY_SIZE(jh7110_power_domains),
 	.domain_info = jh7110_power_domains,
 	.pmu_type = JH71XX_PMU_GENERAL,
+	.pmu_parse_dt = jh7110_pmu_general_parse_dt,
 };
 
 static const struct of_device_id jh71xx_pmu_of_match[] = {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
