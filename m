Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172DBC44501
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=EuAXtbELoUnt+hf5Da/93+xDanWBuuOr2/QwgTsrL2c=; b=Zy8V2anYDBzxqD
	ygu/ux4WsT3FFA+ZiJpJniGb+XaOlpxsdMe21K+O9s7CSeF646YtNjJclYj5/B1GoyZNWL4r0Igf9
	Uc1rh2aLDqoeoc3ZmPXKmyTzRBh6qQJj3lXG8aUU0gRBaT7JgGTVZgHHa6jKZyS4EY7NDnrf7hrdD
	57Y5xBlxh2IqFJhEHlmLT9khmnKjA83TXRAbqRsil+XAATCF3d7WhUvAYX69qcue00zLnxtRIk1aY
	txh8b8cq6Wrm3mFQgZzR0tIIkDoSl2G/U1wvVPXeCA5PgNTDoM7KrH3hURYbB/OI50saHnBO+IWbn
	AbgJZQSS2GWU/XKjld+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1g5-00000007mI6-10Oq;
	Sun, 12 Jul 2026 21:25:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1g3-00000007mHg-1h5B
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 21:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D47F560103;
	Sun, 12 Jul 2026 21:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9691F000E9;
	Sun, 12 Jul 2026 21:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783891530;
	bh=3dgiu8TI4TCoeEn0bEpVdfOeeBtaQ/CqpKNHZxWnkT0=;
	h=Date:From:To:Cc:Subject:References;
	b=RLFHFdpFXUTSZm/YBrtnuBzx0Yh8fHlGCVPyr2M8hm65643btsbKADLAv6wpykm33
	 Eg0cUgOEJOfikXRmAG51l2v8MPBdeAm4aMIOyJ/i6di5f7CALzJWxWHCoNxcD6S0ah
	 FX4lwJrcKFzpB2M5EgU1/ICA5lBHJxPds5h1Jxb+KnbSYzz3UD+j9I76Mfca2WnMrL
	 l+97Kjp5ak82rCbAcIT3mOGGkVYr59ROgtUEPIgjxvkwzQUd/3aKLG8Jh+dmHXGXKQ
	 EXN1m1qE2cZM4dUpd34jLSEE6VEv5KNYMkU6dEdFEGOJLIsBjxZdcBSNxnjfoamDuS
	 GhGN8JsoJebPw==
Date: Sun, 12 Jul 2026 23:25:27 +0200
Message-ID: <20260712141346.699072205@kernel.org>
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
Subject: [patch 3/4] entry: Make return type of syscall_trace_enter() bool
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

From: Thomas Gleixner <tglx@kernel.org>

This prepares for changing the return types of
syscall_enter_from_user_mode[_work]() to bool, which in turn separates the
decision of invoking the syscall from the syscall number, which might have
been changed in the call by ptrace, seccomp, tracing.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/linux/entry-common.h |   18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -72,7 +72,7 @@ static __always_inline long syscall_trac
 	 */
 	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
 		if (syscall_user_dispatch(regs))
-			return -1L;
+			return false;
 	}
 
 	/*
@@ -87,13 +87,13 @@ static __always_inline long syscall_trac
 	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
 		if (!arch_ptrace_report_syscall_permit_entry(regs) ||
 		    (work & SYSCALL_WORK_SYSCALL_EMU))
-			return -1L;
+			return false;
 	}
 
 	/* Do seccomp after ptrace, to catch any tracer changes. */
 	if (work & SYSCALL_WORK_SECCOMP) {
 		if (!__seccomp_permit_syscall())
-			return -1L;
+			return false;
 	}
 
 	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
@@ -102,8 +102,7 @@ static __always_inline long syscall_trac
 	if (unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
-	/* Either of the above might have changed the syscall number */
-	return syscall_get_nr(current, regs);
+	return true;
 }
 
 /**
@@ -133,8 +132,13 @@ static __always_inline long syscall_ente
 {
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 
-	if (work & SYSCALL_WORK_ENTER)
-		syscall = syscall_trace_enter(regs, work, syscall);
+	if (work & SYSCALL_WORK_ENTER) {
+		if (!syscall_trace_enter(regs, work, syscall))
+			return -1L;
+
+		/* Reread the syscall number as it might have been modified */
+		syscall = syscall_get_nr(current, regs);
+	}
 
 	return syscall;
 }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
