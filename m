Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2B5C0218B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 19:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XHq+BuNa3GccVeAiiwQ422dZkvZ4rZ2rnunMHYhRB28=; b=2rlHGbb0xY7g3+
	iOHhOoGf1k9a98E5pp89nbYcPA6ZubGDZcU7o2cpSuliIcPa4qbXBQukIHiebdA+uSZeguAIwo1Sn
	aKYhZ64+tsjfyHFarJ7hKwR+81rjsobbugnVzZ7eSzkIagN9G4VE1GTZGMVA08ljFRDFG2KUxCn7V
	H+vaCMXT1jhVhWMgTmc97BBQwXrOE6ewJeQNvFec2eWYIyzLLlrJ+s1BDTkr9YrjUDldW4xDeH/Ns
	z/gDyHz3meP9hmFkYFaVU+YzIhHUOnaahDmiCBlyW4SeZuJq1G5ZxXERMOThsKQqZ3gTb1RywX2aK
	u2xVd1Wy71GCzqNUPPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fn-0000000D6gX-1NiL;
	Thu, 23 Jan 2025 19:15:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fi-0000000D6dH-3Y41
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 19:15:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21675fd60feso28806935ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 11:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659722; x=1738264522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sSJeNFuPfWReO9OO5qkQ/VIRfyi9C57dHefTNmMMUo=;
        b=RLqSNp0n/+wm7YzZ0ZS759D8oDiadgfLGO2RwAQrhyt4cxh6PPToyA21wCIzkVmxMY
         GqIHLvjk9xQ6n3mjGcHTNB19SHPymkgOiSg79Q/7iWQG/HZxjAGHJWndSQEUYIt5blOU
         pYMKG2jAh/GZnPCOMcxo0B4UYIIB566I9o1gweIUwVHBjxsOKraKyc2iN/F9k73654SM
         Ipg/28CFLvjbwdL3Q5l9TTmw7F6qph1Q7qY34RUTIHYL9Rjt3cnKgZZETsH3kRLVlSeY
         gho3iZrbEZ064NGr/7rkvLPS8az0UmH5cXVFeuL/KFtec0vur041oaZxyiyg7DoFHRzJ
         UGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659722; x=1738264522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sSJeNFuPfWReO9OO5qkQ/VIRfyi9C57dHefTNmMMUo=;
        b=KiFLq0Huk9a4o1SilJttiROJavNPmoGYIg3XDqnanu6L6oIQcisOa1oPAm1fYTPxRQ
         /f8mh+SM7v1t2gOQrYYQVpKz+6hC3xt+Ltxkf75L/QqD6j9cbOqr//wqW/1qTV9DpnA+
         X/U/X9ieBQwUtGyXQCWoMYUH13bJ/NLosGCTI3IHmklfRlHsgmZHGswmAbe32+1NdUcZ
         fgeG427GGONPQx9bjAe+OzrVvw7bY96uLBB9KpMaehWggorp2UTI4TNIU1Ryh0ZGS6NT
         zQgpvmWIhbNIwPnJQQeMTNvQb/0O1EnqSB9dxbNDn8qkfMMgNo1HR1e2zJPoHwot5Qe1
         CKuQ==
X-Gm-Message-State: AOJu0YxAjdA2a5BAwR3xtAffIPKduy4mwK526zXEJgFP9JvDqqGOwBBf
	W9WMoGca7HMny32Z80vX0wkNNvhHxFFWghaPSehxEtvU0yaZ4EqF7yxESnPcXDY=
X-Gm-Gg: ASbGncto4w/VrRhDiqche/ooDlNan908fHgtdGWke7WNA8IygNrXeWmWQHLq7/5DGrg
	otKUNyOXcGMxsf2kxzyKKJ1vj1pO53PZmViajwQBgZ9TUDMWzpY7EiK5KaI23ylNseHZ6rZ2P0o
	xsPOtaUyMj5HBMYItkZA7WagA+Kkh7V8v2ualePOs8EhIj4sLAPU0bSlfG3Htm4FGopngFwzpUY
	0XTvXoHROZfuKSTuHj66wlyM31HqsKo6SHfs/sVeRItW76Qj93OxxwbWh5Btxy0+xZzg6I8IV2p
	1ZAYHzOy0oLrNXAKDqqt+D2FaaczvV4=
X-Google-Smtp-Source: AGHT+IGwkaQcjsRA0ckQ8hfF7rhnrA97lBFPxRTb5ooMPcRBrFUbh16WviAiYS7cf8KITGLjKjwLug==
X-Received: by 2002:a17:902:ec84:b0:215:3661:747e with SMTP id d9443c01a7336-21c353ef81cmr312691415ad.8.1737659722130;
        Thu, 23 Jan 2025 11:15:22 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:21 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 23 Jan 2025 11:14:31 -0800
Subject: [PATCH v2 3/4] loongarch: entry: Migrate ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250123-riscv_optimize_entry-v2-3-7c259492d508@rivosinc.com>
References: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
In-Reply-To: <20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6370; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=sOZDk0mqs9t7JThCawDCQVAf1T6D7VObAlzqPEnCu8U=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqU42lptFm4tfHG0Q3FL45mrn9VMsDcqfnhfev3Prn
 tzX2o/fOkpZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjIqi5Ghv9sVntVJ8m2P4id
 v3NlbdrVdMcZBxd6sWzOn7uOw19Rdh0jw6Pru85siL8aUHVBPqzbXHn2bCe2E1Lbq09amBWv2m2
 8ggkA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_111522_884829_65F35166 
X-CRM114-Status: GOOD (  12.05  )
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
 arch/loongarch/include/asm/asm-prototypes.h |  5 +++++
 arch/loongarch/include/asm/switch_to.h      |  8 +++++++
 arch/loongarch/kernel/entry.S               | 22 +++++++++----------
 arch/loongarch/kernel/process.c             | 34 ++++++++++++++++++++++++-----
 4 files changed, 51 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/include/asm/asm-prototypes.h
index 51f224bcfc654228ae423e9a066b25b35102a5b9..0195d4309fd29f94664d5f34247198c769033b1b 100644
--- a/arch/loongarch/include/asm/asm-prototypes.h
+++ b/arch/loongarch/include/asm/asm-prototypes.h
@@ -12,3 +12,8 @@ __int128_t __ashlti3(__int128_t a, int b);
 __int128_t __ashrti3(__int128_t a, int b);
 __int128_t __lshrti3(__int128_t a, int b);
 #endif
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg);
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
index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..16cc949fe43443d70f1d865ce04595c2d8c1615b 100644
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
@@ -138,6 +142,24 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg)
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
@@ -165,8 +187,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
@@ -182,8 +204,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
