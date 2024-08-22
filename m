Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FD2C52D6F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82gJ6G30r2XcBO3U+KSR12ZBPbqefB9y3X6ovxPUkpY=; b=DbK7GWIvnAmynF
	pveCyv/duU806ANRoVEO0sF8lso2z89RufdW5nXK2Q6ZdmTKI2XTKjJq8MkSecLPy/SuGNQeFuoul
	MopBQnetxruAspZPAxp+NmNkW0nD3GU1ZOrJ9K5dBY+/UJiMXgZ1HuAxMdbRFeNvSrPiLqTUbN81e
	AdcyZnTGjGlvgVN7gNcpXo48vaizglFOd6HoDy7ZGaLGsdsidTBDcTdx2Sy05X2gtuihRZ7Ltdr1w
	NDN5QHPbQU93x386XE3e7zU89IStIuNUNV+/Eh7wPNnUz5+EbIgAKsou+TrYG6x6ml+fxkYuhXPSN
	HSi7ZLjV6I4LouH0Fnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwfd-0000000AwfQ-2xMV;
	Thu, 22 Aug 2024 01:31:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwUv-0000000AsgH-0U9c;
	Thu, 22 Aug 2024 01:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83FC160FE8;
	Thu, 22 Aug 2024 01:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8C0C4AF0E;
	Thu, 22 Aug 2024 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289620;
	bh=RTGexDthYFr44xiqo+HLLY4BIMEvafRxD0gCV0rtMNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nwCz74RQhv+6TSyNSnHLKjoCcoQq/n5I2qJ7ODUhcMUDknH3RoZx3+U53CZh4omCs
	 pHlpjBu0mzP233pTtuA7VB8xr3tC1F27PU41ouRkj4j0YILmrAQYhvH+IQ/AIpiLWd
	 yCrmS9Z173ji2C5qYBJAbIhFopDTAuft2OsfOTmMii4czZZwqSaGbyPc8M86YuV6GQ
	 8zg+wDQ3uvJZln9CEmmGwImupKGRxJGVCoDdmoejHCvGFxEaPzFSJN8e5UW4uQDQ6M
	 Q/AtHRm8I3sty4ur4tY0HyZY3/wRv+xMvj5eiMth+Cly3U10CUC4hdrs5gCG4ApZzr
	 IuTJr0ojQEVZQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:24 +0100
Subject: [PATCH v11 21/39] arm64/gcs: Ensure that new threads have a GCS
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-21-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7114; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RTGexDthYFr44xiqo+HLLY4BIMEvafRxD0gCV0rtMNw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpE0o1U0PhWyG7IJgmly5/ucjchbqyop+pwJgqc7
 4cSP+qqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRNAAKCRAk1otyXVSH0GMWB/
 9WICAq2SrwWqJTnYUuIjxl/qBe8At86oZHK+3XOdhOpLoKTmzyB8P3xYichKFWIDihs88bgvPdnzb/
 FfVvXD4FUGaGPV2TvCx00aqavPExQC0TyVx2NX7eifWDcXNffy+PKHhZR7gC6bc8c9WqM0ugq9u9pO
 e0JljMz8HcjhiWnbNeiljOkYMmgOctlrBw3Jh0Shk2Jj4VvqD4oT3op9HIjbs5SVQkywjJN/Pw9YlJ
 HNCNVkWSzCREK3hYPv+QHMwbDWiN6dd2sfNJikCFMXzNeOB8VThNEaFYv8+d1jvmHBjn3muzY9RNzF
 MkKF+6jecDOjzR0lPpZOf1Su28jYgF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_182021_418489_EAEAA1B6 
X-CRM114-Status: GOOD (  23.54  )
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

When a new thread is created by a thread with GCS enabled the GCS needs
to be specified along with the regular stack.

Unfortunately plain clone() is not extensible and existing clone3()
users will not specify a stack so all existing code would be broken if
we mandated specifying the stack explicitly.  For compatibility with
these cases and also x86 (which did not initially implement clone3()
support for shadow stacks) if no GCS is specified we will allocate one
so when a thread is created which has GCS enabled allocate one for it.
We follow the extensively discussed x86 implementation and allocate
min(RLIMIT_STACK, 2G).  Since the GCS only stores the call stack and not
any variables this should be more than sufficient for most applications.

GCSs allocated via this mechanism will be freed when the thread exits.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h |  9 ++++++
 arch/arm64/kernel/process.c  | 38 ++++++++++++++++++++++--
 arch/arm64/mm/gcs.c          | 69 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 04594ef59dad..c1f274fdb9c0 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -8,6 +8,8 @@
 #include <asm/types.h>
 #include <asm/uaccess.h>
 
+struct kernel_clone_args;
+
 static inline void gcsb_dsync(void)
 {
 	asm volatile(".inst 0xd503227f" : : : "memory");
@@ -58,6 +60,8 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 void gcs_set_el0_mode(struct task_struct *task);
 void gcs_free(struct task_struct *task);
 void gcs_preserve_current_state(void);
+unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
+				     const struct kernel_clone_args *args);
 
 #else
 
@@ -69,6 +73,11 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 static inline void gcs_set_el0_mode(struct task_struct *task) { }
 static inline void gcs_free(struct task_struct *task) { }
 static inline void gcs_preserve_current_state(void) { }
+static inline unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
+						   const struct kernel_clone_args *args)
+{
+	return -ENOTSUPP;
+}
 
 #endif
 
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index a4fd25585801..de59aa16919c 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -285,9 +285,29 @@ static void flush_gcs(void)
 	write_sysreg_s(0, SYS_GCSPR_EL0);
 }
 
+static int copy_thread_gcs(struct task_struct *p,
+			   const struct kernel_clone_args *args)
+{
+	unsigned long gcs;
+
+	gcs = gcs_alloc_thread_stack(p, args);
+	if (IS_ERR_VALUE(gcs))
+		return PTR_ERR((void *)gcs);
+
+	p->thread.gcs_el0_mode = current->thread.gcs_el0_mode;
+	p->thread.gcs_el0_locked = current->thread.gcs_el0_locked;
+
+	return 0;
+}
+
 #else
 
 static void flush_gcs(void) { }
+static int copy_thread_gcs(struct task_struct *p,
+			   const struct kernel_clone_args *args)
+{
+	return 0;
+}
 
 #endif
 
@@ -303,6 +323,7 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
+	gcs_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
@@ -366,6 +387,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long stack_start = args->stack;
 	unsigned long tls = args->tls;
 	struct pt_regs *childregs = task_pt_regs(p);
+	int ret;
 
 	memset(&p->thread.cpu_context, 0, sizeof(struct cpu_context));
 
@@ -407,6 +429,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 			p->thread.uw.tp_value = tls;
 			p->thread.tpidr2_el0 = 0;
 		}
+
+		ret = copy_thread_gcs(p, args);
+		if (ret != 0)
+			return ret;
 	} else {
 		/*
 		 * A kthread has no context to ERET to, so ensure any buggy
@@ -512,10 +538,16 @@ static void gcs_thread_switch(struct task_struct *next)
 		gcs_set_el0_mode(next);
 
 	/*
-	 * Ensure that GCS changes are observable by/from other PEs in
-	 * case of migration.
+	 * Ensure that GCS memory effects of the 'prev' thread are
+	 * ordered before other memory accesses with release semantics
+	 * (or preceded by a DMB) on the current PE. In addition, any
+	 * memory accesses with acquire semantics (or succeeded by a
+	 * DMB) are ordered before GCS memory effects of the 'next'
+	 * thread. This will ensure that the GCS memory effects are
+	 * visible to other PEs in case of migration.
 	 */
-	gcsb_dsync();
+	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
+		gcsb_dsync();
 }
 
 #else
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index b0a67efc522b..adedbfc062f3 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -5,9 +5,68 @@
 #include <linux/syscalls.h>
 #include <linux/types.h>
 
+#include <asm/cmpxchg.h>
 #include <asm/cpufeature.h>
 #include <asm/page.h>
 
+static unsigned long alloc_gcs(unsigned long addr, unsigned long size)
+{
+	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
+	struct mm_struct *mm = current->mm;
+	unsigned long mapped_addr, unused;
+
+	if (addr)
+		flags |= MAP_FIXED_NOREPLACE;
+
+	mmap_write_lock(mm);
+	mapped_addr = do_mmap(NULL, addr, size, PROT_READ, flags,
+			      VM_SHADOW_STACK | VM_WRITE, 0, &unused, NULL);
+	mmap_write_unlock(mm);
+
+	return mapped_addr;
+}
+
+static unsigned long gcs_size(unsigned long size)
+{
+	if (size)
+		return PAGE_ALIGN(size);
+
+	/* Allocate RLIMIT_STACK/2 with limits of PAGE_SIZE..2G */
+	size = PAGE_ALIGN(min_t(unsigned long long,
+				rlimit(RLIMIT_STACK) / 2, SZ_2G));
+	return max(PAGE_SIZE, size);
+}
+
+unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
+				     const struct kernel_clone_args *args)
+{
+	unsigned long addr, size;
+
+	if (!system_supports_gcs())
+		return 0;
+
+	if (!task_gcs_el0_enabled(tsk))
+		return 0;
+
+	if ((args->flags & (CLONE_VFORK | CLONE_VM)) != CLONE_VM) {
+		tsk->thread.gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
+		return 0;
+	}
+
+	size = args->stack_size;
+
+	size = gcs_size(size);
+	addr = alloc_gcs(0, size);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+
+	tsk->thread.gcs_base = addr;
+	tsk->thread.gcs_size = size;
+	tsk->thread.gcspr_el0 = addr + size - sizeof(u64);
+
+	return addr;
+}
+
 /*
  * Apply the GCS mode configured for the specified task to the
  * hardware.
@@ -30,6 +89,16 @@ void gcs_set_el0_mode(struct task_struct *task)
 
 void gcs_free(struct task_struct *task)
 {
+
+	/*
+	 * When fork() with CLONE_VM fails, the child (tsk) already
+	 * has a GCS allocated, and exit_thread() calls this function
+	 * to free it.  In this case the parent (current) and the
+	 * child share the same mm struct.
+	 */
+	if (!task->mm || task->mm != current->mm)
+		return;
+
 	if (task->thread.gcs_base)
 		vm_munmap(task->thread.gcs_base, task->thread.gcs_size);
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
