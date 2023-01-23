Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB810C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UrgKJA4ai5ZwIPfuqPLze4FTif9nkk3Usqm2nOAon4g=; b=CRSfWxgkMwpP3S
	j2jHBTURTIybJKpS5haxjUH/FiI+wzWqN9nZXn3KbDZw49cDxmdhEyYb7G9i7rUmh3FVOB7tI13cq
	/eADH8vewrOl+7eFs6QxSk8iefKta20pvqazfGTGAKEP1TWWWlVFryzgzMayJ6vzgwikBYwmtKd2a
	pAoLnH1x98wfLLrObU2tTZgr7rSVNym98CxnBwHj7PAOEesdIMEwYzT5M5iHKLnrN1t+AhGSZFUVd
	I432fFw8ErmQiyYiEDLN40M+CSnZJsBaxilVOLsVEYBgNSnFFmeyXjy+6/N8lKtU1/DpDIzX/i0gn
	egH2LSF6Ovj8A9CpzNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuzy-00Gy5N-1R; Mon, 23 Jan 2023 11:28:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJuzv-00Gy3r-10
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 11:28:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id z5so10473928wrt.6
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 03:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zez80j7N2AUXnOsGCALj4JfavUW3suuNkz/TS5kQ1GU=;
        b=ClHmHiWY1+VkChLIQwt14+53p/nE3HHNZ2NwSulW1JWvj5dzE/0i6qL1H5sTgnHfg7
         mExBnwWA+AsIw+jqUs1Oa/dEPezWdLj/R9bdCaijZ1uRNmGYUIiGQfwjQA2oxSJfBdbi
         p7cuN6R8wop6rJ9K7pcXRfe7iFzu10u22GzGFCNa7+0Xs0S1CbR5KpSD146ouEBZCDPv
         0cYo+7C7GicUsBdSiItE3Bas+30bnXvnJmMACx5o9vJjJGeP3mWU9898Aps0L1tBm37W
         XC4zgxxvOkFgd09u9yl3ofRbnIVjmJXtuyZFUW/HoPz06wtoh5a6YOonKgJxpvvuQoXY
         nLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zez80j7N2AUXnOsGCALj4JfavUW3suuNkz/TS5kQ1GU=;
        b=eVPVMw44k6G7Ihp8wzsw2eOlwDQ5LGrybG8aFJAenq5EncRqJbWgqfIwserrB812An
         r28mqqTimy42vHArdaZST/xF5zEsXtVXBtU7DEQBhqhnO2OKcPqVcdm6TA5oEPgAzzdD
         +4fN0BlJHU+qQ0VekIsyCj9j3JpWnTdrsBv2GW7rypBkHF4gpcEdQ1GfvqC/PmebbS0m
         qt9gOz23XQgRNfEzbNLN/68dmFboYlYtPUDlkHRqqzWmQ3PkuD37dybgAu9dQ1y69R+S
         k0Kaqt9x0UKzIgWnkqVk3+5suOll2K5XZBisx2I0ujKpkIjD+lZk9+CWEstByLMLUaZB
         Wt1w==
X-Gm-Message-State: AFqh2kosqe04GgzOlvcy+B08/MmlVXW9uNlTUz8ZiAlyOuFDZG+Bg2dg
	RXWbaQHr20rkgN3qwPMjYO2uXA==
X-Google-Smtp-Source: AMrXdXvV1rfhk6eqABRpS1UGR98xTl4oSFJNrVrwQp2URgxX+NqZ83g9Qe6ED6n1kpkpGxfw8g0LYw==
X-Received: by 2002:a5d:42d0:0:b0:2bf:9459:255 with SMTP id t16-20020a5d42d0000000b002bf94590255mr9538138wrr.70.1674473299350;
        Mon, 23 Jan 2023 03:28:19 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d58c2000000b002bdbead763csm31356689wrf.95.2023.01.23.03.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 03:28:19 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Mon, 23 Jan 2023 12:28:02 +0100
Message-Id: <20230123112803.817534-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_032823_122225_25036C01 
X-CRM114-Status: GOOD (  30.03  )
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

Note that we rely on the firmware to protect itself using PMP.

Acked-by: Rob Herring <robh@kernel.org> # DT bits
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

v4:
- Rebase on top of v6.2-rc3, as noted by Conor
- Add Acked-by Rob

v3:
- Change the comment about initrd_start VA conversion so that it fits
  ARM64 and RISCV64 (and others in the future if needed), as suggested
  by Rob

v2:
- Add a comment on why RISCV64 does not need to set initrd_start/end that
  early in the boot process, as asked by Rob

 arch/riscv/include/asm/page.h | 16 ++++++++++++++++
 arch/riscv/mm/init.c          | 25 +++++++++++++++++++------
 arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
 drivers/of/fdt.c              | 11 ++++++-----
 4 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 9f432c1b5289..7fe84c89e572 100644
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
 extern unsigned long riscv_pfn_base;
 #define ARCH_PFN_OFFSET		(riscv_pfn_base)
@@ -122,7 +130,11 @@ extern phys_addr_t phys_ram_base;
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
@@ -131,7 +143,11 @@ extern phys_addr_t phys_ram_base;
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
index 478d6763a01a..cc892ba9f787 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -213,6 +213,14 @@ static void __init setup_bootmem(void)
 	phys_ram_end = memblock_end_of_DRAM();
 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
 		phys_ram_base = memblock_start_of_DRAM();
+
+	/*
+	 * Any use of __va/__pa before this point is wrong as we did not know the
+	 * start of DRAM before.
+	 */
+	kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
+	riscv_pfn_base = PFN_DOWN(phys_ram_base);
+
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
@@ -671,9 +679,16 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 
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
@@ -982,11 +997,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	set_satp_mode();
 #endif
 
-	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
+	kernel_map.va_pa_offset = 0UL;
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 
-	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
-
 	/*
 	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
 	 * kernel, whereas for 64-bit kernel, the end of the virtual address
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
index f08b25195ae7..58107bd56f8f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -891,12 +891,13 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
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
