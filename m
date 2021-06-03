Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA27BC47096
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 08:31:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A553361026
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 08:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A553361026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukLl3Y4b+s+BXejujYVIjOxig2ZJi7jQdI9RW0ljO0w=; b=aqhZm31jS4HkCA
	g0pQLrSegGRmzQridVWXfYBf1AFQoGgofR6E6VqEu0mzSxGFzEeJgUq3A8KjDq9dNma1Vq4ga3LkH
	LAUWSy+qmIR5q5hdxD+EmAccr/JgpKKtAvKOn8FMVa+bbBVIsvbEchS7l4EvIrLdxG7iIYwPPb7Uc
	UeWFr+8etU2ghZYETOyfiS/WLPOqnHzlBuiuhBI0Ap5IBF62W2bhH6D92HQQxzV3qw8X74gplC+Tb
	S5cq1QPn+0urVk9E3LmwTH2sdcriFtYbW74DaEKzMiWWv0rFTBSBI6VoJG9BhOnhopIkUJSa4ZHp/
	eLmyIGz0pQZ5suT1hrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loil7-007hoN-J1; Thu, 03 Jun 2021 08:31:21 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loil3-007hnD-Ij
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 08:31:20 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 463401C001F;
 Thu,  3 Jun 2021 08:31:09 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v3 3/3] riscv: Map the kernel with correct permissions the
 first time
Date: Thu,  3 Jun 2021 10:27:49 +0200
Message-Id: <20210603082749.1256129-4-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603082749.1256129-1-alex@ghiti.fr>
References: <20210603082749.1256129-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_013117_931456_2CE5A283 
X-CRM114-Status: GOOD (  19.76  )
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

For 64b kernels, we map all the kernel with write and execute permissions
and afterwards remove writability from text and executability from data.

For 32b kernels, the kernel mapping resides in the linear mapping, so we
map all the linear mapping as writable and executable and afterwards we
remove those properties for unused memory and kernel mapping as
described above.

Change this behavior to directly map the kernel with correct permissions
and avoid going through the whole mapping to fix the permissions.

At the same time, this fixes an issue introduced by commit 2bfc6cd81bd1
("riscv: Move kernel mapping outside of linear mapping") as reported
here https://github.com/starfive-tech/linux/issues/17.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/include/asm/page.h       |  13 +++-
 arch/riscv/include/asm/sections.h   |  17 +++++
 arch/riscv/include/asm/set_memory.h |   8 ---
 arch/riscv/kernel/setup.c           |  11 +--
 arch/riscv/mm/init.c                | 102 ++++++++++++----------------
 5 files changed, 75 insertions(+), 76 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 6e004d8fda4d..349e4f9874cc 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -95,6 +95,7 @@ extern unsigned long va_kernel_pa_offset;
 #endif
 extern unsigned long va_kernel_xip_pa_offset;
 extern unsigned long pfn_base;
+extern uintptr_t load_sz;
 #define ARCH_PFN_OFFSET		(pfn_base)
 #else
 #define va_pa_offset		0
@@ -108,6 +109,11 @@ extern unsigned long pfn_base;
 extern unsigned long kernel_virt_addr;
 
 #ifdef CONFIG_64BIT
+#define is_kernel_mapping(x)	\
+	((x) >= kernel_virt_addr && (x) < (kernel_virt_addr + load_sz))
+#define is_linear_mapping(x)	\
+	((x) >= PAGE_OFFSET && (x) < kernel_virt_addr)
+
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_pa_offset))
 #define kernel_mapping_pa_to_va(y)	({						\
 	unsigned long _y = y;								\
@@ -127,10 +133,15 @@ extern unsigned long kernel_virt_addr;
 
 #define __va_to_pa_nodebug(x)	({						\
 	unsigned long _x = x;							\
-	(_x < kernel_virt_addr) ?						\
+	is_linear_mapping(_x) ?							\
 		linear_mapping_va_to_pa(_x) : kernel_mapping_va_to_pa(_x);	\
 	})
 #else
+#define is_kernel_mapping(x)	\
+	((x) >= kernel_virt_addr && (x) < (kernel_virt_addr + load_sz))
+#define is_linear_mapping(x)	\
+	((x) >= PAGE_OFFSET)
+
 #define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa_offset))
 #define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
 #endif /* CONFIG_64BIT */
diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index 8a303fb1ee3b..32336e8a17cb 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -6,6 +6,7 @@
 #define __ASM_SECTIONS_H
 
 #include <asm-generic/sections.h>
+#include <linux/mm.h>
 
 extern char _start[];
 extern char _start_kernel[];
@@ -13,4 +14,20 @@ extern char __init_data_begin[], __init_data_end[];
 extern char __init_text_begin[], __init_text_end[];
 extern char __alt_start[], __alt_end[];
 
+static inline bool is_va_kernel_text(uintptr_t va)
+{
+	uintptr_t start = (uintptr_t)_start;
+	uintptr_t end = (uintptr_t)__init_data_begin;
+
+	return va >= start && va < end;
+}
+
+static inline bool is_va_kernel_lm_alias_text(uintptr_t va)
+{
+	uintptr_t start = (uintptr_t)lm_alias(_start);
+	uintptr_t end = (uintptr_t)lm_alias(__init_data_begin);
+
+	return va >= start && va < end;
+}
+
 #endif /* __ASM_SECTIONS_H */
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 7a411fed9e0e..c0b41ed218e1 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -17,13 +17,11 @@ int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
 int set_memory_rw_nx(unsigned long addr, int numpages);
 int set_kernel_memory(char *start, char *end, int (*set_memory)(unsigned long, int));
-void protect_kernel_text_data(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
-static inline void protect_kernel_text_data(void) {}
 static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
 static inline int set_kernel_memory(char *start, char *end, int (*set_memory)(unsigned long, int))
 {
@@ -31,12 +29,6 @@ static inline int set_kernel_memory(char *start, char *end, int (*set_memory)(un
 }
 #endif
 
-#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
-void protect_kernel_linear_mapping_text_rodata(void);
-#else
-static inline void protect_kernel_linear_mapping_text_rodata(void) {}
-#endif
-
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 bool kernel_page_present(struct page *page);
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 4db4d0b5911f..b3d0895ce5f7 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -290,11 +290,6 @@ void __init setup_arch(char **cmdline_p)
 	init_resources();
 	sbi_init();
 
-	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
-		protect_kernel_text_data();
-		protect_kernel_linear_mapping_text_rodata();
-	}
-
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
 #endif
@@ -333,11 +328,9 @@ subsys_initcall(topology_init);
 
 void free_initmem(void)
 {
-	unsigned long init_begin = (unsigned long)__init_begin;
-	unsigned long init_end = (unsigned long)__init_end;
-
 	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
-		set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
+		set_kernel_memory(lm_alias(__init_begin), lm_alias(__init_end),
+				  IS_ENABLED(CONFIG_64BIT) ? set_memory_rw : set_memory_rw_nx);
 
 	free_initmem_default(POISON_FREE_INITMEM);
 }
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2d80088f33d5..6b70c345cfc4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -425,6 +425,42 @@ asmlinkage void __init __copy_data(void)
 }
 #endif
 
+#ifdef CONFIG_STRICT_KERNEL_RWX
+static __init pgprot_t pgprot_from_va(uintptr_t va)
+{
+	if (is_va_kernel_text(va))
+		return PAGE_KERNEL_READ_EXEC;
+
+	/*
+	 * In 64b kernel, the kernel mapping is outside the linear mapping so we
+	 * must protect its linear mapping alias from being executed and written.
+	 * And rodata section is marked readonly in mark_rodata_ro.
+	 */
+	if (IS_ENABLED(CONFIG_64BIT) && is_va_kernel_lm_alias_text(va))
+		return PAGE_KERNEL_READ;
+
+	return PAGE_KERNEL;
+}
+
+void mark_rodata_ro(void)
+{
+	set_kernel_memory(__start_rodata, _data, set_memory_ro);
+	if (IS_ENABLED(CONFIG_64BIT))
+		set_kernel_memory(lm_alias(__start_rodata), lm_alias(_data),
+				  set_memory_ro);
+
+	debug_checkwx();
+}
+#else
+static __init pgprot_t pgprot_from_va(uintptr_t va)
+{
+	if (IS_ENABLED(CONFIG_64BIT) && !is_kernel_mapping(va))
+		return PAGE_KERNEL;
+
+	return PAGE_KERNEL_EXEC;
+}
+#endif /* CONFIG_STRICT_KERNEL_RWX */
+
 /*
  * setup_vm() is called from head.S with MMU-off.
  *
@@ -454,7 +490,8 @@ uintptr_t xiprom, xiprom_sz;
 #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
 #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
 
-static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
+static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
+					    __always_unused bool early)
 {
 	uintptr_t va, end_va;
 
@@ -473,7 +510,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
 				   map_size, PAGE_KERNEL);
 }
 #else
-static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
+static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size, bool early)
 {
 	uintptr_t va, end_va;
 
@@ -481,7 +518,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
 	for (va = kernel_virt_addr; va < end_va; va += map_size)
 		create_pgd_mapping(pgdir, va,
 				   load_pa + (va - kernel_virt_addr),
-				   map_size, PAGE_KERNEL_EXEC);
+				   map_size, early ? PAGE_KERNEL_EXEC : pgprot_from_va(va));
 }
 #endif
 
@@ -558,7 +595,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	 * us to reach paging_init(). We map all memory banks later
 	 * in setup_vm_final() below.
 	 */
-	create_kernel_page_table(early_pg_dir, map_size);
+	create_kernel_page_table(early_pg_dir, map_size, true);
 
 #ifndef __PAGETABLE_PMD_FOLDED
 	/* Setup early PMD for DTB */
@@ -634,22 +671,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 }
 
-#if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
-void protect_kernel_linear_mapping_text_rodata(void)
-{
-	unsigned long text_start = (unsigned long)lm_alias(_start);
-	unsigned long init_text_start = (unsigned long)lm_alias(__init_text_begin);
-	unsigned long rodata_start = (unsigned long)lm_alias(__start_rodata);
-	unsigned long data_start = (unsigned long)lm_alias(_data);
-
-	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
-	set_memory_nx(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
-
-	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
-	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
-}
-#endif
-
 static void __init setup_vm_final(void)
 {
 	uintptr_t va, map_size;
@@ -682,21 +703,15 @@ static void __init setup_vm_final(void)
 		map_size = best_map_size(start, end - start);
 		for (pa = start; pa < end; pa += map_size) {
 			va = (uintptr_t)__va(pa);
-			create_pgd_mapping(swapper_pg_dir, va, pa,
-					   map_size,
-#ifdef CONFIG_64BIT
-					   PAGE_KERNEL
-#else
-					   PAGE_KERNEL_EXEC
-#endif
-					);
 
+			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
+					   pgprot_from_va(va));
 		}
 	}
 
 #ifdef CONFIG_64BIT
 	/* Map the kernel */
-	create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
+	create_kernel_page_table(swapper_pg_dir, PMD_SIZE, false);
 #endif
 
 	/* Clear fixmap PTE and PMD mappings */
@@ -727,35 +742,6 @@ static inline void setup_vm_final(void)
 }
 #endif /* CONFIG_MMU */
 
-#ifdef CONFIG_STRICT_KERNEL_RWX
-void __init protect_kernel_text_data(void)
-{
-	unsigned long text_start = (unsigned long)_start;
-	unsigned long init_text_start = (unsigned long)__init_text_begin;
-	unsigned long init_data_start = (unsigned long)__init_data_begin;
-	unsigned long rodata_start = (unsigned long)__start_rodata;
-	unsigned long data_start = (unsigned long)_data;
-	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
-
-	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
-	set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
-	set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
-	/* rodata section is marked readonly in mark_rodata_ro */
-	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
-	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
-}
-
-void mark_rodata_ro(void)
-{
-	unsigned long rodata_start = (unsigned long)__start_rodata;
-	unsigned long data_start = (unsigned long)_data;
-
-	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
-
-	debug_checkwx();
-}
-#endif
-
 #ifdef CONFIG_KEXEC_CORE
 /*
  * reserve_crashkernel() - reserves memory for crash kernel
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
