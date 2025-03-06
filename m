Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA396C28B25
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 00:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krkUCHe7704INogIR8lX67ywhTCuyxYoBPIkDzaVNvo=; b=R2I6Gn3t/Qf20e
	rmosFrGp/3pW8/DpGcSnWoDlR2nHQtap9UfbFbrfFKyLhJJQSBcliLDMMnxVv0w//WgW6PfTitZwr
	ObKEjJcTyzfyRcNWmdQxe/t8G1gn81qSp40OT/u9+hpn02/PQhbV7kMZqa16K7PqT+F9btgwHbFLE
	NT+E6IAM8s4f3ockeRS2PXtg0ErtdwQVq59+UrKDopowOU3LCAR+lqAZhIsUERig61Mpd+pIGVXM9
	jPeVx43ZaZ+qVPQ8+P+6htUEqRgXpH6cxGsYdBdpAVc/ueiVPWV+Quvznl42PxZFHvloiCR1ChOYB
	SzP/Lebk+cClqJBbhe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzLP-00000009iiK-3msD;
	Thu, 06 Mar 2025 00:44:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzLN-00000009ig5-3TXk
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 00:44:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2235189adaeso2147565ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 16:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741221849; x=1741826649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehMUm3J1yyvZGiQlan49h9651rjeLktXjDjteQa4YzI=;
        b=wYbvNfHRZzgw03xql47A7jZLGwbz6xcYRPqGfXbbbl6TNy2N5F/WjTHFxl46jUZSkO
         qKHwIj3utJPorx7mjtYCu/8ndTRNqqwblDqHD/pSY9PzIJDl2W1IS+jF2Z0c3rerTyA4
         Wff4eyFenBkRdd00OHbCFBcVpx3N20r5q87gxAYK05HmMnUmbasla+0NPCiwN7seu/09
         oImIUAYe8Sk6nJRdORGQ43RA99xoHywhC5w18hxoMYHxR1+He+SpoxVtXEA/D0IY1SL3
         ZV0ENIAA2awen6JxQinYQ2GytUgzkOEW0YgCV/3sf7YH7RgflXkGdTuU+E4McUTdfkdn
         rbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741221849; x=1741826649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehMUm3J1yyvZGiQlan49h9651rjeLktXjDjteQa4YzI=;
        b=qxJyL/iT1xrFEdQBhHvS70JQi0kh9jVKiD6tf9f7nVH23SGSxnge1zT+wx6h7/CbG+
         51eSy274aQa/k4HEVPBhEbEcybQKRrKKPqCg16lCTyqhMMKzXfgpdX8BnNYhVEYEzsqj
         zofmO1Xu0K9ri3TPgfWg1G9qkLelzxC7aLEqM3cB8/amrESPzDKKl3NWxoJOmBX0YxTu
         L+eutPqm+ZF8Juu9l6jYj0TE7BQvNnYhFKhdKHfsVQXIrAr2A2+z10G/MfJKIdpnOqnc
         qhdl6RYVMXPbKdoGpFjJNtYVchGI6xPuI2rLFdB0mY9aHksPzHbE8KY8Z1WIw/946GIK
         0vGA==
X-Gm-Message-State: AOJu0YzmIE2Ue8ekTlL36hoa/GQXDnj9Oe9aMBgMZj6sEKhbOukVkbTF
	rtiXkanBbFSPShI4xgNzWrJOX09en7m5kNKEUUbuA2Avz5x9ZLetl/6d4kOGAHU=
X-Gm-Gg: ASbGncsnwtDD8hKXy57XKPKRyIopw336nyBfGpjwPiC7TDmmo4TW9ThvCsT1G/yLuqI
	8ebISw5IDIlwm+GOJ5n9L3xTjLzhA1sTOZyfxFhVV18LZvWOzRtkGx/iBYzZixY5msskIk0YrO/
	KsjR38+iTVnKmlmDHlbkErIq8WYInOz3zLRJR6WjSc0RbkLPcWnIEyPpZiQaQkZx1j0RufYGB1O
	zemnxc6Asx8T5rTr/nTIqU7dKhP44nvNe1H59Rk7Q2vYr7kPuX4kx8lQHUGoVZiLhqxMVeMSlMC
	Rs00Q/j+Dr8Qw4bSqKi1p1ENTGkT9N8/di6lt7oH1K3iqeOcWASas2ih/SK/
X-Google-Smtp-Source: AGHT+IHUzwBDw/uha6a2fjM59Txc8WQN/Vrb5TcHaRq3eYqWZnWT8m/ex64QjFGpr4eyefI929SBSw==
X-Received: by 2002:a17:902:c943:b0:220:e91f:4408 with SMTP id d9443c01a7336-2240948d12fmr21414815ad.22.1741221848994;
        Wed, 05 Mar 2025 16:44:08 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f7efsm347085ad.132.2025.03.05.16.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 16:44:08 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 05 Mar 2025 16:43:45 -0800
Subject: [PATCH v5 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
MIME-Version: 1.0
Message-Id: <20250305-riscv_optimize_entry-v5-2-6507b5dff3ce@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4464; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=LoTSopBOka5A9kpDiPFFurbF+1mjOb81UBycxnBlNbA=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qJ95dzi+tVwqu5bU9Lb1zHVqURfOznouv2s2e7/J+z/
 ItZ042DHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEwk7wIjw6S+bwF+haUsh6ez
 hRkGTla4Vckfo5V87KSvdlx+58+kXYwM3Z1PzoZozOg7tNdk7WpRtQWuZe9XxbPb9S5Xu/P274Z
 8TgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_164409_871567_28A5C5C3 
X-CRM114-Status: GOOD (  12.87  )
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
index 7b0a0bfe29aec896c2bdd8976d855dd390de88d7..485ec7a80a56097e8905cd6395af29633846b5c8 100644
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
 	if (has_vector() || has_xtheadvector())
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
