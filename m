Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B08CA0EDC
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C60fR4taOlqO4D6AOewSKkynbTuPaf5Y4BE5QUhZ9Jg=; b=3ntXEbw4gPDYBg
	fDn8xWAc6J18CE0NxEBuhtZEBGeUJ6KywY32YL1hnonbGn8PAngMJT/SPPVbpjU1+ljWyUTbhXgbl
	YHq7gCeAEz5YJ47MB5LRWdONO8O3yXhIPHzcT+tGQZsveImu/9Zn4h3/Z3rxxYzbxn6ux81ffEvnl
	o10txqtte+sESHSG1uHmslfDXRQUiKbf6mjNBQQ3QbezdzlqIWd4eJK0zCKgTct1A5JNn44MZPb/Q
	BHas94k6Yhi/cXj8uVoMjXmfTMBdYPdPNa/M3xnVlKP/IEzDVtm/WLlIzjsW4ETYafd5Yv32yehbU
	qVBLenxJXvzs6M62llnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcGi-00000000HDx-1goV;
	Thu, 14 Aug 2025 18:01:40 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umb2D-000000005qc-3X9W
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 16:42:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755189734; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ExGj8PYVDQrNGN+PHQvoPCTT5JJOqVbM7/gAtbrPb9F7pvxYyArbRMi1ora8LGm2vDhaHXDbdQfdiblsXafTJvE4bVk4+nwo78Q4j5tcgV/jYr6R4Tklp7qEv4W0jlPZfBw3SJYDS8bdQQPePS4//PVixnJpgAN9RDtUm+n+Wbk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755189734; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xT73VSOAWFqcNR9QaJalEbid5M45X4zPD1e4xI85pnM=; 
	b=YgWfNlYe8J2QrquK+vXg43RvhhNaQm0N9sk+A9MZ5o1m33/a4v8vxhLTAxRraviwkfCnUxw2CqGJ3bWv2TNB/i/LDODY2QydQyVwKnCvdT1cWBuMU+ch3L/5E7b1K2QlCIr3bLHY3IzyGQHRn1eRcYTUkvYmQGp5od+bstxaFCY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755189734;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xT73VSOAWFqcNR9QaJalEbid5M45X4zPD1e4xI85pnM=;
	b=fABAvV/6NKqD2ji5lIuWriodDvyeHFQq8w70zg7wVEMgWi4vz3GxdVtJS7rWzy5B
	Q01w5Z4Vjh+7cTRLXvzE9TdaZSeQYgpp1cL6q0tlEwS19oGA1Fhbuw6obXOaXKH9ilO
	sF8v77XYDUIzqIuNI1OcM+QYAU4OVVyc+EgWNgZKgoveFQoa8ELr6sGw+q0gnaltzOR
	mHrK00XXiJu92XwYfG8skNOwwShe93JPnw2bmnyBuTE2AbkKfolJB+8lcvfuGpBa+Ja
	1xx35EC35BjthQfVFKFYSimsq2JoJSMLrMnbW4BVsa0B3vt8cn+2sXS/wXrJTyvGp52
	KOwwRyni3g==
Received: by mx.zohomail.com with SMTPS id 1755189733254667.9457856333667;
	Thu, 14 Aug 2025 09:42:13 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
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
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 4/8] dt-bindings: display/bridge: add binding for TH1520 HDMI controller
Date: Fri, 15 Aug 2025 00:40:44 +0800
Message-ID: <20250814164048.2336043-5-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814164048.2336043-1-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_094237_934978_715D27FD 
X-CRM114-Status: GOOD (  11.95  )
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

T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller paired
with DesignWare HDMI PHY, with an extra clock gate for HDMI pixel clock
and two reset controls.

Add a device tree binding to it.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
new file mode 100644
index 0000000000000..3d2b502b08eb1
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
+          <&clk_vo CLK_HDMI_SFR>,
+          <&clk_vo CLK_HDMI_CEC>,
+          <&clk_vo CLK_HDMI_PIXCLK>;
+        clock-names = "iahb", "isfr", "cec", "pix";
+        resets = <&rst_vo TH1520_RESET_ID_HDMI>,
+          <&rst_vo TH1520_RESET_ID_HDMI_APB>;
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
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
