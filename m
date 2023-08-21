Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FC5EE49AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4S1CTxZMMl/JLcJF77gPc7NoxOlMEbSndZKJSOFHYY=; b=pvfSLSdhK5jBhA
	bQAOE1bO2vHMqijT4PrX5u0YmWd4rDZKFkiFbU2q8X4sKS2c9lH8jHQbXqvvzhwxeGBX88LmtobRz
	2hpfKGkHlVy8Y6DHp0K8vNrO+IE4wjI+OfM7faKLa3CZU6uhrwh1yrMalkKKz3SBFBZ+P8UqtCJX2
	fWehDy+jARtaReVRz5voFZTghMYJTpmzgTM6jCYiwCdWPpRYw7kvNl0Cdc+2OStr9/fCPBItcxON7
	WO2UofM76FyZjuD8bWUPQl5J0VUgTqmjFpzyJb+DG76P/jewNkgTHXYSYDueS+OiDrJmX1hmXEkEm
	EPTOHqoUAeCfI1Hut2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY446-00Dyyv-0t;
	Mon, 21 Aug 2023 12:31:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY440-00Dyre-0m;
	Mon, 21 Aug 2023 12:31:22 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RTsF110wXztSVv;
	Mon, 21 Aug 2023 20:27:33 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:14 +0800
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
Subject: [PATCH rfc v2 02/10] arm64: mm: use try_vma_locked_page_fault()
Date: Mon, 21 Aug 2023 20:30:48 +0800
Message-ID: <20230821123056.2109942-3-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_053120_729323_D6C424A1 
X-CRM114-Status: GOOD (  16.75  )
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

Use new try_vma_locked_page_fault() helper to simplify code, also
pass struct vmf to __do_page_fault() directly instead of each
independent variable. No functional change intended.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm64/mm/fault.c | 60 ++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 2e5d1e238af9..2b7a1e610b3e 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -498,9 +498,8 @@ static void do_bad_area(unsigned long far, unsigned long esr,
 #define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
 
 static vm_fault_t __do_page_fault(struct mm_struct *mm,
-				  struct vm_area_struct *vma, unsigned long addr,
-				  unsigned int mm_flags, unsigned long vm_flags,
-				  struct pt_regs *regs)
+				  struct vm_area_struct *vma,
+				  struct vm_fault *vmf)
 {
 	/*
 	 * Ok, we have a good vm_area for this memory access, so we can handle
@@ -508,9 +507,9 @@ static vm_fault_t __do_page_fault(struct mm_struct *mm,
 	 * Check that the permissions on the VMA allow for the fault which
 	 * occurred.
 	 */
-	if (!(vma->vm_flags & vm_flags))
+	if (!(vma->vm_flags & vmf->vm_flags))
 		return VM_FAULT_BADACCESS;
-	return handle_mm_fault(vma, addr, mm_flags, regs);
+	return handle_mm_fault(vma, vmf->real_address, vmf->flags, vmf->regs);
 }
 
 static bool is_el0_instruction_abort(unsigned long esr)
@@ -533,10 +532,12 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	const struct fault_info *inf;
 	struct mm_struct *mm = current->mm;
 	vm_fault_t fault;
-	unsigned long vm_flags;
-	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
 	unsigned long addr = untagged_addr(far);
 	struct vm_area_struct *vma;
+	struct vm_fault vmf = {
+		.real_address = addr,
+		.flags = FAULT_FLAG_DEFAULT,
+	};
 
 	if (kprobe_page_fault(regs, esr))
 		return 0;
@@ -549,7 +550,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		goto no_context;
 
 	if (user_mode(regs))
-		mm_flags |= FAULT_FLAG_USER;
+		vmf.flags |= FAULT_FLAG_USER;
 
 	/*
 	 * vm_flags tells us what bits we must have in vma->vm_flags
@@ -559,20 +560,20 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	 */
 	if (is_el0_instruction_abort(esr)) {
 		/* It was exec fault */
-		vm_flags = VM_EXEC;
-		mm_flags |= FAULT_FLAG_INSTRUCTION;
+		vmf.vm_flags = VM_EXEC;
+		vmf.flags |= FAULT_FLAG_INSTRUCTION;
 	} else if (is_write_abort(esr)) {
 		/* It was write fault */
-		vm_flags = VM_WRITE;
-		mm_flags |= FAULT_FLAG_WRITE;
+		vmf.vm_flags = VM_WRITE;
+		vmf.flags |= FAULT_FLAG_WRITE;
 	} else {
 		/* It was read fault */
-		vm_flags = VM_READ;
+		vmf.vm_flags = VM_READ;
 		/* Write implies read */
-		vm_flags |= VM_WRITE;
+		vmf.vm_flags |= VM_WRITE;
 		/* If EPAN is absent then exec implies read */
 		if (!cpus_have_const_cap(ARM64_HAS_EPAN))
-			vm_flags |= VM_EXEC;
+			vmf.vm_flags |= VM_EXEC;
 	}
 
 	if (is_ttbr0_addr(addr) && is_el1_permission_fault(addr, esr, regs)) {
@@ -587,26 +588,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
-	if (!(mm_flags & FAULT_FLAG_USER))
-		goto lock_mmap;
-
-	vma = lock_vma_under_rcu(mm, addr);
-	if (!vma)
-		goto lock_mmap;
-
-	if (!(vma->vm_flags & vm_flags)) {
-		vma_end_read(vma);
-		goto lock_mmap;
-	}
-	fault = handle_mm_fault(vma, addr, mm_flags | FAULT_FLAG_VMA_LOCK, regs);
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
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
@@ -614,8 +600,6 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 			goto no_context;
 		return 0;
 	}
-lock_mmap:
-
 retry:
 	vma = lock_mm_and_find_vma(mm, addr, regs);
 	if (unlikely(!vma)) {
@@ -623,7 +607,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		goto done;
 	}
 
-	fault = __do_page_fault(mm, vma, addr, mm_flags, vm_flags, regs);
+	fault = __do_page_fault(mm, vma, &vmf);
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {
@@ -637,7 +621,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		return 0;
 
 	if (fault & VM_FAULT_RETRY) {
-		mm_flags |= FAULT_FLAG_TRIED;
+		vmf.flags |= FAULT_FLAG_TRIED;
 		goto retry;
 	}
 	mmap_read_unlock(mm);
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
