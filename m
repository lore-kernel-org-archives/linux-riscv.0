Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832DAC531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itmw8G//q7KdowYXOUDWQp6zfOnJ9PVgRkAcS/7x9Xw=; b=ZfJDRO6SqkaF51
	yy61lm2GoF+ZO/PmTI+hzfcRIfpu9GBdDqMrguX/pJP3i08fhfGr49HpqyI5xBwAYF4txuzun5Sa7
	jMd2rMIaj+3EjChkQ5jwYMVEN6M7QmAicetNXY3lm61zGqmk4odHYPELQFTABCiVHwDBl5G/3WSU+
	GxY8utjU1p0WC23rWkqq/BHPhLdiA95bxJY2pEHZoAUhJutaRWTJqBpV0D982Mt6eL09qyPUHmNrB
	IkvpZtz4OlOsRzuj1qkzwoeOznF3P+qoBf3ZWrwwBR5c/AgUnh6PNWyDCoqNFFiWxHrAHm9HkJSHC
	IaJlfO05E8m01xaZGZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUbv-0000000035g-3FDt;
	Sat, 25 Jul 2026 05:07:43 +0000
Received: from mail-oa2-x01.google.com ([2607:f8b0:4864:30::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUbt-0000000035F-0Pil
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 05:07:42 +0000
Received: by mail-oa2-x01.google.com with SMTP id 586e51a60fabf-44cf1835ec3so303238fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 22:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956060; x=1785560860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6a/x50Eo6kNHLlYGVZSsuYw6cqPBcO8EXP5O0WJGjSk=;
        b=cv5kf4Letsl8NJ2FDGCeM3HSi2uhy1Cdtrv40281yfNUk8stpyzpiNpHi78HscsiZm
         PqJyk6Jol9byb4AtVkQEsn0b7MMDa6TRJ6lBGqW+PNFPbC4VVfmIq+rM4kmxJ+2KXSR2
         PEZOI2qyFDgQmyUejuJ60PqXm54CAwtIpib0mAQFB2RG/VrkKCf929cwpU8LCYIZy4BF
         dRSl1Gddm6DbmFch6YYBYntM6CDjHeQ65IkUmIU1PqLOtzFJw7P4UVupiUAYgSEB8ugv
         oJ7M73hCk9kKJ1pKhRBgRSVv/owGN6JHvsLQeUrO5u5RXvqZ8vwXu1eUOCPAzLED53le
         GOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956060; x=1785560860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6a/x50Eo6kNHLlYGVZSsuYw6cqPBcO8EXP5O0WJGjSk=;
        b=kGb/14jy6nsSfA8AXkD61lykbd0Iobh/x0Djec/Z2I4grFCteqcxyIx8xKBiP50vde
         TQwgodziVxjMxTk/H8bRXnJk2Bw0ljNvvAQSlsZN0uShepS2sroxj+l7aqFYWAUHzkm0
         qLK3XzqBOMlPuIsbz2hyAJvsLUF7LT/JQSrY3A9LIKX4PMpI34yO8bAuCrPguyiT3sH9
         EH13nO0CBfK0TYoZkPqx3D0o9Ke6LUyGV4+hYB3T5SXJcCIW/H5br0tH7CikUhtggnAi
         PeuRtAkssegSYNZ+lfIGUjhmthEFgsOHaulrOkDNv220N6m380sKGkYHKQLALWp/K+zg
         U1wA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+lzVm3iRbVe+tQElburE8VUlJPMnoRJqukxlfH+HOmpvfCkUB1FVRywlYGworldLkA2jny4KH98UjGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxumELmoR7KWLnHjDCAk/ojodDo+5wfvHbHS/J7MfxILWn7tAE+
	5ycypkEA0qlqQrD8oDflSVuvdxl+FwJlH/bgPnlHlCQ1FI85GHT3b3rsjWpfcNQ4uSmFUA==
X-Gm-Gg: AR+sD11L0yrqNPLrFHK1XA7G2rCy2+T0HkhqsXnc0cLvUe0hCAQF6bxMh3/m7G1Ao+F
	/cPwT7xrK8ifMTmHyZKXofYZkhSX6k6OiGq80kD9ehZ4ijMeJ0MJn7t1HCFET71BaVZdLMY+Lda
	7m5p/zPckz1zsd0mN6u+CPNL1em3IZDli3cBDVyCwYtEu8QB266fq/jOGj8F9pP/NfkzucZL8LT
	960GKPzNif2iPcl1qSUE2NAkj+P3oEtXm3YI6FlrOtehcYG4jY700pGyUVG6nJPCgpQTaxvRlWA
	VHd3Frv11fiWDiACfif0FzF0JKJA7em06hsc6F3/9b0ovHVM+2DWYP8P9VAQ8yCw+1xpFYYQ/PJ
	rTlx/Te0sNILnK5IxkoTpSm9oCtf12WmASrmppIkjs43lyvdhi5p8IPk=
X-Received: by 2002:a05:6a00:a21a:b0:848:727f:2c8b with SMTP id d2e1a72fcca58-84e5959f3c3mr660746b3a.68.1784949456147;
        Fri, 24 Jul 2026 20:17:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:34 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:35 -0400
Subject: [PATCH 03/17] dt-bindings: display: spacemit: add K3 Innosilicon
 DP/eDP controller
MIME-Version: 1.0
Message-Id: <20260724-k3-display-v1-3-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_220741_369634_2DBB5525 
X-CRM114-Status: GOOD (  14.90  )
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

Both K3 instances are the same IP and share one compatible; which one
behaves as eDP is decided by what its downstream port is wired to, not by
which register window it sits in, so the binding does not distinguish them.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../display/spacemit/spacemit,k3-inno-dp.yaml      | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
new file mode 100644
index 000000000000..865ea310daaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort / embedded DisplayPort Controller
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon DisplayPort transmit controller integrated in the SpacemiT K3
+  SoC. The K3 has two instances of the same block sharing one compatible;
+  each acts as embedded or external DisplayPort depending on whether its
+  output port drives a panel or a connector.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: Link and hot-plug events.
+
+  clocks:
+    items:
+      - description: Pixel clock for the controller.
+      - description:
+          Pixel clock generated by the DP PHY PLL; the pixel clock above is
+          parented onto it in use.
+
+  clock-names:
+    items:
+      - const: pxclk
+      - const: pll
+
+  resets:
+    maxItems: 1
+    description: Controller-wide reset signal.
+
+  phys:
+    maxItems: 1
+    description: Phandle to the K3 Innosilicon DP PHY.
+
+  phy-names:
+    items:
+      - const: dp
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video input from the DPU.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the panel or to the DisplayPort connector.
+
+    required:
+      - port@0
+
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+    description:
+      The DisplayPort AUX bus. Present when the output drives an embedded
+      panel, which is described as a child of this node and identifies itself
+      over AUX. Absent when the output is a connector.
+
+  phy:
+    $ref: /schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+    description:
+      The DisplayPort PHY. Its registers live inside this controller's
+      register window, so it is described here as a child node.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        edp@cac84000 {
+            compatible = "spacemit,k3-inno-dp";
+            reg = <0x0 0xcac84000 0x0 0x4000>;
+            interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon_apmu CLK_APMU_EDP0_PXCLK>, <&edp0_phy>;
+            clock-names = "pxclk", "pll";
+            resets = <&syscon_apmu RESET_APMU_EDP0>;
+            phys = <&edp0_phy>;
+            phy-names = "dp";
+
+            edp0_phy: phy {
+                compatible = "spacemit,k3-inno-dp-phy";
+                #phy-cells = <0>;
+                #clock-cells = <0>;
+                clock-output-names = "edp0_pll_pxclk";
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&dpu0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
