Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9C4C47089
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 14:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51E0D60D07
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 14:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51E0D60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vF9Kz4rZmOo9FEBtIk7REFKtibK+xfy7uzC3Mo2pAQ=; b=bDRzZvSAEjMiUK
	dW7Nrk9THWS1MjVEY4MBFVI56A+gS7L2/j/vybTIh9layNaLOBN1Q6rmgeoWJtjuCVEu9KBHRL9Qt
	kiAwIzouOBdVKixumK4txgP6gt/q/Kg5Qinf0jtDPCHM9eiCZX2gJy5zyeXX/7gOhCZbIfPhXGrfk
	m4Qf6XWIynYitMl9/rK/OzjdXzL/WaYKBoUR8xwR78FsExCST6fr++2ZjBRi9P7yr1SwiNvdtxMZo
	uPE2Xz/FkggY4I2GdVpxtnET17hflq2iY2ZhqY0PqEI2QSDzZYJGJikfb9zIIJgY/Y5nDPI1PK2L9
	BIMuBGeYltsuDR9/ShiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmHHk-006tvN-97; Thu, 27 May 2021 14:46:56 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGnk-006gPy-33
 for linux-riscv@lists.infradead.org; Thu, 27 May 2021 14:15:59 +0000
Received: from dggeml752-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FrV960Blwz1BFcL;
 Thu, 27 May 2021 22:11:06 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggeml752-chm.china.huawei.com (10.1.199.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 22:15:41 +0800
Received: from huawei.com (10.175.113.32) by dggpemm000001.china.huawei.com
 (7.185.36.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 27 May
 2021 22:15:40 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <anup.patel@wdc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH -next] riscv: mm: remove redundant trampoline PGD for 64bit
Date: Thu, 27 May 2021 22:48:19 +0800
Message-ID: <20210527144819.12101-1-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_071556_591169_A4E147A8 
X-CRM114-Status: GOOD (  12.13  )
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
---
 arch/riscv/kernel/head.S | 13 +++++++++++--
 arch/riscv/mm/init.c     | 21 +++++++--------------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 89cc58ab52b4..1897b17c5fcc 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -93,12 +93,18 @@ relocate:
 	add a2, a2, a1
 	csrw CSR_TVEC, a2
 
-	/* Compute satp for kernel page tables, but don't load it yet */
+	/* Compute satp for kernel page tables */
 	srl a2, a0, PAGE_SHIFT
 	li a1, SATP_MODE
 	or a2, a2, a1
-
+#ifdef CONFIG_64BIT
+	/* Load kernel page directory */
+	sfence.vma
+	csrw CSR_SATP, a2
+#else
 	/*
+	 * 32bit system need a trampoline to handle a corner case where
+	 * load address range overlaps kernel virtual address range.
 	 * Load trampoline page directory, which will cause us to trap to
 	 * stvec if VA != PA, or simply fall through if VA == PA.  We need a
 	 * full fence here because setup_vm() just wrote these PTEs and we need
@@ -110,6 +116,7 @@ relocate:
 	or a0, a0, a1
 	sfence.vma
 	csrw CSR_SATP, a0
+#endif /* CONFIG_64BIT */
 .align 2
 1:
 	/* Set trap vector to spin forever to help debug */
@@ -122,6 +129,7 @@ relocate:
 	la gp, __global_pointer$
 .option pop
 
+#ifdef CONFIG_32BIT
 	/*
 	 * Switch to kernel page tables.  A full fence is necessary in order to
 	 * avoid using the trampoline translations, which are only correct for
@@ -130,6 +138,7 @@ relocate:
 	 */
 	csrw CSR_SATP, a2
 	sfence.vma
+#endif /* CONFIG_32BIT */
 
 	ret
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 11b61bea0c4d..b7226ac2d04f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -210,13 +210,17 @@ unsigned long pfn_base __ro_after_init;
 EXPORT_SYMBOL(pfn_base);
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
+#ifdef CONFIG_32BIT
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
+#endif /* CONFIG_32BIT */
 pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 
 pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
+#ifdef CONFIG_32BIT
 #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
+#endif /* CONFIG_32BIT */
 #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
 #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
 #endif /* CONFIG_XIP_KERNEL */
@@ -291,13 +295,11 @@ static void __init create_pte_mapping(pte_t *ptep,
 
 #ifndef __PAGETABLE_PMD_FOLDED
 
-pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
 pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
 pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
-#define trampoline_pmd ((pmd_t *)XIP_FIXUP(trampoline_pmd))
 #define fixmap_pmd     ((pmd_t *)XIP_FIXUP(fixmap_pmd))
 #define early_pmd      ((pmd_t *)XIP_FIXUP(early_pmd))
 #endif /* CONFIG_XIP_KERNEL */
@@ -543,21 +545,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	/* Setup fixmap PMD */
 	create_pmd_mapping(fixmap_pmd, FIXADDR_START,
 			   (uintptr_t)fixmap_pte, PMD_SIZE, PAGE_TABLE);
-	/* Setup trampoline PGD and PMD */
-	create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
-			   (uintptr_t)trampoline_pmd, PGDIR_SIZE, PAGE_TABLE);
-#ifdef CONFIG_XIP_KERNEL
-	create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
-			   xiprom, PMD_SIZE, PAGE_KERNEL_EXEC);
-#else
-	create_pmd_mapping(trampoline_pmd, kernel_virt_addr,
-			   load_pa, PMD_SIZE, PAGE_KERNEL_EXEC);
-#endif
-#else
+#endif /* __PAGETABLE_PMD_FOLDED */
+#ifdef CONFIG_32BIT
 	/* Setup trampoline PGD */
 	create_pgd_mapping(trampoline_pg_dir, kernel_virt_addr,
 			   load_pa, PGDIR_SIZE, PAGE_KERNEL_EXEC);
-#endif
+#endif /* CONFIG_32BIT */
 
 	/*
 	 * Setup early PGD covering entire kernel which will allow
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
