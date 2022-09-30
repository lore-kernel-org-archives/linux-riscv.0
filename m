Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10CDC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 05:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hb3f9GKIKbh8mEbWEeokSBba2WhRZcOPvzQrn13RksA=; b=NKjkLFT+U13rQN
	7z6GzjOChIBt2EV0IA78a/yqg4BfLP8ysCrkUHjMewFbv5wDU3pRrJsq0xz362zgw6xu+csOUs7l0
	3k4vJpKNLGXbvVI0ytLiaXxOTqX1LePprWFocvFoowpPdNjvayvdZArENlKoo7MWRKPoe6v13E8kT
	B+KruPpSXTONLlKzL76o0/pK2dPnAHlC0rp2T+FuLJ/cQefExqNeGT6VpYNZydogSfuodlN1FuHj+
	hqGSF10lwGqVIHfZr5f0j6FFfZm01ThD4B61P6dHDY7xEwZxaOVC4fF2QeR4J3ettNXSu2xLqzCt6
	t055hzfjAMfZj/YdED4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe91D-007PXF-EU; Fri, 30 Sep 2022 05:57:03 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe919-007PUN-MG
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 05:57:01 +0000
X-QQ-mid: bizesmtp89t1664517395tl46psyh
Received: from ubuntu.localdomain ( [113.72.146.201])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 13:56:33 +0800 (CST)
X-QQ-SSF: 01000000000000305000000A0000000
X-QQ-FEAT: bQsUcYFpAAbYh5IE5ZQJa21f+7RzMKXkTWoGjOTn9RYsMgEYDgMtGTVoiYE0X
	950t0angog4i0EbjIImNUPmJSYyEjYeqTDfjglx1tBLSGnLqME7PIvImRR9KhNW961IXGUT
	A6wJDFItRdELl+XBJQbrMy09GJf+hc45Hbb+kvLJuSuoTaElzuojk8hhGzO/ssgHQexgBM9
	SXcvfyvAYFMiiUP0CeRJIMwXonhn1a1U6F4r+79b7YHnIAu1XO2/Xl/8z7t9OqtJUtDdqTH
	y8iVVk+Qokja6Vojt3dqGGaHKYr1LPgIXQBYFyt4eYivjul2LpLK5In5s1OxsD+cI+Bgb4R
	FZ3yRuVJyFRhfYvDIyIgsoLX78xR5chr11v7/YuBjfPa4XSkOfFZgAFMSNYemIc/NZaCFML
	/t8NBeRSD5WLFEhW1CYz1w==
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
Subject: [PATCH v1 20/30] dt-bindings: clock: Add starfive,jh7110-clkgen-aon bindings
Date: Fri, 30 Sep 2022 13:56:32 +0800
Message-Id: <20220930055632.5136-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_225700_045963_FD30F25F 
X-CRM114-Status: GOOD (  10.84  )
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

Add bindings for the always-on clock generator on the JH7110
RISC-V SoC by StarFive Technology Ltd.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 .../clock/starfive,jh7110-clkgen-aon.yaml     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml
new file mode 100644
index 000000000000..029ff57b9e3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-clkgen-aon.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7110-clkgen-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Always-On Clock Generator
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+  - Xingyu Wu <xingyu.wu@linux.starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-clkgen-aon
+
+  clocks:
+    items:
+      - description: Main Oscillator
+      - description: RTC clock
+      - description: RMII reference clock
+      - description: RGMII RX clock
+      - description: STG AXI/AHB clock
+      - description: APB Bus clock
+
+  clock-names:
+    items:
+      - const: osc
+      - const: clk_rtc
+      - const: gmac0_rmii_refin
+      - const: gmac0_rgmii_rxin
+      - const: stg_axiahb
+      - const: apb_bus_func
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive-jh7110-aon.h> for valid indices.
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
+    #include <dt-bindings/clock/starfive-jh7110-sys.h>
+
+    aoncrg: clock-controller@17000000 {
+        compatible = "starfive,jh7110-aoncrg";
+        clocks = <&osc>, <&clk_rtc>,
+                 <&gmac0_rmii_refin>, <&gmac0_rgmii_rxin>,
+                 <&syscrg JH7110_SYSCLK_STG_AXIAHB>,
+                 <&syscrg JH7110_SYSCLK_APB_BUS_FUNC>;
+        clock-names = "osc", "clk_rtc",
+                      "gmac0_rmii_refin", "gmac0_rgmii_rxin",
+                      "stg_axiahb", "apb_bus_func";
+        #clock-cells = <1>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
