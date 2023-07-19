Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7F0C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 19:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gj+uY7TwAY5og1H/cPM3XtoFNn0HN16wXZvUeBzMK+4=; b=TQRC9zDn7x6s/E
	8e34HtVZHtzBaYs2Xq4dFfj9/dZRIFT5GNI8HkRHyxYXjbkigvsMjZShBNhdnVR3umJmOpi9EPJsQ
	kzC8ES5Rbb46IbyQROR1JFTjlgp9Uo+cp8iKzWDF0dZqhCSKG9cq0eY4JLNEpn8V+aPg9tHKha0PV
	wfIyJfo39rXdqQS8Nuh4X+IafLA6/bm34pnrsDxTJcStiMsIOmLtaBERjc95i+CLzI4xd2b00QxO3
	EeJNL9HY91VcylN3mGRxZyIbfpq5Afg9XVD/0RobwJHjTIUFJHRaEE/f3tJHJA7Kq/evbk+GsFej0
	yH7sHd3pw1/E0VfOqyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwR-008h5o-2j;
	Wed, 19 Jul 2023 19:34:31 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwO-008h48-34
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 19:34:30 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-78372b895d6so391519439f.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689795267; x=1690400067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdGmPDy4n8Vb9yckrY3NHJ0yplI6UyLJ02ulp/zmXZw=;
        b=HecAfKZg9Xu/PFX1+zVYZYlqqow6E/dqLCp2s59n3O/xfMNhZ1IcSBmsZ+yJK5yNZL
         N5QknaUrOuOpLSTFmj+MWb/R4/rP7abzfMWRnDK/dpQ/I6huV/G8S6SoVAYQf3jyjBYc
         ITXB1yxmxSgIKH+s1sMPFwsyhlwsCD3w0so/PM12hwEOfcikG3bfcZdbu0ypKBEuN/gu
         VP71K10oPMLxWNldnN5H5JKrGbSGgWpQLr4SMMleYtLvyes4e4RlNw7G1q4GorTf0DJt
         gAqzhs9DEql29OqfU1pSrU/R0JUUn/T1cffMhVSuj+e5CHeakg/+oKqiTz3fVOG0oVX+
         1rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689795267; x=1690400067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdGmPDy4n8Vb9yckrY3NHJ0yplI6UyLJ02ulp/zmXZw=;
        b=eLlfdOagTDfAuUQG+u9xgyKsOYt59jhXwUAY95BFHoF+1F5K2/JSL4/0cod4GYj/2X
         vIFUtnyjfw+wpp8RoWFBTJrW8bJOejtvZ1WOgHyqDqFViqayiN3Lsvo79BDJISJhPAnv
         0zBy3smKa5tqT+Lb+fgxw6Mes7SOnS6qAcos13XEHPB4wNRaSyI4Bu8cqsAu4w3OhMeK
         v+gKElqOx2K5Y1orQe1tuvUgSTtB5qkRj3tMyYFtaXrwfqrFYPcGHXv8HLFhk6C7OH7c
         NzVMjaANlPaxxeA2H9H6fqVt6D6Bp2gpDc1WTH37/JQg8RqMCar/JvY2YPiEf/UajWf4
         gosw==
X-Gm-Message-State: ABy/qLZfQjXO9coX1TieLvAIB7jD4GaLC/qKm1f93DjNZryUQ6vjmave
	lO/xr1O78g1u4RfG/2/dYlalbg==
X-Google-Smtp-Source: APBJJlGN7srrpW1Dfo4Ygw07TXS+Dfssh8mV+rp8AEjMaeoQuXFsWsSaJe/QFh3kOeDRzzfvovNgSA==
X-Received: by 2002:a05:6e02:12ed:b0:348:936b:ae12 with SMTP id l13-20020a056e0212ed00b00348936bae12mr3737637iln.11.1689795267467;
        Wed, 19 Jul 2023 12:34:27 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b00264040322desm1591053pje.40.2023.07.19.12.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:34:27 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
Date: Wed, 19 Jul 2023 12:33:47 -0700
Message-Id: <d62ceb33620cab766d809e6bbf30eaf5b46bc955.1689792825.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689792825.git.tjeznach@rivosinc.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_123429_019016_E137ECA8 
X-CRM114-Status: GOOD (  18.24  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <apatel@ventanamicro.com>

We add DT bindings document for RISC-V IOMMU platform and PCI devices
defined by the RISC-V IOMMU specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/iommu/riscv,iommu.yaml           | 146 ++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
new file mode 100644
index 000000000000..8a9aedb61768
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/riscv,iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V IOMMU Implementation
+
+maintainers:
+  - Tomasz Jeznach <tjeznach@rivosinc.com>
+
+description:
+  The RISC-V IOMMU specificaiton defines an IOMMU for RISC-V platforms
+  which can be a regular platform device or a PCI device connected to
+  the host root port.
+
+  The RISC-V IOMMU provides two stage translation, device directory table,
+  command queue and fault reporting as wired interrupt or MSIx event for
+  both PCI and platform devices.
+
+  Visit https://github.com/riscv-non-isa/riscv-iommu for more details.
+
+properties:
+  compatible:
+    oneOf:
+      - description: RISC-V IOMMU as a platform device
+        items:
+          - enum:
+              - vendor,chip-iommu
+          - const: riscv,iommu
+
+      - description: RISC-V IOMMU as a PCI device connected to root port
+        items:
+          - enum:
+              - vendor,chip-pci-iommu
+          - const: riscv,pci-iommu
+
+  reg:
+    maxItems: 1
+    description:
+      For RISC-V IOMMU as a platform device, this represents the MMIO base
+      address of registers.
+
+      For RISC-V IOMMU as a PCI device, this represents the PCI-PCI bridge
+      details as described in Documentation/devicetree/bindings/pci/pci.txt
+
+  '#iommu-cells':
+    const: 2
+    description: |
+      Each IOMMU specifier represents the base device ID and number of
+      device IDs.
+
+  interrupts:
+    minItems: 1
+    maxItems: 16
+    description:
+      The presence of this property implies that given RISC-V IOMMU uses
+      wired interrupts to notify the RISC-V HARTS (or CPUs).
+
+  msi-parent:
+    description:
+      The presence of this property implies that given RISC-V IOMMU uses
+      MSIx to notify the RISC-V HARTs (or CPUs). This property should be
+      considered only when the interrupts property is absent.
+
+  dma-coherent:
+    description:
+      Present if page table walks and DMA accessed made by the RISC-V IOMMU
+      are cache coherent with the CPU.
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
+  - |
+    /* Example 1 (IOMMU platform device with wired interrupts) */
+    immu1: iommu@1bccd000 {
+        compatible = "vendor,chip-iommu", "riscv,iommu";
+        reg = <0x1bccd000 0x1000>;
+        interrupt-parent = <&aplic_smode>;
+        interrupts = <32 4>, <33 4>, <34 4>, <35 4>;
+        #iommu-cells = <2>;
+    };
+
+    /* Device with two IOMMU device IDs, 0 and 7 */
+    master1 {
+        iommus = <&immu1 0 1>, <&immu1 7 1>;
+    };
+
+  - |
+    /* Example 2 (IOMMU platform device with MSIs) */
+    immu2: iommu@1bcdd000 {
+        compatible = "vendor,chip-iommu", "riscv,iommu";
+        reg = <0x1bccd000 0x1000>;
+        msi-parent = <&imsics_smode>;
+        #iommu-cells = <2>;
+    };
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        /* Device with IOMMU device IDs ranging from 32 to 64 */
+        master1 {
+                iommus = <&immu2 32 32>;
+        };
+
+        pcie@40000000 {
+            compatible = "pci-host-cam-generic";
+            device_type = "pci";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            bus-range = <0x0 0x1>;
+
+            /* CPU_PHYSICAL(2)  SIZE(2) */
+            reg = <0x0 0x40000000 0x0 0x1000000>;
+
+            /* BUS_ADDRESS(3)  CPU_PHYSICAL(2)  SIZE(2) */
+            ranges = <0x01000000 0x0 0x01000000  0x0 0x01000000  0x0 0x00010000>,
+                     <0x02000000 0x0 0x41000000  0x0 0x41000000  0x0 0x3f000000>;
+
+            #interrupt-cells = <0x1>;
+
+            /* PCI_DEVICE(3)  INT#(1)  CONTROLLER(PHANDLE)  CONTROLLER_DATA(2) */
+            interrupt-map = <   0x0 0x0 0x0  0x1  &aplic_smode  0x4 0x1>,
+                            < 0x800 0x0 0x0  0x1  &aplic_smode  0x5 0x1>,
+                            <0x1000 0x0 0x0  0x1  &aplic_smode  0x6 0x1>,
+                            <0x1800 0x0 0x0  0x1  &aplic_smode  0x7 0x1>;
+
+            /* PCI_DEVICE(3)  INT#(1) */
+            interrupt-map-mask = <0xf800 0x0 0x0  0x7>;
+
+            msi-parent = <&imsics_smode>;
+
+            /* Devices with bus number 0-127 are mastered via immu2 */
+            iommu-map = <0x0000 &immu2 0x0000 0x8000>;
+        };
+    };
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
