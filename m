Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100F6C021B4
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 01:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+9WsEChjbdnc03IxlyzbFmma5WOjQwB1aYF4Tze8Ko=; b=NuWuoTxYnGOudH
	pUfx8oc1cXcIDqJrypluY3vYI15iwlZNP1ziLQFFJwmpA+/Is+45ag5VzLjWziMQNpgzddMvZuGwE
	UiknCdv/r3wgYF3zsgiECYLJQipHIz0oBn0awc5HvP4TpNteTW3iBiv/FZegOGKNJfM77VpT7cCdG
	xvUY3QM1//Vbt8AErkJVU5T/OSV4+TOxqfaLX1vYnyL0xErY41ePFVds9UlkzgtUn3n7ja3k4zkEA
	/X2rvjueoVu72az4B9Isfs72PfJmfSKD/gWLnC9pekBSUnhgmxG8tcT3xv1rIve6Q2/CCHnqNBpFs
	sedRrXhBeeC/x6tY77RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHzj-00000003iZ2-1tl5;
	Fri, 21 Feb 2025 01:38:23 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHzg-00000003iY3-2Bjr
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 01:38:21 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6e670d29644so12589186d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 17:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740101899; x=1740706699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7LTcAf+ZyZRbj1wIT6OJpobzFlxe4+MXo9izwg7tN8=;
        b=XondHLnIhsVhKQYQL122kWJq/ja/LeOINq/rQ403sQcxu5ZD/6UIIN2t2Aot+Rxokd
         u9Ln9NYwoJ5AW2lMkvue2Cz8F3bRcFMTXqiIUBwGHtvrsr8O16eilroy8zTvoFC0m5kC
         V8Id9+Hw8s8Vs/0kxinKJhzROyo3PUcAMTbN/rKJCAa0Sp+I4VYJ6uZcOtku8dm7AEBF
         VBs+KoP4JxboLy90edTV17MT19HdW6pfAJw/lHCKggSb+QMniezSoYGnVhVKxl+tuYnC
         +BgpdKCIxyNe4NXHGdGxH+ZkYXU7P/0p8FY5iw2vAe9Q2I7nuo5SuPAHFnCdWsKVeidc
         ChZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740101899; x=1740706699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7LTcAf+ZyZRbj1wIT6OJpobzFlxe4+MXo9izwg7tN8=;
        b=A8LmRaaNoNN0PX+KzJUQ+z53WonqCuj6J+Q3B0fF1Z7+u/NpBxfVNlCFcQeZqhWG9u
         /Zx9c5NGj6w5vj72CtQRo54qpfPvxYqhhAAS2L+SI9+GrsJSMy83dBW3T601BaWyeH2S
         ER/97sp4fLP5MLg1fTrk5NCPDmOqLiCWlIOX+SCiBDIpbljrqHeZHqzv/CryfhZL/Pz7
         hrPK9EyoqnwBX78ykI9EkR25P7Z4+AtVnTjaWW77dbDpmUpdJ8skIfKNF4r9knXcoob+
         LKJkqvkAW7KPBXo4GGedxLD+ipQGyzDo4RsYHOgdWLxKS3nc1BFyMboLlaSIWvvAIy2L
         cbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJGd17bK68Tu1hf6scDTLCo+ywDFOAlwxTUSTHzYGSw316fqDWd3wxccdkVMtS03D4SoDXVpec/0UqVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJrgl38gvgS4Wi1ZxQbXhFwBgWq+Qd7WbxeJ/nnchhbXbxpbDr
	oqUHvqIe3B/gxTL652BxWH+HpzUe846VVZuxY83SI2a/hayyO0Qo
X-Gm-Gg: ASbGncu09InxEPhAewMXJ1dUZ7yXZg0dTajo86i1oouROtSe1kJVZ9p1cvc18yuWi6j
	Z6hxZoVUDZGPaiah9yMnxagNg+lcpsBQTgMfV4TlzfwdwgiT7y+8UlgG0YDm3t2VYbWbcqoXBrz
	ISVzyPLV870g8ipSmPMOAgLmvMsakJ1Mt8nEyio81Bz+Wnmaopky0J3z3FvM5tt1mgtcUGB5gaS
	9fxMQ0vW6+v/zQTnyA4O495Yu3wDLjvVCjBtU871Y6a6Ir8DlxcglZHZmnlIvDU+FAg9rIUWaK5
	nw==
X-Google-Smtp-Source: AGHT+IHfY7LcEkIB9TKCmoPKS1hMGvEeQzHukRp3+FUGzCZPUNuqH/fv35zegFODvu5oVyOB5whJhA==
X-Received: by 2002:a05:6214:4007:b0:6e6:6699:7e58 with SMTP id 6a1803df08f44-6e6b00349bamr11779546d6.1.1740101899241;
        Thu, 20 Feb 2025 17:38:19 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d77c878sm92420986d6.20.2025.02.20.17.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 17:38:18 -0800 (PST)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: pci: Add Sophgo SG2044 PCIe host
Date: Fri, 21 Feb 2025 09:37:55 +0800
Message-ID: <20250221013758.370936-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221013758.370936-1-inochiama@gmail.com>
References: <20250221013758.370936-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_173820_563118_A1BD0E1C 
X-CRM114-Status: GOOD (  12.80  )
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
---
 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
new file mode 100644
index 000000000000..040dabe905e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
@@ -0,0 +1,125 @@
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
+description: |+
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
+  dma-coherent: true
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
+        dma-coherent;
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
