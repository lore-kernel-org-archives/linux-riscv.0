Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C59C44506
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=IfCwYXtDMz860ACM94f6oojGPHxIU1b5WrqoTSwt6UU=; b=sEWE8YzgaOXlab
	1T8IhFWd2A8L05QHtcHjZhsLRk9IWSBpNttG+j/nmXqV3vqMMsVoVJql7KB+BFpJ0FXIKIM8K4lYx
	LqViuz6pnLWMXMHT9VwxqkO/fv3uz9W51eysQHLrc8gdQkHf4HKqrbg7cNbpyKU3xBlWTLpYW0bc+
	jxaBOdJJgOWp71VGhgLRF+m31SHGiSSZerUezPglRncN59AmfhRbB81f1zR17qVF0opcjpqqEqr7L
	STSlpn7+b7XJpwETajlB7NzR5WEM4doPwvnYlBIuH7SNi1OddDftr8qJ/5Mkgqx+RsXVMaPr/vejf
	j0pM8IfWeBzDzTsi3DaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1g0-00000007mHC-0YOe;
	Sun, 12 Jul 2026 21:25:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1fy-00000007mH3-22q3
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 21:25:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E837F600FC;
	Sun, 12 Jul 2026 21:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF891F000E9;
	Sun, 12 Jul 2026 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783891525;
	bh=2JItWlUO0RtFZwJ9AedXkVw8o5YILdxQ5hx8qr2Nb5s=;
	h=Date:From:To:Cc:Subject:References;
	b=mzeCuuT0JQcjq0ffdG1mMOXvwVg7uBygi4ikhxj2XYUNlmMfzmfn3U2nH5Q/s2tYT
	 hE6So6oMIRH9zZo8P+kLDM1SHxS9ep4XeX4OI3bWj66SvgdPaw44aKEwaw1MYINh0H
	 4zCSmz9lTSmItEjpfX/V5TRcJOf34STaoyRjMoXNl0u96NUZtWitt5VWhcdZN+gCWy
	 1VFaBHkKtdt0C3blUBtUpl6PbzJYJ53qjO+yF+0U6mYoA2Nbt0/kmPWWjLEgxJP/cY
	 oOTjW6RijF7rhFsJnEwV9x1TsJubt24VulGi6dqcPQSyG1yrH+hb9EUlxjDaCvPx9L
	 hy+Ix8nbOcXZQ==
Date: Sun, 12 Jul 2026 23:25:22 +0200
Message-ID: <20260712141346.639115923@kernel.org>
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
Subject: [patch 2/4] entry: Rework trace_syscall_enter()
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

Reread the syscall number from pt_regs and stop returning the eventually
modified syscall number.

That moves the reread to the end of the syscall_trace_enter() and prepares
for moving it to the call site.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/linux/entry-common.h  |   10 ++++------
 kernel/entry/syscall-common.c |    9 ++-------
 2 files changed, 6 insertions(+), 13 deletions(-)

--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -58,7 +58,7 @@ static __always_inline bool arch_ptrace_
 }
 #endif
 
-long trace_syscall_enter(struct pt_regs *regs, long syscall);
+void trace_syscall_enter(struct pt_regs *regs);
 void trace_syscall_exit(struct pt_regs *regs, long ret);
 void syscall_enter_audit(struct pt_regs *regs);
 
@@ -96,16 +96,14 @@ static __always_inline long syscall_trac
 			return -1L;
 	}
 
-	/* Either of the above might have changed the syscall number */
-	syscall = syscall_get_nr(current, regs);
-
 	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
-		syscall = trace_syscall_enter(regs, syscall);
+		trace_syscall_enter(regs);
 
 	if (unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
-	return syscall;
+	/* Either of the above might have changed the syscall number */
+	return syscall_get_nr(current, regs);
 }
 
 /**
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -8,14 +8,9 @@
 
 /* Out of line to prevent tracepoint code duplication */
 
-long trace_syscall_enter(struct pt_regs *regs, long syscall)
+void trace_syscall_enter(struct pt_regs *regs)
 {
-	trace_sys_enter(regs, syscall);
-	/*
-	 * Probes or BPF hooks in the tracepoint may have changed the
-	 * system call number. Reread it.
-	 */
-	return syscall_get_nr(current, regs);
+	trace_sys_enter(regs, syscall_get_nr(current, regs));
 }
 
 void trace_syscall_exit(struct pt_regs *regs, long ret)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
