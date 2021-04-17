Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D029C433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 17:22:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F53610CB
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 17:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F53610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuDS4HB/iHZJLqNjpi0igB0aRbHoHLFeOuAY018GxS8=; b=A8EbJth55R2aopUgdNgKK85EUb
	fwi/CHDauxPNS5Dak5+NVtxLSElJujLzf87U+HJ6wokMRaTQsP6cZ27VLqooqDCZ0fj7JsC4x1U4+
	phNil/34UJBZNAtXeT8Kb3YSDeIygprjYIwPLc3WTGNP0OdfjjOV20rwroEzrrWEeZrut7hBeNd7p
	cgsHrY3QTlEUxwkUWTkgn1V2XrAFybRKvxc5KV3ZubwKbKVANH3wsPntXmXdTxb5kKWVtUvb1403b
	GNePuXQTXkD5raLFxxWw6q5RMRQd19GaLSxVVON9luHJYlUCLp4Ea93C+iigDSkSI1cEv1RSe188x
	UuuXsZ6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXoeA-005pgO-BS; Sat, 17 Apr 2021 17:22:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXoe8-005pgD-AS
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 17:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=nbQqbZA5sAvHxnWJW0raOTKk398HGn3qUNCGAdQF63Y=; b=zkMeYJId6xrxOXgkd9Wv7zMqqN
 iGr2G+VTwYO+6dRfz8l6GgnzWMye9+HtrUhZRGKVJjxiAZub72or/ZWrBEeQV+frlkjw9nB9Uqfnc
 Q0a6na2/0ONjQL4EmzFyFziD1iUzSQqKEv94lT+uT0CRTvlBFgRXgfC+GbSIuJw3R2Uk4aD3YZxRo
 QoqxRA/F1x34hGs4HAAYHy3fz4S20C8mPFRzcZ67/SpfBTPkctG9i8thKF0YPSNpviDmVMWLaY+Y0
 fytO3b06sJf0+PLqc8Wbcsni9TGxmHzrg6f7H/FZ6Y1Ifkmhifj+8FVQHUowH3inBt923n7as00vp
 01kC2Ylg==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXoe2-00A7am-CJ
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 17:22:15 +0000
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0A91C100004;
 Sat, 17 Apr 2021 17:22:00 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] riscv: Fix 32b kernel caused by 64b kernel mapping moving
 outside linear mapping
Date: Sat, 17 Apr 2021 13:21:59 -0400
Message-Id: <20210417172159.32085-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_102210_696953_7B8C0A08 
X-CRM114-Status: GOOD (  15.27  )
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

Fix multiple leftovers when moving the kernel mapping outside the linear
mapping for 64b kernel that left the 32b kernel unusable.

Fixes: 4b67f48da707 ("riscv: Move kernel mapping outside of linear mapping")
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/include/asm/page.h    |  9 +++++++++
 arch/riscv/include/asm/pgtable.h | 16 ++++++++++++----
 arch/riscv/mm/init.c             | 25 ++++++++++++++++++++++++-
 3 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 22cfb2be60dc..f64b61296c0c 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -90,15 +90,20 @@ typedef struct page *pgtable_t;
 
 #ifdef CONFIG_MMU
 extern unsigned long va_pa_offset;
+#ifdef CONFIG_64BIT
 extern unsigned long va_kernel_pa_offset;
+#endif
 extern unsigned long pfn_base;
 #define ARCH_PFN_OFFSET		(pfn_base)
 #else
 #define va_pa_offset		0
+#ifdef CONFIG_64BIT
 #define va_kernel_pa_offset	0
+#endif
 #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
 #endif /* CONFIG_MMU */
 
+#ifdef CONFIG_64BIT
 extern unsigned long kernel_virt_addr;
 
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_pa_offset))
@@ -112,6 +117,10 @@ extern unsigned long kernel_virt_addr;
 	(_x < kernel_virt_addr) ?						\
 		linear_mapping_va_to_pa(_x) : kernel_mapping_va_to_pa(_x);	\
 	})
+#else
+#define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa_offset))
+#define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
+#endif
 
 #ifdef CONFIG_DEBUG_VIRTUAL
 extern phys_addr_t __virt_to_phys(unsigned long x);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 80e63a93e903..5afda75cc2c3 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -16,19 +16,27 @@
 #else
 
 #define ADDRESS_SPACE_END	(UL(-1))
-/*
- * Leave 2GB for kernel and BPF at the end of the address space
- */
+
+#ifdef CONFIG_64BIT
+/* Leave 2GB for kernel and BPF at the end of the address space */
 #define KERNEL_LINK_ADDR	(ADDRESS_SPACE_END - SZ_2G + 1)
+#else
+#define KERNEL_LINK_ADDR	PAGE_OFFSET
+#endif
 
 #define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
 #define VMALLOC_END      (PAGE_OFFSET - 1)
 #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
 
-/* KASLR should leave at least 128MB for BPF after the kernel */
 #define BPF_JIT_REGION_SIZE	(SZ_128M)
+#ifdef CONFIG_64BIT
+/* KASLR should leave at least 128MB for BPF after the kernel */
 #define BPF_JIT_REGION_START	PFN_ALIGN((unsigned long)&_end)
 #define BPF_JIT_REGION_END	(BPF_JIT_REGION_START + BPF_JIT_REGION_SIZE)
+#else
+#define BPF_JIT_REGION_START	(PAGE_OFFSET - BPF_JIT_REGION_SIZE)
+#define BPF_JIT_REGION_END	(VMALLOC_END)
+#endif
 
 /* Modules always live before the kernel */
 #ifdef CONFIG_64BIT
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 093f3a96ecfc..dc9b988e0778 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -91,8 +91,10 @@ static void print_vm_layout(void)
 		  (unsigned long)VMALLOC_END);
 	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
 		  (unsigned long)high_memory);
+#ifdef CONFIG_64BIT
 	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
 		  (unsigned long)ADDRESS_SPACE_END);
+#endif
 }
 #else
 static void print_vm_layout(void) { }
@@ -165,9 +167,11 @@ static struct pt_alloc_ops pt_ops;
 /* Offset between linear mapping virtual address and kernel load address */
 unsigned long va_pa_offset;
 EXPORT_SYMBOL(va_pa_offset);
+#ifdef CONFIG_64BIT
 /* Offset between kernel mapping virtual address and kernel load address */
 unsigned long va_kernel_pa_offset;
 EXPORT_SYMBOL(va_kernel_pa_offset);
+#endif
 unsigned long pfn_base;
 EXPORT_SYMBOL(pfn_base);
 
@@ -410,7 +414,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	load_sz = (uintptr_t)(&_end) - load_pa;
 
 	va_pa_offset = PAGE_OFFSET - load_pa;
+#ifdef CONFIG_64BIT
 	va_kernel_pa_offset = kernel_virt_addr - load_pa;
+#endif
 
 	pfn_base = PFN_DOWN(load_pa);
 
@@ -469,12 +475,16 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 			   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
 	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
 #else /* CONFIG_BUILTIN_DTB */
+#ifdef CONFIG_64BIT
 	/*
 	 * __va can't be used since it would return a linear mapping address
 	 * whereas dtb_early_va will be used before setup_vm_final installs
 	 * the linear mapping.
 	 */
 	dtb_early_va = kernel_mapping_pa_to_va(dtb_pa);
+#else
+	dtb_early_va = __va(dtb_pa);
+#endif /* CONFIG_64BIT */
 #endif /* CONFIG_BUILTIN_DTB */
 #else
 #ifndef CONFIG_BUILTIN_DTB
@@ -486,7 +496,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
 	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
 #else /* CONFIG_BUILTIN_DTB */
+#ifdef CONFIG_64BIT
 	dtb_early_va = kernel_mapping_pa_to_va(dtb_pa);
+#else
+	dtb_early_va = __va(dtb_pa);
+#endif /* CONFIG_64BIT */
 #endif /* CONFIG_BUILTIN_DTB */
 #endif
 	dtb_early_pa = dtb_pa;
@@ -571,12 +585,21 @@ static void __init setup_vm_final(void)
 		for (pa = start; pa < end; pa += map_size) {
 			va = (uintptr_t)__va(pa);
 			create_pgd_mapping(swapper_pg_dir, va, pa,
-					   map_size, PAGE_KERNEL);
+					   map_size,
+#ifdef CONFIG_64BIT
+					   PAGE_KERNEL
+#else
+					   PAGE_KERNEL_EXEC
+#endif
+					);
+
 		}
 	}
 
+#ifdef CONFIG_64BIT
 	/* Map the kernel */
 	create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
+#endif
 
 	/* Clear fixmap PTE and PMD mappings */
 	clear_fixmap(FIX_PTE);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
