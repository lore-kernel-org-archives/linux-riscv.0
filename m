Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F45E95A96
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsZEkXZPCbyVWDKXHkorAQuAwjzFt+kvYVr7wTQChfA=; b=LZcB4DrP+d5N2C
	bujNmoHJkBpyz9IP8FMbwt2maERqDpcUVXbY8s1JsPHMAejUyBKpzdfEexD9XZEu+CnvuOup9vMek
	rF6g6e66DjcXKuaSXKoywOXo6VWiqmwAPEXgZ34erH+Q8Prw7yJ8Ef8X9HRiqArn2u7fnbiXljmtI
	MTVOlP+1E0AqZOWPzfLHiG4X3iR85ztrm1vwq9U8s0RBVNxVeBxEHk1kvgOKY0BsdWBrll7fy0VzE
	CfOxsE/BCJ2ksxGnm/7uBZfxt+EZfX9eWcYtzImyL2u3r0WzKjL/pMKOARMKRNk5veQJb1+YBgp+a
	5CLKFfEQ+XavSPBZ/5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp8n-00Ac0x-2r;
	Mon, 09 Oct 2023 12:13:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp8O-00AbYz-0p;
	Mon, 09 Oct 2023 12:13:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3B98EB81145;
	Mon,  9 Oct 2023 12:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6314FC433C9;
	Mon,  9 Oct 2023 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853593;
	bh=wOX/VCidy7u5iRp7jBzI1P7kDYiqBOUXs9IWPVUSObE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SvQGI1I6auJECsA5HNnZPnyfUEmJKB1kyHPmG4CVELIdmz23aGqtIEB5AHqLotzYw
	 DxAAxMYBdToLGpdI2/CQy80sFIcV/M7qAWyaWrl/YQO6S6vMNpd38WALdW1/EGT8T3
	 F8B/Z7rtlUrTdyCLfcVSIolqwMwlzDUC38mIndIltNjwcRtyiXoay7wMMmiVyZf59L
	 UWahtjJyBl8oYTy1+YMQ/XAUbdqrjnBRON3Dfak4y4Y7RvwJ/NXQOcUyT691wrVa9M
	 U81w+7IDixDnVa1+qAkeE5guZkm1si0HgdS+qwia9QGC6W3BJvYspxbYMJMbXmjuCQ
	 O5/inc6lIA/KQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:56 +0100
Subject: [PATCH v6 22/38] arm64/gcs: Implement shadow stack prctl()
 interface
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-22-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=5673; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wOX/VCidy7u5iRp7jBzI1P7kDYiqBOUXs9IWPVUSObE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2iNjKPEwjokbez9Es4G4AUiv47sNRTtzlb93Ez
 Z1ACm7WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtogAKCRAk1otyXVSH0OkuCA
 CClNtwZ/5fUorz1+MZqrsmriqbf343Fpy7PnkMNDhInuESIyi8lH+YEFCHTVTEReGs0XmsYL3fT/5D
 r6escX4sKstyFt7b7YXL7isYq2Q9gFysn1qt5ZJ7GMYZY42ZwzTiGaq6WNEjGIqpSu/7SueXHVU0Ff
 1j8wvEXjR/e9gZIdBRAOC4XLa/SIXyGmzu99tgPMQcRB53xwIoJ7RRFWPo6Q89+1YSdzmvAO7oXn3o
 xUPcxMoAD9BxPRgyNM+kFpWmcBZhzvOE34UoGe5t9lyl/iH+2oYmvGAaZ5vP+z+qv4TL6KYCHC1Hv3
 /gTZiJAz/IlR9MGyN4GKzPWQ3KGIl7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051316_574737_62B1A3E8 
X-CRM114-Status: GOOD (  21.43  )
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

Implement the architecture neutral prtctl() interface for setting the
shadow stack status, this supports setting and reading the current GCS
configuration for the current thread.

Userspace can enable basic GCS functionality and additionally also
support for GCS pushes and arbatrary GCS stores.  It is expected that
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h       | 22 ++++++++++
 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/mm/gcs.c                | 82 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 4371a2f99b4a..c150e76869a1 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -48,6 +48,9 @@ static inline u64 gcsss2(void)
 	return Xt;
 }
 
+#define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK \
+	(PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE | PR_SHADOW_STACK_PUSH)
+
 #ifdef CONFIG_ARM64_GCS
 
 static inline bool task_gcs_el0_enabled(struct task_struct *task)
@@ -61,6 +64,20 @@ void gcs_preserve_current_state(void);
 unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 			    unsigned long clone_flags, size_t size);
 
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
@@ -76,6 +93,11 @@ static inline unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
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
index c28681cf9721..029d20ea7878 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -181,6 +181,7 @@ struct thread_struct {
 	u64			tpidr2_el0;
 #ifdef CONFIG_ARM64_GCS
 	unsigned int		gcs_el0_mode;
+	unsigned int		gcs_el0_locked;
 	u64			gcspr_el0;
 	u64			gcs_base;
 	u64			gcs_size;
diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index cb0a64bf90af..2b2223b13fc3 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -84,3 +84,85 @@ void gcs_free(struct task_struct *task)
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
+	if (arg & PR_SHADOW_STACK_ENABLE) {
+		if (!task_gcs_el0_enabled(task)) {
+			/* Do not allow GCS to be reenabled */
+			if (task->thread.gcs_base)
+				return -EINVAL;
+
+			if (task != current)
+				return -EBUSY;
+
+			size = gcs_size(0);
+			gcs = alloc_gcs(task->thread.gcspr_el0, size,
+					0, 0);
+			if (!gcs)
+				return -ENOMEM;
+
+			task->thread.gcspr_el0 = gcs + size - sizeof(u64);
+			task->thread.gcs_base = gcs;
+			task->thread.gcs_size = size;
+			if (task == current)
+				write_sysreg_s(task->thread.gcspr_el0,
+					       SYS_GCSPR_EL0);
+
+		}
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
