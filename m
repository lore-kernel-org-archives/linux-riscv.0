Return-Path: <SRS0=T9/Q=BW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BD9C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2020 23:48:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E5932076B
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2020 23:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tfgHp6hp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IMNxETqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E5932076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9fyYBuXu+2osGaLUqAop0JLOXVuWkMcAipZ3vSr95/k=; b=tfgHp6hpOkALhWFysMl010Qy1
	vHD+gfyNbHoMSQUAdg+j5j46jfWOf1UP+DueURkgIVJdtfPlxpvvpMHTgKXmHUBv5lqyLUeGDSPjL
	modItHl+H6aziB7GxBqsAum7cIh6AkK1d1uVVtIEgVIah6dHaKbehsQSZLaLhxdBAK44XCDm+zm7M
	K4sMrTZjpf0c3OG4FSeaCZYbjGLSP7lTAJxOrwIeJTCJ2FVBJCfQCXC+dICDxDm18xrmWb3OXxxYB
	0B27cMYIMF0AH631sWdvipjRH8FL0HTn4QiCktaSAqfU0NbqlnbyrluiGJ7KLYcZdRKjmHnVIRmOe
	uN6ytYRwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k60U2-0007kP-Rs; Wed, 12 Aug 2020 23:48:38 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k60Tz-0007iI-Dx
 for linux-riscv@lists.infradead.org; Wed, 12 Aug 2020 23:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597276115; x=1628812115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UAlY9YJFPNE9jtEWEqplpZ6F76rgkCODFo1w6OH+Bsg=;
 b=IMNxETqgoxanvMHbdbV8vr7fTn12gamLT7obCpewzMXeRIF8FHwHo92K
 +YHSC8Pw607ntWV8kDOM78abfbD5ySRqFTc8usX1qFyPGFmzRl6MO7IyT
 tL9DV2I+YdfXBWfzdd2bt5ZkiRcAafx/vCNrbnarVeg4fWtfvWQmeFy33
 Qy2HSo26XGB7lFzcyLFfqTQAK65LAJgfXrUkgabhozdmVBnmlGZEMj5UH
 m6kLMlAmvPe5n/cvhR+UramjKnZwmTWKV1OkEH1odpWsp4zVPCYK3NZHX
 m44EXJJmk+8ibCRO4zetmRvoCPMm8/idl6BVXrP6WiOdt9V6gVS4P6wxk Q==;
IronPort-SDR: POVyy+lbHdtm8fzfdYygopIHTGAIbrPO6CRfUEXoLOXGOddkNDqGlcF1sH0vP7SXafR/1My00P
 qqggKbLVaORUraonFGJ7t8ZewwxAJ+33lLM/NO8WZefS8/TVjLsNNFF5Gw2YppQMevZHdPfJHA
 IneOm0TGGmzDyg7DLb0vbLvXUpU5vOxbul/3PTGIS2P+Xx2F092Bli4xhTvISucz8xN++s/sc1
 15FIdBKKVxVWP5xgoeUdQZaxiq94d8Uxiq8cjPvniqYbB3ARBVlELh+S0TP+xECZpOwCMk60LH
 1ZU=
X-IronPort-AV: E=Sophos;i="5.76,305,1592841600"; d="scan'208";a="144856842"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Aug 2020 07:48:32 +0800
IronPort-SDR: En38psaCaYKL/IrgNfHnSKaVPRCcvkY9+mXMnA6//t7QRr8edtWAoWhnL3J3jnH+jMqySCnZiW
 pCFANsyY51Ag==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 16:35:39 -0700
IronPort-SDR: Vj4b4msaw1AOEg7uhKiWy0lQAMxEvEepMvXXl69QcOtSIfAZ0L8ONNN0NkZ4PRswFd9MJKRUMN
 MF9r+QyoDgYA==
WDCIronportException: Internal
Received: from usa002576.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.59])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Aug 2020 16:48:29 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/9] RISC-V: Move DT mapping outof fixmap
Date: Wed, 12 Aug 2020 16:47:50 -0700
Message-Id: <20200812234758.3563-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200812234758.3563-1-atish.patra@wdc.com>
References: <20200812234758.3563-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_194835_642909_2CC9BE6A 
X-CRM114-Status: GOOD (  20.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Waiman Long <longman@redhat.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, Daniel Schaefer <daniel.schaefer@hpe.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, fwts-devel@lists.ubuntu.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <anup.patel@wdc.com>

Currently, RISC-V reserves 1MB of fixmap memory for device tree. However,
it maps only single PMD (2MB) space for fixmap which leaves only < 1MB space
left for other kernel features such as early ioremap which requires fixmap
as well. The fixmap size can be increased by another 2MB but it brings
additional complexity and changes the virtual memory layout as well.
If we require some additional feature requiring fixmap again, it has to be
moved again.

Technically, DT doesn't need a fixmap as the memory occupied by the DT is
only used during boot. That's why, We map device tree in early page table
using two consecutive PGD mappings at lower addresses (< PAGE_OFFSET).
This frees lot of space in fixmap and also makes maximum supported
device tree size supported as PGDIR_SIZE. Thus, init memory section can be used
for the same purpose as well. This simplifies fixmap implementation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/fixmap.h  |  3 ---
 arch/riscv/include/asm/pgtable.h |  1 +
 arch/riscv/kernel/head.S         |  1 -
 arch/riscv/kernel/head.h         |  2 --
 arch/riscv/kernel/setup.c        |  9 +++++++--
 arch/riscv/mm/init.c             | 26 ++++++++++++--------------
 6 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
index 1ff075a8dfc7..11613f38228a 100644
--- a/arch/riscv/include/asm/fixmap.h
+++ b/arch/riscv/include/asm/fixmap.h
@@ -22,9 +22,6 @@
  */
 enum fixed_addresses {
 	FIX_HOLE,
-#define FIX_FDT_SIZE	SZ_1M
-	FIX_FDT_END,
-	FIX_FDT = FIX_FDT_END + FIX_FDT_SIZE / PAGE_SIZE - 1,
 	FIX_PTE,
 	FIX_PMD,
 	FIX_TEXT_POKE1,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index eaea1f717010..815f8c959dd4 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -464,6 +464,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
 #define kern_addr_valid(addr)   (1) /* FIXME */
 
 extern void *dtb_early_va;
+extern uintptr_t dtb_early_pa;
 void setup_bootmem(void);
 void paging_init(void);
 
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 7822054dbd88..a2f0cb3ca0a6 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -255,7 +255,6 @@ clear_bss_done:
 #endif
 	/* Start the kernel */
 	call soc_early_init
-	call parse_dtb
 	tail start_kernel
 
 .Lsecondary_start:
diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
index 105fb0496b24..b48dda3d04f6 100644
--- a/arch/riscv/kernel/head.h
+++ b/arch/riscv/kernel/head.h
@@ -16,6 +16,4 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa);
 extern void *__cpu_up_stack_pointer[];
 extern void *__cpu_up_task_pointer[];
 
-void __init parse_dtb(void);
-
 #endif /* __ASM_HEAD_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f04373be54a6..6a0ee2405813 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -49,8 +49,9 @@ atomic_t hart_lottery __section(.sdata);
 unsigned long boot_cpu_hartid;
 static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
-void __init parse_dtb(void)
+static void __init parse_dtb(void)
 {
+	/* Early scan of device tree from init memory */
 	if (early_init_dt_scan(dtb_early_va))
 		return;
 
@@ -63,6 +64,7 @@ void __init parse_dtb(void)
 
 void __init setup_arch(char **cmdline_p)
 {
+	parse_dtb();
 	init_mm.start_code = (unsigned long) _stext;
 	init_mm.end_code   = (unsigned long) _etext;
 	init_mm.end_data   = (unsigned long) _edata;
@@ -77,7 +79,10 @@ void __init setup_arch(char **cmdline_p)
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
 #else
-	unflatten_device_tree();
+	if (early_init_dt_verify(__va(dtb_early_pa)))
+		unflatten_device_tree();
+	else
+		pr_err("No DTB found in kernel mappings\n");
 #endif
 	clint_init_boot_cpu();
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 787c75f751a5..2b651f63f5c4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -28,7 +28,9 @@ unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 EXPORT_SYMBOL(empty_zero_page);
 
 extern char _start[];
-void *dtb_early_va;
+#define DTB_EARLY_BASE_VA      PGDIR_SIZE
+void *dtb_early_va __initdata;
+uintptr_t dtb_early_pa __initdata;
 
 static void __init zone_sizes_init(void)
 {
@@ -141,8 +143,6 @@ static void __init setup_initrd(void)
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
 
-static phys_addr_t dtb_early_pa __initdata;
-
 void __init setup_bootmem(void)
 {
 	struct memblock_region *reg;
@@ -399,7 +399,7 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
-	uintptr_t va, end_va;
+	uintptr_t va, pa, end_va;
 	uintptr_t load_pa = (uintptr_t)(&_start);
 	uintptr_t load_sz = (uintptr_t)(&_end) - load_pa;
 	uintptr_t map_size = best_map_size(load_pa, MAX_EARLY_MAPPING_SIZE);
@@ -448,16 +448,13 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 				   load_pa + (va - PAGE_OFFSET),
 				   map_size, PAGE_KERNEL_EXEC);
 
-	/* Create fixed mapping for early FDT parsing */
-	end_va = __fix_to_virt(FIX_FDT) + FIX_FDT_SIZE;
-	for (va = __fix_to_virt(FIX_FDT); va < end_va; va += PAGE_SIZE)
-		create_pte_mapping(fixmap_pte, va,
-				   dtb_pa + (va - __fix_to_virt(FIX_FDT)),
-				   PAGE_SIZE, PAGE_KERNEL);
-
-	/* Save pointer to DTB for early FDT parsing */
-	dtb_early_va = (void *)fix_to_virt(FIX_FDT) + (dtb_pa & ~PAGE_MASK);
-	/* Save physical address for memblock reservation */
+	/* Create two consecutive PGD mappings for FDT early scan */
+	pa = dtb_pa & ~(PGDIR_SIZE - 1);
+	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
+			   pa, PGDIR_SIZE, PAGE_KERNEL);
+	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
+			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
+	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
 	dtb_early_pa = dtb_pa;
 }
 
@@ -516,6 +513,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #else
 	dtb_early_va = (void *)dtb_pa;
 #endif
+	dtb_early_pa = dtb_pa;
 }
 
 static inline void setup_vm_final(void)
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
