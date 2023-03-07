Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C87C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 02:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG6OkS1Y8O2X77JUV0LDSO+75aXS7Rid40gUTe0ybXs=; b=Nws5RsRe21sLit
	gCa/ZPim3EqfSjFloBpkYCiKbnfLAEXabd8k69b1spC2ydQ09N0QtlZCpj9rPhflH6VtWqVCbwaJr
	2qSb4mf9GWz8X/DkcEkVqJZvmKLnCvRtQFmLICB4eaqsvF3JI7rr7bD7QLKeX3eUvAGqyXesoZGBN
	eMjo4sNVkPJfAQtiSQBnYz3U61bk4L1Y/wh/I+SYD+moWnKFozwHR1RdUb9PxD3t4nMFhwoBZNNiJ
	mML7otWefRW3UxGMLCyrtmQ1Yv0sLLOpQ5gm4LG4EixQ849mX6bEYosx4QMBpJLk6ArkWySiTSz2t
	U7yX6OyW8Nc4gPtJNGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNMG-00FyCR-0s; Tue, 07 Mar 2023 02:47:20 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZNMB-00Fy60-Ki
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 02:47:17 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C160424E23C;
	Tue,  7 Mar 2023 10:46:48 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 10:46:48 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 7 Mar 2023 10:46:47 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, William Qiu
	<william.qiu@starfivetech.com>, Conor Dooley <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v5 1/2] dt-bindings: syscon: Add StarFive syscon doc
Date: Tue, 7 Mar 2023 10:46:45 +0800
Message-ID: <20230307024646.10216-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307024646.10216-1-william.qiu@starfivetech.com>
References: <20230307024646.10216-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_184715_832596_81FD849D 
X-CRM114-Status: GOOD (  13.31  )
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

Add documentation to describe StarFive System Controller Registers.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/soc/starfive/jh7110-syscon.yaml  | 41 +++++++++++++++++++
 MAINTAINERS                                   |  5 +++
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
new file mode 100644
index 000000000000..72c8850602b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/starfive/jh7110-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 SoC system controller
+
+maintainers:
+  - William Qiu <william.qiu@starfivetech.com>
+
+description: |
+  The StarFive JH7110 SoC system controller provides register information such
+  as offset, mask and shift to configure related modules such as MMC and PCIe.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - starfive,jh7110-aon-syscon
+          - starfive,jh7110-stg-syscon
+          - starfive,jh7110-sys-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@10240000 {
+        compatible = "starfive,jh7110-stg-syscon", "syscon";
+        reg = <0x10240000 0x1000>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 644ac9479a6e..fc9d1781516a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19665,6 +19665,11 @@ F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
 F:	drivers/reset/starfive/reset-starfive-jh71*
 F:	include/dt-bindings/reset/starfive?jh71*.h
 
+STARFIVE JH7110 SYSCON
+M:	William Qiu <william.qiu@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
