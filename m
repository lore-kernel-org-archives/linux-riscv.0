Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F82C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 01:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmMx+e9gOykQw/Zrj3EFVTH/OCzhA/NCRBBgIiC5d8M=; b=5BhQJIoQSBF/De
	ulIfO7USOlU9Mh4WUYfKnOaTNa+06yVpUJJFQj0Jou6gAGDohP8WmzsgwqXszdSBtSsMkeZ4Y1FPG
	xyarZbOmwZpKa2CwgaCohx1j3eXBNxi5pOuD47ccuAmkWcIiej0ePkomSMKskfE6B1MpQlDAHXWdS
	rUr7/zEYzuAsAZF/ZyclRImOmL6GZiTCgE0dnlLObJj2RRgLajCODkHn/QZl+GItWKAfBp6V2CRJf
	yF32I8xEMK1lbcq+Yx25Czkqrcoil4VH4SEFvYnbgy1Vp+JU5gfzqwOSO5d0IJk4Bu85g4Pr7ZNwI
	M295rXJRuChh5hEtHaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ1h-004ige-3B;
	Wed, 10 May 2023 01:53:57 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ1d-004ias-29
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 01:53:55 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B60DC24E289;
	Wed, 10 May 2023 09:53:14 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 09:53:14 +0800
Received: from ubuntu.localdomain (183.27.98.219) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 09:53:13 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 1/5] dt-bindings: power: Add JH7110 AON PMU support
Date: Tue, 9 May 2023 18:53:07 -0700
Message-ID: <20230510015311.27505-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
References: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_185353_992164_3EB4963A 
X-CRM114-Status: GOOD (  11.20  )
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
rx/tx power switch, and it don't need the property of interrupts. It
also can use syscon operation.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../bindings/power/starfive,jh7110-pmu.yaml   | 28 +++++++++++++++++--
 .../dt-bindings/power/starfive,jh7110-pmu.h   |  5 +++-
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
index 98eb8b4110e7..0591a4e9db6c 100644
--- a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
+++ b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
@@ -8,6 +8,7 @@ title: StarFive JH7110 Power Management Unit
 
 maintainers:
   - Walker Chen <walker.chen@starfivetech.com>
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
 
 description: |
   StarFive JH7110 SoC includes support for multiple power domains which can be
@@ -15,8 +16,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - starfive,jh7110-pmu
+    oneOf:
+      - enum:
+          - starfive,jh7110-pmu
+      - items:
+          - enum:
+              - starfive,jh7110-aon-syscon
+          - const: syscon
 
   reg:
     maxItems: 1
@@ -30,9 +36,18 @@ properties:
 required:
   - compatible
   - reg
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
+        - interrupts
+
 additionalProperties: false
 
 examples:
@@ -43,3 +58,10 @@ examples:
         interrupts = <111>;
         #power-domain-cells = <1>;
     };
+
+  - |
+    aon_syscon: syscon@17010000 {
+        compatible = "starfive,jh7110-aon-syscon", "syscon";
+        reg = <0x17010000 0x1000>;
+        #power-domain-cells = <1>;
+    };
diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
index 132bfe401fc8..341e2a0676ba 100644
--- a/include/dt-bindings/power/starfive,jh7110-pmu.h
+++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
- * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
  * Author: Walker Chen <walker.chen@starfivetech.com>
  */
 #ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
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
