Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB36C02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 22:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=on9nrVbglLH2HzKJ9jYC5VLD4pd0BfXB7/uUpy0s4tI=; b=fExZOUummx7gBw
	+/KirgSrTv/NngDW5U1mQRxDuW5f++AsizAMb8mHSZPAGT2tQkh5Eqy4QTSnlN62wgC8Agx8vQQaX
	wuohu6eySH1NsHjWs1lbRCImuQwBlucupBk9OfCg5s3TXMLYWjxg4yXXoVz31kL3gs0Fo/CAG/NJY
	OyBRgmppuN8TSOn0H2yeBwiuzBcDDeqN/2N9H/ew/vl28OiPgx8ic8ZLvZXO14mobf3b688Ffis8C
	oDm3Aat8QKc7m9OBx7YwHND5YQGtx+bLSLtjyYw+w9D/VbUPyXHQH7x+p6NMOdeQM3vwTxSoa75PN
	cEhwpnQNaIpfyLJqdcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajeg-0000000BMZx-10b1;
	Wed, 22 Jan 2025 22:57:02 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajed-0000000BMXZ-2iQF
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 22:57:00 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so593581a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 14:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586619; x=1738191419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+waL18iX0aaC1P1/K+RB0UPKm0pakylfY2Y6RIkpXQ=;
        b=EF+xJe6E5y7Sj3RpZ9gKRpDQ7yorcXvkwWpMFlELA/+tA7KXwWw0YOSMBZtmSHpNu0
         yl7gqu5dqba4Tjb/F/ac2AIYa55mnDJd0PAPkMaWuj5IEHYGq0zqKXkEU916zPZqDOwj
         UfwEMyjklJL5BnTtqBiw19murzZtG7/D5oHpFCIBWxZmhp9k2nZyq6ZEii4SP0bfdhT8
         7BC4LMcYv3noE0oQpWEFcKJ/mazaJ+0pxBEiwrEqlwcw1t5sIkYjmfM9bk4X5bI7oCZN
         DYbzP0uxr61vNq/cBh4W3+jGxBuBAeNVZsWES+6kumgiwhORHUdTW+EXNlOhJ58P72Fm
         bSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586619; x=1738191419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+waL18iX0aaC1P1/K+RB0UPKm0pakylfY2Y6RIkpXQ=;
        b=c1SmNP6b5bHgImsHT8NxYbFp2Cs2SRSGYYD+DSp4594J0ITgkEiAUe7w4V520NwARI
         3h2rZztzTKQQRbxxJYuITu2wbWa7FkitdpmB+IMQK8LI2mJTgH1Jg53O3zZDps3Q1kBB
         euhtPOnwByW8irYm9TJGwbo8XHkxE9OC56TkrrzM2Ohegx1l3r9odVjtAyrQB/l3aM7M
         j1GWfDSimDjSMP0pqvfgw/vHg77gL2L2n2eWpuzLOe51Rd2zdClAl3FKs1kKKilej6lc
         CvtcqoCHpnwXCbWuLajhWX+30kW1n4r366vC/SgrR1qD5v+YkMw3BoVHFd3YWBZN8ng+
         +ptA==
X-Gm-Message-State: AOJu0Yy6i6Z0Nk1F7jbn0xvb/nvQ5IuOF757pJeqsH/P2Sk/SOa67JsM
	6eHVuD/2K9UUmddt4lBuxEWhhlTkA2GqcrubPCq6IE1ZNEwq3owVN91jJMscgYs=
X-Gm-Gg: ASbGncsmoisCKiFDA3Kf17CnDkl7ETb2nmtZ4bS4acIjnqcAsV5Azbu5NrFHagSU8M8
	bbmpDJWWOgzXJskSXzrQ5uwgBt5MWyZc16mMqIIOKWbYwAoL0vyUffKRzq2CgL4fZ9DVxZ8vLCK
	MC/pT+e/6uoWLrgdV9lJFuv1kVbl16SRqu+ebYhBuBC2K0/1zrxzsrc7lF+Exctco6OEMFpSA41
	wQUT3bathZpQ/I4gadeFwzPG7H/ftMNZ663Q43Y6FM9ngUwK5O3kubARMTeuypZG6Bv0E4DoT8J
	1rKwg6G4ekB83KBYLxvH
X-Google-Smtp-Source: AGHT+IFzzfa8LiTbTT2Dmbp7MvGOIfIV8LIzhJeiC+AzFuWK0lSK5kP59xevBlrCdbe0b52VK1rxLQ==
X-Received: by 2002:a17:90b:2c83:b0:2ee:c918:cd42 with SMTP id 98e67ed59e1d1-2f782d4eea7mr29321427a91.22.1737586619150;
        Wed, 22 Jan 2025 14:56:59 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:58 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 14:56:22 -0800
Subject: [PATCH 3/4] loongarch: entry: Migrate ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250122-riscv_optimize_entry-v1-3-4ee95559cfd0@rivosinc.com>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
In-Reply-To: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5559; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=IfDjpWzOkJ2hu8S0SjhggOry7IIgS+knXj7qp/i1XMU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8i1dL+OOSYp8qL2mJrSGk+0H5+f2Kp+Pe9jq1j479
 X6Zw93yjlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbS58XwP8BkwY7+lm9r70p9
 PBS5f82H6nUbnypMbNbf1X3B77b6BXlGhvWh9sl8e+4IHvqc9LB/msHdqb4Hds7b5PnpRYe+W/a
 WgzwA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_145659_693402_06679931 
X-CRM114-Status: GOOD (  11.93  )
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

Loongarch is the only architecture that calls
syscall_exit_to_user_mode() from asm. Move the call into C so that this
function can be inlined across all architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/loongarch/include/asm/switch_to.h |  8 ++++++++
 arch/loongarch/kernel/entry.S          | 22 ++++++++++-----------
 arch/loongarch/kernel/process.c        | 36 ++++++++++++++++++++++++++++------
 3 files changed, 48 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
index 5b225aff3ba21aa06d0713bc8e73e1b941389630..a1c5576f1fd145670e13038bec6dd390486099ab 100644
--- a/arch/loongarch/include/asm/switch_to.h
+++ b/arch/loongarch/include/asm/switch_to.h
@@ -26,6 +26,14 @@ extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
 			struct task_struct *next, struct thread_info *next_ti,
 			void *sched_ra, void *sched_cfa);
 
+void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+							 struct pt_regs *regs,
+							 int (*fn)(void *),
+							 void *fn_arg);
+
+void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+						struct pt_regs *regs);
+
 /*
  * For newly created kernel threads switch_to() will return to
  * ret_from_kernel_thread, newly created user threads to ret_from_fork.
diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
index 48e7e34e355e83eae8165957ba2eac05a8bf17df..2abc29e573810e000f2fef4646ddca0dbb80eabe 100644
--- a/arch/loongarch/kernel/entry.S
+++ b/arch/loongarch/kernel/entry.S
@@ -77,24 +77,22 @@ SYM_CODE_START(handle_syscall)
 SYM_CODE_END(handle_syscall)
 _ASM_NOKPROBE(handle_syscall)
 
-SYM_CODE_START(ret_from_fork)
+SYM_CODE_START(ret_from_fork_asm)
 	UNWIND_HINT_REGS
-	bl		schedule_tail		# a0 = struct task_struct *prev
-	move		a0, sp
-	bl 		syscall_exit_to_user_mode
+	move		a1, sp
+	bl 		ret_from_fork
 	RESTORE_STATIC
 	RESTORE_SOME
 	RESTORE_SP_AND_RET
-SYM_CODE_END(ret_from_fork)
+SYM_CODE_END(ret_from_fork_asm)
 
-SYM_CODE_START(ret_from_kernel_thread)
+SYM_CODE_START(ret_from_kernel_thread_asm)
 	UNWIND_HINT_REGS
-	bl		schedule_tail		# a0 = struct task_struct *prev
-	move		a0, s1
-	jirl		ra, s0, 0
-	move		a0, sp
-	bl		syscall_exit_to_user_mode
+	move		a1, sp
+	move		a2, s0
+	move		a3, s1
+	bl		ret_from_kernel_thread
 	RESTORE_STATIC
 	RESTORE_SOME
 	RESTORE_SP_AND_RET
-SYM_CODE_END(ret_from_kernel_thread)
+SYM_CODE_END(ret_from_kernel_thread_asm)
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..9bb069ef363fefed1f2115e6572b31c2b76bb414 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
@@ -47,6 +48,7 @@
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
+#include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
 
@@ -63,8 +65,12 @@ EXPORT_SYMBOL(__stack_chk_guard);
 unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
 
-asmlinkage void ret_from_fork(void);
-asmlinkage void ret_from_kernel_thread(void);
+asmlinkage void restore_and_ret(void);
+asmlinkage void ret_from_fork_asm(void);
+void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+							 struct pt_regs *regs,
+							 int (*fn)(void *),
+							 void *fn_arg)
 
 void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
 {
@@ -138,6 +144,24 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+							 struct pt_regs *regs,
+							 int (*fn)(void *),
+							 void *fn_arg)
+{
+	schedule_tail(prev);
+
+	fn(fn_arg);
+
+	syscall_exit_to_user_mode(regs);
+}
+
+void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev, struct pt_regs *regs)
+{
+	schedule_tail(prev);
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
@@ -165,8 +189,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.reg03 = childksp;
 		p->thread.reg23 = (unsigned long)args->fn;
 		p->thread.reg24 = (unsigned long)args->fn_arg;
-		p->thread.reg01 = (unsigned long)ret_from_kernel_thread;
-		p->thread.sched_ra = (unsigned long)ret_from_kernel_thread;
+		p->thread.reg01 = (unsigned long)ret_from_kernel_thread_asm;
+		p->thread.sched_ra = (unsigned long)ret_from_kernel_thread_asm;
 		memset(childregs, 0, sizeof(struct pt_regs));
 		childregs->csr_euen = p->thread.csr_euen;
 		childregs->csr_crmd = p->thread.csr_crmd;
@@ -182,8 +206,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->regs[3] = usp;
 
 	p->thread.reg03 = (unsigned long) childregs;
-	p->thread.reg01 = (unsigned long) ret_from_fork;
-	p->thread.sched_ra = (unsigned long) ret_from_fork;
+	p->thread.reg01 = (unsigned long) ret_from_fork_asm;
+	p->thread.sched_ra = (unsigned long) ret_from_fork_asm;
 
 	/*
 	 * New tasks lose permission to use the fpu. This accelerates context

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
