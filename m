Return-Path: <SRS0=YBN+=IF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C379C433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:27:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2028065106
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2028065106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YNrNGOQp+ehJ4A/SD4IIBHOzdhhA6+rBCTnDdht4h5Q=; b=JkrM52/gdBqdOIygJEQwhbTcl
	NEJw2Z7dxkj+kZ3rkABbfqYjJpA/mjRPHJ6jUAK7J6JphV8RH5d7ZB/WZrUXOwnkbAewxIAgY6/x3
	CW0V6rsSwTr2oNnrfNlZYEtA30JBROBd6yle+mSpBXyIwlS4VLVaq5ke0JTpiqEsCr/zPaaNu61WW
	R/vAt6H4cVECr7e2eQsTYsLE3JImSBe2jbB+NU1AfKk/m5BNwnFV7/fiJ2DNkYIeOqL8MEitWtbO3
	gXvPBf45mcIxCC1MFHQydNJO1AWSq14uJajj2JnyI4QIN74tRWygpGeirOPDduSv/VtHcqg+Wx6K0
	Ha0CIabAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIvJ4-00AgcX-MY; Sun, 07 Mar 2021 15:26:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIvIB-00AgAJ-L7; Sun, 07 Mar 2021 15:26:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C4BD65109;
 Sun,  7 Mar 2021 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615130762;
 bh=kKpYLvtemizOmTFf3yZ6ZojtYaTrl8A4pixvYlJHA4w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=XkVyvjgXI2y8fT/zU8BF88g/czyD5u/SzGKp5yUwTE/lErDEN9+1wfQoNzcgseM0e
 ZVeEmODt3rEmd8xN9y63sW2QwgDEikvp2KYB7lCmd4NPymE1bpPbmVU4YuVr7mkPvC
 evlaQXhu+zyK004nLE3mHUuMpQbKiLpfDDb+zlMU=
Subject: Patch "arm64: mm: Set ZONE_DMA size based on early IORT scan" has
 been added to the 5.10-stable tree
To: akpm@linux-foundation.org, anshuman.khandual@arm.com, aou@eecs.berkeley.edu,
 ardb@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com,
 frowand.list@gmail.com, gregkh@linuxfoundation.org, guohanjun@huawei.com,
 guro@fb.com, hch@lst.de, jeremy.linton@arm.com, jingxiangfeng@huawei.com,
 lenb@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.pieralisi@arm.com,
 nsaenzjulienne@suse.de, palmer@dabbelt.com, paul.walmsley@sifive.com,
 rjw@rjwysocki.net, robh+dt@kernel.org, robin.murphy@arm.com, rppt@kernel.org,
 song.bao.hua@hisilicon.com, sudeep.holla@arm.com, wangkefeng.wang@huawei.com,
 will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 07 Mar 2021 16:25:45 +0100
In-Reply-To: <20210303073319.2215839-7-jingxiangfeng@huawei.com>
Message-ID: <1615130745103152@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_152604_415444_E026A19F 
X-CRM114-Status: GOOD (  26.66  )
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


This is a note to let you know that I've just added the patch titled

    arm64: mm: Set ZONE_DMA size based on early IORT scan

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-set-zone_dma-size-based-on-early-iort-scan.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Mar  7 04:22:37 PM CET 2021
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Date: Wed, 3 Mar 2021 15:33:18 +0800
Subject: arm64: mm: Set ZONE_DMA size based on early IORT scan
To: <gregkh@linuxfoundation.org>, <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>, <nsaenzjulienne@suse.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rppt@kernel.org>, <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>, <sudeep.holla@arm.com>, <rjw@rjwysocki.net>, <lenb@kernel.org>, <song.bao.hua@hisilicon.com>, <ardb@kernel.org>, <anshuman.khandual@arm.com>, <bhelgaas@google.com>, <guro@fb.com>, <robh+dt@kernel.org>
Cc: <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, <frowand.list@gmail.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, <jingxiangfeng@huawei.com>, <wangkefeng.wang@huawei.com>, Jeremy Linton <jeremy.linton@arm.com>, Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
Message-ID: <20210303073319.2215839-7-jingxiangfeng@huawei.com>

From: Ard Biesheuvel <ardb@kernel.org>

commit 2b8652936f0ca9ca2e6c984ae76c7bfcda1b3f22 upstream

We recently introduced a 1 GB sized ZONE_DMA to cater for platforms
incorporating masters that can address less than 32 bits of DMA, in
particular the Raspberry Pi 4, which has 4 or 8 GB of DRAM, but has
peripherals that can only address up to 1 GB (and its PCIe host
bridge can only access the bottom 3 GB)

Instructing the DMA layer about these limitations is straight-forward,
even though we had to fix some issues regarding memory limits set in
the IORT for named components, and regarding the handling of ACPI _DMA
methods. However, the DMA layer also needs to be able to allocate
memory that is guaranteed to meet those DMA constraints, for bounce
buffering as well as allocating the backing for consistent mappings.

This is why the 1 GB ZONE_DMA was introduced recently. Unfortunately,
it turns out the having a 1 GB ZONE_DMA as well as a ZONE_DMA32 causes
problems with kdump, and potentially in other places where allocations
cannot cross zone boundaries. Therefore, we should avoid having two
separate DMA zones when possible.

So let's do an early scan of the IORT, and only create the ZONE_DMA
if we encounter any devices that need it. This puts the burden on
the firmware to describe such limitations in the IORT, which may be
redundant (and less precise) if _DMA methods are also being provided.
However, it should be noted that this situation is highly unusual for
arm64 ACPI machines. Also, the DMA subsystem still gives precedence to
the _DMA method if implemented, and so we will not lose the ability to
perform streaming DMA outside the ZONE_DMA if the _DMA method permits
it.

[nsaenz: unified implementation with DT's counterpart]

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Tested-by: Jeremy Linton <jeremy.linton@arm.com>
Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Acked-by: Hanjun Guo <guohanjun@huawei.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Hanjun Guo <guohanjun@huawei.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20201119175400.9995-7-nsaenzjulienne@suse.de
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/mm/init.c      |    5 +++-
 drivers/acpi/arm64/iort.c |   55 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi_iort.h |    4 +++
 3 files changed, 63 insertions(+), 1 deletion(-)

--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -29,6 +29,7 @@
 #include <linux/kexec.h>
 #include <linux/crash_dump.h>
 #include <linux/hugetlb.h>
+#include <linux/acpi_iort.h>
 
 #include <asm/boot.h>
 #include <asm/fixmap.h>
@@ -186,11 +187,13 @@ static phys_addr_t __init max_zone_phys(
 static void __init zone_sizes_init(unsigned long min, unsigned long max)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
+	unsigned int __maybe_unused acpi_zone_dma_bits;
 	unsigned int __maybe_unused dt_zone_dma_bits;
 
 #ifdef CONFIG_ZONE_DMA
+	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
 	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
-	zone_dma_bits = min(32U, dt_zone_dma_bits);
+	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
 	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
 	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
 #endif
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1730,3 +1730,58 @@ void __init acpi_iort_init(void)
 
 	iort_init_platform_devices();
 }
+
+#ifdef CONFIG_ZONE_DMA
+/*
+ * Extract the highest CPU physical address accessible to all DMA masters in
+ * the system. PHYS_ADDR_MAX is returned when no constrained device is found.
+ */
+phys_addr_t __init acpi_iort_dma_get_max_cpu_address(void)
+{
+	phys_addr_t limit = PHYS_ADDR_MAX;
+	struct acpi_iort_node *node, *end;
+	struct acpi_table_iort *iort;
+	acpi_status status;
+	int i;
+
+	if (acpi_disabled)
+		return limit;
+
+	status = acpi_get_table(ACPI_SIG_IORT, 0,
+				(struct acpi_table_header **)&iort);
+	if (ACPI_FAILURE(status))
+		return limit;
+
+	node = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->node_offset);
+	end = ACPI_ADD_PTR(struct acpi_iort_node, iort, iort->header.length);
+
+	for (i = 0; i < iort->node_count; i++) {
+		if (node >= end)
+			break;
+
+		switch (node->type) {
+			struct acpi_iort_named_component *ncomp;
+			struct acpi_iort_root_complex *rc;
+			phys_addr_t local_limit;
+
+		case ACPI_IORT_NODE_NAMED_COMPONENT:
+			ncomp = (struct acpi_iort_named_component *)node->node_data;
+			local_limit = DMA_BIT_MASK(ncomp->memory_address_limit);
+			limit = min_not_zero(limit, local_limit);
+			break;
+
+		case ACPI_IORT_NODE_PCI_ROOT_COMPLEX:
+			if (node->revision < 1)
+				break;
+
+			rc = (struct acpi_iort_root_complex *)node->node_data;
+			local_limit = DMA_BIT_MASK(rc->memory_address_limit);
+			limit = min_not_zero(limit, local_limit);
+			break;
+		}
+		node = ACPI_ADD_PTR(struct acpi_iort_node, node, node->length);
+	}
+	acpi_put_table(&iort->header);
+	return limit;
+}
+#endif
--- a/include/linux/acpi_iort.h
+++ b/include/linux/acpi_iort.h
@@ -38,6 +38,7 @@ void iort_dma_setup(struct device *dev,
 const struct iommu_ops *iort_iommu_configure_id(struct device *dev,
 						const u32 *id_in);
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
+phys_addr_t acpi_iort_dma_get_max_cpu_address(void);
 #else
 static inline void acpi_iort_init(void) { }
 static inline u32 iort_msi_map_id(struct device *dev, u32 id)
@@ -55,6 +56,9 @@ static inline const struct iommu_ops *io
 static inline
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 { return 0; }
+
+static inline phys_addr_t acpi_iort_dma_get_max_cpu_address(void)
+{ return PHYS_ADDR_MAX; }
 #endif
 
 #endif /* __ACPI_IORT_H__ */


Patches currently in stable-queue which might be from jingxiangfeng@huawei.com are

queue-5.10/of-unittest-add-test-for-of_dma_get_max_cpu_address.patch
queue-5.10/mm-remove-examples-from-enum-zone_type-comment.patch
queue-5.10/arm64-mm-set-zone_dma-size-based-on-devicetree-s-dma-ranges.patch
queue-5.10/of-address-introduce-of_dma_get_max_cpu_address.patch
queue-5.10/arm64-mm-move-zone_dma_bits-initialization-into-zone_sizes_init.patch
queue-5.10/arm64-mm-set-zone_dma-size-based-on-early-iort-scan.patch
queue-5.10/arm64-mm-move-reserve_crashkernel-into-mem_init.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
