Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74942C0218C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 19:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YrUj+u1tbMFoOiYKvOcK/ydWhS0sgaQajVURmuXwsI=; b=qgha2c18zLnsbR
	TdBooLQ3fa2lorcj9mbStporFgYmRE5wkZz54ZrhPb5NlE4Zmp7RbDHq96UNHWQbG/3KCc7tt8/PA
	NjsKDsCM6GZjgDPpVmnNSKgO3zhHqJ8qvgGEQxWwfXYCpjiZkzrTY8ykgMHhmMmIAB/DyQkFT2WvF
	9mKhJgJp8SgVwvfmW3tzYRImHMtN5VTy8m2YGg0bBu+KLgrl0S63wXAKIgJ1x/XhlWaUjSwHpNXs5
	pROyjnzM2KsnBLuJFJL/643fVB4aM5mVceIcgB9Qa4cvtOdN7n/TSVi4HyhtLSmemBuZZVOnNY4tb
	bCgHNlD6BefoYHkcTBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fi-0000000D6d4-0IsT;
	Thu, 23 Jan 2025 19:15:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2ff-0000000D6bU-2Je3
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 19:15:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-216401de828so23106525ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 11:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659719; x=1738264519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn/PejcoPFKdcNV/yWi5+0DAQFM+nDQKenDgBFYN3Mk=;
        b=rumdgy8DhxGdlOv8H8rgW0n724xtXFBvrectjRDPNOc4BxpCyq9e50q0jhWf9rAAn/
         EgC5TNBsI2TiL6+xn8ffEI+3VGCcF1hQ4V5iIspVX8rulHbXAMljP5Zl8ZDolqjwMO9p
         LrfnGvcn1w+KkN1Lb06rcH+Nxu+Odg5T1+vvumMSwjFh0M1HKns5WB4we42Sw2BuxbqU
         absRL/tkOE5vo4JaGH6rE/BTAQ8hDIC3X+sSi/UNv8qPKc9MRRuh04zyukmqAekSHEeZ
         eB6AAL+d1yNF2DL2y3L3rM1CHZONoDS4sHrqYJLdAF+V/PA+k44zbuFenj9l1GTSD2sP
         UZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659719; x=1738264519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fn/PejcoPFKdcNV/yWi5+0DAQFM+nDQKenDgBFYN3Mk=;
        b=SvuHIE1wQGb7LkG4ZAyv/wgA/DAOH/KDJzYW9yOS+1aGiL8ixU2SAhlPmwWy4yXaIj
         Sfu/PI3/ohqLuh1r/7AnCBcSpyrJD5PD0Z1BPGBMi4EiJtv5l++/CbUQd1LHycuklTqk
         84XID51deXIT6azbNzFv6lCQtm17Pg7lhf2hgv2yCWLVDr2SfVQ8mZV8SEkjAtLEAaaR
         FgLpXNbmcJu/t8ZCwBMQgOjhBbsAHZerQM9kGV6t9GDVe0UZ3uO7iVDXLWEUfj0/I8V1
         Oke7yJxTOPyKxjZ8FqYBT10IdeuiZC01oOv4fI0cFE+vj4FJnXFPhBZBmgdahcAqnCRB
         aceA==
X-Gm-Message-State: AOJu0YxhMk9IUuyFvIike8l7rvAEBlBkk8+emwSaBZ3rh9dqhkE3yzhU
	qoUo0MAzpCsfyaL4hlE593w3BE4R7KADXhjVLXFm1lROTJmjlieLXyTmFCKR6po=
X-Gm-Gg: ASbGncuINK9v6Fu1FQ1+Q9cBQ/PqN7fj0lQAh3UxO/iPBGScGkG0plJ2r8S27CL9KL1
	Hh1StHKvKiemqXab56Q6aprwohrmaTA6BPv2cBFneaberRGavtm+0Lwpf3xIMg2qtqJu2PTzdhk
	q5WdicWQNgdW7EPrP46RqTEZI/RUlQUZuRKlLO5IBwDxNZAOcwEtaOSOeRKlGhN60VQ1lwji/ts
	q91vQn2c2vEAJTt+q8kNM3dUbzLgsfNgnRfmVe/bjuYlpUDGNIGERHY8hvcuGwHpcJM8abu6zFt
	azoVDBWOq3OIdaOAi1Q1
X-Google-Smtp-Source: AGHT+IG2SXcF4PIOFt5auO85FS9zRjRm6NOHqFx7weXaZpffy9LXIlLj0obu51PQsSDcJNxzGgfzHw==
X-Received: by 2002:a17:902:d4c2:b0:216:7cbf:951f with SMTP id d9443c01a7336-21c3540c3c2mr446009945ad.21.1737659718665;
        Thu, 23 Jan 2025 11:15:18 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:17 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 23 Jan 2025 11:14:29 -0800
Subject: [PATCH v2 1/4] riscv: entry: Convert ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250123-riscv_optimize_entry-v2-1-7c259492d508@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3438; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=rV9JUhm8W3Bx7rnRIzGCq2bwJctlTEtmatZOhNjH0vc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqU4bH1vsaOoXfbtU9PKcyqX8u5nCrfamCxb8XNO84
 3F/rd7ujlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACYyYx7D/7JZL6QSpG+/tn7M
 tHuvVoGx/oP5C9li10eJRKt/98tX+cbwT0VkvX7C6hZ32+LpFww03t1g7uk5G7C/++3uww6euT+
 XcQIA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_111519_614596_446F4A53 
X-CRM114-Status: GOOD (  11.86  )
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
