Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C618DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=As07yeY7LxShf5a/rUGCWNE0VOzr1EiSDLPetS9Aqkk=; b=YeZOkqo/ac5n+F
	hsGjp2O48utwD8GHssvsvL2uSAF3Ock2cfRHl8paDtTwBN3XgZmYMYSiKOsdQ6LSb+y15WkPu0T4v
	CADiSbmnK9/KVfxwC4yfDCX+GlWfOKC3PddcRUVRZ70VaCV4mWtFKDJxGzMHeJdfUhYIuIjxAY4jX
	9PQuT8qGk7auB3M7LOoEwHFpmcpZ/jG9pjxA/eMCOaA8o5q0HY1cCPLD5jaLPvxi6nVByBkM+aYHN
	feAsIXawV8c5H0r6qHlkvHDiBSoHRNLaQ9V+bAfEQMyBDEU7KCnbhS7k3+VtKcUUD0QE/s4DRxKpR
	2s5cRwVPnZ6vefoPejxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOqn-006O8J-OQ; Tue, 22 Nov 2022 08:41:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOqj-006O41-50
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:41:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id t1so10174065wmi.4
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 00:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cT7TvPmXIjtGK6xCoCSuA3bUKEp8LGUDwYLIrTFVPuQ=;
        b=MsYQOv9bn1C6g04flOIQP//SWP05czQKUUtIcAFiVWfTVEj8gbzEDjiU7Z7qDyxzYo
         uyQDwC4eDl0eryE3DTJ0H3IVgWVbtoo45p2sKVVu73G3s+z20A/iylCR5ROWcZGFKT5t
         0RFGkqw0YjcjgvosNyZai397Qg9f/e1m134l+91DDwQh5WaEuH55dNhU80ywUu1kau1b
         jgRBI7gJ+fFbztSP740ZV9T5g1BACX5rhBImARJbBLuRa2HBrSzU4psE/4WtxlVgouXN
         f79QGrt33sJXex0pLHCz2hmEaj82WAS2XEVrkAiptyg5IrrRPu3ZPxHyF7kqMdPafAJS
         AnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cT7TvPmXIjtGK6xCoCSuA3bUKEp8LGUDwYLIrTFVPuQ=;
        b=W2ZYFo6M2qY04hv/haAjHWtKbhxy8FPzMvTzyw4wyMJLZCQ4zxx62l0G3Bpqmw0R1h
         vC56zIcuUE7WHo0pCBDfDrQvKeyyQ20sTHMdwNXZx5f3OuxHhqAjSmTJw+BgxtDQHOB9
         /UqScJwjjnCcv+Pw3ttuvmPhbZSeCVyvWgkEg+9f0CWYiqdzjI6wnm9p66g+3PByiiua
         V7YYJvlIANE3V15g26h1zDPzxIp0Ir+q8MgZwFwxIH6xPHXytVnwiwd/I8zbMelgvtrA
         tFkIXCMzpcNpJ4sPr8Hlxmj+FpNPtsp49Jx4GNbtYXtqlWVmp2Htxhx9zcPS3hiMq6E8
         UXAQ==
X-Gm-Message-State: ANoB5pkf/3a63HhuSzZYhkVv+PttjdX+C4Uuizu2JkrOxoPjAD5St5TW
	Hqk3JIl8q933bUBFw37jyf/7Fw==
X-Google-Smtp-Source: AA0mqf4lfMYuZby/m5onZyrvXEhniPKcbQWFDOjaqewt8/sbCqC0ee8NEAHvVjB4UC3KPy2msU9IRQ==
X-Received: by 2002:a05:600c:19d1:b0:3cf:cf89:90f with SMTP id u17-20020a05600c19d100b003cfcf89090fmr5078823wmq.186.1669106506896;
        Tue, 22 Nov 2022 00:41:46 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-201-46.w90-112.abo.wanadoo.fr. [90.112.163.46])
        by smtp.gmail.com with ESMTPSA id a8-20020adffac8000000b00241b5af8697sm2156301wrs.85.2022.11.22.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 00:41:45 -0800 (PST)
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
Subject: [PATCH] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Tue, 22 Nov 2022 09:41:41 +0100
Message-Id: <20221122084141.1849421-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_004149_233608_02A72639 
X-CRM114-Status: GOOD (  27.50  )
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

Note that this patch is rebased on top of:
[PATCH v1 1/1] riscv: mm: call best_map_size many times during linear-mapping

 arch/riscv/include/asm/page.h | 16 ++++++++++++++++
 arch/riscv/mm/init.c          | 25 +++++++++++++++++++------
 arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
 drivers/of/fdt.c              |  5 ++++-
 4 files changed, 55 insertions(+), 7 deletions(-)

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
index 7b571a631639..04e3ecb51722 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -895,8 +895,11 @@ static void __early_init_dt_declare_initrd(unsigned long start,
 	 * enabled since __va() is called too early. ARM64 does make use
 	 * of phys_initrd_start/phys_initrd_size so we can skip this
 	 * conversion.
+	 * On RISCV64, the usage of __va() before the linear mapping exists
+	 * is wrong.
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
