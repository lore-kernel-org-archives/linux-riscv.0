Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD27C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:07:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0885160E8C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0885160E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLjXCVhQ9J7w9n4jAD+Avatvyg4zHUUVpIKWHU5IRMA=; b=EoM3uH3eUyWlC+
	gjKO0vRx4LpIWJ4i6oCMnWi++46OAtlTMQxDF7ZbTLQf6oBNL0lPW2fjUhsY+rUJ97QMvHVhpn5Yp
	sAWoNFyC0XaPhtdN0CLewMz03TwzC079Z2BAfiQlVFO5z6CLCQsMhcXZ6Ak89YZX1ErA7+inilVUr
	pFQy7Y9Fmh87LF9oef96zibl3NgvbVQdYUEei3YR4rGLXLRaT0A18imD/nEzJM0XJFOze3BViHoil
	oWhQkPZHnsQkeqjcucz2UzbJO6IvXgMOrqMk0VkcpaSnVUB/ZV214a6YkR8eh2lqruQ2gb65u7+8z
	GXfsPBwN+sqkFy2wwOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6utE-004mjd-1S; Fri, 23 Jul 2021 13:06:56 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6utA-004mih-JO
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 13:06:54 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 16FB8100016;
 Fri, 23 Jul 2021 13:06:48 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 5/5] riscv: Move early fdt mapping creation in its own function
Date: Fri, 23 Jul 2021 15:01:28 +0200
Message-Id: <20210723130128.47664-6-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723130128.47664-1-alex@ghiti.fr>
References: <20210723130128.47664-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_060652_948611_61D677A5 
X-CRM114-Status: GOOD (  15.71  )
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

The code that handles the early fdt mapping is hard to read and does not
create the same mapping size depending on the kernel:

- for 64-bit, 2 PMD entries are used which amounts to a 4MB mapping
- for 32-bit, 2 PGDIR entries are used which amounts to a 8MB mapping

So keep using 2 PMD entries for 64-bit and use only one PGD entry for
32-bit needed to cover 4MB. Move that into a new function called
create_fdt_early_page_table which, using the same naming as
create_kernel_page_table.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 76 +++++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1b30ad7e3ebc..e2c8f188ad95 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -228,6 +228,7 @@ pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 
 pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
+static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
 #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
@@ -308,7 +309,6 @@ static void __init create_pte_mapping(pte_t *ptep,
 static pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
 static pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
 static pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
-static pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
 #define trampoline_pmd ((pmd_t *)XIP_FIXUP(trampoline_pmd))
@@ -394,6 +394,7 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
 	create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
 #define fixmap_pgd_next		fixmap_pte
+#define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot)
 #endif
 
 void __init create_pgd_mapping(pgd_t *pgdp,
@@ -535,9 +536,44 @@ static void __init create_kernel_page_table(pgd_t *pgdir, bool early)
 }
 #endif
 
+/*
+ * Setup a 4MB mapping that encompasses the device tree: for 64-bit kernel,
+ * this means 2 PMD entries whereas for 32-bit kernel, this is only 1 PGDIR
+ * entry.
+ */
+static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
+{
+#ifndef CONFIG_BUILTIN_DTB
+	uintptr_t pa = dtb_pa & ~(PMD_SIZE - 1);
+
+	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
+			   IS_ENABLED(CONFIG_64BIT) ? (uintptr_t)early_dtb_pmd : pa,
+			   PGDIR_SIZE,
+			   IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
+
+	if (IS_ENABLED(CONFIG_64BIT)) {
+		create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
+				   pa, PMD_SIZE, PAGE_KERNEL);
+		create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
+				   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
+	}
+
+	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
+#else
+	/*
+	 * For 64-bit kernel, __va can't be used since it would return a linear
+	 * mapping address whereas dtb_early_va will be used before
+	 * setup_vm_final installs the linear mapping. For 32-bit kernel, as the
+	 * kernel is mapped in the linear mapping, that makes no difference.
+	 */
+	dtb_early_va = kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
+#endif
+
+	dtb_early_pa = dtb_pa;
+}
+
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
-	uintptr_t __maybe_unused pa;
 	pmd_t __maybe_unused fix_bmap_spmd, fix_bmap_epmd;
 
 	kernel_map.virt_addr = KERNEL_LINK_ADDR;
@@ -601,40 +637,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	 */
 	create_kernel_page_table(early_pg_dir, true);
 
-#ifndef __PAGETABLE_PMD_FOLDED
-	/* Setup early PMD for DTB */
-	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
-			   (uintptr_t)early_dtb_pmd, PGDIR_SIZE, PAGE_TABLE);
-#ifndef CONFIG_BUILTIN_DTB
-	/* Create two consecutive PMD mappings for FDT early scan */
-	pa = dtb_pa & ~(PMD_SIZE - 1);
-	create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
-			   pa, PMD_SIZE, PAGE_KERNEL);
-	create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
-			   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
-	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
-#else /* CONFIG_BUILTIN_DTB */
-	/*
-	 * __va can't be used since it would return a linear mapping address
-	 * whereas dtb_early_va will be used before setup_vm_final installs
-	 * the linear mapping.
-	 */
-	dtb_early_va = kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
-#endif /* CONFIG_BUILTIN_DTB */
-#else /* __PAGETABLE_PMD_FOLDED */
-#ifndef CONFIG_BUILTIN_DTB
-	/* Create two consecutive PGD mappings for FDT early scan */
-	pa = dtb_pa & ~(PGDIR_SIZE - 1);
-	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
-			   pa, PGDIR_SIZE, PAGE_KERNEL);
-	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
-			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
-	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
-#else /* CONFIG_BUILTIN_DTB */
-	dtb_early_va = __va(dtb_pa);
-#endif /* CONFIG_BUILTIN_DTB */
-#endif /* __PAGETABLE_PMD_FOLDED */
-	dtb_early_pa = dtb_pa;
+	/* Setup early mapping for FDT early scan */
+	create_fdt_early_page_table(early_pg_dir, dtb_pa);
 
 	/*
 	 * Bootime fixmap only can handle PMD_SIZE mapping. Thus, boot-ioremap
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
