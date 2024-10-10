Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE79D2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taDhw+InG/DHuKklQ2XBAQGZoewV3QFEGOrssEAypUE=; b=si3Rjv0MLHSiWR
	PGUyQS86DJDMYDe6kfOfST/ZrjvxSMLS4yyblKfes9nk+xgGYpTYDj/VOVXEmUcg0BnRCMKH/4aji
	qLXga6MR2CUPgynqStTwXy6fR9T+geKpKZtBhWNegDSOsgSjkUMZOmByHa9D6nYGz6awUUsZMufjJ
	rwATJ2ZN9i0dt9Fep7+3EOQFFbjY5ihwQHmIKJXLk6rJECtUBICT+f78ndqcRn1Ru4fRoCRtm2tma
	MbkkI0B+iAoBpMFzbfpk7DEr5F3usJVATcUjIOnwbpDMVgPKLPphn8FpaMgT4avC/Xo/wom+y0lKs
	SblEfDw/2liNwcMS7ZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzxd-0000000EIM7-0u6b;
	Thu, 10 Oct 2024 20:40:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz9K-0000000EBhd-2KmM
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Oct 2024 19:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v5xid5eYrdu+scPSzIVukKQMRzibQ5L681G//KIqVXs=; b=ren1mpoKvA/6UARO0DUVBlDat9
	AVSIPUPX3duXCSFjYzcXm5HpCsGpFdAb3QlEpluOmnQbc2lXo1HuvCEBUjPPUaxv/ydhTukra4Fwj
	5YzsjiwS2ss3saaYSerLxG1EemHRP+DlFunw1+mdwIgTTkIR7WWkDnEtTd/0zB2BB8ZMApKbVH+bg
	86gXFRzCSwhEDrN63dwIisHhTVyCmA5d3OWlyMezSzHqaSDeH5yo7Iz7Bo5TkYHT8en08i6Xaaidp
	sDjo/cg7Nq+nLobI+O48/mCx2p3KHf2T0vhYk8/opyDpM8g98HEAzIYy+XbHDcGaZ2CrlSiPuJLDe
	Mm8Rt56w==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syz9E-00000005asm-11hz
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 19:48:36 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71dff3b3c66so916882b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728589709; x=1729194509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5xid5eYrdu+scPSzIVukKQMRzibQ5L681G//KIqVXs=;
        b=rratPBhBcGbhqVuUQpCfNn14LGPiZ1T6up4vrhGGRu4DRpVv7yQbjNXkF2wKlmxEBL
         Wr2RpmmtD0t8rGy+IDXF13HzV6NEO3mvq0n6oFYXzxpSsmB++yAOyG1SOVuOYZAjE4m7
         qhruRo5Wb/wRToohmM70n+5TLp8/hIzHlhKkVIWbfGc1a7WRWoEYbpB5m8+q8CYS9OFz
         tzhv/x12t6dVkpQLG396b258mxQmaCdzDrFpH3uF4srfYwcIXMb4183Wbox8ApbNqkEp
         dIAqOeBRMtozMGqlVbA8qsVWnWlnQebbSpTzrr2tr3LESAtbk37vxUqBhaAmX3XFVCba
         KjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589709; x=1729194509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5xid5eYrdu+scPSzIVukKQMRzibQ5L681G//KIqVXs=;
        b=TL6xbV17WrwmcFUOos+SuxiezRmBn7ex9Rtdjuo8Iem9YlDXa4q55vG8eYKOr2JYHy
         b3l4uc5zT1Ur3SsyqpeCDw6Mhw5q4z0Mj5IN58G92ZvvxHLy9/Cb3xekZIDWhH43soJW
         VztDbCeDmPQeJ19GVqXA2tZ7HSizUYO/unqrj1TGmigaKw9k7xL5uPdKL562O6nVMrmj
         a5+8/8IgZaULd5GjKLEFwnvBQBn7tpaueKbFXp/mZr3BycNVdPK4oO02DvHHR11K8DV0
         Pp5nwpRO+ur43TcHB3IgpgcqPE3/BtUdOVNqGKpDSQrATUlWtfNwWttqqhJI6uPPNghc
         9Z8A==
X-Forwarded-Encrypted: i=1; AJvYcCVBFJcb0P5LXpdbJijWzPndYsfjk0FF2Z4lpFBTK5EZNEWJwZCe9wuvI81Axwn+NgNC+L5i0DwOeWSeCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVo1e5u2o3cprQSVOSdwKFvakY6b7wlYazVWXD0oDwhwcsugf5
	j3F+tqKoRpUdhl8YW140WFFjkx5eBIkBtrhx/ZeyhTidJ7EYgfcCiBiElxd5TaY=
X-Google-Smtp-Source: AGHT+IEJdL5WnShTAnYbQhRjzJ2xY9oIXG5WsKDJkfLl5/eAhlWdDaXpUXot+smDcSpiSw02k8Mqog==
X-Received: by 2002:a05:6a20:c888:b0:1d0:3a32:c3f8 with SMTP id adf61e73a8af0-1d8bcfaa0ffmr131437637.39.1728589709534;
        Thu, 10 Oct 2024 12:48:29 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2e6ef1ad0sm749135a91.49.2024.10.10.12.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:48:29 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v9 1/7] dt-bindings: iommu: riscv: Add bindings for RISC-V IOMMU
Date: Thu, 10 Oct 2024 12:48:04 -0700
Message-Id: <b9135dcc5227ef428d7566e178ab2d282a633c48.1728579958.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728579958.git.tjeznach@rivosinc.com>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_204834_391059_B60ED651 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add bindings for the RISC-V IOMMU device drivers.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 .../bindings/iommu/riscv,iommu.yaml           | 147 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 2 files changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
new file mode 100644
index 000000000000..5d015eeb06d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
@@ -0,0 +1,147 @@
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
+              - qemu,riscv-iommu
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
+      of the IOMMU, as defined in the PCI Bus Binding reference.
+
+  '#iommu-cells':
+    const: 1
+    description:
+      The single cell describes the requester id emitted by a master to the
+      IOMMU.
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
+        compatible = "qemu,riscv-iommu", "riscv,iommu";
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
+        compatible = "qemu,riscv-iommu", "riscv,iommu";
+        reg = <0x1bccd000 0x1000>;
+        interrupt-parent = <&aplic_smode>;
+        interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
+        #iommu-cells = <1>;
+    };
+
+  - |+
+    /* Example 3 (IOMMU device with MSIs) */
+    iommu3: iommu@1bcdd000 {
+        compatible = "qemu,riscv-iommu", "riscv,iommu";
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
+            iommu-map = <0x0 &iommu0 0x0 0x8>,
+                        <0x9 &iommu0 0x9 0xfff7>;
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
index a097afd76ded..839554c5ff06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19885,6 +19885,13 @@ F:	arch/riscv/
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
