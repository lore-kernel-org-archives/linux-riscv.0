Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E8FCEFC39
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ4TqXkGk6zfe3/4inSYSavrSC4axL04B2YIwdz/49Y=; b=m/1NNcAQIZm6wu
	wK+AgjuoAyZZ3vlGxYx7drqL2+bzGNeXE2u3ne56SfuMRLi6hZDrDE1skBwRe+5BQX8hUtIpx45Rf
	sM6FIS0lIxXvzwykkl+p0M+evf31usjzyTWFuunlaiHdcrtbx9ob7pfDa3t5s3EhYWJ1125/6dm1g
	DS9pEzsNUwT6qJE2MCUcFEAeVSSkvkyFQ2ums9jpUXc3rvYAzDrn9ELP8mW1Rl8mddd7dHiRpm7de
	Lxnm33U5wXa7trTQdroe0C5BLTRwYMG066lewl+AgJTN7ngnhnZm0AxJes8zWzHDEe4uD+mP/l6j7
	aQ5RChVGqgPPfRbx27qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syE8S-00000006fFj-3eQ0;
	Tue, 08 Oct 2024 17:36:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syE5Q-00000006ebm-0zLj;
	Tue, 08 Oct 2024 17:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6196F5C57C4;
	Tue,  8 Oct 2024 17:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95454C4CEC7;
	Tue,  8 Oct 2024 17:33:22 +0000 (UTC)
Date: Tue, 8 Oct 2024 13:33:25 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241008133325.47b7b457@gandalf.local.home>
In-Reply-To: <20241008145852.27223-E-hca@linux.ibm.com>
References: <20241007204743.41314f1d@gandalf.local.home>
	<20241007205458.2bbdf736@gandalf.local.home>
	<20241008145852.27223-E-hca@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_103328_354649_C8B73758 
X-CRM114-Status: GOOD (  13.23  )
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

On Tue, 8 Oct 2024 16:58:52 +0200
Heiko Carstens <hca@linux.ibm.com> wrote:

> On Mon, Oct 07, 2024 at 08:54:58PM -0400, Steven Rostedt wrote:
> > On Mon, 7 Oct 2024 20:47:43 -0400
> > Steven Rostedt <rostedt@goodmis.org> wrote:
> > #define arch_ftrace_get_regs(fregs)	({ &arch_ftrace_regs(fregs)->regs; })
> > 
> > I may send a v2 (tomorrow).  
> 
> Could you also write against which tree this patch is?
> It doesn't apply on top of Linus' master branch.

Ah, sorry, I should have specified. It applies to my ftrace/for-next branch
(which is also part of linux-next). I just checked out linux-next, and it
still applies but with some shifts, so updates from other trees do affect
it slightly.

If you want it to apply cleanly, use this tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/  ftrace/for-next

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
