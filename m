Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DEBC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E1A6117A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E1A6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxiJeJG+fsJj5DPsKndsJiYQ5/btcbC7hFU5qwwRglI=; b=LBLgq3hoL7hQ69
	wIqqlY5DsNul0cBikUs+6qQ/4jM/HwYGisk8OhJWX3z9n4Wbi5dUMyzbn1OyfkJzCtJYnDzexQ2gU
	TBXZyVns3W1Rkw/tqPnKyq/3WRd1kzfswtSnBCIqmT0aTtWvBzjugWvLH0ZL/lqjjnN2cBrMKQAfq
	C15wE24uungvOUlWH5+HD0++4BFLwVstfyIvSWFrKmdFJRWqkPXRbSs0t4qY7d07C+8lYHZ1Hdgct
	fVQfYn2OMyxoYqJY554Pppz5lcepsMqaHsKQAZqmb8aDdwwPlSrDboHkWNl8GEBcMwKXan/q8oSvM
	3GvLuxpnyfq8bsYQR09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llW8h-0051I8-Fh; Tue, 25 May 2021 12:26:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llW7J-0050hC-45
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 12:25:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94B446141D;
 Tue, 25 May 2021 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621945500;
 bh=vJRqJ+AMT8+kzxnWKj1kIxZ59e6pDDKjue3HkRgu6TU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ny1D5G+WL6TaHpQMTLn2I8TO7UG/XYN2IX5gNrxIo5YpELKGCQb4DTZdUmj+MJWVz
 xVX2RjA7Ot+Xqjast1fg2d+IClHs1G1YKwlwS9ivFqZyFs4n1e0wbnI+ZXhg0RxOw4
 K0fXYqx+l5D/dX4JD6mSZI3TREX6wRRZRrylOQ4fAyw3dP9dbx0iQ498XZHCj1VhnH
 crLcE2lcfrkwsKVE2P5abu7WbEmypHLLeZUYLP4KnuEHOK3aABssYquKxDYu18IjBm
 ke9ryTZ+RPexB933UZm2YzLJThkY8TSrDah7t4aaUHfllcgTiFaUNlq1LTAIFPFOwr
 5yVntYKwaw/gA==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, hch@lst.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 2/2] riscv: Use use_asid_allocator flush TLB
Date: Tue, 25 May 2021 12:24:07 +0000
Message-Id: <1621945447-38820-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621945447-38820-1-git-send-email-guoren@kernel.org>
References: <1621945447-38820-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_052501_254405_188D4BD3 
X-CRM114-Status: GOOD (  15.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Use static_branch_unlikely(&use_asid_allocator) to keep the origin
tlb flush style, so it's no effect on the existing machine. Here
are the optimized functions:
 - flush_tlb_mm
 - flush_tlb_page
 - flush_tlb_range

All above are based on the below new implement functions:
 - __sbi_tlb_flush_range_asid
 - local_flush_tlb_range_asid

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/mmu_context.h |  2 ++
 arch/riscv/include/asm/tlbflush.h    | 21 +++++++++++++++++++
 arch/riscv/mm/context.c              |  2 +-
 arch/riscv/mm/tlbflush.c             | 40 +++++++++++++++++++++++++++++++++---
 4 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index b065941..7030837 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -33,6 +33,8 @@ static inline int init_new_context(struct task_struct *tsk,
 	return 0;
 }
 
+DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
+
 #include <asm-generic/mmu_context.h>
 
 #endif /* _ASM_RISCV_MMU_CONTEXT_H */
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index c84218a..4b33e7f 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -22,9 +22,30 @@ static inline void local_flush_tlb_page(unsigned long addr)
 {
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
+
+static inline void local_flush_tlb_range_asid(unsigned long start, unsigned long size,
+					      unsigned long asid)
+{
+	unsigned long tmp = start & PAGE_MASK;
+	unsigned long end = ALIGN(start + size, PAGE_SIZE);
+
+	if (size == -1) {
+		__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
+		return;
+	}
+
+	while(tmp < end) {
+		__asm__ __volatile__ ("sfence.vma %0, %1"
+				:
+				: "r" (tmp), "r" (asid)
+				: "memory");
+		tmp += PAGE_SIZE;
+	}
+}
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #define local_flush_tlb_page(addr)		do { } while (0)
+#define local_flush_tlb_range_asid(addr)	do { } while (0)
 #endif /* CONFIG_MMU */
 
 #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 68aa312..45c1b04 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -18,7 +18,7 @@
 
 #ifdef CONFIG_MMU
 
-static DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
+DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
 static unsigned long asid_bits;
 static unsigned long num_asids;
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 720b443..69588dc 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -4,6 +4,7 @@
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <asm/sbi.h>
+#include <asm/mmu_context.h>
 
 void flush_tlb_all(void)
 {
@@ -39,18 +40,51 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
 	put_cpu();
 }
 
+static void __sbi_tlb_flush_range_asid(struct cpumask *cmask, unsigned long start,
+				       unsigned long size, unsigned long asid)
+{
+	struct cpumask hmask;
+	unsigned int cpuid;
+
+	if (cpumask_empty(cmask))
+		return;
+
+	cpuid = get_cpu();
+
+	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
+		local_flush_tlb_range_asid(start, size, asid);
+	} else {
+		riscv_cpuid_to_hartid_mask(cmask, &hmask);
+		sbi_remote_sfence_vma_asid(cpumask_bits(&hmask), start, size, asid);
+	}
+
+	put_cpu();
+}
+
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1);
+	if (static_branch_unlikely(&use_asid_allocator))
+		__sbi_tlb_flush_range_asid(mm_cpumask(mm), 0, -1,
+					   atomic_long_read(&mm->context.id));
+	else
+		__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
+	if (static_branch_unlikely(&use_asid_allocator))
+		__sbi_tlb_flush_range_asid(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE,
+					   atomic_long_read(&vma->vm_mm->context.id));
+	else
+		__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start);
+	if (static_branch_unlikely(&use_asid_allocator))
+		__sbi_tlb_flush_range_asid(mm_cpumask(vma->vm_mm), start, end - start,
+					   atomic_long_read(&vma->vm_mm->context.id));
+	else
+		__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start);
 }
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
