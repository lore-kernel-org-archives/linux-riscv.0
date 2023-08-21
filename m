Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5195BEE49AE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 14:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJFlL28UY5gnigZpcqV6vQFq+4YY/0QnB4dr0kKYr8A=; b=rTowhCPj9lpYgX
	NaOusqjhTDYrbasynh1eK0Y1Zmn1CfNmdwSWrwyz+is4gr02vz2wrbmtJUUtqP1rZNS83PjZbk64p
	ZN0GozQne4xkSSVbmmKrJluEChfRFY7OAMU2SWxrVjBFgPqttThpKE1faOzfkWjKK13g03qfWscPJ
	dQcMKpb2ZPCuuETUynWENdsVMYnX6wFpd7N1ctmBgAb9q9uB/aqfoEHmmbVUuiSqaB1hAwfUbA5YD
	Vx8SuVPsmVrLIpSa3ktBKmXYHXXbuYg8+rnCfjIEvOiq4rc4CyHjF9Se26Rm97lC4NP7tqR3Eb7dN
	Ac5KGqWkaQb9NoFviWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY67P-00ECdO-0B;
	Mon, 21 Aug 2023 14:42:59 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY67F-00ECS9-2b
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 14:42:52 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7A17224E17F;
	Mon, 21 Aug 2023 22:41:53 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:53 +0800
Received: from localhost.localdomain (113.72.145.205) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:52 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 1/5] ASoC: dt-bindings: snps,designware-i2s: Add StarFive JH7110 SoC support
Date: Mon, 21 Aug 2023 22:41:47 +0800
Message-ID: <20230821144151.207339-2-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_074250_194343_B1275138 
X-CRM114-Status: GOOD (  11.46  )
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
 .../bindings/sound/snps,designware-i2s.yaml   | 108 +++++++++++++++++-
 1 file changed, 105 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml b/Documentation/devicetree/bindings/sound/snps,designware-i2s.yaml
index a970fd264b21..a48d040b0a4f 100644
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
@@ -66,6 +101,73 @@ allOf:
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
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-i2stx0
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          minItems: 5
+          maxItems: 5
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
+          maxItems: 9
+        clock-names:
+          minItems: 9
+          maxItems: 9
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
+          maxItems: 9
+        clock-names:
+          minItems: 9
+          maxItems: 9
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
