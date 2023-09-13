Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0D5EDEC4D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IojmCMJXsGEsRHxVMReVELMi6Tu58gGReSn3Xea5zwQ=; b=rLE6hLL5VxFyvL
	lVNo231BT9DhmQjN/IizLM5X0Ze1XrWTuDxw4agCOZdTJxIvhN/Wxt+zCAOhQ6twxaIeQxLLeBJhH
	WOSBWbO6NV4jb4wbmHo+yDbDiLyCAVTUN3UQYDO+lzQQmUbLAHy4TuSUh0VyOZ07Xh86W7iV1kvja
	Pp4HDRsNW47hd37aB3n1Nml3olmXeA1BainTQAtpQT0H739/xyYG2CPIzkR5UGXHDXn4AreZELeeA
	d1Pqc0+d0Xs3IGGTRsM3cRRWwkvsavUFLac3w3okDsWa3wIHTTHpzglLCzfP+VaClHu4tPKoSaaiO
	Ho01rIkBwwOk+JbP5ltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLw-0064Is-01;
	Wed, 13 Sep 2023 13:56:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgQLr-0064HO-3A
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:56:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5A24B82418;
	Wed, 13 Sep 2023 13:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F66EC433CB;
	Wed, 13 Sep 2023 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694613377;
	bh=cgBRTpOCoQ02lX8+ZHrREg0hGUDkddmlWjO3J9n11zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHG/3/f/73gQRc6fTowhamRBshwoB0WUeFE5IiPWuHOXDLEnerVq7p1iqK+Uu/+O1
	 XBvmifvqFUhVmlaZxb8w4CtKbUjDvY9ypDQaOmJSbhj2VmYbzoECNOy1HDTRFsiAXI
	 xqW+uoly/42bIRm3H2byj0yxi+NOhRJ5dz0x4+O+oRspC2XnentOIjvOXZ5g0oCaul
	 ZtwgcfrLHnfnDf2q78zR88x2scLZYkd/bkwje+fe6fXCSo7+djotTO0a6Tjoqnu8bX
	 JbJsoENflpQNYc67K8WQVaJ+tUizeP+aM/B+mW/5sPE557wSAHqyLGmWHyZN0NmkzJ
	 b+yU3xMhtHwuw==
From: Conor Dooley <conor@kernel.org>
To: ulf.hansson@linaro.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	arnd@arndb.de,
	changhuang.liang@starfivetech.com,
	jiajie.ho@starfivetech.com,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh@kernel.org,
	walker.chen@starfivetech.com
Subject: [GIT PULL 4/5] pmdomain: starfive: Extract JH7110 pmu private operations
Date: Wed, 13 Sep 2023 14:54:27 +0100
Message-Id: <20230913-slideshow-luckiness-38ff17de84c6@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5331; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6vY7S9qkB6xWv0jxylFj8LgeyML+j8MwARcipZNCtvg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmM+wWEV/6XKul5Ilh67OkHiVn/3/6/XH7Dy5Oz+tap7 J8RNhwvOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARz60M/5PmlQUI/eHqryvc 1vtt+tMofvdY2wtOu97XPItdN79aU5zhf55oW/1x9pffQ365rrjNskvp2JpbRzRNn71cvbqSa23 XFW4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_065620_310412_EEEE8C0F 
X-CRM114-Status: GOOD (  18.64  )
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

From: Changhuang Liang <changhuang.liang@starfivetech.com>

Move JH7110 private operation into private data of compatible. Convenient
to add AON PMU which would not have interrupts property.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pmdomain/starfive/jh71xx-pmu.c | 89 ++++++++++++++++++--------
 1 file changed, 62 insertions(+), 27 deletions(-)

diff --git a/drivers/pmdomain/starfive/jh71xx-pmu.c b/drivers/pmdomain/starfive/jh71xx-pmu.c
index d3b78a619d40..547cd3b9df11 100644
--- a/drivers/pmdomain/starfive/jh71xx-pmu.c
+++ b/drivers/pmdomain/starfive/jh71xx-pmu.c
@@ -50,9 +50,17 @@ struct jh71xx_domain_info {
 	u8 bit;
 };
 
+struct jh71xx_pmu;
+struct jh71xx_pmu_dev;
+
 struct jh71xx_pmu_match_data {
 	const struct jh71xx_domain_info *domain_info;
 	int num_domains;
+	unsigned int pmu_status;
+	int (*pmu_parse_irq)(struct platform_device *pdev,
+			     struct jh71xx_pmu *pmu);
+	int (*pmu_set_state)(struct jh71xx_pmu_dev *pmd,
+			     u32 mask, bool on);
 };
 
 struct jh71xx_pmu {
@@ -78,12 +86,12 @@ static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool *is_o
 	if (!mask)
 		return -EINVAL;
 
-	*is_on = readl(pmu->base + JH71XX_PMU_CURR_POWER_MODE) & mask;
+	*is_on = readl(pmu->base + pmu->match_data->pmu_status) & mask;
 
 	return 0;
 }
 
-static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
+static int jh7110_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 {
 	struct jh71xx_pmu *pmu = pmd->pmu;
 	unsigned long flags;
@@ -91,22 +99,8 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 	u32 mode;
 	u32 encourage_lo;
 	u32 encourage_hi;
-	bool is_on;
 	int ret;
 
-	ret = jh71xx_pmu_get_state(pmd, mask, &is_on);
-	if (ret) {
-		dev_dbg(pmu->dev, "unable to get current state for %s\n",
-			pmd->genpd.name);
-		return ret;
-	}
-
-	if (is_on == on) {
-		dev_dbg(pmu->dev, "pm domain [%s] is already %sable status.\n",
-			pmd->genpd.name, on ? "en" : "dis");
-		return 0;
-	}
-
 	spin_lock_irqsave(&pmu->lock, flags);
 
 	/*
@@ -165,6 +159,29 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 	return 0;
 }
 
+static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
+{
+	struct jh71xx_pmu *pmu = pmd->pmu;
+	const struct jh71xx_pmu_match_data *match_data = pmu->match_data;
+	bool is_on;
+	int ret;
+
+	ret = jh71xx_pmu_get_state(pmd, mask, &is_on);
+	if (ret) {
+		dev_dbg(pmu->dev, "unable to get current state for %s\n",
+			pmd->genpd.name);
+		return ret;
+	}
+
+	if (is_on == on) {
+		dev_dbg(pmu->dev, "pm domain [%s] is already %sable status.\n",
+			pmd->genpd.name, on ? "en" : "dis");
+		return 0;
+	}
+
+	return match_data->pmu_set_state(pmd, mask, on);
+}
+
 static int jh71xx_pmu_on(struct generic_pm_domain *genpd)
 {
 	struct jh71xx_pmu_dev *pmd = container_of(genpd,
@@ -225,6 +242,25 @@ static irqreturn_t jh71xx_pmu_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int jh7110_pmu_parse_irq(struct platform_device *pdev, struct jh71xx_pmu *pmu)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
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
@@ -274,19 +310,18 @@ static int jh71xx_pmu_probe(struct platform_device *pdev)
 	if (IS_ERR(pmu->base))
 		return PTR_ERR(pmu->base);
 
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
 
+	ret = match_data->pmu_parse_irq(pdev, pmu);
+	if (ret) {
+		dev_err(dev, "failed to parse irq\n");
+		return ret;
+	}
+
 	pmu->genpd = devm_kcalloc(dev, match_data->num_domains,
 				  sizeof(struct generic_pm_domain *),
 				  GFP_KERNEL);
@@ -306,9 +341,6 @@ static int jh71xx_pmu_probe(struct platform_device *pdev)
 		}
 	}
 
-	spin_lock_init(&pmu->lock);
-	jh71xx_pmu_int_enable(pmu, JH71XX_PMU_INT_ALL_MASK & ~JH71XX_PMU_INT_PCH_FAIL, true);
-
 	ret = of_genpd_add_provider_onecell(np, &pmu->genpd_data);
 	if (ret) {
 		dev_err(dev, "failed to register genpd driver: %d\n", ret);
@@ -356,6 +388,9 @@ static const struct jh71xx_domain_info jh7110_power_domains[] = {
 static const struct jh71xx_pmu_match_data jh7110_pmu = {
 	.num_domains = ARRAY_SIZE(jh7110_power_domains),
 	.domain_info = jh7110_power_domains,
+	.pmu_status = JH71XX_PMU_CURR_POWER_MODE,
+	.pmu_parse_irq = jh7110_pmu_parse_irq,
+	.pmu_set_state = jh7110_pmu_set_state,
 };
 
 static const struct of_device_id jh71xx_pmu_of_match[] = {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
