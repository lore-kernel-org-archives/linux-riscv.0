Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FF6CCA480
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 02:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPRt/FUiSV7FGizKWeATNRYMCUeVRI09y91J+i/5RSM=; b=W0ftimCwB73k/d
	nLA3S5WiTheDXUlYtVk4sEk51HQpVIxHEM4LXfinjFUNfNv4Ox1hxvSrLUy9jzFD0E8fuIL/SFqt4
	/yatuoQe5McUn7t34SWMpdkifL6nl3ijS3Sn/c/3E7piOd64Sbctg3o7GlUJZh2GS1hYzu4glX1tf
	qBXZSwj1i7dDYWpf3o4m6swvGCy4eTFcAQloGZR3R6YmeAwJyjYLwBNnCBWqBbCS69N/ifdgCdgEm
	L99Gfvogw1XFx3V8t6R7JJaoIDL6z6Mazthb23X2SY/m8KMB4KL9oUgKxjvCbhGV+Z7WNLH1t16MU
	G9xwx17mBCj+d+jc3QhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDGtf-00AHWs-N0; Mon, 18 Jul 2022 02:54:11 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDGtW-00AHOw-Tk
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 02:54:05 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VJbFyyk_1658112837;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJbFyyk_1658112837)
          by smtp.aliyun-inc.com;
          Mon, 18 Jul 2022 10:53:57 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: crash-utility@redhat.com,
	mick@ics.forth.gr,
	heinrich.schuchardt@canonical.com,
	guoren@kernel.org,
	k-hagio-ab@nec.com
Cc: linux-riscv@lists.infradead.org,
	hschauhan@nulltrace.org,
	huanyi.xj@alibaba-inc.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [Crash-utility][PATCH 5/8] RISCV64: Add 'bt' command support
Date: Mon, 18 Jul 2022 10:53:43 +0800
Message-Id: <20220718025346.411758-6-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
References: <20220718025346.411758-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_195403_176112_0BB12E62 
X-CRM114-Status: GOOD (  16.57  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

1, Add the implementation to get stack frame from active & inactive
   task's stack.
2, Add 'bt -l' command support get a line number associated with a
   current pc address.
3, Add 'bt -f' command support to display all stack data contained
   in a frame

With the patch, we can get the backtrace,
crash> bt
PID: 113      TASK: ff6000000226c200  CPU: 0    COMMAND: "sh"
 #0 [ff20000010333b90] riscv_crash_save_regs at ffffffff800078f8
 #1 [ff20000010333cf0] panic at ffffffff806578c6
 #2 [ff20000010333d50] sysrq_reset_seq_param_set at ffffffff8038c03c
 #3 [ff20000010333da0] __handle_sysrq at ffffffff8038c604
 #4 [ff20000010333e00] write_sysrq_trigger at ffffffff8038cae4
 #5 [ff20000010333e20] proc_reg_write at ffffffff801b7ee8
 #6 [ff20000010333e40] vfs_write at ffffffff80152bb2
 #7 [ff20000010333e80] ksys_write at ffffffff80152eda
 #8 [ff20000010333ed0] sys_write at ffffffff80152f52

crash> bt -l
PID: 113      TASK: ff6000000226c200  CPU: 0    COMMAND: "sh"
 #0 [ff20000010333b90] riscv_crash_save_regs at ffffffff800078f8
    /buildroot/qemu_riscv64_virt_defconfig/build/linux-custom/arch/riscv/kernel/crash_save_regs.S: 47
 #1 [ff20000010333cf0] panic at ffffffff806578c6
    /buildroot/qemu_riscv64_virt_defconfig/build/linux-custom/kernel/panic.c: 276
 ... ...

crash> bt -f
PID: 113      TASK: ff6000000226c200  CPU: 0    COMMAND: "sh"
 #0 [ff20000010333b90] riscv_crash_save_regs at ffffffff800078f8
    [PC: ffffffff800078f8 RA: ffffffff806578c6 SP: ff20000010333b90 SIZE: 352]
    ff20000010333b90: ff20000010333bb0 ffffffff800078f8
    ff20000010333ba0: ffffffff8008862c ff20000010333b90
    ff20000010333bb0: ffffffff810dde38 ff6000000226c200
    ff20000010333bc0: ffffffff8032be68 0720072007200720
 ... ...

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 netdump.c |  13 +++
 riscv64.c | 283 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 296 insertions(+)

diff --git a/netdump.c b/netdump.c
index 4ec12a0..1f418e6 100644
--- a/netdump.c
+++ b/netdump.c
@@ -42,6 +42,7 @@ static void get_netdump_regs_ppc64(struct bt_info *, ulong *, ulong *);
 static void get_netdump_regs_arm(struct bt_info *, ulong *, ulong *);
 static void get_netdump_regs_arm64(struct bt_info *, ulong *, ulong *);
 static void get_netdump_regs_mips(struct bt_info *, ulong *, ulong *);
+static void get_netdump_regs_riscv(struct bt_info *, ulong *, ulong *);
 static void check_dumpfile_size(char *);
 static int proc_kcore_init_32(FILE *, int);
 static int proc_kcore_init_64(FILE *, int);
@@ -2675,6 +2676,10 @@ get_netdump_regs(struct bt_info *bt, ulong *eip, ulong *esp)
 		return get_netdump_regs_mips(bt, eip, esp);
 		break;
 
+	case EM_RISCV:
+		return get_netdump_regs_riscv(bt, eip, esp);
+		break;
+
 	default:
 		error(FATAL, 
 		   "support for ELF machine type %d not available\n",
@@ -2931,6 +2936,8 @@ display_regs_from_elf_notes(int cpu, FILE *ofp)
 		mips_display_regs_from_elf_notes(cpu, ofp);
 	} else if (machine_type("MIPS64")) {
 		mips64_display_regs_from_elf_notes(cpu, ofp);
+	} else if (machine_type("RISCV64")) {
+		riscv64_display_regs_from_elf_notes(cpu, ofp);
 	}
 }
 
@@ -3877,6 +3884,12 @@ get_netdump_regs_mips(struct bt_info *bt, ulong *eip, ulong *esp)
 	machdep->get_stack_frame(bt, eip, esp);
 }
 
+static void
+get_netdump_regs_riscv(struct bt_info *bt, ulong *eip, ulong *esp)
+{
+	machdep->get_stack_frame(bt, eip, esp);
+}
+
 int 
 is_partial_netdump(void)
 {
diff --git a/riscv64.c b/riscv64.c
index 465834f..c00ce90 100644
--- a/riscv64.c
+++ b/riscv64.c
@@ -33,6 +33,17 @@ static int riscv64_uvtop(struct task_context *tc, ulong vaddr,
 static int riscv64_kvtop(struct task_context *tc, ulong kvaddr,
 			 physaddr_t *paddr, int verbose);
 static void riscv64_cmd_mach(void);
+static void riscv64_stackframe_init(void);
+static void riscv64_back_trace_cmd(struct bt_info *bt);
+static int riscv64_get_dumpfile_stack_frame(struct bt_info *bt,
+					    ulong *nip, ulong *ksp);
+static void riscv64_get_stack_frame(struct bt_info *bt, ulong *pcp,
+				    ulong *spp);
+static int riscv64_get_frame(struct bt_info *bt, ulong *pcp,
+			     ulong *spp);
+static void riscv64_display_full_frame(struct bt_info *bt,
+				struct riscv64_unwind_frame *current,
+				struct riscv64_unwind_frame *previous);
 static int riscv64_translate_pte(ulong, void *, ulonglong);
 static int riscv64_init_active_task_regs(void);
 static int riscv64_get_crash_notes(void);
@@ -650,6 +661,275 @@ no_page:
 	return FALSE;
 }
 
+/*
+ * 'bt -f' commend output
+ * Display all stack data contained in a frame
+ */
+static void
+riscv64_display_full_frame(struct bt_info *bt, struct riscv64_unwind_frame *current,
+			  struct riscv64_unwind_frame *previous)
+{
+	int i, u_idx;
+	ulong *up;
+	ulong words, addr;
+	char buf[BUFSIZE];
+
+	if (previous->sp < current->sp)
+		return;
+
+	if (!(INSTACK(previous->sp, bt) && INSTACK(current->sp, bt)))
+		return;
+
+	words = (previous->sp - current->sp) / sizeof(ulong) + 1;
+	addr = current->sp;
+	u_idx = (current->sp - bt->stackbase) / sizeof(ulong);
+
+	for (i = 0; i < words; i++, u_idx++) {
+		if (!(i & 1))
+			fprintf(fp, "%s    %lx: ", i ? "\n" : "", addr);
+
+		up = (ulong *)(&bt->stackbuf[u_idx*sizeof(ulong)]);
+		fprintf(fp, "%s ", format_stack_entry(bt, buf, *up, 0));
+		addr += sizeof(ulong);
+	}
+	fprintf(fp, "\n");
+
+	return;
+}
+
+static void
+riscv64_stackframe_init(void)
+{
+	long task_struct_thread = MEMBER_OFFSET("task_struct", "thread");
+
+	/* from arch/riscv/include/asm/processor.h */
+	long thread_reg_ra = MEMBER_OFFSET("thread_struct", "ra");
+	long thread_reg_sp = MEMBER_OFFSET("thread_struct", "sp");
+	long thread_reg_fp = MEMBER_OFFSET("thread_struct", "s");
+
+	if ((task_struct_thread == INVALID_OFFSET) ||
+	    (thread_reg_ra == INVALID_OFFSET) ||
+	    (thread_reg_sp == INVALID_OFFSET) ||
+	    (thread_reg_fp == INVALID_OFFSET) ) {
+		error(FATAL,
+		      "cannot determine thread_struct offsets\n");
+		return;
+	}
+
+	ASSIGN_OFFSET(task_struct_thread_context_pc) =
+		task_struct_thread + thread_reg_ra;
+	ASSIGN_OFFSET(task_struct_thread_context_sp) =
+		task_struct_thread + thread_reg_sp;
+	ASSIGN_OFFSET(task_struct_thread_context_fp) =
+		task_struct_thread + thread_reg_fp;
+}
+
+static void
+riscv64_dump_backtrace_entry(struct bt_info *bt, struct syment *sym,
+			     struct riscv64_unwind_frame *current,
+			     struct riscv64_unwind_frame *previous, int level)
+{
+	const char *name = sym ? sym->name : "(invalid)";
+	struct load_module *lm;
+	char *name_plus_offset = NULL;
+	struct syment *symp;
+	ulong symbol_offset;
+	char buf[BUFSIZE];
+
+	if (bt->flags & BT_SYMBOL_OFFSET) {
+		symp = value_search(current->pc, &symbol_offset);
+
+		if (symp && symbol_offset)
+			name_plus_offset =
+				value_to_symstr(current->pc, buf, bt->radix);
+	}
+
+	fprintf(fp, "%s#%d [%016lx] %s at %016lx",
+		level < 10 ? " " : "",
+		level,
+		current->sp,
+		name_plus_offset ? name_plus_offset : name,
+		current->pc);
+
+	if (module_symbol(current->pc, NULL, &lm, NULL, 0))
+		fprintf(fp, " [%s]", lm->mod_name);
+
+	fprintf(fp, "\n");
+
+	/*
+	 * 'bt -l', get a line number associated with a current pc address.
+	 */
+	if (bt->flags & BT_LINE_NUMBERS) {
+		get_line_number(current->pc, buf, FALSE);
+		if (strlen(buf))
+			fprintf(fp, "    %s\n", buf);
+	}
+
+	/* bt -f */
+	if (bt->flags & BT_FULL) {
+		fprintf(fp, "    "
+			"[PC: %016lx RA: %016lx SP: %016lx SIZE: %ld]\n",
+			current->pc,
+			previous->pc,
+			current->sp,
+			previous->sp - current->sp);
+		riscv64_display_full_frame(bt, current, previous);
+	}
+}
+
+/*
+ * Unroll a kernel stack.
+ */
+static void
+riscv64_back_trace_cmd(struct bt_info *bt)
+{
+	struct riscv64_unwind_frame current, previous;
+	struct stackframe curr_frame;
+	int level = 0;
+
+	if (bt->flags & BT_REGS_NOT_FOUND)
+		return;
+
+	current.pc = bt->instptr;
+	current.sp = bt->stkptr;
+	current.fp = bt->frameptr;
+
+	if (!INSTACK(current.sp, bt))
+		return;
+
+	for (;;) {
+		struct syment *symbol = NULL;
+		struct stackframe *frameptr;
+		ulong low, high;
+		ulong offset;
+
+		if (CRASHDEBUG(8))
+			fprintf(fp, "level %d pc %#lx sp %lx fp 0x%lx\n",
+				level, current.pc, current.sp, current.fp);
+
+		/* Validate frame pointer */
+		low = current.sp + sizeof(struct stackframe);
+		high = bt->stacktop;
+		if (current.fp < low || current.fp > high || current.fp & 0x7) {
+			if (CRASHDEBUG(8))
+				fprintf(fp, "fp 0x%lx sp 0x%lx low 0x%lx high 0x%lx\n",
+					current.fp, current.sp, low, high);
+			return;
+		}
+
+		symbol = value_search(current.pc, &offset);
+		if (!symbol)
+			return;
+
+		frameptr = (struct stackframe *)current.fp - 1;
+		if (!readmem((ulong)frameptr, KVADDR, &curr_frame,
+		    sizeof(curr_frame), "get stack frame", RETURN_ON_ERROR))
+			return;
+
+		previous.pc = curr_frame.ra;
+		previous.fp = curr_frame.fp;
+		previous.sp = current.fp;
+
+		riscv64_dump_backtrace_entry(bt, symbol, &current, &previous, level++);
+
+		current.pc = previous.pc;
+		current.fp = previous.fp;
+		current.sp = previous.sp;
+
+		if (CRASHDEBUG(8))
+			fprintf(fp, "next %d pc %#lx sp %#lx fp %lx\n",
+				level, current.pc, current.sp, current.fp);
+	}
+}
+
+/*
+ * Get a stack frame combination of pc and ra from the most relevant spot.
+ */
+static void
+riscv64_get_stack_frame(struct bt_info *bt, ulong *pcp, ulong *spp)
+{
+	ulong ksp = 0, nip = 0;
+	int ret = 0;
+
+	if (DUMPFILE() && is_task_active(bt->task))
+		ret = riscv64_get_dumpfile_stack_frame(bt, &nip, &ksp);
+	else
+		ret = riscv64_get_frame(bt, &nip, &ksp);
+
+	if (pcp)
+		*pcp = nip;
+	if (spp)
+		*spp = ksp;
+}
+
+/*
+ * Get the starting point for the active cpu in a diskdump.
+ */
+static int
+riscv64_get_dumpfile_stack_frame(struct bt_info *bt, ulong *nip, ulong *ksp)
+{
+	const struct machine_specific *ms = machdep->machspec;
+	struct riscv64_register *regs;
+	ulong epc, sp;
+
+	if (!ms->crash_task_regs) {
+		bt->flags |= BT_REGS_NOT_FOUND;
+		return FALSE;
+	}
+
+	/*
+	 * We got registers for panic task from crash_notes. Just return them.
+	 */
+	regs = &ms->crash_task_regs[bt->tc->processor];
+	epc = regs->regs[RISCV64_REGS_EPC];
+	sp = regs->regs[RISCV64_REGS_SP];
+
+	/*
+	 * Set stack frame ptr.
+	 */
+	bt->frameptr = regs->regs[RISCV64_REGS_FP];
+
+	if (nip)
+		*nip = epc;
+	if (ksp)
+		*ksp = sp;
+
+	bt->machdep = regs;
+
+	return TRUE;
+}
+
+/*
+ * Do the work for riscv64_get_stack_frame() for non-active tasks.
+ * Get SP and PC values for idle tasks.
+ */
+static int
+riscv64_get_frame(struct bt_info *bt, ulong *pcp, ulong *spp)
+{
+	if (!bt->tc || !(tt->flags & THREAD_INFO))
+		return FALSE;
+
+	if (!readmem(bt->task + OFFSET(task_struct_thread_context_pc),
+		     KVADDR, pcp, sizeof(*pcp),
+		     "thread_struct.ra",
+		     RETURN_ON_ERROR))
+		return FALSE;
+
+	if (!readmem(bt->task + OFFSET(task_struct_thread_context_sp),
+		     KVADDR, spp, sizeof(*spp),
+		     "thread_struct.sp",
+		     RETURN_ON_ERROR))
+		return FALSE;
+
+	if (!readmem(bt->task + OFFSET(task_struct_thread_context_fp),
+		     KVADDR, &bt->frameptr, sizeof(bt->frameptr),
+		     "thread_struct.fp",
+		     RETURN_ON_ERROR))
+		return FALSE;
+
+	return TRUE;
+}
+
 static int
 riscv64_init_active_task_regs(void)
 {
@@ -967,6 +1247,8 @@ riscv64_init(int when)
 		machdep->uvtop = riscv64_uvtop;
 		machdep->kvtop = riscv64_kvtop;
 		machdep->cmd_mach = riscv64_cmd_mach;
+		machdep->get_stack_frame = riscv64_get_stack_frame;
+		machdep->back_trace = riscv64_back_trace_cmd;
 
 		machdep->vmalloc_start = riscv64_vmalloc_start;
 		machdep->processor_speed = riscv64_processor_speed;
@@ -987,6 +1269,7 @@ riscv64_init(int when)
 	case POST_GDB:
 		machdep->section_size_bits = _SECTION_SIZE_BITS;
 		machdep->max_physmem_bits = _MAX_PHYSMEM_BITS;
+		riscv64_stackframe_init();
 		riscv64_page_type_init();
 
 		if (!machdep->hz)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
