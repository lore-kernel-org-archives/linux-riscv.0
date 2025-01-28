Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572A7C02190
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 06:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tvQD+hIPFr9HIfLQzbZ4edd6dpi15plHy4hQ6Q8zK4=; b=nSt2J0AgZDGmeT
	NUIWHpJGQkZCZWucCoYpP1672lzrpAIgbpgz83vtSSD3xgtZ4eLSkYDYtkCnf5X/VeGMZ5V1L1qyg
	y87zqBQSNffkkOCV4Q/kS54WIo9mnn98cjsbHYCOiR+cjR/fKXpYn2ndf439aWkeroHrK5b2kKa8Z
	YI7VX2Hn02tckRBs3CH/wlloZ0xiVPgEjbbTYt9jij5EkiQtndcNMCDbYAPCZ5e7MAmkBlrGlrDnL
	klefr32PKkXBUOydsK4yvIqZLWOWZTM5EEpf55H5MPXenXGkgKNztGAQODYT/SSiCMmtgLGA7txNL
	8DX+YA2zvrQ2Qv9y3jpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfCS-00000004Dk3-3Egr;
	Tue, 28 Jan 2025 06:35:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE5-00000004AVI-0H2M
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Jan 2025 05:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=; b=h2cVZzVxqt0Vi+lm1xmzdo+szI
	dBojJsrLjXm/kXyzrn1fsU1NLUhcrFWLLT+z3Q2+lnBMeTumjUd822GoxZQrKyN27NhoTJcXojx6D
	Xs9/kh8+u7cdeQaz4GfDdhuxD5KSEftNLHiLoZl9Qsv4OtUjQoAsU4KVpnpmyOhrGUHPLygxEbgBk
	jZqqfK+m+LtoKRs3qBI89KUeWTPVMUcwP9SdkcflmwUU227IKgcG5Wppe2p+tG/YE2bZJIB2hFwYo
	Xo3XP7iQsxYE7vo2LVNvmh64Y3abyffYQ2OFmR8xhcngoRj2TQuvI66Hmw/2f8B+MNoibNUb8vsiO
	BqaU9c1w==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE1-0000000EpeE-2X73
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:33:27 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2efded08c79so7240291a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042403; x=1738647203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=1du/Xs+GjVwlYnnIhKCyGB0Jnns2wm7hUjA14Vzl/oZ1U/o/EIfiM7ko80E7Ieqvbw
         Z5+0K+5BeEITuCKaz9WC5/fHpCp7l+NwXoUwDUxfl7JZ2BGxCcW4+X9aga7r2dpELujE
         xEUY9OYD+n7ZFTOiIT4zmQs4/DaPkxEnuaPvVGlmdayz+wYxUONKPTimxHfQoelj0pc6
         fpRTjuG0Up2dVSuOQ31pQZ0UA3yQ1Rd697Iem9UEtY6TRS7G7yF0R1wsfuMxh9ckaDZJ
         Z0ystDtP43bkY0WISnaThR08Kpy5ls5/Vodiv4yAOEZRjDbp782N/FpErDgnuv1cXbbE
         FMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042403; x=1738647203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=Vh/h4OsBd5F683HaINID3K2tvxWbLNL3lPItK/WCob01mfSdY3fct5FzIdpQAOz2rE
         nX7rtxmx1vVGh+HbezWuKxVAOT2ZkIMOT9nJosCeXpT/k1HFaI/XZTDp3188e4AGiCNt
         484TST4BW26K6iAgHyeOOlu/OnscJGU35n+59E4UbEUp7fb+zWhOsNfO4M/beHiSgy4P
         aqXVvCFVYy6Lusqfp78IzzU5XqSu0rbNBAhXNRUngBj8ccnwbuFyVF1m31ciU9Eqyvd9
         cOx2uCcUW2oIVQCgWbioiLzRyE1aNSSFyI8jCoYdjKWcWtt8FffUO1y6uyji3jRe6gBE
         SkZA==
X-Gm-Message-State: AOJu0YzAT2ppnjyKC5mHC0dh69gqllIn6dNnHXsZw8ihWxDq/mZvUBHk
	c7cuaNR9yQeETbESHl0Qhn2+2gnMbR/5onKgD2LEIJHB8z9qP1N4FTaabPpGhoc=
X-Gm-Gg: ASbGncsRJqUsF0x02MRzcVpQkduQcON+2wKvk73C7YKNdM7w6Rcx7KrAo9BU7sb8Mki
	igw2MEAqCSVkb5O6IrG1Hf+pyAUU7RwU1nmqqkvuuj8WnW/SShgb7q11TGkdjgj9wsUEp9ZJUcq
	3nYztgkKQiMPP/cN7kOTpODvrC9IYWDHGUL/xdgiGPoUmyjXv+rGUQNIH8KiZTkdM+VnOnRvRDp
	tZKPpc5WvAVfPDQqEDEy8v875tDzTZEMI1LO/9uBzxXEcBbJenMr3NLmtGQElPXKQqRfJItMw22
	dRO49dcixzR8HLwERkN4gy2OMe9Qi9s=
X-Google-Smtp-Source: AGHT+IFR4FKoI6WAOEtDoSPEKu3zmYlAkQg4eL8AiynsxA5wsmbIEvXhdDDVdrsVxT1SWVknkzcJvA==
X-Received: by 2002:a17:90b:3bc3:b0:2ee:f80c:6889 with SMTP id 98e67ed59e1d1-2f782d9a9eamr70402131a91.33.1738042403569;
        Mon, 27 Jan 2025 21:33:23 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:22 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 21:33:10 -0800
Subject: [PATCH v4 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
MIME-Version: 1.0
Message-Id: <20250127-riscv_optimize_entry-v4-2-868cf7702dc9@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=t9WBogxb56lApIirNVzIj0lHOk+/6g6AFgtrehj97DE=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHLnAdcu/2aq4Ot/p4NC8dlorvE3lce7LZWe0/y751
 nYteNv6jlIWBjEuBlkxRRaeaw3MrXf0y46Klk2AmcPKBDKEgYtTACby5h/Df0/OuS3LfH/dPsVx
 sFZ3xyxNY1NrE7db0rMO5R+xevZP/jwjwyvuKOvWI15XT9dpcVd/DQwU6X+SqeLFXT5h6eOFE5X
 XMQEA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_053325_909704_8446EE44 
X-CRM114-Status: GOOD (  13.32  )
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
