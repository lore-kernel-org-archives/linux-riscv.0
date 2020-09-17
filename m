Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8396EC43466
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 22:38:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 182FC208DB
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 22:38:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JRLCvwQS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JUlFZNP3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 182FC208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gsqb6v/Dzna2ZvWi/6qIywY/AlLTRWHMhg8nahUnd2Q=; b=JRLCvwQSuxZoeb64KIbJPBHUn
	vybIdRu3AoCzE2TgVSu7f6JYj7EhFrsWZEOpxjbicYTKJsIPPiHn+GeF0YM19iURN8b2p+szR9YsZ
	A56tKNPPCSp+9EWS07SzZxfxJLahXaC2qnccj6ZvNKuuaNHS+h/sN8WDap3KzTL2+EqMS5Z45j1Ya
	6uinl5DqUSHlbKUR7aP/r2Dt49M9o70ayJjn4UDoJUoAYhYXYs/ozVOaPm+qv+yBhr+bxHWkFsn1X
	JMRqV51ao1sQuZ5eqytxJ3ui3nOVSWFiY+n+DNfIIxYXldus3QrRGwOzvipYDANZJwx8YyGL0xTWg
	Dsh1/usUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ2XI-0005lI-Ri; Thu, 17 Sep 2020 22:37:52 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ2X9-0005fT-Jr
 for linux-riscv@lists.infradead.org; Thu, 17 Sep 2020 22:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600382263; x=1631918263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IhVO8KqIF9i3iFOfVHcKtV7XvLvZ0VsM4lDALZ6rfXg=;
 b=JUlFZNP3x8GZmhWSuuD++IR+Qk6hEcW+S05DcSyHQPQvee4MfxozC0jR
 Te7w5smCkvcoWw7TIyxSglgH6AxJwB2AZX4eOu+J+eHix1BE1Mya9qnYv
 n7xdt+mpFH0nhtWYFyJtTFb4ju9bEF1TtefnFmOAQuI/vZADALJCQXCMU
 lphAqMhzN5ajcEFTyuYZSAAA1y+xp9rQRS2imzK80cQflBnTMseE89esX
 MsOIbeB2gzw8woL9pckTiQdxqcHgUA2X21uhd90cN4tdYvSkRdTJb+HQe
 mD0LSQOTcLta+21qav1ezmDIxmX4B9wUJNv15doptB6dv7DahGx/Etzgj g==;
IronPort-SDR: Hd5AoIMSlA343yDExV65X+yfTD047M+57lGpuaUiN7h60Jc0OW6y3hs1SFjCAaBkohHfKFUYzv
 D3JP02hPnTkD5kCbkxUMJzGp5KKCKYPb34AjgMnKJ1WCA9roj8bpiLLiW0xVovCMhc3cOuJLQY
 G1WNC8CQaS2n5vFL2j72yErdISbLV8JSZHDVieZkSqPChVA9WQfFPvxxAGFuHJBhVBJLtFHSyN
 /OCMoe5uvz0noTyHsb0U0x1URJTn6MG4ZGhd/3Ww4uMT4LjalzF/Gpmk/88rxIY90GfS1ip3QP
 kQg=
X-IronPort-AV: E=Sophos;i="5.77,272,1596470400"; d="scan'208";a="257336260"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2020 06:37:42 +0800
IronPort-SDR: y0uWzCaG/Zk8sTud4licRbX8RB2ZPKn4kuT+e477iwxgsOXPePAemBDhSa9UE9Dh/OOqALUSEe
 Jmuda71ejasg==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 15:23:56 -0700
IronPort-SDR: TA7SNUHWD38uDTzjIrz6BIO+FN5SCGEk/2fWn/eUDI+ZZhvx+yng/jG4P8lU2cPvnGIN4b63cn
 SqQ2jbIQXegw==
WDCIronportException: Internal
Received: from use204338.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.39])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Sep 2020 15:37:42 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/7] RISC-V: Add EFI runtime services
Date: Thu, 17 Sep 2020 15:37:15 -0700
Message-Id: <20200917223716.2300238-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917223716.2300238-1-atish.patra@wdc.com>
References: <20200917223716.2300238-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_183743_835639_4F683F8E 
X-CRM114-Status: GOOD (  31.08  )
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
Cc: linux-efi@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Ard Biesheuvel <ardb@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anup Patel <anup.patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch adds EFI runtime service support for RISC-V.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
[ardb: - Remove the page check]
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig                      |   2 +
 arch/riscv/include/asm/efi.h            |  20 ++++
 arch/riscv/include/asm/mmu.h            |   2 +
 arch/riscv/include/asm/pgtable.h        |   4 +
 arch/riscv/kernel/Makefile              |   2 +
 arch/riscv/kernel/efi.c                 |  96 ++++++++++++++++
 arch/riscv/kernel/setup.c               |   7 +-
 arch/riscv/mm/init.c                    |   2 +-
 drivers/firmware/efi/Makefile           |   2 +
 drivers/firmware/efi/libstub/efi-stub.c |  11 +-
 drivers/firmware/efi/riscv-runtime.c    | 143 ++++++++++++++++++++++++
 11 files changed, 287 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/kernel/efi.c
 create mode 100644 drivers/firmware/efi/riscv-runtime.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6ef2394be857..c8e57d77c144 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -412,7 +412,9 @@ config EFI
 	select EFI_PARAMS_FROM_FDT
 	select EFI_STUB
 	select EFI_GENERIC_STUB
+	select EFI_RUNTIME_WRAPPERS
 	select RISCV_ISA_C
+	depends on MMU
 	default y
 	help
 	  This option provides support for runtime services provided
diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
index bf6a40e20a8e..7542282f1141 100644
--- a/arch/riscv/include/asm/efi.h
+++ b/arch/riscv/include/asm/efi.h
@@ -5,11 +5,28 @@
 #ifndef _ASM_EFI_H
 #define _ASM_EFI_H
 
+#include <asm/csr.h>
 #include <asm/io.h>
 #include <asm/mmu_context.h>
 #include <asm/ptrace.h>
 #include <asm/tlbflush.h>
 
+#ifdef CONFIG_EFI
+extern void efi_init(void);
+#else
+#define efi_init()
+#endif
+
+int efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md);
+int efi_set_mapping_permissions(struct mm_struct *mm, efi_memory_desc_t *md);
+
+#define arch_efi_call_virt_setup()      efi_virtmap_load()
+#define arch_efi_call_virt_teardown()   efi_virtmap_unload()
+
+#define arch_efi_call_virt(p, f, args...) p->f(args)
+
+#define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)
+
 /* on RISC-V, the FDT may be located anywhere in system RAM */
 static inline unsigned long efi_get_max_fdt_addr(unsigned long image_addr)
 {
@@ -32,4 +49,7 @@ static inline void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
 {
 }
 
+void efi_virtmap_load(void);
+void efi_virtmap_unload(void);
+
 #endif /* _ASM_EFI_H */
diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 967eacb01ab5..dabcf2cfb3dc 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -20,6 +20,8 @@ typedef struct {
 #endif
 } mm_context_t;
 
+void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa,
+			       phys_addr_t sz, pgprot_t prot);
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_MMU_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 815f8c959dd4..183f1f4b2ae6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -100,6 +100,10 @@
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
+#define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
+#define PAGE_KERNEL_EXEC	__pgprot(_PAGE_KERNEL | _PAGE_EXEC)
+#define PAGE_KERNEL_READ_EXEC	__pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
+					 | _PAGE_EXEC)
 
 #define PAGE_TABLE		__pgprot(_PAGE_TABLE)
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index dc93710f0b2f..fa896c5f7ccb 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -55,4 +55,6 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
 
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
+obj-$(CONFIG_EFI)		+= efi.o
+
 clean:
diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
new file mode 100644
index 000000000000..024159298231
--- /dev/null
+++ b/arch/riscv/kernel/efi.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ * Adapted from arch/arm64/kernel/efi.c
+ */
+
+#include <linux/efi.h>
+#include <linux/init.h>
+
+#include <asm/efi.h>
+#include <asm/pgtable.h>
+#include <asm/pgtable-bits.h>
+
+/*
+ * Only regions of type EFI_RUNTIME_SERVICES_CODE need to be
+ * executable, everything else can be mapped with the XN bits
+ * set. Also take the new (optional) RO/XP bits into account.
+ */
+static __init pgprot_t efimem_to_pgprot_map(efi_memory_desc_t *md)
+{
+	u64 attr = md->attribute;
+	u32 type = md->type;
+
+	if (type == EFI_MEMORY_MAPPED_IO)
+		return PAGE_KERNEL;
+
+	/* R-- */
+	if ((attr & (EFI_MEMORY_XP | EFI_MEMORY_RO)) ==
+	    (EFI_MEMORY_XP | EFI_MEMORY_RO))
+		return PAGE_KERNEL_READ;
+
+	/* R-X */
+	if (attr & EFI_MEMORY_RO)
+		return PAGE_KERNEL_READ_EXEC;
+
+	/* RW- */
+	if (((attr & (EFI_MEMORY_RP | EFI_MEMORY_WP | EFI_MEMORY_XP)) ==
+	     EFI_MEMORY_XP) ||
+	    type != EFI_RUNTIME_SERVICES_CODE)
+		return PAGE_KERNEL;
+
+	/* RWX */
+	return PAGE_KERNEL_EXEC;
+}
+
+int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
+{
+	pgprot_t prot = __pgprot(pgprot_val(efimem_to_pgprot_map(md)) &
+				~(_PAGE_GLOBAL));
+	int i;
+
+	/* RISC-V maps one page at a time */
+	for (i = 0; i < md->num_pages; i++)
+		create_pgd_mapping(mm->pgd, md->virt_addr + i * PAGE_SIZE,
+				   md->phys_addr + i * PAGE_SIZE,
+				   PAGE_SIZE, prot);
+	return 0;
+}
+
+static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
+{
+	efi_memory_desc_t *md = data;
+	pte_t pte = READ_ONCE(*ptep);
+	unsigned long val;
+
+	if (md->attribute & EFI_MEMORY_RO) {
+		val = pte_val(pte) & ~_PAGE_WRITE;
+		val = pte_val(pte) | _PAGE_READ;
+		pte = __pte(val);
+	}
+	if (md->attribute & EFI_MEMORY_XP) {
+		val = pte_val(pte) & ~_PAGE_EXEC;
+		pte = __pte(val);
+	}
+	set_pte(ptep, pte);
+
+	return 0;
+}
+
+int __init efi_set_mapping_permissions(struct mm_struct *mm,
+				       efi_memory_desc_t *md)
+{
+	BUG_ON(md->type != EFI_RUNTIME_SERVICES_CODE &&
+	       md->type != EFI_RUNTIME_SERVICES_DATA);
+
+	/*
+	 * Calling apply_to_page_range() is only safe on regions that are
+	 * guaranteed to be mapped down to pages. Since we are only called
+	 * for regions that have been mapped using efi_create_mapping() above
+	 * (and this is checked by the generic Memory Attributes table parsing
+	 * routines), there is no need to check that again here.
+	 */
+	return apply_to_page_range(mm, md->virt_addr,
+				   md->num_pages << EFI_PAGE_SHIFT,
+				   set_permissions, md);
+}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 41ef96d0d97a..4c96ac198e14 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -17,6 +17,7 @@
 #include <linux/sched/task.h>
 #include <linux/swiotlb.h>
 #include <linux/smp.h>
+#include <linux/efi.h>
 
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
@@ -26,11 +27,12 @@
 #include <asm/tlbflush.h>
 #include <asm/thread_info.h>
 #include <asm/kasan.h>
+#include <asm/efi.h>
 
 #include "head.h"
 
-#ifdef CONFIG_DUMMY_CONSOLE
-struct screen_info screen_info = {
+#if defined(CONFIG_DUMMY_CONSOLE) || defined(CONFIG_EFI)
+struct screen_info screen_info __section(.data) = {
 	.orig_video_lines	= 30,
 	.orig_video_cols	= 80,
 	.orig_video_mode	= 0,
@@ -75,6 +77,7 @@ void __init setup_arch(char **cmdline_p)
 	early_ioremap_setup();
 	parse_early_param();
 
+	efi_init();
 	setup_bootmem();
 	paging_init();
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 63acc8185bfa..c888c4470b34 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -390,7 +390,7 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 #define fixmap_pgd_next		fixmap_pte
 #endif
 
-static void __init create_pgd_mapping(pgd_t *pgdp,
+void __init create_pgd_mapping(pgd_t *pgdp,
 				      uintptr_t va, phys_addr_t pa,
 				      phys_addr_t sz, pgprot_t prot)
 {
diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 61fd1e8b26fb..4d628081bb2f 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -35,6 +35,8 @@ fake_map-$(CONFIG_X86)			+= x86_fake_mem.o
 arm-obj-$(CONFIG_EFI)			:= efi-init.o arm-runtime.o
 obj-$(CONFIG_ARM)			+= $(arm-obj-y)
 obj-$(CONFIG_ARM64)			+= $(arm-obj-y)
+riscv-obj-$(CONFIG_EFI)			:= efi-init.o riscv-runtime.o
+obj-$(CONFIG_RISCV)			+= $(riscv-obj-y)
 obj-$(CONFIG_EFI_CAPSULE_LOADER)	+= capsule-loader.o
 obj-$(CONFIG_EFI_EARLYCON)		+= earlycon.o
 obj-$(CONFIG_UEFI_CPER_ARM)		+= cper-arm.o
diff --git a/drivers/firmware/efi/libstub/efi-stub.c b/drivers/firmware/efi/libstub/efi-stub.c
index 311a16802dd6..914a343c7785 100644
--- a/drivers/firmware/efi/libstub/efi-stub.c
+++ b/drivers/firmware/efi/libstub/efi-stub.c
@@ -17,7 +17,10 @@
 
 /*
  * This is the base address at which to start allocating virtual memory ranges
- * for UEFI Runtime Services. This is in the low TTBR0 range so that we can use
+ * for UEFI Runtime Services.
+ *
+ * For ARM/ARM64:
+ * This is in the low TTBR0 range so that we can use
  * any allocation we choose, and eliminate the risk of a conflict after kexec.
  * The value chosen is the largest non-zero power of 2 suitable for this purpose
  * both on 32-bit and 64-bit ARM CPUs, to maximize the likelihood that it can
@@ -25,6 +28,12 @@
  * Since 32-bit ARM could potentially execute with a 1G/3G user/kernel split,
  * map everything below 1 GB. (512 MB is a reasonable upper bound for the
  * entire footprint of the UEFI runtime services memory regions)
+ *
+ * For RISC-V:
+ * There is no specific reason for which, this address (512MB) can't be used
+ * EFI runtime virtual address for RISC-V. It also helps to use EFI runtime
+ * services on both RV32/RV64. Keep the same runtime virtual address for RISC-V
+ * as well to minimize the code churn.
  */
 #define EFI_RT_VIRTUAL_BASE	SZ_512M
 #define EFI_RT_VIRTUAL_SIZE	SZ_512M
diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
new file mode 100644
index 000000000000..d28e715d2bcc
--- /dev/null
+++ b/drivers/firmware/efi/riscv-runtime.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Extensible Firmware Interface
+ *
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ *
+ * Based on Extensible Firmware Interface Specification version 2.4
+ * Adapted from drivers/firmware/efi/arm-runtime.c
+ *
+ */
+
+#include <linux/dmi.h>
+#include <linux/efi.h>
+#include <linux/io.h>
+#include <linux/memblock.h>
+#include <linux/mm_types.h>
+#include <linux/preempt.h>
+#include <linux/rbtree.h>
+#include <linux/rwsem.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/pgtable.h>
+
+#include <asm/cacheflush.h>
+#include <asm/efi.h>
+#include <asm/mmu.h>
+#include <asm/pgalloc.h>
+
+static bool __init efi_virtmap_init(void)
+{
+	efi_memory_desc_t *md;
+
+	efi_mm.pgd = pgd_alloc(&efi_mm);
+	mm_init_cpumask(&efi_mm);
+	init_new_context(NULL, &efi_mm);
+
+	for_each_efi_memory_desc(md) {
+		phys_addr_t phys = md->phys_addr;
+		int ret;
+
+		if (!(md->attribute & EFI_MEMORY_RUNTIME))
+			continue;
+		if (md->virt_addr == 0)
+			return false;
+
+		ret = efi_create_mapping(&efi_mm, md);
+		if (ret) {
+			pr_warn("  EFI remap %pa: failed to create mapping (%d)\n",
+				&phys, ret);
+			return false;
+		}
+	}
+
+	if (efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions))
+		return false;
+
+	return true;
+}
+
+/*
+ * Enable the UEFI Runtime Services if all prerequisites are in place, i.e.,
+ * non-early mapping of the UEFI system table and virtual mappings for all
+ * EFI_MEMORY_RUNTIME regions.
+ */
+static int __init riscv_enable_runtime_services(void)
+{
+	u64 mapsize;
+
+	if (!efi_enabled(EFI_BOOT)) {
+		pr_info("EFI services will not be available.\n");
+		return 0;
+	}
+
+	efi_memmap_unmap();
+
+	mapsize = efi.memmap.desc_size * efi.memmap.nr_map;
+
+	if (efi_memmap_init_late(efi.memmap.phys_map, mapsize)) {
+		pr_err("Failed to remap EFI memory map\n");
+		return 0;
+	}
+
+	if (efi_soft_reserve_enabled()) {
+		efi_memory_desc_t *md;
+
+		for_each_efi_memory_desc(md) {
+			int md_size = md->num_pages << EFI_PAGE_SHIFT;
+			struct resource *res;
+
+			if (!(md->attribute & EFI_MEMORY_SP))
+				continue;
+
+			res = kzalloc(sizeof(*res), GFP_KERNEL);
+			if (WARN_ON(!res))
+				break;
+
+			res->start	= md->phys_addr;
+			res->end	= md->phys_addr + md_size - 1;
+			res->name	= "Soft Reserved";
+			res->flags	= IORESOURCE_MEM;
+			res->desc	= IORES_DESC_SOFT_RESERVED;
+
+			insert_resource(&iomem_resource, res);
+		}
+	}
+
+	if (efi_runtime_disabled()) {
+		pr_info("EFI runtime services will be disabled.\n");
+		return 0;
+	}
+
+	if (efi_enabled(EFI_RUNTIME_SERVICES)) {
+		pr_info("EFI runtime services access via paravirt.\n");
+		return 0;
+	}
+
+	pr_info("Remapping and enabling EFI services.\n");
+
+	if (!efi_virtmap_init()) {
+		pr_err("UEFI virtual mapping missing or invalid -- runtime services will not be available\n");
+		return -ENOMEM;
+	}
+
+	/* Set up runtime services function pointers */
+	efi_native_runtime_setup();
+	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
+
+	return 0;
+}
+early_initcall(riscv_enable_runtime_services);
+
+void efi_virtmap_load(void)
+{
+	preempt_disable();
+	switch_mm(current->active_mm, &efi_mm, NULL);
+}
+
+void efi_virtmap_unload(void)
+{
+	switch_mm(&efi_mm, current->active_mm, NULL);
+	preempt_enable();
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
