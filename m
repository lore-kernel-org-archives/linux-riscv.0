Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738D3C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 22:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68amc+uEV84NhVO5LZBK6DhaZ8KNKhl1AGcNtDC1UXQ=; b=qfhV/MPBGoVOQC
	KMcb2djOFTtA+jrDzIm5ivyP2+1+u7Er25q+k/YhtcUJK6W+yu7kL6gORr87+S+cWGXt3NUQYegwf
	SwjCkt4gHxlUGh/Tu3Qg81Z2Xqi9fyIZBGwYLPR09F0597F8a+16zpxf0nuNT7HBSXffRwwHSa/Iq
	r/lBrLTPQ82pe2PRwhLr0hyOpYPJajxsJrbmWn6vEnGBqCR2/iZ9iOqUViRf2y9zf5p6VyMy8mhhJ
	TZcdwmrIimd2eIzVmLvO3DEFaPBuvkr1Mmow/pA9u67U1jfHWVTk+TUAPTYbEmh2IqB2wtQgDSiUh
	eTY7JyxbwdgQ02Xw5TKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe207-005guQ-0Q; Thu, 29 Sep 2022 22:27:27 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe202-005gsa-Ry
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 22:27:25 +0000
X-QQ-mid: bizesmtp88t1664490413t16ssqjp
Received: from localhost.localdomain ( [113.72.146.201])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 06:26:52 +0800 (CST)
X-QQ-SSF: 01000000002000305000B00A0000000
X-QQ-FEAT: YHTLUubWl26ZkpaLq7zsbw4d8O56YD7LwT0wcBWFjGJFdn4RvGt4in89BcWGS
	U6clL3z7tkZIWNwlFhVpyr0KfLiD+6L4Z0fsnaOfFw/ykvRIRzdXo9a4m3v4nLGj8OJ+6ro
	wYOvz1LQ7AuWSC/crvH5NIKCF1oDmolC74QTQNe7YX2te+tAYPeHVxX0X6boWdm+YILDCy5
	EGNDuwpkZufDYaJs308Z7yglt9m7hA1eOjXvVK4FqZBTPpaQbNJT9c1oSCt8c+h6GCZyVrs
	TC0oRjlfZonYAs86W/lahhg+ftUX496LzCyngeyGzZAyomv583Kz7NO4o/43WjLEUz53IWj
	W2nzW0C27gumiS9wusps+Y5af8OuauMG/u9rWp6ZGlkcSJoaLzFc94tbXu0W93b73GIXw4G
	n9xRBLJPbl/z4Lah4K4BeQ==
X-QQ-GoodBg: 0
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
Subject: [PATCH v1 17/30] dt-bindings: clock: Add starfive,jh7110-clkgen-sys bindings
Date: Fri, 30 Sep 2022 06:26:47 +0800
Message-Id: <20220929222647.23816-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_152723_249707_693F5DA7 
X-CRM114-Status: GOOD (  10.71  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add bindings for the system clock generator on the JH7110
RISC-V SoC by StarFive Technology Ltd.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 .../clock/starfive,jh7110-clkgen-sys.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-sys.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-sys.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-sys.yaml
new file mode 100644
index 000000000000..290b730145ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-sys.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-clkgen-sys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 System Clock Generator
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+  - Xingyu Wu <xingyu.wu@linux.starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-clkgen-sys
+
+  clocks:
+    items:
+      - description: Main Oscillator (24 MHz)
+      - description: RMII reference clock
+      - description: RGMII RX clock
+      - description: I2S TX bit clock
+      - description: I2S TX left/right clock
+      - description: I2S RX bit clock
+      - description: I2S RX left/right clock
+      - description: TDM
+      - description: mclk
+
+  clock-names:
+    items:
+      - const: osc
+      - const: gmac1_rmii_refin
+      - const: gmac1_rgmii_rxin
+      - const: i2stx_bclk_ext
+      - const: i2stx_lrck_ext
+      - const: i2srx_bclk_ext
+      - const: i2srx_lrck_ext
+      - const: tdm_ext
+      - const: mclk_ext
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive-jh7110-sys.h> for valid indices.
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    syscrg_clk: clock-controller@13020000 {
+        compatible = "starfive,jh7110-clkgen-sys";
+        clocks = <&osc>, <&gmac1_rmii_refin>,
+                 <&gmac1_rgmii_rxin>,
+                 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
+                 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
+                 <&tdm_ext>, <&mclk_ext>;
+        clock-names = "osc", "gmac1_rmii_refin",
+                      "gmac1_rgmii_rxin",
+                      "i2stx_bclk_ext", "i2stx_lrck_ext",
+                      "i2srx_bclk_ext", "i2srx_lrck_ext",
+                      "tdm_ext", "mclk_ext";
+        #clock-cells = <1>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
