Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B63C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSfchkk6O28DCmDA+bSqj6pM0vpH2XiPhiwKDhAUO6s=; b=PJpNAEUOYfctQj
	+mTxQlft3mQnG/pK82fCnCiQsRlWB+H2csAyQ9sqFFQDsbuKkazCQeHlrVDmjcjWHqTZqnAHxn7vF
	iJuKPhIUBGfGAn1dXQmi05L4oftosp/VYauh/y5LUACs/G9hOGsqOfw/AKORyqEoaH6QOrtcB+dUs
	73Yb4NxEodxFgSt8BY4dr7G9v+/RwQ6VjMUNNDk5/9FdN+56tjj+iG86szJy20H2b9Jd0pOKsR+wq
	14IlPWHKcLBJ+mZ9nY9+GKY0t/jryzrlEZG3t0ey4MvsoP6n2x0aPiIJmHJZ6Da7FGp/ZGaBJI4hx
	QTTRLOKyz9kFnsTRX2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0qG-00EKZF-8S; Fri, 03 Dec 2021 05:10:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0qC-00EKWq-C2
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 05:10:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26EB0B825BC;
 Fri,  3 Dec 2021 05:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFE0C53FC7;
 Fri,  3 Dec 2021 05:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508233;
 bh=GRUArS/X3eAh9AGo4JeyzRPeIZX+Cg5bYN3qsljQ9hM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OhGkOhGQd7bLfaV35RgDZP6VwmyrAy/yABZAM1nq71EohUpE0VWdDL9Zn9+4FV2P+
 nowc0UGeb32pfWjLEvInSGeCV8TKsvo+rAWKLtqbyS4m/hmEpJZckK3QZMo05t4rvU
 Eo3f9G76GEAUUDu3UbeDFbDp9vuZAqaS/Nyw2T9bhscvtXZD0XlWnSPx/g/Agou/Oy
 2304C6fYYxU2rp8C/d6OGW5i63nxjNTCwDw/1dzfIkfiwW7YEol9ext0fzVcWjJ32p
 lGMaoDBaZAO6esJX+VoyX3AjW8f9nM4xPhH7CbWc5BfKpHUcQ5FRLKbH2RF4ffjPFM
 SIWfvFSgc+Mag==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] riscv: mm: init: try best to IS_ENABLED(CONFIG_64BIT)
 instead of #ifdef
Date: Fri,  3 Dec 2021 13:03:14 +0800
Message-Id: <20211203050317.2102-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203050317.2102-1-jszhang@kernel.org>
References: <20211203050317.2102-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211036_717648_7C1A0CE7 
X-CRM114-Status: GOOD (  18.81  )
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

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 745f26a3b02e..bd445ac778a8 100644
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
@@ -616,13 +614,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
 	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
 
-#ifdef CONFIG_64BIT
 	/*
 	 * The last 4K bytes of the addressable memory can not be mapped because
 	 * of IS_ERR_VALUE macro.
 	 */
-	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
-#endif
+	if (IS_ENABLED(CONFIG_64BIT))
+		BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
 
 	pt_ops.alloc_pte = alloc_pte_early;
 	pt_ops.get_pte_virt = get_pte_virt_early;
@@ -735,10 +732,9 @@ static void __init setup_vm_final(void)
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
