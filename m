Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1309FC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 03:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8plzlkc7V0hG6Oj+FkjV1sk7Hv4uRSNn9/0xYyZew1M=; b=tzZm4e96mnHZcZ
	gtB57B6G+6xZ+u0maJXoXlhdYQ3V2QQ29AU61kJkEkTee/BTC91BvlvSlJd/R9IfoV/C6M4wk7Jr/
	cwG/7jPAjrXzlSEmuwNBkxgtNalckgU4iBQZgLlEESwDpUL+0hkjPljTXzlM1XQ9JoMlP2ZOEAuWs
	hE3S5FLVmyV5eFYosxGug+4G2R5an38Or3yYKG3DvzljsOrh8QchddmqXijZRBo1ODWU8HeJlD6RQ
	GLoVG+6Ecf3QxsAQEQYHjn8Ou6U3ifzTuuvJsle+L1U7r1zwR2VtAZKXuD14M3nx8+GeoXfMb3fNt
	JQBol3dg/7OZrpCx4dbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI8j-00CCbg-0Z;
	Wed, 15 Mar 2023 03:49:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI8f-00CCXe-0k
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 03:49:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C1F1E24E313;
	Wed, 15 Mar 2023 11:48:55 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 11:48:55 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 15 Mar 2023 11:48:54 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [PATCH v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon doc
Date: Wed, 15 Mar 2023 11:48:52 +0800
Message-ID: <20230315034853.93677-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315034853.93677-1-william.qiu@starfivetech.com>
References: <20230315034853.93677-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_204921_572939_D2542F3B 
X-CRM114-Status: GOOD (  12.41  )
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
---
 .../soc/starfive/starfive,jh7110-syscon.yaml  | 51 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
new file mode 100644
index 000000000000..fa4d8522a454
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -0,0 +1,51 @@
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
+          - starfive,jh7110-stg-syscon
+          - starfive,jh7110-sys-syscon
+          - starfive,jh7110-aon-syscon
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
+    syscon@13030000 {
+        compatible = "starfive,jh7110-sys-syscon", "syscon";
+        reg = <0x13030000 0x1000>;
+    };
+
+    syscon@17010000 {
+        compatible = "starfive,jh7110-aon-syscon", "syscon";
+        reg = <0x17010000 0x1000>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 958b7ec118b4..27e6c48a1a83 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19964,6 +19964,11 @@ S:	Supported
 F:	Documentation/devicetree/bindings/rng/starfive*
 F:	drivers/char/hw_random/jh7110-trng.c
 
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
