Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FFEC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Acmh6F60XQiI1CMYUtNDsU19bEApPTCkx0ze2IbFs/o=; b=0LDB02I/hQlvAK
	zUXWyXl2CA2w2XjOcyi+6KTEpYxRbPSyEc3cW09Z+pq8lvermf2WIdNygPw41eOtnRjBMPcXr5qcL
	K+3rmAVA5KrX71TnjXJ/5m7wrOdeOfm8mBONU2djI9ZSo4ds76RPPZolQ95YEs6RvvHCaJnMloCq7
	C3v6UKIcj32mrsXCYMBFoHzIeXE1XZJrr0vA6j0xiOEhiW35xJ2+hDPSGjOTS4Bs8PN4oum9mVhpL
	BvrK40zfrvKnNRYBwTNTLaMscVPBS+89ljNCo1FvLEi/i6v+dG67dsfhYg0rLAlk+N6BFQ7yyqqpK
	hw4LjTrZx4ze+XYQlfzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuy1-004Gvl-2a;
	Mon, 24 Jul 2023 12:47:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuxv-004Gs6-06;
	Mon, 24 Jul 2023 12:47:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 71CA861158;
	Mon, 24 Jul 2023 12:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10031C433C8;
	Mon, 24 Jul 2023 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202825;
	bh=Ha5XZJGD09gV/heFbQXX/olVVoWkfD4y83jPPv1O1fs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XjzuJ4CCM6ZFYVXQVBnAtl2qFaSJcOnSdBa2YnR2gctCsWr1Kjge1Cr5Hm6hCCL1L
	 lJte51uwrpvFxPHkIi4zmAIjOIQXm2aIxcZztmYzPr0dwlT8N1lA8vnIxeAgbNsFaH
	 NhzgYSQgAulfi7NFvsH4rkHykMGTVXUp53McliPAk5ddgoiKpfWgmgSYi1tSGdGb8j
	 VrymgggOsdKu520q0Nar3Iq/Dar5vXeuRYwMjC48qEX/MJJh9Syc0ko6SRhgtETTSb
	 8griVt+nzArLfXGI0wOltEET48B1bdL24Nj1CHr5z2+kdGsq6IFK8ZES8TeJoF2iL9
	 twAcqvgrRi/QA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:45:48 +0100
Subject: [PATCH v2 01/35] prctl: arch-agnostic prctl for shadow stack
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-1-dc2c1d44c2eb@kernel.org>
References: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
In-Reply-To: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=4712; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ha5XZJGD09gV/heFbQXX/olVVoWkfD4y83jPPv1O1fs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKGzmJ6bW+XHW3KRIRbKtzN7oIBqPwmzob9MSSu
 feu/jZyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5yhgAKCRAk1otyXVSH0N53B/
 0RCo+v9GuodPKGUUlsCb2m+fzugBVD7KAydw/W8joi4ncLHkFDCfF6a3VR+OdzeVPXXbt5jrPyUUDK
 wtQtIe1CZpTrqp6ldxUREMtG8Zy9FCESrZUW7nGwiis9h2Ts5sNohIFo1jzK0JP84HQ3KZr8r2hMku
 +flLsRBhm3GwM888dK1xvk/xWY1UI2+MNcDm5KNa1QKOSYXrVoJaswMr3d4gT1anqYo5W9lDviiZqV
 PXptSh6/2iwzcXvokTe3DU2QvemUrTTXEm3QKC8HAs2tzSOWejm+DJhzvKg9e5Dx9U5lk/gEmt+McO
 yU6xnXXrvY6u5N/LXOWS8P5xSIE5mv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054707_191453_9CD2389B 
X-CRM114-Status: GOOD (  20.21  )
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

Three architectures (x86, aarch64, riscv) have announced support for
shadow stacks with fairly similar functionality.  While x86 is using
arch_prctl() to control the functionality neither arm64 nor riscv uses
that interface so this patch adds arch-agnostic prctl() support to
get and set status of shadow stacks and lock the current configuation to
prevent further changes, with support for turning on and off individual
subfeatures so applications can limit their exposure to features that
they do not need.  The features are:

  - PR_SHADOW_STACK_ENABLE: Tracking and enforcement of shadow stacks,
    including allocation of a shadow stack if one is not already
    allocated.
  - PR_SHADOW_STACK_WRITE: Writes to specific addresses in the shadow
    stack.
  - PR_SHADOW_STACK_PUSH: Push additional values onto the shadow stack.

These features are expected to be inherited by new threads and cleared
on exec(), unknown features should be rejected for enable but accepted
for locking (in order to allow for future proofing).

This is based on a patch originally written by Deepak Gupta but modified
fairly heavily, support for indirect landing pads is removed, additional
modes added and the locking interface reworked.  The set status prctl()
is also reworked to just set flags, if setting/reading the shadow stack
pointer is required this could be a separate prctl.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/mm.h         |  4 ++++
 include/uapi/linux/prctl.h | 22 ++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 97eddc83d19c..c57c5030ef6c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3947,4 +3947,8 @@ static inline void accept_memory(phys_addr_t start, phys_addr_t end)
 
 #endif
 
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
+
 #endif /* _LINUX_MM_H */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 3c36aeade991..0de3d6ee18e0 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -305,4 +305,26 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+/*
+ * Get the current shadow stack configuration for the current thread,
+ * this will be the value configured via PR_SET_SHADOW_STACK_STATUS.
+ */
+#define PR_GET_SHADOW_STACK_STATUS      71
+
+/*
+ * Set the current shadow stack configuration.  Enabling the shadow
+ * stack will cause a shadow stack to be allocated for the thread.
+ */
+#define PR_SET_SHADOW_STACK_STATUS      72
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+# define PR_SHADOW_STACK_WRITE		(1UL << 1)
+# define PR_SHADOW_STACK_PUSH		(1UL << 2)
+
+/*
+ * Prevent further changes to the specified shadow stack
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_SHADOW_STACK_STATUS      73
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 2410e3999ebe..b26423a614a9 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2302,6 +2302,21 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
 	return -EINVAL;
 }
 
+int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -2720,6 +2735,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_V_GET_CONTROL:
 		error = RISCV_V_GET_CONTROL();
 		break;
+	case PR_GET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_shadow_stack_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_SET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_shadow_stack_status(me, arg2);
+		break;
+	case PR_LOCK_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_shadow_stack_status(me, arg2);
+		break;
 	default:
 		error = -EINVAL;
 		break;

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
