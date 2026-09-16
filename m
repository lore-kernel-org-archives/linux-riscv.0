Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3E4C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcXA3/Xsu5ON60VpTP/0pzn1oJgbslT5tWXHcy2Sfy4=; b=YC3c7oLVGw/+7l
	yoQktSbznTUTmC3wNTRN3qpn0778EvaQ1Z2eP8FzI/qLQww/pIKUIfmrxGPTUV7S1N7n1+MjETDwI
	gMtZaID1xLHf1fpBpDzaqJIELUX6U0YwwG8RjY35bjtdwMZVl/bAl9Yl/z5R6KZh3DmNWMwReKqVN
	WaMIv8OWthN/pI5jhzasN+GFdvz4tjObczWsM25QjGcd+jPXWdzFbzxvkJ6FI2NvsBpxIqESzZpNE
	BOeDMJtT8+Qrm1hxfyPupUA6YHG0oM2OAyqtwZ1NhqvNOJ3F7RNtK8D4I0K2FG1nJAANl9KugI+5d
	6uXLewS8KCnkftSpJMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoY-00000007qzF-3obu;
	Tue, 15 Sep 2026 19:27:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoU-00000007qwF-0UPr
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 19:27:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3BD71DB5;
	Tue, 15 Sep 2026 12:27:25 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8743F882;
	Tue, 15 Sep 2026 12:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789500449; bh=G1vVaQod4yPGe4rv5ZkoOe7qjpErYp0ggnq2+ZVR5WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hd9kxPBTGtc0xptHY4Gms+93ep1oEbAtsfXAiendWitFYVyfKOgd3BeeQHSM+Z8np
	 GDEB14OWNG8oLwkOaryeFIWuP85SFgkbGgKxGVRm5xJTrLwj8+KBxF2CnSVTNngYQp
	 IzpdA91OWT3fcpWpIZvDuBSHX6TgK4pYputRYqVw=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	rick.p.edgecombe@intel.com,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH v4 4/6] x86/shstk: support via prctl
Date: Wed, 16 Sep 2026 04:52:22 -0500
Message-ID: <20260916095224.1533971-5-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916095224.1533971-1-bill.roberts@arm.com>
References: <20260916095224.1533971-1-bill.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_122730_278875_E204AAFE 
X-CRM114-Status: GOOD (  15.64  )
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

Historically, managing the user-space shadow stack state on x86 has
been handled exclusively through the arch_prctl() interface via the
ARCH_SHSTK_* operations. However, other architectures (such as arm64 and
riscv) do not implement arch_prctl() and instead utilize the newer,
arch-agnostic, prctl() interface (i.e. PR_GET_SHADOW_STACK_STATUS and
PR_SET_SHADOW_STACK_STATUS).

To provide language runtimes, toolchains, and libc implementations with a
consistent, cross-architecture interface for managing control-flow
integrity, wire up the generic shadow stack prctl handlers for x86.

Map the generic PR_SHADOW_STACK_ENABLE, PR_SHADOW_STACK_DISABLE, and
PR_SHADOW_STACK_LOCK operations onto the underlying x86 internal CET helper
routines. This allows portable userspace applications to toggle or query
shadow stack states without relying on architecture-specific system calls,
while maintaining backward compatibility with existing arch_prctl() calls.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 arch/x86/kernel/shstk.c | 83 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index 0ca64900192f..249c4998732a 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -18,6 +18,7 @@
 #include <linux/sizes.h>
 #include <linux/user.h>
 #include <linux/syscalls.h>
+#include <linux/prctl.h>
 #include <asm/msr.h>
 #include <asm/fpu/xstate.h>
 #include <asm/fpu/types.h>
@@ -630,3 +631,85 @@ bool shstk_is_enabled(void)
 {
 	return features_enabled(ARCH_SHSTK_SHSTK);
 }
+
+/* Handles the generic prctl interface for PR_SET_SHADOW_STACK_STATUS and its feature bits */
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	int rc;
+	bool shstk_was_enabled = features_enabled(ARCH_SHSTK_SHSTK);
+
+	/*
+	 * One must explicitly perform enable/disable calls for the whole feature set so
+	 * that the locked bits are checked. It is also important to capture entry state
+	 * for roll-back if needed. However, we must NOT try to enable or disable a feature
+	 * unless there is a change in feature status from old to new state. This is
+	 * because shstk_prctl(), correctly, checks locked bits before feature enabled/disabled
+	 * short circuit.
+	 */
+	switch (status) {
+	case 0:
+		/*
+		 * We do NOT explicitly disable WRSS here, disabling shadow stack will disable WRSS,
+		 * and we don't want a locked WRSS to prevent disable.
+		 */
+		return shstk_was_enabled ?
+			shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK) : 0;
+
+	case PR_SHADOW_STACK_ENABLE:
+		if (!shstk_was_enabled) {
+			rc = shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
+			if (rc)
+				return rc;
+		}
+
+		if (features_enabled(ARCH_SHSTK_WRSS)) {
+			rc = shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_WRSS);
+			if (rc && !shstk_was_enabled)
+				shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+			return rc;
+		}
+
+		return 0;
+
+	case PR_SHADOW_STACK_ENABLE|PR_SHADOW_STACK_WRITE:
+		if (!shstk_was_enabled) {
+			rc = shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
+			if (rc)
+				return rc;
+		}
+
+		if (!features_enabled(ARCH_SHSTK_WRSS)) {
+			rc = shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS);
+			if (rc && !shstk_was_enabled)
+				shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+
+			return rc;
+		}
+
+		return 0;
+
+	/*
+	 * Unknown bit mapping, unsupported PR_SHADOW_STACK_PUSH or *only*
+	 * PR_SHADOW_STACK_WRITE.
+	 */
+	default:
+		return -EINVAL;
+	}
+}
+
+/* Handles the generic prctl interface for PR_LOCK_SHADOW_STACK_STATUS and its feature bits */
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return shstk_prctl(t, ARCH_SHSTK_LOCK, status);
+}
+
+/*
+ * We assume the prctl() feature bits line up with the arch_prctl() specific ones. If not,
+ * the flags returned via arch_get_shadow_stack_status will be mapped wrong.
+ */
+static_assert(PR_SHADOW_STACK_ENABLE == ARCH_SHSTK_SHSTK);
+static_assert(PR_SHADOW_STACK_WRITE  == ARCH_SHSTK_WRSS);
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	return shstk_prctl(t, ARCH_SHSTK_STATUS, (unsigned long)status);
+}
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
