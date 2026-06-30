Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D579C43602
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TkCfsil3oFAJvD7VKfs9Jw87byAQB1WXofWSzqJz7pE=; b=4qAvG8b983eXeE
	3PjUjqssHNQuet6MG+A5yC4SaYHRABa+suCjRf5Bhy1pel3qNbcBlilX5dgVbBKLNKzQlMUeAFEJs
	ZegABj8B+YPkpXIYjCOlNta0u2DqE+3pBV35llHTCKks4zbN3dAYTCsOagMM0LMbVsdWYxWENMbmR
	7FmdS5mG1jsrkcKMiY3rWxPPYQcpit1eYmsPwxyWjHe82GiDZ3x2ZYPBuwHsYt/FB4rj3I9A0pU9D
	Q2pOEKct7TuedZSSUBuUMJBOaoYAfW+nqovCCz8UFAPJoHSzxOUw70X6qWfBEyAlmNdXTI6gVhrtc
	1qXH1tFhbhy0qH4tM8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5V-0000000Fys6-00Ty;
	Tue, 30 Jun 2026 06:36:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5S-0000000Fypj-3uVo
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=N2nOin7119A8OFWjzdJgiYfIcWaOpdcCRtKsgB5ab2g=; b=Mh70Hl5Pkqao6LqyPUBVYnGFU9
	S1TDlVGJ6P0OhKOO+Ro9Ekpo5JY/Zd849Bx/uPK5yRdEyL7l5DycN9/VT8sUmC9JWoAo2t+QgKaIQ
	vikyvn6Dkri6U3D2dFErR9XUgg3z0IReKEqfL1RNXSucMc5wjj8FlBdmaFOAOYKZxOgdo5dFj/jpI
	LCYOn0jXH8MkPkbUwGd9G5wV+fj7PzSruwcRWMyZDVsOmVIWqcUXnm1Uho3gciYq+pr74mRTnFds8
	xylXY0l+EFffqaUZLR8ygn29tFiTzw0ViilEAYzKgVnyF74R0Y3VdJJcGwbTmSLt+1MDXa0mWqHFz
	CNIrlLxQ==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS5K-00000001ZDx-04uh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 06:36:48 +0000
Received: from [127.0.0.2] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACX_uHoY0NqK2UiFg--.7986S2;
	Tue, 30 Jun 2026 14:36:25 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 30 Jun 2026 14:36:24 +0800
Subject: [PATCH] riscv: Avoid stack access when CSR_SCRATCH is incorrect
MIME-Version: 1.0
Message-Id: <20260630-riscv-no-stack-when-wrong-scratch-v1-1-0f9b9cb5cf67@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAOdjQ2oC/yXNwQrCMAyA4VcZORvoOhziq4iHNotrFFpJ6iaMv
 btVj9/l/zcwVmGDc7eB8iImJTf0hw4ohTwzytQM3vnRjYNDFaMFc0GrgR64Js64askzGmmolPA
 4uIkj9XSKHlrnqXyT9+9xuf5tr3hnqt8w7PsHitMfXYUAAAA=
X-Change-ID: 20260630-riscv-no-stack-when-wrong-scratch-530debc1c8b2
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, Yaxing Guo <guoyaxing@bosc.ac.cn>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: zQCowACX_uHoY0NqK2UiFg--.7986S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw1UtryfCw4UXF4xXrW7CFg_yoWxZryDpr
	ZxCF9xKrsYkryrG3yIy3Z5uFyrJwsxWayakan7Ca45Jr40ga1rXw1ktas8GFyDJrWYgr10
	9F4DZw1Ska1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VU11rW7
	UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073643_005002_E4E01E01 
X-CRM114-Status: GOOD (  19.72  )
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

The kernel exception handler unconditionally relies on the value in
CSR_SCRATCH, whether it is 0 (meaning kernel mode) or the current
pointer (meaning user mode). Therefore, any exception that happens while
CSR_SCRATCH does not reflect the current privilege mode would be
irrecoverable.

When VMAP_STACK=y, spurious-seeming page faults can happen while
accessing the stack if the processor has cached/still-in-pipeline
non-valid PTEs. Therefore, it is unsafe to access the stack on entry
before setting CSR_SCRATCH to 0, or on exit to user after setting
CSR_SCRATCH to current.

Therefore, instead of using the stack, make some scratch space in
task_info for these fragile regions of code, and access them using
offsets from tp. The scratch space for mark_new_valid_map is not reused
because the page fault *can* nest in places where the scratch space is
needed.

Fixes: 503638e0babf ("riscv: Stop emitting preventive sfence.vma for new vmalloc mappings")
Reported-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
Link: https://lore.kernel.org/linux-riscv/20260601084524.34584-1-guoyaxing@bosc.ac.cn/
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
There does seem to be a remaining question: Couldn't the
task_struct/thread_info access also take a spurious-seeming fault?

At least in practice, this doesn't seem to be a problem. The definitive
fix *might* be that the task_struct kmem_cache needs a
flush_tlb_kernel_range() on the allocation slow path.

And of course I tried making it use absolutely no memory accesses in
these fragile parts, but I really couldn't figure it out.
---
 arch/riscv/include/asm/csr.h         |  1 +
 arch/riscv/include/asm/thread_info.h |  5 +++
 arch/riscv/kernel/asm-offsets.c      |  2 ++
 arch/riscv/kernel/entry.S            | 65 +++++++++++++++++++++++++++---------
 4 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 31b8988f4488..d033a7ed56d9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -16,6 +16,7 @@
 #define SR_MPIE		_AC(0x00000080, UL) /* Previous Machine IE */
 #define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
+#define SR_MPP_SHIFT	11
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
 /* zicfilp landing pad status bit */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 55019fdfa9ec..afa9c61d74c6 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -73,6 +73,11 @@ struct thread_info {
 	 */
 	unsigned long		a0, a1, a2;
 #endif
+	/*
+	 * Used in ret_from_exception() and handle_exception() as scratch space
+	 * when CSR_SCRATCH does not reflect the current privilege mode.
+	 */
+	unsigned long		tp, t0;
 #ifdef CONFIG_RISCV_USER_CFI
 	struct cfi_state	user_cfi_state;
 #endif
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index af827448a609..2d617234bcdb 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -49,6 +49,8 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
 	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
 #endif
+	OFFSET(TASK_TI_TP, task_struct, thread_info.tp);
+	OFFSET(TASK_TI_T0, task_struct, thread_info.t0);
 
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
 #ifdef CONFIG_RISCV_USER_CFI
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index c6988983cdf7..e268a4c07921 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -126,6 +126,8 @@
 .endm
 
 SYM_CODE_START(handle_exception)
+	/* Caution: CSR_SCARTCH does not reflect privilege mode from now on. */
+
 	/*
 	 * If coming from userspace, preserve the user thread pointer and load
 	 * the kernel thread pointer.  If we came from the kernel, the scratch
@@ -163,6 +165,19 @@ SYM_CODE_START(handle_exception)
 #endif
 
 .Lsave_context:
+	REG_S t0, TASK_TI_T0(tp)
+
+	/*
+	 * Grab the saved TP, and also set the scratch register back to 0, so
+	 * that if a recursive exception occurs, the exception vector knows it
+	 * came from the kernel.
+	 *
+	 * Caution: CSR_SCARTCH does not reflect privilege mode before this.
+	 */
+	csrrw t0, CSR_SCRATCH, zero
+	REG_S t0, TASK_TI_TP(tp)
+	REG_L t0, TASK_TI_T0(tp)
+
 	REG_S sp, TASK_TI_USER_SP(tp)
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
@@ -190,7 +205,7 @@ SYM_CODE_START(handle_exception)
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
-	csrr s5, CSR_SCRATCH
+	REG_L s5, TASK_TI_TP(tp)
 	REG_S s0, PT_SP(sp)
 	REG_S s1, PT_STATUS(sp)
 	REG_S s2, PT_EPC(sp)
@@ -198,12 +213,6 @@ SYM_CODE_START(handle_exception)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 
-	/*
-	 * Set the scratch register to 0, so that if a recursive exception
-	 * occurs, the exception vector knows it came from the kernel
-	 */
-	csrw CSR_SCRATCH, x0
-
 	/* Load the global pointer */
 	load_global_pointer
 
@@ -271,11 +280,6 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 
-	/*
-	 * Save TP into the scratch register , so we can find the kernel data
-	 * structures again.
-	 */
-	csrw CSR_SCRATCH, tp
 1:
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
@@ -308,11 +312,42 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 
 	REG_L x1,  PT_RA(sp)
 	REG_L x3,  PT_GP(sp)
-	REG_L x4,  PT_TP(sp)
-	REG_L x5,  PT_T0(sp)
 	restore_from_x6_to_x31
 
-	REG_L x2,  PT_SP(sp)
+	/*
+	 * Stash t0 and tp in thread_info since we can't access the stack after
+	 * switching CSR_SCRATCH.
+	 */
+	REG_L t0,  PT_T0(sp)
+	REG_S t0,  TASK_TI_T0(tp)
+	REG_L t0,  PT_TP(sp)
+	REG_S t0,  TASK_TI_TP(tp)
+
+	REG_L sp,  PT_SP(sp)
+
+	/* If returning to user mode, set CSR_SCRATCH to tp, else 0 */
+	csrr t0, CSR_STATUS
+#if defined(CONFIG_RISCV_M_MODE)
+	/* the MPP value is too large to be used as an immediate arg for andi */
+	srli t0, t0, SR_MPP_SHIFT
+	andi t0, t0, SR_MPP >> SR_MPP_SHIFT
+	/* t0 = (mstatus & SR_MPP) >> SR_MPP_SHIFT */
+#else
+	andi t0, t0, SR_SPP
+	/* t0 = sstatus & SR_SPP */
+#endif
+	seqz t0, t0
+	/* t0 = !(status & SR_PP) */
+	neg t0, t0
+	/* t0 = (status & SR_PP) ? 0 : -1 */
+	and t0, t0, tp
+	/* t0 = (status & SR_PP) ? 0 : tp */
+	csrw CSR_SCRATCH, t0
+
+	/* Caution: CSR_SCARTCH does not reflect privilege mode from now on. */
+
+	REG_L t0,  TASK_TI_T0(tp)
+	REG_L tp,  TASK_TI_TP(tp)
 
 #ifdef CONFIG_RISCV_M_MODE
 	mret

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260630-riscv-no-stack-when-wrong-scratch-530debc1c8b2

Best regards,
--  
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
