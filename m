Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833E1C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 05:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUv/ZD2/yZWB5CfCSbwsPKHkFHwGPKoa4GhVMbwmrQM=; b=QFFNCdr7Fdlyfc
	3ynQOtE85RXSGtVMDzTAIc8edRiXJMtXOi9D2U2vnUqTIfGdoRf9o8OE0M2FflrgJgr/TSBD1biG6
	77Sixg0o/Ae9PXimKgPx+wOpFlSF6Vv9ynd1MDz0xHgmm9OLCdKEtBThYHInO3UtMxU5jpEX68IKb
	jng4tgfm0z+GbfEW4VUSp3DGsHOgO+E4vkGJMoAtqoKz6Fnf1mMbaYGAKbT4hwY1Seqwz7zxT26+g
	TPyZv0cnO3mbUD9GPGquFuZ0yupqOHep/cyAFQ+Sg5OJx3Rbue3mBm9dE8Snx3NbziOxMDruyzN2x
	QzGrPYXAikZb3Qri9C+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKA3-00CTDp-0K;
	Wed, 15 Mar 2023 05:58:55 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcK9x-00CT8k-0R
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 05:58:53 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B3FE924E31D;
	Wed, 15 Mar 2023 13:58:15 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 13:58:15 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 15 Mar 2023 13:58:14 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [RESEND v6 1/2] dt-bindings: soc: starfive: Add StarFive syscon doc
Date: Wed, 15 Mar 2023 13:58:12 +0800
Message-ID: <20230315055813.94740-2-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315055813.94740-1-william.qiu@starfivetech.com>
References: <20230315055813.94740-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_225849_341682_65522F77 
X-CRM114-Status: GOOD (  12.29  )
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
 .../soc/starfive/starfive,jh7110-syscon.yaml  | 41 +++++++++++++++++++
 MAINTAINERS                                   |  5 +++
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
new file mode 100644
index 000000000000..ae7f1d6916af
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
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
index 958b7ec118b4..fdad60cc9f2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19964,6 +19964,11 @@ S:	Supported
 F:	Documentation/devicetree/bindings/rng/starfive*
 F:	drivers/char/hw_random/jh7110-trng.c

+STARFIVE JH7110 SYSCON
+M:	William Qiu <william.qiu@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
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
