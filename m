Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34767C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jm9FZhEPyICf2wukMIfYTqfWpdby3xW5zhPXxU/z/O4=; b=Jts3wSW2k45OKz
	UOP3xQytJLMax00g9ceC+PDf2xDBY1S8PfrvagQ94V0diFRVEMunmmNnwiDuwhUSkgexeYk4a540o
	fB2CqR2+gQOPj3SkrNK/r+UYttD1jKVeYpA7VgJqo4cJ3OQRCOLvcpHpZkvibLHTiws8RhtF1IzsW
	Out5xG83Z31Pnwn/UsoFVsSKZdaOT6amCR5E/XNiJ7nTdaViyzd6Iz45R++Sbekc/UapmEl52A5GI
	IC47rlbNYgXGnIuyqeUnkkvUdTDrqDspEDUUCm8fTCLS5OsPzG5SFp6HOBsUCJfKTx6A4WJUANvJu
	zO7FQq8Ko3QCY+PHT6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLso-00Cz8W-8c; Fri, 11 Nov 2022 04:43:14 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsh-00Cz45-8o
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:43:09 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id x6-20020a4ac586000000b0047f8cc6dbe4so525424oop.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNzNkRHMwd+QQ2TZ5Hz8eXXmUBpv257CxGWvXOFmL6U=;
        b=Bi3r/MrWNIa0+rZLQzTomF9fJ1id1sbTHD3fqd1ifcE8thGPKHwtuOyrs/7MwrDuRa
         slrfYc4qSJQQm4uIXwGhfiTQcgwoilUoou8o2NWn3zKgWH8fzICDtnJkod7j9DaF57MK
         g9c6nSu3W/Oo/2WZcVSNlFS6h6BdrR3F0NMPeyMZxyI+p5nYJ2QUPVTjcv4LIjcg9/wi
         MFQ+DfkKnQNkyIwUDNBL+680TDdjADL5m5jdo4dCXvlflvLuFnLlMuue8p9sIBHI2leu
         My1OYHHunfiZ2ofNMY/rpZ5WF9GTPQyuCkSO/r4op9fciHSUPoX6glZAQ1pF0LNryD6J
         hiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNzNkRHMwd+QQ2TZ5Hz8eXXmUBpv257CxGWvXOFmL6U=;
        b=KTjLfL9NvJDhsyyxMTS3s3+bMW6QR4XYHvYPznCHjzZvwn6zLliO/VivMyaAYuMhl9
         pCkhdL4Tw5bY7EPfXKZAP6TM9zBwTbqSxXAQBgqj3Bbozoow55zKf1m2I9kX+1U1y0hx
         wC8RAL85dZ76f443aC9CAHY7OT7194RdZRaM0BNwsMr9ApUwWFkRNPnYU1YPA628T/zK
         9LkFqafzkoGhIx/iLZ+uIqkW+f/yIUam4QHrq/xewEP4nJqVSUqqRU+Yj6Ufq/VvZcsp
         Zxll0URu7+rhPbHBWwUryYJGap1CHFweydLQ4QygLRnHe7nXNtrSDGh5hkI03o0pickE
         IChA==
X-Gm-Message-State: ANoB5pkwV7sK83cFLZwIu+ypMX6T6+dnke5E+lY9LBchZAVDy75EnDVh
	OVbICS0WTZJVALJF+3myG5KxNA==
X-Google-Smtp-Source: AA0mqf6fb9U65EAWkgvF8Q799UihxKSTCi6SAcqn2Vwy+E86iJmfxffqR609ooHXrp0S/fLLM/WpNg==
X-Received: by 2002:a4a:a7c6:0:b0:47f:d445:b435 with SMTP id n6-20020a4aa7c6000000b0047fd445b435mr147377oom.87.1668141785853;
        Thu, 10 Nov 2022 20:43:05 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0013d9bd4ad2esm787353oah.12.2022.11.10.20.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:43:05 -0800 (PST)
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
Subject: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller bindings
Date: Fri, 11 Nov 2022 10:12:02 +0530
Message-Id: <20221111044207.1478350-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111044207.1478350-1-apatel@ventanamicro.com>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_204307_352028_A247E07C 
X-CRM114-Status: GOOD (  19.37  )
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

We add DT bindings document for RISC-V incoming MSI controller (IMSIC)
defined by the RISC-V advanced interrupt architecture (AIA) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../interrupt-controller/riscv,imsic.yaml     | 174 ++++++++++++++++++
 1 file changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
new file mode 100644
index 000000000000..05106eb1955e
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Incoming MSI Controller (IMSIC)
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description:
+  The RISC-V advanced interrupt architecture (AIA) defines a per-CPU incoming
+  MSI controller (IMSIC) for handling MSIs in a RISC-V platform. The RISC-V
+  AIA specification can be found at https://github.com/riscv/riscv-aia.
+
+  The IMSIC is a per-CPU (or per-HART) device with separate interrupt file
+  for each privilege level (machine or supervisor). The configuration of
+  a IMSIC interrupt file is done using AIA CSRs and it also has a 4KB MMIO
+  space to receive MSIs from devices. Each IMSIC interrupt file supports a
+  fixed number of interrupt identities (to distinguish MSIs from devices)
+  which is same for given privilege level across CPUs (or HARTs).
+
+  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V platform
+  follows a particular scheme defined by the RISC-V AIA specification. A IMSIC
+  group is a set of IMSIC interrupt files co-located in MMIO space and we can
+  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
+  RISC-V platform. The MSI target address of a IMSIC interrupt file at given
+  privilege level (machine or supervisor) encodes group index, HART index,
+  and guest index (shown below).
+
+  XLEN-1           >=24                                 12    0
+  |                  |                                  |     |
+  -------------------------------------------------------------
+  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
+  -------------------------------------------------------------
+
+  The device tree of a RISC-V platform will have one IMSIC device tree node
+  for each privilege level (machine or supervisor) which collectively describe
+  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - vendor,chip-imsics
+      - const: riscv,imsics
+
+  reg:
+    minItems: 1
+    maxItems: 128
+    description:
+      Base address of each IMSIC group.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 0
+
+  msi-controller: true
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 32768
+    description:
+      This property represents the set of CPUs (or HARTs) for which given
+      device tree node describes the IMSIC interrupt files. Each node pointed
+      to should be a riscv,cpu-intc node, which has a riscv node (i.e. RISC-V
+      HART) as parent.
+
+  riscv,num-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 63
+    maximum: 2047
+    description:
+      Specifies how many interrupt identities are supported by IMSIC interrupt
+      file.
+
+  riscv,num-guest-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 63
+    maximum: 2047
+    description:
+      Specifies how many interrupt identities are supported by IMSIC guest
+      interrupt file. When not specified the number of interrupt identities
+      supported by IMSIC guest file is assumed to be same as specified by
+      the riscv,num-ids property.
+
+  riscv,slow-ipi:
+    type: boolean
+    description:
+      The presence of this property implies that software interrupts (i.e.
+      IPIs) using IMSIC software injected MSIs is slower compared to other
+      software interrupt mechanisms (such as SBI IPI) on the underlying
+      RISC-V platform.
+
+  riscv,guest-index-bits:
+    minimum: 0
+    maximum: 7
+    description:
+      Specifies number of guest index bits in the MSI target address. When
+      not specified it is assumed to be 0.
+
+  riscv,hart-index-bits:
+    minimum: 0
+    maximum: 15
+    description:
+      Specifies number of HART index bits in the MSI target address. When
+      not specified it is estimated based on the interrupts-extended property.
+
+  riscv,group-index-bits:
+    minimum: 0
+    maximum: 7
+    description:
+      Specifies number of group index bits in the MSI target address. When
+      not specified it is assumed to be 0.
+
+  riscv,group-index-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 24
+    maximum: 55
+    description:
+      Specifies the least significant bit of the group index bits in the
+      MSI target address. When not specified it is assumed to be 24.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - msi-controller
+  - interrupts-extended
+  - riscv,num-ids
+
+examples:
+  - |
+    // Example 1 (Machine-level IMSIC files with just one group):
+
+    imsic_mlevel: interrupt-controller@24000000 {
+      compatible = "vendor,chip-imsics", "riscv,imsics";
+      interrupts-extended = <&cpu1_intc 11>,
+                            <&cpu2_intc 11>,
+                            <&cpu3_intc 11>,
+                            <&cpu4_intc 11>;
+      reg = <0x28000000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <0>;
+      msi-controller;
+      riscv,num-ids = <127>;
+    };
+
+  - |
+    // Example 2 (Supervisor-level IMSIC files with two groups):
+
+    imsic_slevel: interrupt-controller@28000000 {
+      compatible = "vendor,chip-imsics", "riscv,imsics";
+      interrupts-extended = <&cpu1_intc 9>,
+                            <&cpu2_intc 9>,
+                            <&cpu3_intc 9>,
+                            <&cpu4_intc 9>;
+      reg = <0x28000000 0x2000>, /* Group0 IMSICs */
+            <0x29000000 0x2000>; /* Group1 IMSICs */
+      interrupt-controller;
+      #interrupt-cells = <0>;
+      msi-controller;
+      riscv,num-ids = <127>;
+      riscv,group-index-bits = <1>;
+      riscv,group-index-shift = <24>;
+    };
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
