Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00565C6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 23:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OaUBM023SFE+ZuRR25iSw7tU2X7bgH2VBDdpB4GOyXM=; b=x5f4GlS44N6wAa
	PNLI+6notX87hD19/CbrRu9iMe/JNjqDiRSlA+1jmlz8T3+7a9KVxtt5RdU18n/CHA+YaOKigIxUO
	S1cIl5EzDAmWaO9l1kNK0xYCTYH1tjTxtxf3F+v9gTQIZ9KtB/f910zCT+SHFrqoyvOhUjYm8EhSb
	CgQQfC7qz2YQe+vVcTSOK/ca6YGj9yCXhdFfr3nLGYxuDQDGwN8WvUlbeZ9vQdZz2e+eZvGtq2VVB
	i2xQ6BKg1W7Jh07CLOLve8AwGhXHeQQOMqTaWVDuWTcQTJtA33Lq35gf7a6Jzowr9CmYRuLUtn+B4
	CIyAuR2fLnuy3JYfomRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peP6K-00AnQ9-3C;
	Mon, 20 Mar 2023 23:39:41 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peP6G-00AnON-08;
	Mon, 20 Mar 2023 23:39:38 +0000
Received: by mail-oo1-f52.google.com with SMTP id h21-20020a4ad015000000b0053b587d9d28so16931oor.12;
        Mon, 20 Mar 2023 16:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679355574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbrxJ0fwPhPLKh98WJtIL8glo9hyZk6OP6hoto5Dg3E=;
        b=N7dbLE440jjkKBa9kQ/lX55NL8OPjxHuOlbvbPxbKTwmTiArt9Eq/jpAnTtq69jpXa
         P6rrt8a/NBR56Y03dCVkQrSvNelEMqBe5qe/DwA4GMm11+eaaKC00OzVFDt8+Iqu8Fu7
         CB65HzORsVGP7mIyMkX5VlnZGIa2LsLWZGNe3j65u/+iIzmcDNfkhdoOGKlHjXxdvnkT
         LxeoLteeWMRbVAO0eXTU9ya/Av1EVOmcAga3dxrlFVTTegQg/e1lFzWO7xJKAnIyK+yB
         xl+cbXHqiRYfbqYHoMZTRsnLjDWfaJO36ekgkMBMCMR+XX/I1+BkegbYdOoYRrAg+lQ8
         Enaw==
X-Gm-Message-State: AO0yUKVztoNpKEmvfhomJPZxS9xpkNCQlLu6rk4heOh34Pxlin0E3T8x
	STrAlowms6P76Z0yWN+TZA==
X-Google-Smtp-Source: AK7set+VY226nc37Mz5PtD72QjJb4B/DciJqhSrxo7tuaqvkbUo3OFvcwJIaV3bzvjJaDPD+3QpqnQ==
X-Received: by 2002:a4a:490e:0:b0:53b:5510:958d with SMTP id z14-20020a4a490e000000b0053b5510958dmr105786ooa.0.1679355574641;
        Mon, 20 Mar 2023 16:39:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v11-20020a4aaecb000000b0053732f1acd2sm4428977oon.5.2023.03.20.16.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:39:33 -0700 (PDT)
Received: (nullmailer pid 2920813 invoked by uid 1000);
	Mon, 20 Mar 2023 23:39:32 -0000
From: Rob Herring <robh@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: Drop unneeded quotes
Date: Mon, 20 Mar 2023 18:39:27 -0500
Message-Id: <20230320233928.2920693-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_163936_092899_C311F50E 
X-CRM114-Status: GOOD (  13.41  )
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

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/interrupt-controller/actions,owl-sirq.yaml   | 4 ++--
 .../bindings/interrupt-controller/fsl,irqsteer.yaml       | 4 ++--
 .../interrupt-controller/intel,ce4100-ioapic.yaml         | 4 ++--
 .../bindings/interrupt-controller/intel,ce4100-lapic.yaml | 4 ++--
 .../interrupt-controller/intel,ixp4xx-interrupt.yaml      | 4 ++--
 .../bindings/interrupt-controller/loongson,htpic.yaml     | 4 ++--
 .../bindings/interrupt-controller/loongson,htvec.yaml     | 4 ++--
 .../bindings/interrupt-controller/loongson,liointc.yaml   | 8 ++++----
 .../bindings/interrupt-controller/loongson,pch-msi.yaml   | 8 ++++----
 .../bindings/interrupt-controller/loongson,pch-pic.yaml   | 6 +++---
 .../bindings/interrupt-controller/mrvl,intc.yaml          | 4 ++--
 .../interrupt-controller/mscc,ocelot-icpu-intr.yaml       | 4 ++--
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml  | 2 +-
 13 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
index 5da333c644c9..27756d0c5419 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.yaml
@@ -32,7 +32,7 @@ properties:
       The first cell is the input IRQ number, between 0 and 2, while the second
       cell is the trigger type as defined in interrupt.txt in this directory.
 
-  'interrupts':
+  interrupts:
     description: |
       Contains the GIC SPI IRQs mapped to the external interrupt lines.
       They shall be specified sequentially from output 0 to 2.
@@ -44,7 +44,7 @@ required:
   - reg
   - interrupt-controller
   - '#interrupt-cells'
-  - 'interrupts'
+  - interrupts
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index bcb5e20fa9ca..20ad4ad82ad6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -48,13 +48,13 @@ properties:
     const: 1
 
   fsl,channel:
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       u32 value representing the output channel that all input IRQs should be
       steered into.
 
   fsl,num-irqs:
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       u32 value representing the number of input interrupts of this channel,
       should be multiple of 32 input interrupts and up to 512 interrupts.
diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-ioapic.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-ioapic.yaml
index 39ab8cdd19b4..a3ac818f067d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-ioapic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-ioapic.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/intel,ce4100-ioapic.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/intel,ce4100-ioapic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Intel I/O Advanced Programmable Interrupt Controller (IO APIC)
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-lapic.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-lapic.yaml
index d2d0145cb889..6b20a5fa8590 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-lapic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ce4100-lapic.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/intel,ce4100-lapic.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/intel,ce4100-lapic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Intel Local Advanced Programmable Interrupt Controller (LAPIC)
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
index 14dced11877b..a02a6b5af205 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
@@ -2,8 +2,8 @@
 # Copyright 2018 Linaro Ltd.
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/intel,ixp4xx-interrupt.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/intel,ixp4xx-interrupt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Intel IXP4xx XScale Networking Processors Interrupt Controller
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
index d6bc1a687fc7..f0acd5671bb1 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/loongson,htpic.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/loongson,htpic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Loongson-3 HyperTransport Interrupt Controller
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
index 87a74558204f..1d145763908e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/loongson,htvec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/loongson,htvec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Loongson-3 HyperTransport Interrupt Vector Controller
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index 750cc44628e9..00b570c82903 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/loongson,liointc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/loongson,liointc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Loongson Local I/O Interrupt Controller
 
@@ -54,7 +54,7 @@ properties:
   '#interrupt-cells':
     const: 2
 
-  'loongson,parent_int_map':
+  loongson,parent_int_map:
     description: |
       This property points how the children interrupts will be mapped into CPU
       interrupt lines. Each cell refers to a parent interrupt line from 0 to 3
@@ -71,7 +71,7 @@ required:
   - interrupts
   - interrupt-controller
   - '#interrupt-cells'
-  - 'loongson,parent_int_map'
+  - loongson,parent_int_map
 
 
 unevaluatedProperties: false
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
index 31e6bfbc3fd3..a71fc2218ede 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/loongson,pch-msi.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Loongson PCH MSI Controller
 
@@ -25,7 +25,7 @@ properties:
     description:
       u32 value of the base of parent HyperTransport vector allocated
       to PCH MSI.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 255
 
@@ -33,7 +33,7 @@ properties:
     description:
       u32 value of the number of parent HyperTransport vectors allocated
       to PCH MSI.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 256
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
index fdd6a38a31db..b7bc5cb1dff2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Loongson PCH PIC Controller
 
@@ -25,7 +25,7 @@ properties:
     description:
       u32 value of the base of parent HyperTransport vector allocated
       to PCH PIC.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 192
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
index 9acc21028413..b7c5022eec84 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
@@ -53,8 +53,8 @@ allOf:
           maxItems: 1
         reg-names:
           items:
-            - const: 'mux status'
-            - const: 'mux mask'
+            - const: mux status
+            - const: mux mask
       required:
         - interrupts
     else:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml
index 27b798bfe29b..4ff609faba32 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/interrupt-controller/mscc,ocelot-icpu-intr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microsemi Ocelot SoC ICPU Interrupt Controller
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 63bc89e13480..b089e62f90aa 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -90,7 +90,7 @@ properties:
       riscv,cpu-intc node, which has a riscv node as parent.
 
   riscv,ndev:
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Specifies how many external interrupts are supported by this controller.
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
