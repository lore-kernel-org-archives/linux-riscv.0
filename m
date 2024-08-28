Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB00BC7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJfKb9ZUXx9Zm7kmb0MXOUjOKC84yMZYgHOa8MRTwbc=; b=2n+HX/smp2a7hn
	WHgpBVeqZ9TvPAgn1MhMcMIQk9EGk1BgG3u4RGykkPb2isuH7AIak3FGM+5etsYDIUoPfi19K7Y2f
	K1Q7i3Pg+BuL7BOsI2iUdA0FLl6vX9KTDVw1yEQYBraCzcwFAMpdkbMqF4EtF0pgkbrcvLxkCPXm5
	ssxUEJ6mq7aJESkamwlcsYa37DerUXfEN1g/bvXCXRroHPK1GrXvpT2Kz2JQ7NXrJvQWbLz1nQEP3
	e459Ib2ALCM4MwFgVLCMkpV2PXnJNIVdLwiO4//e/HdT2PHmgTcVMScGzKDB8K09u/+OZtkRpATlt
	B6G5f+kMVy7HvYkEBZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSLh-0000000HSxB-0WxL;
	Wed, 28 Aug 2024 23:45:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS7x-0000000HMlR-2DNZ;
	Wed, 28 Aug 2024 23:31:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD8DCCE19B1;
	Wed, 28 Aug 2024 23:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33925C4CEC5;
	Wed, 28 Aug 2024 23:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887858;
	bh=sydLriD9HWAooq5yd+cFzuUdkx2R+cx9auWZHUCA7fY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=otQuTQdp3wk4hcDOpjNnIrsQg9KwhgaBu5nx/u8HDL40Y7pR+jwHY9XxR7ZEWI1NU
	 NRRvw9nWhLQGps7I7wTBCL9a4JyiewgCme094HrHD/rbMJ9nUSr2fBWGMwSgMwJgPA
	 z4HXz91hU69poRSngzfP+0sDDBbh6yG3aLEVdY+LoYb/5zZPUpm4OY0Lu0HZ31ZC3W
	 vv2AQd1cOVqNYUN/GO+VPnymTlwZXqzN70XnQzAVhseCYLdPW5EqiguurR2SqhPTGu
	 44udrqET8WA/QduW7M/ojCL8+5xJpTZtWNaLehopKUxmyXauNsX48h4RCD1uH7QFA5
	 1QcvwBWd7x28Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:36 +0100
Subject: [PATCH v12 20/39] arm64/gcs: Context switch GCS state for EL0
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-20-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=7225; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sydLriD9HWAooq5yd+cFzuUdkx2R+cx9auWZHUCA7fY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KIKy2R7h93FkcxSJ/JfAGC1aobAQmoB1N96ecE
 blTmFraJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yiAAKCRAk1otyXVSH0GSaB/
 9gxycINt4jGEeumEzdfCbt1p9bcOTP7yN85Ty0JiwmkCl9PI+CjA8zGVZph/94PzIc5flRKldAYMqf
 hCBFkL0f+/lxgMmZ5gUQS7U+FGEwCAHAcw9L+4mtP0sqt6SGcbriQEHK8FpJkBwE41vHrjO+LEEoug
 jJEGciaeFVePAaCgtS4Ngbi325zdvvfp3ADSjEtispU3e+oWL0ZF8yxPXlBlm9xSy/doD5IoP4tfET
 XGytk6FbkXpLtqCteSaV9DSybym1c4aqlEsaWmwlYo3GoEjHwHnF+z7Ej1h0fCtEyw1Z6UnFEtVL66
 AvC2vr7F6fs0bTjLe+ljshUsfu+8oq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163101_978577_0734EBA1 
X-CRM114-Status: GOOD (  23.73  )
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

There are two registers controlling the GCS state of EL0, GCSPR_EL0 which
is the current GCS pointer and GCSCRE0_EL1 which has enable bits for the
specific GCS functionality enabled for EL0. Manage these on context switch
and process lifetime events, GCS is reset on exec().  Also ensure that
any changes to the GCS memory are visible to other PEs and that changes
from other PEs are visible on this one by issuing a GCSB DSYNC when
moving to or from a thread with GCS.

Since the current GCS configuration of a thread will be visible to
userspace we store the configuration in the format used with userspace
and provide a helper which configures the system register as needed.

On systems that support GCS we always allow access to GCSPR_EL0, this
facilitates reporting of GCS faults if userspace implements disabling of
GCS on error - the GCS can still be discovered and examined even if GCS
has been disabled.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h       | 24 +++++++++++++++
 arch/arm64/include/asm/processor.h |  6 ++++
 arch/arm64/kernel/process.c        | 62 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/mm/Makefile             |  1 +
 arch/arm64/mm/gcs.c                | 39 ++++++++++++++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 7c5e95218db6..04594ef59dad 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -48,4 +48,28 @@ static inline u64 gcsss2(void)
 	return Xt;
 }
 
+#ifdef CONFIG_ARM64_GCS
+
+static inline bool task_gcs_el0_enabled(struct task_struct *task)
+{
+	return current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE;
+}
+
+void gcs_set_el0_mode(struct task_struct *task);
+void gcs_free(struct task_struct *task);
+void gcs_preserve_current_state(void);
+
+#else
+
+static inline bool task_gcs_el0_enabled(struct task_struct *task)
+{
+	return false;
+}
+
+static inline void gcs_set_el0_mode(struct task_struct *task) { }
+static inline void gcs_free(struct task_struct *task) { }
+static inline void gcs_preserve_current_state(void) { }
+
+#endif
+
 #endif
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index f77371232d8c..c55e3600604a 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -184,6 +184,12 @@ struct thread_struct {
 	u64			sctlr_user;
 	u64			svcr;
 	u64			tpidr2_el0;
+#ifdef CONFIG_ARM64_GCS
+	unsigned int		gcs_el0_mode;
+	u64			gcspr_el0;
+	u64			gcs_base;
+	u64			gcs_size;
+#endif
 };
 
 static inline unsigned int thread_get_vl(struct thread_struct *thread,
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 4ae31b7af6c3..3622956b6515 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -48,6 +48,7 @@
 #include <asm/cacheflush.h>
 #include <asm/exec.h>
 #include <asm/fpsimd.h>
+#include <asm/gcs.h>
 #include <asm/mmu_context.h>
 #include <asm/mte.h>
 #include <asm/processor.h>
@@ -271,12 +272,32 @@ static void flush_tagged_addr_state(void)
 		clear_thread_flag(TIF_TAGGED_ADDR);
 }
 
+#ifdef CONFIG_ARM64_GCS
+
+static void flush_gcs(void)
+{
+	if (!system_supports_gcs())
+		return;
+
+	gcs_free(current);
+	current->thread.gcs_el0_mode = 0;
+	write_sysreg_s(0, SYS_GCSCRE0_EL1);
+	write_sysreg_s(0, SYS_GCSPR_EL0);
+}
+
+#else
+
+static void flush_gcs(void) { }
+
+#endif
+
 void flush_thread(void)
 {
 	fpsimd_flush_thread();
 	tls_thread_flush();
 	flush_ptrace_hw_breakpoint(current);
 	flush_tagged_addr_state();
+	flush_gcs();
 }
 
 void arch_release_task_struct(struct task_struct *tsk)
@@ -471,6 +492,46 @@ static void entry_task_switch(struct task_struct *next)
 	__this_cpu_write(__entry_task, next);
 }
 
+#ifdef CONFIG_ARM64_GCS
+
+void gcs_preserve_current_state(void)
+{
+	current->thread.gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
+}
+
+static void gcs_thread_switch(struct task_struct *next)
+{
+	if (!system_supports_gcs())
+		return;
+
+	/* GCSPR_EL0 is always readable */
+	gcs_preserve_current_state();
+	write_sysreg_s(next->thread.gcspr_el0, SYS_GCSPR_EL0);
+
+	if (current->thread.gcs_el0_mode != next->thread.gcs_el0_mode)
+		gcs_set_el0_mode(next);
+
+	/*
+	 * Ensure that GCS memory effects of the 'prev' thread are
+	 * ordered before other memory accesses with release semantics
+	 * (or preceded by a DMB) on the current PE. In addition, any
+	 * memory accesses with acquire semantics (or succeeded by a
+	 * DMB) are ordered before GCS memory effects of the 'next'
+	 * thread. This will ensure that the GCS memory effects are
+	 * visible to other PEs in case of migration.
+	 */
+	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
+		gcsb_dsync();
+}
+
+#else
+
+static void gcs_thread_switch(struct task_struct *next)
+{
+}
+
+#endif
+
 /*
  * ARM erratum 1418040 handling, affecting the 32bit view of CNTVCT.
  * Ensure access is disabled when switching to a 32bit task, ensure
@@ -530,6 +591,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	ssbs_thread_switch(next);
 	erratum_1418040_thread_switch(next);
 	ptrauth_thread_switch_user(next);
+	gcs_thread_switch(next);
 
 	/*
 	 * Complete any pending TLB or cache maintenance on this CPU in case
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index 60454256945b..1a7b3a2f21e6 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd.o
 obj-$(CONFIG_TRANS_TABLE)	+= trans_pgd-asm.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 obj-$(CONFIG_ARM64_MTE)		+= mteswap.o
+obj-$(CONFIG_ARM64_GCS)		+= gcs.o
 KASAN_SANITIZE_physaddr.o	+= n
 
 obj-$(CONFIG_KASAN)		+= kasan_init.o
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
new file mode 100644
index 000000000000..b0a67efc522b
--- /dev/null
+++ b/arch/arm64/mm/gcs.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/syscalls.h>
+#include <linux/types.h>
+
+#include <asm/cpufeature.h>
+#include <asm/page.h>
+
+/*
+ * Apply the GCS mode configured for the specified task to the
+ * hardware.
+ */
+void gcs_set_el0_mode(struct task_struct *task)
+{
+	u64 gcscre0_el1 = GCSCRE0_EL1_nTR;
+
+	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE)
+		gcscre0_el1 |= GCSCRE0_EL1_RVCHKEN | GCSCRE0_EL1_PCRSEL;
+
+	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_WRITE)
+		gcscre0_el1 |= GCSCRE0_EL1_STREn;
+
+	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_PUSH)
+		gcscre0_el1 |= GCSCRE0_EL1_PUSHMEn;
+
+	write_sysreg_s(gcscre0_el1, SYS_GCSCRE0_EL1);
+}
+
+void gcs_free(struct task_struct *task)
+{
+	if (task->thread.gcs_base)
+		vm_munmap(task->thread.gcs_base, task->thread.gcs_size);
+
+	task->thread.gcspr_el0 = 0;
+	task->thread.gcs_base = 0;
+	task->thread.gcs_size = 0;
+}

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
