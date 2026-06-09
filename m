Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30636CD8CB9
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6hSWxu/5t7kT75YCTLsuKB4Zgd88NTdu03J5Cth1co=; b=NYEFyPNWrfS1nf
	tOP8yN+aC2CIqaa1enn6cH8ibcHUWHqfOMFHAgE5ofWXd/73DjYrCQoHFcRMo5HKRGYxjDtk1SgXG
	lFMHCMUwe2g3g3hJWmLCnlZDpgQ4tx2pMBaIa+8niRiANlkzoMVDBdsljyyTiX6WD0Q+HkYvyqgtg
	gwtTiiD+U9QWVvz9Yv/0h9QIhANnu4BxAG3L+1qDAiZQTrgdP2K9iXQECu9s6LYyPUV9Wr9KtgFle
	Rr8zRNJ5oUmtLxtsA3Jjc2aHM7cVk8PMaJCaO4OOQ5tZqZ5FVNcWFTu6sAWBbST9r663DIxdH9BgW
	F9+KPjfZShXubbks5JTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpyc-00000004rrt-3D5N;
	Tue, 09 Jun 2026 06:30:18 +0000
Received: from out199-13.us.a.mail.aliyun.com ([47.90.199.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpyZ-00000004rq4-1YFY
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780986605; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=xAaEO92Rfu0wImlY8RJ412cVfpYMO+FupvmAWuC+X5w=;
	b=kxc2m4uRDbO9A0GXVJPbMNhq6ycHUJPOfGW/RlnWkQr43p3jobqLQj+5PqDK2fn885YusZOZ4IHSPGHHAfmog3MEJ07a8hQKK3FRkOlbrU2mjontFvYJ5OTKNQBUQ4IXRFRo9oLAuUT+IphkBhk2AA4D94SkXqPMthNdqF8WPVs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X4VD4z7_1780986599;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X4VD4z7_1780986599 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 14:30:01 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	oliver.yang@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v3 0/8] riscv: Add reliable stack unwinding for livepatch
Date: Tue,  9 Jun 2026 14:29:51 +0800
Message-ID: <cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528082310.1994388-1-wanghan@linux.alibaba.com>
References: <20260528082310.1994388-1-wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_233016_584060_E6C2D7B5 
X-CRM114-Status: GOOD (  26.10  )
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

Hi,

This is v3 of the RISC-V reliable stack unwinding series for livepatch.

The series is still based on riscv/for-next commit 0ca1724b56af
("riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT").

Patch 1 fixes the build-time mcount sorting regression for RISC-V
patchable function entries. It is independent from the livepatch
enablement work and can be picked separately if that is preferred.

Patches 2-7 add the reliable frame-pointer unwinder in reviewable
steps, following the arm64 metadata-frame-record and kunwind model but
using the RISC-V {fp, ra} frame-record convention.

Patch 8 adds the RISC-V syscall wrapper prefix used by the livepatch
selftest module.

Problem
=======

Livepatch relies on HAVE_RELIABLE_STACKTRACE to decide whether a task
can safely switch to a patched implementation. RISC-V has a
frame-pointer stack walker, but it is not yet reliable enough for
livepatch. Three pieces are missing:

  * arch_stack_walk_reliable() itself, plus the strict stack-bound
    checks and forward-progress invariants a reliable unwinder needs.
  * Explicit unwind metadata at exception, task-entry and IRQ-stack
    boundaries, so the unwinder can distinguish a final user-to-kernel
    transition from a nested kernel pt_regs frame instead of guessing
    from return addresses.
  * Agreement between the ftrace function-graph, perf callchain and
    mcount paths and the same frame-record assumptions used by the
    reliable unwinder.

There is also a prerequisite ftrace issue on the current riscv/for-next
base. Commit 0ca1724b56af ("riscv: ftrace: select
HAVE_BUILDTIME_MCOUNT_SORT") enabled build-time sorting of the mcount
table. RISC-V uses patchable function entries, and the recorded patch
site is placed before the function symbol. scripts/sorttable currently
does not take that RISC-V layout into account, so valid ftrace sites
can be filtered out before the kernel boots.

Solution
========

Patch 1 fixes scripts/sorttable so the RISC-V build-time mcount sort
path accepts patchable function entries which precede the function
symbol. The fix carries a Fixes: tag for commit 0ca1724b56af ("riscv:
ftrace: select HAVE_BUILDTIME_MCOUNT_SORT") and is otherwise
independent.

Patches 2-7 add the reliable unwinder in small, individually
reviewable steps. The design follows the same FP + metadata model
arm64 already uses for livepatch in production: the metadata frame
record in pt_regs, the unwind-state stack-bound bookkeeping, the
exception boundary handling, and the fgraph / kretprobe return-address
recovery are direct adaptations of arch/arm64/kernel/stacktrace.c,
retargeted to the RISC-V {fp, ra} frame record convention.

Changes since v2
================

  * Patch 1:
    - Split the arm64-only RELA weak-function fixup comment from the
      arm64/RISC-V shared patchable-entry offset handling.
    - Add Reviewed-by tags from Steven, Shuai and Chen Pei.

  * Patch 2:
    - Initialize frame-record metadata in the kernel stack overflow
      path as FRAME_META_TYPE_PT_REGS.
    - Explicitly set user-fork pt_regs metadata to
      FRAME_META_TYPE_FINAL.
    - Expand the commit log to document that the call_on_irq_stack
      frame-record adjustment fixes a latent RV32 issue where the
      aligned stack slot is larger than the raw {fp, ra} record.

  * Patch 3:
    - Disable KCOV instrumentation for stacktrace.o as well, and update
      the subject and commit log accordingly.

  * Patch 4:
    - Clarify the s0 preservation rationale in the commit log.
    - Add Shuai's Reviewed-by tag.

  * Patch 5:
    - Fix the new header copyright year.
    - Add Shuai's Reviewed-by tag.

  * Patch 6:
    - Keep state->regs set after kunwind_next_regs_pc(), matching
      kunwind_init_from_regs() and the arm64 reference.
    - Use RISC-V "ra" terminology instead of "LR" in a reliable
      unwinder comment.

  * Patch 7:
    - Document that the 64BIT dependency is a tested-scope guard rather
      than a hard technical requirement, and can be relaxed after RV32
      receives equivalent coverage.
    - Add Shuai's Reviewed-by tag.

  * Patch 8:
    - Add Reviewed-by tags from Marcos and Shuai.

v2: https://lore.kernel.org/all/20260528082310.1994388-1-wanghan@linux.alibaba.com/
v1: https://lore.kernel.org/all/20260527123530.2593918-1-wanghan@linux.alibaba.com/

Wang Han (8):
  scripts/sorttable: Handle RISC-V patchable ftrace entries
  riscv: stacktrace: Add frame record metadata
  riscv: stacktrace: disable KASAN and KCOV instrumentation for
    stacktrace.o
  riscv: ftrace: always preserve s0 in dynamic ftrace register frame
  riscv: stacktrace: introduce stack-bound tracking helpers
  riscv: stacktrace: switch to frame-pointer based unwinder
  riscv: Kconfig: enable HAVE_RELIABLE_STACKTRACE and HAVE_LIVEPATCH
  selftests/livepatch: Add RISC-V syscall wrapper prefix

 arch/riscv/Kconfig                            |   4 +
 arch/riscv/include/asm/ptrace.h               |   9 +
 arch/riscv/include/asm/stacktrace.h           |  65 +-
 arch/riscv/include/asm/stacktrace/common.h    | 159 +++++
 arch/riscv/include/asm/stacktrace/frame.h     |  53 ++
 arch/riscv/kernel/Makefile                    |   6 +
 arch/riscv/kernel/asm-offsets.c               |   4 +
 arch/riscv/kernel/entry.S                     |  43 +-
 arch/riscv/kernel/ftrace.c                    |   6 +-
 arch/riscv/kernel/head.S                      |  23 +
 arch/riscv/kernel/mcount-dyn.S                |   4 -
 arch/riscv/kernel/perf_callchain.c            |   2 +-
 arch/riscv/kernel/process.c                   |  33 +-
 arch/riscv/kernel/stacktrace.c                | 559 +++++++++++++++---
 scripts/sorttable.c                           |  11 +-
 .../livepatch/test_modules/test_klp_syscall.c |   2 +
 16 files changed, 872 insertions(+), 111 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace/common.h
 create mode 100644 arch/riscv/include/asm/stacktrace/frame.h

Range-diff against v2:
1:  42147458c15b ! 1:  e93530c5718e scripts/sorttable: Handle RISC-V patchable ftrace entries
    @@ Commit message
     
         Fixes: 0ca1724b56af ("riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT")
         Suggested-by: Steven Rostedt (Google) <rostedt@goodmis.org>
    +    Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
    +    Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
    +    Reviewed-by: Chen Pei <cp0613@linux.alibaba.com>
         Link: https://lore.kernel.org/all/20260527113028.4b21a5de@fedora/
         Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
     
    @@ scripts/sorttable.c: static int do_file(char const *const fname, void *addr)
     -	case EM_AARCH64:
      #ifdef MCOUNT_SORT_ENABLED
     +	case EM_AARCH64:
    ++		/* arm64 also needs RELA-based weak-function fixups. */
      		sort_reloc = true;
      		rela_type = 0x403;
     -		/* arm64 uses patchable function entry placing before function */
     +		/* fallthrough */
     +	case EM_RISCV:
    -+		/* arm64 and RISC-V place patchable entries before the function */
    ++		/* arm64 and RISC-V place patchable entries before the function. */
      		before_func = 8;
     +#else
     +	case EM_AARCH64:
2:  9f6a4bf60d10 ! 2:  5b6b411e4d9a riscv: stacktrace: Add frame record metadata
    @@ Commit message
         future reliable unwinder.
     
         Add a small metadata frame record to pt_regs and initialize it on
    -    exception entry, kernel thread fork, user fork, and early idle task
    -    setup. The record uses a zero {fp, ra} sentinel plus a type field so a
    -    later unwinder can distinguish a final user-to-kernel boundary from a
    -    nested kernel pt_regs boundary.
    +    exception entry, kernel stack overflow, kernel thread fork, user fork,
    +    and early idle task setup. The record uses a zero {fp, ra} sentinel plus
    +    a type field so a later unwinder can distinguish a final user-to-kernel
    +    boundary from a nested kernel pt_regs boundary.
     
         This follows the arm64 metadata frame-record model, adapted to the
         RISC-V {fp, ra} frame record convention.
    @@ Commit message
           * exception entry clears the metadata {fp, ra} pair and uses SPP
             (or MPP in M-mode) to record whether the pt_regs frame is the final
             user-to-kernel boundary or a nested kernel boundary;
    +      * the kernel stack overflow path builds a nested pt_regs metadata
    +        record on the overflow stack so an unwinder can resume from the
    +        pre-overflow s0 saved in PT_S0;
           * _start_kernel builds the init task's final metadata record, while
             the secondary CPU path sets up s0 before smp_callin() so idle-task
             unwinding does not inherit an undefined caller frame;
    @@ Commit message
             saved {fp, ra} with the raw frame-record size so s0 points at the
             RISC-V frame record rather than past the alignment padding.
     
    +    The call_on_irq_stack adjustment fixes a latent RV32 issue. On RV64,
    +    sizeof(struct stackframe) is equal to the stack alignment, so the old
    +    s0 value happened to point just above the saved {fp, ra}. On RV32, the
    +    raw frame record is 8 bytes while the reserved stack slot is 16-byte
    +    aligned, so the old s0 value pointed into the padding. Using the raw
    +    record size makes s0 point above the saved frame record on both RV32
    +    and RV64 while still reserving the aligned slot.
    +
         These changes keep s0 reserved for the frame-pointer chain at task and
         stack-switch boundaries.
     
    @@ arch/riscv/kernel/entry.S: SYM_CODE_START(handle_exception)
      	/*
      	 * Set the scratch register to 0, so that if a recursive exception
      	 * occurs, the exception vector knows it came from the kernel
    +@@ arch/riscv/kernel/entry.S: SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
    + 	REG_S s3, PT_BADADDR(sp)
    + 	REG_S s4, PT_CAUSE(sp)
    + 	REG_S s5, PT_TP(sp)
    ++
    ++	/*
    ++	 * Create a metadata frame record for the overflow pt_regs. The
    ++	 * overflow path is entered from kernel context, so this is a nested
    ++	 * pt_regs boundary and the unwinder can resume from the pre-overflow
    ++	 * frame pointer saved in PT_S0.
    ++	 */
    ++	REG_S zero, (S_STACKFRAME + STACKFRAME_FP)(sp)
    ++	REG_S zero, (S_STACKFRAME + STACKFRAME_RA)(sp)
    ++	li t0, FRAME_META_TYPE_PT_REGS
    ++	REG_S t0, S_STACKFRAME_TYPE(sp)
    ++	addi s0, sp, S_STACKFRAME + STACKFRAME_RECORD_SIZE
    ++
    + 	move a0, sp
    + 	tail handle_bad_stack
    + SYM_CODE_END(handle_kernel_stack_overflow)
     @@ arch/riscv/kernel/entry.S: ASM_NOKPROBE(handle_kernel_stack_overflow)
      
      SYM_CODE_START(ret_from_fork_kernel_asm)
    @@ arch/riscv/kernel/process.c: int copy_thread(struct task_struct *p, const struct
     +		/*
     +		 * Set up the unwind boundary: ensure the metadata
     +		 * frame record has its {fp,ra} sentinel zeroed and
    -+		 * point fp/s0 above the metadata record. The type
    -+		 * field is inherited from the parent's pt_regs.
    ++		 * point fp/s0 above the metadata record. Mark it as
    ++		 * FINAL since this is the outermost kernel entry for
    ++		 * the new task.
     +		 */
     +		childregs->stackframe.record.fp = 0;
     +		childregs->stackframe.record.ra = 0;
    ++		childregs->stackframe.type = FRAME_META_TYPE_FINAL;
     +		p->thread.s[0] = (unsigned long)(&childregs->stackframe)
     +				+ sizeof(struct frame_record);
     +
3:  c1cc1fdba771 ! 3:  dc86baa5b148 riscv: stacktrace: disable KASAN instrumentation for stacktrace.o
    @@ Metadata
     Author: Wang Han <wanghan@linux.alibaba.com>
     
      ## Commit message ##
    -    riscv: stacktrace: disable KASAN instrumentation for stacktrace.o
    +    riscv: stacktrace: disable KASAN and KCOV instrumentation for stacktrace.o
     
         KASAN records stack traces for every alloc/free, which means it walks
         the unwinder very frequently. Instrumenting the stack trace collection
         code itself adds substantial overhead and makes the traces themselves
         noisier.
     
    -    Mark stacktrace.o as not KASAN-instrumented, matching the arm, arm64
    -    and x86 treatment of their stack unwinding code. This is a prerequisite
    -    preference for the upcoming reliable unwinder, but the change is valid
    -    on its own.
    +    KCOV instruments every basic-block edge. The unwinder is a hot path,
    +    especially with KASAN enabled, so KCOV instrumentation has the same kind
    +    of cost and noise problem here.
    +
    +    Mark stacktrace.o as not KASAN- or KCOV-instrumented, matching the x86
    +    treatment of its stack unwinding code. RISC-V keeps the relevant unwinder
    +    code in stacktrace.o, so a single translation-unit annotation covers the
    +    equivalent scope. This is a prerequisite preference for the upcoming
    +    reliable unwinder, but the change is valid on its own.
     
         Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
     
    @@ arch/riscv/kernel/Makefile: CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
     +# can significantly impact performance. Avoid instrumenting the stack trace
     +# collection code to minimize this impact.
     +KASAN_SANITIZE_stacktrace.o := n
    ++KCOV_INSTRUMENT_stacktrace.o := n
     +
      always-$(KBUILD_BUILTIN) += vmlinux.lds
      
4:  8960c3c96143 ! 4:  a2d474a996f9 riscv: ftrace: always preserve s0 in dynamic ftrace register frame
    @@ Metadata
      ## Commit message ##
         riscv: ftrace: always preserve s0 in dynamic ftrace register frame
     
    -    The dynamic ftrace entry/exit only saved s0 (the architectural frame
    -    pointer) when HAVE_FUNCTION_GRAPH_FP_TEST was selected. The upcoming
    -    reliable frame-pointer unwinder needs s0 to be present in
    -    ftrace_regs unconditionally so it can use the frame pointer as the
    -    function-graph return-address cookie regardless of FP_TEST.
    +    struct __arch_ftrace_regs declares s0 unconditionally, and both
    +    ftrace_regs_get_frame_pointer() and ftrace_partial_regs() read it
    +    unconditionally. But the SAVE_ABI_REGS / RESTORE_ABI_REGS macros in
    +    mcount-dyn.S only stored s0 under HAVE_FUNCTION_GRAPH_FP_TEST
    +    (CONFIG_FUNCTION_GRAPH_TRACER && CONFIG_FRAME_POINTER). With
    +    CONFIG_FRAME_POINTER=n the slot held whatever was on the stack before,
    +    so any callback going through ftrace_partial_regs() saw a garbage
    +    regs->s0. RISC-V kernels default to FRAME_POINTER=y, which is why this
    +    has not bitten in practice.
     
         Save and restore s0 unconditionally in the dynamic ftrace ABI register
    -    frame. The cost is one extra REG_S/REG_L pair per traced call, which is
    -    negligible compared to the overall ftrace cost; the benefit is a
    -    consistent ftrace_regs layout for the unwinder.
    +    frame. This fixes the latent garbage-s0 case, brings the dynamic ftrace
    +    path in line with the static _mcount path (mcount.S SAVE_ABI_STATE
    +    already saves s0 unconditionally), and matches the frame layout already
    +    documented in the comment above SAVE_ABI_REGS. It is also a prerequisite
    +    for the upcoming reliable unwinder, which reads
    +    ftrace_regs_get_frame_pointer(fregs) directly.
     
    +    The cost is one extra REG_S/REG_L pair per traced call, negligible
    +    compared to the overall ftrace cost; the existing FREGS_SIZE_ON_STACK
    +    already reserved the slot, so no extra stack space is used.
    +
    +    Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
         Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
     
      ## arch/riscv/kernel/mcount-dyn.S ##
5:  5fb2633c7e6e ! 5:  b74577e4a6b1 riscv: stacktrace: introduce stack-bound tracking helpers
    @@ Commit message
         on_thread_stack() with the same semantics as before, just expressed in
         terms of the new helpers.
     
    +    Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
         Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
     
      ## arch/riscv/include/asm/stacktrace.h ##
    @@ arch/riscv/include/asm/stacktrace/common.h (new)
     + * See: arch/arm64/include/asm/stacktrace/common.h for the reference
     + * implementation.
     + *
    -+ * Copyright (C) 2024
    ++ * Copyright (C) 2026
     + */
     +#ifndef __ASM_RISCV_STACKTRACE_COMMON_H
     +#define __ASM_RISCV_STACKTRACE_COMMON_H
6:  6b3ec0c98cd8 ! 6:  ac01a5cf8317 riscv: stacktrace: switch to frame-pointer based unwinder
    @@ arch/riscv/kernel/stacktrace.c: unsigned long __get_wchan(struct task_struct *ta
     +	state->regs = regs;
     +	state->common.pc = regs->epc;
     +	state->common.fp = frame_pointer(regs);
    -+	state->regs = NULL;
     +	state->source = KUNWIND_SOURCE_REGS_PC;
     +	return 0;
     +}
    @@ arch/riscv/kernel/stacktrace.c: unsigned long __get_wchan(struct task_struct *ta
     +{
     +	/*
     +	 * At an exception boundary we can reliably consume the saved PC. We do
    -+	 * not know whether the LR was live when the exception was taken, and
    ++	 * not know whether ra was live when the exception was taken, and
     +	 * so we cannot perform the next unwind step reliably.
     +	 *
     +	 * All that matters is whether the *entire* unwind is reliable, so give
7:  90fcaa590d57 ! 7:  cd40c6ddb5d1 riscv: Kconfig: enable HAVE_RELIABLE_STACKTRACE and HAVE_LIVEPATCH
    @@ Commit message
         to the rest of the kernel:
     
           * select HAVE_RELIABLE_STACKTRACE under FRAME_POINTER && 64BIT, so
    -        only the configurations that actually have the metadata records
    -        and the FP-based reliable walker enable it.
    +        only the configurations with the tested metadata records and
    +        FP-based reliable walker enable it.
           * select HAVE_LIVEPATCH under the same condition and source
             kernel/livepatch/Kconfig so the livepatch menu is reachable from
             the RISC-V configuration.
     
    +    The 64BIT dependency is conservative scoping rather than a hard
    +    technical requirement: the metadata frame record, kunwind state machine
    +    and arch_stack_walk_reliable() also build on RV32, and the IRQ-stack
    +    frame-record adjustment fixes a latent RV32 issue. However, the syscall
    +    livepatch selftest and module relocation path have only been exercised
    +    on RV64 QEMU virt so far. The 64BIT gate can be relaxed in a follow-up
    +    once RV32 has equivalent coverage.
    +
         This is split out from the unwinder change so the policy decision and
         the implementation can be reviewed and reverted independently.
     
    +    Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
         Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
     
      ## arch/riscv/Kconfig ##
8:  9590be5df884 ! 8:  194d76e3a15b selftests/livepatch: Add RISC-V syscall wrapper prefix
    @@ Commit message
         RISC-V target symbol, and the syscall-related livepatch test fails on
         RISC-V.
     
    +    Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com>
    +    Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
         Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
     
      ## tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c ##

base-commit: 0ca1724b56af054e304a9f3f60623b02a81aba3f
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
