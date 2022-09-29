Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627A0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 16:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmmxgRzoz+4fr2xNv0QdJx9fOjd+ep1JPY/uZnSaA6o=; b=Kb89GBGh0/V5cQ
	uEnTZqFSkMmbiIU5OyjvUhFO1rzv5MwZNASIixauitjSRXlgBueRwNfXDFIgmUFaZahggiH3ZlrSW
	nQFNitX8QXcKG/pCXa5qSaFq6+2vnRTjeSzB8Lrh7WQRq1FWivRoTNm4vNg9O3TrICQDqwC4c1ieP
	uy/lwwKr9BvqMc+88IISJJ2xml/K1PXKW1ve3Maw5MfGznPxleLjxezcRtTbHYXzfNCkdbJYIF3+j
	g58rmf0mpxD9iy7eWDIRf/BIac2SAQ/+1gGTtxk/Yr1aSyJM1PaGBE3dDOjaLzWZZpiGqgdVpAkqi
	DZbclUPmBJCIAgBlrb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw5n-0042aH-R9; Thu, 29 Sep 2022 16:08:55 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw5k-0042YM-6W
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 16:08:55 +0000
X-QQ-Spam: true
X-QQ-mid: bizesmtp84t1664461985thalxdxc
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Sep 2022 22:33:04 +0800 (CST)
X-QQ-SSF: 01000000002000201000B00A0000000
From: Hal Feng <hal.feng@linux.starfivetech.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/30] reset: starfive: jh7100: Move necessary properties to device tree
Date: Thu, 29 Sep 2022 22:32:04 +0800
Message-Id: <20220929143225.17907-10-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_090852_585093_FBFDE807 
X-CRM114-Status: GOOD (  15.80  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Store the necessary properties in device tree instead of .c file,
in order to apply this reset driver to other StarFive SoCs.

Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 .../bindings/reset/starfive,jh7100-reset.yaml | 20 ++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  3 ++
 drivers/reset/reset-starfive-jh7100.c         | 50 +++++++++++++------
 3 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
index 300359a5e14b..3eff3f72a1ed 100644
--- a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
@@ -20,19 +20,39 @@ properties:
   "#reset-cells":
     const: 1
 
+  starfive,assert-offset:
+    description: Offset of the first ASSERT register
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  starfive,status-offset:
+    description: Offset of the first STATUS register
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  starfive,nr-resets:
+    description: Number of reset signals
+    $ref: /schemas/types.yaml#/definitions/uint32
+
 required:
   - compatible
   - reg
   - "#reset-cells"
+  - starfive,assert-offset
+  - starfive,status-offset
+  - starfive,nr-resets
 
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/reset/starfive-jh7100.h>
+
     reset-controller@11840000 {
         compatible = "starfive,jh7100-reset";
         reg = <0x11840000 0x10000>;
         #reset-cells = <1>;
+        starfive,assert-offset = <0x0>;
+        starfive,status-offset= <0x10>;
+        starfive,nr-resets = <JH7100_RSTN_END>;
     };
 
 ...
diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 000447482aca..904a93411add 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -145,6 +145,9 @@
 			compatible = "starfive,jh7100-reset";
 			reg = <0x0 0x11840000 0x0 0x10000>;
 			#reset-cells = <1>;
+			starfive,assert-offset = <0x0>;
+			starfive,status-offset= <0x10>;
+			starfive,nr-resets = <JH7100_RSTN_END>;
 		};
 
 		i2c0: i2c@118b0000 {
diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
index 8cba62348a16..d3656e99ae0e 100644
--- a/drivers/reset/reset-starfive-jh7100.c
+++ b/drivers/reset/reset-starfive-jh7100.c
@@ -14,16 +14,6 @@
 
 #include <dt-bindings/reset/starfive-jh7100.h>
 
-/* register offsets */
-#define JH7100_RESET_ASSERT0	0x00
-#define JH7100_RESET_ASSERT1	0x04
-#define JH7100_RESET_ASSERT2	0x08
-#define JH7100_RESET_ASSERT3	0x0c
-#define JH7100_RESET_STATUS0	0x10
-#define JH7100_RESET_STATUS1	0x14
-#define JH7100_RESET_STATUS2	0x18
-#define JH7100_RESET_STATUS3	0x1c
-
 /*
  * Writing a 1 to the n'th bit of the m'th ASSERT register asserts
  * line 32m + n, and writing a 0 deasserts the same line.
@@ -49,6 +39,10 @@ static const u32 jh7100_reset_asserted[4] = {
 struct jh7100_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
+	u32 assert_offset;
+	u32 status_offset;
+	u32 nr_resets;
+	const u32 *asserted;
 };
 
 static inline struct jh7100_reset *
@@ -63,9 +57,9 @@ static int jh7100_reset_update(struct reset_controller_dev *rcdev,
 	struct jh7100_reset *data = jh7100_reset_from(rcdev);
 	u32 offset = id / 32;
 	u32 mask = BIT(id % 32);
-	u32 reg_assert = JH7100_RESET_ASSERT0 + offset * sizeof(u32);
-	u32 reg_status = JH7100_RESET_STATUS0 + offset * sizeof(u32);
-	u32 done = jh7100_reset_asserted[offset] & mask;
+	u32 reg_assert = data->assert_offset + offset * sizeof(u32);
+	u32 reg_status = data->status_offset + offset * sizeof(u32);
+	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
 	u32 value;
 	int ret;
 
@@ -122,7 +116,7 @@ static int jh7100_reset_status(struct reset_controller_dev *rcdev,
 	struct jh7100_reset *data = jh7100_reset_from(rcdev);
 	u32 offset = id / 32;
 	u32 mask = BIT(id % 32);
-	u32 reg_status = JH7100_RESET_STATUS0 + offset * sizeof(u32);
+	u32 reg_status = data->status_offset + offset * sizeof(u32);
 	u32 value;
 	int ret;
 
@@ -130,7 +124,7 @@ static int jh7100_reset_status(struct reset_controller_dev *rcdev,
 	if (ret)
 		return ret;
 
-	return !((value ^ jh7100_reset_asserted[offset]) & mask);
+	return !((value ^ data->asserted[offset]) & mask);
 }
 
 static const struct reset_control_ops jh7100_reset_ops = {
@@ -143,6 +137,7 @@ static const struct reset_control_ops jh7100_reset_ops = {
 static int __init jh7100_reset_probe(struct platform_device *pdev)
 {
 	struct jh7100_reset *data;
+	int ret;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -155,12 +150,35 @@ static int __init jh7100_reset_probe(struct platform_device *pdev)
 		return PTR_ERR(data->regmap);
 	}
 
+	ret = of_property_read_u32(pdev->dev.of_node, "starfive,assert-offset",
+				   &data->assert_offset);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to get starfive,assert-offset: %d\n", ret);
+		return ret;
+	}
+
+	ret = of_property_read_u32(pdev->dev.of_node, "starfive,status-offset",
+				   &data->status_offset);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to get starfive,status-offset: %d\n", ret);
+		return ret;
+	}
+
+	ret = of_property_read_u32(pdev->dev.of_node, "starfive,nr-resets",
+				   &data->nr_resets);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to get starfive,nr-resets: %d\n", ret);
+		return ret;
+	}
+
 	data->rcdev.ops = &jh7100_reset_ops;
 	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = JH7100_RSTN_END;
+	data->rcdev.nr_resets = data->nr_resets;
 	data->rcdev.dev = &pdev->dev;
 	data->rcdev.of_node = pdev->dev.of_node;
 
+	data->asserted = jh7100_reset_asserted;
+
 	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
