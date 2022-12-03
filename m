Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC26C47088
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3lrnrczzk8cOqLKObb0guP/tjy8Y+u3+8lj3ZjpX5E=; b=BMTbEhBhyQbtDx
	9yHqZTstOoQ/opJs1/2IjT7t9sZsvo2+digFRz5XxObuKRPH689VuMQJLWPfDN5LpKbWQSVxS9JHM
	7CGSkr3ON9PmU6IQQk/mDQOKoWyg02jMtr5LHbe7zFwBOd6l0Z79GoVzTSoiRWs3GE2fY5rjlR9cL
	O5p+juosGwFFFfssPFX0H6+PlF6t9LIkpz0NCM67RMigAl6e+lTcfkso+wR+pSjT7cIhXdDNGpEWV
	MS1u+NmC4GR5sNhLqEna00hOqo+9lW2EHtDBYEMlkAcALDrN5WvKtFcApaVnpILmGPs005KIxr/oX
	xUhb5kU9cg78EvxpiZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1aU8-005UUz-R0; Sat, 03 Dec 2022 21:55:48 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1aU3-005USZ-L8
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 21:55:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id cf42so6983403lfb.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Dec 2022 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GyibfRdgYwhKvoXFpAWyMLdkVYN+dEub7t9eOn5cFE=;
        b=hLgjNI3YT2dZMVdqyQSHoHjIL1FbqCAnt1DCJ8W+4qHJuwQmLzLUhWk8eDzvh9FBCL
         ETnJoqBiJ+K1f5mtZJjRiKxyfU6f9Ac59BntgseZzIH0IarU2Zw3J7M0EtuSr16OH2ob
         iLClEhhYAa+2H8XzuEr1xfwmX0D2UrKRARXanOjgcSqrv4bA8EPA8/mICrvqje8szP99
         4pfej66Kl3NuW85K5KElSSkMG0Fxx4ShGAmrj/R1J6QnU8iI3WLjGToh46rpW/uTcLPd
         f7NB2doUBaMn5l+slVPYGkUPfvGMPdA+IzDRVcf3cDCMYXKYyNXZZy6WzbLAwL5baJwa
         4cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GyibfRdgYwhKvoXFpAWyMLdkVYN+dEub7t9eOn5cFE=;
        b=b+fL1EjC6og0tE1852UGCeeQ/e5zdq3AsLyb2C0H9dzlqt2nZZLj6GWX23jXyEy8ew
         dV9KliGn+9sjgLjiKbas5jr53F8I/gzglbrteGoHgmt/7/CjQ2DRKfHp88eU0Avhf2Z8
         748JVmcy6IKh0rez2ELjK0h7PSQn3duIkNWy3jb5SWKY8dizaRfgcJ7tQ2vHm7mRtVf2
         Ct2xNdzeDzS1Oslock3RVjeP3osd6D1oUEY552qELcdIGsl88+6ELalgbpPhRWmfCR25
         NOuiTajoCQYYmy4Mahn+DKIqHYsgjBta2wf4Ux6pZx549QGNAUrF00a2jr1fkEYPpqQU
         VU3A==
X-Gm-Message-State: ANoB5pk9IHlm0LxWULt0ESC1Pp4zS99+mGdyDdChdoAnL4R+iSHEUnl2
	TKFmeQSQ8c60jWpebE2lexdQT8rBCeCdxQ==
X-Google-Smtp-Source: AA0mqf41X96fesp37/6cQiuBRBe31quDxFJFdLG/jN8DNShLm8FWwkf3zNFqXzv9S+dXR3d0sUuqjg==
X-Received: by 2002:a05:6512:484:b0:4a2:33f8:2d0f with SMTP id v4-20020a056512048400b004a233f82d0fmr24711427lfq.140.1670104539354;
        Sat, 03 Dec 2022 13:55:39 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id j2-20020a056512344200b004b4f2a30e6csm1537002lfr.0.2022.12.03.13.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 13:55:38 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH RFC v2 1/3] riscv: add support for hardware breakpoints/watchpoints
Date: Sun,  4 Dec 2022 00:55:33 +0300
Message-Id: <20221203215535.208948-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203215535.208948-1-geomatsi@gmail.com>
References: <20221203215535.208948-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_135543_824875_270E7F28 
X-CRM114-Status: GOOD (  26.05  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

RISC-V backend for hw-breakpoint framework is built on top of SBI Debug
Trigger extension. Architecture specific hooks are implemented as kernel
wrappers around ecalls to SBI functions. This patch implements only a
minimal set of hooks required to support user-space debug via ptrace.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 arch/riscv/Kconfig                     |   2 +
 arch/riscv/include/asm/hw_breakpoint.h | 157 +++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/include/asm/processor.h     |   5 +
 arch/riscv/include/asm/sbi.h           |  24 ++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 432 +++++++++++++++++++++++++
 arch/riscv/kernel/process.c            |   1 +
 arch/riscv/kernel/traps.c              |   5 +
 9 files changed, 629 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 593cf09264d8..fe7f63928235 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -95,10 +95,12 @@ config RISCV
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO if MMU && 64BIT
+	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_MIXED_BREAKPOINTS_REGS
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
new file mode 100644
index 000000000000..5bb3b55cd464
--- /dev/null
+++ b/arch/riscv/include/asm/hw_breakpoint.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __RISCV_HW_BREAKPOINT_H
+#define __RISCV_HW_BREAKPOINT_H
+
+struct task_struct;
+
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+
+#include <uapi/linux/hw_breakpoint.h>
+
+#if __riscv_xlen == 64
+#define cpu_to_lle cpu_to_le64
+#define lle_to_cpu le64_to_cpu
+#elif __riscv_xlen == 32
+#define cpu_to_lle cpu_to_le32
+#define lle_to_cpu le32_to_cpu
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+enum {
+	RISCV_DBTR_BREAKPOINT	= 0,
+	RISCV_DBTR_WATCHPOINT	= 1,
+};
+
+enum {
+	RISCV_DBTR_TRIG_NONE = 0,
+	RISCV_DBTR_TRIG_LEGACY,
+	RISCV_DBTR_TRIG_MCONTROL,
+	RISCV_DBTR_TRIG_ICOUNT,
+	RISCV_DBTR_TRIG_ITRIGGER,
+	RISCV_DBTR_TRIG_ETRIGGER,
+	RISCV_DBTR_TRIG_MCONTROL6,
+};
+
+union riscv_dbtr_tdata1 {
+	unsigned long value;
+	struct {
+#if __riscv_xlen == 64
+		unsigned long data:59;
+#elif __riscv_xlen == 32
+		unsigned long data:27;
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+		unsigned long dmode:1;
+		unsigned long type:4;
+	};
+};
+
+union riscv_dbtr_tdata1_mcontrol {
+	unsigned long value;
+	struct {
+		unsigned long load:1;
+		unsigned long store:1;
+		unsigned long execute:1;
+		unsigned long u:1;
+		unsigned long s:1;
+		unsigned long _res2:1;
+		unsigned long m:1;
+		unsigned long match:4;
+		unsigned long chain:1;
+		unsigned long action:4;
+		unsigned long sizelo:2;
+		unsigned long timing:1;
+		unsigned long select:1;
+		unsigned long hit:1;
+#if __riscv_xlen >= 64
+		unsigned long sizehi:2;
+		unsigned long _res1:30;
+#endif
+		unsigned long maskmax:6;
+		unsigned long dmode:1;
+		unsigned long type:4;
+	};
+};
+
+union riscv_dbtr_tdata1_mcontrol6 {
+	unsigned long value;
+	struct {
+		unsigned long load:1;
+		unsigned long store:1;
+		unsigned long execute:1;
+		unsigned long u:1;
+		unsigned long s:1;
+		unsigned long _res2:1;
+		unsigned long m:1;
+		unsigned long match:4;
+		unsigned long chain:1;
+		unsigned long action:4;
+		unsigned long size:4;
+		unsigned long timing:1;
+		unsigned long select:1;
+		unsigned long hit:1;
+		unsigned long vu:1;
+		unsigned long vs:1;
+#if __riscv_xlen == 64
+		unsigned long _res1:34;
+#elif __riscv_xlen == 32
+		unsigned long _res1:2;
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+		unsigned long dmode:1;
+		unsigned long type:4;
+	};
+};
+
+struct arch_hw_breakpoint {
+	unsigned long address;
+	unsigned long len;
+	unsigned int type;
+
+	union {
+		unsigned long value;
+		union riscv_dbtr_tdata1_mcontrol mcontrol;
+		union riscv_dbtr_tdata1_mcontrol6 mcontrol6;
+	} trig_data1;
+	unsigned long trig_data2;
+	unsigned long trig_data3;
+};
+
+/* Max supported HW breakpoints */
+#define HBP_NUM_MAX 32
+
+struct perf_event_attr;
+struct notifier_block;
+struct perf_event;
+struct pt_regs;
+
+int hw_breakpoint_slots(int type);
+int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
+int hw_breakpoint_arch_parse(struct perf_event *bp,
+			     const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw);
+int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
+				    unsigned long val, void *data);
+
+int arch_install_hw_breakpoint(struct perf_event *bp);
+void arch_uninstall_hw_breakpoint(struct perf_event *bp);
+void hw_breakpoint_pmu_read(struct perf_event *bp);
+void clear_ptrace_hw_breakpoint(struct task_struct *tsk);
+
+#else
+
+int hw_breakpoint_slots(int type)
+{
+	return 0;
+}
+
+static inline void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+}
+
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+#endif /* __RISCV_HW_BREAKPOINT_H */
diff --git a/arch/riscv/include/asm/kdebug.h b/arch/riscv/include/asm/kdebug.h
index 85ac00411f6e..53e989781aa1 100644
--- a/arch/riscv/include/asm/kdebug.h
+++ b/arch/riscv/include/asm/kdebug.h
@@ -6,7 +6,8 @@
 enum die_val {
 	DIE_UNUSED,
 	DIE_TRAP,
-	DIE_OOPS
+	DIE_OOPS,
+	DIE_DEBUG
 };
 
 #endif
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 94a0590c6971..10c87fba2548 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -11,6 +11,7 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/hw_breakpoint.h>
 
 /*
  * This decides where the kernel will search for a free chunk of vm
@@ -29,6 +30,7 @@
 #ifndef __ASSEMBLY__
 
 struct task_struct;
+struct perf_event;
 struct pt_regs;
 
 /* CPU-specific state of a task */
@@ -39,6 +41,9 @@ struct thread_struct {
 	unsigned long s[12];	/* s[0]: frame pointer */
 	struct __riscv_d_ext_state fstate;
 	unsigned long bad_cause;
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	struct perf_event *ptrace_bps[HBP_NUM_MAX];
+#endif
 };
 
 /* Whitelist the fstate from the task_struct for hardened usercopy */
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 2a0ef738695e..ef41d60a5ed3 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -31,6 +31,9 @@ enum sbi_ext_id {
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_PMU = 0x504D55,
 
+	/* Experimental: Debug Trigger Extension */
+	SBI_EXT_DBTR = 0x44425452,
+
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
 	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
@@ -113,6 +116,27 @@ enum sbi_srst_reset_reason {
 	SBI_SRST_RESET_REASON_SYS_FAILURE,
 };
 
+enum sbi_ext_dbtr_fid {
+	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
+	SBI_EXT_DBTR_TRIGGER_READ,
+	SBI_EXT_DBTR_TRIGGER_INSTALL,
+	SBI_EXT_DBTR_TRIGGER_UNINSTALL,
+	SBI_EXT_DBTR_TRIGGER_ENABLE,
+	SBI_EXT_DBTR_TRIGGER_UPDATE,
+	SBI_EXT_DBTR_TRIGGER_DISABLE,
+};
+
+struct sbi_dbtr_data_msg {
+	unsigned long tstate;
+	unsigned long tdata1;
+	unsigned long tdata2;
+	unsigned long tdata3;
+};
+
+struct sbi_dbtr_id_msg {
+	unsigned long idx;
+};
+
 enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_NUM_COUNTERS = 0,
 	SBI_EXT_PMU_COUNTER_GET_INFO,
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index db6e4b1294ba..116697d0ca1d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_TRACE_IRQFLAGS)	+= trace_irq.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
+obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP) += cpu_ops_sbi.o
diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
new file mode 100644
index 000000000000..8eddf512cd03
--- /dev/null
+++ b/arch/riscv/kernel/hw_breakpoint.c
@@ -0,0 +1,432 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/hw_breakpoint.h>
+#include <linux/perf_event.h>
+#include <linux/percpu.h>
+#include <linux/kdebug.h>
+
+#include <asm/sbi.h>
+
+/* bps/wps currently set on each debug trigger for each cpu */
+static DEFINE_PER_CPU(struct perf_event *, bp_per_reg[HBP_NUM_MAX]);
+
+static struct sbi_dbtr_data_msg __percpu *sbi_xmit;
+static struct sbi_dbtr_id_msg __percpu *sbi_recv;
+
+/* number of debug triggers on this cpu . */
+static int dbtr_total_num __ro_after_init;
+static int dbtr_type __ro_after_init;
+static int dbtr_init __ro_after_init;
+
+void arch_hw_breakpoint_init_sbi(void)
+{
+	union riscv_dbtr_tdata1 tdata1;
+	struct sbiret ret;
+
+	if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
+		pr_info("%s: SBI_EXT_DBTR is not supported\n", __func__);
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			0, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to detect triggers\n", __func__);
+		dbtr_total_num = 0;
+		goto done;
+	}
+
+	tdata1.value = 0;
+	tdata1.type = RISCV_DBTR_TRIG_MCONTROL6;
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1.value, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to detect mcontrol6 triggers\n", __func__);
+	} else if (!ret.value) {
+		pr_warn("%s: type 6 triggers not available\n", __func__);
+	} else {
+		dbtr_total_num = ret.value;
+		dbtr_type = RISCV_DBTR_TRIG_MCONTROL6;
+		goto done;
+	}
+
+	/* fallback to type 2 triggers if type 6 is not available */
+
+	tdata1.value = 0;
+	tdata1.type = RISCV_DBTR_TRIG_MCONTROL;
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
+			tdata1.value, 0, 0, 0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to detect mcontrol triggers\n", __func__);
+	} else if (!ret.value) {
+		pr_warn("%s: type 2 triggers not available\n", __func__);
+	} else {
+		dbtr_total_num = ret.value;
+		dbtr_type = RISCV_DBTR_TRIG_MCONTROL;
+		goto done;
+	}
+
+done:
+	dbtr_init = 1;
+}
+
+int hw_breakpoint_slots(int type)
+{
+	/*
+	 * We can be called early, so don't rely on
+	 * static variables being initialised.
+	 */
+
+	if (!dbtr_init)
+		arch_hw_breakpoint_init_sbi();
+
+	return dbtr_total_num;
+}
+
+int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw)
+{
+	unsigned int len;
+	unsigned long va;
+
+	va = hw->address;
+	len = hw->len;
+
+	return (va >= TASK_SIZE) && ((va + len - 1) >= TASK_SIZE);
+}
+
+int arch_build_type2_trigger(const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw)
+{
+	/* type */
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RISCV_DBTR_BREAKPOINT;
+		hw->trig_data1.mcontrol.execute = 1;
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RISCV_DBTR_WATCHPOINT;
+		hw->trig_data1.mcontrol.load = 1;
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RISCV_DBTR_WATCHPOINT;
+		hw->trig_data1.mcontrol.store = 1;
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RISCV_DBTR_WATCHPOINT;
+		hw->trig_data1.mcontrol.store = 1;
+		hw->trig_data1.mcontrol.load = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* length */
+	switch (attr->bp_len) {
+	case HW_BREAKPOINT_LEN_1:
+		hw->len = 1;
+		hw->trig_data1.mcontrol.sizelo = 1;
+		break;
+	case HW_BREAKPOINT_LEN_2:
+		hw->len = 2;
+		hw->trig_data1.mcontrol.sizelo = 2;
+		break;
+	case HW_BREAKPOINT_LEN_4:
+		hw->len = 4;
+		hw->trig_data1.mcontrol.sizelo = 3;
+		break;
+#if __riscv_xlen >= 64
+	case HW_BREAKPOINT_LEN_8:
+		hw->len = 8;
+		hw->trig_data1.mcontrol.sizelo = 1;
+		hw->trig_data1.mcontrol.sizehi = 1;
+		break;
+#endif
+	default:
+		return -EINVAL;
+	}
+
+	hw->trig_data1.mcontrol.type = RISCV_DBTR_TRIG_MCONTROL;
+	hw->trig_data1.mcontrol.dmode = 0;
+	hw->trig_data1.mcontrol.timing = 0;
+	hw->trig_data1.mcontrol.select = 0;
+	hw->trig_data1.mcontrol.action = 0;
+	hw->trig_data1.mcontrol.chain = 0;
+	hw->trig_data1.mcontrol.match = 0;
+
+	hw->trig_data1.mcontrol.m = 0;
+	hw->trig_data1.mcontrol.s = 1;
+	hw->trig_data1.mcontrol.u = 1;
+
+	return 0;
+}
+
+int arch_build_type6_trigger(const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw)
+{
+	/* type */
+	switch (attr->bp_type) {
+	case HW_BREAKPOINT_X:
+		hw->type = RISCV_DBTR_BREAKPOINT;
+		hw->trig_data1.mcontrol6.execute = 1;
+		break;
+	case HW_BREAKPOINT_R:
+		hw->type = RISCV_DBTR_WATCHPOINT;
+		hw->trig_data1.mcontrol6.load = 1;
+		break;
+	case HW_BREAKPOINT_W:
+		hw->type = RISCV_DBTR_WATCHPOINT;
+		hw->trig_data1.mcontrol6.store = 1;
+		break;
+	case HW_BREAKPOINT_RW:
+		hw->type = RISCV_DBTR_WATCHPOINT;
+		hw->trig_data1.mcontrol6.store = 1;
+		hw->trig_data1.mcontrol6.load = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* length */
+	switch (attr->bp_len) {
+	case HW_BREAKPOINT_LEN_1:
+		hw->len = 1;
+		hw->trig_data1.mcontrol6.size = 1;
+		break;
+	case HW_BREAKPOINT_LEN_2:
+		hw->len = 2;
+		hw->trig_data1.mcontrol6.size = 2;
+		break;
+	case HW_BREAKPOINT_LEN_4:
+		hw->len = 4;
+		hw->trig_data1.mcontrol6.size = 3;
+		break;
+	case HW_BREAKPOINT_LEN_8:
+		hw->len = 8;
+		hw->trig_data1.mcontrol6.size = 5;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	hw->trig_data1.mcontrol6.type = RISCV_DBTR_TRIG_MCONTROL6;
+	hw->trig_data1.mcontrol6.dmode = 0;
+	hw->trig_data1.mcontrol6.timing = 0;
+	hw->trig_data1.mcontrol6.select = 0;
+	hw->trig_data1.mcontrol6.action = 0;
+	hw->trig_data1.mcontrol6.chain = 0;
+	hw->trig_data1.mcontrol6.match = 0;
+
+	hw->trig_data1.mcontrol6.m = 0;
+	hw->trig_data1.mcontrol6.s = 1;
+	hw->trig_data1.mcontrol6.u = 1;
+	hw->trig_data1.mcontrol6.vs = 0;
+	hw->trig_data1.mcontrol6.vu = 0;
+
+	return 0;
+}
+
+int hw_breakpoint_arch_parse(struct perf_event *bp,
+			     const struct perf_event_attr *attr,
+			     struct arch_hw_breakpoint *hw)
+{
+	int ret;
+
+	/* address */
+	hw->address = attr->bp_addr;
+	hw->trig_data2 = attr->bp_addr;
+	hw->trig_data3 = 0x0;
+
+	switch (dbtr_type) {
+	case RISCV_DBTR_TRIG_MCONTROL:
+		ret = arch_build_type2_trigger(attr, hw);
+		break;
+	case RISCV_DBTR_TRIG_MCONTROL6:
+		ret = arch_build_type6_trigger(attr, hw);
+		break;
+	default:
+		pr_warn("unsupported trigger type\n");
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+/*
+ * Handle debug exception notifications.
+ */
+static int hw_breakpoint_handler(struct die_args *args)
+{
+	int ret = NOTIFY_DONE;
+	struct arch_hw_breakpoint *info;
+	struct perf_event *bp;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; ++i) {
+		bp = this_cpu_read(bp_per_reg[i]);
+		if (!bp)
+			continue;
+
+		info = counter_arch_bp(bp);
+		switch (info->type) {
+		case RISCV_DBTR_BREAKPOINT:
+			if (info->address == args->regs->epc) {
+				pr_debug("%s: breakpoint fired: pc[0x%lx]\n",
+					 __func__, args->regs->epc);
+				perf_bp_event(bp, args->regs);
+				ret = NOTIFY_STOP;
+			}
+
+			break;
+		case RISCV_DBTR_WATCHPOINT:
+			if (info->address == csr_read(CSR_STVAL)) {
+				pr_debug("%s: watchpoint fired: addr[0x%lx]\n",
+					 __func__, info->address);
+				perf_bp_event(bp, args->regs);
+				ret = NOTIFY_STOP;
+			}
+
+			break;
+		default:
+			pr_warn("%s: unexpected breakpoint type: %u\n",
+				__func__, info->type);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
+				    unsigned long val, void *data)
+{
+	if (val != DIE_DEBUG)
+		return NOTIFY_DONE;
+
+	return hw_breakpoint_handler(data);
+}
+
+/* atomic: counter->ctx->lock is held */
+int arch_install_hw_breakpoint(struct perf_event *bp)
+{
+	struct arch_hw_breakpoint *info = counter_arch_bp(bp);
+	struct sbi_dbtr_data_msg *xmit = this_cpu_ptr(sbi_xmit);
+	struct sbi_dbtr_id_msg *recv = this_cpu_ptr(sbi_recv);
+	struct perf_event **slot;
+	unsigned long idx;
+	struct sbiret ret;
+
+	xmit->tdata1 = cpu_to_lle(info->trig_data1.value);
+	xmit->tdata2 = cpu_to_lle(info->trig_data2);
+	xmit->tdata3 = cpu_to_lle(info->trig_data3);
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_INSTALL,
+			1, __pa(xmit) >> 4, __pa(recv) >> 4,
+			0, 0, 0);
+	if (ret.error) {
+		pr_warn("%s: failed to install trigger\n", __func__);
+		return -EIO;
+	}
+
+	idx = lle_to_cpu(recv->idx);
+
+	if (idx >= dbtr_total_num) {
+		pr_warn("%s: invalid trigger index %lu\n", __func__, idx);
+		return -EINVAL;
+	}
+
+	slot = this_cpu_ptr(&bp_per_reg[idx]);
+	if (*slot) {
+		pr_warn("%s: slot %lu is in use\n", __func__, idx);
+		return -EBUSY;
+	}
+
+	*slot = bp;
+
+	return 0;
+}
+
+/* atomic: counter->ctx->lock is held */
+void arch_uninstall_hw_breakpoint(struct perf_event *bp)
+{
+	struct sbiret ret;
+	int i;
+
+	for (i = 0; i < dbtr_total_num; i++) {
+		struct perf_event **slot = this_cpu_ptr(&bp_per_reg[i]);
+
+		if (*slot == bp) {
+			*slot = NULL;
+			break;
+		}
+	}
+
+	if (i == dbtr_total_num) {
+		pr_warn("%s: unknown breakpoint\n", __func__);
+		return;
+	}
+
+	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_UNINSTALL,
+			i, 1, 0, 0, 0, 0);
+	if (ret.error)
+		pr_warn("%s: failed to uninstall trigger %d\n", __func__, i);
+}
+
+void hw_breakpoint_pmu_read(struct perf_event *bp)
+{
+}
+
+/*
+ * Set ptrace breakpoint pointers to zero for this task.
+ * This is required in order to prevent child processes from unregistering
+ * breakpoints held by their parent.
+ */
+void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
+{
+	memset(tsk->thread.ptrace_bps, 0, sizeof(tsk->thread.ptrace_bps));
+}
+
+/*
+ * Unregister breakpoints from this task and reset the pointers in
+ * the thread_struct.
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
+
+static int __init arch_hw_breakpoint_init(void)
+{
+	sbi_xmit = __alloc_percpu(sizeof(*sbi_xmit), SZ_16);
+	if (!sbi_xmit) {
+		pr_warn("failed to allocate SBI xmit message buffer\n");
+		return -ENOMEM;
+	}
+
+	sbi_recv = __alloc_percpu(sizeof(*sbi_recv), SZ_16);
+	if (!sbi_recv) {
+		pr_warn("failed to allocate SBI recv message buffer\n");
+		return -ENOMEM;
+	}
+
+	if (!dbtr_init)
+		arch_hw_breakpoint_init_sbi();
+
+	if (dbtr_total_num)
+		pr_info("%s: total number of type %d triggers: %u\n",
+			__func__, dbtr_type, dbtr_total_num);
+	else
+		pr_info("%s: no hardware triggers available\n", __func__);
+
+	return 0;
+}
+arch_initcall(arch_hw_breakpoint_init);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 8955f2432c2d..cd99bececed8 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -187,5 +187,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		p->thread.ra = (unsigned long)ret_from_fork;
 	}
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
+	clear_ptrace_hw_breakpoint(p);
 	return 0;
 }
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 7abd8e4c4df6..34c93d2f159e 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -174,6 +174,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 
 	if (uprobe_breakpoint_handler(regs))
 		return;
+#endif
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	if (notify_die(DIE_DEBUG, "EBREAK", regs, 0, regs->cause, SIGTRAP)
+						       == NOTIFY_STOP)
+		return;
 #endif
 	current->thread.bad_cause = regs->cause;
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
