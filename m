Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD23EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OlzE1gVoIBLKGx4+gyGOrjpwJI+rCdhxJQcRCqmSGn4=; b=FemUtDf/3ua0dX
	cLhEpM8e2Pjsk7oWNMZaMQa9pBLinNuwk3j1gshYREOz0KORrE7xzAlhCZ8Oueq4fguu6I66brGCb
	YDnpJUOePq5ZHdyR3L5TgK5E9T1dQ7pkZAJgPgB88tmrZk40dIaZphf41DejstRrB0+RZuNG7GXao
	ZlFDSZ79g9MvJdg9Uf9RVTavnwFjzNyWSAXlbVxYxzupN6dzjN2Hj0NRS6O5LW/EYrXJpybZNf2w1
	Ud6B4okdPYorhdTIncet+qMQ8MZj81HpX0AOLnbsNox8fUp80t9xDaeBNzjnSHUfxwVkFZJfYaN0J
	oosTyvdJYg25eK1fhZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8qm-007J54-Rf; Thu, 24 Nov 2022 09:48:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8qi-007J2D-QB
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:48:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id j12so1034880plj.5
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 01:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSJT02GxysR6BYQXKIMfpauTo1wXnhrkrV86enzoUvQ=;
        b=PbfD6pupqlnB+jqbGFNH/+bwoPT3T3N8McwothJagyGGzWlLllyQld9G69C7hZcUB1
         28nbBGsYv/VPGY4tUSihDkCsz/e9HYF6zw4kRhUF1ozu4ftr+C4unTZCbD1b0g07fRdf
         ViRy6sfjQNzir+22L5Edt7dbhy021TS1EVonwajhvdlWgxQGIsp6dzFTis81TLA+ldQl
         CdqJ/GW9Moo+wce1Pf9UZ5JCbX194B2aoRO6OqamsENnMCq68fUJMW89sHpoY1CxzP+u
         xrf8/9WCzRSBpH7GSLfHOKrYcAgxCMrOQiVd84dIhj6T8cqwTKfM+77yB1Ss8WeVlV38
         gb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSJT02GxysR6BYQXKIMfpauTo1wXnhrkrV86enzoUvQ=;
        b=jHydH1NozVyAUqaW6drd246lEJjAtYfsDmMTN2daWNwehTqO4yK0xy+TR88RV60XG5
         8YpymOlDjZwt4t9ogAajMBrNB00o6q0qJ8wRUNyWdzr3CNkNyq1OvXqb9R68Q9NchFLH
         xY4JN/VyTDnkZSWEHxYkpTu62KO3taDw3+6LFPXhpZkCm+oHRgnYKe/tecnFnbJfSqH1
         Osgf+wkn8Aqx+0w59FlfaUiJEG9I9bekTpVw8OFoSm1UUUdFCngQPmPWh+M4m0pl4+0i
         nCMqJRuQAEqvZ2kJ0NtJY0UcXTc5CbgSVQ0GbulhVatHZ8nCX/tHRn2mvFHr/wr3SczH
         sNkw==
X-Gm-Message-State: ANoB5pmhuRtWRmdAQceZb1Vyfv/LFyBvOu+wGiW9Gi8c5NWVPat+I08u
	BelPv7iZKRZBZzz+DHTbNgJPD/EF+tuXOg==
X-Google-Smtp-Source: AA0mqf7pVk39l9g9r/yFifSYP6V+DQC/tWIfydgQGpG39Lw8MpKvCbDORtdwommyucyUvtRfLkwoTw==
X-Received: by 2002:a17:902:8604:b0:186:fe2d:f3cb with SMTP id f4-20020a170902860400b00186fe2df3cbmr16824489plo.132.1669283328958;
        Thu, 24 Nov 2022 01:48:48 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090a2f8600b00218fba260e2sm931107pjd.43.2022.11.24.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 01:48:48 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Deepak Gupta <debug@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
Date: Thu, 24 Nov 2022 01:48:45 -0800
Message-Id: <20221124094845.1907443-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_014852_907040_985F9E1F 
X-CRM114-Status: GOOD (  13.46  )
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

commit 31da94c25aea ("riscv: add VMAP_STACK overflow detection") added
support for CONFIG_VMAP_STACK. If overflow is detected, CPU switches to
`shadow_stack` temporarily before switching finally to per-cpu
`overflow_stack`.

If two CPUs/harts are racing and end up in over flowing kernel stack, one
or both will end up corrupting each other state because `shadow_stack` is
not per-cpu. This patch optimizes per-cpu overflow stack switch by
directly picking per-cpu `overflow_stack` and gets rid of `shadow_stack`.

Following are the changes in this patch

 - Defines an asm macro to obtain per-cpu symbols in destination
   register.
 - In entry.S, when overflow is detected, per-cpu overflow stack is
   located using per-cpu asm macro. Computing per-cpu symbol requires
   a temporary register. x31 is saved away into CSR_SCRATCH
   (CSR_SCRATCH is anyways zero since we're in kernel).

Please see Links for additional relevant disccussion and alternative
solution.

Tested by `echo EXHAUST_STACK > /sys/kernel/debug/provoke-crash/DIRECT`
Kernel crash log below

 Insufficient stack space to handle exception!/debug/provoke-crash/DIRECT
 Task stack:     [0xff20000010a98000..0xff20000010a9c000]
 Overflow stack: [0xff600001f7d98370..0xff600001f7d99370]
 CPU: 1 PID: 205 Comm: bash Not tainted 6.1.0-rc2-00001-g328a1f96f7b9 #34
 Hardware name: riscv-virtio,qemu (DT)
 epc : __memset+0x60/0xfc
  ra : recursive_loop+0x48/0xc6 [lkdtm]
 epc : ffffffff808de0e4 ra : ffffffff0163a752 sp : ff20000010a97e80
  gp : ffffffff815c0330 tp : ff600000820ea280 t0 : ff20000010a97e88
  t1 : 000000000000002e t2 : 3233206874706564 s0 : ff20000010a982b0
  s1 : 0000000000000012 a0 : ff20000010a97e88 a1 : 0000000000000000
  a2 : 0000000000000400 a3 : ff20000010a98288 a4 : 0000000000000000
  a5 : 0000000000000000 a6 : fffffffffffe43f0 a7 : 00007fffffffffff
  s2 : ff20000010a97e88 s3 : ffffffff01644680 s4 : ff20000010a9be90
  s5 : ff600000842ba6c0 s6 : 00aaaaaac29e42b0 s7 : 00fffffff0aa3684
  s8 : 00aaaaaac2978040 s9 : 0000000000000065 s10: 00ffffff8a7cad10
  s11: 00ffffff8a76a4e0 t3 : ffffffff815dbaf4 t4 : ffffffff815dbaf4
  t5 : ffffffff815dbab8 t6 : ff20000010a9bb48
 status: 0000000200000120 badaddr: ff20000010a97e88 cause: 000000000000000f
 Kernel panic - not syncing: Kernel stack overflow
 CPU: 1 PID: 205 Comm: bash Not tainted 6.1.0-rc2-00001-g328a1f96f7b9 #34
 Hardware name: riscv-virtio,qemu (DT)
 Call Trace:
 [<ffffffff80006754>] dump_backtrace+0x30/0x38
 [<ffffffff808de798>] show_stack+0x40/0x4c
 [<ffffffff808ea2a8>] dump_stack_lvl+0x44/0x5c
 [<ffffffff808ea2d8>] dump_stack+0x18/0x20
 [<ffffffff808dec06>] panic+0x126/0x2fe
 [<ffffffff800065ea>] walk_stackframe+0x0/0xf0
 [<ffffffff0163a752>] recursive_loop+0x48/0xc6 [lkdtm]
 SMP: stopping secondary CPUs
 ---[ end Kernel panic - not syncing: Kernel stack overflow ]---

Cc: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>
Link: https://lore.kernel.org/linux-riscv/Y347B0x4VUNOd6V7@xhacker/T/#t
Signed-off-by: Deepak Gupta <debug@rivosinc.com>

---
v1 --> v2:
 - asm macro to locate per-cpu symbol requires a temp reg.
   When stack overflow happens, in trap handler we don't have spare regs
   except sp.
   v1 had a place holder in `thread_info` to spill a register.
   v2 instead uses CSR_SCRATCH register because it's free to use.

 - v2 made per-cpu macro more readable.
 - v2 fixed a bug that would've broken 32bit support.

 - v1 called it a fix over 31da94c25aea. v2 calls it alternative/
   optimization solution
---
 arch/riscv/include/asm/asm.h    | 17 ++++++++++
 arch/riscv/kernel/asm-offsets.c |  1 +
 arch/riscv/kernel/entry.S       | 57 ++++++---------------------------
 arch/riscv/kernel/traps.c       | 12 +------
 4 files changed, 29 insertions(+), 58 deletions(-)

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 1b471ff73178..1eb479cb9ae4 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -69,6 +69,7 @@
 
 #ifdef __ASSEMBLY__
 
+#include <asm/asm-offsets.h>
 /* Common assembly source macros */
 
 /*
@@ -80,6 +81,22 @@
 	.endr
 .endm
 
+#ifdef CONFIG_32BIT
+#define PER_CPU_OFFSET_SHIFT 2
+#else
+#define PER_CPU_OFFSET_SHIFT 3
+#endif
+
+.macro asm_per_cpu dst sym tmp
+	REG_L \tmp, TASK_TI_CPU_NUM(tp)
+	slli  \tmp, \tmp, PER_CPU_OFFSET_SHIFT
+	la    \dst, __per_cpu_offset
+	add   \dst, \dst, \tmp
+	REG_L \tmp, 0(\dst)
+	la    \dst, \sym
+	add   \dst, \dst, \tmp
+.endm
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_ASM_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index df9444397908..a7da051159cf 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -38,6 +38,7 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
 
+	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
 	OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..2e90d9ccddd0 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -10,9 +10,11 @@
 #include <asm/asm.h>
 #include <asm/csr.h>
 #include <asm/unistd.h>
+#include <asm/page.h>
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
 #include <asm/errata_list.h>
+#include <linux/sizes.h>
 
 #if !IS_ENABLED(CONFIG_PREEMPTION)
 .set resume_kernel, restore_all
@@ -404,54 +406,15 @@ handle_syscall_trace_exit:
 
 #ifdef CONFIG_VMAP_STACK
 handle_kernel_stack_overflow:
-	la sp, shadow_stack
-	addi sp, sp, SHADOW_OVERFLOW_STACK_SIZE
+	/* we reach here from kernel context, sscratch must be 0 */
+	csrrw x31, CSR_SCRATCH, x31
+	asm_per_cpu sp, overflow_stack, x31
+	li x31, OVERFLOW_STACK_SIZE
+	add sp, sp, x31
+	/* zero out x31 again and restore x31 */
+	xor x31, x31, x31
+	csrrw x31, CSR_SCRATCH, x31
 
-	//save caller register to shadow stack
-	addi sp, sp, -(PT_SIZE_ON_STACK)
-	REG_S x1,  PT_RA(sp)
-	REG_S x5,  PT_T0(sp)
-	REG_S x6,  PT_T1(sp)
-	REG_S x7,  PT_T2(sp)
-	REG_S x10, PT_A0(sp)
-	REG_S x11, PT_A1(sp)
-	REG_S x12, PT_A2(sp)
-	REG_S x13, PT_A3(sp)
-	REG_S x14, PT_A4(sp)
-	REG_S x15, PT_A5(sp)
-	REG_S x16, PT_A6(sp)
-	REG_S x17, PT_A7(sp)
-	REG_S x28, PT_T3(sp)
-	REG_S x29, PT_T4(sp)
-	REG_S x30, PT_T5(sp)
-	REG_S x31, PT_T6(sp)
-
-	la ra, restore_caller_reg
-	tail get_overflow_stack
-
-restore_caller_reg:
-	//save per-cpu overflow stack
-	REG_S a0, -8(sp)
-	//restore caller register from shadow_stack
-	REG_L x1,  PT_RA(sp)
-	REG_L x5,  PT_T0(sp)
-	REG_L x6,  PT_T1(sp)
-	REG_L x7,  PT_T2(sp)
-	REG_L x10, PT_A0(sp)
-	REG_L x11, PT_A1(sp)
-	REG_L x12, PT_A2(sp)
-	REG_L x13, PT_A3(sp)
-	REG_L x14, PT_A4(sp)
-	REG_L x15, PT_A5(sp)
-	REG_L x16, PT_A6(sp)
-	REG_L x17, PT_A7(sp)
-	REG_L x28, PT_T3(sp)
-	REG_L x29, PT_T4(sp)
-	REG_L x30, PT_T5(sp)
-	REG_L x31, PT_T6(sp)
-
-	//load per-cpu overflow stack
-	REG_L sp, -8(sp)
 	addi sp, sp, -(PT_SIZE_ON_STACK)
 
 	//save context to overflow stack
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f3e96d60a2ff..eef3a87514c7 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -208,18 +208,8 @@ int is_valid_bugaddr(unsigned long pc)
 #endif /* CONFIG_GENERIC_BUG */
 
 #ifdef CONFIG_VMAP_STACK
-static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
+DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
 		overflow_stack)__aligned(16);
-/*
- * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
- * to get per-cpu overflow stack(get_overflow_stack).
- */
-long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
-asmlinkage unsigned long get_overflow_stack(void)
-{
-	return (unsigned long)this_cpu_ptr(overflow_stack) +
-		OVERFLOW_STACK_SIZE;
-}
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
