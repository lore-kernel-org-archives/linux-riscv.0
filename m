Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9B8EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 12:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQ8D52pk9YNjrKADQb8ScKEcpTuHf2s2ceuvHvWBHOY=; b=sV0wo18PbmhRMG
	hBdQpuX/ZVIknTq7cjYh5z5hNXwijPG9bH+CEFrxggY4yWiNAH4mPBerc4rK9Q300Llj8kzwa6auu
	2YBdNogI0xDOfb5ySGmvEyf0zO3qSki8J7yu+ymRGZQ1qZMRJGLZA+pOfZ08APqlnxff8teLBQ9jW
	K4M6grB2QwhbvakTE029EkOho8xHeskT4vnYY8yW4p3BIy/sznEo8+ZtGqUOkmE4L4RFgGqzKIZ3X
	g2sfMdHDjHSUE6i5x7b3I+Je1rqnXevL520lGWwJ8l+Ix4RYCuAmC0K66B0zMr2vtDSqMo0Tw1fHe
	+PA1e99NC45dNE87NXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY44k-00DzSK-1A;
	Mon, 21 Aug 2023 12:32:06 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY444-00DytR-0K;
	Mon, 21 Aug 2023 12:31:30 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTsGr51ZwzVks7;
	Mon, 21 Aug 2023 20:29:08 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:20 +0800
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
Subject: [PATCH rfc v2 07/10] ARM: mm: try VMA lock-based page fault handling first
Date: Mon, 21 Aug 2023 20:30:53 +0800
Message-ID: <20230821123056.2109942-8-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_053124_679498_5CCF4F39 
X-CRM114-Status: GOOD (  16.95  )
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

Attempt VMA lock-based page fault handling first, and fall back
to the existing mmap_lock-based handling if that fails.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm/Kconfig    |  1 +
 arch/arm/mm/fault.c | 35 +++++++++++++++++++++++++----------
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1a6a6eb48a15..8b6d4507ccee 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -34,6 +34,7 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index fef62e4a9edd..d53bb028899a 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -242,8 +242,11 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	struct vm_area_struct *vma;
 	int sig, code;
 	vm_fault_t fault;
-	unsigned int flags = FAULT_FLAG_DEFAULT;
-	unsigned long vm_flags = VM_ACCESS_FLAGS;
+	struct vm_fault vmf = {
+		.real_address = addr,
+		.flags = FAULT_FLAG_DEFAULT,
+		.vm_flags = VM_ACCESS_FLAGS,
+	};
 
 	if (kprobe_page_fault(regs, fsr))
 		return 0;
@@ -261,15 +264,15 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 		goto no_context;
 
 	if (user_mode(regs))
-		flags |= FAULT_FLAG_USER;
+		vmf.flags |= FAULT_FLAG_USER;
 
 	if (is_write_fault(fsr)) {
-		flags |= FAULT_FLAG_WRITE;
-		vm_flags = VM_WRITE;
+		vmf.flags |= FAULT_FLAG_WRITE;
+		vmf.vm_flags = VM_WRITE;
 	}
 
 	if (fsr & FSR_LNX_PF) {
-		vm_flags = VM_EXEC;
+		vmf.vm_flags = VM_EXEC;
 
 		if (is_permission_fault(fsr) && !user_mode(regs))
 			die_kernel_fault("execution of memory",
@@ -278,6 +281,18 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
+	fault = try_vma_locked_page_fault(&vmf);
+	if (fault == VM_FAULT_NONE)
+		goto retry;
+	if (!(fault & VM_FAULT_RETRY))
+		goto done;
+
+	if (fault_signal_pending(fault, regs)) {
+		if (!user_mode(regs))
+			goto no_context;
+		return 0;
+	}
+
 retry:
 	vma = lock_mm_and_find_vma(mm, addr, regs);
 	if (unlikely(!vma)) {
@@ -289,10 +304,10 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	 * ok, we have a good vm_area for this memory access, check the
 	 * permissions on the VMA allow for the fault which occurred.
 	 */
-	if (!(vma->vm_flags & vm_flags))
+	if (!(vma->vm_flags & vmf.vm_flags))
 		fault = VM_FAULT_BADACCESS;
 	else
-		fault = handle_mm_fault(vma, addr & PAGE_MASK, flags, regs);
+		fault = handle_mm_fault(vma, addr & PAGE_MASK, vmf.flags, regs);
 
 	/* If we need to retry but a fatal signal is pending, handle the
 	 * signal first. We do not need to release the mmap_lock because
@@ -310,13 +325,13 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 	if (!(fault & VM_FAULT_ERROR)) {
 		if (fault & VM_FAULT_RETRY) {
-			flags |= FAULT_FLAG_TRIED;
+			vmf.flags |= FAULT_FLAG_TRIED;
 			goto retry;
 		}
 	}
 
 	mmap_read_unlock(mm);
-
+done:
 	/*
 	 * Handle the "normal" case first - VM_FAULT_MAJOR
 	 */
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
