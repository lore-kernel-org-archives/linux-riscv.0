Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BA6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDcXJBdaAYYOdF8TGr0gkF9Ii9lZsutbQZhUc6xmV5Q=; b=XbEYWUv1oWfyTP
	XOho9gX9D2/anMY2LRzlYrNBW14YfPtXqLfAVLeLm3m7h4TLi6Y+fvDs+WOT/QhIZ5845D7Heyb2f
	v5rsQwAfFrXYbf8Umw/LPH/5Ipsd8GlaUKmNB5uWRaCYbXkhc4ItJPQqT7gfCjYZZD8c/Q9/IBbqO
	UNgcrIj/5vZDqzUWK+rRZzHzeMV6XW5zgs7REvgBv/JMnmLPtKxDqyyeYFM1ok1ykBGPe/V5xUGNb
	LyByTCGj5Hcn3uLpj1aLCOH6htlTQ3ertvMfjL6eI9byK24H3vMrefFiSjSQp15siKOm9EeuqUSfq
	VmNjDePDQDDzRrl1U8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFec-004Q0l-6W; Mon, 06 Dec 2021 15:11:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFe3-004PnQ-77
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 15:11:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66A5661350;
 Mon,  6 Dec 2021 15:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89399C341C7;
 Mon,  6 Dec 2021 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638803470;
 bh=PMuqe3y8e62TGMx9fT9SI7a0texE/fpdhxmGzV4QNBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=adb9B8P7wG+P4wrqu85rqV3GqjOBN8bzPVgty4k6NmTXbBHxMV9CQaR3HT1c+L9g2
 FExw9UOrsJz9gL9MWTPkfliKJQyC51LMWZwCSR9eotpseIT6FS5mWeMPfXEPCDF/vx
 lrU75KGKtHjSuxYFJ2HPJeGOYH7U0CLMDKEL9o91BL3HuNa8opE42mj1moMN1x+FKR
 Y/cabVcsmWcODaqMCbcwXlKkPZ/dZ1Rg+iaXp/kjk/ojSFj9ZdXa6MIiAisYG2YW3l
 TxXVrHUHofZ1M4+dmn3inRZLcB3hEnuzX47njpV3XBW8tPrNeXS/VRPx1aOE6D/3hy
 10TMMYcFxfJMg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] riscv: mm: init: try best to use
 IS_ENABLED(CONFIG_64BIT) instead of #ifdef
Date: Mon,  6 Dec 2021 23:03:50 +0800
Message-Id: <20211206150353.731-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206150353.731-1-jszhang@kernel.org>
References: <20211206150353.731-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_071111_451762_378F8477 
X-CRM114-Status: GOOD (  19.41  )
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

Try our best to replace the conditional compilation using
"#ifdef CONFIG_64BIT" by a check for "IS_ENABLED(CONFIG_64BIT)", to
simplify the code and to increase compile coverage.

Now we can also remove the __maybe_unused used in max_mapped_addr
declaration.

We also remove the BUG_ON check of mapping the last 4K bytes of the
addressable memory since this is always true for every kernel actually.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 43 ++++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 745f26a3b02e..4edf5600bea9 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -102,10 +102,9 @@ static void __init print_vm_layout(void)
 		  (unsigned long)VMALLOC_END);
 	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
 		  (unsigned long)high_memory);
-#ifdef CONFIG_64BIT
-	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
-		  (unsigned long)ADDRESS_SPACE_END);
-#endif
+	if (IS_ENABLED(CONFIG_64BIT))
+		print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
+			  (unsigned long)ADDRESS_SPACE_END);
 }
 #else
 static void print_vm_layout(void) { }
@@ -163,7 +162,7 @@ static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
-	phys_addr_t __maybe_unused max_mapped_addr;
+	phys_addr_t max_mapped_addr;
 	phys_addr_t phys_ram_end;
 
 #ifdef CONFIG_XIP_KERNEL
@@ -172,17 +171,16 @@ static void __init setup_bootmem(void)
 
 	memblock_enforce_memory_limit(memory_limit);
 
-	/*
-	 * Reserve from the start of the kernel to the end of the kernel
-	 */
-#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
 	/*
 	 * Make sure we align the reservation on PMD_SIZE since we will
 	 * map the kernel in the linear mapping as read-only: we do not want
 	 * any allocation to happen between _end and the next pmd aligned page.
 	 */
-	vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
-#endif
+	if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		vmlinux_end = (vmlinux_end + PMD_SIZE - 1) & PMD_MASK;
+	/*
+	 * Reserve from the start of the kernel to the end of the kernel
+	 */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
 
@@ -190,7 +188,6 @@ static void __init setup_bootmem(void)
 #ifndef CONFIG_XIP_KERNEL
 	phys_ram_base = memblock_start_of_DRAM();
 #endif
-#ifndef CONFIG_64BIT
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
@@ -200,10 +197,11 @@ static void __init setup_bootmem(void)
 	 * address space is occupied by the kernel mapping then this check must
 	 * be done as soon as the kernel mapping base address is determined.
 	 */
-	max_mapped_addr = __pa(~(ulong)0);
-	if (max_mapped_addr == (phys_ram_end - 1))
-		memblock_set_current_limit(max_mapped_addr - 4096);
-#endif
+	if (!IS_ENABLED(CONFIG_64BIT)) {
+		max_mapped_addr = __pa(~(ulong)0);
+		if (max_mapped_addr == (phys_ram_end - 1))
+			memblock_set_current_limit(max_mapped_addr - 4096);
+	}
 
 	min_low_pfn = PFN_UP(phys_ram_base);
 	max_low_pfn = max_pfn = PFN_DOWN(phys_ram_end);
@@ -616,14 +614,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
 	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
 
-#ifdef CONFIG_64BIT
-	/*
-	 * The last 4K bytes of the addressable memory can not be mapped because
-	 * of IS_ERR_VALUE macro.
-	 */
-	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
-#endif
-
 	pt_ops.alloc_pte = alloc_pte_early;
 	pt_ops.get_pte_virt = get_pte_virt_early;
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -735,10 +725,9 @@ static void __init setup_vm_final(void)
 		}
 	}
 
-#ifdef CONFIG_64BIT
 	/* Map the kernel */
-	create_kernel_page_table(swapper_pg_dir, false);
-#endif
+	if (IS_ENABLED(CONFIG_64BIT))
+		create_kernel_page_table(swapper_pg_dir, false);
 
 	/* Clear fixmap PTE and PMD mappings */
 	clear_fixmap(FIX_PTE);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
