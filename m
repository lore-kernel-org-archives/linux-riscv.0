Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F305C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WIstfTUXMVQ1uBCcYq0RfGDkfuHIDO48eCenIrrpIY=; b=20JnVhEXZPq1jY
	qvAERtMuApBhC6+DLGTMVvo1vjCsvZVnrUfve25YsmPe2vMZAnM7zyEd4Z8iluQKEFtgd2A1REWSy
	avC+SAj//y9blInWBG9pdc5JTn/R3f5U5c4dokBlNC+dqiaM5bD9S55hvo+aWV01UM9urYeWqJu+D
	voVTMxm/6L3aC06CMbddvHaj0ERQP/MqjDfUybSW8krpf6uB0+OuEXVC136mAlTRCMM6I1WRNdqHE
	OErgOVWFD3hapR1u41mZUOPfwvJ8xou1El6URbse16qaYsU/uGTyRc3WnE6Gb5yBjEEJSpU6fe5cT
	7oPhM7a0PDXawE7eEfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFf1-004QEc-6I; Mon, 06 Dec 2021 15:12:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFeA-004Pqi-US
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 15:11:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FFB3612D3;
 Mon,  6 Dec 2021 15:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489E6C341C1;
 Mon,  6 Dec 2021 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638803477;
 bh=cID293rOgxjQk8NRLMzApK7etdJF34/NNMH4sm9IXMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fWu8/JMImZoyUJs6SiSezgHt3fJjx8j+QwkTcrH+qv5XYo1Tp1aRa2ow/SGdQ1G26
 g+jHZ/q6QQjZPvvWbCUlBXjZ60egZbb4Yb2aXl3afUegX/qC7f7FNIFkn1M+KlHgIc
 I3ATyqm/DcCf0Y7ix4xEP8RvCZ0+SC+3MEMDwau2l9wuWrnWs7onUDHOGnhwv2r3GG
 Rj4qKGwov368I4/KNuAEeMHyfT+VnoPU4BRsRNFNW4IasebXlje/xdWOCxmoBj2f0T
 oHViHwfTSQ8KbBX8LtnbRG9H5uDrsAPHaOOKTSWUsyacvfh8zX+p95RzUHd/OfcdMT
 wCZpJ3H52p7UQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] riscv: mm: init: try best to remove #ifdef
 CONFIG_XIP_KERNEL usage
Date: Mon,  6 Dec 2021 23:03:53 +0800
Message-Id: <20211206150353.731-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206150353.731-1-jszhang@kernel.org>
References: <20211206150353.731-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_071119_085910_9098EF9A 
X-CRM114-Status: GOOD (  13.08  )
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

Currently, the #ifdef CONFIG_XIP_KERNEL usage can be divided into the
following three types:

The first one is for functions/declarations only used in XIP case.

The second one is for XIP_FIXUP case. Something as below:
|foo_type foo;
|#ifdef CONFIG_XIP_KERNEL
|#define foo    (*(foo_type *)XIP_FIXUP(&foo))
|#endif

Usually, it's better to let the foo macro sit with the foo var
together. But if various foos are defined adjacently, we can
save some #ifdef CONFIG_XIP_KERNEL usage by grouping them together.

The third one is for different implementations for XIP, usually, this
is a #ifdef...#else...#endif case.

This patch moves the pt_ops macro to adjacent #ifdef CONFIG_XIP_KERNEL
and group first type usage cases into one.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5e979fe06054..a15640eeb334 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -40,10 +40,6 @@ EXPORT_SYMBOL(kernel_map);
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
-#ifdef CONFIG_XIP_KERNEL
-extern char _xiprom[], _exiprom[], __data_loc;
-#endif
-
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 							__page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
@@ -227,10 +223,6 @@ static void __init setup_bootmem(void)
 #ifdef CONFIG_MMU
 static struct pt_alloc_ops pt_ops __initdata;
 
-#ifdef CONFIG_XIP_KERNEL
-#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
-#endif
-
 unsigned long riscv_pfn_base __ro_after_init;
 EXPORT_SYMBOL(riscv_pfn_base);
 
@@ -242,6 +234,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
+#define pt_ops			(*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
 #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
 #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
 #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
@@ -445,6 +438,8 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 }
 
 #ifdef CONFIG_XIP_KERNEL
+extern char _xiprom[], _exiprom[], __data_loc;
+
 /* called from head.S with MMU off */
 asmlinkage void __init __copy_data(void)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
