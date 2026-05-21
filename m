Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CCFCD5BAF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Vszw8Nc2raeP/OwxAZqBLmdAU3IB0ug91+qQBnIhAw=; b=N5jsSgrVeGooAP
	G2WSXAZFm8NYt3Vc1iLBDUcnLFE4pQjo5pamPzG/fRLC+iAQL1FSDInm1Bh+gwafjdahJh9KKrYfd
	dzYQijzPAZbggKodKy6cj2eYq2QejlS+IWkwD7FXNUoLTWkKYe/eCwZefk0e69yDh7lbjE1sS9s3n
	0Mr8Tckz1kZAahe5y/+TD8WOlgNItTjxWTwDDlFMHu7Gi3Mbh1Fw1VdXEWvbLoa+4aMu/T1OZ69mT
	I+8M1ted8a3ygLf6yIq3tUR4GNnUQS9MJQbk6XRXBJc57Bhjls3lHa6NYNBbKJbEePfJ+UVwld/TB
	EoTZ56rWwiQV3+usUErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ718-00000008blJ-3B7e;
	Thu, 21 May 2026 17:17:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ717-00000008bkt-19yu
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 17:17:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AFA960098;
	Thu, 21 May 2026 17:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3FC1F000E9;
	Thu, 21 May 2026 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779383823;
	bh=TzvtaM0HFO3hTTzXz7hMDZGf1pih4p7h/VA/ScQingo=;
	h=From:To:Cc:Subject:Date;
	b=R03u+1IhglKS+fD4HrN34UdKSTml7c8/JKlusR/RqHb/FhZug2oS3UjI+ZRWX6B9a
	 7w9pbUIEUMOJV1dBfc71064/evHIVrgIwwlXgjACKIOUejQVQuVno5CToaMO/HiJKI
	 KZfhzWsDwuw23BQt1xNqPVOoHeeif76+voYUku0cVNOTaDyU1VpZhVeR4l8oP3DcVp
	 zv4zVWTN8JFVyKS1ehM7RqXoAiUsixu1AWXyeNilf23XMcruxVVdjliDOSX1Vm43uj
	 euqBlmmpBCKfVgUm0J9e3iLRrQ92bxzTKpKf0Vc0iXYtATd2i9qItrbDY/dnq+EsP9
	 ULXD7955uxeig==
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
Subject: [PATCH v4] dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU
Date: Thu, 21 May 2026 10:06:33 -0700
Message-ID: <20260521170652.1880662-2-fustini@kernel.org>
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
v4 changes:
- Add minItems: 1 to reg-names so it is legal to for platforms other
  than tenstorrent,riscv-iommu to use "base"
- Add reg-names constraints to the allOf: block
- Sashiko review:
  https://lore.kernel.org/lkml/20260521070154.9CAA41F000E9@smtp.kernel.org/
- Link to v3:
  https://lore.kernel.org/lkml/20260521064445.1740782-2-fustini@kernel.org/

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

 .../bindings/iommu/riscv,iommu.yaml           | 59 ++++++++++++++++---
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
index d4838c3b3741..f83efb3ee000 100644
--- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
@@ -32,22 +32,35 @@ properties:
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
+    minItems: 1
+    items:
+      - const: base
+      - const: machine
 
   '#iommu-cells':
     const: 1
@@ -75,6 +88,26 @@ required:
 
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
+        reg-names:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
 examples:
   - |+
     /* Example 1 (IOMMU device with wired interrupts) */
@@ -145,3 +178,13 @@ examples:
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

base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
