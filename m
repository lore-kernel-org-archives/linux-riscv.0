Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D512C48298
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 13:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Did4OYbQ7HW0le623otFp/TcNd5Tqih58shrjSeutY=; b=M08659ebj1J1FL
	syKLbDW1k/+3XogRhhcA4u/3F4xwwGSqKI9huA7/fzRyWfIBItxCWVGg7gmlLr8aSLpatfSvkLIrm
	AEtAShHLyaH7FNo4Zr8Fd7eC13vKkKsKWdzLxBGemyjAOKP+PLcyRpRvEyvze3Dr0vKqQBOgktAZt
	6hcizZqDUmI/DbVtNjSfhizQX+3XtpkL/dtQ+EK62X0bfmMAtAo69G5aRzGq03Zlvr6snwmrN95CB
	OH2E1PkbVdm9t7DxZqHKGaUbKeRyBninf+Mkz8XzROuwpGc0s6kPVwc7X6kp2m0h+nnC8ypIz/Bdk
	LisbBQ3ZBXyrQVhf8zYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWG9O-0000000GXcc-19ws;
	Sat, 03 Feb 2024 13:33:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFBg-0000000GJmf-2R8X;
	Sat, 03 Feb 2024 12:32:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E0E0CE1EF7;
	Sat,  3 Feb 2024 12:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDE6C43609;
	Sat,  3 Feb 2024 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963516;
	bh=0Pd0/0g5ocUKEQPs+CZnjpGh8a2yrzXoWJs/48QxMEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cyNcuS0yepL5PtUjvbc/4GFBi2f/FzV2Rq68YWIi6IyGPqro5gwLsktAkGRmwPo1a
	 DPZhVCUVajR9H8/X/Mfrr5g/19Z9FqBbjSBiqN49LicQByhoDK78Kzey/i8uaKehHs
	 LTRp/whj0BtqnzkxIl1rHWzXdbCik8Y0arm5N5cnVYOH4p9zdydt9tsy7G5jSIPUlE
	 ghVEwmHGsW1EjfuxRTurzDKjJr6RXkxUft3/jf/K1OSaiK4+nwoWVbcIiXmp8OuW1J
	 s8rV2N0mpTA5rWd/gCd4jovg5NSF9MQOzC4oohJwqa/2pI0gR/8eV2YU/LnDYnWV6Q
	 JBz+FjYiklaJA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:46 +0000
Subject: [PATCH v8 20/38] arm64/gcs: Ensure that new threads have a GCS
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-20-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=8134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0Pd0/0g5ocUKEQPs+CZnjpGh8a2yrzXoWJs/48QxMEE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDgHmbpnJ6Kt5FNSJQp2DtC/IJQdbRg85cvhx1K
 Miz2+d6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w4AAKCRAk1otyXVSH0Nt4B/
 wL1XPKLA8oon7Ntls/p18FPxhxgITjHFhOhCLATvZLdx2/CGCM3XeV/oZsdqUKAMfvNSiqdk2Hge2L
 fXSpLOz8lwnFEMhBV3cPt2SQCcib5865B65V4ujM7VbyryF0RdOZBJ41g7KrO1xusFXtASE/2LgTRg
 cLOGH05SSH2Iikwkk6HQbyru9QOvtzsuefI+bj077rEszYry0kVn8SgYKDtyKel1hhgX47wO6gRvy/
 LH1qXI2PclfTBlVo+H8Uqr5qA2Vnn4yZpnxjUdpiKQnpuBPZKk3k3h+YZur6WqivBxp086HvEi+kZZ
 zA7yjuAcOJULaSipntqexmuqh00q3A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043201_603662_CB04D805 
X-CRM114-Status: GOOD (  26.48  )
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
to be specified along with the regular stack.  clone3() has been
extended to support this case, allowing userspace to explicitly specify
the size and location of the GCS.  The specified GCS must have a valid
GCS token at the top of the stack, as though userspace were pivoting to
the new GCS.  This will be consumed on use.  At present we do not
atomically consume the token, this will be addressed in a future
revision.

Unfortunately plain clone() is not extensible and existing clone3()
users will not specify a stack so all existing code would be broken if
we mandated specifying the stack explicitly.  For compatibility with
these cases and also x86 (which did not initially implement clone3()
support for shadow stacks) if no GCS is specified we will allocate one
thread so when a thread is created which has GCS enabled allocate one
for it.  We follow the extensively discussed x86 implementation and
allocate min(RLIMIT_STACK, 4G).  Since the GCS only stores the call
stack and not any variables this should be more than sufficient for most
applications.

GCSs allocated via this mechanism then it will be freed when the thread
exits, those explicitly configured by the user will not.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h |   9 ++++
 arch/arm64/kernel/process.c  |  29 +++++++++++
 arch/arm64/mm/gcs.c          | 117 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+)

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
index fd80b43c2969..8bd66cde0a86 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -285,9 +285,32 @@ static void flush_gcs(void)
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
+	/* Ensure the current state of the GCS is seen by CoW */
+	gcsb_dsync();
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
 
@@ -303,6 +326,7 @@ void flush_thread(void)
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
+	gcs_free(tsk);
 }
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
@@ -369,6 +393,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long stack_start = args->stack;
 	unsigned long tls = args->tls;
 	struct pt_regs *childregs = task_pt_regs(p);
+	int ret;
 
 	memset(&p->thread.cpu_context, 0, sizeof(struct cpu_context));
 
@@ -410,6 +435,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
index b0a67efc522b..3cbc3a3d4bc7 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -8,6 +8,113 @@
 #include <asm/cpufeature.h>
 #include <asm/page.h>
 
+static unsigned long alloc_gcs(unsigned long addr, unsigned long size,
+			       unsigned long token_offset, bool set_res_tok)
+{
+	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
+	struct mm_struct *mm = current->mm;
+	unsigned long mapped_addr, unused;
+
+	if (addr)
+		flags |= MAP_FIXED_NOREPLACE;
+
+	mmap_write_lock(mm);
+	mapped_addr = do_mmap(NULL, addr, size, PROT_READ | PROT_WRITE, flags,
+			      VM_SHADOW_STACK, 0, &unused, NULL);
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
+static bool gcs_consume_token(struct task_struct *tsk, unsigned long user_addr)
+{
+	unsigned long expected = GCS_CAP(user_addr);
+	unsigned long val;
+	int ret = 0;
+
+	/* This should really be an atomic cpmxchg.  It is not. */
+	__get_user_error(val, (__user unsigned long *)user_addr, ret);
+	if (ret != 0)
+		return false;
+
+	if (val != expected)
+		return false;
+
+	put_user_gcs(0, (__user unsigned long*)user_addr, &ret);
+
+	return ret == 0;
+}
+
+unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
+				     const struct kernel_clone_args *args)
+{
+	unsigned long addr, size, gcspr_el0;
+
+	/* If the user specified a GCS use it. */
+	if (args->shadow_stack_size) {
+		if (!system_supports_gcs())
+			return (unsigned long)ERR_PTR(-EINVAL);
+
+		addr = args->shadow_stack;
+		size = args->shadow_stack_size;
+
+		/*
+		 * There should be a token, there might be an end of
+		 * stack marker.
+		 */
+		gcspr_el0 = addr + size - (2 * sizeof(u64));
+		if (!gcs_consume_token(tsk, gcspr_el0)) {
+			gcspr_el0 += sizeof(u64);
+			if (!gcs_consume_token(tsk, gcspr_el0))
+				return (unsigned long)ERR_PTR(-EINVAL);
+		}
+
+		/* Userspace is responsible for unmapping */
+		tsk->thread.gcspr_el0 = gcspr_el0 + sizeof(u64);
+	} else {
+
+		/*
+		 * Otherwise fall back to legacy clone() support and
+		 * implicitly allocate a GCS if we need a new one.
+		 */
+
+		if (!system_supports_gcs())
+			return 0;
+
+		if (!task_gcs_el0_enabled(tsk))
+			return 0;
+
+		if ((args->flags & (CLONE_VFORK | CLONE_VM)) != CLONE_VM) {
+			tsk->thread.gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
+			return 0;
+		}
+
+		size = args->stack_size;
+
+		size = gcs_size(size);
+		addr = alloc_gcs(0, size, 0, 0);
+		if (IS_ERR_VALUE(addr))
+			return addr;
+
+		tsk->thread.gcs_base = addr;
+		tsk->thread.gcs_size = size;
+		tsk->thread.gcspr_el0 = addr + size - sizeof(u64);
+	}
+
+	return addr;
+}
+
 /*
  * Apply the GCS mode configured for the specified task to the
  * hardware.
@@ -30,6 +137,16 @@ void gcs_set_el0_mode(struct task_struct *task)
 
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
