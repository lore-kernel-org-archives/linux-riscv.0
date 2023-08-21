Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04741EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mjmdgacf2+PZW1X6rjDj6rs52GQYD1N9nKAJCWgPokk=; b=UMYhsXOVNYhEwq
	v2evxCbf6whtwTUeyOdvExf5+cUNe6Bvhu20lZqlkqr6nPQpgo6vU7bsVVdAG1lVSEuLYfc/BqL/w
	MmQ/oluqFn+1HJrTk2UTOcKQc/Wch9tpv8URvuoyjg1Bk6+RnCYRtnIutd+5ppQ7kahyhJy473+sI
	FXOOA51C7o6n+kE/U5Dy6UJETMJeX7pL5W8IPyDbc755SQYAaAE0dibqBOAAQcMgub/1B82oTvUJo
	FAQ4h6tiR2k0bGKQTkX4OH1NP7Qnjw3UtdEYVVoU3HXdLcTs1x/brGk3GgCoRxSvoeUyDtdbnpqJG
	C/dnjNWXU1JnSnFKVnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY44U-00DzH9-2j;
	Mon, 21 Aug 2023 12:31:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY442-00Dys4-2x;
	Mon, 21 Aug 2023 12:31:28 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTsFF3Rj6zNnTN;
	Mon, 21 Aug 2023 20:27:45 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:17 +0800
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
Subject: [PATCH rfc v2 05/10] powerpc: mm: use try_vma_locked_page_fault()
Date: Mon, 21 Aug 2023 20:30:51 +0800
Message-ID: <20230821123056.2109942-6-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_053123_526355_352F1653 
X-CRM114-Status: GOOD (  16.64  )
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
 arch/powerpc/mm/fault.c | 66 ++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b1723094d464..52f9546e020e 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -391,6 +391,22 @@ static int page_fault_is_bad(unsigned long err)
 #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
 #endif
 
+#ifdef CONFIG_PER_VMA_LOCK
+bool arch_vma_access_error(struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	int is_exec = TRAP(vmf->regs) == INTERRUPT_INST_STORAGE;
+	int is_write = page_fault_is_write(vmf->fault_code);
+
+	if (unlikely(access_pkey_error(is_write, is_exec,
+				(vmf->fault_code & DSISR_KEYFAULT), vma)))
+		return true;
+
+	if (unlikely(access_error(is_write, is_exec, vma)))
+		return true;
+	return false;
+}
+#endif
+
 /*
  * For 600- and 800-family processors, the error_code parameter is DSISR
  * for a data fault, SRR1 for an instruction fault.
@@ -407,12 +423,18 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 {
 	struct vm_area_struct * vma;
 	struct mm_struct *mm = current->mm;
-	unsigned int flags = FAULT_FLAG_DEFAULT;
 	int is_exec = TRAP(regs) == INTERRUPT_INST_STORAGE;
 	int is_user = user_mode(regs);
 	int is_write = page_fault_is_write(error_code);
 	vm_fault_t fault, major = 0;
 	bool kprobe_fault = kprobe_page_fault(regs, 11);
+	struct vm_fault vmf = {
+		.real_address = address,
+		.fault_code = error_code,
+		.regs = regs,
+		.flags = FAULT_FLAG_DEFAULT,
+	};
+
 
 	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
 		return 0;
@@ -463,45 +485,21 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * mmap_lock held
 	 */
 	if (is_user)
-		flags |= FAULT_FLAG_USER;
+		vmf.flags |= FAULT_FLAG_USER;
 	if (is_write)
-		flags |= FAULT_FLAG_WRITE;
+		vmf.flags |= FAULT_FLAG_WRITE;
 	if (is_exec)
-		flags |= FAULT_FLAG_INSTRUCTION;
+		vmf.flags |= FAULT_FLAG_INSTRUCTION;
 
-	if (!(flags & FAULT_FLAG_USER))
-		goto lock_mmap;
-
-	vma = lock_vma_under_rcu(mm, address);
-	if (!vma)
-		goto lock_mmap;
-
-	if (unlikely(access_pkey_error(is_write, is_exec,
-				       (error_code & DSISR_KEYFAULT), vma))) {
-		vma_end_read(vma);
-		goto lock_mmap;
-	}
-
-	if (unlikely(access_error(is_write, is_exec, vma))) {
-		vma_end_read(vma);
-		goto lock_mmap;
-	}
-
-	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
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
 
 	if (fault_signal_pending(fault, regs))
 		return user_mode(regs) ? 0 : SIGBUS;
 
-lock_mmap:
-
 	/* When running in the kernel we expect faults to occur only to
 	 * addresses in user space.  All other faults represent errors in the
 	 * kernel and should generate an OOPS.  Unfortunately, in the case of an
@@ -528,7 +526,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, address, flags, regs);
+	fault = handle_mm_fault(vma, address, vmf.flags, regs);
 
 	major |= fault & VM_FAULT_MAJOR;
 
@@ -544,7 +542,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * case.
 	 */
 	if (unlikely(fault & VM_FAULT_RETRY)) {
-		flags |= FAULT_FLAG_TRIED;
+		vmf.flags |= FAULT_FLAG_TRIED;
 		goto retry;
 	}
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
