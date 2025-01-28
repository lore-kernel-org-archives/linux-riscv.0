Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7EFC0218D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 06:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jb7e7+a60GG3tcgpyR1Leiq2fUe+Pu5bw8wD+cUMlNI=; b=VCuT/O9nkrpmE4
	SaCFek+QRsg0mKt1GuJu6Ev4nEjFxLbdSFw6LICCVRSJIvTnBD1zt576Qywc9qQTSa/wQlMphBcas
	Wyv0x7XtnWFPszf3fkX0sJqobG7MRma8lFyTdYTi9guGFd5jPQUSb4VeNd3v89N5seitFhvSho4M1
	Rt+EBgPIqIaTx0FbRqJB3jAPKLoS7iscmg59gTUIiwypy8OsrwtXWy5ewG5S8wOdC879MR3CK/qHr
	GbhNj14PAdDCPXd6t46NayzE3b+qyaaSq900HHmcxEZAMYptMPMeWDrUvzZNTVJeTobNRC1rAgAsu
	S5i0OfXjZqyPcPOk56og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfCT-00000004DkN-1TFL;
	Tue, 28 Jan 2025 06:35:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE6-00000004AVi-1CLf
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Jan 2025 05:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=; b=G6voZBIZrivKAzVN4eMi3PHsDh
	F1UR4RALGlmLM09xFjctgF/12g8NAQMt1Xu5sz0574niuhAzXfxV6tjYIbn8nocmErYmh7PLtJQEf
	jIQoeT7lSlnHjv7EAifIYhsWxS6Ca8y9JSZyAFggrzZa4dLDelvIHlaMNzsFd5GvcVGazhCm92ErZ
	oVven0QJobsAWwWc/ihDsnlA6Fe2jfi7wOUHz/UF2U+SRDngt2wUhHcvTiEgByw7r266X9jMt3Qeg
	oIMa/fhWp/gFS43n31jHsoZC/Pv6k1y9toTOKjpDw2waM2u/RlDDsgqzU9KV+BvQVwgMi2t8H+Wp2
	vkQyioIg==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE1-0000000EpeB-2X42
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:33:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so8053815a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042403; x=1738647203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=loTL4GxrPb8kkFUZI4zBcEnDEBeq5mLTB0FbTog6xzGgcb9ATah2aTgjbtUYpaC0BP
         LGNl3JkrUHANLn9Y4v46aBBJb90HGodZz003720djbrU9jpt/pWnyHt/Mm8E+iDm6bL3
         ozhFV1ioznDUCtjK0c0t90fZDQ4wcvLPygylOor/Fc0pE2Q2sGCqlvMIdtdIlOXPsu0F
         nM61jcwBgcmqWdOy1M0AIm8WFbfwpETdYH/g7ZWPGPfwpw+ip+xm4ZpqAEODXtTSdBWD
         R/SEGnies+o8C6p+OZWWKhTDpos4G6xsWx1Tnrln3bOih/Yjldhf3WHgQNZNhKjzBAlJ
         KVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042403; x=1738647203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNOxwbh8TJLovUJ4xbmkceu/OhoInCtt14EIM5E3MZs=;
        b=qwd2T09Z7V0iA4SlL6uHPLGLBw5JsYGDOUeGruMrXCAQKTfGH1c6X5Qv2WDIKLWvDo
         z/rQIGb8VQ+BHYV1l4O1W2URcnGpuxkPKxX7QhlH0KSzjdHhmccRfw0fOyHR4ZBM8arV
         1dUfRyY4C0JG8Rz2K9m4QE1HyJf0zziFKOxFZmtjsFM2MSj0eIDOpBFk3AWUR+kj7FES
         eJzoyAAUBSQ0VnEMcM0VDuPuEA7I8XnCtmiCxkwE2LPxizs9Z6aiR4j8UDCyGDDgQMKr
         qPGiLdyjQ8aKsC5KzZTNL/jz0maexAAPrMSuFWFozHLG6BDr4K6g6/E+44u2FFxgHqy4
         8FMg==
X-Gm-Message-State: AOJu0Yy61JAHzU/z+RXqhQmO6J8WlFtab0biea5yfUtTPJbLPgR+r6HF
	8Ub01Crk2Vt6weRla19fGFT0Rxg6uN1h0aajwrASIFWuvBKFb82K7W13DExM1Rg=
X-Gm-Gg: ASbGncu+SG9OlEMixcob2WY62VECx8VRz9S2hIrDG5+yu3t2j9xwJTaIukZDKuDEm7S
	i1sbNrFly0qMioN69wqkn++DcdlC1boxAYGF7hwoQ5WzSLmz4yzJAJXPZGcs6fMzIb7b1tG4ZDJ
	HjE1GY1Wld9FQ0AXwc4OWdE1E5EZYnO1rpGRDLym7dU5+YTykJoIAWhQ79LQlaaJLeiLlB28CZw
	scQyx69dIMennrIXvMSDOfgbzFq70lcp1BOjbyNfWuK1+56Ys8PfDVdACm7qqrdQ4mvqi6Fo392
	XZlWaK2UYfE6Q1xa9g+znMQy6D872ps=
X-Google-Smtp-Source: AGHT+IHJHQRcL9Lv4f1yIJBut5cVZG5MPbkCVxCZQ6AIY/XzegyPECOnS8zpH/X82U5LA34CHjhDGw==
X-Received: by 2002:a17:90b:2dca:b0:2ee:e2f6:8abc with SMTP id 98e67ed59e1d1-2f82c028adfmr3131615a91.10.1738042402000;
        Mon, 27 Jan 2025 21:33:22 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:21 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 21:33:09 -0800
Subject: [PATCH v4 1/4] riscv: entry: Convert ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250127-riscv_optimize_entry-v4-1-868cf7702dc9@rivosinc.com>
References: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
In-Reply-To: <20250127-riscv_optimize_entry-v4-0-868cf7702dc9@rivosinc.com>
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
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHNmW1oVXLgvdrHm3epf2zccMKopBG1aE7L961V1Ps
 8zg7Yf6jlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACbyewUjQ0cF/4qw6W6Tp91M
 dj3pWZezPHNdv3m7eIHJb5l10jkWIQz/Exmk5z/IsjaQM6rhfiby99r+4z0//5VsE18Ye+azt74
 fNwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_053325_912478_FB60FEB1 
X-CRM114-Status: GOOD (  12.04  )
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
