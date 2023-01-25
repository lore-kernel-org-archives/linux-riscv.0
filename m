Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C7AC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klG6Kh7ycVj7cNIvXC17hD7y/KD0+3sb0X5lJr5aN3c=; b=GZxVTcXGTnFQyA
	hEP3HSM9IbAl6hmqIu6qmvv6ERx6ORnz4sgyYDwFYlYxcU3UFfCi0AXprANcMAo4gNMT9BaEiowwI
	WGJGWy3pPPNGE0Ygs8tHYxLbNdfnrcRWWfMrjCrGuadQsKp6+AOnGIwGqga7be/HKP4CJXX94vsQw
	GcemTIHMohu4WFmjiV4zRujTOpaGSdSsDyF4qy4zuWM0+RQL5F7ePYYXH9ksS9LM86TeHlcHuUaZ5
	8wRvEh2BKc+da1R/LyWL7kd/TsU9+hqwDWt2t1WPDQ4aRbVyV+lc31CDSkZ9BmCWmjFGTvXFDtQHM
	toX6XlPFmzAaffgXWvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKavI-006MBY-0I; Wed, 25 Jan 2023 08:14:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKavE-006MAE-Vb
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 08:14:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id r2so16170432wrv.7
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 00:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRNURLlJxmHnFNrJKg9HhEJFu9q+f4Oy8+pIncn6axs=;
        b=Ho35g2qD9xGRHO1y8uNy1ChakQl2Axuk7krR6RtDn8/zGRaaeU3aMS0eWMMCzM5puE
         +HkVB6rP+/ggienaVais/JFeu04sK0g+3lrEqRHsyc1NspUjf48X92Ot9x7DuNHUA1SP
         SCKauQxua3o+A0lxRjgEcp93vVBZcwT+9b8+eTlbKidTnk1GHoa/Lwdg4u6kgwxuI2pj
         MJDLr8zsBZ0g4cKhoYTRKFpCE2CfgfGZqrnfbrgRNj1iedIKOmKLBqbSdeHJC8DRJ0iq
         O/K4qjKR17fWoe/3sK4hSygTz6B87S7B5VT1VdwHPI7innI/yYny0pZWtQ0AWuf0CEiF
         hq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRNURLlJxmHnFNrJKg9HhEJFu9q+f4Oy8+pIncn6axs=;
        b=0ltcpyZdcyNdOQKskBCORLpAWv2e9faLyKEtmPCXHsR+OZ9m/y93CHeK2UmLrtzGqL
         nr3wf6Fipp+e5eERLBg2vaJ3fXnPRd1lu4ij9zfoxyyBxYW27lKl3n/rcyyKidwh0wKO
         ZBx8mwor3+2tl5BsgMoS6rmDpEwFz/TaeeRVBXcUPDh8b9WqLQTp3XBzfzW9wuCEl0jj
         esR/UtTBRpr1dlZoxw0jbT9uZUONqFzspCpBiN4SjmDqhRQO/+z5BSkXwDInM5FaoEix
         JP7UXCSIRk3c8BHUtpwXKa4uaSWf6/oYdYCo4QOmirlY7sqmBc77An/H9C6Iw7dkFd11
         Mhqg==
X-Gm-Message-State: AFqh2kr3bnqd9/9i7U3VueMO+SuevkvePsoSyyOjF5iPj5ZWrQrw9ji5
	VT8oHIK0sQQ76zEULRef5rlpbg==
X-Google-Smtp-Source: AMrXdXtGV8ESQHqcEI6g/gFNtzz/UJ8HTGWnVn6NNUIJ8Q5yWzXCYjm3iyROWOksYVwBNr1dtzLTEQ==
X-Received: by 2002:adf:dc81:0:b0:2a1:328f:23aa with SMTP id r1-20020adfdc81000000b002a1328f23aamr27635936wrj.6.1674634459446;
        Wed, 25 Jan 2023 00:14:19 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id a3-20020adff7c3000000b002bdc3f5945dsm3681730wrq.89.2023.01.25.00.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 00:14:19 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 2/2] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Wed, 25 Jan 2023 09:12:14 +0100
Message-Id: <20230125081214.1576313-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125081214.1576313-1-alexghiti@rivosinc.com>
References: <20230125081214.1576313-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_001421_062725_4B55E697 
X-CRM114-Status: GOOD (  27.66  )
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

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Rob Herring <robh@kernel.org> # DT bits
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/page.h | 16 ++++++++++++++++
 arch/riscv/mm/init.c          | 24 ++++++++++++++++++------
 arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
 drivers/of/fdt.c              | 11 ++++++-----
 4 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 728eee53152a..bd7b9dda1e4f 100644
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
 #define ARCH_PFN_OFFSET		(PFN_DOWN(phys_ram_base))
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
index 225a7d2b65cc..9dfc0afdb114 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -213,6 +213,13 @@ static void __init setup_bootmem(void)
 	phys_ram_end = memblock_end_of_DRAM();
 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
 		phys_ram_base = memblock_start_of_DRAM();
+
+	/*
+	 * Any use of __va/__pa before this point is wrong as we did not know the
+	 * start of DRAM before.
+	 */
+	kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
+
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
@@ -667,9 +674,16 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 
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
@@ -978,11 +992,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	set_satp_mode();
 #endif
 
-	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
+	kernel_map.va_pa_offset = 0UL;
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 
-	phys_ram_base = kernel_map.phys_addr;
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
