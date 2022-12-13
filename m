Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B94C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 06:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I1iJfvWfSbzF0D0c5SH6hrsxJN0yK7kolUtA5oPFSNo=; b=JRvryZaeSU0tVq
	Qb+DCtIPHGfrm3Zt13bCtGLGRT4lql6izp46/KEnbFEdSjtd2eO2syj9kOJCVZ3/r1JMX1RUEtN2m
	DNwIxe4aZCoVHkQaO0o9m61esp3k3POLKZyJQt5puL6kYbtjZiyKO95hFfW2dvFmTuatOI44Xa5UL
	aeokry6XuekZGQyhrmQ5uWuA7yrogxJYpDVeNKCfYtEuhtQwFYU1Ztv5wsTXOj+M9+zF/0wTBU2Av
	r7GspAtIJSPT/Z19iR9+SB4R9AJFfzPNOEa1fUTMaGhlZvX/+7H+tRFNKh7AbHm9ZV/5mT/EMIHZC
	AqAEmNxEp44yTdLAnU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4yMo-00BG1S-15; Tue, 13 Dec 2022 06:02:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4yMk-00BG0K-AV
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 06:02:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso5611751wmp.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 22:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fbEvbmFCq+IcCrEe9RLTvmhbg/l2JnxZHhCgf7rj0ps=;
        b=vc8g3zNJxla5Lu/ywNXhJjUsY9bXfhfc8KpUh13qP29TW4YJ5dQGPv5FrUJxxPQG1v
         MboByqV0lgAf3XJyYdhtDWlqw61zAsWwA2WT+63dchCj9Br5c7aximvszctGPDUbOeNL
         MyPgO//PoJss6rf1JaUmGr3ObCBAj1fkCnvx+5U6cETGGcC/J+WcICg0pH1mVSBk+wRa
         M/EdOR71AMuD/yU4+XCBJ55k9r7JC2TBbr/vhPhvR9fs6VV7vfewwT6d7c3kaj+X2FQT
         3qckEJ47EFitMhTB8zi/+X8IgNJgzBUrZVGm9pAseoMjGs2XZRN6YXrx0z+02h5/uaRF
         CWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbEvbmFCq+IcCrEe9RLTvmhbg/l2JnxZHhCgf7rj0ps=;
        b=hnYYLjEYEsC0KIrk6YRlMw2RWrmx16edtLtjdNUrdFbovRgaqjNanUIJ0/VTB/E0Cu
         gOQLnwp169lVVGhG6bbGO0VA+fPJ1MmZWp6FV+grm+COlEEzehWFtuJMHTvjoJr4/Ehm
         lUhPlB8dgNdi/L2hFxy/jEJVwW1x2dLNbQvyaS8OFzbcSdOf6TuaBqRuOjLrxpogw2mZ
         fNMuR334K3kkhXhYxx3ecRYIKlzDQ1IW2/T7PQ9NrgDqIv5P+DlEK4oNDHGlNm0gAEDd
         DdevThic8hPINHFRc4eiQvwC8lzN0Ct0pe8itk5vKu9vq0kWtQQVPEPfGo+L1S14kBMd
         W0iA==
X-Gm-Message-State: ANoB5pnmmPvGGJxJvPIVVKIyWOOMaCAlE7NfHXdE4kVlUgJ5AxYAL8R/
	K9yvW0xiHSpS2lrplx7nXxh7Ng==
X-Google-Smtp-Source: AA0mqf5Ry0vlp2BK7V379Xx5gkMXHrMs/RTW3fKIYILszorgAJaEo6oj6pK+bCwVFcMzRaV2QP1hqA==
X-Received: by 2002:a05:600c:2101:b0:3cf:e850:4451 with SMTP id u1-20020a05600c210100b003cfe8504451mr14455165wml.9.1670911326540;
        Mon, 12 Dec 2022 22:02:06 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b003b47ff307e1sm12611234wms.31.2022.12.12.22.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 22:02:06 -0800 (PST)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Tue, 13 Dec 2022 07:02:04 +0100
Message-Id: <20221213060204.27286-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_220210_605092_AF291242 
X-CRM114-Status: GOOD (  29.78  )
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
---

v3:
- Change the comment about initrd_start VA conversion so that it fits
  ARM64 and RISCV64 (and others in the future if needed), as suggested
  by Rob

v2:
- Add a comment on why RISCV64 does not need to set initrd_start/end that
  early in the boot process, as asked by Rob

Note that this patch is rebased on top of:
[PATCH v1 1/1] riscv: mm: call best_map_size many times during linear-mapping

 arch/riscv/include/asm/page.h | 16 ++++++++++++++++
 arch/riscv/mm/init.c          | 25 +++++++++++++++++++------
 arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
 drivers/of/fdt.c              | 11 ++++++-----
 4 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ac70b0fd9a9a..f3af526a149f 100644
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
 #define kernel_mapping_pa_to_va(y)	({						\
 	unsigned long _y = y;								\
 	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?					\
@@ -131,7 +143,11 @@ extern phys_addr_t phys_ram_base;
 	})
 #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
 
+#ifndef CONFIG_DEBUG_VIRTUAL
 #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
+#else
+phys_addr_t linear_mapping_va_to_pa(unsigned long x);
+#endif
 #define kernel_mapping_va_to_pa(y) ({						\
 	unsigned long _y = y;							\
 	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ?	\
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1b76d3fe4e26..58bcf395efdc 100644
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
@@ -672,9 +680,16 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 
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
@@ -983,11 +998,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
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
index 19cf25a74ee2..5ae4bd166e25 100644
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
index 7b571a631639..c45aaa3458a7 100644
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
