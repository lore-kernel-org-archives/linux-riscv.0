Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0351C0502C
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vD9kukk7szL5zllgfKFzu7VzC0nCQ2Z0wI8vIRR6pfo=; b=Gt1MmuS0+nSB7I
	Tw712dNLkqD6FsyNgJofOiOBrCaBiNb6808FYyfrjXnn/G6Bc5wEmSZkepy2b+8inZ/yBBgKXVU2d
	M2Tn0ABNx+7ti3VaBcwRI+I9IunkkUp/JbY6dKagVg0O9gNL+4ggwBwxLsl+KG6+XHz4z8I6aMOfd
	SnkgRL2uqYEb1lCjh7BAoHrOrAflJrkLiu5/xzBljo2K8T50+ujdpnjDPRqpFE8Khe2q+gLfmpTSX
	b0htw0VoEh8wrw1rgcuvkO65cVN545bhllGPJgY2+H7VN2ebFesOtIJE/IgVwYkLUurNqNe9YEM8R
	wI7PFXJ+1D22xJTaUSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0N8-00GptE-FA; Tue, 30 Aug 2022 12:29:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0N3-00Gpqx-2I
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661862572; x=1693398572;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TbYbqd7aTZtP9BqkPjjohaCeNbROPSiKKPHy/M7Hh8s=;
  b=ScjB5fRLmH7ZabS0/JCvvu03zAkny+7FGeGdPurApnFynEZC6EZZJESm
   XqKTwNvm2+QuZJHwd4N+IDmGYtwlrfdqayc7U1iol3YLZqgEbRz/2n2F0
   JsNupYWPz6pjQx+RMEA2DazdG/VDzzPT37WW3OvGMJHxGFyCbn4Fg+nVI
   EGy74sl+987iib8XAPo3ohg5Z5J5sOIYZdq9Let5pqVkvbCPcwqlzLGd+
   C7LQ/CtCUkIjOcWukdQQE0g1gtmxmUeNRbBYe8V+HjaG78BClLiPuVx6s
   nE9HsttkcGkVEt+qsxneV8RV/JyD8XRN6RPN7tZXiGQJl4HQq8KS60WtB
   w==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="188636565"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:29:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:29:31 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:29:28 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Hugh Breslin <hugh.breslin@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/5] dt-bindings: clk: document PolarFire SoC fabric clocks
Date: Tue, 30 Aug 2022 13:28:53 +0100
Message-ID: <20220830122855.2207752-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830122855.2207752-1-conor.dooley@microchip.com>
References: <20220830122855.2207752-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_052933_127498_BC8012B9 
X-CRM114-Status: GOOD (  12.54  )
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

On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
ordinal corners of the chip, which our documentation refers to as
"Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
highly configurable & many of the input clocks are optional.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs-ccc.yaml    | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
new file mode 100644
index 000000000000..f1770360798f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC Fabric Clock Conditioning Circuitry
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  Microchip PolarFire SoC has 4 Clock Conditioning Circuitry blocks. Each of
+  these blocks contains two PLLs and 2 DLLs & are located in the four corners of
+  the FPGA. For more information see "PolarFire SoC FPGA Clocking Resources" at:
+  https://onlinedocs.microchip.com/pr/GUID-8F0CC4C0-0317-4262-89CA-CE7773ED1931-en-US-1/index.html
+
+properties:
+  compatible:
+    const: microchip,mpfs-ccc
+
+  reg:
+    items:
+      - description: PLL0's control registers
+      - description: PLL1's control registers
+      - description: DLL0's control registers
+      - description: DLL1's control registers
+
+  clocks:
+    description:
+      The CCC PLL's have two input clocks. It is required that even if the input
+      clocks are identical that both are provided.
+    minItems: 2
+    items:
+      - description: PLL0's refclk0
+      - description: PLL0's refclk1
+      - description: PLL1's refclk0
+      - description: PLL1's refclk1
+      - description: DLL0's refclk
+      - description: DLL1's refclk
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pll0_ref0
+      - const: pll0_ref1
+      - const: pll1_ref0
+      - const: pll1_ref1
+      - const: dll0_ref
+      - const: dll1_ref
+
+  '#clock-cells':
+    const: 1
+    description: |
+      The clock consumer should specify the desired clock by having the clock
+      ID in its "clocks" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
+      PolarFire clock IDs.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@38100000 {
+        compatible = "microchip,mpfs-ccc";
+        reg = <0x38010000 0x1000>, <0x38020000 0x1000>,
+              <0x39010000 0x1000>, <0x39020000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>,
+                  <&refclk_ccc>, <&refclk_ccc>;
+        clock-names = "pll0_ref0", "pll0_ref1", "pll1_ref0", "pll1_ref1",
+                      "dll0_ref", "dll1_ref";
+    };
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
