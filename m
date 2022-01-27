Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F458C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 02:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOU3ZQhH7uiZ8y2oP0qEZjPCXvcMHxkvQhiloogaLCY=; b=qyzE2xfc+xKV2W
	Z4XY6KrCHj4BdMtGe1kTU6yHUZKQGkWqX/HBKGAsQwIXswupKgsSR2v7OjOFK4I+8WjytVjKdXaka
	xcBO6vlKNEm4pUSAIHfyTLAsYM3AhoPLRaOUu3iWkmHP//PG5ZuDpgJKs6GA+5lueBVlL4QZ01DoO
	G+rFRVEhgy9ttPtCaKbYe6BcL2PxeZhGPi2BYpn2WQ8TPDP3dFXzDs9QPdELIqWcgvI6PvitJejP0
	hydpKFqXr/8wPt4kveVKkyUJskVISBzn0BSFnG/Ja07YtUdtRLPlAw61JxDF5qkN7Kt7fvsI+vCIj
	HWZpD+oWHiND6+B3yTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCuqR-00E7zZ-U3; Thu, 27 Jan 2022 02:49:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCuqL-00E7xg-MW
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 02:49:04 +0000
Received: from localhost.localdomain (unknown [124.16.141.242])
 by APP-01 (Coremail) with SMTP id qwCowADHz8cOCPJhFmwLAA--.8245S4;
 Thu, 27 Jan 2022 10:48:54 +0800 (CST)
From: panqinglin2020@iscas.ac.cn
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: [PATCH v2 2/4] riscv: mm: Prepare pt_ops helper functions for sv57
Date: Thu, 27 Jan 2022 10:48:42 +0800
Message-Id: <20220127024844.2413385-3-panqinglin2020@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
References: <20220127024844.2413385-1-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHz8cOCPJhFmwLAA--.8245S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Zw1DXFW7KrykuryfuF17Jrb_yoWDAr47pr
 48GF1ktF45JrWvqa1ftry5tr17ZwnrW3yDJrWkWFykuay7ArySgrs7KrWavFyxuF4kAF15
 Ars5tay5AayjkrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
 nxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
 1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
 3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
 WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
 cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
 AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
 Xa7VUUpwZ7UUUUU==
X-Originating-IP: [124.16.141.242]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_184902_159616_2CA3B378 
X-CRM114-Status: GOOD (  12.20  )
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

From: Qinglin Pan <panqinglin2020@iscas.ac.cn>

This patch prepare some pt_ops helper functions which will be used in
creating sv57 mappings during boot time.

Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 58a718573ad6..3cfece8b6568 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -25,6 +25,7 @@ enum fixed_addresses {
 	FIX_PTE,
 	FIX_PMD,
 	FIX_PUD,
+	FIX_P4D,
 	FIX_TEXT_POKE1,
 	FIX_TEXT_POKE0,
 	FIX_EARLYCON_MEM_BASE,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 58fece3133e9..351cabcd528e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -133,6 +133,8 @@ struct pt_alloc_ops {
 	phys_addr_t (*alloc_pmd)(uintptr_t va);
 	pud_t *(*get_pud_virt)(phys_addr_t pa);
 	phys_addr_t (*alloc_pud)(uintptr_t va);
+	p4d_t *(*get_p4d_virt)(phys_addr_t pa);
+	phys_addr_t (*alloc_p4d)(uintptr_t va);
 #endif
 };
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9e4ed02e3d56..425377c97c40 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -229,6 +229,7 @@ pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
 
 pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
+static p4d_t __maybe_unused early_dtb_p4d[PTRS_PER_P4D] __initdata __aligned(PAGE_SIZE);
 static pud_t __maybe_unused early_dtb_pud[PTRS_PER_PUD] __initdata __aligned(PAGE_SIZE);
 static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
@@ -319,6 +320,16 @@ static pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 #define early_pmd      ((pmd_t *)XIP_FIXUP(early_pmd))
 #endif /* CONFIG_XIP_KERNEL */
 
+static p4d_t trampoline_p4d[PTRS_PER_P4D] __page_aligned_bss;
+static p4d_t fixmap_p4d[PTRS_PER_P4D] __page_aligned_bss;
+static p4d_t early_p4d[PTRS_PER_P4D] __initdata __aligned(PAGE_SIZE);
+
+#ifdef CONFIG_XIP_KERNEL
+#define trampoline_p4d ((p4d_t *)XIP_FIXUP(trampoline_p4d))
+#define fixmap_p4d     ((p4d_t *)XIP_FIXUP(fixmap_p4d))
+#define early_p4d      ((p4d_t *)XIP_FIXUP(early_p4d))
+#endif /* CONFIG_XIP_KERNEL */
+
 static pud_t trampoline_pud[PTRS_PER_PUD] __page_aligned_bss;
 static pud_t fixmap_pud[PTRS_PER_PUD] __page_aligned_bss;
 static pud_t early_pud[PTRS_PER_PUD] __initdata __aligned(PAGE_SIZE);
@@ -433,6 +444,44 @@ static phys_addr_t alloc_pud_late(uintptr_t va)
 	return __pa(vaddr);
 }
 
+static p4d_t *__init get_p4d_virt_early(phys_addr_t pa)
+{
+	return (p4d_t *)((uintptr_t)pa);
+}
+
+static p4d_t *__init get_p4d_virt_fixmap(phys_addr_t pa)
+{
+	clear_fixmap(FIX_P4D);
+	return (p4d_t *)set_fixmap_offset(FIX_P4D, pa);
+}
+
+static p4d_t *__init get_p4d_virt_late(phys_addr_t pa)
+{
+	return (p4d_t *)__va(pa);
+}
+
+static phys_addr_t __init alloc_p4d_early(uintptr_t va)
+{
+	/* Only one P4D is available for early mapping */
+	BUG_ON((va - kernel_map.virt_addr) >> PGDIR_SHIFT);
+
+	return (uintptr_t)early_p4d;
+}
+
+static phys_addr_t __init alloc_p4d_fixmap(uintptr_t va)
+{
+	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
+}
+
+static phys_addr_t alloc_p4d_late(uintptr_t va)
+{
+	unsigned long vaddr;
+
+	vaddr = __get_free_page(GFP_KERNEL);
+	BUG_ON(!vaddr);
+	return __pa(vaddr);
+}
+
 static void __init create_pud_mapping(pud_t *pudp,
 				      uintptr_t va, phys_addr_t pa,
 				      phys_addr_t sz, pgprot_t prot)
@@ -460,21 +509,55 @@ static void __init create_pud_mapping(pud_t *pudp,
 	create_pmd_mapping(nextp, va, pa, sz, prot);
 }
 
-#define pgd_next_t		pud_t
-#define alloc_pgd_next(__va)	(pgtable_l4_enabled ?			\
-		pt_ops.alloc_pud(__va) : pt_ops.alloc_pmd(__va))
-#define get_pgd_next_virt(__pa)	(pgtable_l4_enabled ?			\
-		pt_ops.get_pud_virt(__pa) : (pgd_next_t *)pt_ops.get_pmd_virt(__pa))
+static void __init create_p4d_mapping(p4d_t *p4dp,
+				      uintptr_t va, phys_addr_t pa,
+				      phys_addr_t sz, pgprot_t prot)
+{
+	pud_t *nextp;
+	phys_addr_t next_phys;
+	uintptr_t p4d_index = p4d_index(va);
+
+	if (sz == P4D_SIZE) {
+		if (p4d_val(p4dp[p4d_index]) == 0)
+			p4dp[p4d_index] = pfn_p4d(PFN_DOWN(pa), prot);
+		return;
+	}
+
+	if (p4d_val(p4dp[p4d_index]) == 0) {
+		next_phys = pt_ops.alloc_pud(va);
+		p4dp[p4d_index] = pfn_p4d(PFN_DOWN(next_phys), PAGE_TABLE);
+		nextp = pt_ops.get_pud_virt(next_phys);
+		memset(nextp, 0, PAGE_SIZE);
+	} else {
+		next_phys = PFN_PHYS(_p4d_pfn(p4dp[p4d_index]));
+		nextp = pt_ops.get_pud_virt(next_phys);
+	}
+
+	create_pud_mapping(nextp, va, pa, sz, prot);
+}
+
+#define pgd_next_t		p4d_t
+#define alloc_pgd_next(__va)	(pgtable_l5_enabled ?			\
+		pt_ops.alloc_p4d(__va) : (pgtable_l4_enabled ?		\
+		pt_ops.alloc_pud(__va) : pt_ops.alloc_pmd(__va)))
+#define get_pgd_next_virt(__pa)	(pgtable_l5_enabled ?			\
+		pt_ops.get_p4d_virt(__pa) : (pgd_next_t *)(pgtable_l4_enabled ?	\
+		pt_ops.get_pud_virt(__pa) : (pud_t *)pt_ops.get_pmd_virt(__pa)))
 #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)	\
+				(pgtable_l5_enabled ?			\
+		create_p4d_mapping(__nextp, __va, __pa, __sz, __prot) : \
 				(pgtable_l4_enabled ?			\
-		create_pud_mapping(__nextp, __va, __pa, __sz, __prot) :	\
-		create_pmd_mapping((pmd_t *)__nextp, __va, __pa, __sz, __prot))
-#define fixmap_pgd_next		(pgtable_l4_enabled ?			\
-		(uintptr_t)fixmap_pud : (uintptr_t)fixmap_pmd)
-#define trampoline_pgd_next	(pgtable_l4_enabled ?			\
-		(uintptr_t)trampoline_pud : (uintptr_t)trampoline_pmd)
-#define early_dtb_pgd_next	(pgtable_l4_enabled ?			\
-		(uintptr_t)early_dtb_pud : (uintptr_t)early_dtb_pmd)
+		create_pud_mapping((pud_t *)__nextp, __va, __pa, __sz, __prot) :	\
+		create_pmd_mapping((pmd_t *)__nextp, __va, __pa, __sz, __prot)))
+#define fixmap_pgd_next		(pgtable_l5_enabled ?			\
+		(uintptr_t)fixmap_p4d : (pgtable_l4_enabled ?		\
+		(uintptr_t)fixmap_pud : (uintptr_t)fixmap_pmd))
+#define trampoline_pgd_next	(pgtable_l5_enabled ?			\
+		(uintptr_t)trampoline_p4d : (pgtable_l4_enabled ?	\
+		(uintptr_t)trampoline_pud : (uintptr_t)trampoline_pmd))
+#define early_dtb_pgd_next	(pgtable_l5_enabled ?			\
+		(uintptr_t)early_dtb_p4d : (pgtable_l4_enabled ?	\
+		(uintptr_t)early_dtb_pud : (uintptr_t)early_dtb_pmd))
 #else
 #define pgd_next_t		pte_t
 #define alloc_pgd_next(__va)	pt_ops.alloc_pte(__va)
@@ -483,6 +566,7 @@ static void __init create_pud_mapping(pud_t *pudp,
 	create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
 #define fixmap_pgd_next		((uintptr_t)fixmap_pte)
 #define early_dtb_pgd_next	((uintptr_t)early_dtb_pmd)
+#define create_p4d_mapping(__pmdp, __va, __pa, __sz, __prot)
 #define create_pud_mapping(__pmdp, __va, __pa, __sz, __prot)
 #define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot)
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -693,10 +777,13 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
 			   PGDIR_SIZE,
 			   IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
 
-	if (pgtable_l4_enabled) {
+	if (pgtable_l5_enabled)
+		create_p4d_mapping(early_dtb_p4d, DTB_EARLY_BASE_VA,
+				   (uintptr_t)early_dtb_pud, P4D_SIZE, PAGE_TABLE);
+
+	if (pgtable_l4_enabled)
 		create_pud_mapping(early_dtb_pud, DTB_EARLY_BASE_VA,
 				   (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
-	}
 
 	if (IS_ENABLED(CONFIG_64BIT)) {
 		create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
@@ -732,6 +819,8 @@ void __init pt_ops_set_early(void)
 	pt_ops.get_pmd_virt = get_pmd_virt_early;
 	pt_ops.alloc_pud = alloc_pud_early;
 	pt_ops.get_pud_virt = get_pud_virt_early;
+	pt_ops.alloc_p4d = alloc_p4d_early;
+	pt_ops.get_p4d_virt = get_p4d_virt_early;
 #endif
 }
 
@@ -752,6 +841,8 @@ void __init pt_ops_set_fixmap(void)
 	pt_ops.get_pmd_virt = kernel_mapping_pa_to_va((uintptr_t)get_pmd_virt_fixmap);
 	pt_ops.alloc_pud = kernel_mapping_pa_to_va((uintptr_t)alloc_pud_fixmap);
 	pt_ops.get_pud_virt = kernel_mapping_pa_to_va((uintptr_t)get_pud_virt_fixmap);
+	pt_ops.alloc_p4d = kernel_mapping_pa_to_va((uintptr_t)alloc_p4d_fixmap);
+	pt_ops.get_p4d_virt = kernel_mapping_pa_to_va((uintptr_t)get_p4d_virt_fixmap);
 #endif
 }
 
@@ -768,6 +859,8 @@ void __init pt_ops_set_late(void)
 	pt_ops.get_pmd_virt = get_pmd_virt_late;
 	pt_ops.alloc_pud = alloc_pud_late;
 	pt_ops.get_pud_virt = get_pud_virt_late;
+	pt_ops.alloc_p4d = alloc_p4d_late;
+	pt_ops.get_p4d_virt = get_p4d_virt_late;
 #endif
 }
 
@@ -828,6 +921,10 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 			   fixmap_pgd_next, PGDIR_SIZE, PAGE_TABLE);
 
 #ifndef __PAGETABLE_PMD_FOLDED
+	/* Setup fixmap P4D and PUD */
+	if (pgtable_l5_enabled)
+		create_p4d_mapping(fixmap_p4d, FIXADDR_START,
+				   (uintptr_t)fixmap_pud, P4D_SIZE, PAGE_TABLE);
 	/* Setup fixmap PUD and PMD */
 	if (pgtable_l4_enabled)
 		create_pud_mapping(fixmap_pud, FIXADDR_START,
@@ -837,6 +934,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	/* Setup trampoline PGD and PMD */
 	create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
 			   trampoline_pgd_next, PGDIR_SIZE, PAGE_TABLE);
+	if (pgtable_l5_enabled)
+		create_p4d_mapping(trampoline_p4d, kernel_map.virt_addr,
+				   (uintptr_t)trampoline_pud, P4D_SIZE, PAGE_TABLE);
 	if (pgtable_l4_enabled)
 		create_pud_mapping(trampoline_pud, kernel_map.virt_addr,
 				   (uintptr_t)trampoline_pmd, PUD_SIZE, PAGE_TABLE);
@@ -938,6 +1038,7 @@ static void __init setup_vm_final(void)
 	clear_fixmap(FIX_PTE);
 	clear_fixmap(FIX_PMD);
 	clear_fixmap(FIX_PUD);
+	clear_fixmap(FIX_P4D);
 
 	/* Move to swapper page table */
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | satp_mode);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
