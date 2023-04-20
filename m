Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1293EC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 02:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niUvZVU6lwS/kMTJWGybIOD+0sMQNgXPuLd2ZVvVWRs=; b=Nc/XqRwhSe70BM
	VbsRVX7nBL8Y2BR2olk5UrMWcWYrSGy/bqLVkCEQgkZKflHS374N5FNc40A+/RXnKoo+gMhPPnfJP
	ugedxxAf9kyZfti0yRPiloBSrFbhT6TNuT+K5k5rQMYpnDC1KYulZImVrr4GdAChWLp+n9YYDSuW8
	7I/tPKjuzRGvHdQNU1MEOjfSiPuxqWEsTVHaSXoxarQxYWPy+odair7EQ+c7X/N5gWue6oMOttveQ
	+WsC/X+OBIkbzg4FoULgDr7jFMgQ/f4NAmHrAkuO1w0sD/dPQhz3wQpL+gdZ/Zyp1Ex7p03OT5rfg
	ZGAx0tcF6gY7AyI7HfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppKFH-006tye-2v;
	Thu, 20 Apr 2023 02:42:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppKFD-006tvu-0N
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 02:42:02 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 517AD24DB83;
	Thu, 20 Apr 2023 10:41:20 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 10:41:20 +0800
Received: from SD-Server.starfivetech.com (113.72.144.253) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 20 Apr 2023 10:41:19 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Walker Chen <walker.chen@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 1/4] dt-bindings: sound: Add TDM for StarFive JH7110
Date: Thu, 20 Apr 2023 10:41:15 +0800
Message-ID: <20230420024118.22677-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230420024118.22677-1-walker.chen@starfivetech.com>
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_194159_454444_3E7E0922 
X-CRM114-Status: GOOD (  13.76  )
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

Add bindings to describe the TDM driver for the StarFive JH7110 SoC.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 .../bindings/sound/starfive,jh7110-tdm.yaml   | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
new file mode 100644
index 000000000000..abb373fbfa26
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/starfive,jh7110-tdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 TDM Controller
+
+description: |
+  The TDM Controller is a Time Division Multiplexed audio interface
+  integrated in StarFive JH7110 SoC, allowing up to 8 channels of
+  audio over a serial interface. The TDM controller can operate both
+  in master and slave mode.
+
+maintainers:
+  - Walker Chen <walker.chen@starfivetech.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7110-tdm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: TDM AHB Clock
+      - description: TDM APB Clock
+      - description: TDM Internal Clock
+      - description: TDM Clock
+      - description: Inner MCLK
+      - description: TDM External Clock
+
+  clock-names:
+    items:
+      - const: tdm_ahb
+      - const: tdm_apb
+      - const: tdm_internal
+      - const: tdm
+      - const: mclk_inner
+      - const: tdm_ext
+
+  resets:
+    items:
+      - description: tdm ahb reset line
+      - description: tdm apb reset line
+      - description: tdm core reset line
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    tdm@10090000 {
+        compatible = "starfive,jh7110-tdm";
+        reg = <0x10090000 0x1000>;
+        clocks = <&syscrg 184>,
+                 <&syscrg 185>,
+                 <&syscrg 186>,
+                 <&syscrg 187>,
+                 <&syscrg 17>,
+                 <&tdm_ext>;
+        clock-names = "tdm_ahb", "tdm_apb",
+                      "tdm_internal", "tdm",
+                      "mclk_inner", "tdm_ext";
+        resets = <&syscrg 105>,
+                 <&syscrg 107>,
+                 <&syscrg 106>;
+        dmas = <&dma 20>, <&dma 21>;
+        dma-names = "rx","tx";
+        #sound-dai-cells = <0>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
