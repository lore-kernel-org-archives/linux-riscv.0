Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDDD60A3813
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TQOrch0O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vWfxTZh1hTZy0QAelHxnUqtIs+bzsnKnuMV5YdakhMA=; b=TQOrch0OEmLK0AoUJvr9rcaPE2
	ZU8puGjZ/rMac54xXV0/l/h3oM1a0W2yWqmkk8DPixyYacpWI3mN9lmT8xCAB0nacajxza8m+TdxG
	EAeBFPIAPe6Iu9aNfRB8q/3aoEfy5Af8bxziYr5TnTDOubyvbFgK33LyI4ErhPbyrXE/bYARI28OC
	9JogX5Z58W4qey8y5ck2bF/MM4/5EC2Z2jHNgHo7mmeKFwjSiVIb8/+33KVbguNu8z9KUktpbduJ+
	NZsyJecUzw20KDA7emrWhMemSDfyuYSX5oX4raecbJwIQaX38mKULiXClzh5m5rQ9YyeKhW/c8bPm
	A5uZuSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4QC-0000000CXHr-0obm;
	Thu, 19 Nov 2026 15:51:36 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Py-0000000CXC5-2y8z;
	Thu, 19 Nov 2026 15:51:26 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.23])
	by APP-03 (Coremail) with SMTP id rQCowAD3yZrbGv9qvGJbAQ--.6169S3;
	Thu, 19 Nov 2026 23:50:53 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Date: Thu, 19 Nov 2026 23:50:44 +0800
Subject: [PATCH v2 1/2] dt-bindings: display: bridge: document TH1520 MIPI
 DSI controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-th1520-dw-mipi-dsi-v2-1-9ab5f9808f87@iscas.ac.cn>
References: <20261119-th1520-dw-mipi-dsi-v2-0-9ab5f9808f87@iscas.ac.cn>
In-Reply-To: <20261119-th1520-dw-mipi-dsi-v2-0-9ab5f9808f87@iscas.ac.cn>
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
X-CM-TRANSID: rQCowAD3yZrbGv9qvGJbAQ--.6169S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw13tF4furyfurW5CF48Zwb_yoW5AFy7pa
	yfCF4xJF18tFnIvan3Kr18AF43XrsYyFn8Ww17J340ya90ga42q39IkFn0qFy8JF1xZa43
	ZF4qvryIgFnav3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUU9N3UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_075123_137040_81FBB88D 
X-CRM114-Status: GOOD (  10.02  )
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
 .../display/bridge/thead,th1520-dw-mipi-dsi.yaml   | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml
new file mode 100644
index 0000000000000..4d6452a027348
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-mipi-dsi.yaml
@@ -0,0 +1,102 @@
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
+      Phandle to the VO_SUBSYS system controller.
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
+        syscon = <&syscon_vo>;
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
