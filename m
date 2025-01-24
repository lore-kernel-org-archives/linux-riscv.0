Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3BBC02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tvQD+hIPFr9HIfLQzbZ4edd6dpi15plHy4hQ6Q8zK4=; b=aBEAfDNa9rfKfd
	cCNqeTuvffV2m4SFAmTkFwmVENlGNgVBtF9dVsjNdfNzaGfpsHvJFKrZjkE6+BHnFHeRL4VkL6o/l
	u5ddK0DwZgT9mokFjt3qR6LE+PR5DbjsquObWM7dQIGjc5T0l+2nMaLqQwm2BZ8UmPnHROXajvQXO
	FUpveyLKVZLBJEesCo6vqkSrX3icgHvS1JqS06uS85gx4SmAixwJlSGP22oFqEx0eRi4ML+TvmbsZ
	bm0zoKiXO81JNVUajnmZircL2fWh79mHzlLMmnNtwei6GB4HwQWvaIDMQKk+fQiu/FHdvuDlUOGuZ
	CigL+PWpwx3uThs4JwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSDi-0000000FcuZ-1Xjh;
	Fri, 24 Jan 2025 22:32:10 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSD4-0000000FchL-1wdB
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 22:31:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso3841277a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 14:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757889; x=1738362689; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=bkyKYMVs7yIJNRqPinTKYiRniVM8uqeAZoVl8HqFjn/jt4P7ftjl4HpewvdDYKEyBC
         7Tb/qfabdWz1YBgSndoRH2bfFU5ciWhuaBeeyxHdrzaOgL6L8dRd2cCsYEuTt0zwj0M4
         NP4rq9JXT5d+B+cL3BmSN4jkInM7Tyhs/mzyfBXvmledDqpTwXukL9PApE9N9zU9UEUt
         NzGVcRXzYZzT36caCEM/o7GnlJGeeUd3GSm7Q3+mIJwcyxkEd0wBmb2+z7t2QjDxERJU
         rikbcX+VzFH6dweCoir37pU63MnmovjrOq0kI/EcZhDoOVDuylbTfBpp2/k3tVHFaKOk
         16Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757889; x=1738362689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnq3B23qbOBveDsFleAgWeOkAmZk3gQFKZw4IbSmZLU=;
        b=lP2g1DiqEwIbICAQw/URgPVl6ejFzXk/Mb6FPv5r1iNyVICdvPPlzxG78yLEz54py/
         TCw66hBcJN6Z4d/j8r0kWIEXljFQCoeXVVFRexWtSz0zmhhPzL525hLv2Fp8Ej0MWTYZ
         +attRoPagPCUXSPZoCcbwpUne+x6PD7qIZ/vCYItLIzq94Tnel3YeLgeIACe1T69679m
         QogeE1nxRIoP/55kxdH384ZgZAWEH4mSbi803uBgdA36UWPHdHyQ+SyG5un4KJBlv29S
         UZQNQsP584vRcvEz5K7sVll9vWpGCfjlktgEnnL3RRmHX81I6h3PRcsdTf3m7TnXNfLo
         3KNg==
X-Gm-Message-State: AOJu0YzQDtor4fSThLjrrtpdr/GEIhVpcf6qN3xuk0XvLPQ6YfFGYoI6
	AMFHvNkdoC622jHCyCcrRqN7NubM/7z29wE8OtsGvZGrSNbyLWdZeLgVtfwITDw=
X-Gm-Gg: ASbGnctgrkFt6QoD3hK98K2rg7gycS0Qrun5MFdVC6TxfieCeAf5IgS9iobKPEkIori
	Q/CwwiB6vIBvwhCYdrGE9d/fWsGFNDuBkgYiZfwYSPk9UG8ddpXztRvqVJ8eLsOU52HrEYu5pe0
	ZptLcf6sfE6UsnrxGTJs+VK4cgvvEygMqy+EyB33kQmgHf7U8kZkX5+RcdA4V0R1zYZwoFD5Wb5
	TuXqkD5V6Wx6PU0GNHRPo7UUR4A8Nbks8v6YgeQtlK/+FoBzLhcChHHhDqhXEc8eiIKGQh/u7NP
	oc8zXjaNarb9EMxRJOTK
X-Google-Smtp-Source: AGHT+IG2A2M9jJ06wgeU6MMIXKJU3cZe7jVRjjabtXl2tIE7gfG3Pli2LQenVrOmHMThyR5CLM42Yw==
X-Received: by 2002:a05:6a00:8084:b0:724:d758:f35 with SMTP id d2e1a72fcca58-72daf9bd157mr43251403b3a.2.1737757889642;
        Fri, 24 Jan 2025 14:31:29 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 24 Jan 2025 14:31:00 -0800
Subject: [PATCH v3 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
MIME-Version: 1.0
Message-Id: <20250124-riscv_optimize_entry-v3-2-869f36b9e43b@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=t9WBogxb56lApIirNVzIj0lHOk+/6g6AFgtrehj97DE=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkT1rm9Z8Nf0kEHf0/WHb/Q7WLrI7Fxwsm14jGnnDn
 +9v0JejHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzk4GqG/44uK2Vbko953/Tz
 iju3MFvOKHpDoOYUC6lZB7o9n3u+2crwh/PYJ327eY+9t3o2/Zgy35Dj0px0OeEla1NcZefnh3L
 ZcwMA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_143130_505692_0948AC93 
X-CRM114-Status: GOOD (  13.01  )
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
