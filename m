Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1380FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qbHUKax+SKphOFahR4cH/A3lBFAMKe1nqKQWARcCYAk=; b=qqaZdFSONzuVU5
	YY/AnvoXHxGnMWQuP14iONhFYWPrTrN3EOxM7GIl0XbsIxGIjAfTYRp//IkNUx2ccj/SooRP4GcS2
	vxjSwqrrXb36VaTMlpxPNdxEAfgwX85wkn4cXL3KcKQMmCWLCua49nxcThvMsCXexvISCUGqbpNUC
	/+iBmIV0ACeLCPjOyTvNhVzvX9B92O3TxJIzu77IFslFJ/C8CE+iGl0Za39zEsLkXsuGhoPjdHCof
	rx0vXlTzeoP13kwX9PQduGRq+gwm+jWJ5wQ/4OdU2+ZbUT5eqmBsWTS6lkXfUlT0bshBScVZ/fjVS
	/LQAJFpopQjWd0YIywxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3Is-00000003X3i-1yr4;
	Wed, 29 Apr 2026 11:42:06 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3Ip-00000003X3M-2Luz
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 11:42:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777462918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GPJm3sEDi+yLYep1uNFqjUTb7xnUW7h1YI4IHlBEE9A=;
	b=ZLR7iZj0K26awfhmiYwMY3jdzXEftXbwJFufCUNokyxv4pIyc6TiQTnQEVakZ7DYPBpwG2
	AkoYGLj8iW3zFPpvpzJpYlcrakM93D+Q7oPYQTjvt4ZtHOLeU2qtvgzWcKFoqycspGv2C1
	Cpc4pCrRved5ORSL5f4QenNdJpE+je4=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 29 Apr 2026 19:41:54 +0800
Subject: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems with
 DRAM above 4GB
MIME-Version: 1.0
Message-Id: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NSw6CMBCGr0Jm7ZhO0ZK48h6GhbRTmYQU02LFk
 N7dygFcfv9zg8RROMGl2SByliRzqKAPDdjxHh6M4iqDVtqotiX0smKUZDOmt8zLNKDxZHV1O3I
 EtfeMXEP75q2vPEpa5vjZLzL91H9rmZCwOzl3ZjOw8nSdJLzWo+MMfSnlC7cVeRuyAAAA
X-Change-ID: 20260331-fix-riscv-swiotlb-6f1c226071d1
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777462914; l=3691;
 i=troy.mitchell@linux.dev; s=20250710; h=from:subject:message-id;
 bh=bafFysWjidk0j+U1lcIQcads9zqSwlOazz/9oT8sonU=;
 b=cWivkeobwrrx4WGc+ZozF2JfvEG2T7f/k1HBRicjJ325UNdffUI5K6iD6iSYdOEMfh0mfE5bg
 KCxOVX7qCJkCEm8qWAOQNTmrQq2N7JDk91TMG8rV+v7Y/CKP0wapOJO
X-Developer-Key: i=troy.mitchell@linux.dev; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_044203_781083_FBA47807 
X-CRM114-Status: GOOD (  15.45  )
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

On RISC-V platforms where the entire physical memory (DRAM) resides
above the 32-bit address space (i.e., above dma32_phys_limit), the
current SWIOTLB initialization logic fails.

This patch addresses two interconnected issues on such platforms:

1. Incorrect 32-bit DMA bounce assumption:
The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
that a 32-bit DMA bounce buffer is required simply because the maximum
PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
no memory exists below the limit to satisfy this allocation. Fix
this by adding a check to ensure `memblock_start_of_DRAM()` is actually
below the 32-bit limit before enforcing 32-bit SWIOTLB.

2. kmalloc() bounce buffer allocation failure on non-coherent systems:
For non-coherent hardware, a bounce buffer is still mandatory for
cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to allocating
from low memory, which fails completely when DRAM only exists in high
memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator is
permitted to allocate this alignment buffer from high memory.

With this patch, systems with non-coherent DMA and DRAM entirely above
4GB can successfully map the software IO TLB in high memory and boot
normally.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Changes in v2:
- add Anirudh's TB tag
- Link to v1: https://lore.kernel.org/r/20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev

To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/mm/init.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..3244e4fba89c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -168,7 +168,9 @@ static void print_vm_layout(void) { }
 
 void __init arch_mm_preinit(void)
 {
-	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit);
+	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit) &&
+		       memblock_start_of_DRAM() < dma32_phys_limit;
+	unsigned int swiotlb_flags = SWIOTLB_VERBOSE;
 #ifdef CONFIG_FLATMEM
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
@@ -176,17 +178,21 @@ void __init arch_mm_preinit(void)
 	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
 	    dma_cache_alignment != 1) {
 		/*
-		 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
-		 * buffer per 1GB of RAM for kmalloc() bouncing on
-		 * non-coherent platforms.
+		 * No 32-bit DMA bouncing needed (either all DRAM is within
+		 * the 32-bit limit, or it all starts above it), but
+		 * non-coherent hardware still requires cache-line-aligned
+		 * bounce buffers for kmalloc().  Use SWIOTLB_ANY so that the
+		 * buffer can be allocated from high memory when DRAM starts
+		 * above dma32_phys_limit.  Allocate ~1 MB per 1 GB of RAM.
 		 */
 		unsigned long size =
 			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
 		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
 		swiotlb = true;
+		swiotlb_flags |= SWIOTLB_ANY;
 	}
 
-	swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
+	swiotlb_init(swiotlb, swiotlb_flags);
 
 	print_vm_layout();
 }

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260331-fix-riscv-swiotlb-6f1c226071d1

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
