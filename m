Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DB3C0218C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jb7e7+a60GG3tcgpyR1Leiq2fUe+Pu5bw8wD+cUMlNI=; b=t8thatMrs1Ec+D
	zFsdk8NfjI5Ix+zPIrk6qncdE3oKbSwVCado85QWLWGjoxdA0wKDAfj5yroMptLPMWDGs02iuEuTt
	nEljvb0y73EkXRbgo/Xnq5O88DvSTsS+eWhnlz/jmrImcSmFojS5rIbT/l7kFEEWAzDhbfbeJS0nT
	M5GTYdrMnJoXanepfey10AR84V4+3vowWY3G9F8ONJkj/qVbn4BHd+N/wJMBIhk/lQjv4qVxibPqT
	0TZNKMdeS+c/dT/s68eQ5WBNmrygw1jD94dIzglrjdVSQONiYuXxyyw2lg1wZ4bPe1+jTlmGjl+/X
	y8ilKscD6TBimY/4pfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSDh-0000000Fctx-3AHq;
	Fri, 24 Jan 2025 22:32:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSD2-0000000Fcgc-2cb4
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 22:31:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2166f1e589cso66689255ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 14:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757888; x=1738362688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=i33xVxIuN4X5v4X6egND/s85bGrty13IFV1z2mLaU4jqFKvm8GgPyvwgOPoFOGl8a4
         XdQcW6OQszQAXvWlshQvnAuPdtGgBn2B4pifMiOdW3TmYFEvV5xJ4eQzIV17TNw5ogWs
         jo/Gpx48bZgSWh6uVKyiTaZZu9pqer8DIj/1b68fnHQfMKQw4wK8yau4oeGGOErwyfuP
         yOCDlidOhpoIDvCQjl5f3Bn8jWrJ7OU4q81EVZ9PIY389CvSXeHS1hMGmVlLW1qstU6Y
         UcdQBiWdlfLugyqT/7XQGqXoLgLLY4/3/4rblDcVWLYpw5/aH4kvB2fPcok3I5bVKTzS
         06lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757888; x=1738362688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=egiXZbu+qQaLBPLl3nxW097j63Tx5YvFsIxuWt/CeHxXeztZl4AGP8uKR4amzeD7j2
         hKPUq2SFfVsiizslfvR6yjnMh1qpR/Z/PLPQLQQU55Xgspevr4gG+jOkr8PnpGjTgolb
         wf2p2uZlx/NcKhPB0EAmt1lmtfvtCQ5DcP7bFM2kNCuwnPH1tzto5LCLgfXVlVWRRPvg
         ZWqIuxEqsGXt+V7l+INzdnLO7hVMLUm678rdWMOrUiv+hLQcXHLYT1wLDA2HI98qwj4j
         EoIqSqwxlA7Exiul7/DhF+8qcuxmPvL+EzcQbDxWDOVqifrFM7SdIQy6vnkk3hY/iflR
         G3CQ==
X-Gm-Message-State: AOJu0YzEElV0YlF/bmV90dZzQQZRGqL673qHC4rhLz+guWFlQ9KDGG1J
	RtA4RWhWmEC30M4PUEx1gw5Vp+fvnzXlLU9Qn97MitotCGk4sdTtzQCu3WSBm/o=
X-Gm-Gg: ASbGncsTxaAzZPs6q1l6W6qe0CJvk8aF5SAZ07zfK8A2zNtY/jmHYCh+Dvu1PuOEByn
	wdrzeam8zCbKmlb+k3gWO1mYzXBeu/CAbNRLSIVXNHoBEdRXNj4KE/xiszN0Lj1RlyyIXT6GjWn
	9vFLl1dBqhtVzMMuAhbgoM7wJWDbjTxfp6rFJMdpEZXI2b+HpQ/pzoYdpNDWeGN2CVWhIpA4t9Q
	chD+wiVEewsTA3eBJKCgdg/ncpacRzOmorwzoZsPooW0fuMeQD8lIlfOfplzfEcaneVh9P+7ikV
	/675Aij2OSwlktLLeNki
X-Google-Smtp-Source: AGHT+IE7NbObNQvQSaPZkmeR+n8U2XghXp9qA7/c1qoqbpDzuOOutMqEPF/BOHkTtclCps2IhnplYw==
X-Received: by 2002:a05:6a00:460e:b0:726:54f1:d133 with SMTP id d2e1a72fcca58-72dafa44498mr46196661b3a.12.1737757888123;
        Fri, 24 Jan 2025 14:31:28 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:27 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 24 Jan 2025 14:30:59 -0800
Subject: [PATCH v3 1/4] riscv: entry: Convert ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250124-riscv_optimize_entry-v3-1-869f36b9e43b@rivosinc.com>
References: <20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com>
In-Reply-To: <20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkT07p5vc3pN3zOnkt2t7t13MSjCoa19Xuf7PhTMrZ
 mmaPX4S01HKwiDGxSArpsjCc62BufWOftlR0bIJMHNYmUCGMHBxCsBEPFYx/A8WTt5ryjLVpMH1
 TErO2sWKx6RENDf46fAGP0z2XfrJ+A0jww+e91PXpHawiKp7p8QaGc1fP/81y37mGUU9B1q3fG/
 5zgYA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_143128_667663_81453070 
X-CRM114-Status: GOOD (  11.88  )
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
