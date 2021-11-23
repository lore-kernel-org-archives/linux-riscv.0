Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD27C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 01:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7Kd8T0MhKelI/d8HcMu5mj+6CVnKtAS6e1FjWqyCCE=; b=aaWmsC2dyEHRpI
	CYyX/dGVxVUoGILgaQwGWt8oG8/IvpHMdOutP4eKN8KFuXtLeIWJZSwLgxgoV226zS5JjEsxHTYUF
	r608KrZokVdLwxhNO7zrDUfIz9OF+Os8pFe2sZUKjUrQ9P0hFqA36462Bk5WSVBjZWAIQdhDRwduK
	DuCJ/Y6FTXFrvXtXaaTdSZclSZLI5Lt30NjVUjG8DapXwctwiEp2YoHj/DmnBQCaDArYFQDLU1dG1
	NbeT/k+NJx8laTxo+IKo99XLYdT4cRulrm9zp77gfzyKtRmer8Tle8jbEEpDMplDl94pI+jcqgQRL
	9y7qKiJjqvH6oraunfLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpL41-000bzU-5g; Tue, 23 Nov 2021 01:57:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpL3w-000bxd-RQ
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 01:57:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34D1A61038;
 Tue, 23 Nov 2021 01:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637632656;
 bh=qDjQ99afxjGsn+nYQ6tdrOeVRsGDzyUxlcwsA2r2rN8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YyBW8KwkC3P/Pkr0s1K5J7ovchRYTSlB+Sae9dTyRAGL020LecZfFCv3rhIBuRe+i
 foALqnM2ZIGHhagFBIebC+GjYnl2ZmWONCPpHKA9HgsUUZ6xjzO9uGwW/UIJjyJeYW
 njwxqCkfDHYY9Y4QSr+gQUABkYRJ7SpZQxWnkmypUyzj9PNG7/M6vY8l2aA/DE2Hmu
 n8mpEcXVvgdNg8QOVohzAz1es8zXA86udcqrvLDaczl5zMDvV7aBfPnqowInWo6+kR
 2+az07Q5c+k7ZJkK3Uw43L9SA62T4y1cCJUpxIqHPSWVB17s7pI5BHYHVhpTScFXeR
 +MuG/9LjN2gsA==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, palmer@dabbelt.com,
 atishp@rivosinc.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH 1/3] riscv: Remove 2MB offset in the mm layout
Date: Tue, 23 Nov 2021 09:57:15 +0800
Message-Id: <20211123015717.542631-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123015717.542631-1-guoren@kernel.org>
References: <20211123015717.542631-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_175736_967192_6D91C7FC 
X-CRM114-Status: GOOD (  13.18  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The current RISC-V's mm layout is based on a 2MB offset and wasting
memory. Remove 2MB offset and map PAGE_OFFSET at start_of_DRAM.
Then we could reduce the memory reserved for opensbi in the next
patch.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/page.h   |  8 ++++++++
 arch/riscv/kernel/head.S        | 10 +++-------
 arch/riscv/kernel/vmlinux.lds.S |  5 ++---
 arch/riscv/mm/init.c            | 11 ++++++++---
 4 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index b3e5ff0125fe..299147c78b4a 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -16,6 +16,14 @@
 #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE - 1))
 
+#if __riscv_xlen == 64
+/* Image load offset(2MB) from start of RAM */
+#define LOAD_OFFSET	0x200000
+#else
+/* Image load offset(4MB) from start of RAM */
+#define LOAD_OFFSET	0x400000
+#endif
+
 #ifdef CONFIG_64BIT
 #define HUGE_MAX_HSTATE		2
 #else
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f52f01ecbeea..a6ac892d2ccf 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -61,13 +61,7 @@ ENTRY(_start)
 	/* Image load offset (0MB) from start of RAM for M-mode */
 	.dword 0
 #else
-#if __riscv_xlen == 64
-	/* Image load offset(2MB) from start of RAM */
-	.dword 0x200000
-#else
-	/* Image load offset(4MB) from start of RAM */
-	.dword 0x400000
-#endif
+	.dword LOAD_OFFSET
 #endif
 	/* Effective size of kernel image */
 	.dword _end - _start
@@ -94,6 +88,8 @@ relocate:
 	la a1, kernel_map
 	XIP_FIXUP_OFFSET a1
 	REG_L a1, KERNEL_MAP_VIRT_ADDR(a1)
+	li a2, LOAD_OFFSET
+	add a1, a1, a2
 	la a2, _start
 	sub a1, a1, a2
 	add ra, ra, a1
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 5104f3a871e3..75b7c72cd4bd 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -11,10 +11,9 @@
 #else
 
 #include <asm/pgtable.h>
-#define LOAD_OFFSET KERNEL_LINK_ADDR
 
-#include <asm/vmlinux.lds.h>
 #include <asm/page.h>
+#include <asm/vmlinux.lds.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
 #include <asm/set_memory.h>
@@ -32,7 +31,7 @@ PECOFF_FILE_ALIGNMENT = 0x200;
 SECTIONS
 {
 	/* Beginning of code and text segment */
-	. = LOAD_OFFSET;
+	. = LOAD_OFFSET + KERNEL_LINK_ADDR;
 	_start = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 24b2b8044602..920e78f8c3e4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -221,6 +221,11 @@ static void __init setup_bootmem(void)
 	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
 		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
 
+	/*
+	 * Reserve OpenSBI region and depends on PMP to deny accesses.
+	 */
+	memblock_reserve(__pa(PAGE_OFFSET), LOAD_OFFSET);
+
 	early_init_fdt_scan_reserved_mem();
 	dma_contiguous_reserve(dma32_phys_limit);
 	if (IS_ENABLED(CONFIG_64BIT))
@@ -604,7 +609,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
 #else
-	kernel_map.phys_addr = (uintptr_t)(&_start);
+	kernel_map.phys_addr = (uintptr_t)(&_start) - LOAD_OFFSET;
 	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
 #endif
 	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
@@ -645,8 +650,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
 			   kernel_map.xiprom, PMD_SIZE, PAGE_KERNEL_EXEC);
 #else
-	create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
-			   kernel_map.phys_addr, PMD_SIZE, PAGE_KERNEL_EXEC);
+	create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr + LOAD_OFFSET,
+			   kernel_map.phys_addr + LOAD_OFFSET, PMD_SIZE, PAGE_KERNEL_EXEC);
 #endif
 #else
 	/* Setup trampoline PGD */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
