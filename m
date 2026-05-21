Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA43CD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=To9xE76ni6GqW70zwk0tPOPVMHkjtIN/Qp1PjCSlmcw=; b=B5mSCIFwQdtlxu
	FuHBxLE0AhKKczWnYKXirdjCEZ3qaniSQBNTtwdkmrzvDjPXdO0vMIap4UXGiLBw3UfSTjyiVtiEN
	qatPj475hFeDKhrPePrwA8S5Yt8+7zOpBIRlCga5utiEEBeDcyNS7ZXiuWXaVBdOCvTcD/nRmpKMt
	WrSzyVmgOoZ52gyWoGNBM5kEFx/eRSStJciPFF71JXAaVRWMZoXW23k6xzA/JzRt6/LJ7vkpOA7tJ
	pqu7OwRDUHibp1VN4xGPCi7u4g35NAjKve3zUmNhGXLbQSqkqWeOgxE555Skq0jhpuaxbnEvyM6wq
	J5uzIjCE8uyoKLDdISXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxAF-00000006rK5-0pW0;
	Thu, 21 May 2026 06:45:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxAE-00000006rJn-065I
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 06:45:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1763C60172;
	Thu, 21 May 2026 06:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5721F000E9;
	Thu, 21 May 2026 06:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779345948;
	bh=PKZeX5HV/zolT5dzOzDHKubTE0ES07MdGGjre9Ke7EE=;
	h=From:To:Cc:Subject:Date;
	b=LJXOvR8o4coi1K+ydpa8gaQoksH5tnAugZFBVdjHkKlF70MdeDjXVXN2pHW0uLXCd
	 ZhUOMv5WfFNNarfnYM4O1eYcJp1vFscyDIXtB+EZIHnig4mus5B8dLR8MCyTNeYj7b
	 8WgznaKVMaua4Dqr/j/XYhAj35XZFUZN754iXjEg0AJOgVpPMGaeGvGN2GkrWLLTvs
	 7zhAEXAXBFq0nBg36CQ67Fa+8R7bLCEfr04Ve4oZs/u/6uddFUAChiEEPI9pUL/8E6
	 To1PVQ/q55QnrpCI+/ZxYuHHjClu7YvMO6vLmY09xbHnMoIn/KMbc+5uNEN6uuzFnN
	 jHjcVRKGTW2jA==
From: Drew Fustini <fustini@kernel.org>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Fustini <fustini@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v3] dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU
Date: Wed, 20 May 2026 23:41:18 -0700
Message-ID: <20260521064445.1740782-2-fustini@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: Nicholas Piggin <npiggin@gmail.com>

Extend the binding to cover details specific to the Tenstorrent RISC-V
IOMMU. In particular, a second register range is added which contains
M-privileged registers, e.g., PMAs and PMPs.

The RISC-V spec S-privileged registers remain in the first register
range and are compatible with "riscv,iommu" so the Linux driver does not
notice any difference, but the binding will be used by OpenSBI and
potentially other M-mode software.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Acked-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[fustini: fix dt_binding_check errors]
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
v3 changes:
- Move tenstorrent,riscv-iommu to the enum with qemu,riscv-iommu
- Move descriptions out of the allOf:
- Add minItems: 2 for tenstorrent,riscv-iommu in allOf:
- Fix reg syntax in Example 5
- Link to v2:
  https://lore.kernel.org/lkml/20260520061855.1623468-4-fustini@kernel.org/

v2 changes:
- Fix dt_binding_check errors
- Add the Acked-by: from Joerg
- Drop RFC prefix
- Link to v1:
  https://lore.kernel.org/lkml/20260310003850.3837030-1-npiggin@gmail.com/

 .../bindings/iommu/riscv,iommu.yaml           | 54 ++++++++++++++++---
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
index d4838c3b3741..0ce9f7abd120 100644
--- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
@@ -32,22 +32,34 @@ properties:
   # should be specified along with 'reg' property providing MMIO location.
   compatible:
     oneOf:
-      - items:
+      - description: Platform (non-PCIe) IOMMU implementations
+        items:
           - enum:
               - qemu,riscv-iommu
+              - tenstorrent,riscv-iommu
           - const: riscv,iommu
-      - items:
+      - description: PCIe IOMMU implementations
+        items:
           - enum:
               - pci1efd,edf1
           - const: riscv,pci-iommu
 
   reg:
-    maxItems: 1
-    description:
-      For non-PCI devices this represents base address and size of for the
-      IOMMU memory mapped registers interface.
-      For PCI IOMMU hardware implementation this should represent an address
-      of the IOMMU, as defined in the PCI Bus Binding reference.
+    minItems: 1
+    items:
+      - description:
+          For non-PCI devices, base address and size of the IOMMU memory
+          mapped registers interface. For PCI IOMMU hardware
+          implementation, an address of the IOMMU, as defined in the PCI
+          Bus Binding reference.
+      - description:
+          Region containing platform specific MMRs for machine-mode
+          configuration, such as PMA and PMP registers.
+
+  reg-names:
+    items:
+      - const: base
+      - const: machine
 
   '#iommu-cells':
     const: 1
@@ -75,6 +87,22 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - tenstorrent,riscv-iommu
+    then:
+      properties:
+        reg:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 examples:
   - |+
     /* Example 1 (IOMMU device with wired interrupts) */
@@ -145,3 +173,13 @@ examples:
             };
         };
     };
+
+  - |+
+    /* Example 5 (Tenstorrent IOMMU device with MSIs) */
+    iommu5: iommu@d2020000 {
+        compatible = "tenstorrent,riscv-iommu", "riscv,iommu";
+        reg = <0xd2020000 0x10000>, <0xaa000000 0x10000>;
+        reg-names = "base", "machine";
+        msi-parent = <&imsics_smode>;
+        #iommu-cells = <1>;
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
