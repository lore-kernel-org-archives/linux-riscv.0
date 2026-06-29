Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F722C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 06:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=069ALR04sLLuKgThHNCPf/1PJX9m8MDApfvX05hjAzQ=; b=cxGUibQhWozJL0
	UMU2zbE12IsIWIdHxqrxiLm3oLP+EQwMuZ5Et9LJu0vLFJsjFibzlcv1G9hukQP2f5JMIsB4uvuYn
	GXZfig377nnhXFONj3KdLZCGZt9Bv87Ajt4ZSH1VK4Fz/adY4l6of6RpWcSD3ZDGT3Nr0yhO1mRn1
	rpa9XHDqHkRPhMUHrdQcoYAZOvecjcFPd+08MggLfCicS9dLyX8Xmzw/R5FFDymPy3mQssKLjojsY
	zM5SduvOWaH86euIm69wJgNU3YCAlyTixeB8ZqMbn7YZrljkCIqodNCJllI6TKC/KiuXAAkgoNUwY
	rAx3LWMkqzOT7jbZKfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5he-0000000DmOE-2cp8;
	Mon, 29 Jun 2026 06:42:46 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5hZ-0000000DmJ6-1QA6
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 06:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782715354; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=UkgLAJrduHj8/qC365Qv1JJMbTkOBQYfHaGdlpNjnVw=;
	b=jSBcRY001bRYoxL/N/u8vQ7yjOoc6rESpWY7pSaR84hdsbv6ETv7BgT7RTHgHIZCaWYsp1YdNAHrKOUANcO9CskHpqK5/2iscTGS80YeZ1wmG3Bjtlpy6t2JxESIOBbmXFwVwbjFWWdkKrLkgoNAcu/9tMRbFeg6NT0OZ8hFZz4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R251e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X5nWtac_1782715350;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X5nWtac_1782715350 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 29 Jun 2026 14:42:31 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	oliver.yang@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 0/7] riscv: Add reliable stack unwinding for livepatch
Date: Mon, 29 Jun 2026 14:42:21 +0800
Message-ID: <20260629064228.3195856-1-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_234241_723112_28B8EA8A 
X-CRM114-Status: GOOD (  19.41  )
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

This series adds the RISC-V architecture pieces needed by livepatch:
dynamic ftrace must preserve the frame pointer context that livepatch
uses for redirection, and the stack unwinder must be reliable enough for
the livepatch consistency model.

The reliable unwinder is based on frame records and explicit metadata at
task and exception boundaries. It is intentionally conservative: it
rejects ambiguous states instead of trying to unwind through them. The
series then enables HAVE_RELIABLE_STACKTRACE and HAVE_LIVEPATCH for
64-bit RISC-V with dynamic ftrace.

The first patch from v3, "scripts/sorttable: Handle RISC-V patchable
ftrace entries", has been picked up by Paul and is already present in
riscv/for-next as commit 57ad674d032b. It is therefore dropped from this
v4. The remaining patches are rebased on the latest riscv/for-next.

Base:
  riscv/for-next 798246e5edfb ("riscv: acpi: Enable ARCH_HAS_ACPI_TABLE_UPGRADE")

Previous versions:
  v3: https://lore.kernel.org/r/cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com
  v2: https://lore.kernel.org/r/20260528082310.1994388-1-wanghan@linux.alibaba.com
  v1: https://lore.kernel.org/r/20260527123530.2593918-1-wanghan@linux.alibaba.com

Changes since v3:
  * Drop the accepted sorttable fix, now commit 57ad674d032b in
    riscv/for-next.
  * Rebase the remaining 7 patches on the latest riscv/for-next.
  * Adapt the frame metadata patch to the existing call_on_irq_stack()
    RV32 frame-pointer ABI fix by keeping metadata frame-record offsets
    distinct from the s0-relative STACKFRAME_* offsets.
  * Adapt the livepatch syscall selftest prefix change to the current
    CONFIG_ARCH_HAS_SYSCALL_WRAPPER wrapper logic.

Validation:
  * Built with riscv64-unknown-linux-gnu-gcc 15.2.0 and the existing
    configs/riscv_livepatch_config, including RISCV_ISA_C=y, EFI=y and
    ACPI=y.
  * make -C linux O=$PWD/build/linux/riscv ARCH=riscv \
      CROSS_COMPILE=riscv64-unknown-linux-gnu- -j$(nproc) Image modules
    passed.
  * make kernel-debug ARCH=riscv GDB=riscv64-unknown-linux-gnu-gdb
    passed.
  * livepatch selftest modules built successfully via ./test-livepatch.sh
    riscv.
  * QEMU RISC-V livepatch selftests passed with PASS: 7, SKIP: 1,
    FAIL: 0. The only skip is test-kprobe.sh because this config does
    not enable CONFIG_KPROBES_ON_FTRACE.
  * The ftrace function graph subset passed with 3 passed, 0 failed and
    3 unsupported tests.

Wang Han (7):
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
 arch/riscv/kernel/asm-offsets.c               |   6 +
 arch/riscv/kernel/entry.S                     |  39 +-
 arch/riscv/kernel/ftrace.c                    |   6 +-
 arch/riscv/kernel/head.S                      |  23 +
 arch/riscv/kernel/mcount-dyn.S                |   4 -
 arch/riscv/kernel/perf_callchain.c            |   2 +-
 arch/riscv/kernel/process.c                   |  33 +-
 arch/riscv/kernel/stacktrace.c                | 559 +++++++++++++++---
 .../livepatch/test_modules/test_klp_syscall.c |   2 +
 15 files changed, 864 insertions(+), 106 deletions(-)
 create mode 100644 arch/riscv/include/asm/stacktrace/common.h
 create mode 100644 arch/riscv/include/asm/stacktrace/frame.h

Range-diff against v3:
1:  8cef363cfed7 ! 1:  efd99ce56c1e riscv: stacktrace: Add frame record metadata
    @@ Commit message
             the secondary CPU path sets up s0 before smp_callin() so idle-task
             unwinding does not inherit an undefined caller frame;
           * copy_thread creates matching final metadata records for new kernel
    -        and user tasks, and keeps s0 available for the frame-pointer chain;
    -      * call_on_irq_stack still reserves an aligned stack slot, but links the
    -        saved {fp, ra} with the raw frame-record size so s0 points at the
    -        RISC-V frame record rather than past the alignment padding.
    +        and user tasks, and keeps s0 available for the frame-pointer chain.
     
    -    The call_on_irq_stack adjustment fixes a latent RV32 issue. On RV64,
    -    sizeof(struct stackframe) is equal to the stack alignment, so the old
    -    s0 value happened to point just above the saved {fp, ra}. On RV32, the
    -    raw frame record is 8 bytes while the reserved stack slot is 16-byte
    -    aligned, so the old s0 value pointed into the padding. Using the raw
    -    record size makes s0 point above the saved frame record on both RV32
    -    and RV64 while still reserving the aligned slot.
    +    Keep the embedded metadata-record field offsets distinct from the
    +    s0-relative STACKFRAME_* offsets used by call_on_irq_stack(), because
    +    the latter describe a frame record relative to s0 rather than to the
    +    record base.
     
         These changes keep s0 reserved for the frame-pointer chain at task and
    -    stack-switch boundaries.
    +    exception boundaries.
     
         Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
     
    @@ arch/riscv/kernel/asm-offsets.c: void asm_offsets(void)
      
      	OFFSET(HIBERN_PBE_ADDR, pbe, address);
     @@ arch/riscv/kernel/asm-offsets.c: void asm_offsets(void)
    - 	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
    - 
      	DEFINE(STACKFRAME_SIZE_ON_STACK, ALIGN(sizeof(struct stackframe), STACK_ALIGN));
    + 	DEFINE(STACKFRAME_FP, offsetof(struct stackframe, fp) - sizeof(struct stackframe));
    + 	DEFINE(STACKFRAME_RA, offsetof(struct stackframe, ra) - sizeof(struct stackframe));
     +	DEFINE(STACKFRAME_RECORD_SIZE, sizeof(struct stackframe));
    - 	OFFSET(STACKFRAME_FP, stackframe, fp);
    - 	OFFSET(STACKFRAME_RA, stackframe, ra);
    ++	OFFSET(FRAME_RECORD_FP, frame_record, fp);
    ++	OFFSET(FRAME_RECORD_RA, frame_record, ra);
      #ifdef CONFIG_FUNCTION_TRACER
    + 	DEFINE(FTRACE_OPS_FUNC,		offsetof(struct ftrace_ops, func));
    + #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
     
      ## arch/riscv/kernel/entry.S ##
     @@
    @@ arch/riscv/kernel/entry.S: SYM_CODE_START(handle_exception)
     +	 * Create a metadata frame record. The unwinder will use this to
     +	 * identify and unwind exception boundaries.
     +	 */
    -+	REG_S zero, (S_STACKFRAME + STACKFRAME_FP)(sp) /* stackframe.record.fp = 0 */
    -+	REG_S zero, (S_STACKFRAME + STACKFRAME_RA)(sp) /* stackframe.record.ra = 0 */
    ++	REG_S zero, (S_STACKFRAME + FRAME_RECORD_FP)(sp) /* stackframe.record.fp = 0 */
    ++	REG_S zero, (S_STACKFRAME + FRAME_RECORD_RA)(sp) /* stackframe.record.ra = 0 */
     +#ifdef CONFIG_RISCV_M_MODE
     +	li t0, SR_MPP
     +	and t0, s1, t0
    @@ arch/riscv/kernel/entry.S: SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
     +	 * pt_regs boundary and the unwinder can resume from the pre-overflow
     +	 * frame pointer saved in PT_S0.
     +	 */
    -+	REG_S zero, (S_STACKFRAME + STACKFRAME_FP)(sp)
    -+	REG_S zero, (S_STACKFRAME + STACKFRAME_RA)(sp)
    ++	REG_S zero, (S_STACKFRAME + FRAME_RECORD_FP)(sp)
    ++	REG_S zero, (S_STACKFRAME + FRAME_RECORD_RA)(sp)
     +	li t0, FRAME_META_TYPE_PT_REGS
     +	REG_S t0, S_STACKFRAME_TYPE(sp)
     +	addi s0, sp, S_STACKFRAME + STACKFRAME_RECORD_SIZE
    @@ arch/riscv/kernel/entry.S: ASM_NOKPROBE(handle_kernel_stack_overflow)
      	move a2, sp /* pt_regs */
      	call ret_from_fork_kernel
      	j ret_from_exception
    -@@ arch/riscv/kernel/entry.S: SYM_FUNC_START(call_on_irq_stack)
    - 	addi	sp, sp, -STACKFRAME_SIZE_ON_STACK
    - 	REG_S	ra, STACKFRAME_RA(sp)
    - 	REG_S	s0, STACKFRAME_FP(sp)
    --	addi	s0, sp, STACKFRAME_SIZE_ON_STACK
    -+	addi	s0, sp, STACKFRAME_RECORD_SIZE
    - 
    - 	/* Switch to the per-CPU shadow call stack */
    - 	scs_save_current
    -@@ arch/riscv/kernel/entry.S: SYM_FUNC_START(call_on_irq_stack)
    - 	scs_load_current
    - 
    - 	/* Switch back to the thread stack and restore ra and s0 */
    --	addi	sp, s0, -STACKFRAME_SIZE_ON_STACK
    -+	addi	sp, s0, -STACKFRAME_RECORD_SIZE
    - 	REG_L	ra, STACKFRAME_RA(sp)
    - 	REG_L	s0, STACKFRAME_FP(sp)
    - 	addi	sp, sp, STACKFRAME_SIZE_ON_STACK
     
      ## arch/riscv/kernel/head.S ##
     @@
    @@ arch/riscv/kernel/head.S: SYM_CODE_START(_start_kernel)
     +	 * fp/s0 points above the metadata record (RISC-V
     +	 * convention).
     +	 */
    -+	REG_S zero, (S_STACKFRAME + STACKFRAME_FP)(sp)
    -+	REG_S zero, (S_STACKFRAME + STACKFRAME_RA)(sp)
    ++	REG_S zero, (S_STACKFRAME + FRAME_RECORD_FP)(sp)
    ++	REG_S zero, (S_STACKFRAME + FRAME_RECORD_RA)(sp)
     +	li t0, FRAME_META_TYPE_FINAL
     +	REG_S t0, S_STACKFRAME_TYPE(sp)
     +	addi s0, sp, S_STACKFRAME + STACKFRAME_RECORD_SIZE
2:  237864b66d78 = 2:  bc0af8ec1976 riscv: stacktrace: disable KASAN and KCOV instrumentation for stacktrace.o
3:  e6035966a35a = 3:  ab3fbed66fff riscv: ftrace: always preserve s0 in dynamic ftrace register frame
4:  d132087ea01e = 4:  856d1e31408a riscv: stacktrace: introduce stack-bound tracking helpers
5:  02adea3ece82 = 5:  58aa4435e2ee riscv: stacktrace: switch to frame-pointer based unwinder
6:  c7d7dbe7a8a1 = 6:  500f9d9eeac0 riscv: Kconfig: enable HAVE_RELIABLE_STACKTRACE and HAVE_LIVEPATCH
7:  ae94a234b34a < -:  ------------ selftests/livepatch: Add RISC-V syscall wrapper prefix
-:  ------------ > 7:  3dcfa694c207 selftests/livepatch: Add RISC-V syscall wrapper prefix

base-commit: 798246e5edfb3aa0b2d6dca46f41014d0b99b209
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
