Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87197C27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JT7pQXCn6ZW/TsUS3ZdUf6LZzXwkxs7P7NhRfupn+TU=; b=NnvOHrhh7Fmg2x
	+XH0OXspQXAsfimqH4HqcbSUbAiOLqoxbAGuGqP1TilZqSNEqHfxQgn71321kxGsec4c47shQQUEa
	C2M+bQGb7Zc0u+WILuz5hUk1oYRxSe3FPueglHIcqoefNmia1YBoyaJ84rgO1Wq6zynZupB2M6nxN
	ONVfLvEezycF7Q70Pds/7rG7NgXuzF+JlfN448IMAIkPM75P42XX3xKvqnGMAjLGVBzW6L9uIJt4X
	pM/+Oz+wUVg880K9pVmTD1C2A3APGC6RLz8LSeYxKystIRBDEH/BCvLBrDh+V0Dgb24TGz+8gUWZz
	WdLSaDDva77LGeWsbU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6Y-0000000FVVF-1mcd;
	Fri, 07 Jun 2024 20:22:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6M-0000000FVQ1-1xPt
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:27 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4odO1GRTROf7xvMWOl3DqpmsPPjSYUQ/pXHn+xOw3Kc=;
	b=lAdxAtL1WO+adL+dYcUMR8vwNa0xTJsBJmhva63AYlFQDh9iB2KmPI0nzI7rctgnpzjFGp
	1+qM69qhVTlhxLRahmln8BYKQ+cwLZp8ErCCWDQkQj8FO2i88zELxECIhL4SdC/Hj0l7gt
	R8qEf3b85XNA9e/c3Pczr06hu/y8zjSn252U827wfpMt8+eaXa1G4ommneqv3SV+x0qbGO
	VNRfEBde7XqQgX8+HepNazsYzG03lw4WOIQEwZvCsxJJzBukiRkumfLWVuI7FG/ky5hfx2
	RSiJVqD4cHzop2bkP4hf+GuicVGkvaa3KFZFVfuz9GASY+igGnOBEFzlJlyh3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4odO1GRTROf7xvMWOl3DqpmsPPjSYUQ/pXHn+xOw3Kc=;
	b=L+bpi+80qMhsxa1grxAhSboftzk0iStipUSm9Wd4glNMTF1wlfW63xioVkOhA8Hn8lFmca
	mHo+MnwYL/aHfjAw==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] riscv: replace misleading va_kernel_pa_offset on XIP kernel
Date: Fri,  7 Jun 2024 22:22:08 +0200
Message-Id: <84e5d005c1386d88d7b2531e0b6707ec5352ee54.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
References: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132218_835513_82C262B0 
X-CRM114-Status: GOOD (  14.07  )
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

On XIP kernel, the name "va_kernel_pa_offset" is misleading: unlike
"normal" kernel, it is not the virtual-physical address offset of kernel
mapping, it is the offset of kernel mapping's first virtual address to
first physical address in DRAM, which is not meaningful because the
kernel's first physical address is not in DRAM.

For XIP kernel, there are 2 different offsets because the read-only part of
the kernel resides in ROM while the rest is in RAM. The offset to ROM is in
kernel_map.va_kernel_xip_pa_offset, while the offset to RAM is not stored
anywhere: it is calculated on-the-fly.

Remove this confusing "va_kernel_pa_offset" and add
"va_kernel_xip_data_pa_offset" as its replacement. This new variable is the
offset of virtual mapping of the kernel's data portion to the corresponding
physical addresses.

With the introduction of this new variable, also rename
va_kernel_xip_pa_offset -> va_kernel_xip_text_pa_offset to make it clear
that this one is about the .text section.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/page.h | 29 +++++++++++++++++++++--------
 arch/riscv/mm/init.c          |  6 ++++--
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 115ac98b8d72..b1fcf0d733c4 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -112,11 +112,13 @@ struct kernel_mapping {
 	/* Offset between linear mapping virtual address and kernel load address */
 	unsigned long va_pa_offset;
 	/* Offset between kernel mapping virtual address and kernel load address */
-	unsigned long va_kernel_pa_offset;
-	unsigned long va_kernel_xip_pa_offset;
 #ifdef CONFIG_XIP_KERNEL
+	unsigned long va_kernel_xip_text_pa_offset;
+	unsigned long va_kernel_xip_data_pa_offset;
 	uintptr_t xiprom;
 	uintptr_t xiprom_sz;
+#else
+	unsigned long va_kernel_pa_offset;
 #endif
 };
 
@@ -134,12 +136,18 @@ extern phys_addr_t phys_ram_base;
 #else
 void *linear_mapping_pa_to_va(unsigned long x);
 #endif
+
+#ifdef CONFIG_XIP_KERNEL
 #define kernel_mapping_pa_to_va(y)	({					\
 	unsigned long _y = (unsigned long)(y);					\
-	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < phys_ram_base) ?			\
-		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
-		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
+	(_y < phys_ram_base) ?							\
+		(void *)(_y + kernel_map.va_kernel_xip_text_pa_offset) :	\
+		(void *)(_y + kernel_map.va_kernel_xip_data_pa_offset);		\
 	})
+#else
+#define kernel_mapping_pa_to_va(y) ((void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset))
+#endif
+
 #define __pa_to_va_nodebug(x)		linear_mapping_pa_to_va(x)
 
 #ifndef CONFIG_DEBUG_VIRTUAL
@@ -147,12 +155,17 @@ void *linear_mapping_pa_to_va(unsigned long x);
 #else
 phys_addr_t linear_mapping_va_to_pa(unsigned long x);
 #endif
+
+#ifdef CONFIG_XIP_KERNEL
 #define kernel_mapping_va_to_pa(y) ({						\
 	unsigned long _y = (unsigned long)(y);					\
-	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ? \
-		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
-		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
+	(_y < kernel_map.virt_addr + XIP_OFFSET) ?				\
+		(_y - kernel_map.va_kernel_xip_text_pa_offset) :		\
+		(_y - kernel_map.va_kernel_xip_data_pa_offset);			\
 	})
+#else
+#define kernel_mapping_va_to_pa(y) ((unsigned long)(y) - kernel_map.va_kernel_pa_offset)
+#endif
 
 #define __va_to_pa_nodebug(x)	({						\
 	unsigned long _x = x;							\
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 28f9c37443c8..313459329d16 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1092,11 +1092,14 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.phys_addr = (uintptr_t)CONFIG_PHYS_RAM_BASE;
 	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
 
-	kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
+	kernel_map.va_kernel_xip_text_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
+	kernel_map.va_kernel_xip_data_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr
+						+ (uintptr_t)&_sdata - (uintptr_t)&_start;
 #else
 	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
 	kernel_map.phys_addr = (uintptr_t)(&_start);
 	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
+	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
@@ -1118,7 +1121,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	 */
 	kernel_map.va_pa_offset = IS_ENABLED(CONFIG_64BIT) ?
 				0UL : PAGE_OFFSET - kernel_map.phys_addr;
-	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 
 	/*
 	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
