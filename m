Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C82CEDD91
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boAZVw18gwcdx6guuEdNri5kg6f8FIZFKv9bFmimoJQ=; b=d326ZAV7jpC3Wa
	fZKGqQJoArkD1DyKWPqJUa1pd37dHoIbimHuFcPchw0z1g83cFbMlG0x9UOt5L1PEGaprAGO8EzLT
	1MxMylU/JL5uo/HZLU6qOvuBXxuXeKevm03eUsOgV/8czjZQvsJW4qr3H5aighX9vqTBnKI9rtEfN
	3DiiQTYZOGsVjXRqvcce6cmBBmk7sG4YGQXVpj+SHM5VnZpRUek0eKuBmx6BK7u5vjatXc0MPzSFm
	3+JREJKUnmaHf1P3g4hT/0vyMSjmYcfGNJgBWw4n9Jm/1AJclSTQz0gAo4vkFalnP0Zf5GtiMVM9K
	PCY2P821EDTwALxNXNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWze-00000009SbC-2w3C;
	Wed, 09 Oct 2024 13:44:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWyH-00000009S7Q-3Glp;
	Wed, 09 Oct 2024 13:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84E145C5AA9;
	Wed,  9 Oct 2024 13:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62A7C4CECD;
	Wed,  9 Oct 2024 13:43:16 +0000 (UTC)
Date: Wed, 9 Oct 2024 09:43:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen
 N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
  Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas 
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav 
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 2/2] ftrace: Consolidate ftrace_regs accessor
 functions for archs using pt_regs
Message-ID: <20241009094321.3f41f8a4@gandalf.local.home>
In-Reply-To: <20241009134723.6b9eabfdc3cfee10f3757d85@kernel.org>
References: <20241008230527.674939311@goodmis.org>
	<20241008230629.118325673@goodmis.org>
	<20241009134723.6b9eabfdc3cfee10f3757d85@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_064321_937290_DBC669AE 
X-CRM114-Status: GOOD (  18.06  )
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

On Wed, 9 Oct 2024 13:47:23 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > --- /dev/null
> > +++ b/include/linux/ftrace_regs.h
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _LINUX_FTRACE_TYPES_H
> > +#define _LINUX_FTRACE_TYPES_H  
>                ^^^^^^^^^^^^^^^^  Is this _LINUX_FTRACE_REGS_H?

Ah, I originally called it ftrace_types.h, but later decided that name
didn't really fit. I changed all references to it but this one.

Thanks for catching this.

> 
> 
> > +
> > +/*
> > + * For archs that just copy pt_regs in ftrace regs, it can use this default.
> > + * If an architecture does not use pt_regs, it must define all the below
> > + * accessor functions.
> > + */
> > +#ifndef HAVE_ARCH_FTRACE_REGS
> > +struct __arch_ftrace_regs {
> > +	struct pt_regs		regs;
> > +};
> > +
> > +#define arch_ftrace_regs(fregs) ((struct __arch_ftrace_regs *)(fregs))
> > +
> > +struct ftrace_regs;
> > +
> > +#define ftrace_regs_get_instruction_pointer(fregs) \
> > +	instruction_pointer(arch_ftrace_get_regs(fregs))
> > +#define ftrace_regs_get_argument(fregs, n) \
> > +	regs_get_kernel_argument(arch_ftrace_get_regs(fregs), n)
> > +#define ftrace_regs_get_stack_pointer(fregs) \
> > +	kernel_stack_pointer(arch_ftrace_get_regs(fregs))
> > +#define ftrace_regs_return_value(fregs) \
> > +	regs_return_value(arch_ftrace_get_regs(fregs))
> > +#define ftrace_regs_set_return_value(fregs, ret) \
> > +	regs_set_return_value(arch_ftrace_get_regs(fregs), ret)
> > +#define ftrace_override_function_with_return(fregs) \
> > +	override_function_with_return(arch_ftrace_get_regs(fregs))
> > +#define ftrace_regs_query_register_offset(name) \
> > +	regs_query_register_offset(name)
> > +
> > +#endif /* HAVE_ARCH_FTRACE_REGS */
> > +
> > +#endif /* _LINUX_FTRACE_TYPES_H */  
> 
> Ditto.
> 
> Others looks good to me.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

I'll send a v2 with this update.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
