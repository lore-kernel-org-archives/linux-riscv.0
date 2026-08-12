Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3AEC5DF60
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pB1SlBlHTsnZfbzxQpodTtp1GUgzyf+eoASCXY9ajYY=; b=l5kyq33C+pzLY3
	csr4VwPjZxmLdZDKOzSJEzYSE48Y2yQqYjx+jAi+UUz5EePKHAbPRA2ytS1jAfuyH6nhzlfTTRlL9
	dEhdvMkU3DvIF1EKqr38QtJzE7gLh0Ee7HcAeof2ydJWqcAzdAYkYLuwA7zPFtBNKGBkWD4EwuCVy
	NQRTCn6DKiRdp6sOE+iNTxESwOAD1Cm4dsxrORdP/0YWJW8DqR7odhZwtqFxxlUwG9QrnAcocug8s
	gVNiIdE3LCmr23Lg0kelzjYjfiJ3ohYwmco9j0ccRTK1MHhFAcMbapFoqx8s3f+UdMEkM+/VyCCKp
	5OGGY0LmacWRx8wt2P+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCcO-0000000Gei9-0Pn5;
	Wed, 12 Aug 2026 17:19:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCcM-0000000GehN-0ecT
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 17:19:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D295B1596;
	Wed, 12 Aug 2026 10:19:46 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B287F3F66F;
	Wed, 12 Aug 2026 10:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786555190; bh=i5iDbk7xspyU9JtWPxQanLp+P+TxFksfKMvwWQ0GNmU=;
	h=From:To:Cc:Subject:Date:From;
	b=M6DHFVir0DQKQ3p3jdphqsuM/XS1GejEM6rjemttLZzudXUBL/Q6p8XmzkocZadC5
	 lPG8BN6/JCURoSKcrafIKBQCV9s59NrO7cokSBI5IOb3WKRC1cFftcEAAjTqmxoOkH
	 f2dUbhJ6hcKKz7fl1NmgIRagL2bNzPvap5MRpakA=
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
Subject: [PATCH v2 1/2] x86/shstk: support via prctl
Date: Wed, 12 Aug 2026 12:19:39 -0500
Message-ID: <20260812171940.1046116-1-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_101954_282192_EC63C0A8 
X-CRM114-Status: GOOD (  12.15  )
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
 arch/x86/kernel/shstk.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index 0ca64900192f..c34ba3701dd0 100644
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
@@ -630,3 +631,39 @@ bool shstk_is_enabled(void)
 {
 	return features_enabled(ARCH_SHSTK_SHSTK);
 }
+
+#define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK \
+		(PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE | PR_SHADOW_STACK_PUSH)
+
+/* Handles the generic prctl interface for PR_SET_SHADOW_STACK_STATUS and its feature bits */
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	int rc;
+
+	if (status & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
+		return -EINVAL;
+
+	/* x86 arch_prctl is single bit at a time, so handle these one at time */
+	if (!status & PR_SHADOW_STACK_ENABLE)
+		return shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+
+	rc = shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
+	if (rc)
+		return rc;
+
+	if (status & PR_SHADOW_STACK_WRITE)
+		return shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS);
+
+	return shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_WRSS);
+}
+
+/* Handles the generic prctl interface for PR_LOCK_SHADOW_STACK_STATUS and its feature bits */
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return shstk_prctl(t, ARCH_SHSTK_LOCK, status);
+}
+
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
