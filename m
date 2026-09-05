Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20314C624DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVpekmLMeCneMOWkB1znxYxLlJHS6c89ZbL4prv8JYE=; b=q1wLa27KdoVVuV
	qWjZDj3elfRsQ7YMSEOpIyGqueuxLCrlST4aZHH+6nx3z/5F+ozaCSNEACc8SFxU3K4RqI9TuThYr
	EX/UsH9Y1uMm65QpjeWvaAV0MZEL75yhrQxd7x5iRwZS+8twqwiIfNul9T0papbQKC6FFKfKew5eU
	hCyjEprDMAZeEGmfK8Tn4QHjUJcjI+Ixk1D0byF/Ol+DNtfrjDqQqz+tuNx8lSBj/D/UDoAShDM/X
	iidW41Max0+pMGTQLhShJIYDQ5aKbYjfbeu/xi1G8whlOXr/jvWwpBSefrGuH1ngenXZC7YJb3QtA
	gTtlDHPvo4Uu1MYabLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2m0I-00000003sOp-28qS;
	Sat, 05 Sep 2026 08:44:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2m0H-00000003sOV-27cG
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 08:44:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF7AB40710;
	Sat,  5 Sep 2026 08:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0590B1F00A3D;
	Sat,  5 Sep 2026 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788597840;
	bh=TqHxrurdJhNzBV3eFI/kHdibDuBoPuJBWEjFN7cWhls=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=n45UFJebFtAjpDIOQvQV6ILE4X7MHItuVnpyCO6mUMJT8AXVeHMpqd0snSOdXyDoC
	 zzU9B/7atWIOLzsPiAei1sXp+RPDcxNsLQp3/HNA7p2/qia6Y7iAOodsD0tPVWfiFn
	 Rd364Le1+++FmU/fQ5K1ezV1jAbMWMnpTPnLAIFuVLH2SAoOWE/202b4OzCkDDk03E
	 vnhgebbCWxSLAMCbCL9agEzksRK33yvkS81CY5FaIqId45H6KHo2fh9gxSEmr1Byz9
	 sGZd7nGrfZYKmt81BTe9QERcbQmkH/TJ6XI34/347HOhyPu9nWX7pcvFFd+CwQuqUL
	 6PZlcWRna20YQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-riscv@lists.infradead.org
Subject: [PATCH] entry: Guard syscall_enter_audit() invocation with
 CONFIG_AUDITSYSCALL
In-Reply-To: <875x0k7i9k.ffs@fw13>
References: <202609031938.ZvZZaRQy-lkp@intel.com> <87wlt29k5v.ffs@fw13>
 <aprKt3OlFvdQN5w+@rli9-mobl> <875x0k7i9k.ffs@fw13>
Date: Sat, 05 Sep 2026 10:43:57 +0200
Message-ID: <87tso45bqq.ffs@fw13>
MIME-Version: 1.0
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

A bunch of older cross compilers notably RISCV64 and S390 fail to eliminate
the dead code when CONFIG_AUDITSYSCALL=n. The code in question is:

     if (unlikely(audit_context())
     	syscall_enter_audit(regs);

and in case of CONFIG_AUDITSYSCALL=n:

  static inline struct audit_context *audit_context(void)
  {
        return NULL;
  }

which should make the compiler eliminate the syscall_enter_audit()
call. But a RISV64 GCC12 cross compiler translates that into:

        if (unlikely(audit_context()))
    1c34:       00000097                auipc   ra,0x0
    1c38:       000080e7                jalr    ra # 1c34 <.L785>
    1c3c:       c511                    beqz    a0,1c48 <.L787>
                syscall_enter_audit(regs);
    1c3e:       8526                    mv      a0,s1
    1c40:       00000097                auipc   ra,0x0
    1c44:       000080e7                jalr    ra # 1c40 <.L785+0xc>

and then claims in the failing link:

   include/asm-generic/preempt.h:54:(.noinstr.text+0x1a20):
	undefined reference to 'syscall_enter_audit'

which is obviously hallucination.

Add an explicit IS_ENABLED(CONFIG_AUDITSYSCALL) check into the condition to
cure this compiler madness.

Fixes: 6f25517010dd ("entry: Rework syscall_audit_enter()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/oe-kbuild-all/202609031938.ZvZZaRQy-lkp@intel.com/
---
 include/linux/entry-common.h |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -102,7 +102,14 @@ static __always_inline long syscall_trac
 	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
 		trace_syscall_enter(regs);
 
-	if (unlikely(audit_context()))
+	/*
+	 * The config check works around broken compilers which fail to
+	 * eliminate the dead code in case of CONFIG_AUDITSYSCALL=n as they
+	 * insist on creating a always false runtime condition based on
+	 * audit_context() which returns NULL in that case. The explicit
+	 * IS_ENABLED() check makes that madness go away.
+	 */
+	if (IS_ENABLED(CONFIG_AUDITSYSCALL) && unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
 	return true;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
