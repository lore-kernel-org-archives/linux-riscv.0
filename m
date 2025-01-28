Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D06C02194
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 06:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K574FHPasfcBoR7F0SLDoTWHHesWTUHmk6Tjlypguyo=; b=iAV7fYbqRbWqpE
	m99jQ580uxRyYJ3Pp1SnkRDyWjwOLADoiwCBAZeInJTCJnwwOefKqETgCVOiO28d5U8ipsrFWhtM4
	hWCbaz/5s19eLj8rf16yBS35I/lU/fnJKMdI1LHFsIAYWnZZM5q0h5eydwB1PS8U4kzLPULNsq9Q7
	2kmewt/8ZhmNAxJ8LXeEBKVlb07dBCAOVuXCR2WSp+XVvT+Q8U9lfpyeWl36V2E1/oApvberrSdr4
	V4Zp+AT6VUR6TkFHH21Kj99/gDIeO1s1+X3JYzp5PIFuvqqlDhRetMSw4S1/K1kveGZh/dqq+tMwj
	YTg/yT5I2iH5nn49W2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfCT-00000004DlU-43mm;
	Tue, 28 Jan 2025 06:35:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE6-00000004AVz-4Ajj
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Jan 2025 05:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=; b=YBjHm041jDYUTyog+AwzvVqwd0
	FKifjthF7G7v6jYWiZaFW+DvQt72Er5adQjnD9FDlbFB1u516FXajHxmZYmJvGNwJ8fduk35pZpQz
	KxPJrLL8O5yVyLC1T3twHxOeol6INoLLlpB4RzmcB4fhAOzQinoK07cHuXpgTIvKYvULOf4TlUDWU
	d9lNF5hVvsQr8eXNfHT3uEzqNFbz04G+N7h3Rf+jrg5Gf1y35SgQ9CC8QVWgfTXyuxsedyEuEGXb4
	JoUao5MnT8LfsikmveLfYalI1kqb8QMUzxtZCLlyLRP51IwtZYiI05tVDyY4Baz+wmQ9yAJYF9Cj7
	TxzaYUSQ==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceE3-0000000EpeL-27PL
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:33:29 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ef748105deso6937610a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738042405; x=1738647205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=qnM9sIctNhluHIs9FuaguDSrev9xnBOUPJaFjPTUnvKVshE03JGBBLW3KHoJ3G9lgC
         DJA1RmwLMwSYIBaTM50gAn+VqatI9/v9MJBTjpiPR1cahpXhJQ1SD9wNR7nGem9n98DV
         akwPfmE+qllIB27UZnjPQA8r4WdwC+D5LeXv/OfLSiV3tkbeGFwLv37A7IHTNykL2wfK
         W79/dy5I186mvPwFshBzXFc8oQcm6cJWpSIsiHT9NW2xU4xn65+Vq281EeTlZjLcihCG
         UzROAu2bLghZMLo1oBA3VUwKBqVFBtKrZ7SfMvR7F/r3UaEsixzGLTnjCTk5Je1Vxurv
         seFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738042405; x=1738647205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=up6T+S1GQduj0KMf8dWauIfZ8hJr80/WwjjCuWP9mnuW8FT8m9YKQZjAB1OnDhITnB
         6rhTIFCVm0VZd7KVX5fqBmQGn/Yt4437EOrzrAsQRJ8D8VQumFfyf5iZo864aIs9vjVJ
         1yETJDekVcgvyzHGh9sBeYa8IPmBVeKoZ4PsgGL770BGUVO+n2EjTGCEvyhngxSRyTWZ
         fCTdHsREhZjO2dfKnPiTyhib2mL7HThOArXkquihGODHF2dJv7sltvlTF+dU9RoHE0GL
         gpMHk7IHMz/sJh/UpvQ87wm0wSusnMy4c++KgckRyAXTWqujwxyAuFlnPialDnW5iYr+
         cnYw==
X-Gm-Message-State: AOJu0YxcN2ypoZgQO7ajfKauwXcdlqo5TUxr3BWi8ItCb2yxYY47ACKG
	bQK6lwh7b5RVIBjEtd+LzP/2bpgeh93XE/iWM9QjAy+cRIDvysZRW/1dbxp9TSuNIvzH/Sen/dE
	h
X-Gm-Gg: ASbGncsexaPaFL9MEFQgU0Xm3oAXeArDllZIf4t7Fqzlyi5GqRwmTCmAWpcpNl+WY10
	tk12Y9X4UUajdys7GGb7Xs8UdL8pN3kTiUbnUKIdyolohY2S2sZBADUgmG0UptisM+Mg+x2pwqO
	faY4ATABkQ0fUMfwEtsvVRkrOrDllkHclq7r7w7KGvOed9UBSSV3bm6XbF7Oqhma1BsiPVn4jMj
	yMaVyxBz9qmaoOaW3oFIRob2/w7ettW9mrdscZyEpgC6DuPdQq51QtviFiUJYIZ1MV3HXjo2fU9
	3T7KXvSb9w4JXtqjd3jnqFzcliWc5vQ=
X-Google-Smtp-Source: AGHT+IGoqJuE7I9wjQnsr+4QEv87Cr0QHQMrSNjxO8sTq0Cpmvr1lWpaGmvrwMjyc6dFwhn5oHxpZQ==
X-Received: by 2002:a17:90b:50c3:b0:2ee:8aa7:94a0 with SMTP id 98e67ed59e1d1-2f782d732e0mr54673387a91.32.1738042405112;
        Mon, 27 Jan 2025 21:33:25 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm8266247a91.38.2025.01.27.21.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:33:24 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Jan 2025 21:33:11 -0800
Subject: [PATCH v4 3/4] LoongArch: entry: Migrate ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250127-riscv_optimize_entry-v4-3-868cf7702dc9@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ji6jPR39ZKDby+guv8CCAiBLyKbpGz9Kynms9BH9fJU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qMHLk0mVPLDh62etzgMyP6eZPcBVYdgy8HRFyNXzvN/
 eNbJmnSUcrCIMbFICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwET6zjP8U11iwybHYezvuzGn
 T9nzRGlRamX5klDTlf8kzhzdlHX5CyPD+ofiausvTM625m9Z0v6mWsJrzQeuV/un5Hid3aMUWy/
 JCAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_053328_229844_5FB17F1D 
X-CRM114-Status: GOOD (  11.02  )
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

LoongArch is the only architecture that calls
syscall_exit_to_user_mode() from asm. Move the call into C so that this
function can be inlined across all architectures.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++++
 arch/loongarch/kernel/entry.S               | 22 +++++++++----------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++++++++++------
 3 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/asm-prototypes.h b/arch/loongarch/include/asm/asm-prototypes.h
index 51f224bcfc654228ae423e9a066b25b35102a5b9..704066b4f7368be15be960fadbcd6c2574bbf6c0 100644
--- a/arch/loongarch/include/asm/asm-prototypes.h
+++ b/arch/loongarch/include/asm/asm-prototypes.h
@@ -12,3 +12,11 @@ __int128_t __ashlti3(__int128_t a, int b);
 __int128_t __ashrti3(__int128_t a, int b);
 __int128_t __lshrti3(__int128_t a, int b);
 #endif
+
+asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+							   struct pt_regs *regs);
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg);
diff --git a/arch/loongarch/kernel/entry.S b/arch/loongarch/kernel/entry.S
index 48e7e34e355e83eae8165957ba2eac05a8bf17df..2abc29e573810e000f2fef4646ddca0dbb80eabe 100644
--- a/arch/loongarch/kernel/entry.S
+++ b/arch/loongarch/kernel/entry.S
@@ -77,24 +77,22 @@ SYM_CODE_START(handle_syscall)
 SYM_CODE_END(handle_syscall)
 _ASM_NOKPROBE(handle_syscall)
 
-SYM_CODE_START(ret_from_fork)
+SYM_CODE_START(ret_from_fork_asm)
 	UNWIND_HINT_REGS
-	bl		schedule_tail		# a0 = struct task_struct *prev
-	move		a0, sp
-	bl 		syscall_exit_to_user_mode
+	move		a1, sp
+	bl 		ret_from_fork
 	RESTORE_STATIC
 	RESTORE_SOME
 	RESTORE_SP_AND_RET
-SYM_CODE_END(ret_from_fork)
+SYM_CODE_END(ret_from_fork_asm)
 
-SYM_CODE_START(ret_from_kernel_thread)
+SYM_CODE_START(ret_from_kernel_thread_asm)
 	UNWIND_HINT_REGS
-	bl		schedule_tail		# a0 = struct task_struct *prev
-	move		a0, s1
-	jirl		ra, s0, 0
-	move		a0, sp
-	bl		syscall_exit_to_user_mode
+	move		a1, sp
+	move		a2, s0
+	move		a3, s1
+	bl		ret_from_kernel_thread
 	RESTORE_STATIC
 	RESTORE_SOME
 	RESTORE_SP_AND_RET
-SYM_CODE_END(ret_from_kernel_thread)
+SYM_CODE_END(ret_from_kernel_thread_asm)
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 6e58f65455c7ca3eae2e88ed852c8655a6701e5c..98bc60d7c550fcc0225e8452f81a7d6cd7888015 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -14,6 +14,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/entry-common.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
@@ -33,6 +34,7 @@
 #include <linux/prctl.h>
 #include <linux/nmi.h>
 
+#include <asm/asm-prototypes.h>
 #include <asm/asm.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
@@ -47,6 +49,7 @@
 #include <asm/pgtable.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
+#include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
 
@@ -63,8 +66,9 @@ EXPORT_SYMBOL(__stack_chk_guard);
 unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
 
-asmlinkage void ret_from_fork(void);
-asmlinkage void ret_from_kernel_thread(void);
+asmlinkage void restore_and_ret(void);
+asmlinkage void ret_from_fork_asm(void);
+asmlinkage void ret_from_kernel_thread_asm(void);
 
 void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long sp)
 {
@@ -138,6 +142,23 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+asmlinkage void noinstr __no_stack_protector ret_from_fork(struct task_struct *prev,
+							   struct pt_regs *regs)
+{
+	schedule_tail(prev);
+	syscall_exit_to_user_mode(regs);
+}
+
+asmlinkage void noinstr __no_stack_protector ret_from_kernel_thread(struct task_struct *prev,
+								    struct pt_regs *regs,
+								    int (*fn)(void *),
+								    void *fn_arg)
+{
+	schedule_tail(prev);
+	fn(fn_arg);
+	syscall_exit_to_user_mode(regs);
+}
+
 /*
  * Copy architecture-specific thread state
  */
@@ -165,8 +186,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.reg03 = childksp;
 		p->thread.reg23 = (unsigned long)args->fn;
 		p->thread.reg24 = (unsigned long)args->fn_arg;
-		p->thread.reg01 = (unsigned long)ret_from_kernel_thread;
-		p->thread.sched_ra = (unsigned long)ret_from_kernel_thread;
+		p->thread.reg01 = (unsigned long)ret_from_kernel_thread_asm;
+		p->thread.sched_ra = (unsigned long)ret_from_kernel_thread_asm;
 		memset(childregs, 0, sizeof(struct pt_regs));
 		childregs->csr_euen = p->thread.csr_euen;
 		childregs->csr_crmd = p->thread.csr_crmd;
@@ -182,8 +203,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->regs[3] = usp;
 
 	p->thread.reg03 = (unsigned long) childregs;
-	p->thread.reg01 = (unsigned long) ret_from_fork;
-	p->thread.sched_ra = (unsigned long) ret_from_fork;
+	p->thread.reg01 = (unsigned long) ret_from_fork_asm;
+	p->thread.sched_ra = (unsigned long) ret_from_fork_asm;
 
 	/*
 	 * New tasks lose permission to use the fpu. This accelerates context

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
