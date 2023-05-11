Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904BCC7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OTHh0eH0G5GJhcQyDpmTttUylE4+9g57OaxqFV0h2k=; b=JIeNeWNG03RnWM
	FR2j6soAtKdRQ7tphmbIdTZWnHwIDU1ZbThUszsNYDF7wTWeoaFR8kfa3SCx45VhbemrZDKzy5YQO
	pbrAkwy5jQdFxV8d1poVfLEK78TXjHqAuzta3LF8vElK9i6tpF84Q81EnRO2ZUKPnhGiUfUijKegq
	IHYgXCO422QhmsAMNNrjbomFCDQ24cWageXsUXMEuUQeGZps8QPV3EMEXcLFBrpksvG/0+FM9stTn
	oGVjJncOOSnlNJ58GApCv7Vu1ulBl/1PDmoKOOTwebaS2nhH9xMpZg3vPpk4O6uQsQJd2X/JZ5psh
	CY9fvlplIFlIcTNx+QGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2PQ-008Jqh-1P;
	Thu, 11 May 2023 09:16:24 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px2PM-008Jni-1q
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 09:16:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A6B6482EB;
	Thu, 11 May 2023 17:15:51 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 11 May
 2023 17:15:51 +0800
Received: from SD-Server.starfivetech.com (113.72.146.187) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 11 May 2023 17:15:50 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 1/3] ASoC: dt-bindings: Add TDM controller bindings for StarFive JH7110
Date: Thu, 11 May 2023 17:15:47 +0800
Message-ID: <20230511091549.28003-2-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230511091549.28003-1-walker.chen@starfivetech.com>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_021620_931690_1073B999 
X-CRM114-Status: GOOD (  13.36  )
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

Add bindings for TDM driver which supports multi-channel audio playback
and capture on JH7110 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
