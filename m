Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F81C53210
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d013rXze14rwLDo8jkkcOncqSGBJPKLL9w0cEizkGW0=; b=cT3NV3qzgfgQxi
	iqn0rc42IMwy8A4cJ7rGyZIGKTYwASVs8p11uhWM2A3OYmh9qaBjaFQCSQYIZ5oeF/DPCAEr1DLU2
	F38UVZri2nPfKmJT1Eh/nt6Wwl9b++HFlLbaRdBfQxgqcvJdwF2Eg7ZsSgD/jm8Q6as65JpVIISgh
	8Eutkv0qYkCGpYJ12nnVprW5AIeqfv/4QqULLDBQMZGmt2ad+4pHa1AmtQxGjOeG0My5dqRB1Bm1h
	iXGao5mX8wciGZkK346E7YgqRBmRU5C4Yqa3lBrP5qh1wvNo64S4SRo3gzs8PF6kUB34waCStIpYm
	xGBrooYONAAdsBeWQjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkok-003Gwd-4Y; Tue, 03 Jan 2023 17:11:14 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi40-001rkG-2u
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:14:50 +0000
Received: by mail-pg1-x52d.google.com with SMTP id h192so15369353pgc.7
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qxy1AII8mzQRWc0P6lSKBTCvnK5R7b9MxsVjt7NSjH8=;
        b=OK6PGwt4wzY9D/3RnfGc+XZ7yBXLZLVPotryDSjOPiqJQElCG+rsGRiqohGB/EImGp
         QU+6p2U6O2Q9AHUNwHHsuw5SzXR4+WkyA85++UES3c8HP3vATjgwYtWzxLf1O/K4Cz9s
         VzHl0fLv6NKbjGMtWSwNEiphs4VcXEeNK0niO0jGLXLVrsb/zEywDJn8RCCzZVXDjhte
         rZpRFwsxnEtf6ezq8mEHq7qZhfwjkGJHAUC9bSrkgDG5vBM7FJvU7dZ7o0M4vXN/Qhpr
         E7ebKQahi3Jq4dlJp2NcVswmII79ZtTU8Q2AKCwpHAlMESKdWx2TqAt5hpcCMHmRegqe
         s4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qxy1AII8mzQRWc0P6lSKBTCvnK5R7b9MxsVjt7NSjH8=;
        b=ncm8ZKWQI18KFWl4mQv7bt3o3rfzy35ViqwAqD2nRaLik6mxChPQPHXpspYZsdAk9D
         q1Hx/eS/mQuMY5otIoT/mP1oYSRNF4PSsQantZ0f10GH2ABtNSYw8Nu3FoiQMh93wRxs
         j/Je7sOWBXqhAf5sunHYir40+ENYivLJkfeidVJY+rk8cOy86c5T9wsjSuzketkloO18
         9hOGzYsdXlmTJkfAUL7oRfUqjsB+WZSmgk6/uaJMIbq9jfmhJQsLkfmh/ELxUqNXXuCZ
         PEK+sBsNqa95v1ZY/gcEhiWIbYZgTFo2EefzdglkXYuvs7upKdlnyX87DOnvR3PoIf3G
         sDvw==
X-Gm-Message-State: AFqh2kqxcJ5hGdrKZfBMOAc3PfhXTq18CpbAaeaz4l43mGCBugTtJxxM
	dKHy7APUHCPL0Lmki3Q6Y1HS9g==
X-Google-Smtp-Source: AMrXdXvsk2ds4lPc3kxJKGZucLF/Wkv1k1fz59SMG/UzSr+MrpjPQ9fKZ0kUGFT06+58QOFmMFg5Dw==
X-Received: by 2002:a62:8382:0:b0:581:21c2:804c with SMTP id h124-20020a628382000000b0058121c2804cmr29057091pfe.17.1672755285453;
        Tue, 03 Jan 2023 06:14:45 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id h1-20020a628301000000b0056be4dbd4besm5936035pfe.111.2023.01.03.06.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:14:44 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 6/9] dt-bindings: interrupt-controller: Add RISC-V advanced PLIC
Date: Tue,  3 Jan 2023 19:44:06 +0530
Message-Id: <20230103141409.772298-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141409.772298-1-apatel@ventanamicro.com>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061448_220627_AA88507D 
X-CRM114-Status: GOOD (  15.25  )
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

We add DT bindings document for RISC-V advanced platform level
interrupt controller (APLIC) defined by the RISC-V advanced
interrupt architecture (AIA) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../interrupt-controller/riscv,aplic.yaml     | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
new file mode 100644
index 000000000000..b7f20aad72c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,aplic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Advanced Platform Level Interrupt Controller (APLIC)
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description:
+  The RISC-V advanced interrupt architecture (AIA) defines an advanced
+  platform level interrupt controller (APLIC) for handling wired interrupts
+  in a RISC-V platform. The RISC-V AIA specification can be found at
+  https://github.com/riscv/riscv-aia.
+
+  The RISC-V APLIC is implemented as hierarchical APLIC domains where all
+  interrupt sources connect to the root domain which can further delegate
+  interrupts to child domains. There is one device tree node for each APLIC
+  domain.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - riscv,qemu-aplic
+      - const: riscv,aplic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 16384
+    description:
+      Given APLIC domain directly injects external interrupts to a set of
+      RISC-V HARTS (or CPUs). Each node pointed to should be a riscv,cpu-intc
+      node, which has a riscv node (i.e. RISC-V HART) as parent.
+
+  msi-parent:
+    description:
+      Given APLIC domain forwards wired interrupts as MSIs to a AIA incoming
+      message signaled interrupt controller (IMSIC). This property should be
+      considered only when the interrupts-extended property is absent.
+
+  riscv,num-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 1023
+    description:
+      Specifies how many wired interrupts are supported by this APLIC domain.
+
+  riscv,children:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 1024
+    items:
+      maxItems: 1
+    description:
+      A list of child APLIC domains for the given APLIC domain. Each child
+      APLIC domain is assigned child index in increasing order with the
+      first child APLIC domain assigned child index 0. The APLIC domain
+      child index is used by firmware to delegate interrupts from the
+      given APLIC domain to a particular child APLIC domain.
+
+  riscv,delegate:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 1024
+    items:
+      items:
+        - description: child APLIC domain phandle
+        - description: first interrupt number (inclusive)
+        - description: last interrupt number (inclusive)
+    description:
+      A interrupt delegation list where each entry is a triple consisting
+      of child APLIC domain phandle, first interrupt number, and last
+      interrupt number. The firmware will configure interrupt delegation
+      registers based on interrupt delegation list.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - riscv,num-sources
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1 (APLIC domains directly injecting interrupt to HARTs):
+
+    aplic0: interrupt-controller@c000000 {
+      compatible = "riscv,qemu-aplic", "riscv,aplic";
+      interrupts-extended = <&cpu1_intc 11>,
+                            <&cpu2_intc 11>,
+                            <&cpu3_intc 11>,
+                            <&cpu4_intc 11>;
+      reg = <0xc000000 0x4080>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      riscv,num-sources = <63>;
+      riscv,children = <&aplic1>, <&aplic2>;
+      riscv,delegate = <&aplic1 1 63>;
+    };
+
+    aplic1: interrupt-controller@d000000 {
+      compatible = "riscv,qemu-aplic", "riscv,aplic";
+      interrupts-extended = <&cpu1_intc 9>,
+                            <&cpu2_intc 9>;
+      reg = <0xd000000 0x4080>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      riscv,num-sources = <63>;
+    };
+
+    aplic2: interrupt-controller@e000000 {
+      compatible = "riscv,qemu-aplic", "riscv,aplic";
+      interrupts-extended = <&cpu3_intc 9>,
+                            <&cpu4_intc 9>;
+      reg = <0xe000000 0x4080>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      riscv,num-sources = <63>;
+    };
+
+  - |
+    // Example 2 (APLIC domains forwarding interrupts as MSIs):
+
+    aplic3: interrupt-controller@c000000 {
+      compatible = "riscv,qemu-aplic", "riscv,aplic";
+      msi-parent = <&imsic_mlevel>;
+      reg = <0xc000000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      riscv,num-sources = <63>;
+      riscv,children = <&aplic4>;
+      riscv,delegate = <&aplic4 1 63>;
+    };
+
+    aplic4: interrupt-controller@d000000 {
+      compatible = "riscv,qemu-aplic", "riscv,aplic";
+      msi-parent = <&imsic_slevel>;
+      reg = <0xd000000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      riscv,num-sources = <63>;
+    };
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
