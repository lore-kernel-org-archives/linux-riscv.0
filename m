Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBD0CF042B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7oQ0Zc1JfSLzbFrtJBklidQkeDW5+D+abRGA1ujcALI=; b=RoR59jt4EL+9Dt
	BwGMgYdm07W1hlxLNfPXmbV6cf1WsdDhUjFnSPmyfc+hJKBRBRoR00mL2ncSiyQi4X2oXA8ehwTNy
	X5qQhMrjV+nNSFEbDrmSYAplHIWeLZz+Zcd1hc27Pgp5gTu6qValzPDutah8i220Eb0bZreKuz0hc
	3DqejgrIfn2uETRxwqZOQoTg3AawKW2LqVAXfAIlRUhVZZbSLAWc1vJrNjbIUcBMQX8e5/0XdRnQA
	Bd36y27+mmG79ldTs3c5cnLpYnh00Us7u7JIU/uh4MIy5Dw+1j24wj0iaPl9tsM3OreJKMJl3eNCy
	0fxVKF4HLOUwujcu2m3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJIz-00000007OJE-0yV6;
	Tue, 08 Oct 2024 23:07:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syJHe-00000007O7l-16tc;
	Tue, 08 Oct 2024 23:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9FFA5C5480;
	Tue,  8 Oct 2024 23:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8738C4CEC7;
	Tue,  8 Oct 2024 23:06:24 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1syJHg-00000001164-3tWc;
	Tue, 08 Oct 2024 19:06:28 -0400
Message-ID: <20241008230527.674939311@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 08 Oct 2024 19:05:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Paul  Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas  Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>,
 Borislav  Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v2 0/2] ftrace: Make ftrace_regs abstract and consolidate code
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_160626_418578_31CA9246 
X-CRM114-Status: GOOD (  14.99  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


This is based on:

  https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/
     ftrace/for-next

ftrace_regs was created to hold registers that store information to save
function parameters, return value and stack. Since it is a subset of
pt_regs, it should only be used by its accessor functions. But because
pt_regs can easily be taken from ftrace_regs (on most archs), it is
tempting to use it directly. But when running on other architectures, it
may fail to build or worse, build but crash the kernel!

Instead, make struct ftrace_regs an empty structure and have the
architectures define __arch_ftrace_regs and all the accessor functions
will typecast to it to get to the actual fields. This will help avoid
usage of ftrace_regs directly.

I again compiled all the affected architectures (except for 32bit ppc).
I got s390 built when disabling bcachefs.

Changes since v1: https://lore.kernel.org/all/20241007204743.41314f1d@gandalf.local.home/

- Moved the non ftrace args code from asm-generic/ftrace.h to linux/ftrace.h
  those archs have their own asm/ftrace.h and are not using asm-generic.
  The default has to be in linux/ftrace.h

- simplified arch_ftrace_get_regs() and made it a static inline function

- Added a second patch that consolidates a lot of the duplicate code
  when an architecture has pt_regs embedded in the ftrace_regs.

Steven Rostedt (2):
      ftrace: Make ftrace_regs abstract from direct use
      ftrace: Consolidate ftrace_regs accessor functions for archs using pt_regs

----
 arch/arm64/include/asm/ftrace.h          | 21 +++++++++--------
 arch/arm64/kernel/asm-offsets.c          | 22 +++++++++---------
 arch/arm64/kernel/ftrace.c               | 10 ++++----
 arch/loongarch/include/asm/ftrace.h      | 29 ++++--------------------
 arch/loongarch/kernel/ftrace_dyn.c       |  2 +-
 arch/powerpc/include/asm/ftrace.h        | 27 +++-------------------
 arch/powerpc/kernel/trace/ftrace.c       |  4 ++--
 arch/powerpc/kernel/trace/ftrace_64_pg.c |  2 +-
 arch/riscv/include/asm/ftrace.h          | 22 ++++++++++--------
 arch/riscv/kernel/asm-offsets.c          | 28 +++++++++++------------
 arch/riscv/kernel/ftrace.c               |  2 +-
 arch/s390/include/asm/ftrace.h           | 29 ++++--------------------
 arch/s390/kernel/asm-offsets.c           |  4 ++--
 arch/s390/kernel/ftrace.c                |  2 +-
 arch/s390/lib/test_unwind.c              |  4 ++--
 arch/x86/include/asm/ftrace.h            | 30 ++++++------------------
 arch/x86/kernel/ftrace.c                 |  2 +-
 include/linux/ftrace.h                   | 39 +++++++++++++++-----------------
 include/linux/ftrace_regs.h              | 36 +++++++++++++++++++++++++++++
 kernel/trace/ftrace.c                    |  2 +-
 20 files changed, 139 insertions(+), 178 deletions(-)
 create mode 100644 include/linux/ftrace_regs.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
