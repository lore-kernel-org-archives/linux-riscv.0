Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A079CD6E4A
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 08:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcn5dyZmClN96sbHZqiSdyaggvbXkkj/f9Mjpu7JrjI=; b=vvbFp2bnJrlR+g
	h97dT40XFDGkF5Ew8vlqNsTZ+TpTxAMChPxWOGHnzJE5tyBHOwAr6VKUD8zg385le2zmmqPJkivSs
	MnVxaeaS1+assfTOIqUFtTzzoJlTAz2ihtsSqpVu4KfyvpXU+UXSDN1juEQ3C7pH2gAdl9JCRMW2x
	TuegRe9tjLadLzTNFA8oflUdOX1LlKgTXlemQkbd7b3Fs4ORQrSAfbd3HAVMINwwy2A9xWdSII5Qn
	pYYd2MEbPoI6ByTsc1c2gtXTT/dseN96e4X62rU7wim9iVKW+rQcptizEKrNnxUeK4rYBpF8z9PO9
	1gkyViAO3m/psBsld2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSW1X-00000005MzS-3GfE;
	Thu, 28 May 2026 08:23:27 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSW1O-00000005Mvo-2FIf
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 08:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779956595; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=6TF2LS+nJnfzXkO5w/fIHj//VQJI7nyDrEDFLzrvD8s=;
	b=qYB2l+zugccSPSGxfa9OaSjqeh2rUAPovB51AWA240jQg8PyVSjP2AeUywP7SlbiLW1QbNdCLytSsV3cIsPzZ04VvjyM0dK4MuwtHZaYoHxwgGFL0yqfIrNXgVKYsPH82024Ru032NzBbI4sIvk97MU7R706mql6frs9HetzBY8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X3lxQKx_1779956590;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X3lxQKx_1779956590 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 16:23:12 +0800
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
Subject: [PATCH v2 0/8] riscv: Add reliable stack unwinding for livepatch
Date: Thu, 28 May 2026 16:23:02 +0800
Message-ID: <20260528082310.1994388-1-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_012319_805978_3EABFA0B 
X-CRM114-Status: GOOD (  19.32  )
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

Changelog
=========

v2:
  * Patch 1 (scripts/sorttable): refactor the switch in do_file() to
    group EM_AARCH64 and EM_RISCV under a single MCOUNT_SORT_ENABLED
    block sharing before_func = 8, per Steven Rostedt's suggestion [1].
    Future architectures with patchable function entries can add their
    own case to that group. No functional change.
    Also fix a stray empty line between the Fixes: tag and the
    Signed-off-by trailer (b4-checks "empty lines surround the Fixes
    tag"), and add Suggested-by: Steven Rostedt with a Link: to the
    review thread.
  * No other patches changed.

[1] https://lore.kernel.org/all/20260527113028.4b21a5de@fedora/

v1: https://lore.kernel.org/all/20260527123530.2593918-1-wanghan@linux.alibaba.com/

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
independent; it can be picked into the RISC-V tree on its own if
preferred.

Patches 2-7 add the reliable unwinder in small, individually
reviewable steps. The design follows the same FP + metadata model
arm64 already uses for livepatch in production: the metadata frame
record in pt_regs, the unwind-state stack-bound bookkeeping, the
exception boundary handling, and the fgraph / kretprobe return-address
recovery are direct adaptations of arch/arm64/kernel/stacktrace.c,
retargeted to the RISC-V {fp, ra} frame record convention.

  * Patch 2 adds frame-record metadata for the RISC-V stack walker.
    Low-level entry and task setup code records whether a frame is a
    normal frame, an exception frame, or a task-entry boundary, so the
    reliable unwinder can validate what it is walking instead of
    guessing from the return address.
  * Patch 3 stops KASAN from instrumenting stacktrace.o, matching the
    arm, arm64 and x86 treatment of their stack unwinding code.
  * Patch 4 always preserves s0 in the dynamic ftrace register frame so
    the unwinder can use the architectural frame pointer as the
    function-graph return-address cookie regardless of FP_TEST.
  * Patch 5 introduces stack_info / unwind_state and the
    forward-progress-only stack-bound helpers that the reliable
    unwinder is built on. No caller is wired up yet.
  * Patch 6 switches arch_stack_walk() to the new frame-pointer based
    unwinder, adds arch_stack_walk_reliable() (still without an
    in-tree caller), routes perf callchains through arch_stack_walk(),
    and updates the function-graph cookie to match.
  * Patch 7 selects HAVE_RELIABLE_STACKTRACE and HAVE_LIVEPATCH under
    FRAME_POINTER && 64BIT and exposes the livepatch menu, finally
    enabling livepatch on RISC-V.

Two alternative directions were considered and deferred:

  * ORC, as used on x86, gives reliable unwinding without runtime FP
    cost, but requires RISC-V objtool stack validation, ORC metadata
    generation, and the runtime ORC unwinder. That is a much larger
    dependency chain than what this series adds.

  * SFrame is the more likely long-term replacement for FP-based
    unwinding on architectures without ORC. Kernel SFrame support is
    still under development and the currently documented SFrame ABI
    set does not cover RISC-V, so making RISC-V livepatch depend on
    SFrame would block it on toolchain and kernel infrastructure that
    is not available yet. SFrame is a replacement rather than an
    extension of the metadata frame record introduced here, so when it
    lands the metadata can be retired together with the FP unwinder.
    The interim cost (~24 bytes added to pt_regs and a handful of
    instructions on exception entry, fork and early init) is bounded
    and limited to FRAME_POINTER=y configurations, which is what the
    RISC-V kernel already builds with for stack tracing today.
    Selecting HAVE_RELIABLE_STACKTRACE under FRAME_POINTER && 64BIT
    therefore does not introduce a new build-time dependency relative
    to the status quo.

This is useful now because livepatch is increasingly important for
long-running server deployments where rebooting for critical fixes is
expensive, and recent RISC-V work (dynamic ftrace and patchable
function entries) has put the rest of the livepatch infrastructure in
place.

Module-side klp relocations rely on the existing RISC-V
apply_relocate_add(); the syscall livepatch selftest exercises the
full klp_apply_section_relocs() -> apply_relocate_add() path on RISC-V.

Patch 8 adds the RISC-V syscall wrapper prefix used by the livepatch
syscall selftest module. Without this, the syscall livepatch selftest
cannot resolve the expected target symbol on RISC-V.

Testing
=======

The series is based on riscv/for-next commit 0ca1724b56af ("riscv:
ftrace: select HAVE_BUILDTIME_MCOUNT_SORT").

Build and static checks:

  * git diff --check riscv/for-next..HEAD
  * scripts/checkpatch.pl --strict for each patch
  * RISC-V Image and modules build clean with:
      - gcc 15.2 (riscv64-unknown-linux-gnu-)
      - LLVM=1 clang 18.1.3
      - LLVM=1 clang 21.1.1
  * Each intermediate commit (patches 1-7) was built individually on
    riscv/for-next to confirm bisectability; all 7 intermediate trees
    plus the final HEAD compile clean.
  * livepatch selftest module build

The unfixed build-time sort path was reproduced under QEMU:

  ftrace: allocating 0 entries in 128 pages
  Testing tracer function: .. no entries found ..FAILED!
  Failed to init function_graph tracer, init returned -19

With the sorttable fix applied, the same QEMU boot finds the expected
ftrace entries and the ftrace startup tests pass:

  ftrace: allocating 46749 entries in 184 pages
  Testing tracer function: PASSED
  Testing dynamic ftrace: PASSED
  Testing tracer function_graph: PASSED

With all eight patches applied, RISC-V QEMU virt boots with SMP=2,
SMP=4, and SMP=8 completed the livepatch and tracing smoke tests. The
livepatch selftest result was the same in all runs:

  livepatch selftests: PASS: 7, SKIP: 1, FAIL: 0

Across these boots, the kernel brought up the requested CPU count and
the startup ftrace tests passed, including dynamic ftrace and
function_graph. The function graph selftests reported passed: 3,
failed: 0, unsupported: 3, and LKDTM WARNING_MESSAGE produced the
expected Call Trace and powered off normally.

The livepatch selftest skip is test-kprobe.sh. The test requires
CONFIG_KPROBES_ON_FTRACE, which is not provided by the current RISC-V
configuration.

Wang Han (8):
  scripts/sorttable: Handle RISC-V patchable ftrace entries
  riscv: stacktrace: Add frame record metadata
  riscv: stacktrace: disable KASAN instrumentation for stacktrace.o
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
 arch/riscv/kernel/Makefile                    |   5 +
 arch/riscv/kernel/asm-offsets.c               |   4 +
 arch/riscv/kernel/entry.S                     |  30 +-
 arch/riscv/kernel/ftrace.c                    |   6 +-
 arch/riscv/kernel/head.S                      |  23 +
 arch/riscv/kernel/mcount-dyn.S                |   4 -
 arch/riscv/kernel/perf_callchain.c            |   2 +-
 arch/riscv/kernel/process.c                   |  31 +-
 arch/riscv/kernel/stacktrace.c                | 560 +++++++++++++++---
 scripts/sorttable.c                           |  10 +-
 .../livepatch/test_modules/test_klp_syscall.c |   2 +
 16 files changed, 856 insertions(+), 111 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace/common.h
 create mode 100644 arch/riscv/include/asm/stacktrace/frame.h


base-commit: 0ca1724b56af054e304a9f3f60623b02a81aba3f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
