Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B22C531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 05:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VB3RsQ2SR/DiL/YpD7sZMbZqBMFAeyLgi/AhJDtQ584=; b=Cf0MiJK+uc5y5X
	q5gdIoUGslXzQF5saXU5XJCgqTI4GLwF4Jz+qcf3+QmEQVg1vqFroZUVB/bQxffam8mAWCFg+TyKb
	Z7Gg21N8xXvCYuLU+RbmJICq0UX55gi2foNxpj9IBRvVkdPmix5Wbxr0iqG3edxN5NeYsCRfVqM1S
	25KArmh0oHaMNqkwA0oqXDgeJSPTg/FEu6EAjAWItZ01kfifpDS+p0h7TMXzonL0Jb7Wv5Mjk+JmU
	Dcoa1D5/4xxxarPTdB2+AFyEQftQ9uzRJvJDPR1lrgi1s4EcmKHf+Zsv8kjA8puBmAweiwFB0oRv+
	2P7cgAl8luYJvuYWxhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUW9-000000002ff-0mhP;
	Sat, 25 Jul 2026 05:01:45 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUW5-000000002fI-2Yt4
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 05:01:43 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cbb818e57c9so576148a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 22:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784955701; x=1785560501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ycy+Qjco0x+8uNmV749kGmpBtIQZVaDIzcG2OSIxUnc=;
        b=DOlAn3iKjeGsn2Av0pHF2xq9PSfIi/wCYZI3uNXXABd95OudFWcPJSz7XoRjOUueSK
         GFi1DnSkoccbqPseJMMWbydlt9g5GDfTPYTcCGLKBcd9UYnqk7OuphcEuRxbjGpL7YiH
         Bv8C7jJwerX/70wxB5ujWE60DhHRQZdLmypdeopWlLe2WecIKxKQpaKNXDCmzdzUt4ql
         cYTydko1mTd2Gt1difS6Wg4nfh+56oCl9VmjnbUmMPeQyvbfxBDRM0/HE4T6fU74/3dL
         PJwM3hfo+PzQst0bZr9O2mVc7R5a6kbhT+VOeA9R0O3TkDKBYL2ygtQvNCLXYVze7Lhh
         kW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784955701; x=1785560501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ycy+Qjco0x+8uNmV749kGmpBtIQZVaDIzcG2OSIxUnc=;
        b=IXM9N7dWlmjZe+JA2GaQLgs4Aiir2FG4TK6w2uoCx67j6dQYY8fNyxHuaVvm9pLM6Q
         aBrGAdfigcZUGisE0lVMTnM9q7ic7DzBU8hhnFwV1x4uySdoRK5b2aKNSuZgjdlNSfp6
         di+MIN7edFJr/TmTK1weZD2jFBs3SzqKLx427DGCvaiA9Akmz5w0+Tlq40BFaKspV+XP
         XOIh2B40BsTef1cd/AVDluc9ZAQhJq5btnvSGXxNOBQv4C7behhxj2XtLX6QdczKKcVk
         xlFwwNPI1KXde/eXEVPpL9ZKf1THktBFRgS/3qunHn1+jKvP7XpkF+zhYi5NcI6SECsi
         9Gbg==
X-Forwarded-Encrypted: i=1; AHgh+RoFwBKNQQ4neF+P8UNbwsy4cu/FA1xQZz0UdlU4teiZzNlHYd35SIAiiDsUNjTprs+NhakmYsqHcSxhpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz5Sp32yKimZX+ndx0ikckvAI0igtLZF7liFOh/g1TYQBGsllQ
	kXNhRuIzx0fxT7KV/8xNjdw5Mj3MdY4Os+m0rOpgveWWWWSMbzxJUQhYgtEwUrCn70/8Aw==
X-Gm-Gg: AR+sD13w0GtCfaPnk46Gpb/TWqvqFAq4nH0+N5Aa39J7N29H8ujCZdCBL0jAr6qiihQ
	0MHx7p42Wk0+RouSNB1AJjw+LoIxF8q7tDQSpNLOLyrTOzuejyrzB0Z1Nxx5vSMnsEE38Z83OmO
	cageHN4pkSi2p13RPdncEP1oCvOPqwJ5OsYSgjZp97KLy2qryMuPk8dkLmixVs3DW3eGcIMFhHe
	mJvS9GjIUg5d3tuuubsLyiplcn3QDSHXSCdmiMMdgt2M2gJcJcya4TSaZu7upJH9TiBluKJL7/9
	OEydOZhB74bXczghFLZO0qOcaIKO1MmirA0gOmZHff3EB1vhkdcN11HG94V+R67O0/q3H3TSUXr
	hFmMc/yJmr4yGsR1qg8zLzVXIQx60qWi7CUsY5yHB/JxbfXMunwQfE9X5uSDTcgqygw==
X-Received: by 2002:a05:6a00:2d9b:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e593ff0ccmr644911b3a.13.1784949438724;
        Fri, 24 Jul 2026 20:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:18 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:33 -0400
Subject: [PATCH 01/17] dt-bindings: display: spacemit: add K3 Saturn DPU
 controller
MIME-Version: 1.0
Message-Id: <20260724-k3-display-v1-1-f22a10a52867@gmail.com>
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
X-CRM114-CacheID: sfid-20260724_220142_220835_3CC0DF53 
X-CRM114-Status: GOOD (  11.96  )
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

Document the Saturn display processing unit found on the SpacemiT K3 SoC.
The K3 instantiates two of them, one per display path. They share a
compatible: an instance differs only in which register window, interrupt,
clock and reset lines it takes.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../display/spacemit/spacemit,k3-saturn-dpu.yaml   | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
new file mode 100644
index 000000000000..97ea9da4b68e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-saturn-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Saturn Display Processing Unit
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  The Saturn DPU is the display processing unit of the SpacemiT K3 SoC. It
+  composes the display planes and drives the timing for one display path. Its
+  output goes to a DisplayPort or embedded DisplayPort controller. The K3 has
+  two instances.
+
+properties:
+  compatible:
+    const: spacemit,k3-saturn-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Online (live display) compose path.
+      - description: Offline (writeback) compose path.
+
+  interrupt-names:
+    items:
+      - const: online
+      - const: offline
+
+  clocks:
+    items:
+      - description: Pixel clock.
+      - description: Memory clock for the compose pipeline.
+      - description: AXI bus clock.
+      - description: DSI escape clock.
+      - description: DSC clock.
+
+  clock-names:
+    items:
+      - const: pxclk
+      - const: mclk
+      - const: aclk
+      - const: escclk
+      - const: dscclk
+
+  resets:
+    items:
+      - description: Memory clock domain.
+      - description: LCD domain, shared with the downstream controller.
+      - description: DSI escape clock domain.
+      - description: AXI clock domain.
+      - description: DSC domain.
+
+  reset-names:
+    items:
+      - const: mclk
+      - const: lcd
+      - const: esc
+      - const: aclk
+      - const: dsc
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video output to the DisplayPort or eDP controller.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
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
+        dpu@c0340000 {
+            compatible = "spacemit,k3-saturn-dpu";
+            reg = <0x0 0xc0340000 0x0 0x54000>;
+            interrupts = <90 IRQ_TYPE_LEVEL_HIGH>,
+                         <89 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "online", "offline";
+            clocks = <&syscon_apmu CLK_APMU_LCD_PXCLK>,
+                     <&syscon_apmu CLK_APMU_LCD_MCLK>,
+                     <&syscon_apmu CLK_APMU_DPU_ACLK>,
+                     <&syscon_apmu CLK_APMU_DSI_ESC>,
+                     <&syscon_apmu CLK_APMU_LCD_DSC>;
+            clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+            resets = <&syscon_apmu RESET_APMU_LCD_MCLK>,
+                     <&syscon_apmu RESET_APMU_LCD>,
+                     <&syscon_apmu RESET_APMU_DSI_ESC>,
+                     <&syscon_apmu RESET_APMU_DPU_ACLK>,
+                     <&syscon_apmu RESET_APMU_LCD_DSCCLK>;
+            reset-names = "mclk", "lcd", "esc", "aclk", "dsc";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&edp0_in>;
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
