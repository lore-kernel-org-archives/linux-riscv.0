Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299AAC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 03:11:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70153610F8
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 03:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70153610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1qT8YTupvP1lBho26QVU0ZL1ITJoy5C/JpA2d38gTnE=; b=R+BQBJOpqJHVG4R1sAfUe9gN+5
	f/mob8G8nqWuPBC3YUWcsMTuxVKsT5m7hAmugMMw1SNhCP+/O1DGvwusYWMyFgZGXD/fLhO3cj0pW
	YwStVcVAnvbIC2NSddsHSa3ShpSh/azZ5re9fHvwniiH17n8nuPKWw0CnkqAj6fgt/C5pDpwrEQo2
	W7S+K3HQeplDEcFh8X2uCBqRJJsxltmObyVneE1vPMNVkc6FOYTF9/7eYhnxZDoKr1XqmcaoegFob
	vt+c7iHeRrAcj+SryHq0EpO9EOEo+pHsDdumsRXCejMzPtkT2za4wPeu/rbNqZHYf4gINQqO1hWBd
	52gE6f2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhOEk-0072EO-OA; Fri, 14 May 2021 03:11:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhOEg-0072E0-Lz
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 03:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=J/AT4UY5pnAR7D7K0k13qqQ47FVbBOjWkZrpkDXS1sM=; b=qqAU4ltwKvVafV8z/1YucCn9VU
 yE04ujFFRxaLXLaV05/GaYtFnjSKavWbcyZqOS0RbCoYMZ1Mghj4o93DobvGxh9cHXSdHizdFxZtU
 FNyqfxNK+afKfL5G7xrpN+seixQ+w6MLY+I/kVOS7+EoZVezIZlMcQrAG1ZjDBDHqWvOTuLC/Dx5w
 OeUfrD5yyDsyjDPqgOg9JdMAG5Hg7eq5ycI5bvUDvQ/+LgGBC6d12oFwtDHJJ+M5VnFrr4ctnJShW
 p9bDEH3+ObGk9fYsSZDJ40ZEp8waHgX/8PUdO5FEUJD1lp7MkeC/GQfI0FuFH6KC903d8orpPBy4N
 BpFnCm9w==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhOEd-00BgBX-KZ
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 03:11:33 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FhD5L6qvYzmWBC;
 Fri, 14 May 2021 11:09:10 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Fri, 14 May 2021
 11:11:15 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexander Potapenko
 <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov
 <dvyukov@google.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kasan-dev@googlegroups.com>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH RFC v2] riscv: Enable KFENCE for riscv64
Date: Fri, 14 May 2021 11:44:32 +0800
Message-ID: <20210514034432.2004082-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_201132_024356_A69481DF 
X-CRM114-Status: GOOD (  16.44  )
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

Add architecture specific implementation details for KFENCE and enable
KFENCE for the riscv64 architecture. In particular, this implements the
required interface in <asm/kfence.h>.

KFENCE requires that attributes for pages from its memory pool can
individually be set. Therefore, force the kfence pool to be mapped at
page granularity.

I tested this patch using the testcases in kfence_test.c and all passed.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
v1->v2: Change kmalloc() to pte_alloc_one_kernel() for allocating pte.

 arch/riscv/Kconfig              |  1 +
 arch/riscv/include/asm/kfence.h | 51 +++++++++++++++++++++++++++++++++
 arch/riscv/mm/fault.c           | 11 ++++++-
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/kfence.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c426e7d20907..000d8aba1030 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -64,6 +64,7 @@ config RISCV
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if MMU && 64BIT
 	select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
+	select HAVE_ARCH_KFENCE if MMU && 64BIT
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_KGDB_QXFER_PKT
 	select HAVE_ARCH_MMAP_RND_BITS if MMU
diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
new file mode 100644
index 000000000000..c25d67e0b8ba
--- /dev/null
+++ b/arch/riscv/include/asm/kfence.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_RISCV_KFENCE_H
+#define _ASM_RISCV_KFENCE_H
+
+#include <linux/kfence.h>
+#include <linux/pfn.h>
+#include <asm-generic/pgalloc.h>
+#include <asm/pgtable.h>
+
+static inline bool arch_kfence_init_pool(void)
+{
+	int i;
+	unsigned long addr;
+	pte_t *pte;
+	pmd_t *pmd;
+
+	for (addr = (unsigned long)__kfence_pool; is_kfence_address((void *)addr);
+	     addr += PAGE_SIZE) {
+		pte = virt_to_kpte(addr);
+		pmd = pmd_off_k(addr);
+
+		if (!pmd_leaf(*pmd) && pte_present(*pte))
+			continue;
+
+		pte = pte_alloc_one_kernel(&init_mm);
+		for (i = 0; i < PTRS_PER_PTE; i++)
+			set_pte(pte + i, pfn_pte(PFN_DOWN(__pa((addr & PMD_MASK) + i * PAGE_SIZE)), PAGE_KERNEL));
+
+		set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(pte)), PAGE_TABLE));
+		flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+	}
+
+	return true;
+}
+
+static inline bool kfence_protect_page(unsigned long addr, bool protect)
+{
+	pte_t *pte = virt_to_kpte(addr);
+
+	if (protect)
+		set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
+	else
+		set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
+
+	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+
+	return true;
+}
+
+#endif /* _ASM_RISCV_KFENCE_H */
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 096463cc6fff..aa08dd2f8fae 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -14,6 +14,7 @@
 #include <linux/signal.h>
 #include <linux/uaccess.h>
 #include <linux/kprobes.h>
+#include <linux/kfence.h>
 
 #include <asm/ptrace.h>
 #include <asm/tlbflush.h>
@@ -45,7 +46,15 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
 	 * Oops. The kernel tried to access some bad page. We'll have to
 	 * terminate things with extreme prejudice.
 	 */
-	msg = (addr < PAGE_SIZE) ? "NULL pointer dereference" : "paging request";
+	if (addr < PAGE_SIZE)
+		msg = "NULL pointer dereference";
+	else {
+		if (kfence_handle_page_fault(addr, regs->cause == EXC_STORE_PAGE_FAULT, regs))
+			return;
+
+		msg = "paging request";
+	}
+
 	die_kernel_fault(msg, addr, regs);
 }
 
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
