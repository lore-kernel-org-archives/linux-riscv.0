Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE6CC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YfksoMPVBLIabaCqOtg1yObe6F4cXJUM5qh6xhWgko=; b=HfYwWaJz6naUxl
	2AROGWnyPMN9BaFqorYCOM45z2kYUbL23mjk3BvlMd8ePUghsoYgvEbgMUrIZ/Kc6QWQHWLrffbuT
	sudMfaW+jSM9uAJ2dRSmEtTOw3qeR/Pb/pMTjbFZJVHUQWsWK16EYvCtt5TKzSW0VZnhsGC4OaLWc
	2N3wu4Yr5UJ5eMT35/D2lrlMXoK8WvN7dgMnYnI/rBym0taOE200FMNArTuYgff4kzNt4SrZ8+qMv
	9XC3KsoYnsMKl4KcKc4LneGxlxAKKPt7IwsS1lFQcH7vTkqPntqMzcSG4hbDJx4khkhs/1i4Qry5U
	pZAccUQJs/Aj1QqIEAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIRUD-004J49-Fh; Thu, 19 Jan 2023 09:45:33 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIRU9-004J0B-Ng
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 09:45:32 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EBA0F24DFCE;
	Thu, 19 Jan 2023 17:44:59 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Jan
 2023 17:45:00 +0800
Received: from localhost.localdomain (113.72.144.40) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Jan
 2023 17:44:59 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?=
	<heiko@sntech.de>, "Rafael J . Wysocki" <rafael@kernel.org>, Walker Chen
	<walker.chen@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: power: Add starfive,jh7110-pmu
Date: Thu, 19 Jan 2023 17:44:46 +0800
Message-ID: <20230119094447.21939-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230119094447.21939-1-walker.chen@starfivetech.com>
References: <20230119094447.21939-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.40]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_014530_145049_1FAC15CE 
X-CRM114-Status: GOOD (  13.83  )
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

Add bindings for the Power Management Unit on the StarFive JH7110 SoC.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/power/starfive,jh7110-pmu.yaml   | 45 +++++++++++++++++++
 .../dt-bindings/power/starfive,jh7110-pmu.h   | 17 +++++++
 2 files changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
 create mode 100644 include/dt-bindings/power/starfive,jh7110-pmu.h

diff --git a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
new file mode 100644
index 000000000000..98eb8b4110e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/starfive,jh7110-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Power Management Unit
+
+maintainers:
+  - Walker Chen <walker.chen@starfivetech.com>
+
+description: |
+  StarFive JH7110 SoC includes support for multiple power domains which can be
+  powered on/off by software based on different application scenes to save power.
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7110-pmu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pwrc: power-controller@17030000 {
+        compatible = "starfive,jh7110-pmu";
+        reg = <0x17030000 0x10000>;
+        interrupts = <111>;
+        #power-domain-cells = <1>;
+    };
diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
new file mode 100644
index 000000000000..132bfe401fc8
--- /dev/null
+++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Author: Walker Chen <walker.chen@starfivetech.com>
+ */
+#ifndef __DT_BINDINGS_POWER_JH7110_POWER_H__
+#define __DT_BINDINGS_POWER_JH7110_POWER_H__
+
+#define JH7110_PD_SYSTOP	0
+#define JH7110_PD_CPU		1
+#define JH7110_PD_GPUA		2
+#define JH7110_PD_VDEC		3
+#define JH7110_PD_VOUT		4
+#define JH7110_PD_ISP		5
+#define JH7110_PD_VENC		6
+
+#endif
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
