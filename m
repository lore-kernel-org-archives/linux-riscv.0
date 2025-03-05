Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA25FC19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 23:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jb7e7+a60GG3tcgpyR1Leiq2fUe+Pu5bw8wD+cUMlNI=; b=Zdcq/RPuqYQKHa
	wQFksnFdHGs5C2woFpF+bOMjgdZfDoP5dKJ/6ghkeJTJ65/p8WN23WSwgPlBdC7Gz41mOirIxXPyV
	DwrnJUM61YbFG5Po6JuarJLmCI8d+pGhU1q7rjn+glr+k5extM22RtzTbpRnJnEudwkCJG6C+lx68
	/r3UKbnb7h/AGa2hFxCVMHNxEiw7Ec5AFBMWSMOnLQorLam66IDO41qnTYy7KhykjJjBgNMooGqXI
	dMzj8cVuvTMGKFRdIGmmnMDji4XroVOlJkOaaoFLXVDfZJ8jEk7svETIzIEI6XzGiTCDeth8wCV7M
	U505K2+pZ271sHEoeLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjP-00000009YSE-3xxi;
	Wed, 05 Mar 2025 23:00:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjO-00000009YRA-0YqR
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Mar 2025 23:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=; b=A7G6W3qHptPFikrhr0K7c6+WwP
	8wPl4cPjZluKTTOB2YCUf4JtxuChXci4OqCkkBlj0nzFz/WGN1WoCnnaXLFEnRPbAzBd5cYxtuhI2
	KEBYkCyT5BgwmBgC83hAfjuCOIQqoePBxQ0VkRh5kFEm4jCQ9gcmEz/J1Bugc374jRnP8VmlTkT/O
	8XmwDklM5dYeWAP8iF+Ss4YWcXL1JzEkX/ySidt0Ng31geK8mE95rrjtYkX/sUlKpI0dx87VG8Yx8
	ETVchI2TSSTlb9ss8NuiFRUlQn3gdfqLM0pAiQ+1n7r3d6Tw/hWLaJ4bu+UMhKSbfG/uEA37ZCL+/
	OwYbFnVw==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjK-00000000nIT-2miJ
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 23:00:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ff64550991so124019a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 15:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741215643; x=1741820443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=SvHY74Gb8opowEQ4y1WKy0hn/rBWqrp9ytJyiMFJDSyDcGKEs6Usn5qRqruam2VwNa
         K1O5qolR3H+vahlc2w7GQro+i87AdbgreB0Yo1xWBigENcdcqF8NXIagawqaK3WoQuwc
         88aEPAQzpqdOKQ4VSa6a6FfOcHcCwtfJ6oMU9Q02LOb4SKoX4Lt+Ax64X/QlvHuD6bCK
         s05obBDFuLOVyEwHiY0/puHOkZjg48wFF+ee0iR+VxUQ3pwMvYTUbD8mwabblaoKDSUm
         CXof89lLojxIxkT6gF9KQSQO2sYNbPwdyFc1n5087aTkkpSez/C4rVu0xT55bPQb3Szf
         GyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215643; x=1741820443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=FiB98isGJwSN2Q9bT6DjDvFAZj6859KWKZ1mhywppA68h9JiC/WxpuY1v0VHLPYgPI
         RkFNVNW0yKcjhyK/jaOf9pfE/1Ksc4vKWdbI94pvfdFXU+iTzlwzTTz6MKXd1VewY3KL
         ECiLNtEkqT5eEvZG0VmOg5YG2DBjcJ+yyX3SOonTOHhcjd5Fnf0uSq7DqVbLvje5p1JV
         wXrkP4rK3m2LoMit1pBcyxFiTJnS6pHQJT/710+CGUwoPADlJibOtS6EWF4ne0UMD2Ux
         kTqn1t2gaG38IdxMraYtQY5rcyxE55LAdV1bxzJqrE5LQZe6mBtbM/zUXEnnTpws5Ex6
         xvfg==
X-Gm-Message-State: AOJu0Yz6jeMNO5kQOJ2Sv2XfWGAMNCN6aryubL+9/NmdTqQp7Sk9ifY1
	seN1cfp4L/KNzMyehq4LMV/uw5mVgirKD7AoVkVvN3HgNSMSecOcEln5Cd34BCM=
X-Gm-Gg: ASbGncse9Rnc0hyG9vjlbBZvc3dzCdxw5KUOZs4dkRgwNxs03ejmQcppr2lgwvBb18Q
	uAO60rIcpkhMakGWpgN4qNVd/+oNIFODBtUYwK9BlBVVv8lD+flECXXZxk4NXZq4xg3ONJ9F7pq
	Uo0Rr7cQ+Y0TmTdpFOuEQwiTPFNsWTr4TW+yjnJrlh2EQiNSPW9LVxJpvrKrEq/97VWa2oA9tfk
	EHG12W4Z2qimKYZv/82M+TenmeqfKVmZSLoOfWAaWZay+JuAnY17IrIUPknFX/dA84AkykViFnL
	QEen40glOsl7REIS6NlTM4PQQtdQMuQQRaNI9sn+fPCBCLzx3FA1qiJege+Q
X-Google-Smtp-Source: AGHT+IE0LT3egsCf9Urz66Hr4bJMn+zainSmz8nEsKJAFaaZPyaYH4qzNRLADAIJB2bEWLdIN8btRw==
X-Received: by 2002:a05:6a21:a43:b0:1ee:ce5b:853d with SMTP id adf61e73a8af0-1f349570abcmr8120592637.39.1741215642914;
        Wed, 05 Mar 2025 15:00:42 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm10593413a12.63.2025.03.05.15.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:00:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 15:00:25 -0800
Subject: [PATCH RESEND v4 1/4] riscv: entry: Convert ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250305-riscv_optimize_entry-v4-1-0d81bb45203f@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3493; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=e+QmdYfzdsHe2i47iJnp8obSLIn3fW5B1Uv/wF/582w=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ69PiNd+oeFsds8zszVLMP1HHUte0ZAm/YvjifVG3J
 lz6OkWuo5SFQYyLQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIlc/cfI8Fb52bE/3fqqn9pY
 j5QxTM783rF7xm3Bx3y1eQkHNeZEHmT4p/R6+499UV/jbyb9ubj4WFiuRHdFRXrlg8+RQUHrrX5
 oMAEA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_230046_911291_F99717E7 
X-CRM114-Status: GOOD (  11.89  )
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

Move the main section of ret_from_fork() to C to allow inlining of
syscall_exit_to_user_mode().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/kernel/entry.S               | 15 ++++++---------
 arch/riscv/kernel/process.c             | 14 ++++++++++++--
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index cd627ec289f163a630b73dd03dd52a6b28692997..733ff609778797001006c33bba9e3cc5b1f15387 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -52,6 +52,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
 
+asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
 asmlinkage void do_irq(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..b2dc5e7c7b3a843fa4aa02eba2a911eb3ce31d1f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -319,17 +319,14 @@ SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
 #endif
 
-SYM_CODE_START(ret_from_fork)
+SYM_CODE_START(ret_from_fork_asm)
 	call schedule_tail
-	beqz s0, 1f	/* not from kernel thread */
-	/* Call fn(arg) */
-	move a0, s1
-	jalr s0
-1:
-	move a0, sp /* pt_regs */
-	call syscall_exit_to_user_mode
+	move a0, s1 /* fn_arg */
+	move a1, s0 /* fn */
+	move a2, sp /* pt_regs */
+	call ret_from_fork
 	j ret_from_exception
-SYM_CODE_END(ret_from_fork)
+SYM_CODE_END(ret_from_fork_asm)
 
 #ifdef CONFIG_IRQ_STACKS
 /*
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 58b6482c2bf662bf5224ca50c8e21a68760a6b41..0d07e6d8f6b57beba438dbba5e8c74a014582bee 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -17,7 +17,9 @@
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
 #include <linux/personality.h>
+#include <linux/entry-common.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/unistd.h>
 #include <asm/processor.h>
 #include <asm/csr.h>
@@ -36,7 +38,7 @@ unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
-extern asmlinkage void ret_from_fork(void);
+extern asmlinkage void ret_from_fork_asm(void);
 
 void noinstr arch_cpu_idle(void)
 {
@@ -206,6 +208,14 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+{
+	if (unlikely(fn))
+		fn(fn_arg);
+
+	syscall_exit_to_user_mode(regs);
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
@@ -242,7 +252,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.riscv_v_flags = 0;
 	if (has_vector())
 		riscv_v_thread_alloc(p);
-	p->thread.ra = (unsigned long)ret_from_fork;
+	p->thread.ra = (unsigned long)ret_from_fork_asm;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
