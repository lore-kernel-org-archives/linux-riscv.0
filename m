Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E11CA100F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFBAHqYGzLzprGdldErxGkwUKyQDiLM1hi0GVBMEod8=; b=ZeWfwdY97CNdTL
	4PmDh6yyQMjxfc8/KLN3SK5Era2UTwEeTe3D0se9T0ZUVGvAsq5AxDI4O9RALBnrzTGmFR7aWB+9j
	T/UVvi9L9mJT7rKJz3Tbe1ye2em93PP04SS8CSWEeOYSDpu7NOiH0yED+5yEs4RjzREnZ7nuP5oVU
	spkM8tAQbYSoDp92KHr1mM51GMLOIuH7wJ5RvcKKcIxAuQQ08mw721SaUkBIJUTMxJLlX2hdW9zQj
	sxD8Fsm86qRNccgw9f/115vJrWVfAGeqYF8TcrSTu6DDvoOHGMjpGbYxYRxvt5Cp8M0tHhzY/A0Q1
	eerPzuzQuG9QWKbJBf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jEE-0000000Axbw-2khG;
	Mon, 22 Sep 2025 16:17:26 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jEC-0000000AxbG-27gK
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 16:17:26 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-42486ed0706so18024955ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758557843; x=1759162643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wga3pOieT58b7cDMHJFs+GN/WnPHhePS4hUJ36fp+DA=;
        b=egfdtBeggaok937NoXQOx8KhfaMeC4y9Vc5/vozTsTwgzYTn6PkxdpRNc3Ld/Mv4D6
         enFyqn93N47QC7jc6ZWSGub15HCrRVUZmXVTweUYfDQM4ur+IDEihZlWFmBTNamyAPJa
         FPuwvrYhASKKodZ6gaDUszzLlcc3/Iqe4aM7arjPdiWKe2YRUyw9oPHRDleR2ZfXi9Et
         olX3jSEEx3bSFEQVjHpk2KWbb/bXeCHzSSe7PO/a0LJMndXd3Dlhhn9lwKSre7FrAMnJ
         XILeiv5vHgke5rQh8AwDBOYdV4/LvaCdYuBKkEAhFbNupyLAOEdRIjlWTrRUZ8qdwiWi
         RFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557843; x=1759162643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wga3pOieT58b7cDMHJFs+GN/WnPHhePS4hUJ36fp+DA=;
        b=K1c4kZKq/zZ7IJyFNXiWvyjvU5bB6fTtewdsgQDW7xdrabDRFlNuEfbF6C7Ux/utPP
         qjuIK0Pz+uMCLcfITYDih00o9VfDA/3WC442k0Kcwu6EYQeY4/ek5Ze8zQJpIV8CMWhB
         RX0H/fW1g/TQtbZ5NJpGuGsnOU7l6C7hxOuA8C+HyOpV2oMcRIWJH5AGcuNryDoTK1tZ
         7yBrsg27OUZr7/9pu2tgEvQ2x5tqwLjbU5QsysDRvTYXqAklEO/hZpMNwz+t7wAOBd0D
         8e813x/aFKmW6Ir2Xr1Xsy1hDDWdMAMViTVCUzPJsxA0AlhnpqEc2Kq5Bz1Lhi2D+d4+
         S2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG5/5L8no0NqEm7b381uXjfLkQyTKRYtWumRs+hxOONr4sR5ude/6n6rNGanPHn0qo+PvmCKXYryzqJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+1bDLeCNQOuURJw75+82gPSvDsq/63asmQkLp2cbVxlQnIEPS
	OrfeC8AJe+iADbtpi/eHMF0FOzL8IFzjumJUnqzVZe+r9PObjozMrimLrZcb3UGSCRI=
X-Gm-Gg: ASbGnctMKe/2MMRiANFe3Uagwik6miEz4R9Aitbg2F9QN9iBLVV7yIeQOjQggBRt6xu
	CFgo84qL/sUffbJ13fLlgPN5PjKH3RGI2zWRtv+7YHZ20+Ts5ldVyu17s7ugZXnFy9ibgP/oyWm
	IhtP+LouuvjinLoCkDBe+3JViMLpq2XVETG7KaE5BEnPX2zs0tM8aI94r5W2TYYmsWNg6N8CnGT
	cA+SUlR9/9nXnD6FcCkoMOSq/dxpTUIbfRHgiIrJ2Qa2J1BfaasrqVhHq+IWz0Gs5b/q1FUcODl
	+JAwyZzDVG7tv1Wb3ESpbV/tvanVd21RDWbxT/5plZtOp2TP99JgLZEKAZ7gQYw55Zb3ccZgp1y
	hUtATcfn9JDmQvGlQFj+GDinwdtheVzUwtD6ZdGuAdQUCdEE59FAJqz85gzEQJ2C4UDujmJhMyB
	IR
X-Google-Smtp-Source: AGHT+IFNEIkWwdlkmnsrsDiii/iS29yCgoX4Tp67gfiF8B5e/yODsUx/VWOVNEk4pntvfOCoXkV5mw==
X-Received: by 2002:a05:6e02:1a82:b0:424:5970:3d20 with SMTP id e9e14a558f8ab-4248190bd99mr219210245ab.12.1758557843518;
        Mon, 22 Sep 2025 09:17:23 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425711d9aa0sm25207185ab.48.2025.09.22.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:17:23 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Date: Mon, 22 Sep 2025 11:17:14 -0500
Message-ID: <20250922161717.1590690-2-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250922161717.1590690-1-elder@riscstar.com>
References: <20250922161717.1590690-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_091724_546956_30B67958 
X-CRM114-Status: GOOD (  13.05  )
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

Add support for the SPI controller implemented by the SpacemiT K1 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Add Conor's Acked-by
    - Add Rob's Reviewed-by

 .../bindings/spi/spacemit,k1-spi.yaml         | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
new file mode 100644
index 0000000000000..a6978212ff570
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spacemit,k1-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 SoC Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Alex Elder <elder@kernel.org>
+
+description:
+  The SpacemiT K1 SoC implements a SPI controller that has two 32-entry
+  FIFOs, for transmit and receive.  Details are currently available in
+  section 18.2.1 of the K1 User Manual, found in the SpacemiT Keystone
+  K1 Documentation[1].  The controller transfers words using PIO.  DMA
+  transfers are supported as well, if both TX and RX DMA channels are
+  specified,
+
+  [1] https://developer.spacemit.com/documentation
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-spi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Bus clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    items:
+      - description: RX DMA channel
+      - description: TX DMA channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+    spi@d401c000 {
+        compatible = "spacemit,k1-spi";
+        reg = <0xd401c000 0x30>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&syscon_apbc CLK_SSP3>,
+                 <&syscon_apbc CLK_SSP3_BUS>;
+        clock-names = "core",
+                      "bus";
+        resets = <&syscon_apbc RESET_SSP3>;
+        interrupts = <55>;
+        dmas = <&pdma 20>,
+               <&pdma 19>;
+        dma-names = "rx",
+                    "tx";
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
