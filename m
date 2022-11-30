Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80949C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 05:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3DkNRN/AAC4TKIAiQj9EMwnPpCGPR2KRs5iJsq5E60=; b=nkgj+3fzkgwLkH
	pK9On4YPZwzW7MltIUIsopiQ6ytZk2EPcK6BE7HUe3Spy1yQJW6DEunBGwWgOV5rydgGqf57UdtWP
	dt9YyI4VFuu2qQqiczXfBGGM0LkUKpfFYK+us2Lyl7UjfjnJ9uPt4XSda0PNwoa70qF0xgbVYZugE
	EiPCPYJWLDfF2GRURqZfhQRxdFea/YnwkDxi7eZ2jMEm528wMdJGeGobJL6vEJDkQ3WKz2s6yPQfp
	Mi5aeR064PI3CRw9b0MOl9a3axm4ZPVJTrjklAdpwUx8zA13IFpgCV90ZbfgZPu6avCf+RWjxGNkv
	+DYVyJLVxMTqsAYT3MdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0G2A-00DalU-Bh; Wed, 30 Nov 2022 05:53:26 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0G22-00DaMO-RD
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 05:53:21 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 533A924E1FE;
	Wed, 30 Nov 2022 13:52:42 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Nov
 2022 13:52:42 +0800
Received: from ubuntu.localdomain (202.188.176.82) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Nov
 2022 13:52:38 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Jia Jie Ho
	<jiajie.ho@starfivetech.com>
Subject: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto driver
Date: Wed, 30 Nov 2022 13:52:13 +0800
Message-ID: <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_215319_642592_99D84F71 
X-CRM114-Status: GOOD (  11.95  )
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

Add documentation to describe Starfive crypto
driver bindings.

Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
---
 .../bindings/crypto/starfive-crypto.yaml      | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/starfive-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml b/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
new file mode 100644
index 000000000000..6b852f774c32
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/starfive-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive Crypto Controller Device Tree Bindings
+
+maintainers:
+  - Jia Jie Ho <jiajie.ho@starfivetech.com>
+  - William Qiu <william.qiu@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-crypto
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: secreg
+
+  clocks:
+    items:
+      - description: Hardware reference clock
+      - description: AHB reference clock
+
+  clock-names:
+    items:
+      - const: sec_hclk
+      - const: sec_ahb
+
+  interrupts:
+    items:
+      - description: Interrupt pin for algo completion
+      - description: Interrupt pin for DMA transfer completion
+
+  interrupt-names:
+    items:
+      - const: secirq
+      - const: dmairq
+
+  resets:
+    items:
+      - description: STG domain reset line
+
+  reset-names:
+    items:
+      - const: sec_hre
+
+  enable-side-channel-mitigation:
+    description: Enable side-channel-mitigation feature for AES module.
+        Enabling this feature will affect the speed performance of
+        crypto engine.
+    type: boolean
+
+  enable-dma:
+    description: Enable data transfer using dedicated DMA controller.
+    type: boolean
+
+  dmas:
+    items:
+      - description: TX DMA channel
+      - description: RX DMA channel
+
+  dma-names:
+    items:
+      - const: sec_m
+      - const: sec_p
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive-jh7110.h>
+    #include <dt-bindings/reset/starfive-jh7110.h>
+
+    soc {
+            #address-cells = <2>;
+            #size-cells = <2>;
+
+            crypto: crypto@16000000 {
+                    compatible = "starfive,jh7110-crypto";
+                    reg = <0x0 0x16000000 0x0 0x4000>;
+                    reg-names = "secreg";
+                    clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
+                    <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
+                    interrupts = <28>, <29>;
+                    interrupt-names = "secirq", "dmairq";
+                    clock-names = "sec_hclk","sec_ahb";
+                    resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
+                    reset-names = "sec_hre";
+                    enable-side-channel-mitigation;
+                    enable-dma;
+                    dmas = <&sec_dma 1 2>,
+                           <&sec_dma 0 2>;
+                    dma-names = "sec_m","sec_p";
+            };
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
