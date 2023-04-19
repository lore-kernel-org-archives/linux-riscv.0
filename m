Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC5EC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 03:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOOvg0E9cBY1rObY+5kwWdAmrwNP1nkcPX7UxIMdJQc=; b=HekyoQ/41htkxm
	0/8VJE3sBqjw4nuyjenFf/hcV2dxAXuVr5qZtpeYRDOgakPbjoste4NEk/CQjpNB84NokcAxlsH77
	qC6dcMpziTkSXIGEeEtJSFcyQ5KUAgh0+k88EdFEea+/X5QySMEC1DVNS2qKU4k4BIUSjpuSbkb/c
	RHOF/KwQypPt5l+glpqwbFtjgMpYhmpIKQXI7gl2hWqdoLWy90QPnwHAwaqHqMBUnUDC/Dsmtl7w5
	6pzX2IEBW9BodjiwiFBuZSjBnZyK0RHOuzvQ8ePbsLB9cxZziqcVMNNn3MrHWkyW1ccXEm2S/Rxb6
	EBWoXlBKzA5EDO5fS4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poywN-003w0O-38;
	Wed, 19 Apr 2023 03:57:07 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poywJ-003vxY-00
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 03:57:05 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 97E2D24E22D;
	Wed, 19 Apr 2023 11:56:53 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:56:53 +0800
Received: from ubuntu.localdomain (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:56:52 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [RESEND v2 5/6] soc: starfive: Add JH7110 AON PMU support
Date: Tue, 18 Apr 2023 20:56:45 -0700
Message-ID: <20230419035646.43702-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_205703_347604_0B914929 
X-CRM114-Status: GOOD (  18.17  )
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

Add AON PMU for StarFive JH7110 SoC. It can be used to turn on/off the
dphy rx/tx power switch.

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                       |  1 +
 drivers/soc/starfive/jh71xx_pmu.c | 63 ++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fafeea8ebdb..8f32d43a9b67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19950,6 +19950,7 @@ F:	include/dt-bindings/reset/starfive?jh71*.h
 
 STARFIVE JH71XX PMU CONTROLLER DRIVER
 M:	Walker Chen <walker.chen@starfivetech.com>
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/power/starfive*
 F:	drivers/soc/starfive/jh71xx_pmu.c
diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh71xx_pmu.c
index bb44cc93e822..1303826aa7b5 100644
--- a/drivers/soc/starfive/jh71xx_pmu.c
+++ b/drivers/soc/starfive/jh71xx_pmu.c
@@ -2,7 +2,7 @@
 /*
  * StarFive JH71XX PMU (Power Management Unit) Controller Driver
  *
- * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
  */
 
 #include <linux/interrupt.h>
@@ -24,6 +24,9 @@
 #define JH71XX_PMU_EVENT_STATUS		0x88
 #define JH71XX_PMU_INT_STATUS		0x8C
 
+/* aon pmu register offset */
+#define JH71XX_AON_PMU_SWITCH		0x00
+
 /* sw encourage cfg */
 #define JH71XX_PMU_SW_ENCOURAGE_EN_LO	0x05
 #define JH71XX_PMU_SW_ENCOURAGE_EN_HI	0x50
@@ -163,6 +166,23 @@ static int jh7110_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 	return 0;
 }
 
+static int jh7110_aon_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
+{
+	struct jh71xx_pmu *pmu = pmd->pmu;
+	unsigned long flags;
+
+	spin_lock_irqsave(&pmu->lock, flags);
+
+	if (on)
+		regmap_update_bits(pmu->base, JH71XX_AON_PMU_SWITCH, mask, mask);
+	else
+		regmap_update_bits(pmu->base, JH71XX_AON_PMU_SWITCH, mask, 0);
+
+	spin_unlock_irqrestore(&pmu->lock, flags);
+
+	return 0;
+}
+
 static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
 {
 	struct jh71xx_pmu *pmu = pmd->pmu;
@@ -270,6 +290,24 @@ static int jh7110_pmu_parse_dt(struct platform_device *pdev, struct jh71xx_pmu *
 	return 0;
 }
 
+static int jh7110_aon_pmu_parse_dt(struct platform_device *pdev, struct jh71xx_pmu *pmu)
+{
+	struct device *parent;
+	struct device *dev = &pdev->dev;
+
+	parent = pdev->dev.parent;
+	if (!parent) {
+		dev_err(dev, "No parent for syscon pmu\n");
+		return -ENODEV;
+	}
+
+	pmu->base = syscon_node_to_regmap(parent->of_node);
+	if (IS_ERR(pmu->base))
+		return PTR_ERR(pmu->base);
+
+	return 0;
+}
+
 static int jh71xx_pmu_init_domain(struct jh71xx_pmu *pmu, int index)
 {
 	struct jh71xx_pmu_dev *pmd;
@@ -398,10 +436,32 @@ static const struct jh71xx_pmu_match_data jh7110_pmu = {
 	.pmu_set_state = jh7110_pmu_set_state,
 };
 
+static const struct jh71xx_domain_info jh7110_aon_power_domains[] = {
+	[JH7110_PD_DPHY_TX] = {
+		.name = "DPHY-TX",
+		.bit = 30,
+	},
+	[JH7110_PD_DPHY_RX] = {
+		.name = "DPHY-RX",
+		.bit = 31,
+	},
+};
+
+static const struct jh71xx_pmu_match_data jh7110_aon_pmu = {
+	.num_domains = ARRAY_SIZE(jh7110_aon_power_domains),
+	.domain_info = jh7110_aon_power_domains,
+	.pmu_status = JH71XX_AON_PMU_SWITCH,
+	.pmu_parse_dt = jh7110_aon_pmu_parse_dt,
+	.pmu_set_state = jh7110_aon_pmu_set_state,
+};
+
 static const struct of_device_id jh71xx_pmu_of_match[] = {
 	{
 		.compatible = "starfive,jh7110-pmu",
 		.data = (void *)&jh7110_pmu,
+	}, {
+		.compatible = "starfive,jh7110-aon-pmu",
+		.data = (void *)&jh7110_aon_pmu,
 	}, {
 		/* sentinel */
 	}
@@ -418,5 +478,6 @@ static struct platform_driver jh71xx_pmu_driver = {
 builtin_platform_driver(jh71xx_pmu_driver);
 
 MODULE_AUTHOR("Walker Chen <walker.chen@starfivetech.com>");
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
 MODULE_DESCRIPTION("StarFive JH71XX PMU Driver");
 MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
