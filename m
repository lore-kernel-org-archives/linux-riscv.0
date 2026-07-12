Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760E8C44508
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=8Qoi/HE0DYI9T3gd8Y4O5KeqqbTOKIgII1Dt1dLkmy4=; b=LQJlxNemXjI8Au
	hVd2vkEHcUeZUcCIqjKCgFeLQ2u/FUJm4dyInx7JDwrdXuXw7bXgz51K/1hCdsq/aYTdRyKyUDKWO
	d7TelbPI0sOqqoHLgEDJcttd4HahW0/a4rNj+KZz9Qgalqt1qD/kimp9L5NfCptXkoLdc2gI/w1yr
	XP7b0YxEja5KI1PBHXaZhUIe+jtXr7AySJppABv2EhZxB6WH3b0/HlXGj7zFGTVuf/NY9wwb7Mp9t
	7/ixg40Kt9pCkQ+WWEUWJxoxWtug2E58I/WY6Lsq2HJqBUzgNUnKHnsrNGczUceYaRJRf/dkbdtCx
	wh4BJ1z5ZKNdPCLlHwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1fv-00000007mGH-0BmM;
	Sun, 12 Jul 2026 21:25:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1ft-00000007mFt-2UWP
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 21:25:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E77F600AE;
	Sun, 12 Jul 2026 21:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F6D1F000E9;
	Sun, 12 Jul 2026 21:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783891520;
	bh=rQWZ8aJgOncbggueFnURmOMnwueR0POClkrjreehrRg=;
	h=Date:From:To:Cc:Subject:References;
	b=MeR46zuk5udFu+6sitLOWkIvT2D1oWkOX3LZL64wi0Wue7pZZoj92eYrZyCHwL6re
	 LtNulxNY9Xfv0bKY212BxpjPh6OQuqFHmkUTpzE0rrlt4QxqdZebZE1KDm4nZUEhMp
	 ZsMDsH3MWEuTn7puKH/TLmpD43nwClU5g498mnR/jpAbyFSVn7gqOikHCa1XfLi/OZ
	 AxtODzhSPI53UIID1Fh9XQID2bGnMTk5jyR9XlEl7In4QJRq8W/lVDvsymIMGYh57F
	 hQWVHq+yBg4dJ6sMKRBey0cUbgn5O4cPuwCH4e7tb62pq2ioZJr+suHGx6CzXWo5pw
	 5bSB+97HCh1VA==
Date: Sun, 12 Jul 2026 23:25:17 +0200
Message-ID: <20260712141346.576865340@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 x86@kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Magnus Lindholm <linmag7@gmail.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Radu Rendec <radu@rendec.net>
Subject: [patch 1/4] entry: Rework syscall_audit_enter()
References: <20260712134433.549076055@kernel.org>
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

Move it out of line and let it reread the syscall number on it's own. That
makes the low level entry code denser and allows to move the reread to the
call site of syscall_trace_enter() once the tracer is fixed up.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/linux/entry-common.h  |   14 +++-----------
 kernel/entry/syscall-common.c |   10 ++++++++++
 2 files changed, 13 insertions(+), 11 deletions(-)

--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -60,16 +60,7 @@ static __always_inline bool arch_ptrace_
 
 long trace_syscall_enter(struct pt_regs *regs, long syscall);
 void trace_syscall_exit(struct pt_regs *regs, long ret);
-
-static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
-{
-	if (unlikely(audit_context())) {
-		unsigned long args[6];
-
-		syscall_get_arguments(current, regs, args);
-		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
-	}
-}
+void syscall_enter_audit(struct pt_regs *regs);
 
 static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
 						long syscall)
@@ -111,7 +102,8 @@ static __always_inline long syscall_trac
 	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
 		syscall = trace_syscall_enter(regs, syscall);
 
-	syscall_enter_audit(regs, syscall);
+	if (unlikely(audit_context()))
+		syscall_enter_audit(regs);
 
 	return syscall;
 }
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/audit.h>
 #include <linux/entry-common.h>
 
 #define CREATE_TRACE_POINTS
@@ -21,3 +22,12 @@ void trace_syscall_exit(struct pt_regs *
 {
 	trace_sys_exit(regs, ret);
 }
+
+void syscall_enter_audit(struct pt_regs *regs)
+{
+	long syscall = syscall_get_nr(current, regs);
+	unsigned long args[6];
+
+	syscall_get_arguments(current, regs, args);
+	__audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
