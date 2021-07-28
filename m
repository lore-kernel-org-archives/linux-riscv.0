Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EF2C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 02:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F3060FC0
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 02:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01F3060FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wBnq+7QGsWocoMH0xbcdD3aLXP7gCcD/IlYXaXibOQ8=; b=WI8U+PrKuQ1r2R
	/SeYiyk9CH4tYcor1TruWIy5X867k3E6copFEy66y+DActr3Hbim4LSAMqn9e8iSHUkSOFy2dXD0F
	LXyxcGGCyyZpFNquy1JJTLgQvvNzz/SD9DQ+udVI9Rt7343qvim8cStFxDTAWIMcR7HzAmKanabNw
	dFoEH86pA80lKdAZeLLB0+xk62NdNcgIukMJWsL6GLsMG9AWAOYWUkhFY3XSQ5F/CNPt8OEmugFsE
	HzAbJVm7nFRbp4fnlOO/gTfFr3gFH84Kjrpwa2Jssix4lhjhYDFoYjL4qaJCma8srDh1vqHozTMHw
	5wX9R/6eJY4zRtbOm5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ZA3-00Gr7N-Dl; Wed, 28 Jul 2021 02:19:07 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Z9z-00Gr6n-1Q
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 02:19:05 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GZHLZ6STJzcjJ6;
 Wed, 28 Jul 2021 10:15:18 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 10:18:47 +0800
Received: from huawei.com (10.175.113.32) by dggpemm000001.china.huawei.com
 (7.185.36.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 28 Jul
 2021 10:18:46 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <alex@ghiti.fr>, <anup.patel@wdc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
 <tiantao6@hisilicon.com>, <qiuwenbo@phytium.com.cn>, <rppt@kernel.org>,
 <jszhang@kernel.org>, <mick@ics.forth.gr>
Subject: [PATCH v2 -next] riscv: mm: remove redundant trampoline PGD for 64bit
Date: Wed, 28 Jul 2021 10:49:10 +0800
Message-ID: <20210728024910.1417720-1-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_191903_458589_A9FCC9FE 
X-CRM114-Status: GOOD (  14.24  )
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

Remove redundant trampoline PGD for 64bit and add more comment
for why 32bit systems need trampoline PGD.

There was a patch and discussion similar to this,refer to
the link [1][2].

The trampoline PGD is redundant for 64bit systems because:
1. The early PGD covers the entire kernel mapping. Directly
loading early PGD can achieve the result in boot stage.
A more trampoline PGD makes code hard to understand.
2. Directly loading early PGD is safe in 64bit systems since
the kernel virtual address starts as 0xFFFFxxxxxxxxxxxx,
which has a very big gap with RAM address.It won't fall into
the corner case that 32bit system worrys.
3. Remove redundant trampoline PGD can benefit to code maintaince,
because 64bit systems have more page table levels.For example:
If we want to support SV48 which has 4 page table levels, we have
to add a trampoline_pud and insert it before trampoline_pmd.

Reference link:
[1]https://lore.kernel.org/linux-riscv/20190325092234.5451-4-anup.patel@wdc.com/
[2]https://lkml.org/lkml/2019/3/28/147

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Reviewed-by: weiyongjun <weiyongjun1@huawei.com>
---
v2 changes:
  Adjust codes based on the review suggestions from Alex Ghiti,
  make codes more readable.
---
 arch/riscv/kernel/head.S | 46 ++++++++++++++++++++++++++--------------
 arch/riscv/mm/init.c     | 16 ++++----------
 2 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fce5184b22c3..3816aa5edc69 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -89,29 +89,52 @@ relocate:
 	add ra, ra, a1
 
 	/* Point stvec to virtual address of intruction after satp write */
-	la a2, 1f
+#ifdef CONFIG_64BIT
+	la a2, load_done
+#else
+	la a2, load_kernel_pgd
+#endif
 	add a2, a2, a1
 	csrw CSR_TVEC, a2
 
-	/* Compute satp for kernel page tables, but don't load it yet */
+	/* Compute satp for kernel page tables.
+	 * For 64bit systems, load it and trap to stvec.
+	 * For 32bit systems, don't load it yet.
+	 */
 	srl a2, a0, PAGE_SHIFT
 	li a1, SATP_MODE
 	or a2, a2, a1
 
 	/*
+	 * Before writing satp, we need a full fence here because setup_vm() just
+	 * wrote these PTEs and we need to ensure the new translations are in use.
+	 */
+	sfence.vma
+#ifndef CONFIG_64BIT
+	/*
+	 * 32bit systems need firstly loading a trampoline to handle a corner
+	 * case where load address range overlaps kernel virtual address range.
 	 * Load trampoline page directory, which will cause us to trap to
-	 * stvec if VA != PA, or simply fall through if VA == PA.  We need a
-	 * full fence here because setup_vm() just wrote these PTEs and we need
-	 * to ensure the new translations are in use.
+	 * stvec if VA != PA, or simply fall through if VA == PA.
 	 */
 	la a0, trampoline_pg_dir
 	XIP_FIXUP_OFFSET a0
 	srl a0, a0, PAGE_SHIFT
 	or a0, a0, a1
-	sfence.vma
 	csrw CSR_SATP, a0
+#endif
 .align 2
-1:
+load_kernel_pgd:
+        /*
+         * Switch to kernel page tables.  A full fence is necessary in order to
+         * avoid using the trampoline translations, which are only correct for
+         * the first superpage.  Fetching the fence is guarnteed to work
+         * because that first superpage is translated the same way.
+         */
+        csrw CSR_SATP, a2
+        sfence.vma
+
+load_done:
 	/* Set trap vector to spin forever to help debug */
 	la a0, .Lsecondary_park
 	csrw CSR_TVEC, a0
@@ -122,15 +145,6 @@ relocate:
 	la gp, __global_pointer$
 .option pop
 
-	/*
-	 * Switch to kernel page tables.  A full fence is necessary in order to
-	 * avoid using the trampoline translations, which are only correct for
-	 * the first superpage.  Fetching the fence is guarnteed to work
-	 * because that first superpage is translated the same way.
-	 */
-	csrw CSR_SATP, a2
-	sfence.vma
-
 	ret
 #endif /* CONFIG_MMU */
 #ifdef CONFIG_SMP
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ac48742fa6fc..306fcb2334fa 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -219,13 +219,17 @@ unsigned long pfn_base __ro_after_init;
 EXPORT_SYMBOL(pfn_base);
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
+#ifndef CONFIG_64BIT
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
+#endif /* CONFIG_64BIT */
 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 
 pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
+#ifndef CONFIG_64BIT
 #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
+#endif /* CONFIG_64BIT */
 #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
 #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
 #endif /* CONFIG_XIP_KERNEL */
@@ -300,13 +304,11 @@ static void __init create_pte_mapping(pte_t *ptep,
 
 #ifndef __PAGETABLE_PMD_FOLDED
 
-static pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
 static pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
 static pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 static pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
-#define trampoline_pmd ((pmd_t *)XIP_FIXUP(trampoline_pmd))
 #define fixmap_pmd     ((pmd_t *)XIP_FIXUP(fixmap_pmd))
 #define early_pmd      ((pmd_t *)XIP_FIXUP(early_pmd))
 #endif /* CONFIG_XIP_KERNEL */
@@ -585,16 +587,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	/* Setup fixmap PMD */
 	create_pmd_mapping(fixmap_pmd, FIXADDR_START,
 			   (uintptr_t)fixmap_pte, PMD_SIZE, PAGE_TABLE);
-	/* Setup trampoline PGD and PMD */
-	create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
-			   (uintptr_t)trampoline_pmd, PGDIR_SIZE, PAGE_TABLE);
-#ifdef CONFIG_XIP_KERNEL
-	create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
-			   kernel_map.xiprom, PMD_SIZE, PAGE_KERNEL_EXEC);
-#else
-	create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
-			   kernel_map.phys_addr, PMD_SIZE, PAGE_KERNEL_EXEC);
-#endif
 #else
 	/* Setup trampoline PGD */
 	create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
