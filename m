Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F59DC36002
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K574FHPasfcBoR7F0SLDoTWHHesWTUHmk6Tjlypguyo=; b=xK5Y5Y+09YV9SJ
	HxF4CYIfL/MV/4Z6a5rznmNj/SfymmzKdGExvoYwYuqCwVCn0JkjisWq7inUHeXyiuCdmlddDMDUF
	NCCkjzYaVV377Gm3ubnyYp2im15pqOrxDuV20evDmFu2ZsNm8mmy3gKR3RhLAbkUD2ifw92Ixszkl
	Dte6/ctSmbemfFM+kp1eM53y3XNtt0p2Q/J99IixGM9Xt/p4mjpgnoD4WIVvNQw82KKG+yFYuhwMo
	R75d+N4nXCHPMYVmyhHX1yVlj/GZrawsbYqUGBw8TkLbzSls7grWfs7E1Cibp0iAgoHbSLadomEMq
	kPIwMuLxT06pvwrms3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJjh-0000000CoGY-1zKD;
	Thu, 20 Mar 2025 17:31:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJi8-0000000Co07-0Qa4
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 17:29:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22423adf751so23194235ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742491779; x=1743096579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=BZAnZmSiSj5HC0gvebDmVaHkPanidgJTPDFnqpgH3Pkr0AGJvVkfciWIgVDx61oD++
         rD3JAdhirG7EdreSWYtMCNTUlWpqxYcMyTMk259I6xKLIwYaQ3eRMDqlP/jkMR3HvIyH
         FrweczU/LGNYJFO8Zy9qQPdq+tR0AK821P/oL9gR0imFbY7F4pQkn7wxhYRd3las36nG
         NiRIGpEwB/qXq2Eanxm4434Q35MmYimUzGylyXhL6qJIAAhjppBhxb/Vcuo3VL9td5LI
         Sn5SSDKYmI42g9Me2CSf/vbcO1TsFj2oPj9O9xmsWOdPMptuH2jwgN1UaAkR4FhXtZoh
         ND7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491779; x=1743096579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+zSCWqqyKc551VynXTcxotuXwo5gv9XFD/e4PnRFpw=;
        b=ZGCQOzTkvFkGKwxIwQrR3J4fF7RX+tTNoJpHW8IY8ZHpl87Zpi54Dr0P7AWrfLF2XV
         YyWBJukj2gWrkofypue+SGKm5L0uOdFw/XBFUNaXiV7sBXBHCYzotNBiBqmLzVPPKKBz
         kwmaDSmeyuSkFweIfVBEOoY3FzU9XpMFNAFQ4SbPjS8akqoJDKbB28Mfl1aCJR/BPKhB
         3XaqU39qiL9/FkI2F5cuh3CN4xlPxdoj1nXjrGNQrjhHZlPOb4xRq1Sq/E/+lOXR+3Se
         skSnnS17Heye69vIrAaCZRRNPhD+Fchhtv304cyzFhQpivOpNTWcrAEI2mkMGsRjKxPz
         0LuQ==
X-Gm-Message-State: AOJu0YxGBjCzWzfVD8m723vjF/bQ2162WP4zR+EERW4MOQqMieUbCRTw
	0RFf7OF7jnSTe7CmQ7FBCfoyqGXWJGdxzB7SBx/nM98ZTgSOcHymQGXF2yMIK+U=
X-Gm-Gg: ASbGnctoFZLbohwsADox+BcOlXXplTZUaKET3lSSE3tnkS6a7jVl6X2SUBNfDKCrxB/
	pN5myz68im9nHaCeVrcpmEM2pOYQ69ziL1JuOERiJ5/sM22LP2LMzokBoIz4p1pngpUSoU4ATci
	9SV1zqR+rxXQ3Aoj7ZBWIQXvCEFE7SCFPNR1Ina6wGcfC6w/JdZxvKNpT27P5CQeKwMG1YK8QBr
	na+NDI7uDW9s/AbsqPwS4gAgTZK1k0EyXEvFy8urmZtY4TyD20kNZy4CTtbVhQ0UDViRgszznwf
	rhtN/ZsO7BKlYIzOVGNbipNZJ8Bh6H6YMJT7nsdaZSFlZHWhv3nhApYdxmp9
X-Google-Smtp-Source: AGHT+IFgzXwvWfdEvhnXyB7FqFqJoH2L77sDPXSbxso5gHzs8FqkCZv0zxAIf/4AajBrO5cX5nE4Pg==
X-Received: by 2002:a17:902:d4ca:b0:223:4537:65b1 with SMTP id d9443c01a7336-22780e10a22mr3120205ad.36.1742491779220;
        Thu, 20 Mar 2025 10:29:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45994sm554075ad.81.2025.03.20.10.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:29:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 20 Mar 2025 10:29:23 -0700
Subject: [PATCH v6 3/4] LoongArch: entry: Migrate ret_from_fork() to C
MIME-Version: 1.0
Message-Id: <20250320-riscv_optimize_entry-v6-3-63e187e26041@rivosinc.com>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
In-Reply-To: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5547; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=ji6jPR39ZKDby+guv8CCAiBLyKbpGz9Kynms9BH9fJU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qdgOoXfxklWmUeR7VW8t5XaC5xnzvj6V8j4yka7OLlO
 tGi2tM6SlkYxLgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmMiXUwx/5S/H2FwUSSl/Ne3W
 8hjV4+nM3tVSUfPCTp9f7xxsL/qviZFh27yj6fsXnfmS+/d+s8uPTS2iK39NPycqaBbEabPDIjK
 dFwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_102940_148822_AD2F3236 
X-CRM114-Status: GOOD (  11.01  )
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
