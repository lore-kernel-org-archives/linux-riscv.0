Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5AC46467
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 07:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RKA2tlMXHpaBP9mtwAYyXobd6oP3j+E6YXwDT1c+bk=; b=uUuwlCStL0Cg0N
	WndX/7Gpxs2VvkQBEFqIArIQAyS8cc+UjEYCaIjY+NbHeKpcjFoCC3bwYjgqq16gmxKgpvoYVetTo
	VWlEUxcZ03CwR32Da+wrlBSjxamDTe1D/Eprr4AecvgBFuzkdE9LjuLUYO52cOH1xrF9Pteak4eu4
	RVSbEBDM+rY4F/x3kXDu0CSRzj5v5AtSdotscTTzfRKDiSYi/2hsdc7EL09Tfc+76zMKYYVoQOTiH
	Nh5LtrnVKN/RiRUCM4LlUv6Sh32OymQWyC2qFvGRrtOcL8O58DudRf4zvGyT3xd6GOIxam9jdRewp
	jiiE9ljW0FaSBGcEOKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKA5-0091a1-FP; Mon, 16 Jan 2023 07:44:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHKA0-0091R6-Rm
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 07:44:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A7A1124E22E;
	Mon, 16 Jan 2023 15:43:11 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Jan
 2023 15:43:11 +0800
Received: from localhost.localdomain (113.72.144.207) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Jan
 2023 15:43:10 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: power: Add starfive,jh7110-pmu
Date: Mon, 16 Jan 2023 15:42:57 +0800
Message-ID: <20230116074259.22874-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230116074259.22874-1-walker.chen@starfivetech.com>
References: <20230116074259.22874-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.207]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_234405_214735_03317337 
X-CRM114-Status: GOOD (  13.93  )
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
