Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF3C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 06:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wX7nj+xFxRlmEaxUy++AH7rLU42ku3Xd5JXPvYS0yY=; b=CDJxzjy4uxtQ8q
	tpL0BBIz1oXnVGzghF3qDu9XCeD5b5X7c6CvVq+gKbt0VNMSSyriKJinhdgGWMfqBXc0t/sLiLAH2
	2oL7keBgCwnP5fRRBtuBwQQqe2N4YzZpl2C6C+kqtBaA+4uApq/qpGMcLqkjbjPmE5ljkRk1vHhl+
	4ip8V8fusdpxPAbhXcsjkvAQsX5XXiS0hr+ofZpfVpB87TiKeWQxNvAxgnSn2dItn4vM8S5/zVibI
	cVHiTXFVvQGPcsvWDiKpS6BEhTW45cxSiKN+JRnJ1GV7M8hLOwNd+lxofmYoM4kbUG9YWGHbwxdJd
	fOijVY3xdQPiUPvNjVoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm7o2-00Gcig-29;
	Tue, 11 Apr 2023 06:48:42 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm7ny-00GcQN-2p
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 06:48:40 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F336D24E2B9;
	Tue, 11 Apr 2023 14:47:47 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
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
Subject: [PATCH v1 4/7] soc: starfive: Add pmu type operation
Date: Mon, 10 Apr 2023 23:47:40 -0700
Message-ID: <20230411064743.273388-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_234839_267367_6383A723 
X-CRM114-Status: GOOD (  15.78  )
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

Add pmu type, make a distinction between different PMU.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/soc/starfive/jh71xx_pmu.c | 55 ++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh71xx_pmu.c
index 306218c83691..98f6849d61de 100644
--- a/drivers/soc/starfive/jh71xx_pmu.c
+++ b/drivers/soc/starfive/jh71xx_pmu.c
@@ -45,6 +45,12 @@
  */
 #define JH71XX_PMU_TIMEOUT_US		100
 
+/* pmu type */
+enum pmu_type {
+	JH71XX_PMU_GENERAL,
+	JH71XX_PMU_DPHY,
+};
+
 struct jh71xx_domain_info {
 	const char * const name;
 	unsigned int flags;
@@ -54,6 +60,7 @@ struct jh71xx_domain_info {
 struct jh71xx_pmu_match_data {
 	const struct jh71xx_domain_info *domain_info;
 	int num_domains;
+	u8 pmu_type;
 };
 
 struct jh71xx_pmu {
@@ -75,19 +82,23 @@ struct jh71xx_pmu_dev {
 static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool *is_on)
 {
 	struct jh71xx_pmu *pmu = pmd->pmu;
+	unsigned int offset = 0;
 	unsigned int val;
 
 	if (!mask)
 		return -EINVAL;
 
-	regmap_read(pmu->base, JH71XX_PMU_CURR_POWER_MODE, &val);
+	if (pmu->match_data->pmu_type == JH71XX_PMU_GENERAL)
+		offset = JH71XX_PMU_CURR_POWER_MODE;
+
+	regmap_read(pmu->base, offset, &val);
 
 	*is_on = val & mask;
 
 	return 0;
 }
 
-static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
+static int jh71xx_pmu_general_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 {
 	struct jh71xx_pmu *pmu = pmd->pmu;
 	unsigned long flags;
@@ -95,22 +106,8 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
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
@@ -169,6 +166,31 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 	return 0;
 }
 
+static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
+{
+	struct jh71xx_pmu *pmu = pmd->pmu;
+	bool is_on;
+	int ret = 0;
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
+	if (pmu->match_data->pmu_type == JH71XX_PMU_GENERAL)
+		ret = jh71xx_pmu_general_set_state(pmd, mask, on);
+
+	return ret;
+}
+
 static int jh71xx_pmu_on(struct generic_pm_domain *genpd)
 {
 	struct jh71xx_pmu_dev *pmd = container_of(genpd,
@@ -360,6 +382,7 @@ static const struct jh71xx_domain_info jh7110_power_domains[] = {
 static const struct jh71xx_pmu_match_data jh7110_pmu = {
 	.num_domains = ARRAY_SIZE(jh7110_power_domains),
 	.domain_info = jh7110_power_domains,
+	.pmu_type = JH71XX_PMU_GENERAL,
 };
 
 static const struct of_device_id jh71xx_pmu_of_match[] = {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
