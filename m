Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE17606A331
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J/aRtzrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=60kJ48X2IxnZ+UGK8XgETqxuT1uLd06HNKV1chEOVEg=; b=J/aRtzrc2djNr12tRVq63JKTUe
	7w6FwbIEuRkdxv/MqCVDMm/dVm7hORZ/7XYN1lMzFWo0lhIj4Smk0RLpxW5RUIn+EhAeiITtxNqZW
	6rMiDXRCOXsbvmWt/B2vzGPri7/4vu1K65x7Sq4dY3lxkENmYz+2HU6vszCFNXcIfSID58K31LBnC
	i6ED6jSiJLVKbAZvskXcxfuh2bN7BlPIwCr75IcE9PomA4VncMfyOfAgKbVe1I1TlQ50IHoFBCNLF
	GQZhplRRJQN1o4EEqnBMjJCPpegEFI35NdSIqSz98F/c2PhcAgbZoxhfMhAUiwwlNDdPb217/88W2
	/6AFVkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlOL-00000005p0q-156F;
	Tue, 24 Nov 2026 07:56:41 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVlOB-00000005oxl-3gK0;
	Tue, 24 Nov 2026 07:56:40 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.97.139])
	by APP-01 (Coremail) with SMTP id qwCowABHbfcVQwVrAUaUAQ--.8758S3;
	Tue, 24 Nov 2026 15:56:07 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Tue, 24 Nov 2026 15:56:02 +0800
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: document TH1520 MIPI
 DSI controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-th1520-dw-mipi-dsi-v3-1-ffcf2d87971b@iscas.ac.cn>
References: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
In-Reply-To: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.15.0
X-CM-TRANSID: qwCowABHbfcVQwVrAUaUAQ--.8758S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1DZF4kWF1xur1kKFy7trb_yoW5Cr13pa
	yfGF4xJF18tFnxuan3Kr10yF43WrsYvFn8Ww17J340yayYg3W2q39IkF1YgFy8JF1xZa43
	ZF4jvry7Krnavw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7sRiubytUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_235636_538268_B5482EA5 
X-CRM114-Status: GOOD (  10.01  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T-Head TH1520 SoC contains two DesignWare MIPI DSI host controllers.

Add a binding document for them, referencing the common dw-mipi-dsi
binding file.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml
new file mode 100644
index 0000000000000..c12afde5fc26b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/thead,th1520-dw-mipi-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-Head TH1520 DesignWare MIPI DSI Host Controller
+
+maintainers:
+  - Icenowy Zheng <zhengxingda@iscas.ac.cn>
+
+description:
+  The MIPI DSI host controller in TH1520 is a Synopsys DesignWare MIPI DSI
+  host controller paired with an integrated Synopsys MIPI D-PHY.
+
+allOf:
+  - $ref: snps,dw-mipi-dsi.yaml#
+
+properties:
+  compatible:
+    const: thead,th1520-dw-mipi-dsi
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DSI controller APB clock
+      - description: PHY configuration clock
+      - description: PHY reference clock
+      - description: DSI controller input pixel clock gate
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: phy_cfg
+      - const: ref
+      - const: pixel
+
+  thead,vo-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the VO_SUBSYS system controller for accessing D-PHY sideband
+      signals.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - thead,vo-syscon
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/thead,th1520-reset.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dsi0: dsi@ffef500000 {
+        compatible = "thead,th1520-dw-mipi-dsi";
+        reg = <0xff 0xef500000 0x0 0x1000>;
+        interrupts = <119 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk_vo CLK_MIPI_DSI0_PCLK>,
+                 <&clk_vo CLK_MIPI_DSI0_CFG>,
+                 <&clk_vo CLK_MIPI_DSI0_REFCLK>,
+                 <&clk_vo CLK_MIPIDSI0_PIXCLK>;
+        clock-names = "pclk", "phy_cfg", "ref", "pixel";
+        resets = <&rst TH1520_RESET_ID_DSI0_APB>;
+        reset-names = "apb";
+        thead,vo-syscon = <&syscon_vo>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            dsi0_in: endpoint {
+              remote-endpoint = <&dpu_out_dpi0>;
+            };
+          };
+
+          dsi0_out_port: port@1 {
+            reg = <1>;
+
+            dsi0_out_panel: endpoint {
+              remote-endpoint = <&panel_in>;
+            };
+          };
+        };
+      };
+    };

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
