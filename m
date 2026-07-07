Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89022C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=XT/0yajMTKLGjriZhTUWkr3shKhUhIXfq1sJeWU7Zec=; b=VqP6aTo22AHE7H
	WcSEGFBzNUoK+te+j/gkMBeCoiJ07eW25JgPL9pp6fJQM6jFyLcco3j7i/YPeO7GEoFwJkOZ83EK+
	tFXCDbzf9rihyKC7+qoOciXm+yxcswF4rkB4IzZizySLfwYiAuNx8KZPD/nbOOA5fdfRYLqYzyGlo
	eN7354ucq5204cWNohzb0N8SAT64ebviN0ZMiy3I0YAqpJ5oTnnKvMvl/kU88oMBGKgq0Co4sr7Wi
	RvPrcqEJhlFtC81sSuuoIqg/gabCAofdv0FFqDlOJHv77RZ/fk5IZuoukJNXMlu10oc6k+S1llVrx
	M78xPM/EaBGBwYDXq7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB8V-0000000FhoY-0kh2;
	Tue, 07 Jul 2026 19:07:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB7v-0000000FhDX-0Szs;
	Tue, 07 Jul 2026 19:06:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D33BD43592;
	Tue,  7 Jul 2026 19:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87121F00A3A;
	Tue,  7 Jul 2026 19:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451198;
	bh=bOhoOM4hOcQqUzsvXhQz1H8YtW+B68Wkj0kvWsv9ysw=;
	h=Date:From:To:Cc:Subject:References;
	b=h91mvxoSmiGeQM8FkyaGYFZNxd9/IUcToDeSMIPvZRCL7a8UMwB0b0QBesp5xIbLU
	 i7PsT94Sw2onA3+UmpAOBRZfRcPLnTsutjo1QPB6poAvdbvPFcNvVkGP1hB6jDLYDb
	 RKWnZ0yte8HArLwcv9oJe3tjBUUeDOAyh5mMWkxYWu67e92T5hj3A/OUFslD9ZYdOb
	 CoRjmiJVDNi/JotogxyAKQWnRnlRYa4L0e21jTcDihICBULLgdAZvlp5GRhmagJ2DT
	 +Aa9ucQxYNr6w3TZVbEH8jmFMex+6xgUViSmWosj6uNAuMiuHhylsKUcB2NMwZIOYT
	 B1ISbmvWG+Pgw==
Date: Tue, 07 Jul 2026 21:06:36 +0200
Message-ID: <20260707190254.181086755@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Kees Cook <kees@kernel.org>,
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
 Andy Lutomirski <luto@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>,
 Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org,
 linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>,
 Will Deacon <will@kernel.org>,
 Brian Cain <bcain@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: [patch 10/18] entry: Use syscall number instead of rereading it
References: <20260707181957.433213175@kernel.org>
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

rseq_syscall_enter_work() is invoked before the syscall number can be
modified. So there is no point in rereading it from pt_regs.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/linux/entry-common.h |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -70,9 +70,10 @@ static inline void syscall_enter_audit(s
 	}
 }
 
-static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
+static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
+						long syscall)
 {
-	long syscall, ret = 0;
+	long ret = 0;
 
 	/*
 	 * Handle Syscall User Dispatch.  This must comes first, since
@@ -90,7 +91,7 @@ static __always_inline long syscall_trac
 	 * through hrtimer_interrupt().
 	 */
 	if (work & SYSCALL_WORK_SYSCALL_RSEQ_SLICE)
-		rseq_syscall_enter_work(syscall_get_nr(current, regs));
+		rseq_syscall_enter_work(syscall);
 
 	/* Handle ptrace */
 	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
@@ -145,7 +146,7 @@ static __always_inline long syscall_ente
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 
 	if (work & SYSCALL_WORK_ENTER)
-		syscall = syscall_trace_enter(regs, work);
+		syscall = syscall_trace_enter(regs, work, syscall);
 
 	return syscall;
 }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
