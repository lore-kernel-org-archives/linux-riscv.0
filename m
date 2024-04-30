Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB84C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HDcPHOv8zbTT/lHwOd/3bonJ2mbejwOEN/TqBo4MzI=; b=df7wTddnrsxy+a
	lFkOhnPMjIKUneDRSGxPfzPPTp6Uwv7/SoEL/DyAm4xSEYA+xvg+sHALVCEOQLsRYoOeOwIXl07zT
	pZv2K1d/qj4LmWJVWVl131yBQJEzJmsuz2iXQdbxnolhgy9IhDVLdfBcbkymduiV4unmvOWPGVfLp
	iUP2LkL8YNe8OkqmgO35UHvlzHhS6jOYs8QB4ZSlzzdceVoWEBkvvK+q4VHhIbtjSfEGSqNdw5JY1
	Jpl2WoPTnRaNUgmIjhD4sqsEx/sV1Dl/XGkx/EjfwfI/1qUG4aJt4HZIRzrlH5mWgLf/+Qew/OmEe
	FavZIad7f05w+YgskJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tgd-00000007n3H-38Oe;
	Tue, 30 Apr 2024 20:02:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tgZ-00000007n0w-0RPN
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 20:02:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e3ca546d40so52626975ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 13:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714507360; x=1715112160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woNMMspCQ7rRLAuMwQ/hkraoq5PRvRPYoGmq6YIz3FM=;
        b=BrWVE7zARWJYvEMap6F1CshBeqSiaATwWQAvv/x1a13zXTm6PMVJg0P13O0f1i3kF6
         BsdKYboi+umUUjLUZhI0daZkvN1V4vmWNV9IawaJrKWeCIK+s/Deo28k0Ac1vRWmMoXZ
         XvQwbXCCzUq+TUXmIHBK54vcUl/x+y9OGTMDJc/olCDXDU3kI0D84KcL9xA8sFQ5ryJK
         ZREEifcriVDxFNECqOAhY8f+C9VlVr6rDbF4ThSpKQg1MYinyXRwK+65xk52U/gshMD9
         wuAkhmPyqw6oXPe/ocAFMKHCnlVSFzc7MOXa5YatzrintBHIfltcteptYkcBOuriPrTu
         7mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714507360; x=1715112160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woNMMspCQ7rRLAuMwQ/hkraoq5PRvRPYoGmq6YIz3FM=;
        b=oUd97e82gLnn+dxEWIi5stHTzZffej3jIwzviZaiujPUeCMd5kLt/3o1EbomveL0bt
         Pgme6/3ztEoK8FbTWoTTkg7CGqGgfk4rh+baD+s4So1TpTMiyGhLAoYqUbz/XISsqGd+
         5deR8/h4ksuG8YLTrVGHGpbWyU8zfDhlHFej7kPIBS8vjH1EFE45rpPAc83BUWzUq/KD
         LfzqR3+KeqDMihEYU720SPWd3Ni8wfGxkb++R5dhlxS7zNcFa0lnBvcfDeamdlxONVt+
         e16kg6c2+HyJMml9ER/neWQOHRSaXTFm8AuCScg6Oq+e80IuIiw+53o+4+wLBGQGNM9q
         /0uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXO9zWMePVuZGsKgTjS988Ghkw/TUSD9fa/NH5V7a3Rn8TwXu8/9ZB8g7mYnNZYQ09DwcaygkOxa1rw7joVfjAlbNzpfvRQBQY4b34DJVF
X-Gm-Message-State: AOJu0YwUFfSdPdB9/UmcX9FJ7jG5scjhaHibywrKtM0Rl51vp5qyVTaq
	PRGUQ6aws5EWKy/f/cGVsehkIdS2F+C6HBDv3Pl8LC2AHpdfnfSjEG1Q/CMIzV8=
X-Google-Smtp-Source: AGHT+IFZ63r+P6/V/33l9FMPPZpUMxheVkxSIDjtaaDzMEyOzTm5XZvYGbPNkVeL1VzXOV2KHMaUiA==
X-Received: by 2002:a17:903:2444:b0:1eb:3dad:aced with SMTP id l4-20020a170903244400b001eb3dadacedmr531681pls.11.1714507360233;
        Tue, 30 Apr 2024 13:02:40 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001e435fa2521sm22809820pll.249.2024.04.30.13.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 13:02:39 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 1/7] dt-bindings: iommu: riscv: Add bindings for RISC-V IOMMU
Date: Tue, 30 Apr 2024 13:01:51 -0700
Message-Id: <ef946892252b18f541986a461fc4d37957cc805e.1714494653.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714494653.git.tjeznach@rivosinc.com>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_130243_173567_6CD93522 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add bindings for the RISC-V IOMMU device drivers.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 .../bindings/iommu/riscv,iommu.yaml           | 150 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
new file mode 100644
index 000000000000..16817525e157
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/riscv,iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V IOMMU Architecture Implementation
+
+maintainers:
+  - Tomasz Jeznach <tjeznach@rivosinc.com>
+
+description: |
+  The RISC-V IOMMU provides memory address translation and isolation for
+  input and output devices, supporting per-device translation context,
+  shared process address spaces including the ATS and PRI components of
+  the PCIe specification, two stage address translation and MSI remapping.
+  It supports identical translation table format to the RISC-V address
+  translation tables with page level access and protection attributes.
+  Hardware uses in-memory command and fault reporting queues with wired
+  interrupt or MSI notifications.
+
+  Visit https://github.com/riscv-non-isa/riscv-iommu for more details.
+
+  For information on assigning RISC-V IOMMU to its peripheral devices,
+  see generic IOMMU bindings.
+
+properties:
+  # For PCIe IOMMU hardware compatible property should contain the vendor
+  # and device ID according to the PCI Bus Binding specification.
+  # Since PCI provides built-in identification methods, compatible is not
+  # actually required. For non-PCIe hardware implementations 'riscv,iommu'
+  # should be specified along with 'reg' property providing MMIO location.
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qemu,iommu
+          - const: riscv,iommu
+      - items:
+          - enum:
+              - pci1efd,edf1
+          - const: riscv,pci-iommu
+
+  reg:
+    maxItems: 1
+    description:
+      For non-PCI devices this represents base address and size of for the
+      IOMMU memory mapped registers interface.
+      For PCI IOMMU hardware implementation this should represent an address
+      of the IOMMU, as defined in the PCI Bus Binding reference. The reg
+      property is a five-cell address encoded as (phys.hi phys.mid phys.lo
+      size.hi size.lo), where phys.hi should contain the device's BDF as
+      0b00000000 bbbbbbbb dddddfff 00000000. The other cells should be zero.
+
+  '#iommu-cells':
+    const: 1
+    description:
+      Has to be one. The single cell describes the requester id emitted
+      by a master to the IOMMU.
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description:
+      Wired interrupt vectors available for RISC-V IOMMU to notify the
+      RISC-V HARTS. The cause to interrupt vector is software defined
+      using IVEC IOMMU register.
+
+  msi-parent: true
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#iommu-cells'
+
+additionalProperties: false
+
+examples:
+  - |+
+    /* Example 1 (IOMMU device with wired interrupts) */
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    iommu1: iommu@1bccd000 {
+        compatible = "qemu,iommu", "riscv,iommu";
+        reg = <0x1bccd000 0x1000>;
+        interrupt-parent = <&aplic_smode>;
+        interrupts = <32 IRQ_TYPE_LEVEL_HIGH>,
+                     <33 IRQ_TYPE_LEVEL_HIGH>,
+                     <34 IRQ_TYPE_LEVEL_HIGH>,
+                     <35 IRQ_TYPE_LEVEL_HIGH>;
+        #iommu-cells = <1>;
+    };
+
+    /* Device with two IOMMU device IDs, 0 and 7 */
+    master1 {
+        iommus = <&iommu1 0>, <&iommu1 7>;
+    };
+
+  - |+
+    /* Example 2 (IOMMU device with shared wired interrupt) */
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    iommu2: iommu@1bccd000 {
+        compatible = "qemu,iommu", "riscv,iommu";
+        reg = <0x1bccd000 0x1000>;
+        interrupt-parent = <&aplic_smode>;
+        interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
+        #iommu-cells = <1>;
+    };
+
+  - |+
+    /* Example 3 (IOMMU device with MSIs) */
+    iommu3: iommu@1bcdd000 {
+        compatible = "qemu,iommu", "riscv,iommu";
+        reg = <0x1bccd000 0x1000>;
+        msi-parent = <&imsics_smode>;
+        #iommu-cells = <1>;
+    };
+
+  - |+
+    /* Example 4 (IOMMU PCIe device with MSIs) */
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@30000000 {
+            device_type = "pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            reg = <0x0 0x30000000  0x0 0x1000000>;
+            ranges = <0x02000000 0x0 0x41000000  0x0 0x41000000  0x0 0x0f000000>;
+
+            /*
+             * The IOMMU manages all functions in this PCI domain except
+             * itself. Omit BDF 00:01.0.
+             */
+            iommu-map = <0x0 &iommu0 0x0 0x8
+                         0x9 &iommu0 0x9 0xfff7>;
+
+            /* The IOMMU programming interface uses slot 00:01.0 */
+            iommu0: iommu@1,0 {
+               compatible = "pci1efd,edf1", "riscv,pci-iommu";
+               reg = <0x800 0 0 0 0>;
+               #iommu-cells = <1>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f6dc90559341..7fcf7c27ef6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18958,6 +18958,13 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V IOMMU
+M:	Tomasz Jeznach <tjeznach@rivosinc.com>
+L:	iommu@lists.linux.dev
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
+
 RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
