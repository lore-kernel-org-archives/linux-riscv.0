Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10952C02182
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 19:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/wAY+FoBANnarVYkA4nEExBRYla9xJ8ovxLi3BoSJ8=; b=AFsy9XZ54WNyNb
	YcNRYFXEfRgHH1tj5ygc+62q4AFKuHASgcljkRdcNVUETg6Tqc08fT5t0C3MGS1t0rHKJUTW/1Y3O
	DdmJYfWZFKgj5P+2bUp7AmV5aKpfJna1tAp5BQElVo/SkdoZm8LWBtsHUMX93051th9vooAAXPOTp
	V/cI9z3ykmhYl9+iVBG3RtKlRYgKt2TN6kRy7XUdFcAo4CFvau640631JD6jYV5UHKTeqjGyw3ORU
	wTeT5NkrOIaPn9ylrCCls98Bz7gnKBFJk3tADZSHFTv0Dn6yImgMBSjkVsdKZaAlEXPWJ3YeZMpYD
	IQZ4aca5jXAMDq2TVStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fj-0000000D6e4-2gLB;
	Thu, 23 Jan 2025 19:15:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb2fh-0000000D6cQ-1OnB
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 19:15:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-219f8263ae0so24997115ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 11:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737659720; x=1738264520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gk9EjRkEzIcEMvzIBfoIlltgvi6+ujtlpNud1xWt+ys=;
        b=jh+gzbGD6PVfQZSQIXJHiohuFzHSuFpqmq5DgZzle068atNw1LayH+VfjgrZe2mIby
         4Hq/e8jQf7/48eDG26Oc7rSx1bzE3WmZcyn0rMGVrNiNWEJGkhpZk9mWmedg2eQVa0TT
         PahhelnKil93RlmUENEWKq9tG29C5h8CNbe2fwXbZlRWzSHmPkm32pQxvk+K4flv2GmR
         zI3Onn7FToXUL2VDd6ED/+VUzopv+jYNGbbqbh+3mfWztC+LUdv1szwvAGNHucNTdSkr
         3ROFT8QnguE9VV+kk3bAC2f/qLdOnZ8cpfLahlUemIoLg+/naoiOtEwKP/Wz5cx42qdR
         AUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659720; x=1738264520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk9EjRkEzIcEMvzIBfoIlltgvi6+ujtlpNud1xWt+ys=;
        b=kp0ybXsMOpRUu0zlgia2Lfp895cZ8qZDaCvFl4/kSSAESUB8Rs18dwBWwsw5g5uHTx
         cfw34NC7OOrMSD6g4iuCORhwFR+xXhEmOkRrjvRLD02nOVM7+DsWifbQXLze2TIpXjuj
         RFoiBJkLpzKMCGQ4a9DJFykHA7v0dOGcyMdw8lZtIvgYzVjqlULlyINyP17xwpCsxaW2
         xfEUwgi3A/ON2f/GBtvP2xTD9WWxvW/jxvwz4X/VWjVHxQHSWm35pbopEncQlwkQrm6j
         muWjNsCoNTghaiaaffxn9jD4ymDxzWz+wdbO16THfb/p47sFw7dOiXaeH3TM6Cpah5lL
         Ytlg==
X-Gm-Message-State: AOJu0YxKy/GIM3UUR/JeZVRNlG4V0eQvLUkAhdVPIy4+EQyw2sWS7FTq
	ASf/jK8DgtN1+Tc7Bq8sPIITfVM6K43gzKbaLsLwewA9xEF7Lmr/HnV6L4KkMk1VNHYoc/GJYWD
	J
X-Gm-Gg: ASbGncvaActUSq/0Y2nViR4vFJk0U+nn3wv0va7mfi5HWkt7FI1Kp22W5vZw0oTRzWX
	xHas7e4Vha5Xz/nR++te4pWri6mZmGG3X97U1PL8Nl4QShGF4mV0PrGGPCGvA0JFJqI5VgkHWHw
	zvbYFfnoNt6QMpj7vrEocmeWdQHMA30xLYOcRabAP6sfyF/zkrFGvUo5UxeAzQlhRwTSkDcLTae
	8Ploy8qwKy0r4RpsQkD9h48xiQ76gUptI4VoVtcaJm6DfTY2ABFVGJfsUa2nnihZh07auVd4O8H
	EHOzFoRMVx8AWtusIELY
X-Google-Smtp-Source: AGHT+IHkfQrPEp8KLYF3AL+Bo2Q59PhtC2Y35HYLcJb5kUhqwNq9FsM6DusLZuZ2u/xwUq4DVWlfUw==
X-Received: by 2002:a17:903:186:b0:216:1ad4:d8fd with SMTP id d9443c01a7336-21c352de48cmr341368705ad.8.1737659720435;
        Thu, 23 Jan 2025 11:15:20 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3cb2sm2504645ad.90.2025.01.23.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:15:19 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 23 Jan 2025 11:14:30 -0800
Subject: [PATCH v2 2/4] riscv: entry: Split ret_from_fork() into user and
 kernel
MIME-Version: 1.0
Message-Id: <20250123-riscv_optimize_entry-v2-2-7c259492d508@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4442; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/8HxBSW4tXtNDNNcwvIlJWKmSet2jd64HJR1EYtmRzg=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qkqU5LlD7M5JuZcPjghNKfuzee+h96SKX52fwpF+7Pv
 yJwsEJ1ZUcpC4MYF4OsmCILz7UG5tY7+mVHRcsmwMxhZQIZwsDFKQATmfqb4b/LsmLTjNZDcn8n
 We6aOa8wV19C3dpT+ubLC8IskrtvVrxn+B+d8GZq9h75F88bpdL8j4uE+lp+5OEwuiJ6Vydjiex
 GA14A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_111521_369469_FE108F29 
X-CRM114-Status: GOOD (  12.88  )
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
