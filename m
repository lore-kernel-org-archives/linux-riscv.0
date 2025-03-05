Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C581BC282EC
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 23:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tvQD+hIPFr9HIfLQzbZ4edd6dpi15plHy4hQ6Q8zK4=; b=4fg/tR3sPz4ClU
	E8TBXw1GgmJFI2WE0PNmltZm32wmL/DRrlMgL3QcCYANjS8rJbCXU9a5hN3CK8wczTT1PV3oqsADN
	1A4f0jLW/529FMz1bC26jT1VmvsdUkMk514VWkQDXi1qPgtMRI9N3kHVxvDW1Al14KE4NaQNmVnUl
	wiWeCm8/Cdb+AXLvIvuNZ+cfk1G9bsld5HOF5kLeIXRgQjmmugEufyAb6EW/3DLNMQ63ikPk53l2x
	NP56/XnvtlB9oL0f34UDJY/UiEeoFN50BgyagY9fXMqIAJ+5pOAboavTJ2ARo/Qdvd0y4i7LPUBNr
	jL+PoXXBaN63etgSyGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjL-00000009YPH-2uc7;
	Wed, 05 Mar 2025 23:00:47 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpxjJ-00000009YNm-2qjW
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 23:00:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2fea47bcb51so150620a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 15:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741215645; x=1741820445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=u11XG5Gba9/K4dfmvngCBCtZ61HLpJA6Csl7XKn5MNEPgPl5LPXKHd66YNfBmIjL84
         ZXvW/xsY9PW6EgLaqgpuk8x5lrBVuYPvQKXE8Gy4ULfy3JqRURwWqntCPG4id+daGqtg
         PhovFaWwrMXf8AujjAtdulCUY3wGgWJapTiAJF+KmOu/nVn6XMpPic1kkoHbW6ktGnLH
         958l16hAacA7Ycv+E4wjioLyHkweN5pqrFrswR9kOTwrbXRdnX8elmZkXUciNdlVaUaQ
         tOlaT7PlirGNHWMsSyUCRwEjMHPSoHp7h98e+zsdzIfgRqvAA4i/k3B5D9oi/zBCH2bW
         C6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215645; x=1741820445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=MhKXBEz46X2xX1fgD8VIxxYYczch9guJlSxpc4pUtTBa3peqk6QxFJrD4R2H37QZKa
         h2zo8LctUNdLLl2IxsnbOLtxFnj8Z9NfpzbUIEOk40g/Pcy3gcvnhoZFLgPjXnl2UR86
         qcmIBwd4tPVXbgvVMRvbuIY7yA+KOOOU2q06IuRqclHD9xUFtJnpa5C9DYpFkq0IJ6CV
         4/7/cfiI4ybmg+VpnXwDtyryb1anLeY7ufEmpLiUHAj6xiUJmiKdLyXke+EmFqkqhlqX
         i/f6fWIfeQ6KsXSvBgIR8LpQx13uj+dCeOS1RB0SZIJN7/isZbmsAU/p8tw3hD4tdhWs
         0Vow==
X-Gm-Message-State: AOJu0YzSZ/kmS+kDGnC7pPNvbgBUyGo8PV5xXbSjejhN8rJ3NbnNRDFg
	eZCsnMG7NkamzNlf2guXkKJH145R3ttFYfVTIGVV3kcI/YUQrV9u1LwSqE2Gdqo=
X-Gm-Gg: ASbGncujeonnkdqFpCDOBT95SplU7WSqJnnbXWwSbBNhaUrVlXSX1WWiPCDAL1iKdHd
	FMejf9ZK/XdPDU/25XTCww7V7uU33j3aqptaDTl29obLKknktTRUAt6ZJTA/AcqmshFpOHtsSWA
	zOELVca9hGsRB4MvS7LOzght2rOeH6sTqRWYzh8CDj6ohAuciVOWO9pdgqW6csy3Ip9rWNBrTxj
	gC2+M2hVZDWFaLA4VpbZcxESrYQ7NItjeJLBGQJAY3ZAtQGgq8KwcDZehPK+z8KRX3wGtKYiahP
	mQbEPFTI4Nteer4/s5HB99goIUAPwZP6UZXj9GP8vpH9VcCZzanngtnHFrpR
X-Google-Smtp-Source: AGHT+IHvW5MI/rViqhq1DoMiw7xqnu+EXrlGQ4nTLYN2RziECr6n5eoBvZiwNc4aRRHQuXNm88Ho1Q==
X-Received: by 2002:a05:6a21:328c:b0:1ee:dcd3:80e6 with SMTP id adf61e73a8af0-1f3493303c1mr9715603637.0.1741215644639;
        Wed, 05 Mar 2025 15:00:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dedd22esm10593413a12.63.2025.03.05.15.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 15:00:43 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 15:00:26 -0800
Subject: [PATCH RESEND v4 2/4] riscv: entry: Split ret_from_fork() into
 user and kernel
MIME-Version: 1.0
Message-Id: <20250305-riscv_optimize_entry-v4-2-0d81bb45203f@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=t9WBogxb56lApIirNVzIj0lHOk+/6g6AFgtrehj97DE=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ69PKgi8V7xPjXmGYb6hQrvgjfnd2xYXS799eR28NP
 FG5XmdPRykLgxgXg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABNJms3I8Iq1Tv7tm/bAprj2
 6SaO39+sCbGcdkWd61+iQCeL86I0ZkaGpSUCEburIm5d+bT9h2hB1nc2rQXXr4qmanTdnGM8MU+
 OFQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_150045_724594_447E206E 
X-CRM114-Status: GOOD (  13.17  )
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
index b2dc5e7c7b3a843fa4aa02eba2a911eb3ce31d1f..0fb338000c6dc0358742cd03497fa54b9e9d1aec 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -319,14 +319,21 @@ SYM_CODE_END(handle_kernel_stack_overflow)
 ASM_NOKPROBE(handle_kernel_stack_overflow)
 #endif
 
-SYM_CODE_START(ret_from_fork_asm)
+SYM_CODE_START(ret_from_fork_kernel_asm)
 	call schedule_tail
 	move a0, s1 /* fn_arg */
 	move a1, s0 /* fn */
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
