Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43658CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XU0AWng5WAkJw5QXaAF0SXj6l6cPtVtU/01V7qj2l1Y=; b=lFUqs9NhMbiuxU
	3z9UR8vDR75IPidjcMZx/fQLsQpF7VC0ujdVfgoU9P66HAahGCHHAHJp/bhz8D6jX4QUwCmcE4RMh
	PyHNx8Oo5IndYOBAXj2oaV7XpGtyaACYdX20K/QGOl7TLHt8jeS926BgmjqVKMD7mlN+UJTkRpo3W
	7Peap/lxTDvtzqPow2jtn93XZmZ6ry5+Opd68vtlmjx4ssYibdq/+lry32tNlNyep4lNAPAYHZAQq
	5furX2tTU9Vw0SC8/v/EMIO9tM3vVtOTheB6sqPj7i2r94d1iifjPqmjlVXpFCFMSRM28ZjxPiGyt
	CZvPVJCcYKg9MSyWxhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umu0j-00000002VTT-10rz;
	Fri, 15 Aug 2025 12:58:21 +0000
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net ([209.97.182.222])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqs2-0000000251D-1m2J
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 09:37:12 +0000
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgAXOxG5_55o1Ay_AA--.2269S2;
	Fri, 15 Aug 2025 17:36:59 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v4 1/3] clock: eswin: Documentation for eic7700 SoC
Date: Fri, 15 Aug 2025 17:36:53 +0800
Message-Id: <20250815093653.1033-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250815093539.975-1-dongxuyang@eswincomputing.com>
References: <20250815093539.975-1-dongxuyang@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgAXOxG5_55o1Ay_AA--.2269S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw45Kry3ur17tF18Xw1fZwb_yoWfJF4kp3
	ZxCw1DJry8ZF1I9w45ta18WFn3GaykAr4jkr17Xa45KFy5WFWjqF4akF98Za47Cwn7Z3Zr
	Xay7Z3y7A3WIvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRmZXOUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_023710_718986_1BB5D252 
X-CRM114-Status: GOOD (  10.33  )
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

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add device tree binding documentation for the ESWIN eic7700
clock controller module.

Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 .../bindings/clock/eswin,eic7700-clock.yaml   | 381 ++++++++++++++++++
 1 file changed, 381 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml b/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
new file mode 100644
index 000000000000..45e70ebc08e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
@@ -0,0 +1,381 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/eswin,eic7700-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Eswin EIC7700 SoC clock controller
+
+maintainers:
+  - Yifeng Huang <huangyifeng@eswincomputing.com>
+  - Xuyang Dong <dongxuyang@eswincomputing.com>
+
+description:
+  The clock controller generates and supplies clock to all the modules
+  for eic7700 SoC.
+
+properties:
+  compatible:
+    const: eswin,eic7700-clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#address-cells'
+  - '#size-cells'
+
+patternProperties:
+  "^fixed-rate.*":
+    type: object
+    $ref: /schemas/clock/fixed-clock.yaml#
+
+  ".*pll@[a-f0-9]+$":
+    type: object
+
+    properties:
+      compatible:
+        const: eswin,pll-clock
+
+      reg:
+        items:
+          - description: PLL's config 0 register
+          - description: PLL's config 1 register
+          - description: PLL's config 2 register
+          - description: PLL's status register
+
+      '#clock-cells':
+        const: 0
+
+      clock-output-names:
+        maxItems: 1
+
+      enable-shift:
+        description: Bit shift of the enable register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      enable-width:
+        description: Width of the enable register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      refdiv-shift:
+        description: Bit shift of the reference divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      refdiv-width:
+        description: Width of the reference divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      fbdiv-shift:
+        description: Bit shift of the feedback divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      fbdiv-width:
+        description: Width of the feedback divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      frac-shift:
+        description: Bit shift of the fractional divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      frac-width:
+        description: Width of the fractional divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      postdiv1-shift:
+        description: Bit shift of the post divider 1 register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      postdiv1-width:
+        description: Width of the post divider 1 register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      postdiv2-shift:
+        description: Bit shift of the post divider 2 register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      postdiv2-width:
+        description: Width of the post divider 2 register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 31
+
+      lock-shift:
+        description: Bit shift of the lock register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      lock-width:
+        description: Width of the lock register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+    required:
+      - compatible
+      - reg
+      - '#clock-cells'
+      - clock-output-names
+      - enable-shift
+      - enable-width
+      - refdiv-shift
+      - refdiv-width
+      - fbdiv-shift
+      - fbdiv-width
+      - frac-shift
+      - frac-width
+      - postdiv1-shift
+      - postdiv1-width
+      - postdiv2-shift
+      - postdiv2-width
+      - lock-shift
+      - lock-width
+
+    additionalProperties: false
+
+  ".*mux@[a-f0-9]+$":
+    type: object
+
+    properties:
+      compatible:
+        const: eswin,mux-clock
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        minItems: 2
+        maxItems: 3
+
+      '#clock-cells':
+        const: 0
+
+      clock-output-names:
+        maxItems: 1
+
+      shift:
+        description: Bit shift of the select register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      width:
+        description: Width of the select register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - '#clock-cells'
+      - clock-output-names
+      - shift
+      - width
+
+    additionalProperties: false
+
+  "^fixed-factor.*":
+    type: object
+    $ref: /schemas/clock/fixed-factor-clock.yaml#
+
+  ".*div@[a-f0-9]+$":
+    type: object
+
+    properties:
+      compatible:
+        const: eswin,divider-clock
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      '#clock-cells':
+        const: 0
+
+      clock-output-names:
+        maxItems: 1
+
+      shift:
+        description: Bit shift of the divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      width:
+        description: Width of the divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+      div-flags:
+        description: Flags of the divider register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - '#clock-cells'
+      - clock-output-names
+      - shift
+      - width
+      - div-flags
+
+    additionalProperties: false
+
+  ".*gate@[a-f0-9]+$":
+    type: object
+
+    properties:
+      compatible:
+        const: eswin,gate-clock
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+      '#clock-cells':
+        const: 0
+
+      clock-output-names:
+        maxItems: 1
+
+      bit-index:
+        description: Bit shift of the gate enable register.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 31
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - '#clock-cells'
+      - clock-output-names
+      - bit-index
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@51828000 {
+        compatible = "eswin,eic7700-clock";
+        reg = <0x51828000 0x80000>;
+        #clock-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        fixed_rate_clk_xtal_24m: fixed-rate-clk-xtal-24m {
+          compatible = "fixed-clock";
+          #clock-cells = <0>;
+          clock-frequency = <24000000>;
+          clock-output-names = "fixed_rate_clk_xtal_24m";
+        };
+
+        clk_pll_cpu: clk-cpu-pll@64 {
+          compatible = "eswin,pll-clock";
+          reg = <0x64>, <0x68>, <0x6c>, <0xa4>;
+          #clock-cells = <0>;
+          enable-shift = <0>;
+          enable-width = <1>;
+          refdiv-shift = <12>;
+          refdiv-width = <6>;
+          fbdiv-shift = <20>;
+          fbdiv-width = <12>;
+          frac-shift = <4>;
+          frac-width = <24>;
+          postdiv1-shift = <1>;
+          postdiv1-width = <3>;
+          postdiv2-shift = <16>;
+          postdiv2-width = <3>;
+          lock-shift = <5>;
+          lock-width = <1>;
+          clock-output-names = "clk_pll_cpu";
+        };
+
+        mux_cpu_root_3mux1: cpu-root-3mux1-mux@208 {
+          compatible = "eswin,mux-clock";
+          reg = <0x208>;
+          #clock-cells = <0>;
+          clocks = <&clk_pll_cpu>,
+                   <&fixed_factor_u84_core_lp_div2>,
+                   <&fixed_rate_clk_xtal_24m>;
+          shift = <0>;
+          width = <2>;
+          clock-output-names = "mux_cpu_root_3mux1";
+        };
+
+        fixed_factor_cpu_div2: fixed-factor-cpu-div2 {
+          compatible = "fixed-factor-clock";
+          #clock-cells = <0>;
+          clocks = <&mux_cpu_root_3mux1>;
+          clock-div = <2>;
+          clock-mult = <1>;
+          clock-output-names = "fixed_factor_cpu_div2";
+        };
+
+        divider_u84_rtc_toggle: u84-rtc-toggle-div@1ec {
+          compatible = "eswin,divider-clock";
+          reg = <0x1ec>;
+          #clock-cells = <0>;
+          clocks = <&fixed_rate_clk_xtal_24m>;
+          shift = <16>;
+          width = <5>;
+          div-flags = <0x5>;
+          clock-output-names = "divider_u84_rtc_toggle";
+        };
+
+        gate_vi_phy_cfg: vi-phy-cfg-gate@1ac {
+          compatible = "eswin,gate-clock";
+          reg = <0x1ac>;
+          #clock-cells = <0>;
+          clocks = <&fixed_rate_clk_xtal_24m>;
+          bit-index = <1>;
+          clock-output-names = "gate_vi_phy_cfg";
+        };
+    };
--
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
