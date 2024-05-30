Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AACC25B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHaHZEbfz0rpLLQFswOXnAdvkYWJqSbbOCkLzOGn55Y=; b=HJiDkXN8kmOqRC
	u6R++POWOYBx0qM/+Gd3fkRxWv/TBGZ0Ppgh9Q9jtqCOLCjW/7OhtpsIQ7CF/qXzKUpbRKGidNp9J
	r/kp3lzCA6K/A6r/jh72kIOVa/kfiljKShhEI2ABJwQi4nQxwfNApO8SxSmDzK8VLSDJX6nVHRtpo
	DyxlI6VmFw3mXxELwBHekUZyAvR7d1qaZuGWPR5DGgemdLlT2Kq5NECLd+2Km59/s/F59+vHkVu5W
	7ZS3evrHgUyZQZBzcQysyC/xshgNMaI8LVY9JUZm2k5mJwudPpyNscKsXLXLsjeipmXoWEXxbOIeS
	WZKoNUGhzAP4Rm7cnC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTUH-00000005s2f-0Vko;
	Thu, 30 May 2024 00:17:45 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTUC-00000005s0o-0GIm
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 00:17:41 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-6818eea9c3aso237010a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 17:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717028259; x=1717633059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VORirj/p8laQYqtwQSljZN4IPQTPn3tED4t61Nbfhh4=;
        b=ktC90tQ0LSVijIDQz+7T2GR96lYf3wOMPvlfS8Al+iQu2q05gffkMmTNJsE82xitEs
         JfrrjPD1Hc9Rwhb7ExVnmEMEWCbT79NZNARYEoXmDKCv6u23wA6Vs1SAushViOGb3dXx
         GhCk2LPXJxiXaxWGNBTEQLsqiN/JKWkuvAxz/fwIVT4TaYXf5tbb9HPbCElc4KcTaQ8S
         MZ19UEQ/8shkbqI0iqsX7bfWQT7UVcvle3o8rzktODCAgO+6QgEOuPLXipPqNjn1yYva
         2dnYdIXLgISDte5ZfRG5jhZ3C5ZMcQ8HiC9CpfVPVkMJ1ys2FZGs9dZSWd7lNl91S8EQ
         KnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717028259; x=1717633059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VORirj/p8laQYqtwQSljZN4IPQTPn3tED4t61Nbfhh4=;
        b=l/gY4Zv1WxMW9x/7b4URZ3Pa/a+B7O+5KhYrfw8UhHxjzfslOcH7Si3v/GX5JlE83L
         HHKgrkuN1TZr3tP2XcSi3njZaT69JqOO2pYpsb/V5WnqJnhSk17admUGzD9lJoSG63XA
         WXprYVJ2qU70u+f4xWt1cLT1WNxcHW7EQlrOOfbwlWFeTETZxlY6m6AuTvG+c/J+pfow
         DLyaMwf5r5dmPKEkSrFZ9KTwMb0HGtDmSX1LYpcSARX5VvJqPg7MoA0MZjA4S//d1yJK
         7MkLC9c4UIOF46+8EZ+FvczpCoGhKT443jqYTNp1BQr2uwGlktFokAEmKXEU2JutFVt+
         e6RA==
X-Forwarded-Encrypted: i=1; AJvYcCVaYO6UVL+NwfTC+BmTo3zv9rgHnQV9k3Ycz/Fd8x+kwHJN1cbmxTxR6UKSo2Nod0R4rj2XplADg354URjWMrL8qJ5RI5XRVyb2LC2IVZmT
X-Gm-Message-State: AOJu0YzPaSRWMsUmetXceqVF+Xk30OJx4kYDftx95cPY6r8QlnTGjqTh
	VfvznAEp6F3mDfcDBWIQAKS3OWdqPpsEsfgbf8HKCfzTru5urzLE6qD0CuTK7u4=
X-Google-Smtp-Source: AGHT+IFSmHA6v4nmJKFL/xqyz99p7ZxJlwInOFAA+iOduDMGY/Lg03JJ5ApeduhAHcnmMFHvH2XKWw==
X-Received: by 2002:a17:90a:65c1:b0:2bf:cf2d:67db with SMTP id 98e67ed59e1d1-2c1abc4317cmr647425a91.39.1717028258789;
        Wed, 29 May 2024 17:17:38 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a776e206sm432171a91.20.2024.05.29.17.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:17:38 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/4] riscv: entry: Do not clobber the frame pointer
Date: Wed, 29 May 2024 17:15:58 -0700
Message-ID: <20240530001733.1407654-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240530001733.1407654-1-samuel.holland@sifive.com>
References: <20240530001733.1407654-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_171740_131177_47E0D567 
X-CRM114-Status: GOOD (  15.46  )
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

s0 is reserved for the frame pointer, so it should not be used as a
temporary register. Clobbering the frame pointer breaks stack traces.

- In handle_exception() and ret_from_exception(), use a2 for the saved
  stack pointer. a2 is chosen because r2 is the stack pointer register.
- In ret_from_exception(), use s1 for the saved status CSR value. Avoid
  clobbering s1 in the privilege mode check so it does not need to be
  reloaded later in the function.
- Use s1 and s2 in ret_from_fork() instead of s0 and s1. The entire
  p->thread.s array is zeroed at the beginning of copy_thread(), so the
  registers do not need to be zeroed separately for kernel threads.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/entry.S   | 29 ++++++++++++++---------------
 arch/riscv/kernel/process.c |  5 ++---
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d13d1aad7649..bd1c5621df45 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -58,13 +58,13 @@ SYM_CODE_START(handle_exception)
 	 */
 	li t0, SR_SUM | SR_FS_VS
 
-	REG_L s0, TASK_TI_USER_SP(tp)
+	REG_L a2, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
 	csrr s5, CSR_SCRATCH
-	REG_S s0, PT_SP(sp)
+	REG_S a2, PT_SP(sp)
 	REG_S s1, PT_STATUS(sp)
 	REG_S s2, PT_EPC(sp)
 	REG_S s3, PT_BADADDR(sp)
@@ -125,19 +125,19 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	call riscv_v_context_nesting_end
 #endif
 
-	REG_L s0, PT_STATUS(sp)
+	REG_L s1, PT_STATUS(sp)
 #ifdef CONFIG_RISCV_M_MODE
 	/* the MPP value is too large to be used as an immediate arg for addi */
 	li t0, SR_MPP
-	and s0, s0, t0
+	and t0, s1, t0
 #else
-	andi s0, s0, SR_SPP
+	andi t0, s1, SR_SPP
 #endif
-	bnez s0, 1f
+	bnez t0, 1f
 
 	/* Save unwound kernel stack pointer in thread_info */
-	addi s0, sp, PT_SIZE_ON_STACK
-	REG_S s0, TASK_TI_KERNEL_SP(tp)
+	addi t0, sp, PT_SIZE_ON_STACK
+	REG_S t0, TASK_TI_KERNEL_SP(tp)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
@@ -148,7 +148,6 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 */
 	csrw CSR_SCRATCH, tp
 1:
-	REG_L a0, PT_STATUS(sp)
 	/*
 	 * The current load reservation is effectively part of the processor's
 	 * state, in the sense that load reservations cannot be shared between
@@ -169,7 +168,7 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	REG_L  a2, PT_EPC(sp)
 	REG_SC x0, a2, PT_EPC(sp)
 
-	csrw CSR_STATUS, a0
+	csrw CSR_STATUS, s1
 	csrw CSR_EPC, a2
 
 	REG_L x1,  PT_RA(sp)
@@ -207,13 +206,13 @@ SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
 	REG_S x5,  PT_T0(sp)
 	save_from_x6_to_x31
 
-	REG_L s0, TASK_TI_KERNEL_SP(tp)
+	REG_L a2, TASK_TI_KERNEL_SP(tp)
 	csrr s1, CSR_STATUS
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
 	csrr s4, CSR_CAUSE
 	csrr s5, CSR_SCRATCH
-	REG_S s0, PT_SP(sp)
+	REG_S a2, PT_SP(sp)
 	REG_S s1, PT_STATUS(sp)
 	REG_S s2, PT_EPC(sp)
 	REG_S s3, PT_BADADDR(sp)
@@ -227,10 +226,10 @@ ASM_NOKPROBE(handle_kernel_stack_overflow)
 
 SYM_CODE_START(ret_from_fork)
 	call schedule_tail
-	beqz s0, 1f	/* not from kernel thread */
+	beqz s1, 1f	/* not from kernel thread */
 	/* Call fn(arg) */
-	move a0, s1
-	jalr s0
+	move a0, s2
+	jalr s1
 1:
 	move a0, sp /* pt_regs */
 	la ra, ret_from_exception
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e4bc61c4e58a..5512c31e1256 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -208,8 +208,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
 
-		p->thread.s[0] = (unsigned long)args->fn;
-		p->thread.s[1] = (unsigned long)args->fn_arg;
+		p->thread.s[1] = (unsigned long)args->fn;
+		p->thread.s[2] = (unsigned long)args->fn_arg;
 	} else {
 		*childregs = *(current_pt_regs());
 		/* Turn off status.VS */
@@ -219,7 +219,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
-		p->thread.s[0] = 0;
 	}
 	p->thread.riscv_v_flags = 0;
 	if (has_vector())
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
