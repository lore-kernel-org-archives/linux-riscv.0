Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B83ACF318B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8J5fsOXfw+k2vwwv4Hy8z6lzJBvg/D4y25YZ09h1Jcc=; b=XteRWWUk9gR5Cc
	1cmyaZun132lXiJ6E2M08+GXJFI+bYSAcb2WCd+dXETexWNqEcgA+Mo37K/5R1zxu4qE9jzSjJ8jQ
	YK8qA7wvASjRB82k5cmLbJ4tGtjRn1C/HXYRYs4icu2LT7UA+hG8ITQlpZYasjHXtQK+7Xk+6Do3I
	nbC8L8OJypK6TotZbopyWn8RI/mYgXB2gkG/k2yCgLxZ0lH0ZNd6jQe7e0qWUDBFVd5hRUQ70OpcC
	Vqx3s2mo+p11FNdA3JkjQz6PbJhrq5MEwispK5wSVAseiUBN3L69A8o6jF8UzCcMARsAISfQmqv4b
	o1qm6Ty/g4SbN9gxqUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmIY-00000004Mzl-0o9v;
	Tue, 01 Oct 2024 23:28:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svluW-00000004HdZ-1RXh;
	Tue, 01 Oct 2024 23:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8A445C4C62;
	Tue,  1 Oct 2024 23:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30237C4CEC6;
	Tue,  1 Oct 2024 23:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823843;
	bh=Us0URBRhSa1wij7R5AMlAWepe3NAZ1hCwtEWfYpyTZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s0KZ+4DmO57LtfWSEGq6YAnDihkmJYoPIG37qRni6HuPyMr3zWQ6hRuGS9/aTk65Q
	 1ssmYu48gex0m25/V7FJkX7yht1tdIZ9pLXNuqu09xMODWyC2cfR1yl81ePxYlLEVt
	 s+NCCZbo5pHSrFUKyXzU0w0HFRdvw94utNVwKST1QyV8CrdIPXjXPpFWm/EwxGscL5
	 QMTIdumdfZ10g9iUwI/rrX3YhyVNs50mpmVRCR/98UlDvcCWH0lDyGt7Y8exwNFUIu
	 /6UrglK/eqmhjCvlw7OcX986EexRyIR+sybhoMV7Dp/eg5+gIDhMInI70t3MmkPxhP
	 nSOgci1rnSpZg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:01 +0100
Subject: [PATCH v13 22/40] arm64/gcs: Ensure that new threads have a GCS
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-22-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=7454; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Us0URBRhSa1wij7R5AMlAWepe3NAZ1hCwtEWfYpyTZE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7Vlw2a91awf5dQ51yn2oKKo++ah0gmIhormFHO
 IFzKoGuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+1QAKCRAk1otyXVSH0GXiB/
 4sukR3e9ueVGNs3Q1p22exSd9lbXbDllUPyFJRC1zfyQjKx2EzGvmcpMdDVmk5/goay67QMxQjKDJd
 WntsAEwdsM3HHSD8pAZHPYIaWcfhsMw8mU1tFplNjSWdG+PH5bOQ8dOtN8qxNrMsz+YdzlcudTCoKR
 UgDf5yrtZkS9eH06xyw8KTSHt6uWM6MUGZ83TexJbc/KJGL4TbD03CYvzG0PE7oAvngEQ4kavKV1QH
 QSdtefxEFMfWOajyTpqhateKmpXWdS8jlaoqcW3pxVRbiUKRU0e5aMcS2rO+8KTK+gXtnpUR0m+OA4
 VFyI+/KUpM2Sy1v7HCZ6SdXOYftgXV
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160404_592857_58942CBB 
X-CRM114-Status: GOOD (  21.78  )
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
min(RLIMIT_STACK/2, 2G).  Since the GCS only stores the call stack and not
any variables this should be more than sufficient for most applications.

GCSs allocated via this mechanism will be freed when the thread exits.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h         |  9 +++++
 arch/arm64/include/asm/mmu_context.h |  9 +++++
 arch/arm64/kernel/process.c          | 32 +++++++++++++++++
 arch/arm64/mm/gcs.c                  | 69 ++++++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+)

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
 
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 7c09d47e09cb..48b3d9553b67 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -20,6 +20,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/daifflags.h>
+#include <asm/gcs.h>
 #include <asm/proc-fns.h>
 #include <asm/cputype.h>
 #include <asm/sysreg.h>
@@ -311,6 +312,14 @@ static inline bool arch_vma_access_permitted(struct vm_area_struct *vma,
 	return por_el0_allows_pkey(vma_pkey(vma), write, execute);
 }
 
+#define deactivate_mm deactivate_mm
+static inline void deactivate_mm(struct task_struct *tsk,
+			struct mm_struct *mm)
+{
+	gcs_free(tsk);
+}
+
+
 #include <asm-generic/mmu_context.h>
 
 #endif /* !__ASSEMBLY__ */
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index aedcf332f422..fdd095480c3f 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -294,9 +294,35 @@ static void flush_gcs(void)
 	write_sysreg_s(0, SYS_GCSPR_EL0);
 }
 
+static int copy_thread_gcs(struct task_struct *p,
+			   const struct kernel_clone_args *args)
+{
+	unsigned long gcs;
+
+	if (!system_supports_gcs())
+		return 0;
+
+	p->thread.gcs_base = 0;
+	p->thread.gcs_size = 0;
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
 
@@ -313,6 +339,7 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
+	gcs_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
@@ -376,6 +403,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long stack_start = args->stack;
 	unsigned long tls = args->tls;
 	struct pt_regs *childregs = task_pt_regs(p);
+	int ret;
 
 	memset(&p->thread.cpu_context, 0, sizeof(struct cpu_context));
 
@@ -420,6 +448,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index f8f4f984a247..3c7a18f57ea9 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -5,9 +5,69 @@
 #include <linux/syscalls.h>
 #include <linux/types.h>
 
+#include <asm/cmpxchg.h>
 #include <asm/cpufeature.h>
+#include <asm/gcs.h>
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
+	size = args->stack_size / 2;
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
@@ -33,6 +93,15 @@ void gcs_free(struct task_struct *task)
 	if (!system_supports_gcs())
 		return;
 
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
