Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D893BC48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLvnTF9yEaQ/0wSyj2AWat3PfanwJsJAaOByA147wLw=; b=H5Bp9NdFSRQ5p+
	FoaRi0qb7nWSvP+m4HixkfppLypyJ5VHQdtTY3MNbc40YXp+eyJReIK25b8UuP/sI78r3gARiJx8A
	XJZFbCDTffXgy8yJpg6ne14cxvDmUqtFKXPvJMBLEXH2TXREH2Uvpz7QbTtoKghk9Rk7PQ59+2PJ7
	mdxJCjZW6XNORoCFH5dpoeCdATSLxXiOA1sSClOo9vQeRlFTeZ476UGpuTwuezD65I9pw8CQaSoi6
	mIMrUHLKi2w0D9+diLKT4Wub/reUpNKNnJCRNcBq9SK2KwG5ZkQC5Iss5Zt33y4Xdr2z8hG48+PEr
	o3VcAg9gJ2t8zMImyBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5b8-00000004JNw-12pR;
	Thu, 22 Feb 2024 09:42:34 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5a7-00000004IYu-1C9A
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:41:37 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3c1404d05bfso5596666b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594889; x=1709199689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2jsLyFwepKDrwIr/uWJV0RdUuyknGyf55lcJyFTRiQ=;
        b=foOQAuacI1XopGUFurnClkUWr2QYd9rT2/lGV3F5pn/JErBfcdd9ccAV+9Rvq7OzC9
         /QWWjJloJA/IVAM8lrExPZ/JefOaQ7ef+8tbGi9X2YwHb8aFenp6I409v6RAy/vJeylN
         q697GW1a9k3CnhJTPxi3oXfF7E7yU0LX3T5aFi3qpuXRJ16GYBAJ71M0MvqyTRplbOly
         svS3p0xStY2Z/J31z351MNexw+WeCeIiOmF9ujptaGhKcHG0GJEAj8PSP0wCZFr/4WM2
         Munar0xzY4GlBnVzWcD9QD3n3EPblpkp7HIF0lGeRvcKYZoPB5LF3Zx/y04HBSIFxrHj
         QiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594889; x=1709199689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2jsLyFwepKDrwIr/uWJV0RdUuyknGyf55lcJyFTRiQ=;
        b=ETHdEzDlp2Y9jkQqgiezhNlYgKDlsXUZrY3PJo2JclGwqCsTzF/WKUosEoRbP5OMSO
         27R/fj7t6/nLhOp7pT1TPcLbLgdf5Zs9NbAS/BuT5ByhqzS9bWd/8DJMThGaP7/iZ1m9
         M+FX3eL/5FANqDdvQTaUzm4iLeMnO3ixWrkmqOSyTcR/3PbUsLnUXugcK9j1cKJqPYtQ
         g+D6l0fGzmSsBdeUrYf0Joc1eyipmnAXyEIhE+11X/hEU/ZlUtYypTLrSmMwmtVAXMF1
         dOBLQoCOAaOzhvXXtmwXSnPluROTe8+k8IcfQ+mHt5jHOFxKy6ItNq/+1F6I35pA7XcI
         aekQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpMUkTCnF/wyPimFTXCMsiaL+1JOwjecMX/2rQJtbOAXzOBZ8IUlBQ1yGbTUaGVycGhL5/XK1WJrmv06J7XpTbqw0WFWRE17zOau+F7YC8
X-Gm-Message-State: AOJu0Yxv3cF1j6ypmt/hNJPuQZKguIQpYrIp4DhnwvePpfZ4EVH4QdRu
	8M+0g1AdYQLobCp97MKEZJBwU+qeXy2DC5fj2d5PKBU76skZEnSpsvDZuO21ZwQ=
X-Google-Smtp-Source: AGHT+IFRukTMRpON+pv22bV2K5TI+M1YoKk45SQw3N4BqmJNHg6vHFJjjLROu0SEPH9tD7uP10513Q==
X-Received: by 2002:a05:6808:f8b:b0:3c1:7eac:a8a8 with SMTP id o11-20020a0568080f8b00b003c17eaca8a8mr740044oiw.26.1708594889565;
        Thu, 22 Feb 2024 01:41:29 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:41:29 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 09/18] dt-bindings: interrupt-controller: Add RISC-V incoming MSI controller
Date: Thu, 22 Feb 2024 15:09:57 +0530
Message-Id: <20240222094006.1030709-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014131_647399_4BB62BB8 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add DT bindings document for the RISC-V incoming MSI controller (IMSIC)
defined by the RISC-V advanced interrupt architecture (AIA) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../interrupt-controller/riscv,imsics.yaml    | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
new file mode 100644
index 000000000000..84976f17a4a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Incoming MSI Controller (IMSIC)
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
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
+  The device tree of a RISC-V platform will have one IMSIC device tree node
+  for each privilege level (machine or supervisor) which collectively describe
+  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
+
+  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V platform
+  follows a particular scheme defined by the RISC-V AIA specification. A IMSIC
+  group is a set of IMSIC interrupt files co-located in MMIO space and we can
+  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
+  RISC-V platform. The MSI target address of a IMSIC interrupt file at given
+  privilege level (machine or supervisor) encodes group index, HART index,
+  and guest index (shown below).
+
+  XLEN-1            > (HART Index MSB)                  12    0
+  |                  |                                  |     |
+  -------------------------------------------------------------
+  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
+  -------------------------------------------------------------
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qemu,imsics
+      - const: riscv,imsics
+
+  reg:
+    minItems: 1
+    maxItems: 16384
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
+  "#msi-cells":
+    const: 0
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 16384
+    description:
+      This property represents the set of CPUs (or HARTs) for which given
+      device tree node describes the IMSIC interrupt files. Each node pointed
+      to should be a riscv,cpu-intc node, which has a CPU node (i.e. RISC-V
+      HART) as parent.
+
+  riscv,num-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 63
+    maximum: 2047
+    description:
+      Number of interrupt identities supported by IMSIC interrupt file.
+
+  riscv,num-guest-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 63
+    maximum: 2047
+    description:
+      Number of interrupt identities are supported by IMSIC guest interrupt
+      file. When not specified it is assumed to be same as specified by the
+      riscv,num-ids property.
+
+  riscv,guest-index-bits:
+    minimum: 0
+    maximum: 7
+    default: 0
+    description:
+      Number of guest index bits in the MSI target address.
+
+  riscv,hart-index-bits:
+    minimum: 0
+    maximum: 15
+    description:
+      Number of HART index bits in the MSI target address. When not
+      specified it is calculated based on the interrupts-extended property.
+
+  riscv,group-index-bits:
+    minimum: 0
+    maximum: 7
+    default: 0
+    description:
+      Number of group index bits in the MSI target address.
+
+  riscv,group-index-shift:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 55
+    default: 24
+    description:
+      The least significant bit position of the group index bits in the
+      MSI target address.
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - msi-controller
+  - "#msi-cells"
+  - interrupts-extended
+  - riscv,num-ids
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    // Example 1 (Machine-level IMSIC files with just one group):
+
+    interrupt-controller@24000000 {
+      compatible = "qemu,imsics", "riscv,imsics";
+      interrupts-extended = <&cpu1_intc 11>,
+                            <&cpu2_intc 11>,
+                            <&cpu3_intc 11>,
+                            <&cpu4_intc 11>;
+      reg = <0x28000000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <0>;
+      msi-controller;
+      #msi-cells = <0>;
+      riscv,num-ids = <127>;
+    };
+
+  - |
+    // Example 2 (Supervisor-level IMSIC files with two groups):
+
+    interrupt-controller@28000000 {
+      compatible = "qemu,imsics", "riscv,imsics";
+      interrupts-extended = <&cpu1_intc 9>,
+                            <&cpu2_intc 9>,
+                            <&cpu3_intc 9>,
+                            <&cpu4_intc 9>;
+      reg = <0x28000000 0x2000>, /* Group0 IMSICs */
+            <0x29000000 0x2000>; /* Group1 IMSICs */
+      interrupt-controller;
+      #interrupt-cells = <0>;
+      msi-controller;
+      #msi-cells = <0>;
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
