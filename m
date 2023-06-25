Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C559C001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEUe8EHanxSuNy9qPk1Cwe4Qx3s0REKyzBezY4tJfh4=; b=MLK/aebQ+gSgtX
	TJXGfBqzY6XPxpD3G25bXh91FEJG6wVXm29daSaYJIwTu9CqJwyVnpSFg6CxV2VOzDWWEMNVaHC7Q
	39jf2xnU/XaaryECAc+MMIupHGmH8DtSmmaLexXRZOPeSg1p7ztx4FcpYUdLLZ7L68jDAlRs3j14G
	wvo/WjLYYNoYH6ZulO8F1bzv7EhKfYCwGEWdMjBRKJ/m0MdFL7YhuuWnPXRQPSC1JcssgVn+lJFhw
	4NImDdkMq1IsipNwRiBabnShM/yBP6L2cNb5l1uhrn5V/cTkw73pIvllScf2sN0Mr+7SOlP/nDrtF
	1lA+EBgsdhE3Jy97vjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDRfo-008Dlu-3A;
	Sun, 25 Jun 2023 15:29:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDRfm-008DlO-0K
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 15:29:07 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-666ecf9a0ceso1072935b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687706945; x=1690298945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+WOYDIvLdd2NWRRa7PZxlpSE8oO3O/uffxAnfRWFTQ=;
        b=M/P1iEtEmWvR4gNy5Xi0GhWXMDNv1iAV49eqjRiWX/SAZBBrZ4s/wFnFIiajnvMR4U
         Cq1f9q3461N2I20MICOALV/oq3Y75DDRsxKW1LcN3YmT0VMpcBO192i2R/Tnray4uCLy
         qlguMhROpd4O4D0+1D39cIOsXUNWM1KGSHyLzylZe4sBdvfCgnfcCkK1IUM3FALO35Xj
         ESLoTOb/a6y+uu7bEc76FcwrssFtglHWWl1AsX9M1choSG87grsiErSmdrjGFyaW8M7I
         5DGHbp/HmQuets+G9z+XnvhIyKsSjFiGne8NHRtO3iGjmISL0FDVioxo/FCmNlSMUbVn
         DwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687706945; x=1690298945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+WOYDIvLdd2NWRRa7PZxlpSE8oO3O/uffxAnfRWFTQ=;
        b=BS28Bbjlddki1rbjGK74fEFu4boGhmIOhjLty27d/3vKtjliUxx6ZkHhHikp57K5bM
         0XOVCnZNmdPMcq6GyYPGTtRGE/wXoMotE/KUnu2SUvVheO9OEvoI3r+2Emh9D6XdO06P
         wFehprqdtnr2Ge5RBpuWUXf4im+Q+NlPp/yefcCroznHG1reBzbEcPLspI21WWXUCWfZ
         v38SARYl4WwBmWfhXKNl5J2FJHxGkxYWv+yoBRD2BI7huCcDv9QrDPQNR8nxIzPGyCIK
         cqo+7XZ/7iUNxTAGN+Las8LHfBO6cQDnOweyER3nSm7gIM21PYDzelKSspgIBpurnmsS
         EKCA==
X-Gm-Message-State: AC+VfDwfnX8mZBlo82LttQ71UxA/W5q3PLNfJ3bXJl3qWzfLPOFk6Dns
	p4U6RdP75oiO14rZt/QMcOU=
X-Google-Smtp-Source: ACHHUZ6mNVKRC/wAju5m3w9CI3n8kce2f6IYE2Xf6XLkhFJuxLumcPtstkhxjS+602cCUYMD2xfLoQ==
X-Received: by 2002:a05:6a20:96db:b0:126:6c67:18bc with SMTP id hq27-20020a056a2096db00b001266c6718bcmr2001479pzc.38.1687706945039;
        Sun, 25 Jun 2023 08:29:05 -0700 (PDT)
Received: from localhost.localdomain ([112.2.230.41])
        by smtp.gmail.com with ESMTPSA id e19-20020a62aa13000000b0062bc045bf4fsm1710619pff.19.2023.06.25.08.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 08:29:04 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: songshuaishuai@tinylab.org
Cc: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	anshuman.khandual@arm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	frowand.list@gmail.com,
	heiko@sntech.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mpe@ellerman.id.au,
	palmer@dabbelt.com,
	panqinglin2020@iscas.ac.cn,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	rppt@kernel.org,
	samuel@sholland.org,
	xianting.tian@linux.alibaba.com
Subject: [PATCH V1 3/3] Revert "riscv: Use PUD/P4D/PGD pages for the linear mapping"
Date: Sun, 25 Jun 2023 23:28:41 +0800
Message-Id: <20230625152841.1280937-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
References: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_082906_139991_955DB0CE 
X-CRM114-Status: GOOD (  25.17  )
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

From: Song Shuai <songshuaishuai@tinylab.org>

This reverts commit 3335068f87217ea59d08f462187dc856652eea15.

This commit maps the PMP regions from some versions of OpenSbi in
the linear mapping, that will lead to an access fault when doing
hibernation[1] or some speculative accesses.

The best_map_size() function from this commit doesn't check the
virtual alignment before choosing a map size, that will cause a
page fault[2]. We can let best_map_size() take the VA into
consideration via commit 49a0a3731596 ("riscv: Check the virtual
alignment before choosing a map size"), but that commit slows down
the boot time and consumes some system memory when UEFI booting.

This commit uses PUD/P4D/PGD pages for the linear mapping to improve
the performance is marginal from a recent talk [3] from Mike Rapoport.
OpenSbi had marked all the PMP-protected regions as "no-map" [4]
to practice this talk.

For all those reasons, let's revert this commit.

[1] https://lore.kernel.org/linux-riscv/CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com/
[2] https://lore.kernel.org/linux-riscv/tencent_7C3B580B47C1B17C16488EC1@qq.com/
[3] https://lwn.net/Articles/931406/
[4] https://github.com/riscv-software-src/opensbi/commit/8153b2622b08802cc542f30a1fcba407a5667ab9

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/include/asm/page.h | 16 ---------------
 arch/riscv/mm/init.c          | 38 ++++++-----------------------------
 arch/riscv/mm/physaddr.c      | 16 ---------------
 drivers/of/fdt.c              | 11 +++++-----
 4 files changed, 11 insertions(+), 70 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index b55ba20903ec..21b346ab81c2 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -89,14 +89,6 @@ typedef struct page *pgtable_t;
 #define PTE_FMT "%08lx"
 #endif
 
-#ifdef CONFIG_64BIT
-/*
- * We override this value as its generic definition uses __pa too early in
- * the boot process (before kernel_map.va_pa_offset is set).
- */
-#define MIN_MEMBLOCK_ADDR      0
-#endif
-
 #ifdef CONFIG_MMU
 #define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
 #else
@@ -128,11 +120,7 @@ extern phys_addr_t phys_ram_base;
 #define is_linear_mapping(x)	\
 	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
 
-#ifndef CONFIG_DEBUG_VIRTUAL
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
-#else
-void *linear_mapping_pa_to_va(unsigned long x);
-#endif
 #define kernel_mapping_pa_to_va(y)	({					\
 	unsigned long _y = (unsigned long)(y);					\
 	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
@@ -141,11 +129,7 @@ void *linear_mapping_pa_to_va(unsigned long x);
 	})
 #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
 
-#ifndef CONFIG_DEBUG_VIRTUAL
 #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
-#else
-phys_addr_t linear_mapping_va_to_pa(unsigned long x);
-#endif
 #define kernel_mapping_va_to_pa(y) ({						\
 	unsigned long _y = (unsigned long)(y);					\
 	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 38c4b4d6b64f..4561781bcf60 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -216,14 +216,6 @@ static void __init setup_bootmem(void)
 	phys_ram_end = memblock_end_of_DRAM();
 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
 		phys_ram_base = memblock_start_of_DRAM();
-
-	/*
-	 * In 64-bit, any use of __va/__pa before this point is wrong as we
-	 * did not know the start of DRAM before.
-	 */
-	if (IS_ENABLED(CONFIG_64BIT))
-		kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
-
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
@@ -662,16 +654,9 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 
 static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 {
-	if (!(base & (PGDIR_SIZE - 1)) && size >= PGDIR_SIZE)
-		return PGDIR_SIZE;
-
-	if (!(base & (P4D_SIZE - 1)) && size >= P4D_SIZE)
-		return P4D_SIZE;
-
-	if (!(base & (PUD_SIZE - 1)) && size >= PUD_SIZE)
-		return PUD_SIZE;
-
-	if (!(base & (PMD_SIZE - 1)) && size >= PMD_SIZE)
+	/* Upgrade to PMD_SIZE mappings whenever possible */
+	base &= PMD_SIZE - 1;
+	if (!base && size >= PMD_SIZE)
 		return PMD_SIZE;
 
 	return PAGE_SIZE;
@@ -1037,22 +1022,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	set_satp_mode(dtb_pa);
 #endif
 
-	/*
-	 * In 64-bit, we defer the setup of va_pa_offset to setup_bootmem,
-	 * where we have the system memory layout: this allows us to align
-	 * the physical and virtual mappings and then make use of PUD/P4D/PGD
-	 * for the linear mapping. This is only possible because the kernel
-	 * mapping lies outside the linear mapping.
-	 * In 32-bit however, as the kernel resides in the linear mapping,
-	 * setup_vm_final can not change the mapping established here,
-	 * otherwise the same kernel addresses would get mapped to different
-	 * physical addresses (if the start of dram is different from the
-	 * kernel physical address start).
-	 */
-	kernel_map.va_pa_offset = IS_ENABLED(CONFIG_64BIT) ?
-				0UL : PAGE_OFFSET - kernel_map.phys_addr;
+	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 
+	phys_ram_base = kernel_map.phys_addr;
+
 	/*
 	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
 	 * kernel, whereas for 64-bit kernel, the end of the virtual address
diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
index 18706f457da7..9b18bda74154 100644
--- a/arch/riscv/mm/physaddr.c
+++ b/arch/riscv/mm/physaddr.c
@@ -33,19 +33,3 @@ phys_addr_t __phys_addr_symbol(unsigned long x)
 	return __va_to_pa_nodebug(x);
 }
 EXPORT_SYMBOL(__phys_addr_symbol);
-
-phys_addr_t linear_mapping_va_to_pa(unsigned long x)
-{
-	BUG_ON(!kernel_map.va_pa_offset);
-
-	return ((unsigned long)(x) - kernel_map.va_pa_offset);
-}
-EXPORT_SYMBOL(linear_mapping_va_to_pa);
-
-void *linear_mapping_pa_to_va(unsigned long x)
-{
-	BUG_ON(!kernel_map.va_pa_offset);
-
-	return ((void *)((unsigned long)(x) + kernel_map.va_pa_offset));
-}
-EXPORT_SYMBOL(linear_mapping_pa_to_va);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bf502ba8da95..c28aedd7ae1f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -888,13 +888,12 @@ const void * __init of_flat_dt_match_machine(const void *default_match,
 static void __early_init_dt_declare_initrd(unsigned long start,
 					   unsigned long end)
 {
-	/*
-	 * __va() is not yet available this early on some platforms. In that
-	 * case, the platform uses phys_initrd_start/phys_initrd_size instead
-	 * and does the VA conversion itself.
+	/* ARM64 would cause a BUG to occur here when CONFIG_DEBUG_VM is
+	 * enabled since __va() is called too early. ARM64 does make use
+	 * of phys_initrd_start/phys_initrd_size so we can skip this
+	 * conversion.
 	 */
-	if (!IS_ENABLED(CONFIG_ARM64) &&
-	    !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
+	if (!IS_ENABLED(CONFIG_ARM64)) {
 		initrd_start = (unsigned long)__va(start);
 		initrd_end = (unsigned long)__va(end);
 		initrd_below_start_ok = 1;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
