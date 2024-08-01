Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8293C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PNes/XrCbnfWUIx45j4BBRIVVR810NufG7RK5orYwQ=; b=vmMzMJ/Zb8H653
	aTyQp5fAVxTGyqRhBcoNDbKAWXOHxZjbJH0mb9mgOxW6EO5AM8qp9H3R/BtzSZZLCh5hpaX49uQt4
	pA6v+FWZWmYyBkL2SWnVaKQREHLdidcQE5UkNOKgLOguVDMEQLgcOcxua1cf7AC2SbJ7JL9dezNUr
	HYOAG7yO4iz6AMGsnqy7dt1FFONKroBCYx1ncsg1cW32wO0/QtXzCIWMhi/ng/7JsrrZtK95rGbmF
	NQXKzMMJaXGsjvhlhQo6fS1iMxVlJMW3CPV9n+nbv9I0ZtBiifo7wZmmB5Uqjvf3GWj8iVe5aBAoE
	wocniQ6PyXHi6pxPS5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVYf-00000005Osm-1a2p;
	Thu, 01 Aug 2024 13:09:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVP7-00000005J6V-1bpw;
	Thu, 01 Aug 2024 12:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4A4F6289A;
	Thu,  1 Aug 2024 12:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A904C4AF0A;
	Thu,  1 Aug 2024 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517176;
	bh=B69uwIuCGaKqwsutt9MY1WdHU2Nd2UTBTyjAA6ycbjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DQGqZA9kVe6Q06m1WoCxQtK4JmHaCPpb4APHp6BgHlF2FIIwvGPb6RMKgMR6P8mMf
	 qdIPsYKbAUQsrXT4ri+ptZ9lB552puxtQ7wUs5eNGbzkurCzMiDov4kbExD3bYJ0t5
	 8mobtgZWomucDDY8HnCSAvFJB3RPpGjzndt9S/18dNbGD13FYZq279THnIqay1WAuC
	 o7A+SJOgIczCFyX1wVa8RlCpu7hmtx/joBnXeO+9D4Jxw3kVHwvydW+0p35tLiLBaa
	 1uAbRdf+3Sx5x7qgSE6gyLbgxMKh86zRlnC1Ek4I2dXJjPIj7G4dsUAby1G1Z/LX5U
	 t2xnnjMraHGcg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:47 +0100
Subject: [PATCH v10 20/40] arm64/gcs: Ensure that new threads have a GCS
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-20-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=8544; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B69uwIuCGaKqwsutt9MY1WdHU2Nd2UTBTyjAA6ycbjo=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhrTVbaIy+vc4fr3IP/boS+1nK5mj83yC0g+vtfHZvszmSntz
 hVt+J6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwkaNe7P/jJu88bVcme/NBi9/Eth
 nRZxnUt3guZ/T27860263to5xk0duraXbr/Y+qX2bK9RfLf5a72pQvumUYaX/dsfZcOdPFHQ0pHy9+
 lHtbrZw8Lz1MkU/V4nd284a1xSWHz/0yWWpdsjh5yQr3dXMldivunr1R7FflLZdp25MWWbeZ/DUSTl
 hepN26eHJn08dPMrGCfhUW4ltZO0x0HXseTfEsdi3tM6k55ZB4fYfJmtrde9K2xamVMzHIs342mTOV
 n+mIIeuPq6k/e/cHnGhWXlGslyMuvuTiPUZ/0aT5J9vNV+RYaverCmWZHI/y69tpuIFphfNKR4lWs5
 ML9x+XkZrNEHP34C8HucZJBYeTAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055937_578714_917504E7 
X-CRM114-Status: GOOD (  27.60  )
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
so when a thread is created which has GCS enabled allocate one for it.
We follow the extensively discussed x86 implementation and allocate
min(RLIMIT_STACK, 2G).  Since the GCS only stores the call stack and not
any variables this should be more than sufficient for most applications.

GCSs allocated via this mechanism will be freed when the thread exits,
those explicitly configured by the user will not.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h |   9 +++
 arch/arm64/kernel/process.c  |  29 +++++++++
 arch/arm64/mm/gcs.c          | 142 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 180 insertions(+)

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
index 5f00cb0da9c3..d6d3a96cf2e4 100644
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
@@ -366,6 +390,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	unsigned long stack_start = args->stack;
 	unsigned long tls = args->tls;
 	struct pt_regs *childregs = task_pt_regs(p);
+	int ret;
 
 	memset(&p->thread.cpu_context, 0, sizeof(struct cpu_context));
 
@@ -407,6 +432,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
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
index b0a67efc522b..b71f6b408513 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -8,6 +8,138 @@
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
+static bool gcs_consume_token(struct mm_struct *mm, unsigned long user_addr)
+{
+	u64 expected = GCS_CAP(user_addr);
+	u64 val;
+	int ret;
+
+	/* This should really be an atomic cmpxchg.  It is not. */
+	ret = access_remote_vm(mm, user_addr, &val, sizeof(val),
+			       FOLL_FORCE);
+	if (ret != sizeof(val))
+		return false;
+
+	if (val != expected)
+		return false;
+
+	val = 0;
+	ret = access_remote_vm(mm, user_addr, &val, sizeof(val),
+			       FOLL_FORCE | FOLL_WRITE);
+	if (ret != sizeof(val))
+		return false;
+
+	return true;
+}
+
+int arch_shstk_post_fork(struct task_struct *tsk,
+			 struct kernel_clone_args *args)
+{
+	struct mm_struct *mm;
+	unsigned long addr, size, gcspr_el0;
+	int ret = 0;
+
+	mm = get_task_mm(tsk);
+	if (!mm)
+		return -EFAULT;
+
+	addr = args->shadow_stack;
+	size = args->shadow_stack_size;
+
+	/*
+	 * There should be a token, and there is likely to be an optional
+	 * end of stack marker above it.
+	 */
+	gcspr_el0 = addr + size - (2 * sizeof(u64));
+	if (!gcs_consume_token(mm, gcspr_el0)) {
+		gcspr_el0 += sizeof(u64);
+		if (!gcs_consume_token(mm, gcspr_el0)) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	tsk->thread.gcspr_el0 = gcspr_el0 + sizeof(u64);
+
+out:
+	mmput(mm);
+
+	return ret;
+}
+
+unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
+				     const struct kernel_clone_args *args)
+{
+	unsigned long addr, size;
+
+	/* If the user specified a GCS use it. */
+	if (args->shadow_stack_size) {
+		if (!system_supports_gcs())
+			return (unsigned long)ERR_PTR(-EINVAL);
+
+		/* GCSPR_EL0 will be set up when verifying token post fork */
+		addr = args->shadow_stack;
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
+		addr = alloc_gcs(0, size);
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
@@ -30,6 +162,16 @@ void gcs_set_el0_mode(struct task_struct *task)
 
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
