Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C49CA0EC1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCFXBbdEFALaVzMZ+dZOhhLIp72T9hGNJOQFREXIrOs=; b=mN9sZIy8/DR684
	lX6qBzGLBr0PclfOO0y5yQLyM8yZDY21M2FTXPTYIZu3Wz6OG1n7fbo1p/OYAWb3yqzMlnhW1QCH+
	2z10o8VV7fB5P5St1mJ4CS0HhpN/k3YyjoYWrRM94S8me9RdGiPQNrjKtg+c7I77TDI6540xLDAZN
	xSkxqNGNtsieN7oViljIHTig2sBv6dMer8/5anEGVgXGDrqCjGQyel3NJGTMZP9UTdxPqDVZr1dDC
	AlRVBpbrcN4gQP0yq5i3/Fx0K1YQ0nAgVmzDLlGq+w8ONWIfDmhDaSMlY7gLBXVUSH+pYmhVsGp9p
	2SG0RClOSnoisuobbpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNWB-0000000Dgi2-2IHl;
	Tue, 05 Aug 2025 19:40:15 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNW8-0000000Dgds-2erz
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 19:40:13 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7e699d1179cso451810385a.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 12:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754422812; x=1755027612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NaF/ZBQxTUv12deyQ9gwmEo84+EIUJjfCF9ZC+Wrs8=;
        b=NsC5NhUn61A4rHLpk8AAuvN+rRWSXSNn87ifbi7QvhQFivJa4qFIrLDtes+nzeEgg3
         gg8gN5KtO6yoJwfuzstUoRXoZkyokuI0STn0TohxiSwylnHikRGcYAIz2RI6nNYni/vG
         X8MEzoE1YqZTzjm9s8xw+3SK6E9AubJ8nYUesVtOeSYMBcTyNwzaj+IOnUiR0bn4h9PH
         k1CXhZZC4OmNMIuTg33ZOZqs1qUp/N5EgtcidS/ACd6p/+0qpfE/Uop/oyILo+/YO6W7
         uCECPCRxPnA2GctnfsKGMhh7++2zHfLldugoLI+Xwf+Ly0QcKvkfvgqZCU6j7Tn7SFC5
         Dg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754422812; x=1755027612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NaF/ZBQxTUv12deyQ9gwmEo84+EIUJjfCF9ZC+Wrs8=;
        b=HnbGnAZMwmdU8Cwgg29RjXL9Ete01akZr9eRwHwaat0+NPo92w//lbFINEvPwhfnyo
         BomwQz2aHAOMVF8YjA4oh9jyXX4H0E6Y6fq0myXfX2NnB6jJPUc3IRZwtCbzAf3iGS+E
         CpkGWMw5oD5MTWUmKXmp7JR7mi1j0kkCNDT1JdT5NivdAo4Y88WkG/WGoRDltov5SzYO
         GexYEz/xbbXS5+ludrwYdM2Uy2w1R5QrQRZ/3vgFOUMY94mYJk5kvWsOtng2XmZuRWmk
         XiN3AZC4xw8xz1RlSNXz+rwJn++unmijjylFBlFMjYZFlBbAGINavbiw3q7z2rKqHs5q
         06kw==
X-Gm-Message-State: AOJu0Yx/pQOIw6np9XkXrxOU3+Gu+i5k9AFHMljgn/GHNKID15ipf1Ni
	XLTT9i7LWK9eUBNZAhiHlQ2Jc8UC+6ZGFtxxfbiZssRxCu93xGZqJsNigMc6ROp4QJFPr+M7gVA
	fuzDj
X-Gm-Gg: ASbGncuBKh4GjHyKnjnAAfuxmdSLoa4wjfcZ/w6/15i7INTM2+1hmE/f1f6aEEZPFHi
	EmAUVOjusnMSwXqUucbq+TAHKOtuGxyV9ig5H/Sr0SA2gQzjfM4X1fodivsWsa8Z9a3gCooxjxC
	l+6fdrxS7epoEH3LFzCe2f8sjFsGSCkYsAcLOvhLgyl9K/g7BHIPwDhK/wEnvyQHB2DmS5Rp24f
	dlt76+9nm1WuORWxPiEH+D9+cZL21MU7QV3IaPWGIfCuXEFLy5NvV8NcDXeU0IXTckpMiu5PE1b
	aN/YV0kZX5VBBy0JEdjK9RiP/hecJNQMcSPGN073pX+ITEqWZl2+UN5fU6U2CQxmbJ+H7EjfKPK
	1mNfHaPyqlfJjMcR+v018oUE/fJG/oVSrHIzSflbGCw0xtbBp+jLhpXyS6f9PlkwgYH5tdbS3KN
	p52wcD7A==
X-Google-Smtp-Source: AGHT+IEiw5qn5MBLjumC4Tao3Un++oIx9bSGZnVNfPEZCF9kraUYTZzvHsq8Xt6WwLTbl66stoXsIA==
X-Received: by 2002:a05:620a:4410:b0:7e6:2f06:aca5 with SMTP id af79cd13be357-7e814ef34d2mr82086785a.61.1754422811237;
        Tue, 05 Aug 2025 12:40:11 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f7064b0sm717855685a.54.2025.08.05.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:40:10 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley  <conor.dooley@microchip.com>,
	Deepak Gupta  <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 6/8] riscv: ptrace: Add hw breakpoint support
Date: Tue,  5 Aug 2025 12:39:53 -0700
Message-ID: <20250805193955.798277-7-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805193955.798277-1-jesse@rivosinc.com>
References: <20250805193955.798277-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_124012_669323_60788135 
X-CRM114-Status: GOOD (  25.85  )
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

Add ability to setup hw breakpoints to ptrace. Call defines a new
structure of __riscv_hwdebug_state which will be passed to ptrace.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
RFC -> V1:
 - Add struct __riscv_hwdebug_state for ptrace_hbp_set/get
 - Break out ptrace_hbp_set/get so regset can use them
 - Check for NULL instead of IS_ERR_OR_NULL
 - Move	ptrace_get/sethbpregs above user_regset
---
 arch/riscv/include/asm/processor.h   |   4 +
 arch/riscv/include/uapi/asm/ptrace.h |   9 +++
 arch/riscv/kernel/hw_breakpoint.c    |  14 +++-
 arch/riscv/kernel/process.c          |   4 +
 arch/riscv/kernel/ptrace.c           | 110 +++++++++++++++++++++++++++
 5 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 5f56eb9d114a..488d956a951f 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -12,6 +12,7 @@
 
 #include <vdso/processor.h>
 
+#include <asm/hw_breakpoint.h>
 #include <asm/ptrace.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
@@ -108,6 +109,9 @@ struct thread_struct {
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
 	struct __riscv_v_ext_state kernel_vstate;
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	struct perf_event *ptrace_bps[RV_MAX_TRIGGERS];
+#endif
 #ifdef CONFIG_SMP
 	/* Flush the icache on migration */
 	bool force_icache_flush;
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index a38268b19c3d..20d1aa595cbd 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -14,6 +14,8 @@
 
 #define PTRACE_GETFDPIC_EXEC	0
 #define PTRACE_GETFDPIC_INTERP	1
+#define PTRACE_GETHBPREGS	2
+#define PTRACE_SETHBPREGS	3
 
 /*
  * User-mode register state for core dumps, ptrace, sigcontext
@@ -120,6 +122,13 @@ struct __riscv_v_regset_state {
 	char vreg[];
 };
 
+struct __riscv_hwdebug_state {
+	unsigned long addr;
+	unsigned long type;
+	unsigned long len;
+	unsigned long ctrl;
+} __packed;
+
 /*
  * According to spec: The number of bits in a single vector register,
  * VLEN >= ELEN, which must be a power of 2, and must be no greater than
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
index 1e70ef9e6867..b1c9c40f5fde 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -721,7 +721,19 @@ void arch_uninstall_hw_breakpoint(struct perf_event *event)
 		pr_warn("%s: Failed to uninstall trigger %d. error: %ld\n", __func__, i, ret.error);
 }
 
-void flush_ptrace_hw_breakpoint(struct task_struct *tsk) { }
+/*
+ * Release the user breakpoints used by ptrace
+ */
+void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+	int i;
+	struct thread_struct *t = &tsk->thread;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		unregister_hw_breakpoint(t->ptrace_bps[i]);
+		t->ptrace_bps[i] = NULL;
+	}
+}
 
 void hw_breakpoint_pmu_read(struct perf_event *bp) { }
 
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 15d8f75902f8..9cf07ecfb523 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/cpu.h>
+#include <linux/hw_breakpoint.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -164,6 +165,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 
 void flush_thread(void)
 {
+	flush_ptrace_hw_breakpoint(current);
 #ifdef CONFIG_FPU
 	/*
 	 * Reset FPU state and context
@@ -218,6 +220,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		set_bit(MM_CONTEXT_LOCK_PMLEN, &p->mm->context.flags);
 
 	memset(&p->thread.s, 0, sizeof(p->thread.s));
+	if (IS_ENABLED(CONFIG_HAVE_HW_BREAKPOINT))
+		memset(p->thread.ptrace_bps, 0, sizeof(p->thread.ptrace_bps));
 
 	/* p->thread holds context to be restored by __switch_to() */
 	if (unlikely(args->fn)) {
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index ea67e9fb7a58..e097e6a61910 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -9,11 +9,13 @@
 
 #include <asm/vector.h>
 #include <asm/ptrace.h>
+#include <asm/hw_breakpoint.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
 #include <asm/switch_to.h>
 #include <linux/audit.h>
 #include <linux/compat.h>
+#include <linux/hw_breakpoint.h>
 #include <linux/ptrace.h>
 #include <linux/elf.h>
 #include <linux/regset.h>
@@ -184,6 +186,104 @@ static int tagged_addr_ctrl_set(struct task_struct *target,
 }
 #endif
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+static void ptrace_hbptriggered(struct perf_event *bp,
+				struct perf_sample_data *data,
+				struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint *bkpt = counter_arch_bp(bp);
+	int num = 0;
+
+	force_sig_ptrace_errno_trap(num, (void __user *)bkpt->address);
+}
+
+static int ptrace_hbp_get(struct task_struct *child, unsigned long idx,
+			  struct __riscv_hwdebug_state *state)
+{
+	struct perf_event *bp;
+
+	if (idx >= RV_MAX_TRIGGERS)
+		return -EINVAL;
+
+	bp = child->thread.ptrace_bps[idx];
+
+	if (!bp)
+		return -ENOENT;
+
+	state->addr = bp->attr.bp_addr;
+	state->len = bp->attr.bp_len;
+	state->type = bp->attr.bp_type;
+	state->ctrl = bp->attr.disabled == 1;
+
+	return 0;
+}
+
+static int ptrace_hbp_set(struct task_struct *child, unsigned long idx,
+			  struct __riscv_hwdebug_state *state)
+{
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+
+	if (idx >= RV_MAX_TRIGGERS)
+		return -EINVAL;
+
+	bp = child->thread.ptrace_bps[idx];
+	if (bp)
+		attr = bp->attr;
+	else
+		ptrace_breakpoint_init(&attr);
+
+	attr.bp_addr = state->addr;
+	attr.bp_len = state->len;
+	attr.bp_type = state->type;
+	attr.disabled = state->ctrl == 1;
+
+	if (!bp) {
+		bp = register_user_hw_breakpoint(&attr, ptrace_hbptriggered, NULL,
+					   child);
+		if (IS_ERR(bp))
+			return PTR_ERR(bp);
+
+		child->thread.ptrace_bps[idx] = bp;
+		return 0;
+	}
+
+	return modify_user_hw_breakpoint(bp, &attr);
+}
+
+/*
+ * idx selects the breakpoint index.
+ * Both PTRACE_GETHBPREGS and PTRACE_SETHBPREGS transfer __riscv_hwdebug_state
+ */
+
+static long ptrace_gethbpregs(struct task_struct *child, unsigned long idx,
+			      unsigned long __user *datap)
+{
+	struct __riscv_hwdebug_state state;
+	long ret;
+
+	ret = ptrace_hbp_get(child, idx, &state);
+	if (ret)
+		return ret;
+	if (copy_to_user(datap, &state, sizeof(state)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long ptrace_sethbpregs(struct task_struct *child, unsigned long idx,
+			      unsigned long __user *datap)
+{
+	struct __riscv_hwdebug_state state;
+
+	if (copy_from_user(&state, datap, sizeof(state)))
+		return -EFAULT;
+
+	return ptrace_hbp_set(child, idx, &state);
+
+}
+#endif
+
 static const struct user_regset riscv_user_regset[] = {
 	[REGSET_X] = {
 		.core_note_type = NT_PRSTATUS,
@@ -340,8 +440,18 @@ long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
 	long ret = -EIO;
+	unsigned long __user *datap = (unsigned long __user *) data;
 
 	switch (request) {
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	case PTRACE_GETHBPREGS:
+		ret = ptrace_gethbpregs(child, addr, datap);
+		break;
+
+	case PTRACE_SETHBPREGS:
+		ret = ptrace_sethbpregs(child, addr, datap);
+		break;
+#endif
 	default:
 		ret = ptrace_request(child, request, addr, data);
 		break;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
