Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0923C7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OWUrzj1uE+3IOBSzD1si6FfjgtkV/nRxKPVW3ROmIM=; b=CR8lt2tZOl9AL4
	7TlAgrLLq56VdNODd4nIrd3h8Ja0K8s09fNp8k0ECIy4Q8BwCePuHspXmTAIdQtGhUrvhr4FdEqQ0
	hGbejwd3L6SUgawICI9Mm7IdWiiwhlPOa3YE2HhmbYzOatl/LaYZQ8ztv5LwUJ2BSR3uq+bQr+XhD
	uSaBEm1F+y7MPUjO2tn1AcQ8+QpGjoxbppMRa4B70Gt9F9oj9RhdrKfdEcV6KAviRg3TOmHyPve+9
	2onYyg4gdjxMzvGbgjNMkoaYpKHDO0KdMEx2stYQZ7EzoN59TEj1iRcamWsrhjsy1raTCQqm8L1DI
	gx8bKESAMSuau4XGdTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSNN-0000000HTUx-11fs;
	Wed, 28 Aug 2024 23:46:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS8D-0000000HMuN-1HjJ;
	Wed, 28 Aug 2024 23:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9E667CE19B9;
	Wed, 28 Aug 2024 23:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79A5C4CEC7;
	Wed, 28 Aug 2024 23:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887874;
	bh=0ijNiQzhoIAXFEDYsJp9uHeNGvTgXKJ1zqFM87G9Jt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bc/RpC677KLijpq5L1mwxuEjcPOxDMlns/w6h3nTEkQsc8NSkM54ik6PSpz0rreAw
	 i7vXPmYknkw4T53VJg0kQRwtzWoRGLfaP5DSAswNQnNtOCusxEBTMTlWJM+EZtAQme
	 Vg794qYQLOxMf0yC3O+j9wT4578W1V+nUwWpJzs2tAgIUHMOSh3NzEpEgtfvz8OPg/
	 r5Jmsd3icvjZyQqAOQFxGHY1I9dvyz9NsDa5kJQvNJJlApdPar5vr3KKn9MMHas8+6
	 1Qdgg6lmYYv9ELl2JsMrwHD64pJ62NDs3A7G6tfog0qFThFHrU72z//DRt7fcm8X18
	 F1qgEMKmqZnXQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:38 +0100
Subject: [PATCH v12 22/39] arm64/gcs: Implement shadow stack prctl()
 interface
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-22-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5764; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0ijNiQzhoIAXFEDYsJp9uHeNGvTgXKJ1zqFM87G9Jt8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KJ2PiHQzUI060g+R7OT/DKtDLyYjhFDPLtS50c
 RDKOMWaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yiQAKCRAk1otyXVSH0C3zB/
 sFuFp5t3YwHnFl2ww5nQTiFYP8ihu9YkkTra750aX3PXt7y2fvhObybZdkT/vut46tpb6mdWZ3TSBA
 isa/lhZj082VaF/HHcfScdST3/MUe6rsq2xGxJmaRJDXPQTe+ip/i23SKZuhPGOvAip9wbRxiIGjjE
 Gkdz921pVUwTQYKKenm/sSRQCEY2x7PgDvfmo3BLyMXPmNIQsQfsm/zjI8Ip6WJLr7KE5ijSj5G53n
 3umJ9G/zETJmEA6mmmM0MZyhCmSBWLwDPCx+LT5tGMxqQ+6cStHtQYyuXZGinBoby1t/A8u7QMOo67
 K+5WsK7e7Drkyfbvx9haesxgJAnLt8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163117_745780_0E7CE8DF 
X-CRM114-Status: GOOD (  20.89  )
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

Implement the architecture neutral prctl() interface for setting the
shadow stack status, this supports setting and reading the current GCS
configuration for the current thread.

Userspace can enable basic GCS functionality and additionally also
support for GCS pushes and arbitrary GCS stores.  It is expected that
this prctl() will be called very early in application startup, for
example by the dynamic linker, and not subsequently adjusted during
normal operation.  Users should carefully note that after enabling GCS
for a thread GCS will become active with no call stack so it is not
normally possible to return from the function that invoked the prctl().

State is stored per thread, enabling GCS for a thread causes a GCS to be
allocated for that thread.

Userspace may lock the current GCS configuration by specifying
PR_SHADOW_STACK_ENABLE_LOCK, this prevents any further changes to the
GCS configuration via any means.

If GCS is not being enabled then all flags other than _LOCK are ignored,
it is not possible to enable stores or pops without enabling GCS.

When disabling the GCS we do not free the allocated stack, this allows
for inspection of the GCS after disabling as part of fault reporting.
Since it is not an expected use case and since it presents some
complications in determining what to do with previously initialsed data
on the GCS attempts to reenable GCS after this are rejected.  This can
be revisted if a use case arises.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h       | 22 +++++++++++
 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/mm/gcs.c                | 79 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index c1f274fdb9c0..48c97e63e56a 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -50,6 +50,9 @@ static inline u64 gcsss2(void)
 	return Xt;
 }
 
+#define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK \
+	(PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE | PR_SHADOW_STACK_PUSH)
+
 #ifdef CONFIG_ARM64_GCS
 
 static inline bool task_gcs_el0_enabled(struct task_struct *task)
@@ -63,6 +66,20 @@ void gcs_preserve_current_state(void);
 unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 				     const struct kernel_clone_args *args);
 
+static inline int gcs_check_locked(struct task_struct *task,
+				   unsigned long new_val)
+{
+	unsigned long cur_val = task->thread.gcs_el0_mode;
+
+	cur_val &= task->thread.gcs_el0_locked;
+	new_val &= task->thread.gcs_el0_locked;
+
+	if (cur_val != new_val)
+		return -EBUSY;
+
+	return 0;
+}
+
 #else
 
 static inline bool task_gcs_el0_enabled(struct task_struct *task)
@@ -78,6 +95,11 @@ static inline unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 {
 	return -ENOTSUPP;
 }
+static inline int gcs_check_locked(struct task_struct *task,
+				   unsigned long new_val)
+{
+	return 0;
+}
 
 #endif
 
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index c55e3600604a..58eb48cd539f 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -186,6 +186,7 @@ struct thread_struct {
 	u64			tpidr2_el0;
 #ifdef CONFIG_ARM64_GCS
 	unsigned int		gcs_el0_mode;
+	unsigned int		gcs_el0_locked;
 	u64			gcspr_el0;
 	u64			gcs_base;
 	u64			gcs_size;
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 6e8a5e14fff1..979e02cece93 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -107,3 +107,82 @@ void gcs_free(struct task_struct *task)
 	task->thread.gcs_base = 0;
 	task->thread.gcs_size = 0;
 }
+
+int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
+{
+	unsigned long gcs, size;
+	int ret;
+
+	if (!system_supports_gcs())
+		return -EINVAL;
+
+	if (is_compat_thread(task_thread_info(task)))
+		return -EINVAL;
+
+	/* Reject unknown flags */
+	if (arg & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
+		return -EINVAL;
+
+	ret = gcs_check_locked(task, arg);
+	if (ret != 0)
+		return ret;
+
+	/* If we are enabling GCS then make sure we have a stack */
+	if (arg & PR_SHADOW_STACK_ENABLE &&
+	    !task_gcs_el0_enabled(task)) {
+		/* Do not allow GCS to be reenabled */
+		if (task->thread.gcs_base || task->thread.gcspr_el0)
+			return -EINVAL;
+
+		if (task != current)
+			return -EBUSY;
+
+		size = gcs_size(0);
+		gcs = alloc_gcs(0, size);
+		if (!gcs)
+			return -ENOMEM;
+
+		task->thread.gcspr_el0 = gcs + size - sizeof(u64);
+		task->thread.gcs_base = gcs;
+		task->thread.gcs_size = size;
+		if (task == current)
+			write_sysreg_s(task->thread.gcspr_el0,
+				       SYS_GCSPR_EL0);
+	}
+
+	task->thread.gcs_el0_mode = arg;
+	if (task == current)
+		gcs_set_el0_mode(task);
+
+	return 0;
+}
+
+int arch_get_shadow_stack_status(struct task_struct *task,
+				 unsigned long __user *arg)
+{
+	if (!system_supports_gcs())
+		return -EINVAL;
+
+	if (is_compat_thread(task_thread_info(task)))
+		return -EINVAL;
+
+	return put_user(task->thread.gcs_el0_mode, arg);
+}
+
+int arch_lock_shadow_stack_status(struct task_struct *task,
+				  unsigned long arg)
+{
+	if (!system_supports_gcs())
+		return -EINVAL;
+
+	if (is_compat_thread(task_thread_info(task)))
+		return -EINVAL;
+
+	/*
+	 * We support locking unknown bits so applications can prevent
+	 * any changes in a future proof manner.
+	 */
+	task->thread.gcs_el0_locked |= arg;
+
+	return 0;
+}

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
