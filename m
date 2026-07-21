Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9ECC44529
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 07:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Dkd/oPsJGNZzHf3VPfUBCbpOW0ysg4mPW+mRWEUh/Q=; b=dn9+H7pCduMv9F
	5emGAL0lF53ywdlcIE3g8Ia18Ha2abW9ZHEr7GFIO6m3YWWwqyWHZAsxlj/yItXp53DEqJkFzoBNY
	PGo9XiUve1HMWODDg/cOcBBAUba8rd1I3lnufF0+ii/szERewAQeBijdlawi3x38Sd2kYC5jgl2Wf
	PRCJzwQZfx1b5jyvXH6OnyfEAOIXGo5n4C0PnSmXqTypYwDs3wwQMu7XUOKG/IIQjGcT2HU1RPgBs
	WL2iCQcpVZEgMDtNvhiwJgL6DMfM6BaIj8lXmVrBql9bflTxPxOXeC4gh5QehYGQkvO9hQrar+fx7
	3Q/sfWukanVJiPu+kHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5N3-00000008jHR-1i4g;
	Tue, 21 Jul 2026 07:58:33 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5My-00000008jEX-1cwx
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 07:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References; bh=5mI+h6L5olk5HlVJuixucCyBnh
	u5tdB9Nk+Ue6WSdts=; b=EegCwpcdSgL6N3ImcsauEnp2rKFUTMbgHnK0SDeQRF
	EECbWA746nH/Sy3yqB7mjJsgqR+rHtFFcrZ78KYA3EWX/hFlo/wkodcNnOF3hmAY
	ujG4ud9iA8vTsbatPX0X12WhYh2lDt+OmSYeiPVqqurTQ+q04e0rnZYraqoW9wA4
	c=
Received: from localhost.localdomain (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOyJl9q4GgUAA--.17568S5;
	Tue, 21 Jul 2026 15:58:51 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>
Subject: [RFC PATCH 3/3] riscv: Add supervisor pointer masking control
Date: Tue, 21 Jul 2026 15:58:12 +0800
Message-Id: <20260721075812.82708-4-xb@ultrarisc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260721075812.82708-1-xb@ultrarisc.com>
References: <20260721075812.82708-1-xb@ultrarisc.com>
X-CM-TRANSID: AQAAfwAnEkOyJl9q4GgUAA--.17568S5
X-Coremail-Antispam: 1UD129KBjvAXoW3Kw4fur1rCFyrCry3ZryxXwb_yoW8WFW3Ao
	WIga18WF4rtr12kF1rur17KFW2g34vgr4kZws8tan8WF17Ar10qF1vg3srta47KryfGa43
	ua1SqrsrWa18XF97n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO07AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r1rM28IrcIa0x
	kI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
	jcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
	8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
	1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	Yc_TUUUUU
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAOB2pdm1EAHAAPsm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005828_884617_C63E82FE 
X-CRM114-Status: GOOD (  24.09  )
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

Provide internal supervisor pointer-masking lifecycle support through
SBI FWFT independently of optional in-kernel consumer enablement. This
lets Linux establish a known PMLEN state even when the consumer is
disabled.

Allow enabled consumers to select PMLEN=7 transactionally. Gate
enable until smp_cpus_done() and serialize runtime state changes
against CPU hotplug.

Preserve PMLEN in the same-kernel hibernation header and configure the
resume hart immediately before restoring the memory image. Fail-stop
if the fresh kernel cannot establish or recover verified PMLEN0.

Reset retained state on successor boot and secondary hart entry.
Before kexec, reset every hart at its final offline or handoff point so
an older kernel cannot inherit PMLEN7. Refuse a crash handoff while a
possibly tagged hart remains stale.

Keep consumer enablement fail-closed on firmware errors. Roll back an
unsuccessful initial transaction, distinguish rollback failure as a
permanent broken state, and reject harts whose required local state
cannot be established.

Signed-off-by: Xie Bo <xb@ultrarisc.com>
---
 arch/riscv/Kconfig                |  22 ++++
 arch/riscv/include/asm/sspm.h     |  78 ++++++++++++
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/cpu-hotplug.c   |   3 +-
 arch/riscv/kernel/hibernate.c     |  12 ++
 arch/riscv/kernel/machine_kexec.c |  10 +-
 arch/riscv/kernel/setup.c         |   2 +
 arch/riscv/kernel/smp.c           |   2 +
 arch/riscv/kernel/smpboot.c       |  11 +-
 arch/riscv/kernel/sspm.c          | 202 ++++++++++++++++++++++++++++++
 10 files changed, 337 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/sspm.h
 create mode 100644 arch/riscv/kernel/sspm.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55e94e2..18b90b4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -572,6 +572,28 @@ config RISCV_ISA_SUPM
 	  If this option is disabled, userspace will be unable to use
 	  the prctl(PR_{SET,GET}_TAGGED_ADDR_CTRL) API.
 
+config RISCV_SSPM
+	bool
+	depends on 64BIT && RISCV_SBI
+	default y
+	help
+	  Provide internal supervisor pointer-masking lifecycle support for
+	  hibernation and for resetting firmware state retained across kexec.
+
+config RISCV_ISA_SSPM
+	bool "Sspm extension for supervisor pointer masking"
+	depends on RISCV_SSPM
+	default y
+	help
+	  Allow an in-kernel consumer to enable
+	  supervisor-mode pointer masking with PMLEN=7 through SBI FWFT.
+
+	  Pointer masking remains disabled until a kernel consumer explicitly
+	  requests it. Internal reset and hibernation support remains available
+	  when this consumer option is disabled.
+
+	  If unsure, say Y.
+
 config RISCV_ISA_SVNAPOT
 	bool "Svnapot extension support for supervisor mode NAPOT pages"
 	depends on 64BIT && MMU
diff --git a/arch/riscv/include/asm/sspm.h b/arch/riscv/include/asm/sspm.h
new file mode 100644
index 0000000..c95626a
--- /dev/null
+++ b/arch/riscv/include/asm/sspm.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_SSPM_H
+#define _ASM_RISCV_SSPM_H
+
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kconfig.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_SSPM
+void __init riscv_sspm_boot_reset(void);
+unsigned long riscv_sspm_hibernate_pmlen(void);
+bool riscv_sspm_hibernate_pmlen_valid(unsigned long pmlen);
+int riscv_sspm_hibernate_restore(unsigned long pmlen);
+int riscv_sspm_prepare_cpu(void);
+void __init riscv_sspm_smp_cpus_done(void);
+bool riscv_sspm_may_be_active(void);
+void riscv_sspm_reset_local_or_panic(const char *context);
+#else
+static inline void __init riscv_sspm_boot_reset(void)
+{
+}
+
+static inline unsigned long riscv_sspm_hibernate_pmlen(void)
+{
+	return 0;
+}
+
+static inline bool riscv_sspm_hibernate_pmlen_valid(unsigned long pmlen)
+{
+	return pmlen == 0 || pmlen == 7;
+}
+
+static inline int riscv_sspm_hibernate_restore(unsigned long pmlen)
+{
+	if (!riscv_sspm_hibernate_pmlen_valid(pmlen))
+		return -EINVAL;
+
+	return pmlen ? -EOPNOTSUPP : 0;
+}
+
+static inline int riscv_sspm_prepare_cpu(void)
+{
+	return 0;
+}
+
+static inline void __init riscv_sspm_smp_cpus_done(void)
+{
+}
+
+static inline bool riscv_sspm_may_be_active(void)
+{
+	return false;
+}
+
+static inline void riscv_sspm_reset_local_or_panic(const char *context)
+{
+}
+#endif
+
+#ifdef CONFIG_RISCV_ISA_SSPM
+int riscv_sspm_enable(void);
+
+/* True means the consumer contract is safe; false does not guarantee PMLEN=0. */
+bool riscv_sspm_enabled(void);
+#else
+static inline int riscv_sspm_enable(void)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline bool riscv_sspm_enabled(void)
+{
+	return false;
+}
+#endif
+
+#endif /* _ASM_RISCV_SSPM_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index cabb99c..0a6464a 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
+obj-$(CONFIG_RISCV_SSPM)	+= sspm.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP)		+= sbi-ipi.o
 obj-$(CONFIG_SMP) += cpu_ops_sbi.o
diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index 0bc56d8..8e0b497 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -15,6 +15,7 @@
 #include <asm/cpu_ops.h>
 #include <asm/numa.h>
 #include <asm/smp.h>
+#include <asm/sspm.h>
 
 bool cpu_has_hotplug(unsigned int cpu)
 {
@@ -67,8 +68,8 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 void __noreturn arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
-
 	cpuhp_ap_report_dead();
+	riscv_sspm_reset_local_or_panic("offline hart");
 
 	cpu_ops->cpu_stop();
 	/* It should never reach here */
diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 9828438..a82de7d 100644
--- a/arch/riscv/kernel/hibernate.c
+++ b/arch/riscv/kernel/hibernate.c
@@ -16,6 +16,7 @@
 #include <asm/sections.h>
 #include <asm/set_memory.h>
 #include <asm/smp.h>
+#include <asm/sspm.h>
 #include <asm/suspend.h>
 
 #include <linux/cpu.h>
@@ -53,12 +54,14 @@ struct arch_hibernate_hdr_invariants {
  * @hartid: to make sure same boot_cpu executes the hibernate/restore code.
  * @saved_satp: original page table used by the hibernated image.
  * @restore_cpu_addr: the kernel's image address to restore the CPU context.
+ * @pmlen: supervisor pointer-mask length used by the hibernated image.
  */
 static struct arch_hibernate_hdr {
 	struct arch_hibernate_hdr_invariants invariants;
 	unsigned long	hartid;
 	unsigned long	saved_satp;
 	unsigned long	restore_cpu_addr;
+	unsigned long	pmlen;
 } resume_hdr;
 
 static void arch_hdr_invariants(struct arch_hibernate_hdr_invariants *i)
@@ -101,6 +104,7 @@ int arch_hibernation_header_save(void *addr, unsigned int max_size)
 	hdr->hartid = cpuid_to_hartid_map(sleep_cpu);
 	hdr->saved_satp = csr_read(CSR_SATP);
 	hdr->restore_cpu_addr = (unsigned long)__hibernate_cpu_resume;
+	hdr->pmlen = riscv_sspm_hibernate_pmlen();
 
 	return 0;
 }
@@ -121,6 +125,10 @@ int arch_hibernation_header_restore(void *addr)
 		pr_crit("Hibernate image not generated by this kernel!\n");
 		return -EINVAL;
 	}
+	if (!riscv_sspm_hibernate_pmlen_valid(hdr->pmlen)) {
+		pr_crit("Invalid PMLEN in hibernate image: %lu\n", hdr->pmlen);
+		return -EINVAL;
+	}
 
 	sleep_cpu = riscv_hartid_to_cpuid(hdr->hartid);
 	if (sleep_cpu < 0) {
@@ -395,6 +403,10 @@ int swsusp_arch_resume(void)
 	if (ret)
 		return ret;
 
+	ret = riscv_sspm_hibernate_restore(resume_hdr.pmlen);
+	if (ret)
+		return ret;
+
 	hibernate_restore_image(resume_hdr.saved_satp, (PFN_DOWN(__pa(resume_pg_dir)) | satp_mode),
 				resume_hdr.restore_cpu_addr);
 
diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 738df17..f9cb98d 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -12,6 +12,7 @@
 #include <asm/page.h>		/* For PAGE_MASK */
 #include <linux/libfdt.h>	/* For fdt_check_header() */
 #include <asm/set_memory.h>	/* For set_memory_x() */
+#include <asm/sspm.h>
 #include <linux/compiler.h>	/* For unreachable() */
 #include <linux/cpu.h>		/* For cpu_down() */
 #include <linux/reboot.h>
@@ -161,8 +162,12 @@ machine_kexec(struct kimage *image)
 	riscv_kexec_method kexec_method = NULL;
 
 #ifdef CONFIG_SMP
-	WARN(smp_crash_stop_failed(),
-		"Some CPUs may be stale, kdump will be unreliable.\n");
+	bool stop_failed = smp_crash_stop_failed();
+
+	WARN(stop_failed,
+	     "Some CPUs may be stale, kdump will be unreliable.\n");
+	if (stop_failed && riscv_sspm_may_be_active())
+		panic("Sspm: cannot hand off with stale PMLEN state");
 #endif
 
 	if (image->type != KEXEC_TYPE_CRASH)
@@ -179,6 +184,7 @@ machine_kexec(struct kimage *image)
 
 	/* Jump to the relocation code */
 	pr_notice("Bye...\n");
+	riscv_sspm_reset_local_or_panic("kexec boot hart");
 	kexec_method(first_ind_entry, jump_addr, fdt_addr,
 		     this_hart_id, kernel_map.va_pa_offset);
 	unreachable();
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 52d1d2b..3b565cb 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -34,6 +34,7 @@
 #include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/sbi.h>
+#include <asm/sspm.h>
 #include <asm/tlbflush.h>
 #include <asm/thread_info.h>
 #include <asm/kasan.h>
@@ -315,6 +316,7 @@ void __init setup_arch(char **cmdline_p)
 
 	early_ioremap_setup();
 	sbi_init();
+	riscv_sspm_boot_reset();
 	jump_label_init();
 	parse_early_param();
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c..d87a731 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -27,6 +27,7 @@
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
+#include <asm/sspm.h>
 
 enum ipi_message_type {
 	IPI_RESCHEDULE,
@@ -92,6 +93,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
 	crash_save_cpu(regs, cpu);
+	riscv_sspm_reset_local_or_panic("crash secondary hart");
 
 	atomic_dec(&waiting_for_crash_ipi);
 
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f6ef579..e18cb37 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -34,6 +34,7 @@
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
 #include <asm/smp.h>
+#include <asm/sspm.h>
 #include <uapi/asm/hwcap.h>
 #include <asm/vector.h>
 
@@ -210,6 +211,7 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 
 void __init smp_cpus_done(unsigned int max_cpus)
 {
+	riscv_sspm_smp_cpus_done();
 }
 
 /*
@@ -229,14 +231,17 @@ asmlinkage __visible void smp_callin(void)
 			return;
 	}
 
-	/* All kernel threads share the same mm context.  */
-	mmgrab(mm);
-	current->active_mm = mm;
+	if (riscv_sspm_prepare_cpu())
+		return;
 
 #ifdef CONFIG_HOTPLUG_PARALLEL
 	cpuhp_ap_sync_alive();
 #endif
 
+	/* All kernel threads share the same mm context.  */
+	mmgrab(mm);
+	current->active_mm = mm;
+
 	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
 
diff --git a/arch/riscv/kernel/sspm.c b/arch/riscv/kernel/sspm.c
new file mode 100644
index 0000000..6198660
--- /dev/null
+++ b/arch/riscv/kernel/sspm.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/cpu.h>
+#include <linux/mutex.h>
+#include <linux/panic.h>
+#include <linux/printk.h>
+#include <linux/smp.h>
+
+#include <asm/sbi.h>
+#include <asm/sspm.h>
+
+#define RISCV_SSPM_PMLEN	7
+
+enum riscv_sspm_state {
+	RISCV_SSPM_DISABLED,
+	RISCV_SSPM_ENABLING,
+	RISCV_SSPM_ENABLED,
+	RISCV_SSPM_FAILED,
+	RISCV_SSPM_BROKEN,
+};
+
+static enum riscv_sspm_state riscv_sspm_state __read_mostly;
+static bool riscv_sspm_smp_ready __read_mostly = !IS_ENABLED(CONFIG_SMP);
+#ifdef CONFIG_RISCV_ISA_SSPM
+static DEFINE_MUTEX(riscv_sspm_lock);
+static int riscv_sspm_error __read_mostly;
+#endif
+
+static int riscv_sspm_set_local(unsigned long pmlen)
+{
+	unsigned long value;
+	int ret;
+
+	ret = sbi_fwft_set(SBI_FWFT_POINTER_MASKING_PMLEN, pmlen, 0);
+	if (ret)
+		return ret;
+
+	ret = sbi_fwft_get(SBI_FWFT_POINTER_MASKING_PMLEN, &value);
+	if (ret)
+		return ret;
+
+	return value == pmlen ? 0 : -EIO;
+}
+
+static int riscv_sspm_reset_local(void)
+{
+	int ret;
+
+	ret = riscv_sspm_set_local(0);
+	return ret == -EOPNOTSUPP ? 0 : ret;
+}
+
+void riscv_sspm_reset_local_or_panic(const char *context)
+{
+	int ret;
+
+	ret = riscv_sspm_reset_local();
+	if (ret)
+		panic("Sspm: failed to reset %s PMLEN: %d", context, ret);
+}
+
+void __init riscv_sspm_boot_reset(void)
+{
+	/*
+	 * Firmware may retain FWFT state across kexec or a crash handoff. Reset
+	 * it before the Linux successor starts relying on canonical addresses.
+	 */
+	riscv_sspm_reset_local_or_panic("boot hart");
+}
+
+unsigned long riscv_sspm_hibernate_pmlen(void)
+{
+	return riscv_sspm_enabled() ? RISCV_SSPM_PMLEN : 0;
+}
+
+bool riscv_sspm_hibernate_pmlen_valid(unsigned long pmlen)
+{
+	return pmlen == 0 || pmlen == RISCV_SSPM_PMLEN;
+}
+
+int riscv_sspm_hibernate_restore(unsigned long pmlen)
+{
+	int ret;
+
+	if (!riscv_sspm_hibernate_pmlen_valid(pmlen))
+		return -EINVAL;
+
+	if (!pmlen) {
+		riscv_sspm_reset_local_or_panic("hibernate");
+		return 0;
+	}
+
+	ret = riscv_sspm_set_local(pmlen);
+	if (ret)
+		riscv_sspm_reset_local_or_panic("hibernate cleanup");
+
+	return ret;
+}
+
+void __init riscv_sspm_smp_cpus_done(void)
+{
+	WRITE_ONCE(riscv_sspm_smp_ready, true);
+}
+
+bool riscv_sspm_may_be_active(void)
+{
+	enum riscv_sspm_state state = READ_ONCE(riscv_sspm_state);
+
+	return state == RISCV_SSPM_ENABLING || state == RISCV_SSPM_ENABLED ||
+	       state == RISCV_SSPM_BROKEN;
+}
+
+int riscv_sspm_prepare_cpu(void)
+{
+	enum riscv_sspm_state state = READ_ONCE(riscv_sspm_state);
+	unsigned int cpu = smp_processor_id();
+	int ret, cleanup_ret;
+
+	if (state == RISCV_SSPM_DISABLED || state == RISCV_SSPM_FAILED ||
+	    state == RISCV_SSPM_BROKEN) {
+		ret = riscv_sspm_reset_local();
+		if (ret)
+			pr_crit("Sspm: CPU%u failed to reset PMLEN: %d\n",
+				cpu, ret);
+
+		return ret;
+	}
+
+	if (state != RISCV_SSPM_ENABLED)
+		return 0;
+
+	ret = riscv_sspm_set_local(RISCV_SSPM_PMLEN);
+	if (ret) {
+		pr_err("Sspm: CPU%u failed to enable PMLEN=7: %d\n", cpu, ret);
+		cleanup_ret = sbi_fwft_set(SBI_FWFT_POINTER_MASKING_PMLEN, 0, 0);
+		if (cleanup_ret)
+			pr_crit("Sspm: CPU%u failed to clean up PMLEN: %d\n",
+				cpu, cleanup_ret);
+	}
+
+	return ret;
+}
+
+#ifdef CONFIG_RISCV_ISA_SSPM
+int riscv_sspm_enable(void)
+{
+	int ret, rollback_ret;
+
+	mutex_lock(&riscv_sspm_lock);
+
+	if (!READ_ONCE(riscv_sspm_smp_ready)) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
+	if (riscv_sspm_state == RISCV_SSPM_ENABLED) {
+		ret = 0;
+		goto out_unlock;
+	}
+
+	if (riscv_sspm_state == RISCV_SSPM_FAILED ||
+	    riscv_sspm_state == RISCV_SSPM_BROKEN) {
+		ret = riscv_sspm_error;
+		goto out_unlock;
+	}
+
+	cpus_read_lock();
+	WRITE_ONCE(riscv_sspm_state, RISCV_SSPM_ENABLING);
+
+	ret = sbi_fwft_set_online_cpus(SBI_FWFT_POINTER_MASKING_PMLEN,
+				       RISCV_SSPM_PMLEN, 0);
+	if (!ret) {
+		WRITE_ONCE(riscv_sspm_state, RISCV_SSPM_ENABLED);
+		cpus_read_unlock();
+		goto out_unlock;
+	}
+
+	rollback_ret = sbi_fwft_set_online_cpus(SBI_FWFT_POINTER_MASKING_PMLEN,
+						0, 0);
+	pr_warn("Sspm: failed to enable PMLEN=7: %d\n", ret);
+	if (rollback_ret) {
+		pr_crit("Sspm: failed to roll back PMLEN: %d\n", rollback_ret);
+		riscv_sspm_error = rollback_ret;
+		WRITE_ONCE(riscv_sspm_state, RISCV_SSPM_BROKEN);
+		ret = rollback_ret;
+	} else {
+		riscv_sspm_error = ret;
+		WRITE_ONCE(riscv_sspm_state, RISCV_SSPM_FAILED);
+	}
+
+	cpus_read_unlock();
+
+out_unlock:
+	mutex_unlock(&riscv_sspm_lock);
+
+	return ret;
+}
+
+bool riscv_sspm_enabled(void)
+{
+	return READ_ONCE(riscv_sspm_state) == RISCV_SSPM_ENABLED;
+}
+#endif
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
