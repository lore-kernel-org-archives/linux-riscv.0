Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EF1C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WG6baSp+Y1oHPzp5dX89ktSTW3LeQZPkx1EzB8siNcg=; b=hcNEVzrtsghNzj
	AUaeZ+OrG2E8uCHX3lwLaPEIZxJlHAr3UEo9rqLTDp/c8FgvS/5Yrr6A6FudisgXuBBbUb3e5M9J+
	JBoD2OCCOn2D+zLkn6OofIDfNVyvLbvNzlM/4DTVL+dW/YOqf7Ys7zMHAoPNUuuPr3MYVSKerHg3V
	67mnHIC9ByH2t1DVmFxRf3FLGqJqPO/1I3Fz3kIzJQFlXv2MGxoGIa53C9XX1hL/Dye6cftnTxXHW
	jEAbCJGRsj2qUXaw7h4EJqFPPuQ4HgS1I20HvuclUxd1KF9d0Tr6s102Uab929yn1WuTjV9XiPsEz
	P6ij80Ig2RbqG8C3WItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Kk2-00000004N8R-1H1f;
	Fri, 10 May 2024 07:32:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JkV-00000004DFM-3akz
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:29:12 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nWsN9bO3jB/lWfoYhOeMN5QCJhLSpnjL/e1CFXcgkFc=;
	b=YeDkS+MAiZHerM1m6HstkCIZ/MvU3HL3aeD4du/wwgYWeF4OzoZsFqYelfTKmU7kIeONSz
	LsOuHChlYmZvXgc8eajqeT8Ytjt2t0+fnS3T6VjUAdN/jqWXBkW3ueKsYiVMz5yHTyzJMN
	BfTPHgNFZo6Arqb8jnW7sOepDcQXUEp1Iiyf/kJl8hcCwSLYxQn2bkaWQLK+JnoQQJs0Vf
	yG9iV4QJj5ujfhKMbDfyt6uED//pCe4lKcU2YwYdGE9SBKHqezUeVb5Zec4ikJjPm+S9r4
	Wmh71b8m6qiJz8vuNcCab9zgJwTm3cY4HUfAxeh7onwz4Y8I4rdyO77cDFp+fQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nWsN9bO3jB/lWfoYhOeMN5QCJhLSpnjL/e1CFXcgkFc=;
	b=qifx2WUO5dCFrOMeAhxuDRTwUnmqnwHwLebBadT4MnZQ+O9ajcO4VceJNqhIGjwz9TF2oN
	rwE21Hk+YUoiNlCw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 2/7] riscv: replace va_kernel_pa_offset with va_kernel_data_pa_offset on XIP
Date: Fri, 10 May 2024 08:28:40 +0200
Message-Id: <133e7cd43a67abfed96bc246ae5f8a870edde684.1715286093.git.namcao@linutronix.de>
In-Reply-To: <cover.1715286093.git.namcao@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232856_243352_1988E150 
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
"va_kernel_data_pa_offset" as its replacement. This new variable is the
offset of virtual mapping of the kernel's data portion to the corresponding
physical addresses.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/page.h | 25 +++++++++++++++++++------
 arch/riscv/mm/init.c          |  4 +++-
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 115ac98b8d72..14d0de928f9b 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -112,11 +112,13 @@ struct kernel_mapping {
 	/* Offset between linear mapping virtual address and kernel load address */
 	unsigned long va_pa_offset;
 	/* Offset between kernel mapping virtual address and kernel load address */
-	unsigned long va_kernel_pa_offset;
-	unsigned long va_kernel_xip_pa_offset;
 #ifdef CONFIG_XIP_KERNEL
+	unsigned long va_kernel_xip_pa_offset;
+	unsigned long va_kernel_data_pa_offset;
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
+	(_y < phys_ram_base) ?							\
 		(void *)(_y + kernel_map.va_kernel_xip_pa_offset) :		\
-		(void *)(_y + kernel_map.va_kernel_pa_offset + XIP_OFFSET);	\
+		(void *)(_y + kernel_map.va_kernel_data_pa_offset);		\
 	})
+#else
+#define kernel_mapping_pa_to_va(y) (void *)((unsigned long)(y) + kernel_map.va_kernel_pa_offset)
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
+	(_y < kernel_map.virt_addr + XIP_OFFSET) ?				\
 		(_y - kernel_map.va_kernel_xip_pa_offset) :			\
-		(_y - kernel_map.va_kernel_pa_offset - XIP_OFFSET);		\
+		(_y - kernel_map.va_kernel_data_pa_offset);			\
 	})
+#else
+#define kernel_mapping_va_to_pa(y) ((unsigned long)(y) - kernel_map.va_kernel_pa_offset)
+#endif
 
 #define __va_to_pa_nodebug(x)	({						\
 	unsigned long _x = x;							\
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5e3ec076ab95..9846c6924509 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1089,10 +1089,13 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
 
 	kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
+	kernel_map.va_kernel_data_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr
+						+ (uintptr_t)&_sdata - (uintptr_t)&_start;
 #else
 	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
 	kernel_map.phys_addr = (uintptr_t)(&_start);
 	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
+	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
@@ -1114,7 +1117,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
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
