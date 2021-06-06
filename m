Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A553EC47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:21:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4831F61408
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4831F61408
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbsPcNa/MnVOwEE/ktWLGu8BK0XmjPlnHy5w11fmlmk=; b=dpSAceglbM/s1C
	DFEaH180jRDlSBvWbSQqlNkOt8w3KtvxOmT9orMODB9F7ZCpr2U7VjQqG/XOUU4VEpDxOpB6DAWXk
	GkHs5sE5Di1Eypa66toGiHP72ZGg47ONjIeQmLtxEYVsiLljAkOmdB29R0cwpbJImUOUdHKsTK6od
	aLtRQ+4GHqvtRwLK232ztl6zrjdiLdcd/vlLM8ILyrp11/Sj3ikP0jnSsGhHmASIc+H+oC5vpdjqM
	EkJ5lu/VxMJaMLkZBIK0dVCLhstb6Yt3ybaiAsi3dq8FeKKLlUyBpz2F3tqOCL7thQHwReB1rCT7y
	vyjchqdURrt1UVAEDgug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpuaF-000TaE-V0; Sun, 06 Jun 2021 15:21:03 +0000
Received: from [2001:4bb8:192:ff5f:a26e:bb8d:e917:2d71] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpuaD-000TZL-5k; Sun, 06 Jun 2021 15:21:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org,
	palmerdabbelt@google.com
Cc: anup.patel@wdc.com, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/2] riscv: add ASID-based tlbflushing methods
Date: Sun,  6 Jun 2021 17:20:50 +0200
Message-Id: <20210606152050.636038-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210606152050.636038-1-hch@lst.de>
References: <20210606152050.636038-1-hch@lst.de>
MIME-Version: 1.0
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

Implement optimized version of the tlb flushing routines for systems
using ASIDs. These are behind the use_asid_allocator static branch to
not affect existing systems not using ASIDs.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
[hch: rebased on top of previous cleanups, use the same algorithm as
      the non-ASID based code for local vs global flushes, keep functions
      as local as possible]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/mmu_context.h |  2 ++
 arch/riscv/mm/context.c              |  2 +-
 arch/riscv/mm/tlbflush.c             | 47 +++++++++++++++++++++++-----
 3 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index b0659413a080..7030837adc1a 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -33,6 +33,8 @@ static inline int init_new_context(struct task_struct *tsk,
 	return 0;
 }
 
+DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
+
 #include <asm-generic/mmu_context.h>
 
 #endif /* _ASM_RISCV_MMU_CONTEXT_H */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 9bc46ab01c25..6ed696bad558 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -18,7 +18,7 @@
 
 #ifdef CONFIG_MMU
 
-static DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
+DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
 static unsigned long asid_bits;
 static unsigned long num_asids;
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index b458949fa8df..64f8201237c2 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -4,6 +4,24 @@
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <asm/sbi.h>
+#include <asm/mmu_context.h>
+
+static inline void local_flush_tlb_all_asid(unsigned long asid)
+{
+	__asm__ __volatile__ ("sfence.vma x0, %0"
+			:
+			: "r" (asid)
+			: "memory");
+}
+
+static inline void local_flush_tlb_page_asid(unsigned long addr,
+		unsigned long asid)
+{
+	__asm__ __volatile__ ("sfence.vma %0, %1"
+			:
+			: "r" (addr), "r" (asid)
+			: "memory");
+}
 
 void flush_tlb_all(void)
 {
@@ -16,21 +34,36 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 	struct cpumask *cmask = mm_cpumask(mm);
 	struct cpumask hmask;
 	unsigned int cpuid;
+	bool broadcast;
 
 	if (cpumask_empty(cmask))
 		return;
 
 	cpuid = get_cpu();
+	/* check if the tlbflush needs to be sent to other CPUs */
+	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
+	if (static_branch_unlikely(&use_asid_allocator)) {
+		unsigned long asid = atomic_long_read(&mm->context.id);
 
-	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
-		/* local cpu is the only cpu present in cpumask */
-		if (size <= stride)
+		if (broadcast) {
+			riscv_cpuid_to_hartid_mask(cmask, &hmask);
+			sbi_remote_sfence_vma_asid(cpumask_bits(&hmask),
+						   start, size, asid);
+		} else if (size <= stride) {
+			local_flush_tlb_page_asid(start, asid);
+		} else {
+			local_flush_tlb_all_asid(asid);
+		}
+	} else {
+		if (broadcast) {
+			riscv_cpuid_to_hartid_mask(cmask, &hmask);
+			sbi_remote_sfence_vma(cpumask_bits(&hmask),
+					      start, size);
+		} else if (size <= stride) {
 			local_flush_tlb_page(start);
-		else
+		} else {
 			local_flush_tlb_all();
-	} else {
-		riscv_cpuid_to_hartid_mask(cmask, &hmask);
-		sbi_remote_sfence_vma(cpumask_bits(&hmask), start, size);
+		}
 	}
 
 	put_cpu();
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
