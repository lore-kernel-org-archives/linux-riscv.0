Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427FBE95A9D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bkBzZXRC5Si50MuFNh/XiNolFkncFQWWdqV/kD2PW8=; b=dt6VLPlKOxierF
	AC4WUuMQ8yPIoS+eeAKM5k58H9Dje34RBTxBo2R9sffTmro4qrumKShALKdwuxeKz7z3iFUkuigkH
	1xFYxkEjiOyN2ONTPqz/zHL0pfLz3YtzoBXLmwfmnVZUwgcW4iKcibPzqiYP6n18z+/p5qbGwmHLd
	TsrSIdvP4LMFLyUl4hyKOV+U8g5/XyQqyUsDG1JZwZdcFMWH/oDMFsO9Kb+DaZx6I5sNnxQjEdUYl
	0u9jeFMFj3Sp3bWFlXdbuPmaW/GTYgTs5NwvL9csLlcoqgyNQSTrLQsexV0dmtLF7tXophp4/A1gY
	vNJjCAMTXGHsWUEvdhZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp6A-00AZH8-39;
	Mon, 09 Oct 2023 12:10:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp66-00AZFG-33;
	Mon, 09 Oct 2023 12:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D7256CE1376;
	Mon,  9 Oct 2023 12:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A42FC433C7;
	Mon,  9 Oct 2023 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853452;
	bh=yZCoppzoGnZPmAd9Kauu4UXsNYRCsI9CR42S+W5etl4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KfaSEuyti9yWaWrEBf3akhOEHiu5eb2yx+UnsZ18vCm+Y1bC5B/UAqx0zLltqo+ip
	 3fHLpAwZPY9dFL3cvPerE8BiKh4Tf7SSMDY/ry21LIvnJum7TuVkBK1t9+nYWjOmwg
	 PzDZUnCMEWbKgWvT7xDv8SzZK3GYR5ASxUwMXngtHUQ9WtFOp2/K6geP57XBi8noQw
	 gJb0b5s6U9MHI5YpOdBbj/pQhynDfJgbiAmFAyJBPB+8PaaGprZ1DXMCwAmNJ/xxx+
	 GadTieXWjIHaAn/GKtUmG7bDgn90LmltQnMaPfmoZpAYO1NBhXSwxZF4uPTPY7J2Z7
	 g7Jb8R0d8hCxw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:36 +0100
Subject: [PATCH v6 02/38] prctl: arch-agnostic prctl for shadow stack
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-2-78e55deaa4dd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4712; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yZCoppzoGnZPmAd9Kauu4UXsNYRCsI9CR42S+W5etl4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2SDvU9dypsYcMutZwOrXCms75ZIsrxzA45vLCi
 1QP1N8+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtkgAKCRAk1otyXVSH0FD3B/
 9+eSR3IayfadFWaepYJfA2rkRAM2ngjlHgiL/7/n61CQ9wpdWs9fxUO6kwNxn+agL6L3TD9bZMvpDq
 zqxzfCD8PeE/IWYexVyudu4VaT1aCv2c5XNk2gJdwlV5rNduptKeYOHOxX2rl2u9h9dmFYclt5Rz6V
 je6RdJkBXzraM538hH5NNEGTwaLMGKoefu3DWIOjw39uHSvwIx47NvNc0CpKlImqTSlFr16tgHn8wI
 3jzVYmQeL5F/VIIXydcFZJ7JxU2MpQyK2J/2kcyacOyrGr/zhzY+3kFfrLoMDa3Q1nwBQHVHCFn1LE
 yes3qfbGW1Ja8ku/1QEZdHg70UNsH3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051055_332102_8ADF58AC 
X-CRM114-Status: GOOD (  18.84  )
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
index bf5d0b1b16f4..1f0d93151a36 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4062,4 +4062,8 @@ static inline void accept_memory(phys_addr_t start, phys_addr_t end)
 
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
