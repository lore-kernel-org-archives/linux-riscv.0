Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1606C0218D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 22:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K574FHPasfcBoR7F0SLDoTWHHesWTUHmk6Tjlypguyo=; b=p1eWIIzbmdst2z
	J2+UhLcfzKEk8KWEmCmaZlop1KiJwExvJxnsf8FxGQAdXFFxQRs/fZ2C0/zkQrS2YFYgsIH+C4tgW
	vdkDbJES7qjM9BdiKnR1vLG3ntm44ACdPBfqwIk+XVbZUnMZIkfE2gP/OQIeT7GqBYtVCAiqGjx6Z
	Pbjv+ebWDtc91D/15VIhue9Wz/ftuqX5ycW1v83jnh4pVGaPeYnSqYwfWX1AjCt55VVe+Kkci4Kel
	olWdtH8DUcnie4vvapjGp1Q/pgLUm+tT6FGRl4DMyETTOeiczPp+4XLFLTJcBw8nxSjQhADVAZk46
	OhCvUXs5eSjq1Mhan9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSDi-0000000Fcv4-494B;
	Fri, 24 Jan 2025 22:32:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSD5-0000000Fci1-485Q
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 22:31:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21669fd5c7cso47017575ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 14:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757891; x=1738362691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=WB/64OeaRttlNTA80o+oXibTA+r6hvqkPX7dsEHNsJlb6r8od6ZdV3deRQqb19CfJJ
         WysFQXtCZYne27uGVzINte7d/cqdjVUD1GOwLWUcaubfRvldjYWfISmVbUAb9X4V+vHm
         Iq+pfixx3FTlxTf+H0kPKra2s9YNQURJO8JjLSNdSrvwePfLAyY2XgrJj8dbUm2fHtim
         reU+xB9iZePJLcRSoLAFmVqfjftfHzIfiFUzqRyHgSmevQrGiv9ARTQSXMFUY9hwIh+g
         R2CRsGeoYYPSKLfrIlN699TzESCnDsELDGbtMlK03bAof0amMN3rZjP2zj/uNVVXNwIQ
         jqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757891; x=1738362691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=SAD5jYCzhAlX6MUxqndbWqu2wz/n+g9LxYX1N8vC5Z8nGO2m1kITNSeoEEqyNa1mc9
         qVuiHWeCsjPp8/y8V91ZMiHdWpUPLwMHyrFwEc8RthuiennaLV3fxuclLpnd9Ib+Jk0c
         p20g+VrE52AMdhv6Zp0aZWrE3xgHzpzri+ekz3gpuE1S6sNOYvnKKn/oLO1MjirYnM3C
         Ega/PxejqmHN3Gysp6QBKOXx4MZIWCncCYp8GStQAigUsLHL442g2e2t13yhptEG3VWy
         0tzMyYNnazmr+jeSKWhAmsjmtnobXgmq9HqMciBh5yqgWLiwVq7qyRxNlrIR8GnzDWRu
         MF2w==
X-Gm-Message-State: AOJu0YyyxSXkB5t7p0z8tX0SE/j2GHyoC5mCsLOPylbo7VjSRw92GFpO
	veABxQ0kIqL2hgcpFKxRF9Px4guNZ5rIVxnooNzF+/5I4JQhIMhfzSLUOazo8LE=
X-Gm-Gg: ASbGnctZ5v5ZRp9nbiyZZk9/8IegvepPPUeMkWy7IkQSrnevIfHp1nFL/gQmb1XkGDS
	mvpsHAYMEcbGFjEyJlABUTKYpfhWki0frIwuOxpt4jEcf57lhrcEnemjnIXrS1HNo2XWBtGncAF
	K2znoL2jx9QYb3cSwJ8Trg5abJzj2VDLQIdI3RyeMJG1hW2/GUqW67eG2LHfqThc2V3AJQzNJRk
	U5r1Kwx1zMDzx+obiAtA8Zo+RSXf1l4YZk2N8+xPZTKhRiNjMLDv2/iinZDqegJv6RixlzoBA4t
	BUsNZ4tOiIaX9+l/mdtb
X-Google-Smtp-Source: AGHT+IFtzVMWJA2cJy0hbK7qGJLRhh8SGaR/f/uRZsSLRq3SYx5yoyUu7AJhe3KVtuMpObcfJz9puA==
X-Received: by 2002:a05:6a21:6816:b0:1ea:ddd1:2fa7 with SMTP id adf61e73a8af0-1eb2158717fmr53240943637.28.1737757891304;
        Fri, 24 Jan 2025 14:31:31 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:30 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 24 Jan 2025 14:31:01 -0800
Subject: [PATCH v3 3/4] LoongArch: entry: Migrate ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250124-riscv_optimize_entry-v3-3-869f36b9e43b@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ji6jPR39ZKDby+guv8CCAiBLyKbpGz9Kynms9BH9fJU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkT0/mHcH/Kxl2rj74eeSTNt3rYnZr36Jna5htr7++
 O1Ro493O0pZGMS4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZiIkTcjw9S4jXpMMo+lL3sr
 a8xT8BPxbFnM4bl+ccvUqcelOna/WMHwz8Qwk9Fdr6hpoQRPJWPj6+3vb1/4c3NOAcuPstNT9Zp
 62QA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_143132_019332_B2213519 
X-CRM114-Status: GOOD (  10.79  )
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
