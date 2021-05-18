Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133CBC433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 15:22:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8782F611BD
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 15:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8782F611BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oympgjdQv4/FwzYOqvLhdCFVKT94Pzhy1ABM3RcLdpg=; b=WCR48XqT6ScR0JZsMAp5+hkTcc
	IAWcwboOPxuRiGWChSSYke5tjSYcTGkPOMVncPQgRgeZzZa7dafcO/ZjoZInxV8YiQzJSCmf3yh3x
	u3lxCoBNn++xUP4J5JtWRlljsYM74j8Zct8ssIcMWOALT6G+l2coUyc1xPX64hmvbSlZiXATDPcBb
	RckYP+KSiGPxpSdAX8NdIgpZnq6//hjIn0Jdfj7T6aXKRJoUmPOlZhh8d3pz5TuUGL99XT3Y42iNu
	HRcJkw74D9cVyjpfsyWab+3GjTIyC6oyHRAlC+3qWWMe7MOv5B6yy3ClhQNLNCtOpVgmS0PCgDR+a
	GiTW6oLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj1Xa-001ANG-6b; Tue, 18 May 2021 15:21:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj1XW-001AMH-3J
 for linux-riscv@desiato.infradead.org; Tue, 18 May 2021 15:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CvtPTgT9V0A0cObCZBCFt4MiSRC91gGNm9k32gWwLjs=; b=PnLR6R81zG5K0Iu3nB0deC5A0i
 VYeK/UHty4SH52duGT+mLpj5Ma4YT5geP56+5b3UC0PtmeKdL1+eVX/wwih32gXmecJ44jKskl1/K
 KQeWFS0g4KMNCGTPCO+c80YU5v8l5e9MZsHVyvrFsBKVT7y45Y4IVlvypC5Ec+AIk0H0XL9RWCMsZ
 Vu/znuXBN0TCEs+k41vH2ooFVXdT6f7IKsy24Mp/xsd2c3BMW0bTXwxVvTgkjIZDbftAj9Yyr4Q4J
 S25fDZGdtEiSPN9oTuy1ZbpMmCfiJ9gYOTHluXwg4+/2PynyI08rqB5N/MwMDP0bg+Rl+rN1ZfFxx
 G0/k1E1A==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj1XS-00ElPZ-CG
 for linux-riscv@lists.infradead.org; Tue, 18 May 2021 15:21:44 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 11C4F60002;
 Tue, 18 May 2021 15:21:35 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC] riscv: Map the kernel with correct permissions the first
 time
Date: Tue, 18 May 2021 17:21:34 +0200
Message-Id: <20210518152134.1772653-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_082142_717586_6A26FB61 
X-CRM114-Status: GOOD (  15.65  )
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

This patchset was tested on:

* kernel:
- rv32 with CONFIG_STRICT_KERNEL_RWX: OK
- rv32 without CONFIG_STRICT_KERNEL_RWX: OK
- rv64 with CONFIG_STRICT_KERNEL_RWX: OK
- rv64 without CONFIG_STRICT_KERNEL_RWX: OK

* xipkernel:
- rv32: build only
- rv64: OK

 arch/riscv/include/asm/set_memory.h |  2 -
 arch/riscv/kernel/setup.c           |  1 -
 arch/riscv/mm/init.c                | 80 ++++++++++++++---------------
 3 files changed, 38 insertions(+), 45 deletions(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 086f757e8ba3..70154f012791 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -16,13 +16,11 @@ int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
 int set_memory_rw_nx(unsigned long addr, int numpages);
-void protect_kernel_text_data(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
-static inline void protect_kernel_text_data(void) {}
 static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 03901d3a8b02..1eb50e512056 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -292,7 +292,6 @@ void __init setup_arch(char **cmdline_p)
 	sbi_init();
 
 	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
-		protect_kernel_text_data();
 		protect_kernel_linear_mapping_text_rodata();
 	}
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4faf8bd157ea..92b3184420a2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -436,6 +436,36 @@ asmlinkage void __init __copy_data(void)
 }
 #endif
 
+#ifdef CONFIG_STRICT_KERNEL_RWX
+#define is_text_va(va)		({								\
+		unsigned long _va = va;								\
+		(_va < (unsigned long)__init_data_begin && _va >= (unsigned long)_start);	\
+	})
+
+static inline __init pgprot_t pgprot_from_kernel_va(uintptr_t va)
+{
+	return is_text_va(va) ? PAGE_KERNEL_READ_EXEC : PAGE_KERNEL;
+}
+
+void mark_rodata_ro(void)
+{
+	unsigned long rodata_start = (unsigned long)__start_rodata;
+	unsigned long data_start = (unsigned long)_data;
+
+	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
+
+	debug_checkwx();
+}
+#else
+static inline __init pgprot_t pgprot_from_kernel_va(uintptr_t va)
+{
+	if (IS_ENABLED(CONFIG_32BIT))
+		return PAGE_KERNEL_EXEC;
+
+	return (va < kernel_virt_addr) ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
+}
+#endif
+
 /*
  * setup_vm() is called from head.S with MMU-off.
  *
@@ -465,7 +495,8 @@ uintptr_t xiprom, xiprom_sz;
 #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
 #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
 
-static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
+static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
+					    __always_unused bool early)
 {
 	uintptr_t va, end_va;
 
@@ -484,7 +515,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
 				   map_size, PAGE_KERNEL);
 }
 #else
-static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
+static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size, bool early)
 {
 	uintptr_t va, end_va;
 
@@ -492,7 +523,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
 	for (va = kernel_virt_addr; va < end_va; va += map_size)
 		create_pgd_mapping(pgdir, va,
 				   load_pa + (va - kernel_virt_addr),
-				   map_size, PAGE_KERNEL_EXEC);
+				   map_size, early ? PAGE_KERNEL_EXEC : pgprot_from_kernel_va(va));
 }
 #endif
 
@@ -569,7 +600,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	 * us to reach paging_init(). We map all memory banks later
 	 * in setup_vm_final() below.
 	 */
-	create_kernel_page_table(early_pg_dir, map_size);
+	create_kernel_page_table(early_pg_dir, map_size, true);
 
 #ifndef __PAGETABLE_PMD_FOLDED
 	/* Setup early PMD for DTB */
@@ -693,21 +724,15 @@ static void __init setup_vm_final(void)
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
+					   pgprot_from_kernel_va(va));
 		}
 	}
 
 #ifdef CONFIG_64BIT
 	/* Map the kernel */
-	create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
+	create_kernel_page_table(swapper_pg_dir, PMD_SIZE, false);
 #endif
 
 	/* Clear fixmap PTE and PMD mappings */
@@ -738,35 +763,6 @@ static inline void setup_vm_final(void)
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
