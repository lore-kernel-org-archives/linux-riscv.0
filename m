Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EBCC531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=27Y9kS/TFYNCTYW28LbnoE7cXU4CUFuZrRyz1iWK1i8=; b=VTeLF0F75fmOHp
	xB4IB5VYlS0oFRdZ7YXwkel4BoLF/Wqv0uIJms+pAYic9aSteahUt10NINcJBjIInVt3PCZ9R3eRk
	G7PCizKiY/KcK4rHCTUab830sHnGEJXW9NMwlsIe+Gcga9gtRroGPmouGPYX2/FmBxh92SYqAIk6N
	BJar30/7msLYohWuuiDl96dw6eWFY0rdttybjvMwEvyM55yodFd9OZ7xR8e2PcdgYMXfZlZcpC1CX
	CGaIr3IztCxIIZ7pO+N8k99CuM5n0k4qpGDkYDXixZ6MLCkvBUQ/wDSgrWKfvmpzgIdcxsP5Z++Uj
	lmG9kjuyHdV2wGNpRmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGOT-00000002CYW-2sNv;
	Mon, 27 Jul 2026 08:09:01 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGOQ-00000002CY9-2qZ2
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 08:09:00 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785139734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7xDoYUQQrqgSmyBq5cPOteAv+xPqMMmNOL5quTbaIi0=;
	b=ixg1gFlydPE4HQkEWlRcqQesn14KvH3EjD1LmRQb0+8FzR72/PnlLXHfiuSkT/+sxWamsC
	/z1s8M13aj6YAeVZpb/6UpPTJ4OQCYdr9iSANKegqB6PGg4kc0xhRGJJK+ehf6me4cOgpt
	1oXSBUQkMQNeGKelBgmM/krCpFescKU=
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 27 Jul 2026 01:08:44 -0700
Subject: [PATCH v3] riscv: mm: fix SWIOTLB initialization for systems with
 DRAM above 4GB
MIME-Version: 1.0
Message-Id: <20260727-fix-riscv-swiotlb-v3-1-59479b23736c@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQ6CMAwG4FcxOztDB0LmyfcwHmDtpAkBs+HEE
 N7dwkUPxuPf/v06q0iBKarTblaBEkceegn5fqdcW/c30oySlclMmeU5aM+TDhxd0vHJw9g1uvT
 gjGwrQFBydw8kpc28XCW3HMchvLYXCdbpPy2BBl0ViEcqG8o8nDvuH9MBKalVS+YjFMb+EowIv
 rYWPXpnC/wWlmV5AyXG7930AAAA
X-Change-ID: 20260331-fix-riscv-swiotlb-6f1c226071d1
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3904;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=d7gTwCoPwPfcoZi3uWkuu+0JYhJ8EhXmSro86B6X65s=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnpQryre06rX5u5uSnXjNcgsH2S8oE9H+r8nxpVWCcdr
 bDo61vfUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMBH+2YwMt/ZfPvH2V/WkDNdn
 rtHCMyvqSuJOn1DQP37r08J1HLyTORkZJna0zTwhyGM0Rzft8VfFiuWPk7b/tJqX8ZznblhbjpU
 uKwA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_010859_262766_3F211303 
X-CRM114-Status: GOOD (  15.16  )
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
For non-coherent DMA, kmalloc() buffers whose sizes are not
cache-line-aligned still require bouncing, even if 32-bit DMA bouncing
is skipped. Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to
allocating from low memory, which fails completely when DRAM only exists
in high memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator
is permitted to allocate this bounce buffer from high memory.

With this patch, systems with non-coherent DMA and DRAM entirely above
4GB can successfully map the software IO TLB in high memory and boot
normally.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Changes in v3:
- clarify when kmalloc() buffers require bouncing for non-coherent DMA
- Link to v2: https://patch.msgid.link/20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev

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
 arch/riscv/mm/init.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..7459e1fdb04a 100644
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
@@ -176,17 +178,22 @@ void __init arch_mm_preinit(void)
 	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
 	    dma_cache_alignment != 1) {
 		/*
-		 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
-		 * buffer per 1GB of RAM for kmalloc() bouncing on
-		 * non-coherent platforms.
+		 * No 32-bit DMA bouncing needed (either all DRAM is within
+		 * the 32-bit limit, or it all starts above it), but
+		 * kmalloc() buffers whose sizes are not cache-line-aligned
+		 * still require bouncing for non-coherent DMA.  Use
+		 * SWIOTLB_ANY so that the buffer can be allocated from high
+		 * memory when DRAM starts above dma32_phys_limit.  Allocate
+		 * ~1 MB per 1 GB of RAM.
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
