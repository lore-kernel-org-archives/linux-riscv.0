Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7834FC02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 22:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YrUj+u1tbMFoOiYKvOcK/ydWhS0sgaQajVURmuXwsI=; b=IGfHt2MXJ68Ezx
	CT8gGdl7R6qPDKGngxnK5vKq9D9HNxLe9VdpWzQyeDyI6yTiXf0Hv5LIG7swVIqlCLW4K4dON6lZM
	k1lbJGJOPiI0dg3XMqEnxh+7HOA4L184lPwqP3e4WhjQ2yEcwfF1XKty/uQGyjNd/WZ5yHOC7w4v2
	WqquiNTTEjDUlrH+0OQMzmFBb0/IBmQTGVdg9u5yZYbuAawwSKhlWUzGI1SpNR1RwGmxd9h7XOmr/
	LTkSYHmm3qKdTq0gRndE4+FfmxpzdmdDy7kV5Z0FUyEFRDlNYQEvRlVU5ij6TtTLHojupFwygMHmt
	Y7Ckr4iiCX6X/XtSrD2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajed-0000000BMY8-3ucT;
	Wed, 22 Jan 2025 22:56:59 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajea-0000000BMW6-3LNW
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 22:56:57 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so490641a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 14:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586616; x=1738191416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn/PejcoPFKdcNV/yWi5+0DAQFM+nDQKenDgBFYN3Mk=;
        b=iffupWzawZNxJJ+eUBMzbtxwWRIjp8rGKQtMp8q9zBeGyxo5TEoOvivI8L3UCfPMVR
         Rb7UzmwMp8UkR90XnGOaYLqUKWMHAJ3BxnM2vv+nmMEe6oWPdTN2twLLfnzyALS5/rjy
         30jBz0BOblngVpfquq8XcFLkb49Oj5/4D6If5JnsaOWqsTIq5O+GcDaVz0W3c2mb7+cR
         YXmBBw4JYfsFSBcrScsocgw5SgDUJ00PWkL9GriKYFLtG3LpH0k9+M//6CWoO1MYW7+D
         Vfjv0YinsOAT59HaItmx6EE4GvLfnLSdYfLzNKM5kNGc0y75lwDow5TveeWz5QLe1O/V
         Pg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586616; x=1738191416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fn/PejcoPFKdcNV/yWi5+0DAQFM+nDQKenDgBFYN3Mk=;
        b=F6Apq/4dy1GAEH0Ikiqwy/+9/Gn5nX48i0f2pJExcCjjDzaf/KN1DNJs9UR7vNtq/0
         S6jdcZwEpKTA84Fypw5MSXcIenM0ygh6jULN+CGUd+U8149UJ+202v1rQEyNg/ahazSB
         t3cxggU25y51w4dDqEfBp34lPMqXk6L+WOdhv3GfpQ9jLe9VuQvyQI83FUv2rSn7EP/o
         QJMWprLCCPzLy7enOKHgUa6sYy6foXN5oNpphO2LIieqXzZH3+yoqx1/3yOMu2B45NZZ
         d/13yDgfJl4C2BsgJAJ0ln3xS0/Q3au0Mm6MC08yUYRUcBnIE9bv5R6kYvEzKqCBWYqC
         QE/Q==
X-Gm-Message-State: AOJu0YyuvP6saVIhSR91dxBL1n3t9AXaKGgulKg9dZt5J/FU5NCozu+Q
	ChWUTpH8MxSUF3tJQC2HI4f4Wf7J420QA1xGG0lP5ZNm3v5I82Dkdu1BMzZPN1w=
X-Gm-Gg: ASbGnctdGmPmLJLBjwFYfCuzQhLtZ3Z8BJA7wHrUz4CE5uNdpzF0t0x06jEojC5ihVJ
	/C7GykiH6jvSNqhEAZ6TSQZSQTXCoSViNzohJ+wYf4uXQtFZLgtye/4aExrpjwmmfWALTq0NRtN
	YZQZ3v+s9wHhL8LutJupvITCthiNU4oL8Sd9TH0slTxZd5JuT5mCUaQIfEvEWM68GaDQukLtsFz
	gos8+YUHFDZxEd7OBL96y4Yh6cmfEYz7uknncydH0Gem7H2jgtx3WuopT/lKvp8wi1PmFc7gtaY
	dLS05uXm1Q==
X-Google-Smtp-Source: AGHT+IGkOWQer0g/4jCDpWuE1nqdG+SGuwiRfCbniIbIL1sny3WjBA7acx7xqTIHE+P8KLoFagnQAg==
X-Received: by 2002:a17:90b:5249:b0:2ee:e518:c1cb with SMTP id 98e67ed59e1d1-2f782c4bdd2mr36926987a91.7.1737586615920;
        Wed, 22 Jan 2025 14:56:55 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:55 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 14:56:20 -0800
Subject: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3438; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=rV9JUhm8W3Bx7rnRIzGCq2bwJctlTEtmatZOhNjH0vc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8s3MIQ08j0o/nwm++ubjMauZxccEN91XPGF74+yfn
 ewBNxhfdpSyMIhxMciKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjCRU7YMf7izZz+fvbMn6Tjb
 s5lz+eSSgzfZ1B4I++FZYx1kl/riy1xGhpMFnZuYvBcrfshj37l/8YZJ0kmhD5nP2Xm+tzAqnJ4
 XwgsA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_145656_848632_77C45D20 
X-CRM114-Status: GOOD (  12.06  )
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
index 33a5a9f2a0d4e1eeccfb3621b9e518b88e1b0704..9225c322279aa90e737b1d7144db084319cf8103 100644
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
+	move a0, s1 /* fn */
+	move a1, s0 /* fn_arg */
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
