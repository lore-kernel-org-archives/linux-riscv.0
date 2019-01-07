Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F68BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D5C62087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dFFb876/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="CRS69RQF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D5C62087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hZ6K6doHEoBKghJBWYfVX6qcgCDecsKPNQzivp7qJKY=; b=dFFb876/F4+SRoge9360Wjf1dR
	N7Qx6JCbNT0sfya+0hIfaHUvKlDtIUuCQItcwlHImwQtNaZG286ZvZgaIe6qebFebaxQem3Up6Eiu
	al0+RfdV+Y4uanuakOfIC6teQUhP21MRCwwSR4eaetNS/al8+ktRs01bowq5hfizEqb6mbajWAPKl
	ljWh9JeBRH3OU8PGqGLvk3gi4dDAQ5C/mDn/YNyRtlJlmqF68W8luIrcfsiybCg7ngU1xQYVkBiMw
	q1mv25gbMYidAz+ewKQKD5RjUkC/YsZYvpFykKE7zXtOUuRLz1y83Tn2ZQSTW22hZ7F5ziYyVpoYb
	TO67xOVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXV2-0005LT-3U; Mon, 07 Jan 2019 16:11:36 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXUy-0005ID-Iw
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 16:11:34 +0000
Received: by mail-pf1-x444.google.com with SMTP id 64so369557pfr.9
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 08:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v6aM0hklZsFoaklZaSb50j46kecgBnQrkaeqJhZzzu0=;
 b=CRS69RQFENjNlNHF3xKRq9jrAWmuSsg45oCuH+alD6J9nO4XMkDK3JhaHp1la/Rgs5
 Kv4hG84jkN7dVl9XqK4GU/N3L4m/PDo5y3TJR8p17BhzsOiuz14TeFo5m4ub1wUjE5K+
 BbzvDHgmSvw/6TnoG8MUtcH8JyoHVmBYLys25erXg0chDK60FtivqvDU2BjJwyMl9sNu
 nmWHc1bMK2xG27/mYRTVZsP9KrXI8Gla+Wqpa2JPegYexlUYFTlCa+2vcLBPrgDHqb//
 raKpEDvp9NaO8EdHByv3BAM93ZjGYiUVTO18Jh1mgkwTaOh6c21bpAGepP6twy8vE5GU
 f5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v6aM0hklZsFoaklZaSb50j46kecgBnQrkaeqJhZzzu0=;
 b=eUKR698ZGZ0c0vbup4aen1Js/1qJN1x8pWnFdlFsFHhlUMtqqO9KbvquiyCs6cYHfi
 UK6Mu6t7Zmw/jbW7yBKf5qTuYoOkOD5Gd2/eP3knlz9IvtJSXBFgxX64JT4MejgJEk6X
 sv3QIkkuB9aKXDsWk22bXD5onHWO5MtmKeghRfVVBgWcLn3R+XSUD7g9CmLxaPBM1pOf
 ukJbe0RGM/uUza9YfvVJLRh9dGX4L2A7jCc/vRyZloBrROMnTbRR+PS2uSGx/+vP4gxt
 2zAW+yd7FUe/OS9BZkmzJxvUcvSQ684GBKthONlTaX/t7GAGiJqdvbIkMNFWIzUar0AW
 5HiQ==
X-Gm-Message-State: AA+aEWY8ubq60DoYHRijQpHlXnpvXr1+cXmsGtDCcfjJ10owUvmY8lz5
 9U6tmACyTML04YES6GgPT8miGA==
X-Google-Smtp-Source: AFSGD/V8as21mLKX4g9nDe++baxp9D7028k8deFV1gH3K4lE4zBPzT/Rjqm2ER2SUS5pNECYt74Hng==
X-Received: by 2002:a62:7042:: with SMTP id l63mr66271895pfc.89.1546877491533; 
 Mon, 07 Jan 2019 08:11:31 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.214])
 by smtp.gmail.com with ESMTPSA id a10sm93243512pfi.138.2019.01.07.08.11.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 08:11:30 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 5/5] RISC-V: Implement compile-time fixed mappings
Date: Mon,  7 Jan 2019 21:40:47 +0530
Message-Id: <20190107161047.10516-6-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190107161047.10516-1-anup@brainfault.org>
References: <20190107161047.10516-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_081132_792496_578BCBDB 
X-CRM114-Status: GOOD (  17.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <anup.patel@wdc.com>

This patch implements compile-time virtual to physical
mappings. These compile-time fixed mappings can be used
by earlycon, ACPI, and early ioremap for creating fixed
mappings when FIX_EARLYCON_MEM=y.

To start with, we have enabled compile-time fixed
mappings for earlycon.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/Kconfig              |  3 ++
 arch/riscv/include/asm/fixmap.h | 52 +++++++++++++++++++++++++++++++++
 arch/riscv/mm/init.c            | 32 ++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 arch/riscv/include/asm/fixmap.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e0d7d61779a6..66094aba9a59 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -86,6 +86,9 @@ config GENERIC_CSUM
 config GENERIC_HWEIGHT
 	def_bool y
 
+config FIX_EARLYCON_MEM
+	def_bool y
+
 config PGTABLE_LEVELS
 	int
 	default 3 if 64BIT
diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
new file mode 100644
index 000000000000..88e99f506ab9
--- /dev/null
+++ b/arch/riscv/include/asm/fixmap.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
+ *
+ * fixmap.h: compile-time virtual memory allocation
+ */
+
+#ifndef _ASM_RISCV_FIXMAP_H
+#define _ASM_RISCV_FIXMAP_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/kernel.h>
+#include <linux/sizes.h>
+#include <asm/page.h>
+#include <asm/pgtable.h>
+
+/*
+ * Here we define all the compile-time 'special' virtual
+ * addresses. The point is to have a constant address at
+ * compile time, but to set the physical address only
+ * in the boot process.
+ *
+ * These 'compile-time allocated' memory buffers are
+ * page-sized. Use set_fixmap(idx,phys) to associate
+ * physical memory with fixmap indices.
+ */
+enum fixed_addresses {
+	FIX_HOLE,
+	FIX_EARLYCON_MEM_BASE,
+	__end_of_fixed_addresses
+};
+
+#define FIXADDR_SIZE		(__end_of_fixed_addresses * PAGE_SIZE)
+#define FIXADDR_TOP		(PAGE_OFFSET)
+#define FIXADDR_START		(FIXADDR_TOP - FIXADDR_SIZE)
+
+#define FIXMAP_PAGE_IO		PAGE_KERNEL
+
+#define __early_set_fixmap	__set_fixmap
+
+#define __late_set_fixmap	__set_fixmap
+#define __late_clear_fixmap(idx) __set_fixmap((idx), 0, FIXMAP_PAGE_CLEAR)
+
+extern void __set_fixmap(enum fixed_addresses idx,
+			 phys_addr_t phys, pgprot_t prot);
+
+#include <asm-generic/fixmap.h>
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_FIXMAP_H */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index b487f76d6060..b10f1423c352 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -18,6 +18,7 @@
 #include <linux/sizes.h>
 #include <linux/of_fdt.h>
 
+#include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
 #include <asm/pgtable.h>
@@ -110,8 +111,28 @@ pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 #define NUM_SWAPPER_PMDS ((uintptr_t)-PAGE_OFFSET >> PGDIR_SHIFT)
 pmd_t swapper_pmd[PTRS_PER_PMD*((-PAGE_OFFSET)/PGDIR_SIZE)] __page_aligned_bss;
 pmd_t trampoline_pmd[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
+pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
 #endif
 
+pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
+
+void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
+{
+	unsigned long addr = __fix_to_virt(idx);
+	pte_t *ptep;
+
+	BUG_ON(idx <= FIX_HOLE || idx >= __end_of_fixed_addresses);
+
+	ptep = &fixmap_pte[pte_index(addr)];
+
+	if (pgprot_val(prot)) {
+		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
+	} else {
+		pte_clear(&init_mm, addr, ptep);
+		local_flush_tlb_page(addr);
+	}
+}
+
 asmlinkage void __init setup_vm(void)
 {
 	extern char _start;
@@ -141,6 +162,13 @@ asmlinkage void __init setup_vm(void)
 	}
 	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
 		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
+
+	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
+				__pgprot(_PAGE_TABLE));
+	fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
+		pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
+				__pgprot(_PAGE_TABLE));
 #else
 	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
 		pfn_pgd(PFN_DOWN(pa), prot);
@@ -150,5 +178,9 @@ asmlinkage void __init setup_vm(void)
 		swapper_pg_dir[o] =
 			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
 	}
+
+	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
+		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
+				__pgprot(_PAGE_TABLE));
 #endif
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
