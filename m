Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A200C83F07
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQOfgrBuzh2uMhH8B7cjCrW3mpbU15iskNrPl09Dhl8=; b=U9yZsWcptAc4S7
	AuQ7Ew5qHd3kgQqCnRzjiPqDe58V1PLrqvVTTW5ro2d6m7AIXLa/LDVBrBUZyviISpZlyI57ePDLm
	EtWWFCADgnOQgB1JfUJ6ecgiTE5mNQJ5ZEJHR8ICjowy51BE+5FISmk4DHGStpn7Xs0XkUwJTYxR7
	Fs1WtvWFjW4DWmv8AKFHs6H6q0TsrVhVKwGlaDQJ2LGgUC32C/eVi8ESbpSh3NTO+YIOd92Y9LHoE
	l7K+jANTpAaMeR7YsYoCA3TRfDkTi2dFxN+v+MyWzVTIz8LYrkviD2ibfts2S7XUDYWUWh96fRUY/
	EMsR7s2PJLe661nPBG/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRx-00000002TXX-2PcG;
	Mon, 07 Jul 2025 13:00:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlIw-00000002SSZ-38ot
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 12:50:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso452883f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 05:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751892641; x=1752497441; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft2gGM1xdSh/BYGEm14JWzh26OBrCpmeDTwJtAeavYc=;
        b=BqW/qqrIqLlhQGKdmNlJ+qBAStwWPRDq3PUmw/1ORIE3He0tfv9LAv0XuaKhcg19T4
         n4hpxntUT7XMSi35OuAtk1rYCMWbkj9ngClvLLJHYCXuBjeuKTBc+G6dK1miiUlnf9Of
         1KJ0AlV4AX4atjxMw29VrVVNuBfoVOmgH4m2hrHrDjBRihVexZYc3c4wqFs34d+cuU9C
         iL8zteuPmPSzmonSkiuglKz8kxnwT6AFy1J3iWZmOeyzUQwlzmxgVMa13OrCrYuoXt9O
         jdrVOAqZIChh3kAMuz9gHQp0l32+ajYIyXsBSITDT8a74qgGeZ4RRk6uX4nGv1yvLw7L
         5ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892641; x=1752497441;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ft2gGM1xdSh/BYGEm14JWzh26OBrCpmeDTwJtAeavYc=;
        b=h5UQdMJczfhnfD0iP5N8jcFX/XQNUw90y45avsvrjd9105U50sO5PAjfWnRBO2trrq
         JC+n56er+V2clcnNjr4LALAGdUU0ndmRhE/w7ZYkI6SSrLP5l2cMAmGl14wrJ3IPEsfh
         L4fR2p1ES5Fa4EyFPpJ5kPnjGV1Zf2zdUtB0DtBKUns1P1qAs8QtCZHlPYysJggaYYBX
         y/ADn4iyImCje6Fa71ozQqryzKqXex2n1Pfh+Hrd5ZDBlaoFpkTY5e6Eucz6JIpjveJw
         fmGipNIKaiNGsUg5QTeZHA/v15ZXIq4n5b1B7uSwpjzyCq2uBcAxafqXDfAyeEYaDmgz
         cnmg==
X-Forwarded-Encrypted: i=1; AJvYcCWURSBXvbvQYbhGrHY9nAalFk6+CQhPYjchtklzX6jRw+32gJKH2dNk4eGrdIV4WjNPPaj8hoedwOXTcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YycUpuqBgjy6+iT6Okn7VsFYHPfx1+PUh/ILcGqWTtbWhNftRFc
	6yUowukfCRkAX7ibBYY63LuiBtUTyr+MzYoB9eQEKEaXh6KK2EIcrZdDhVaoFNvV8TU=
X-Gm-Gg: ASbGncumhnofl+OeKnLFlTkDhUfSfOu/vz+ofDy4K66+1yDEtOQ+wVcuwvSkU3ks6WP
	fbnfYA74ew22/SLdgTccAOVBCW9ncLcT49CNEhYSasFFxCZ6A0m2PPfA+J6nuTppcXWzlwAtBug
	PafVT5133agfZEE85UePPJNsI/QKMNT442s8UGXEb3bgte5LeK7JWj6pGTYiOy8na6OmfgRavGh
	CbLNc3EDSz75xkZ9AMXJPC1jdV8jvvzI6C2/tbuKJoT1Dz8dFwvfQTUXJ300+EHmrblXu8KTnS+
	P9Giu2Q8sdu9d2vJx3XjGoM9Qn4Bfju9viSkM9gYMl2/P9Rc4D9RZGtbzgmV30Iu65MS
X-Google-Smtp-Source: AGHT+IEe0+QxHUH3lQ2uYaYi9vgxze6Sq1IneFmRKgL0IxDHY9UDkF9+kDTqonNSeqj2Uz7UzM76SQ==
X-Received: by 2002:a05:6000:2086:b0:3a4:eb46:7258 with SMTP id ffacd0b85a97d-3b496617d36mr3681711f8f.15.1751892640390;
        Mon, 07 Jul 2025 05:50:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:df6:4ed7:c6e7:1ee1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285bdf8sm9939855f8f.87.2025.07.07.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 05:50:40 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 07 Jul 2025 14:50:39 +0200
Message-Id: <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
Subject: [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, <masahiroy@kernel.org>,
 <nathan@kernel.org>, <nicolas.schier@linux.dev>, <dennis@kernel.org>,
 <tj@kernel.org>, <cl@gentwo.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <andybnac@gmail.com>, <bjorn@rivosinc.com>, <cyrilbur@tenstorrent.com>,
 <rostedt@goodmis.org>, <puranjay@kernel.org>, <ben.dooks@codethink.co.uk>,
 <zhangchunyan@iscas.ac.cn>, <ruanjinjie@huawei.com>, <jszhang@kernel.org>,
 <charlie@rivosinc.com>, <cleger@rivosinc.com>, <antonb@tenstorrent.com>,
 <ajones@ventanamicro.com>, <debug@rivosinc.com>, <haibo1.xu@intel.com>,
 <samuel.holland@sifive.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250704084500.62688-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_055042_807592_1336A2BB 
X-CRM114-Status: GOOD (  20.38  )
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

2025-07-04T16:45:00+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> The following data was collected from tests conducted on the
> Spacemit(R) X60 using the fixed register method:
> [...]
> The fixed register method reduced performance by 5.29%.
> The per-CPU offset optimization improved performance by 2.52%.

What is the performance if you use the scratch register?

The patch below is completely unoptimized as I didn't want to shuffle
code around too much, but it could give a rough idea.

Thanks.

---8<---
The scratch register currently denotes the mode before exception, but we
can just use two different exception entry points to provide the same
information, which frees the scratch register for the percpu offset.

The user/kernel entry paths need more through rewrite, because they are
terribly wasteful right now.
---
Applies on top of d7b8f8e20813f0179d8ef519541a3527e7661d3a (v6.16-rc5)

 arch/riscv/include/asm/percpu.h | 13 ++++++++++
 arch/riscv/kernel/entry.S       | 46 ++++++++++++++++++++-------------
 arch/riscv/kernel/head.S        |  7 +----
 arch/riscv/kernel/smpboot.c     |  7 +++++
 arch/riscv/kernel/stacktrace.c  |  4 +--
 5 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 000000000000..2c838514e3ea
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,13 @@
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+static inline void set_my_cpu_offset(unsigned long off)
+{
+	csr_write(CSR_SCRATCH, off);
+}
+
+#define __my_cpu_offset csr_read(CSR_SCRATCH)
+
+#include <asm-generic/percpu.h>
+
+#endif
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 75656afa2d6b..e48c553d6779 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -91,18 +91,8 @@
 	REG_L	a0, TASK_TI_A0(tp)
 .endm
 
-
-SYM_CODE_START(handle_exception)
-	/*
-	 * If coming from userspace, preserve the user thread pointer and load
-	 * the kernel thread pointer.  If we came from the kernel, the scratch
-	 * register will contain 0, and we should continue on the current TP.
-	 */
-	csrrw tp, CSR_SCRATCH, tp
-	bnez tp, .Lsave_context
-
-.Lrestore_kernel_tpsp:
-	csrr tp, CSR_SCRATCH
+SYM_CODE_START(handle_kernel_exception)
+	csrw CSR_SCRATCH, tp
 
 #ifdef CONFIG_64BIT
 	/*
@@ -126,8 +116,22 @@ SYM_CODE_START(handle_exception)
 	bnez sp, handle_kernel_stack_overflow
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
 #endif
+	j handle_exception
+ASM_NOKPROBE(handle_kernel_exception)
+SYM_CODE_END(handle_kernel_exception)
 
-.Lsave_context:
+SYM_CODE_START(handle_user_exception)
+	/*
+	 * If coming from userspace, preserve the user thread pointer and load
+	 * the kernel thread pointer.
+	 */
+	csrrw tp, CSR_SCRATCH, tp
+	j handle_exception
+
+SYM_CODE_END(handle_user_exception)
+ASM_NOKPROBE(handle_user_exception)
+
+SYM_CODE_START_NOALIGN(handle_exception)
 	REG_S sp, TASK_TI_USER_SP(tp)
 	REG_L sp, TASK_TI_KERNEL_SP(tp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
@@ -158,11 +162,15 @@ SYM_CODE_START(handle_exception)
 	REG_S s4, PT_CAUSE(sp)
 	REG_S s5, PT_TP(sp)
 
-	/*
-	 * Set the scratch register to 0, so that if a recursive exception
-	 * occurs, the exception vector knows it came from the kernel
-	 */
-	csrw CSR_SCRATCH, x0
+	REG_L s0, TASK_TI_CPU(tp)
+	slli s0, s0, 3
+	la s1, __per_cpu_offset
+	add s1, s1, s0
+	REG_L s1, 0(s1)
+
+	csrw CSR_SCRATCH, s1
+	la s1, handle_kernel_exception
+	csrw CSR_TVEC, s1
 
 	/* Load the global pointer */
 	load_global_pointer
@@ -236,6 +244,8 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 * structures again.
 	 */
 	csrw CSR_SCRATCH, tp
+	la a0, handle_user_exception
+	csrw CSR_TVEC, a0
 1:
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 	move a0, sp
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..d8858334af2d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -188,14 +188,9 @@ secondary_start_sbi:
 .align 2
 .Lsetup_trap_vector:
 	/* Set trap vector to exception handler */
-	la a0, handle_exception
+	la a0, handle_kernel_exception
 	csrw CSR_TVEC, a0
 
-	/*
-	 * Set sup0 scratch register to 0, indicating to exception vector that
-	 * we are presently executing in kernel.
-	 */
-	csrw CSR_SCRATCH, zero
 	ret
 
 SYM_CODE_END(_start)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 601a321e0f17..2db44b10bedb 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -41,6 +41,11 @@
 
 static DECLARE_COMPLETION(cpu_running);
 
+void __init smp_prepare_boot_cpu(void)
+{
+	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
+}
+
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	int cpuid;
@@ -225,6 +230,8 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+	set_my_cpu_offset(per_cpu_offset(curr_cpuid));
+
 	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
 
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 3fe9e6edef8f..69b2f390a2d4 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,7 +16,7 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
-extern asmlinkage void handle_exception(void);
+extern asmlinkage void handle_kernel_exception(void);
 extern unsigned long ret_from_exception_end;
 
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
@@ -72,7 +72,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			fp = frame->fp;
 			pc = ftrace_graph_ret_addr(current, &graph_idx, frame->ra,
 						   &frame->ra);
-			if (pc >= (unsigned long)handle_exception &&
+			if (pc >= (unsigned long)handle_kernel_exception &&
 			    pc < (unsigned long)&ret_from_exception_end) {
 				if (unlikely(!fn(arg, pc)))
 					break;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
