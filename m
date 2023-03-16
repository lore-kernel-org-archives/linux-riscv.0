Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E2DC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fbuYVrzy8hKIgQZ7PCN+kn/1ybq2ZBPS+V4pcg4bMk=; b=MKBizDulVtgund
	58w0dH3/fhaUG/tgZP6dzktdFr7LCwdz+EOnL8OlC5S9E5KscceYyUWcaYtzhWPZLk6/l87xMQTF8
	bmi1g17hW4UViSZkH38p5rNe2qbxGmpkefL4vsbnQ1okIT5ubl08VJvJDMSxwunMbGuz+hNbz3+k4
	nImnE+nLK0o1sj2LjCQJ8wraRpe2TuYcrbR9USIH5TOTcCIPIolY6bKXQxJYg+CHr776k0DvKD53v
	ml97fUToib0GA+sEFueD/v0rtdnizXmcVX9AMamq57mjmh5r+qYvZPlsAzxmWarV0cIAiqdBPg1yq
	DHeyEvEuMulqfJ7pmojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnXv-00GViM-00;
	Thu, 16 Mar 2023 13:21:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnXq-00GVfu-0f
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 13:21:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id x22so1236857wmj.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678972884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xI+mOo9w6N5hnNZASu9KEqOIyOdQmEOvWrAnFqrzLH0=;
        b=6NbDDiWhj5FJ6JbELI1WQQGmivylRUUFCQr2jFMHhqG/H6CtJsjXNtyc/MNtMKKoVv
         xNB1dFC+2oad1flg1qOi4UVFqUCTvnDr4neGcEsd6Gx7qxLwY6WW38zuiMQgr72VOh/c
         t0pD2CZidNEjriYDCG4ILalKpNijLp1i4EakDKUuOA/uMJNNMARP4vdpQL0ie9eT9TaK
         FB7+STFcpor4Uyq8zP9spP6k2sofE7b5RQ1mp8Dd1/xCDutwkiESvyN2IUr7tw6tBZ4I
         6HDWXhqFFeBcFDQ/6kCk6FSMl60WIR0lOtwbZSSMYwd+ZsVTzbBkd1UysrboB+TGL/IH
         j8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xI+mOo9w6N5hnNZASu9KEqOIyOdQmEOvWrAnFqrzLH0=;
        b=qVIl/W7gisvk5RmzO3v5rkwmmgnnqlI13zZKHBbsXTHzCandMdiSXoH/a3XycZnCL6
         YV3kTY9kzYESqN5ODaP66GAPw8eayXVNgbILunmh3g/bZF8RHuoXDkOUN73N+pg5Neix
         Ydf+4/tub61ya3gdTT6filckBMYqx+CUyqi6v0jPlkcLsoE5a43JbqDZRF4q6NfwsNOd
         1qbQNq2UkZD9CpnHPsw5S/TVXLvUMU26KvMB9RWj8bn0RBl5Y9j7kf7J2In/fgPvW4JJ
         q5b/LFXhgbjVbT+9NAnc+BwoHed9kQhY9EvhaulVc446MnwDAilzFhkYSKYvmcVZPxe3
         ihBA==
X-Gm-Message-State: AO0yUKUqsqtc+pgmxR8S3wgQo0tPqHa47pVx6YpZr449C3CjOuGvgF+i
	5wPfBimVh6wLBSpf23FPglxGwA==
X-Google-Smtp-Source: AK7set8TF8WABsMAn9COJsU0X76koVWVflLbQ8RfbeebysWvsoAh0GH6ucIAFoBJcTIPjKQxwFOEDQ==
X-Received: by 2002:a05:600c:4453:b0:3eb:389d:156c with SMTP id v19-20020a05600c445300b003eb389d156cmr22345321wmn.37.1678972883803;
        Thu, 16 Mar 2023 06:21:23 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (238.174.185.81.rev.sfr.net. [81.185.174.238])
        by smtp.gmail.com with ESMTPSA id bh10-20020a05600c3d0a00b003ed23e9e03bsm4993248wmb.46.2023.03.16.06.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:21:23 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v8 4/4] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Thu, 16 Mar 2023 14:17:11 +0100
Message-Id: <20230316131711.1284451-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230316131711.1284451-1-alexghiti@rivosinc.com>
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_062126_250415_4D91D64A 
X-CRM114-Status: GOOD (  32.08  )
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

During the early page table creation, we used to set the mapping for
PAGE_OFFSET to the kernel load address: but the kernel load address is
always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
PAGE_OFFSET is).

But actually we don't have to establish this mapping (ie set va_pa_offset)
that early in the boot process because:

- first, setup_vm installs a temporary kernel mapping and among other
  things, discovers the system memory,
- then, setup_vm_final creates the final kernel mapping and takes
  advantage of the discovered system memory to create the linear
  mapping.

During the first phase, we don't know the start of the system memory and
then until the second phase is finished, we can't use the linear mapping at
all and phys_to_virt/virt_to_phys translations must not be used because it
would result in a different translation from the 'real' one once the final
mapping is installed.

So here we simply delay the initialization of va_pa_offset to after the
system memory discovery. But to make sure noone uses the linear mapping
before, we add some guard in the DEBUG_VIRTUAL config.

Finally we can use PUD/P4D/PGD hugepages when possible, which will result
in a better TLB utilization.

Note that:
- this does not apply to rv32 as the kernel mapping lies in the linear
  mapping.
- we rely on the firmware to protect itself using PMP.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Rob Herring <robh@kernel.org> # DT bits
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/page.h | 16 ++++++++++++
 arch/riscv/mm/init.c          | 49 ++++++++++++++++++++++++++++++-----
 arch/riscv/mm/physaddr.c      | 16 ++++++++++++
 drivers/of/fdt.c              | 11 ++++----
 4 files changed, 81 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 8dc686f549b6..ea1a0e237211 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -90,6 +90,14 @@ typedef struct page *pgtable_t;
 #define PTE_FMT "%08lx"
 #endif
 
+#ifdef CONFIG_64BIT
+/*
+ * We override this value as its generic definition uses __pa too early in
+ * the boot process (before kernel_map.va_pa_offset is set).
+ */
+#define MIN_MEMBLOCK_ADDR      0
+#endif
+
 #ifdef CONFIG_MMU
 #define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
 #else
@@ -121,7 +129,11 @@ extern phys_addr_t phys_ram_base;
 #define is_linear_mapping(x)	\
 	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
 
+#ifndef CONFIG_DEBUG_VIRTUAL
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
+#else
+void *linear_mapping_pa_to_va(unsigned long x);
+#endif
 #define kernel_mapping_pa_to_va(y)	({					\
 	unsigned long _y = (unsigned long)(y);					\
 	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
@@ -130,7 +142,11 @@ extern phys_addr_t phys_ram_base;
 	})
 #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
 
+#ifndef CONFIG_DEBUG_VIRTUAL
 #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
+#else
+phys_addr_t linear_mapping_va_to_pa(unsigned long x);
+#endif
 #define kernel_mapping_va_to_pa(y) ({						\
 	unsigned long _y = (unsigned long)(y);					\
 	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index cc558d94559a..7af7cd201a9c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -213,6 +213,14 @@ static void __init setup_bootmem(void)
 	phys_ram_end = memblock_end_of_DRAM();
 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
 		phys_ram_base = memblock_start_of_DRAM();
+
+	/*
+	 * In 64-bit, any use of __va/__pa before this point is wrong as we
+	 * did not know the start of DRAM before.
+	 */
+	if (IS_ENABLED(CONFIG_64BIT))
+		kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
+
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
@@ -667,9 +675,16 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 
 static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
-	/* Upgrade to PMD_SIZE mappings whenever possible */
-	base &= PMD_SIZE - 1;
-	if (!base && size >= PMD_SIZE)
+	if (!(base & (PGDIR_SIZE - 1)) && size >= PGDIR_SIZE)
+		return PGDIR_SIZE;
+
+	if (!(base & (P4D_SIZE - 1)) && size >= P4D_SIZE)
+		return P4D_SIZE;
+
+	if (!(base & (PUD_SIZE - 1)) && size >= PUD_SIZE)
+		return PUD_SIZE;
+
+	if (!(base & (PMD_SIZE - 1)) && size >= PMD_SIZE)
 		return PMD_SIZE;
 
 	return PAGE_SIZE;
@@ -978,11 +993,22 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	set_satp_mode();
 #endif
 
-	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
+	/*
+	 * In 64-bit, we defer the setup of va_pa_offset to setup_bootmem,
+	 * where we have the system memory layout: this allows us to align
+	 * the physical and virtual mappings and then make use of PUD/P4D/PGD
+	 * for the linear mapping. This is only possible because the kernel
+	 * mapping lies outside the linear mapping.
+	 * In 32-bit however, as the kernel resides in the linear mapping,
+	 * setup_vm_final can not change the mapping established here,
+	 * otherwise the same kernel addresses would get mapped to different
+	 * physical addresses (if the start of dram is different from the
+	 * kernel physical address start).
+	 */
+	kernel_map.va_pa_offset = IS_ENABLED(CONFIG_64BIT) ?
+				0UL : PAGE_OFFSET - kernel_map.phys_addr;
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 
-	phys_ram_base = kernel_map.phys_addr;
-
 	/*
 	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
 	 * kernel, whereas for 64-bit kernel, the end of the virtual address
@@ -1097,6 +1123,17 @@ static void __init setup_vm_final(void)
 			   __pa_symbol(fixmap_pgd_next),
 			   PGDIR_SIZE, PAGE_TABLE);
 
+#ifdef CONFIG_STRICT_KERNEL_RWX
+	/*
+	 * Isolate the kernel text and rodata linear so they don't
+	 * get mapped with a PUD in the linear mapping.
+	 */
+	memblock_isolate_memory(__pa_symbol(_start),
+				__init_data_begin - _start);
+	memblock_isolate_memory(__pa_symbol(__start_rodata),
+				__start_rodata - _data);
+#endif
+
 	/* Map all memory banks in the linear mapping */
 	for_each_mem_range(i, &start, &end) {
 		if (start >= end)
diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
index 9b18bda74154..18706f457da7 100644
--- a/arch/riscv/mm/physaddr.c
+++ b/arch/riscv/mm/physaddr.c
@@ -33,3 +33,19 @@ phys_addr_t __phys_addr_symbol(unsigned long x)
 	return __va_to_pa_nodebug(x);
 }
 EXPORT_SYMBOL(__phys_addr_symbol);
+
+phys_addr_t linear_mapping_va_to_pa(unsigned long x)
+{
+	BUG_ON(!kernel_map.va_pa_offset);
+
+	return ((unsigned long)(x) - kernel_map.va_pa_offset);
+}
+EXPORT_SYMBOL(linear_mapping_va_to_pa);
+
+void *linear_mapping_pa_to_va(unsigned long x)
+{
+	BUG_ON(!kernel_map.va_pa_offset);
+
+	return ((void *)((unsigned long)(x) + kernel_map.va_pa_offset));
+}
+EXPORT_SYMBOL(linear_mapping_pa_to_va);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d1a68b6d03b3..d14735a81301 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -887,12 +887,13 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
 static void __early_init_dt_declare_initrd(unsigned long start,
 					   unsigned long end)
 {
-	/* ARM64 would cause a BUG to occur here when CONFIG_DEBUG_VM is
-	 * enabled since __va() is called too early. ARM64 does make use
-	 * of phys_initrd_start/phys_initrd_size so we can skip this
-	 * conversion.
+	/*
+	 * __va() is not yet available this early on some platforms. In that
+	 * case, the platform uses phys_initrd_start/phys_initrd_size instead
+	 * and does the VA conversion itself.
 	 */
-	if (!IS_ENABLED(CONFIG_ARM64)) {
+	if (!IS_ENABLED(CONFIG_ARM64) &&
+	    !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
 		initrd_start = (unsigned long)__va(start);
 		initrd_end = (unsigned long)__va(end);
 		initrd_below_start_ok = 1;
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
