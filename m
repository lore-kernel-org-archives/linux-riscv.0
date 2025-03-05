Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6727BC28B22
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K574FHPasfcBoR7F0SLDoTWHHesWTUHmk6Tjlypguyo=; b=3+nI1lytNKLozg
	rM8ei5SPwPPjo939YNU2Hb3TqFPXpFGkshUv/6Su5EggGgxjXOwweCQ1rm9fC7Jh9hKCA5qGl5TSL
	inWflkeMbQ/nl6sYMdWYG+5oOconpW1tZtWcURfCmYHNXQj8WUGN8D2pIoq9ZClQG0evk+zRIyv6J
	1NFuwOnUTq2+qsWZ6hpR9sI17KF1YBtLzB6vXm+hH/LtaW56TMsFLpi6wV4VLIEMTCybfbHxyRrIf
	ROSTGbTHvkdpAJkTE8AiJiXTyXbtzZE5gU5rh/P5g0hsTiLhH+rJRRCanwxfnKAELRVWVLpie78UL
	FMTh0+JDMegBWmCC0cRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjP-00000009YRu-1a0c;
	Wed, 05 Mar 2025 23:00:51 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjL-00000009YOz-31Gv
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 23:00:49 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2feb9076cdcso182885a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 15:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741215647; x=1741820447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=E5+a70lQCIW2jZs91kR0C2EJ+V0leYJ5xDspMhm4duhA233b/p+8KRYcYkU2Gpa6AC
         i0CPDz1R7Puz9GdJSRDbEruOtWNWo0SNg4rzTBZ9ZiWr78Ja0PO+0rtDNhNYv3bmwlNy
         METh+6NuYTfE5VcyXGoFmOegUK86om4PMsAzhbwxhPl7d2vvsyQHt5rT8GAaJt1QHFxC
         ts46aUBzy/3oxwVS5Kv9oJw07BImI5Hw5Zx7vhA6MlN0VNpKWHP9g2plDBSoob5HE57s
         7MRFUAibjUIFUOERo7ZUfsENiO7M6MP6YCoyhQyN+R6s6d6A36ZgbQLRva6J9ma6aKbz
         TGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215647; x=1741820447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=nUTzMua/nQdB7RvFemOdZTvTtaNT3d8e0qP9eeB845JQj51THJzOlhQaP9dMKc734M
         n2SATwl2XKxuyNbDTvfU1Ky57MwKtqiMd/U2BtOsiGi7KUzutEMKsZTUl0VfaNTQxn3p
         sr609rA7WCIs7M3kTWt9a29jDMM5EBgmEtm2xO4OOin/HzNM8qb7wga5mxHwKlRQ7tkE
         6rXyqgaITPFfN8FkK1EQhkumkJ0vDByjQ6d4L9PpIvdsjX6e6gwFw21m0uvKLK/wFxsJ
         Hsu/Tua9qpZM+w12Gah7wdWq62RVdPHgCUEKHpmj699ggCRDCqBaYhp1uLphEXLdERoC
         QRDQ==
X-Gm-Message-State: AOJu0Yws9TROOryV4aTsleO+ts8VC17gPxUISHbOjUcIWC0lGMmgb/Li
	fi1RZUzn4AqQdVgtgG7bXqhk5XBQ96jLOk5gzBmUpJiKK5xYxn4SGRK8eV+HzVA=
X-Gm-Gg: ASbGncv4cfW2Jx74Zt5XkV8xUijWv5dqvW2NEVL0thE3tPS16DPD8omG4Z2ngawzUVR
	OveTNWZG+y4vKqHjTu6AJKEnBTlBFGT6fuwyCZbryGED3+ll0/hQ6Jzem8UNl49+T6GH+qJI/aC
	EiTYL56hW40WHjsxyjFVym+8tWL6bI/la28t9/1YOwmY68Mv63VYPvzxoNdbvXBt3zgTylXmoi8
	hx3QAgcemhx9FU2gje6RQI8bFf9oImcw+iCWuVgzA4wYj+7iSXM6fQD7Kvr3FzCiNh/xsvwqNtT
	jWpzYppRgi/FBERNdmoPnPdEgTXg73QY8Ug5hFj4XXKaHk9Ama+Pj9PjlW8n
X-Google-Smtp-Source: AGHT+IFUZM1PszfzAWoVVShusmLCiU/XuuDYOST/feYMAaw+rilPbChpa9JEeP9Mv/q3NY/4Zidi4A==
X-Received: by 2002:a05:6a20:3943:b0:1f3:44de:619a with SMTP id adf61e73a8af0-1f349578ac5mr8989026637.38.1741215646383;
        Wed, 05 Mar 2025 15:00:46 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm10593413a12.63.2025.03.05.15.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:00:45 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 15:00:27 -0800
Subject: [PATCH RESEND v4 3/4] LoongArch: entry: Migrate ret_from_fork() to
 C
MIME-Version: 1.0
Message-Id: <20250305-riscv_optimize_entry-v4-3-0d81bb45203f@rivosinc.com>
References: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
In-Reply-To: <20250305-riscv_optimize_entry-v4-0-0d81bb45203f@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ji6jPR39ZKDby+guv8CCAiBLyKbpGz9Kynms9BH9fJU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ69OPR8VFSwqH/4n0qgkyLi8SFnQ42Jfdc2SHSFLjz
 MsHOPk6SlkYxLgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmMjc0wz/83n5w+0nHOfqudOq
 JzDnWcAb3oh9LXz3atJrmG/N6LBTZvineiBVcx/PRKVNumtfMlim7Kl5tPpZe8/V6Yqv+aaoXbN
 lBAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_150047_802425_979B7BB8 
X-CRM114-Status: GOOD (  10.85  )
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

LoongArch is the only architecture that calls
syscall_exit_to_user_mode() from asm. Move the call into C so that this
function can be inlined across all architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++++
 arch/loongarch/kernel/entry.S               | 22 +++++++++----------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++++++++++------
 3 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/include/asm/asm-prototypes.h
index 51f224bcfc654228ae423e9a066b25b35102a5b9..704066b4f7368be15be960fadbcd6c2574bbf6c0 100644
--- a/arch/loongarch/include/asm/asm-prototypes.h
+++ b/arch/loongarch/include/asm/asm-prototypes.h
@@ -12,3 +12,11 @@ __int128_t __ashlti3(__int128_t a, int b);
 __int128_t __ashrti3(__int128_t a, int b);
 __int128_t __lshrti3(__int128_t a, int b);
 #endif
+
+asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+							   struct pt_regs *regs);
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg);
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
index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..98bc60d7c550fcc0225e8452f81a7d6cd7888015 100644
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
@@ -33,6 +34,7 @@
 #include <linux/prctl.h>
 #include <linux/nmi.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/asm.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
@@ -47,6 +49,7 @@
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
+#include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
 
@@ -63,8 +66,9 @@ EXPORT_SYMBOL(__stack_chk_guard);
 unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
 
-asmlinkage void ret_from_fork(void);
-asmlinkage void ret_from_kernel_thread(void);
+asmlinkage void restore_and_ret(void);
+asmlinkage void ret_from_fork_asm(void);
+asmlinkage void ret_from_kernel_thread_asm(void);
 
 void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
 {
@@ -138,6 +142,23 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+							   struct pt_regs *regs)
+{
+	schedule_tail(prev);
+	syscall_exit_to_user_mode(regs);
+}
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg)
+{
+	schedule_tail(prev);
+	fn(fn_arg);
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
@@ -165,8 +186,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
@@ -182,8 +203,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
