Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64E1EE49AA
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb/PSg0cl3xmM55Zoke9BONamILsUYK+VRcOq7aMwzM=; b=el0pYsDUw3rMVB
	8Z6cDkEfhmGhjXi+KOcZGg6zzuOU7bWgQZIg2eB/zvpetp++kEZsubAc4gW0+6I6+wx+zdKxQ4PFi
	qbqZk5+xJ7MqzocW5esZUyr5QfpSxdIl/gwAgFrHDWM1HGp/1S5tD9A2YgQxvNZL6mMDhvoWm92tw
	5dacIBZYFNQBtxarLHpze4UszNz+yH6h0WXFTt0NfuZjzcqTrMR6OGhX3omD4TP3MSYrnNKBXgxDt
	o7+SYR8l4KXOWu4cVa7xEREzlwkTg4j5xlI3ENx0fOJfV83Zd4KBN4CTpomsk9WPq6KORnhulfuzg
	YooRns19hk/nA1aKcL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY44N-00DzCh-0w;
	Mon, 21 Aug 2023 12:31:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY442-00Dysr-30;
	Mon, 21 Aug 2023 12:31:26 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTsFG5XSpzNnTc;
	Mon, 21 Aug 2023 20:27:46 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:19 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
CC: <surenb@google.com>, <willy@infradead.org>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH rfc v2 06/10] riscv: mm: use try_vma_locked_page_fault()
Date: Mon, 21 Aug 2023 20:30:52 +0800
Message-ID: <20230821123056.2109942-7-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_053123_423436_0F979E3E 
X-CRM114-Status: GOOD (  15.09  )
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

Use new try_vma_locked_page_fault() helper to simplify code.
No functional change intended.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/mm/fault.c | 58 ++++++++++++++++++-------------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 6115d7514972..b46129b636f2 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -215,6 +215,13 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 	return false;
 }
 
+#ifdef CONFIG_PER_VMA_LOCK
+bool arch_vma_access_error(struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	return access_error(vmf->fault_code, vma);
+}
+#endif
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -223,17 +230,16 @@ void handle_page_fault(struct pt_regs *regs)
 {
 	struct task_struct *tsk;
 	struct vm_area_struct *vma;
-	struct mm_struct *mm;
-	unsigned long addr, cause;
-	unsigned int flags = FAULT_FLAG_DEFAULT;
+	struct mm_struct *mm = current->mm;
+	unsigned long addr = regs->badaddr;
+	unsigned long cause = regs->cause;
 	int code = SEGV_MAPERR;
 	vm_fault_t fault;
-
-	cause = regs->cause;
-	addr = regs->badaddr;
-
-	tsk = current;
-	mm = tsk->mm;
+	struct vm_fault vmf = {
+		.real_address = addr,
+		.fault_code = cause,
+		.flags = FAULT_FLAG_DEFAULT,
+	};
 
 	if (kprobe_page_fault(regs, cause))
 		return;
@@ -268,7 +274,7 @@ void handle_page_fault(struct pt_regs *regs)
 	}
 
 	if (user_mode(regs))
-		flags |= FAULT_FLAG_USER;
+		vmf.flags |= FAULT_FLAG_USER;
 
 	if (!user_mode(regs) && addr < TASK_SIZE && unlikely(!(regs->status & SR_SUM))) {
 		if (fixup_exception(regs))
@@ -280,37 +286,21 @@ void handle_page_fault(struct pt_regs *regs)
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
 	if (cause == EXC_STORE_PAGE_FAULT)
-		flags |= FAULT_FLAG_WRITE;
+		vmf.flags |= FAULT_FLAG_WRITE;
 	else if (cause == EXC_INST_PAGE_FAULT)
-		flags |= FAULT_FLAG_INSTRUCTION;
-	if (!(flags & FAULT_FLAG_USER))
-		goto lock_mmap;
-
-	vma = lock_vma_under_rcu(mm, addr);
-	if (!vma)
-		goto lock_mmap;
+		vmf.flags |= FAULT_FLAG_INSTRUCTION;
 
-	if (unlikely(access_error(cause, vma))) {
-		vma_end_read(vma);
-		goto lock_mmap;
-	}
-
-	fault = handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK, regs);
-	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
-		vma_end_read(vma);
-
-	if (!(fault & VM_FAULT_RETRY)) {
-		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+	fault = try_vma_locked_page_fault(&vmf);
+	if (fault == VM_FAULT_NONE)
+		goto retry;
+	if (!(fault & VM_FAULT_RETRY))
 		goto done;
-	}
-	count_vm_vma_lock_event(VMA_LOCK_RETRY);
 
 	if (fault_signal_pending(fault, regs)) {
 		if (!user_mode(regs))
 			no_context(regs, addr);
 		return;
 	}
-lock_mmap:
 
 retry:
 	vma = lock_mm_and_find_vma(mm, addr, regs);
@@ -337,7 +327,7 @@ void handle_page_fault(struct pt_regs *regs)
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, addr, flags, regs);
+	fault = handle_mm_fault(vma, addr, vmf.flags, regs);
 
 	/*
 	 * If we need to retry but a fatal signal is pending, handle the
@@ -355,7 +345,7 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 
 	if (unlikely(fault & VM_FAULT_RETRY)) {
-		flags |= FAULT_FLAG_TRIED;
+		vmf.flags |= FAULT_FLAG_TRIED;
 
 		/*
 		 * No need to mmap_read_unlock(mm) as we would
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
