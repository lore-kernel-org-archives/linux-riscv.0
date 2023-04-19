Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D11DC77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 03:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHRd7kZawj9aFVrrk39DUrY9YeyT4yYfjpPBTIJAcUA=; b=A+fLh0LZkmx3cA
	12/8/mwHN6PkHVIiNSyGlEtYrHZytVK9HGSgvLvjDqZcAW7E+G9FSF4HD73uxhYoW2KaX/KsrKfyg
	DDjwFxQWb7ebbjGpRVXrPcK6ZF3Bv2JZmQAqv9c2DiAanrUMXGSE/IRXyD4cyQrQqjz6e1UERBI41
	GbBVqm17RDlyR9icylpw/hqcLM42loxy4RUG+/FwKATv3ZUfsMBV+cDiZNoLwJnNqVt6WJYNBro7I
	7C3Zfw2t4YNc4WGFFsskPKL0PXf1ZyNajCBKC6dLycgiJOew/R1+9nc7wTW4VsZVMFrP4i939zesr
	3LmUndPAHY3+bVQ0t5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poyp1-003uxQ-0I;
	Wed, 19 Apr 2023 03:49:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poyov-003upG-2c
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 03:49:27 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7D40724E24B;
	Wed, 19 Apr 2023 11:48:42 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:48:35 +0800
Received: from ubuntu.localdomain (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:48:35 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Date: Tue, 18 Apr 2023 20:48:27 -0700
Message-ID: <20230419034833.43243-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419034833.43243-1-changhuang.liang@starfivetech.com>
References: <20230419034833.43243-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_204925_997170_3FBE422D 
X-CRM114-Status: GOOD (  11.57  )
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

Add AON PMU for StarFive JH7110 SoC, it can be used to turn on/off DPHY
rx/tx power switch, and it don't need the properties of reg and
interrupts.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../bindings/power/starfive,jh7110-pmu.yaml       | 15 +++++++++++++--
 include/dt-bindings/power/starfive,jh7110-pmu.h   |  3 +++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
index 98eb8b4110e7..c50507c38e14 100644
--- a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
+++ b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
@@ -8,6 +8,7 @@ title: StarFive JH7110 Power Management Unit
 
 maintainers:
   - Walker Chen <walker.chen@starfivetech.com>
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
 
 description: |
   StarFive JH7110 SoC includes support for multiple power domains which can be
@@ -17,6 +18,7 @@ properties:
   compatible:
     enum:
       - starfive,jh7110-pmu
+      - starfive,jh7110-aon-pmu
 
   reg:
     maxItems: 1
@@ -29,10 +31,19 @@ properties:
 
 required:
   - compatible
-  - reg
-  - interrupts
   - "#power-domain-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-pmu
+    then:
+      required:
+        - reg
+        - interrupts
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
index 132bfe401fc8..0bfd6700c144 100644
--- a/include/dt-bindings/power/starfive,jh7110-pmu.h
+++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
@@ -14,4 +14,7 @@
 #define JH7110_PD_ISP		5
 #define JH7110_PD_VENC		6
 
+#define JH7110_PD_DPHY_TX	0
+#define JH7110_PD_DPHY_RX	1
+
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
