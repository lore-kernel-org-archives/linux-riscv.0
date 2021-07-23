Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B697AC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E2F160EE6
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E2F160EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+SxvItUF2r7hvhBda2gHcn7q6nQalKqcvafXUWdELM=; b=M20pkS0GLkX/Sa
	aOQGiocWtO2TCysHR23NQv8J5ekDYcRm8rL0pYnZLCjUmBHzOizNUG3KqjMl7N1w0cFAf4/oUHYSz
	B19PspTcgRhhAu1I91JBDtP6OuGZ1mOkLTvQsklj6zyGtkMc0wrvo9SMp8DVlLY9OS4GcQ2rvCbrT
	m0IrWp8J09auFpKHDMhs1aHxP1eqNq0p030Sh2l8BFA705Z2QnoxUMqwGYEKhrCDsqnyCt6mShvAh
	pIEMwUYcFQRsYlYGn4HAOScyT02BetNMeaxrZOzWUl5LXIZ2Y1pS4JImSO1VXBBtvJ8Ua4cULRawx
	uDunh0VpYZHdJeIa5vVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6uqC-004lxw-Cy; Fri, 23 Jul 2021 13:03:48 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6uq9-004lwE-3z
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 13:03:46 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5D2F840003;
 Fri, 23 Jul 2021 13:03:38 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 2/5] riscv: Get rid of map_size parameter to
 create_kernel_page_table
Date: Fri, 23 Jul 2021 15:01:25 +0200
Message-Id: <20210723130128.47664-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723130128.47664-1-alex@ghiti.fr>
References: <20210723130128.47664-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_060345_501425_DBA1BDA1 
X-CRM114-Status: GOOD (  10.95  )
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

The kernel must always be mapped using PMD_SIZE, and this is already the
case, this just simplifies create_kernel_page_table.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9668867e2702..e35df3e1c9a3 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -501,36 +501,35 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
 #endif
 
 #ifdef CONFIG_XIP_KERNEL
-static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
+static void __init create_kernel_page_table(pgd_t *pgdir,
 					    __always_unused bool early)
 {
 	uintptr_t va, end_va;
 
 	/* Map the flash resident part */
 	end_va = kernel_map.virt_addr + kernel_map.xiprom_sz;
-	for (va = kernel_map.virt_addr; va < end_va; va += map_size)
+	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE)
 		create_pgd_mapping(pgdir, va,
 				   kernel_map.xiprom + (va - kernel_map.virt_addr),
-				   map_size, PAGE_KERNEL_EXEC);
+				   PMD_SIZE, PAGE_KERNEL_EXEC);
 
 	/* Map the data in RAM */
 	end_va = kernel_map.virt_addr + XIP_OFFSET + kernel_map.size;
-	for (va = kernel_map.virt_addr + XIP_OFFSET; va < end_va; va += map_size)
+	for (va = kernel_map.virt_addr + XIP_OFFSET; va < end_va; va += PMD_SIZE)
 		create_pgd_mapping(pgdir, va,
 				   kernel_map.phys_addr + (va - (kernel_map.virt_addr + XIP_OFFSET)),
-				   map_size, PAGE_KERNEL);
+				   PMD_SIZE, PAGE_KERNEL);
 }
 #else
-static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
-					    bool early)
+static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
 {
 	uintptr_t va, end_va;
 
 	end_va = kernel_map.virt_addr + kernel_map.size;
-	for (va = kernel_map.virt_addr; va < end_va; va += map_size)
+	for (va = kernel_map.virt_addr; va < end_va; va += PMD_SIZE)
 		create_pgd_mapping(pgdir, va,
 				   kernel_map.phys_addr + (va - kernel_map.virt_addr),
-				   map_size,
+				   PMD_SIZE,
 				   early ?
 					PAGE_KERNEL_EXEC : pgprot_from_va(va));
 }
@@ -539,7 +538,6 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
 	uintptr_t __maybe_unused pa;
-	uintptr_t map_size;
 #ifndef __PAGETABLE_PMD_FOLDED
 	pmd_t fix_bmap_spmd, fix_bmap_epmd;
 #endif
@@ -564,15 +562,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	pfn_base = PFN_DOWN(kernel_map.phys_addr);
 
-	/*
-	 * Enforce boot alignment requirements of RV32 and
-	 * RV64 by only allowing PMD or PGD mappings.
-	 */
-	map_size = PMD_SIZE;
-
 	/* Sanity check alignment and size */
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
-	BUG_ON((kernel_map.phys_addr % map_size) != 0);
+	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
 
 	pt_ops.alloc_pte = alloc_pte_early;
 	pt_ops.get_pte_virt = get_pte_virt_early;
@@ -609,7 +601,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	 * us to reach paging_init(). We map all memory banks later
 	 * in setup_vm_final() below.
 	 */
-	create_kernel_page_table(early_pg_dir, map_size, true);
+	create_kernel_page_table(early_pg_dir, true);
 
 #ifndef __PAGETABLE_PMD_FOLDED
 	/* Setup early PMD for DTB */
@@ -725,7 +717,7 @@ static void __init setup_vm_final(void)
 
 #ifdef CONFIG_64BIT
 	/* Map the kernel */
-	create_kernel_page_table(swapper_pg_dir, PMD_SIZE, false);
+	create_kernel_page_table(swapper_pg_dir, false);
 #endif
 
 	/* Clear fixmap PTE and PMD mappings */
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
