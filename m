Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504E1C19F32
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 00:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KajZ0uKaAIPMuWa7eY4fkPNYihYxBhFJpUkxQYy95a8=; b=ZZvpFImEpIkJub
	fRcm+psdD3kPmyhZoJJ/N0Qjv8cVXr/a2zQiRN8LrRHKV6UH2XNo8ax+lHNOqghWWIrUZ8yfnikEo
	GrOfvphSWfa6O1W++jekYSz7wzUqH3dAQGZS0AaFRj8IyDd5nkdoYxE6B7qBjRfXgOmy4Msr4uxH3
	oQZT0fxYTHYctX7RF+GusUrBm5wUwir9Fb5etrpKrKW+1ziVMQN5YrC9r2u73xxt8U8NSVGcaUkcD
	eqSlfD2WpjKOdhiUUcB48XnvPZLLwTKT+DoEQlaJZtk/bpKFyuEIrCLQT9mzMIpEA49WTH1+6RtoV
	c/2xB/G7t+1HKiJFOtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzLP-00000009ihQ-10Tr;
	Thu, 06 Mar 2025 00:44:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzLM-00000009ifN-0Ec6
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 00:44:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223959039f4so847195ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 16:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741221847; x=1741826647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3jS1rl0NyPiPtBrV6gbvaKvWtHD4LTe2LvNMOIdkhU=;
        b=jx5PjJMw4wALg5rwoBKg5rVkmiZqiBT6SCbM8LGwYdrZT7PRffWXcoPqWPIqYESyzb
         twQYoOeYR7WGgntN/fpz/BadKFdr8oNR3EOCvepnQeTDqEvTfa5nDHRGDw9lNIzBGYih
         oVAbD6JyKwf6limkcD+09apgt0xq5fyCJN52KnU/8D4kTu7BDv5tGQ++6xWTBEIuIN+t
         svtIX8pcu2Xs3pC1Z0Ppcy6OD2OZ1hSC58Vr3JB9cDW67pqo/xxTw7PkJc4GOxypH3nQ
         vjdIkPpRkPb1Gt3MMKaGDi8ShKMFhAnMyk71UWB1oM8o+bP0SAk/l+CxSQUMiONXkCK+
         t1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741221847; x=1741826647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3jS1rl0NyPiPtBrV6gbvaKvWtHD4LTe2LvNMOIdkhU=;
        b=DWUxqu68q3beOo1TjIzlto5KynzAt8/+Uu4JxLCiH6dus4RLHvLvbBRa2qaSk/aVdl
         TFiBWUyDEp9Ec9RFmgmTb6+tKG4mNbwu3wKOhsL19tuaR9l3+lix42BFDfLNZtmrf3oS
         EcibEDiM1SCZZDVhkyQr8Ga/FAo9DTgOZtjzBnjJ/PqVkiHV9Dwo93LA0xIeHIkmpg7e
         GwyUL+rsq31zlF2mLlhxBDIs2oAPwAYfAhyQI11k76Rihme0d8kmiqy45cVrTsNy30Ur
         CTSnRuyfXvrTmWQjYI5UzXR1wyGrCY9nn1264aoJIiGVwGIYsaHsmPoDqYcwJuzBcKGF
         RHaw==
X-Gm-Message-State: AOJu0YyNCX0I5Lb653U1kKrfen+XxRBPzT8+qKPd9j/ihUqqV7pG6kTX
	vUDqCqSsM2awaRhMj9sy/xP+Yt9SjvTWg0wK6zSv8xPoJ5h6UY2qBBCCuHPIX8c=
X-Gm-Gg: ASbGncuIEgmhF9NBelNKf87wqqDCZC70H1It/Ci/hDCuxgqwyMxH0ajncAb7z8FZevt
	w/37PguawvJ+nR+zQtKqT8S9VQYhjpjDbOqZ+1g0bvhjuU1NPtx54m5pDN/6SPDZRgXyE98Q2W4
	AGQDYW1XJQftkpZJUJbAJr6sVvsQchsS87p29W4oQHAlIA3clTzrTX1n/Ko3l5xx1FC9zwfc/yi
	lpRiiWjxQttaroFfkQnCdRI4LzomAWf641Pa9p+NjPbzeOApiLpmQDLMJf0Nqy8ISqSWxmhO1fN
	4+fMG1e+qpCyQ1/XTJ/jlgAaCIXUSIsPNhKwrCsCzSonDuVjpFroE5RjbMn9
X-Google-Smtp-Source: AGHT+IF34qhqv3xIO9NNzcZh5fK7vqon1KbTtupxHGRr8Axwn6/+XVCjLb/ogfXTpG9fz+kT+EQwYg==
X-Received: by 2002:a17:902:f606:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-223f9a457a2mr63068485ad.29.1741221847212;
        Wed, 05 Mar 2025 16:44:07 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f7efsm347085ad.132.2025.03.05.16.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:44:06 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 16:43:44 -0800
Subject: [PATCH v5 1/4] riscv: entry: Convert ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250305-riscv_optimize_entry-v5-1-6507b5dff3ce@rivosinc.com>
References: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
In-Reply-To: <20250305-riscv_optimize_entry-v5-0-6507b5dff3ce@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=gaq/v9YuAdYAHAPq6G2li6XLwEhlQb1rcc0R86FQKSc=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ95cmmFbUVL2sO39dKoPRMmj9pzsX2Qs+M8168p73+
 VOJGWfbO0pZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZhI7VFGhsfPeK/yBc58PmH/
 xAU9hi8Wqni+fhxzylBn0evACz3GjdwMv9mKOK8wLMzQEsx4Ob15ef/Hi1oMOlvuvJux01vD0Td
 nMhcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_164408_100106_3E63E7E5 
X-CRM114-Status: GOOD (  11.74  )
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
index 7c244de7718008947075357ea4502d56419d507c..7b0a0bfe29aec896c2bdd8976d855dd390de88d7 100644
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
 	if (has_vector() || has_xtheadvector())
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
