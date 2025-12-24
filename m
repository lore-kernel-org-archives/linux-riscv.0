Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887C3E7545C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ig8/yGqvPHxb6axPCl1CPJSNcU8lcmQpJHuSKU5PCEY=; b=KZrewqEmGr0Vvw
	UGTb8VshxkBeCgBqiqGp7WtD36DrGdqRO2UPrBj6ZbNJXF4YKsXOAzxh3QfPkb3T1SJRZvylV0gos
	ggQxUzRbngiOLK7mJ2gYh5NJbhfY/pSR0e/8v+77lmQCEKOCyNUMsCYhDoY7p2KyuRLA0T6F7MR75
	V8Tzl44aUd8c1yH+rPjvY7kNWXhzV8CglJoPJpGPTFOYsB1dDKoAGLSw5Uu48WZMYhwQI5BpjOiLc
	qpsQBy20z7pK9YJgxLpmebz2iLaSea3ay5hI17oG1ZRAFTW5FnvYm6+p7JEMJjRYhTWHTq0uk9os5
	AhJWrNXJJkgr27sX7wdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRTw-0000000HCyP-2ZQQ;
	Wed, 24 Dec 2025 16:13:00 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRTl-0000000HCs2-2tlk
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 16:12:59 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.54])
	by APP-05 (Coremail) with SMTP id zQCowAA3yw7WEExpgGPNAQ--.14041S6;
	Thu, 25 Dec 2025 00:12:18 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v4 4/9] dt-bindings: display/bridge: add binding for TH1520 HDMI controller
Date: Thu, 25 Dec 2025 00:12:00 +0800
Message-ID: <20251224161205.1132149-5-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3yw7WEExpgGPNAQ--.14041S6
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1rJF17Xr1ftFyrtw4fZrb_yoW5Kw4Upa
	1fGa1kJFykJF17ua1xJr1IkrZYqrZ5AFnYgr17Ww1jy3y5WFy2qrZIkrn8XFyrJF4xZay3
	ZFZ8Xr1fKa1av3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUv
	cSsGvfC2KfnxnUUI43ZEXa7sRRjg43UUUUU==
X-Originating-IP: [112.94.100.54]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_081251_141595_360F07E3 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: devicetree@vger.kernel.org, Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller paired
with DesignWare HDMI PHY, with an extra clock gate for HDMI pixel clock
and two reset controls.

Add a device tree binding to it.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
No changes in v3, v4.

Changes in v2:
- Re-aligned multi-line clocks/resets in example.
- Added Krzysztof's R-b.

P.S. Should the mail addresss of Krzysztof be changed? I got notice
email that says he's no longer working for Linaro.

 .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
new file mode 100644
index 0000000000000..68fff885ce15b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/thead,th1520-dw-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 DesignWare HDMI TX Encoder
+
+maintainers:
+  - Icenowy Zheng <uwu@icenowy.me>
+
+description:
+  The HDMI transmitter is a Synopsys DesignWare HDMI TX controller
+  paired with a DesignWare HDMI Gen2 TX PHY.
+
+allOf:
+  - $ref: /schemas/display/bridge/synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    enum:
+      - thead,th1520-dw-hdmi
+
+  reg-io-width:
+    const: 4
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: iahb
+      - const: isfr
+      - const: cec
+      - const: pix
+
+  resets:
+    items:
+      - description: Main reset
+      - description: Configuration APB reset
+
+  reset-names:
+    items:
+      - const: main
+      - const: apb
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input port connected to DC8200 DPU "DP" output
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI output port
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reg-io-width
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+    #include <dt-bindings/reset/thead,th1520-reset.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      hdmi@ffef540000 {
+        compatible = "thead,th1520-dw-hdmi";
+        reg = <0xff 0xef540000 0x0 0x40000>;
+        reg-io-width = <4>;
+        interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk_vo CLK_HDMI_PCLK>,
+                 <&clk_vo CLK_HDMI_SFR>,
+                 <&clk_vo CLK_HDMI_CEC>,
+                 <&clk_vo CLK_HDMI_PIXCLK>;
+        clock-names = "iahb", "isfr", "cec", "pix";
+        resets = <&rst_vo TH1520_RESET_ID_HDMI>,
+                 <&rst_vo TH1520_RESET_ID_HDMI_APB>;
+        reset-names = "main", "apb";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          port@0 {
+            reg = <0>;
+
+            hdmi_in: endpoint {
+              remote-endpoint = <&dpu_out_dp1>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            hdmi_out_conn: endpoint {
+              remote-endpoint = <&hdmi_conn_in>;
+            };
+          };
+        };
+      };
+    };
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
