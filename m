Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24229CF042A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zR3+SE/YukBYHJoedxMLqnjzSQ5Mb1LY5Rwx1PzlzHs=; b=Fmb+plUX4wmBGm
	iD5tjOxbwK2APHg0647JiWqQzwXUPaVblI1mgOPoPkx/4saksrtiWZDxKmeUuNEA9HG31oXSVgYMt
	V2ZRRvZBMEPROmnLqzpYAFkD4Avd7sL8EsAExFTkb/5B9EmFgOOpZxkp4syDh9OE3AwzHmFx3Bg1v
	j5uJ4HRPm8f6rWzC9Uy5N/8NYXzlNPRYURNzt33ulaLoWkxsYS5FPPC1y3wxkCR1GmajKUl9xxEsN
	MCrBwCgqmKOdvd7p0v6nDyGg4INFzoSFEMiPMXMBcUR4q4d858BHAB+xymQrXeCYUUuLLfRLrXfQO
	AnxGKpq1mWd9SRC0tgsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJBg-00000007NQr-2leL;
	Tue, 08 Oct 2024 23:00:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syJAK-00000007NHs-3ca0;
	Tue, 08 Oct 2024 22:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E74BA4299F;
	Tue,  8 Oct 2024 22:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB329C4CEC7;
	Tue,  8 Oct 2024 22:58:47 +0000 (UTC)
Date: Tue, 8 Oct 2024 18:58:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241008185851.274887ca@gandalf.local.home>
In-Reply-To: <20241009074140.b163eceb2f973227b400c962@kernel.org>
References: <20241007204743.41314f1d@gandalf.local.home>
	<20241009074140.b163eceb2f973227b400c962@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_155853_001735_83DEB1EC 
X-CRM114-Status: GOOD (  16.88  )
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

On Wed, 9 Oct 2024 07:41:40 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> Hi Steve, 
> 
> > diff --git a/include/asm-generic/ftrace.h b/include/asm-generic/ftrace.h
> > index 3a23028d69d2..ba7b7d6e55d6 100644
> > --- a/include/asm-generic/ftrace.h
> > +++ b/include/asm-generic/ftrace.h
> > @@ -10,4 +10,17 @@
> >   * common definitions are already in linux/ftrace.h.
> >   */
> >  
> > +#ifndef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
> > +struct __arch_ftrace_regs {
> > +	struct pt_regs		regs;
> > +};
> > +
> > +#define arch_ftrace_get_regs(fregs)					\
> > +	({ struct __arch_fregs_regs *__f = (struct __arch_ftrace_regs *)(fregs); \
> > +		&__f->regs;						\
> > +	})
> > +
> > +struct ftrace_regs;
> > +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> > +
> >  #endif /* __ASM_GENERIC_FTRACE_H__ */  
> 
> There seems no #endif for CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS.
> I wonder how it passed the build. (#ifdef block does not affect over
> the file boundary?
> 

Yeah I caught that. That's one way I found out that this file is not
compiled by most architectures. I'll be sending a v2 very shortly.

-- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
