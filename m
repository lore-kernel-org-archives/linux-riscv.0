Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5DCC02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 22:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/wAY+FoBANnarVYkA4nEExBRYla9xJ8ovxLi3BoSJ8=; b=PfwNO6tduMGU7L
	c7D+uQTvmeXgnjKNfl6CA7IksmluLTIhIv+SVh1D4sJNgaPtpox8MVkuWed73vbw4MmwLXNc2Xi07
	r4uikC+NvjYtMBAM9w6pEzOvshukFNeSKJaNY0Ld3ZEYb5ghSc5W9MBlWuX5jt1wLD1vsFWkYDv77
	HrIM5+7jxpRvSdr2KUEQCjwovVmQ8tMXOhDHMBp3F79S5r3VN43rVcUhXqIOfA43YeDdyJNcAQYJ7
	QYsRJ9lYqO/tEpp1207gcN9pnWmzkUtwI8epVDiiyaGxvYry5WGLSyxTByMBrTpugDDDm9p4v2KVL
	T8dGs8oXyfHumlRliP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajef-0000000BMYt-2ELx;
	Wed, 22 Jan 2025 22:57:01 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tajec-0000000BMWj-1uEB
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 22:57:00 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso475530a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737586617; x=1738191417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk9EjRkEzIcEMvzIBfoIlltgvi6+ujtlpNud1xWt+ys=;
        b=X5OmamEFZJXRwM2foY5pDbPkgMRXYduo2bQyVyZmF3pokcSLVcCmTAspvPxypu0NLn
         WCsGqxVKR/i/fmnlVLndjblXL66xelQHOyMFKKdR+hPTYdSfbuybO0cZQNea85aslVla
         vRedbiG8UYkZ+4gwgSfqUzM3SSiox96PVgBbPV0e1Mu2gFSscX0ZSd46w71gImpTdv6c
         iSPcDQrikZXaJC+8ov8s1JCuJBFAgbKfcOmfxK8BRCpHX8GEWE4GoGlKSecvL6vTKoZV
         Zb4XlzCTVIK5Md7wOWq7lqtRLhIvamNVgyKRUHhjVLuspSQT0i//wMirepcsehUJ5WEQ
         t/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586617; x=1738191417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk9EjRkEzIcEMvzIBfoIlltgvi6+ujtlpNud1xWt+ys=;
        b=YYXfBLGUOa79EOKyl69jTeYwj2ZVM4aT/+d2KaWwX0fCtdNn8QAzN7sr9v4VMJHnI6
         7dg4X5eP8m4HUBn1jMPXu8bcnF5J6pNNDGtx50v1HGkVEWusicXdleu5AwxiZFQB7pJT
         CYkl0Vhot/okKleSISXqKKNpT839yk9v1VAy9HdbXYMCR6k7N1juTRCagK7s38k+Y2eB
         fFaKeZs/qpCaMkzdjInMDNC7z2F/r3F8iv7QoVCanR4X7pxGtG31OuoCo1pSDFAENsFf
         2FqgPSTd5TeYTRKx/wK7xIWDIqaM4+dzzZk1q7u+puZQ66y31mvZ4VfeJBV5o4A+UEPv
         N3cQ==
X-Gm-Message-State: AOJu0Yx4PNpkM7/WedT1BUGG8ctJz1ESj9SiO2fgZF5YVvLzY6hXbKF9
	RdD6LX+LLCUbW/wkndYc1vT9gQqhbjFcC9Gbl8j8n3t/NHb1iiMxVO1o9Y0XzLU=
X-Gm-Gg: ASbGncvD9g6TTfm/70/twYKLFKBEAKwns48HAf2rSN5jOV9NqrbBgsD9Q7czRjPVX71
	yg7Di7CdyKZvH7EY/thr/tY9+ayqrj1aXHC4wyCPwHE40LyQAFEFxATomMPOcZGL5p+lpKiHhDh
	eCLbLpyPQd6HfJ8A9BD5LV4DUExAI7DG8J5xVdZZq0qbNgXfqsgz09DwITUWul2AQRduiRfc3Jc
	eAOwHR7Z3pLYj5pbYIsWk7QjuoxkYihfIuiHsfQQFaUwpjAtdbEKiL5619w9wDkgO8k8q+w2xmA
	yB5+lwV9en2cMTr8Z03y
X-Google-Smtp-Source: AGHT+IEgKTQYuz2/Gbshe8x8bmjmpJ0Acgfixj4MEY6AowVSMpnu4YvlJGJiQi2O8+uqfUzYLPzGkA==
X-Received: by 2002:a17:90b:4b82:b0:2f4:423a:8fb2 with SMTP id 98e67ed59e1d1-2f782cbf6a3mr35467389a91.20.1737586617545;
        Wed, 22 Jan 2025 14:56:57 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6aaf3b4sm2301375a91.25.2025.01.22.14.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:56:56 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Jan 2025 14:56:21 -0800
Subject: [PATCH 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
MIME-Version: 1.0
Message-Id: <20250122-riscv_optimize_entry-v1-2-4ee95559cfd0@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/8HxBSW4tXtNDNNcwvIlJWKmSet2jd64HJR1EYtmRzg=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rE8i0b7c+0s/xcqt3/5b4w99KHFwsVdgnIyp27P0Uh+
 PiLWpaFHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzkvxojw/S94Wbr81rsm08G
 Ci0Pqo+N/Pys/vcCwWWTdNbd4dItesbwV/CvwkKz0Md8V+zighdYTl076b4Iy/KkostTt9bobnT
 +zwYA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_145658_497904_C829ED4B 
X-CRM114-Status: GOOD (  13.08  )
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

This function was unified into a single function in commit ab9164dae273
("riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork").
However that imposed a performance degradation. Partially reverting this
commit to have ret_from_fork() split again results in a 1% increase on
the number of times fork is able to be called per second.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  3 ++-
 arch/riscv/kernel/entry.S               | 13 ++++++++++---
 arch/riscv/kernel/process.c             | 17 +++++++++++------
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 733ff609778797001006c33bba9e3cc5b1f15387..bfc8ea5f9319b19449ec59493b45b926df888832 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -52,7 +52,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
 
-asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
+asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
+asmlinkage void ret_from_fork_user(struct pt_regs *regs);
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
 asmlinkage void do_page_fault(struct pt_regs *regs);
 asmlinkage void do_irq(struct pt_regs *regs);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9225c322279aa90e737b1d7144db084319cf8103..9386ef7444267f0b9bf8a0550f4e31deaeb85881 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
 #endif
 
-SYM_CODE_START(ret_from_fork_asm)
+SYM_CODE_START(ret_from_fork_kernel_asm)
 	call schedule_tail
 	move a0, s1 /* fn */
 	move a1, s0 /* fn_arg */
 	move a2, sp /* pt_regs */
-	call ret_from_fork
+	call ret_from_fork_kernel
 	j ret_from_exception
-SYM_CODE_END(ret_from_fork_asm)
+SYM_CODE_END(ret_from_fork_kernel_asm)
+
+SYM_CODE_START(ret_from_fork_user_asm)
+	call schedule_tail
+	move a0, sp /* pt_regs */
+	call ret_from_fork_user
+	j ret_from_exception
+SYM_CODE_END(ret_from_fork_user_asm)
 
 #ifdef CONFIG_IRQ_STACKS
 /*
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 0d07e6d8f6b57beba438dbba5e8c74a014582bee..5f15236cb526bd9fe61636ed372b4b76c94df946 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -38,7 +38,8 @@ unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
-extern asmlinkage void ret_from_fork_asm(void);
+extern asmlinkage void ret_from_fork_kernel_asm(void);
+extern asmlinkage void ret_from_fork_user_asm(void);
 
 void noinstr arch_cpu_idle(void)
 {
@@ -208,14 +209,18 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-asmlinkage void ret_from_fork(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
 {
-	if (unlikely(fn))
-		fn(fn_arg);
+	fn(fn_arg);
 
 	syscall_exit_to_user_mode(regs);
 }
 
+asmlinkage void ret_from_fork_user(struct pt_regs *regs)
+{
+	syscall_exit_to_user_mode(regs);
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
@@ -238,6 +243,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
+		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
 	} else {
 		*childregs = *(current_pt_regs());
 		/* Turn off status.VS */
@@ -247,12 +253,11 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
-		p->thread.s[0] = 0;
+		p->thread.ra = (unsigned long)ret_from_fork_user_asm;
 	}
 	p->thread.riscv_v_flags = 0;
 	if (has_vector())
 		riscv_v_thread_alloc(p);
-	p->thread.ra = (unsigned long)ret_from_fork_asm;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
