Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F226FC00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7xhNqfCEzf5VkyJVQIElZVI3cfOHuRCPvNizfkmDOs=; b=vLgxUYuiLxY3mA
	qd9wtFJBqIbHS56/CZmXTTpxcFN+k7WQhERFnOvFxvwPD6PNO2VB1nAIo7SirShEUnTI1sbwuNfKO
	dfi4R1PRBw/Xkxpd4L5a2P41jpsdQc32SsA9OeeeqsnJ8iSN7bRXzqHsnQSJ3moiN540VdDGjWWw+
	00YGv3FwbIJuCYYJ3Oi7+uvyzWqn0hTAu3QbOEkRhq2Io9Ly8ZF/j/q5kMVhNTn6zmS968Req5odQ
	Yz70BbZkO5d26X7+X32aVhQN8afqLuSUq5h7YEHwZfQ3kma804NOyQe89qBtBSLYIiDRkM9PhD72/
	Zl/7xM0TC/oEYJCv3xJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7SQ-004OQ3-0j;
	Wed, 02 Aug 2023 08:43:50 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7SM-004OIl-2U
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:43:48 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A3F7582CA;
	Wed,  2 Aug 2023 16:43:04 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 16:43:04 +0800
Received: from localhost.localdomain (183.27.98.54) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 16:43:03 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Maxim
 Kochetkov" <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add StarFive JH7110 SoC support
Date: Wed, 2 Aug 2023 16:42:58 +0800
Message-ID: <20230802084301.134122-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_014347_155436_89ADC80E 
X-CRM114-Status: GOOD (  11.07  )
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

Add the StarFive JH7110 (TX0/TX1/RX channel) SoC support in the bindings
of Designware I2S controller. The I2S controller needs two reset items
to work properly on the JH7110 SoC. And TX0 channel as master mode needs
5 clock items and TX1/RX channels as slave mode need 9 clock items on
the JH7110 SoC. The RX channel needs System Register Controller property
to enable it and other platforms do not need it.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../bindings/sound/snps,designware-i2s.yaml   | 101 +++++++++++++++++-
 1 file changed, 98 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
index a970fd264b21..a5ab7f3e49b2 100644
--- a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
@@ -17,6 +17,9 @@ properties:
           - const: snps,designware-i2s
       - enum:
           - snps,designware-i2s
+          - starfive,jh7110-i2stx0
+          - starfive,jh7110-i2stx1
+          - starfive,jh7110-i2srx
 
   reg:
     maxItems: 1
@@ -29,15 +32,36 @@ properties:
     maxItems: 1
 
   clocks:
-    description: Sampling rate reference clock
-    maxItems: 1
+    items:
+      - description: Sampling rate reference clock
+      - description: APB clock
+      - description: Audio master clock
+      - description: Inner audio master clock source
+      - description: External audio master clock source
+      - description: Bit clock
+      - description: Left/right channel clock
+      - description: External bit clock
+      - description: External left/right channel clock
+    minItems: 1
 
   clock-names:
-    const: i2sclk
+    items:
+      - const: i2sclk
+      - const: apb
+      - const: mclk
+      - const: mclk_inner
+      - const: mclk_ext
+      - const: bclk
+      - const: lrck
+      - const: bclk_ext
+      - const: lrck_ext
+    minItems: 1
 
   resets:
     items:
       - description: Optional controller resets
+      - description: controller reset of Sampling rate
+    minItems: 1
 
   dmas:
     items:
@@ -51,6 +75,17 @@ properties:
       - const: rx
     minItems: 1
 
+  starfive,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller sys_syscon node.
+          - description: I2S-rx enabled control offset of SYS_SYSCONSAIF__SYSCFG register.
+          - description: I2S-rx enabled control mask
+    description:
+      The phandle to System Register Controller syscon node and the I2S-rx(ADC)
+      enabled control offset and mask of SYS_SYSCONSAIF__SYSCFG register.
+
 allOf:
   - $ref: dai-common.yaml#
   - if:
@@ -66,6 +101,66 @@ allOf:
       properties:
         "#sound-dai-cells":
           const: 0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: snps,designware-i2s
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+        resets:
+          maxItems: 1
+    else:
+      properties:
+        resets:
+          minItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-i2stx0
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+      required:
+        - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-i2stx1
+    then:
+      properties:
+        clocks:
+          minItems: 9
+        clock-names:
+          minItems: 9
+      required:
+        - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-i2srx
+    then:
+      properties:
+        clocks:
+          minItems: 9
+        clock-names:
+          minItems: 9
+      required:
+        - resets
+        - starfive,syscon
+    else:
+      properties:
+        starfive,syscon: false
 
 required:
   - compatible
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
