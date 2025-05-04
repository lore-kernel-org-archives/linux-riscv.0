Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A006C369C2
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 00:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOcxwQwnFX35AIV+Zc2gz6kK+SsoPjxd2e/2FSVU+RQ=; b=pxqfCXO7B1q24b
	NAn9Q5EN+uy90I6eanm5IXra2WFU5FbhXPD9PEKABzeGBExf47TJyXrqDyaHxD3ISZv2LKyFA5XeL
	j0OsvZllT6Slj8lGtITUQCzJtzj+wN/SrQ9XjRrfpZ49MA0Nx5co5IVB5kpSw3rRiVFTOlGbM9JJ9
	md/nSeaae4E3HJaaAJl+lX5Vls8iuQotDfi5aa31mDWdcSytO8Ins4Phv9B0A8u/fnCJerGW4V12L
	nO9BPif1UAyKXg14S5ANAjRIoLwmNtxr9SkLQZkpN7/92aBVM3NX/6JJKOJYxLz8LbvFFA8ZVftRO
	UbBXSTu2uD255pvWiUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBNTN-00000004eyb-3OWp;
	Sun, 04 May 2025 00:44:49 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBNTL-00000004exx-2p9Q
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 00:44:48 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c5e39d1e0eso359344685a.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 May 2025 17:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746319486; x=1746924286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoA+ZSOYEZQCjKYMYI3mrz31xQWAvL5C4Z9pWmjD/v0=;
        b=F3OE1dc98fS1XErQZNxTj5O9QChFDSBEK01bFiANT1QKPYioCMPqM3bE0gKENo4OeX
         Itc1trtrtpmUl9hZt4lu+gGxYtlRc/sOFdWSfd1Dvr0Gv35L/MyygwJACceeQN+IYm1+
         0EVurrIR5hTYtAHEvV2yGCgFLo4xX88vgQARsahrz7AycXURH6L0JEjB+97faKO/uIqf
         MCe0UoLFaOiov2PDdculxH54mqYNsFelDMiVmaxzNAdOiM3rVbG1ikoT+V+fpZwq64vL
         6absq4VpMp9LyM+xmxYPTf0NLMCPQENvkaAMDDl5cKzS4k+p3GEVQczIpTspUH8ocMq/
         v6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746319486; x=1746924286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoA+ZSOYEZQCjKYMYI3mrz31xQWAvL5C4Z9pWmjD/v0=;
        b=xPijv36qszqOJMR+MndVu39wH/hou7+Vrp7nwXtYqt5msrYT/JcxHitVATndusq71J
         EwNHxZDGYJkTbuu4AnRo42geF4H8ahAifvZuMtaVac6ncmAP312AvL1Iw1dpu2uj8vJV
         X30jC1BOUppgf8Wp2JOlYJhMiK4PEFKvjfBIyQFNG/r6tWMzLKMOVtvATwuIm9nOYGxO
         FT7t9hyfVjCXiPuwfsX28PWUaq5ENar3/VM3/8zjLvCBwUK8SD+Ouq3WkPwWxuTJsOoI
         q5odcHZwpjjvmBlhXWCRCYTuvz3YLdTp5asbMUjDxthUrQixo5E9gJWUo5rdD8+PX6p9
         8EyA==
X-Forwarded-Encrypted: i=1; AJvYcCWKn969OUymlkH/B1vJfriXgAXl9YxtoaIAitcU8P9uagJKg1VbL5j5P+MHnXAgVuweuRSlvQwNJgd43g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyth+gAnofxKnr3Wt4kz9NqdeeA65MOZpp7tuZ5EZjFEI+qLZ6A
	Et96UN/no8beNVyIWNFf6RYVZfIvtvr9opHW/l0GaSS3WGprsXNO
X-Gm-Gg: ASbGnctkseuq7/1ScAZDd566GaMD2rv/MSVyQGBBVKWahzVgCcQgmkkVyjHsebZAfGu
	RaPkVryLkoBTK/2LYqFwQgqN4h/36H64y8S1kZ05CQl9mEO0U8UENMaIYv5OUQlHBOcM6wtN4IL
	MbBFhs7YvgGUT+4QcojSt8i3ZqMVE5IFJBudEzcbOS0+HvunMnQy+1Hf19c1tmLzTnE2n0IZRsF
	DfbAu5SRHZHGo6VcSQeVjUQUtOxIHMXs/h3uqOIwjcA6T0Kigphmg0i41BcKzQLb6Bf/N8sHSYr
	vjbHXc5wwaW9w3S9
X-Google-Smtp-Source: AGHT+IHlMrma4ZEgM4G81axUlK/JXKGY6wtDLe1XBP+NpBnysT5RTGS7PbK4xZuVe4+AfSaQT4uAFw==
X-Received: by 2002:a05:620a:448c:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7cae3a9ce2dmr321428085a.15.1746319486286;
        Sat, 03 May 2025 17:44:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad243fc7dsm389133685a.94.2025.05.03.17.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 17:44:45 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Niklas Cassel <cassel@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shradha Todi <shradha.t@samsung.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Date: Sun,  4 May 2025 08:44:18 +0800
Message-ID: <20250504004420.202685-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504004420.202685-1-inochiama@gmail.com>
References: <20250504004420.202685-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_174447_713866_B22B5503 
X-CRM114-Status: GOOD (  12.40  )
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

The pcie controller on the SG2044 is designware based with
custom app registers.

Add binding document for SG2044 PCIe host controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
new file mode 100644
index 000000000000..ff1133bae3ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/sophgo,sg2044-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DesignWare based PCIe Root Complex controller on Sophgo SoCs
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  SG2044 SoC PCIe Root Complex controller is based on the Synopsys DesignWare
+  PCIe IP and thus inherits all the common properties defined in
+  snps,dw-pcie.yaml.
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2044-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers
+      - description: iATU registers
+      - description: Config registers
+      - description: Sophgo designed configuration registers
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: atu
+      - const: config
+      - const: app
+
+  clocks:
+    items:
+      - description: core clk
+
+  clock-names:
+    items:
+      - const: core
+
+  interrupt-controller:
+    description: Interrupt controller node for handling legacy PCI interrupts.
+    type: object
+
+    properties:
+      "#address-cells":
+        const: 0
+
+      "#interrupt-cells":
+        const: 1
+
+      interrupt-controller: true
+
+      interrupts:
+        items:
+          - description: combined legacy interrupt
+
+    required:
+      - "#address-cells"
+      - "#interrupt-cells"
+      - interrupt-controller
+      - interrupts
+
+    additionalProperties: false
+
+  msi-parent: true
+
+  ranges:
+    maxItems: 5
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      pcie@6c00400000 {
+        compatible = "sophgo,sg2044-pcie";
+        reg = <0x6c 0x00400000 0x0 0x00001000>,
+              <0x6c 0x00700000 0x0 0x00004000>,
+              <0x40 0x00000000 0x0 0x00001000>,
+              <0x6c 0x00780c00 0x0 0x00000400>;
+        reg-names = "dbi", "atu", "config", "app";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        bus-range = <0x00 0xff>;
+        clocks = <&clk 0>;
+        clock-names = "core";
+        device_type = "pci";
+        linux,pci-domain = <0>;
+        msi-parent = <&msi>;
+        ranges = <0x01000000 0x0  0x00000000  0x40 0x10000000  0x0 0x00200000>,
+                 <0x42000000 0x0  0x00000000  0x0  0x00000000  0x0 0x04000000>,
+                 <0x02000000 0x0  0x04000000  0x0  0x04000000  0x0 0x04000000>,
+                 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+                 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+
+        interrupt-controller {
+          #address-cells = <0>;
+          #interrupt-cells = <1>;
+          interrupt-controller;
+          interrupt-parent = <&intc>;
+          interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+        };
+      };
+    };
+...
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
