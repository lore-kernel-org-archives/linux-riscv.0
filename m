Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7A7E7F14F
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D94ms1HNUKa7PU0w/SOYrtT+27aAwy6pEzDqO4m9M2k=; b=A8P3y+cU8vOuf2VDFsLqBdrzLa
	z2BSRfU5ux9wJNztBKUbIBIEPPJQgH7EHJkexdh/ZbqBiKp4z20d+UEiZWogu+FdFMo+uI2yMZ5fi
	qto//uHQQALWzPSJY1B79l9K/HEzzx9vhgJlvfgxYlplIyaJRk6e9AQC2pGjG8C6o0E4lOByLlAmt
	g74kJ72UOPiV1zER2zOrNYrMWYfeOA7jj568UkhWqCzoy134csRZMD1gpP+yjKKMg/sXdGp56Ev/q
	FvPORRzGwi6cq+3fIA6mqbyvmIrbYKrDy/cwvviX9cxbuWrL1BAl5n6pY570UcEkOzqI//gctZRF5
	sY3eL02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKR-001s6F-0I;
	Wed, 27 Sep 2023 22:48:23 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qldKE-001rzc-13
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 22:48:15 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d8486b5e780so18879087276.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 15:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695854889; x=1696459689; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UjogArc4Ol2Tu2wVu5HYhWlgdLzR2HyaaCEJTIGL1ME=;
        b=Jc4y3RSToAjn3VGzoLlVZyOIggBuOV+QSwq5dKFJb9jhGzNslrZb8Ge3ENZIOEPB8C
         5UwddWnkN+VFgqU1yo/eNVyvdZyEDe/IGiOAVy2DvCK7Z0xAH7ydQmh1L0VsVt5FrlBZ
         NvUBaVcio/z4e11Hd7hWA5cOHDIK+fg1vmJDpz4GnTvNB50MNTWfEr22yRbkbzwnPdnx
         WcRa7B0ZBWHSkfGLppDIMC9Hwobcr4Zz9Tb1kspVbcc+PYAlaBMVTXFK9iMob7qqS6OV
         xA/Im0rQ6tpqIeM/WW1m7Wg3ka33FlnwVG/7MZPK8DVjzOQ+V/oNk9PgfIvza8zyDp+W
         KQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854889; x=1696459689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjogArc4Ol2Tu2wVu5HYhWlgdLzR2HyaaCEJTIGL1ME=;
        b=hOWjHYX0xwGnCU5ZOtwugqeBB2bVfYkS+x0VzCKBd1hFxIQi0mWfjm74qoxkIim0/n
         08XJfaCb8ULDK8+64guxRkhzpxPfa33gYalUviCj1D99ItfXDY02BnbzEZ3yybmjRyHb
         pLYb++9PzwciCEoTtZuOSq8XzEBnOuV3SvO4QxhqeZ0gK1E12axuAnqvRJJp252r8Zxm
         FM8qqhE/5wVZtrLoZHCgMbNmlenF3yqH6Ji39c263cYTHLSXFOd9ITNqEK73qS6RI1r9
         6p/uL/NcALd08ubJoxwhN4f3Ub8IABTgbkrVBLcAdT9QlCImVZiu/Tm3faPRSta0m5Y6
         w2rg==
X-Gm-Message-State: AOJu0YyUO0h3da3Ystuvop5pKE/YV0Lu80NMJT/SYuDuI4BRCflKzEB8
	wHVhQ1CBapn26aDj3tWOparan+ZetiRWA2VKZqs=
X-Google-Smtp-Source: AGHT+IGuLzBBzEnk//HcBoJ99TCQ7ov8zQaT/zHqVxs9oyov7vsbiXFCeQcHtqa+bclScLfUtyRWNFqZfXid3mMRvZU=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:4dc6:0:b0:d81:90b6:cedc with SMTP
 id a189-20020a254dc6000000b00d8190b6cedcmr45254ybb.3.1695854888882; Wed, 27
 Sep 2023 15:48:08 -0700 (PDT)
Date: Wed, 27 Sep 2023 22:48:02 +0000
In-Reply-To: <20230927224757.1154247-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230927224757.1154247-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=9659; i=samitolvanen@google.com;
 h=from:subject; bh=yw/kz6qVoLV9/zzAHdEXeH4UXswKqFcfKUE7jb2zKUk=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFLEds/VsrP50aF0lwBOaJwOiBeaGJNlMIHWXo
 wP23QvFjeiJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRSxHQAKCRBMtfaEi7xW
 7sGeC/sFu6YRgLELFq8ildZNtq5ri2wh4h9UBxspPil3xG3H36TktsRnR9jN1ccehLwGW+wBlWq
 nEKL3mAp8N18Y3rQoaCpUi2cfT9TfKf6DbmtAxsvvfeeg9UhSXlolr3XwtwX2+roATGNZeYhoNE
 59CEcqS8CxiObRZZqPmtFyGqMvWYxfK/Zbxmq56jjGdAKy9SWmzDJRGEakAlg9AQSf4s0AIkvAN
 2TLqF2dHl2q/DW0omjsRQdE/peSPZwhwitfGh4VTcSsH5EudR+R50jDNp3cGdyfmwMIAzTdlK0C
 dTI3uGWf9zkVd9xPvT6AGpAynfAdv2Txrha2bEG8WY191seBtnjWuQDgn0ggno6kdGe0P3PGGp1
 wucGs64jnPo+i3opdERML+XpfWhjwSNgCVtbEStQJkrA9O7o2hbuC/cfGEBryOpOjYhfv9FLRNc Bj8DSGKv+cCvmY+ULbeW3oo1Mv1nSvvJM0B2V/fUWIGMhzWmylMvB0Md8n1zzQoGzfuvQ=
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230927224757.1154247-12-samitolvanen@google.com>
Subject: [PATCH v4 4/6] riscv: Implement Shadow Call Stack
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_154810_425427_2202AD69 
X-CRM114-Status: GOOD (  20.92  )
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

Implement CONFIG_SHADOW_CALL_STACK for RISC-V. When enabled, the
compiler injects instructions to all non-leaf C functions to
store the return address to the shadow stack and unconditionally
load it again before returning, which makes it harder to corrupt
the return address through a stack overflow, for example.

The active shadow call stack pointer is stored in the gp
register, which makes SCS incompatible with gp relaxation. Use
--no-relax-gp to ensure gp relaxation is disabled and disable
global pointer loading.  Add SCS pointers to struct thread_info,
implement SCS initialization, and task switching

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/Kconfig                   |  6 ++++
 arch/riscv/Makefile                  |  4 +++
 arch/riscv/include/asm/asm.h         |  6 ++++
 arch/riscv/include/asm/scs.h         | 47 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/thread_info.h | 13 ++++++++
 arch/riscv/kernel/asm-offsets.c      |  3 ++
 arch/riscv/kernel/entry.S            | 11 +++++++
 arch/riscv/kernel/head.S             |  4 +++
 arch/riscv/kernel/vdso/Makefile      |  2 +-
 arch/riscv/purgatory/Makefile        |  4 +++
 10 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/scs.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6d..2f14ccb5fb01 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -48,6 +48,7 @@ config RISCV
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
+	select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW_CALL_STACK
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
@@ -174,6 +175,11 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_GCC
 	depends on $(cc-option,-fpatchable-function-entry=8)
 
+config HAVE_SHADOW_CALL_STACK
+	def_bool $(cc-option,-fsanitize=shadow-call-stack)
+	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
+	depends on $(ld-option,--no-relax-gp)
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 1329e060c548..304b94446507 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -55,6 +55,10 @@ endif
 endif
 endif
 
+ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
+	KBUILD_LDFLAGS += --no-relax-gp
+endif
+
 # ISA string setting
 riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index f34dd1a526a1..b0487b39e674 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -109,6 +109,11 @@
 	REG_L \dst, 0(\dst)
 .endm
 
+#ifdef CONFIG_SHADOW_CALL_STACK
+/* gp is used as the shadow call stack pointer instead */
+.macro load_global_pointer
+.endm
+#else
 /* load __global_pointer to gp */
 .macro load_global_pointer
 .option push
@@ -116,6 +121,7 @@
 	la gp, __global_pointer$
 .option pop
 .endm
+#endif /* CONFIG_SHADOW_CALL_STACK */
 
 	/* save all GPs except x1 ~ x5 */
 	.macro save_from_x6_to_x31
diff --git a/arch/riscv/include/asm/scs.h b/arch/riscv/include/asm/scs.h
new file mode 100644
index 000000000000..94726ea773e3
--- /dev/null
+++ b/arch/riscv/include/asm/scs.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_SCS_H
+#define _ASM_SCS_H
+
+#ifdef __ASSEMBLY__
+#include <asm/asm-offsets.h>
+
+#ifdef CONFIG_SHADOW_CALL_STACK
+
+/* Load init_shadow_call_stack to gp. */
+.macro scs_load_init_stack
+	la	gp, init_shadow_call_stack
+	XIP_FIXUP_OFFSET gp
+.endm
+
+/* Load task_scs_sp(current) to gp. */
+.macro scs_load_current
+	REG_L	gp, TASK_TI_SCS_SP(tp)
+.endm
+
+/* Load task_scs_sp(current) to gp, but only if tp has changed. */
+.macro scs_load_current_if_task_changed prev
+	beq	\prev, tp, _skip_scs
+	scs_load_current
+_skip_scs:
+.endm
+
+/* Save gp to task_scs_sp(current). */
+.macro scs_save_current
+	REG_S	gp, TASK_TI_SCS_SP(tp)
+.endm
+
+#else /* CONFIG_SHADOW_CALL_STACK */
+
+.macro scs_load_init_stack
+.endm
+.macro scs_load_current
+.endm
+.macro scs_load_current_if_task_changed prev
+.endm
+.macro scs_save_current
+.endm
+
+#endif /* CONFIG_SHADOW_CALL_STACK */
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_SCS_H */
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index d18ce0113ca1..574779900bfb 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -57,8 +57,20 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+#ifdef CONFIG_SHADOW_CALL_STACK
+	void			*scs_base;
+	void			*scs_sp;
+#endif
 };
 
+#ifdef CONFIG_SHADOW_CALL_STACK
+#define INIT_SCS							\
+	.scs_base	= init_shadow_call_stack,			\
+	.scs_sp		= init_shadow_call_stack,
+#else
+#define INIT_SCS
+#endif
+
 /*
  * macros/functions for gaining access to the thread information structure
  *
@@ -68,6 +80,7 @@ struct thread_info {
 {						\
 	.flags		= 0,			\
 	.preempt_count	= INIT_PREEMPT_COUNT,	\
+	INIT_SCS				\
 }
 
 void arch_release_task_struct(struct task_struct *tsk);
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 0af8860f9d68..a03129f40c46 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -39,6 +39,9 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+#ifdef CONFIG_SHADOW_CALL_STACK
+	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
+#endif
 
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 6215dcf2e83b..52793193a763 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -9,6 +9,7 @@
 
 #include <asm/asm.h>
 #include <asm/csr.h>
+#include <asm/scs.h>
 #include <asm/unistd.h>
 #include <asm/page.h>
 #include <asm/thread_info.h>
@@ -77,6 +78,9 @@ _save_context:
 	/* Load the global pointer */
 	load_global_pointer
 
+	/* Load the kernel shadow call stack pointer if coming from userspace */
+	scs_load_current_if_task_changed s5
+
 	move a0, sp /* pt_regs */
 	la ra, ret_from_exception
 
@@ -123,6 +127,9 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	addi s0, sp, PT_SIZE_ON_STACK
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
 
+	/* Save the kernel shadow call stack pointer */
+	scs_save_current
+
 	/*
 	 * Save TP into the scratch register , so we can find the kernel data
 	 * structures again.
@@ -275,6 +282,8 @@ SYM_FUNC_START(__switch_to)
 	REG_S s9,  TASK_THREAD_S9_RA(a3)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
+	/* Save the kernel shadow call stack pointer */
+	scs_save_current
 	/* Restore context from next->thread */
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
 	REG_L sp,  TASK_THREAD_SP_RA(a4)
@@ -292,6 +301,8 @@ SYM_FUNC_START(__switch_to)
 	REG_L s11, TASK_THREAD_S11_RA(a4)
 	/* The offset of thread_info in task_struct is zero. */
 	move tp, a1
+	/* Switch to the next shadow call stack */
+	scs_load_current
 	ret
 SYM_FUNC_END(__switch_to)
 
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index a0484d95d8fb..18f97ec0f7ed 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -14,6 +14,7 @@
 #include <asm/cpu_ops_sbi.h>
 #include <asm/hwcap.h>
 #include <asm/image.h>
+#include <asm/scs.h>
 #include <asm/xip_fixup.h>
 #include "efi-header.S"
 
@@ -153,6 +154,7 @@ secondary_start_sbi:
 	XIP_FIXUP_OFFSET a3
 	add a3, a3, a1
 	REG_L sp, (a3)
+	scs_load_current
 
 .Lsecondary_start_common:
 
@@ -289,6 +291,7 @@ clear_bss_done:
 	la sp, init_thread_union + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
 	addi sp, sp, -PT_SIZE_ON_STACK
+	scs_load_init_stack
 #ifdef CONFIG_BUILTIN_DTB
 	la a0, __dtb_start
 	XIP_FIXUP_OFFSET a0
@@ -307,6 +310,7 @@ clear_bss_done:
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+	scs_load_current
 
 #ifdef CONFIG_KASAN
 	call kasan_early_init
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 6b1dba11bf6d..48c362c0cb3d 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -36,7 +36,7 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
 endif
 
 # Disable -pg to prevent insert call site
-CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
 
 # Disable profiling and instrumentation for VDSO code
 GCOV_PROFILE := n
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index 9e6476719abb..6a3c16bd5ca3 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -81,6 +81,10 @@ ifdef CONFIG_CFI_CLANG
 PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_CFI)
 endif
 
+ifdef CONFIG_SHADOW_CALL_STACK
+PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_SCS)
+endif
+
 CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
 CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
 
-- 
2.42.0.515.g380fc7ccd1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
