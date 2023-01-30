Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0976C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbuP8VUDPfQXnW0Ax3Krh+tPnDbuM5bWfYcDoZoahmI=; b=RYODQwWmwXvz3l
	AE4OfCVqFa1vd3tgfg9t10WPrJASy7LMsBaFi6TJXw0vhIRZvyDDabMTUPm+b9wWtq0mnR7ZjVk/x
	/Zhd47YGSHyoBgNJiPZ5eJRysmdWYg8bGS4Hz+1Ld+53kTKyHJ+vbtVfHnld3wxuRA59+4H4TEmtk
	h10is+QS4l/nBa3rkSo/rnCYIprdV0zze+5kXa4qsLtFjtiTRlcFCBmIgj+6gM8HuFTaH7Ta013VQ
	9Tt1PNAmpt7yH3FoGSuKFXRsKdh0TwV8UKDncmIP0HuocDBtnLvCe44CUamUDY18GGCBW2kXfs1sD
	DrO4wVIC8FMXo+C/ntNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWLx-0045dD-0F; Mon, 30 Jan 2023 15:45:53 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWLa-0045Vp-Qu
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 15:45:32 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E64E524E154;
	Mon, 30 Jan 2023 23:45:01 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 23:45:01 +0800
Received: from ubuntu.localdomain (202.190.105.77) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 23:44:35 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 1/4] dt-bindings: crypto: Add StarFive crypto module
Date: Mon, 30 Jan 2023 23:42:39 +0800
Message-ID: <20230130154242.112613-2-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.190.105.77]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_074531_069593_77223424 
X-CRM114-Status: GOOD (  10.53  )
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

Add documentation to describe StarFive cryptographic engine.

Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
---
 .../crypto/starfive,jh7110-crypto.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml

diff --git a/Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml b/Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml
new file mode 100644
index 000000000000..71a2876bd6e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/starfive,jh7110-crypto.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive Cryptographic Module
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
+  clocks:
+    items:
+      - description: Hardware reference clock
+      - description: AHB reference clock
+
+  clock-names:
+    items:
+      - const: hclk
+      - const: ahb
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: TX DMA channel
+      - description: RX DMA channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto: crypto@16000000 {
+        compatible = "starfive,jh7110-crypto";
+        reg = <0x16000000 0x4000>;
+        clocks = <&clk 15>, <&clk 16>;
+        clock-names = "hclk", "ahb";
+        interrupts = <28>;
+        resets = <&reset 3>;
+        dmas = <&dma 1 2>,
+               <&dma 0 2>;
+        dma-names = "tx", "rx";
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
