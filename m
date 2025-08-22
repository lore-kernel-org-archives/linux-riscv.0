Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B333ECA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNn9jd4KKvo1ou81QNyt/rLOLk9rQtjk4Ex7MT62ebI=; b=eeIQ6CtF3z2KBV
	QBdL22pbpB9N3NvB7zwAt2ixtIbcRIANPL5EunAyVuHKRdKdg2mBnk+sJjUafHs7yMil6xJn1lwmx
	nDV6wsHlylbKI++Zg/3Rrjzh3leTm/FAO5mTye07jhbGpTSmcwJfHz/AGVwAzKDOOR/ZdAji29Lb6
	jspI9JJ6tvHhmoTOrdlxXmMtI+ZGw/QXWGUfT1jOQC5bt8XxwPhuWutRZ2TPc3lKQMfeHM1l5fKU5
	WUbKl+qGMCLSkqUd1iEMgdTN05jEhLFrlSJWNJtaxK4czHz4XH46eIHvg67k3aMWIAbA8uvHU9x8O
	aUEMEyzcycrJhnPcrisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwf-00000004DeY-0GBr;
	Sat, 23 Aug 2025 06:41:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVrU-00000003GHo-0srY
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 17:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=485omdnoiZ8q/zyCXrPmnF91ALfkIJJ0rUsYbVB32HY=; b=N8qczx5gqAko4rvcM58R4TC5al
	GHhdCmyca9HJB+KKXml2KrL0FBlMfBRU/v9VC6q6uqeRn1k8ciMzUwT+KEMxvlSGV+vWIrfzVwxrn
	INVsKPBvZeq+3Vdh2JGOs1zchjuYaqMZ4ToUM+N3b1XFGKW3nLDtw1A7qGO0feGLK9aLA4+jXV++V
	42gzHryg3ZdR55EGKnn8uwI+ICq/DCDJSRvSXWi/UYhvwjPiVPWUTbNzHUboBGThI5L7zJ5LCvgXo
	Sdm1hr1wq6L3s8Acmv8YmlD1G4fzc/O0W4anscHQl5gAWlSHhew2qCd6eGi/ERYInBrfVn9O/cG1M
	0P2VfzWQ==;
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVrR-000000013Oi-1bDr
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 17:47:35 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4b10c1abfe4so37045891cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1755884852; x=1756489652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=485omdnoiZ8q/zyCXrPmnF91ALfkIJJ0rUsYbVB32HY=;
        b=WX4Scniy1g2gifI9CFumkY+h2M/CW2XITSPXKyQ52z1elRnSmg28MAzO/LlIbW62uS
         bM6n4kS2ysr8scsAr0UorwhotQeLR058RLdd7F9HqE0aX92eT/tgtN2iyTFCzeGWMruV
         iwazf2zDfJdzUtEM/lki3L8FJ37aW37bogMvo4QohpYMiKWo5ZNGtEKyMDbPevz5ka/o
         0z33aDycga2+zbjRZ2QzSj9RQ70RBR6bfhFt9bD0gTQBi1/xazu9rHuUi46aFANZEL2k
         aN9tu3BNV7cO/HlS6830uVyjFklx6BXsUq6sXRMrAzmsuBo2LYXVMJedPhLIw17T4Tkh
         QjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755884852; x=1756489652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=485omdnoiZ8q/zyCXrPmnF91ALfkIJJ0rUsYbVB32HY=;
        b=KssoefAYGCrMrK24C01jHK1J1wST0nSVtS+M/1B3pj5dnMlZltvwfpwUAmA9Xev1yE
         WzYmlZz8RIP297ELEondBPnbY4PKaydMKM2jgQnEGGrsgu2SWpI2gmPNTyOtRPcd+sy6
         GM6fQc55m8DpwWcHRAtFEee3Kh99xNsevZSatBum1wwWbLblYUsf+XJsTPEP8TC4z4If
         mVXV+XiokoSoiMEWmFzUyB6oU2wOTERxi5AyvqE1kZ3WYlDFvFhL1kylkaiEEtiRTArH
         +f/PXuLoOYAdHHg/qhhq7wW/EB+3DNCZHYI4v2LUN0fdqY0HMu0WB3Zn+IXpyGqtt2Z+
         65+A==
X-Gm-Message-State: AOJu0YzvvtGShfxuxVg4qr31fipI/+F3DDjCCS+lELVAWgsCoisobAV2
	U7FY9/3KlKJ3FtAMIYGupLrpZih4lmvE59gwZn+5ZpcGdjJzwlBb4YFcVbXGQ07no88HWViG8Rc
	WEpBT
X-Gm-Gg: ASbGncsxavYosLxH7U0zggW+TSdks1NRIkfjKUVBpZHr7H9G151V2wX28HtMsqz7gpD
	ROxqx11qEDkfTns/4Fd9nKNg26+jlnVal72E8klrk0p1l6zAlpQFH3FUgPMGD7JBQaYW7m6FYCX
	oXQdx+GpOIWJxyNDfva06E4K8KltxgIBos/Xmib5xgJaF2bVjgGTZJ/2q5XGfa9hV/NaXKn9uKd
	chv2I2eOnEs36Y3p6Q+igimi09RQDIRbKLn8+tctKZXIwxzn+hnakEf61ELEzxNwjYVQLqydsq5
	23/WvVN30PntPVprWOEFlNnAC0ulv/3SI1g4AGD/yH4k9qfY8bR3EfsO8Fpcz5puiRQm2a72M9R
	t5yNg0evCM6Aslh/gIv+u9LGGEhVdsFeaP7xOYWGclvuz40Ta+y6vae7zk5LuCOBOQ2x6fHqWRB
	PvXj4wfvJQlOIcXKV6
X-Google-Smtp-Source: AGHT+IGoenLDbU6hbLQEKjRKYVSKG56q+cISud/2IPoQ+SsuP/D2JDv3vRwFBNiEIIl5J7Ci/Xlcfg==
X-Received: by 2002:a05:622a:1115:b0:4b2:8ac4:f07f with SMTP id d75a77b69052e-4b2aab8c4e6mr52180651cf.81.1755884851684;
        Fri, 22 Aug 2025 10:47:31 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8e6023asm3121361cf.53.2025.08.22.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:47:31 -0700 (PDT)
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
	"Liang Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Deepak Gupta <debug@rivosinc.com>,
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
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 6/8] riscv: ptrace: Add hw breakpoint support
Date: Fri, 22 Aug 2025 10:47:13 -0700
Message-ID: <20250822174715.1269138-7-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822174715.1269138-1-jesse@rivosinc.com>
References: <20250822174715.1269138-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_184733_521086_2B4FF64B 
X-CRM114-Status: GOOD (  25.90  )
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
V1 -> V2:
 - No change
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
index f12306247436..f8841941f2ab 100644
--- a/arch/riscv/kernel/hw_breakpoint.c
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -715,7 +715,19 @@ void arch_uninstall_hw_breakpoint(struct perf_event *event)
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
