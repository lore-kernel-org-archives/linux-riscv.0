Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92438C47095
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 15:09:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C66D621582
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 15:09:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QcH/kUlM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUL1Zi+Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C66D621582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWxLhYB+G522qyQrzGNt9m38jr6+o6IRNbXyh0qwrkk=; b=QcH/kUlM0rYEj9Z21zO1Q6M2UT
	hWRxdAgEd75oWFKYe12pO6RgVTVJ8KXCMcPAOdGu5SYaXw476EZMUqAQvVqa81O7t4cXkiAOi+Vv8
	fZNK9dUXE8ndTLsosW+WSKyvOr5fNn5P14u2HFekQSMX3SBbU5VOINfxJiJM3CJ60EO2sJYncMziS
	qQuswt8guMg/QtUHoqVx8tEpKV3uPvzMeo62IfveC0eQ0ZVGL6aEHV7hNNBDW5JcyRl7+0b9rvs4q
	0dXKqmvVsD4fWiZBCCVGmS6Vi/h4FQIL8Ye3V+Os6hDaskfCFzTWPf5eJ1SlqvpILUEqDEJRTT6wi
	PMBgwXQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQB4N-0001gg-9t; Wed, 07 Oct 2020 15:09:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQB4L-0001fy-I7
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 15:09:30 +0000
Received: from localhost.localdomain (89.208.247.74.16clouds.com
 [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58935214DB;
 Wed,  7 Oct 2020 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602083368;
 bh=wa3UNQY5M68kvrp3WlQFqVMwzcbaee+F0aszO366QLA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JUL1Zi+ZPJLc5XySN4I9YEDa60ZStkGiL4GLA3bbLdiGwKqNDruD2i6syAirmXAUs
 dVCtMOy2HkuwXVzWCEyzuyamIUYbJJzWFWV131Xe4cSCqs1FERxZLNntp9G586gyJ2
 InHkhK5QPWC3ZZUktqhM/Bh86WXEBl7Q0OXEHfJs=
From: guoren@kernel.org
To: palmerdabbelt@google.com
Subject: [PATCH 2/2] riscv: Fixup static_obj() fail v2
Date: Wed,  7 Oct 2020 15:08:33 +0000
Message-Id: <1602083313-19239-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602083313-19239-1-git-send-email-guoren@kernel.org>
References: <1602083313-19239-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_110929_738770_3A88AD69 
X-CRM114-Status: GOOD (  18.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 schwab@linux-m68k.org, atishp@atishpatra.org, linux-riscv@lists.infradead.org,
 aurelien@aurel32.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

v1 is commit: 6184358da0004c8fd940afda6c0a0fa4027dc911 which has
been reverted.

When enable LOCKDEP, static_obj() will cause error:

[    0.067192] INFO: trying to register non-static key.
[    0.067325] the code is fine but needs lockdep annotation.
[    0.067449] turning off the locking correctness validator.
[    0.067718] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc7-dirty #44
[    0.067945] Call Trace:
[    0.068369] [<ffffffe00020323c>] walk_stackframe+0x0/0xa4
[    0.068506] [<ffffffe000203422>] show_stack+0x2a/0x34
[    0.068631] [<ffffffe000521e4e>] dump_stack+0x94/0xca
[    0.068757] [<ffffffe000255a4e>] register_lock_class+0x5b8/0x5bc
[    0.068969] [<ffffffe000255abe>] __lock_acquire+0x6c/0x1d5c
[    0.069101] [<ffffffe0002550fe>] lock_acquire+0xae/0x312
[    0.069228] [<ffffffe000989a8e>] _raw_spin_lock_irqsave+0x40/0x5a
[    0.069357] [<ffffffe000247c64>] complete+0x1e/0x50
[    0.069479] [<ffffffe000984c38>] rest_init+0x1b0/0x28a
[    0.069660] [<ffffffe0000016a2>] 0xffffffe0000016a2
[    0.069779] [<ffffffe000001b84>] 0xffffffe000001b84
[    0.069953] [<ffffffe000001092>] 0xffffffe000001092

Because some __initdata static variables is before _stext:

static int static_obj(const void *obj)
{
        unsigned long start = (unsigned long) &_stext,
                      end   = (unsigned long) &_end,
                      addr  = (unsigned long) obj;

        /*
         * static variable?
         */
        if ((addr >= start) && (addr < end))
                return 1;

	if (arch_is_kernel_data(addr))
		return 1;

We could implement arch_is_kernel_data to fixup it.

Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reported-by: Aurelien Jarno <aurelien@aurel32.net>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Atish Patra <atishp@atishpatra.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/include/asm/sections.h | 20 ++++++++++++++++++++
 arch/riscv/kernel/setup.c         |  9 +++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/riscv/include/asm/sections.h

diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
new file mode 100644
index 00000000..2317b9e
--- /dev/null
+++ b/arch/riscv/include/asm/sections.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_SECTIONS_H
+#define _ASM_RISCV_SECTIONS_H
+
+#define arch_is_kernel_data arch_is_kernel_data
+
+#include <asm-generic/sections.h>
+
+extern bool init_mem_is_free;
+
+static inline int arch_is_kernel_data(unsigned long addr)
+{
+	if (init_mem_is_free)
+		return 0;
+
+	return addr >= (unsigned long)__init_begin &&
+		addr < (unsigned long)__init_end;
+}
+#endif /* _ASM_RISCV_SECTIONS_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2c6dd32..9ebd5eb4 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -17,6 +17,7 @@
 #include <linux/sched/task.h>
 #include <linux/swiotlb.h>
 #include <linux/smp.h>
+#include <linux/poison.h>
 
 #include <asm/cpu_ops.h>
 #include <asm/setup.h>
@@ -112,3 +113,11 @@ static int __init topology_init(void)
 	return 0;
 }
 subsys_initcall(topology_init);
+
+bool init_mem_is_free = false;
+
+void free_initmem(void)
+{
+	free_initmem_default(POISON_FREE_INITMEM);
+	init_mem_is_free = true;
+}
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
