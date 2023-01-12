Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E99AC54EBC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAk6abWe/JBRx72UMGzKCCm7QQyXzYpuKJjzZQfbAGE=; b=1t7QchlPcyqPRt
	ui7U9RePj9cjpoxNi014XVhTdCdLG234LZZ52AHUtrTp4vhbPX5Odvw4ho/kSu4P6EGWHrLxgFfxD
	5h9JiScMT7uRSVkQkZzBNVJ2A/WfLkmZV6y4gYgWWSNqJNoyLf8lGdif9wEYlGZcJPELHeSrRbBFp
	FzWMS9j3dyjDbjHOqNq9kJnIQYEfhqmHTuOZESYvmFXnzEx+Mrf5rV6Kp8Bu+oTQG/pgZ1hGJoOLp
	XGP0Tf2zEFSKuKZITuGpxhwzyDlirj+2bOIiVr5IbP1wgTqMwGbCgyp4JkrT78gYyWIASf+k337Wi
	0yb1jzfp7RKC13v07eQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwL0-00Ewmo-FF; Thu, 12 Jan 2023 12:05:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFwKu-00EwlO-7U
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 12:05:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5BEB2B;
	Thu, 12 Jan 2023 04:06:13 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.43.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E1C13F67D;
	Thu, 12 Jan 2023 04:05:29 -0800 (PST)
Date: Thu, 12 Jan 2023 12:05:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
	e.shatokhin@yadro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next V6 1/7] riscv: ftrace: Fixup panic by disabling
 preemption
Message-ID: <Y7/3hoFjS49yy52W@FVFF77S0Q05N>
References: <20230107133549.4192639-1-guoren@kernel.org>
 <20230107133549.4192639-2-guoren@kernel.org>
 <Y7xMvAJXjHaus0Bm@FVFF77S0Q05N>
 <CAJF2gTRzS0hBdqBUNbijvKKx3Kf_mY55XSkUyPJsfOK8p15_Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRzS0hBdqBUNbijvKKx3Kf_mY55XSkUyPJsfOK8p15_Mw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_040536_382096_6603662B 
X-CRM114-Status: GOOD (  28.25  )
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

On Wed, Jan 11, 2023 at 09:22:09PM +0800, Guo Ren wrote:
> On Tue, Jan 10, 2023 at 1:20 AM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Sat, Jan 07, 2023 at 08:35:43AM -0500, guoren@kernel.org wrote:
> > > From: Andy Chiu <andy.chiu@sifive.com>
> > >
> > > In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> > > forming a jump that jumps to an address over 4K. This may cause errors
> > > if we want to enable kernel preemption and remove dependency from
> > > patching code with stop_machine(). For example, if a task was switched
> > > out on auipc. And, if we changed the ftrace function before it was
> > > switched back, then it would jump to an address that has updated 11:0
> > > bits mixing with previous XLEN:12 part.
> > >
> > > p: patched area performed by dynamic ftrace
> > > ftrace_prologue:
> > > p|      REG_S   ra, -SZREG(sp)
> > > p|      auipc   ra, 0x? ------------> preempted
> > >                                       ...
> > >                               change ftrace function
> > >                                       ...
> > > p|      jalr    -?(ra) <------------- switched back
> > > p|      REG_L   ra, -SZREG(sp)
> > > func:
> > >       xxx
> > >       ret
> >
> > What happens on SMP but not !PREEMPTION; can't a CPU be in the middle of this
> > while you're patching the sequence?
> Yes, when PREEMPTION, a timer interrupt between auipc & jalr may cause
> context_switch. And riscv uses stop_machine for patch_text. Then, we
> may modify auipc part, but only execute the jalr part when return.

Please re-read my question; "!PREEMPTION" means "NOT PREEMPTION".

Ignore preeemption entirely and assume two CPUs X and Y are running code
concurrently. Assume CPU X is in the ftrace prologue, and CPU Y is patching
that prologue while CPU X is executing it.

Is that prevented somehow? If not, what happens in that case?

At the very least you can have exactly the same case as on a preemptible kernel
(and in a VM, the hypervisor can preempt the guest ata arbitrary times),
becuase CPU X could end up executing a mixture of the old and new instructions.

More generally, if you don't have strong rules about concurrent modification
and execution of instructions, it may not be safe to modify and instruction as
it is being executed (e.g. if the CPU's instruction fetches aren't atomic).

> > Do you have any guarantee as to the atomicity and ordering of instruction
> > fetches?
> Not yet. If the region is short, we could use nop + jalr pair instead.

Ok, so as above I do not understand how this is safe. Maybe I am missing
something, but if you don't have a guarantee as to ordering I don't see how you
can safely patch this even if you have atomicity of each instruction update.

Note that if you don't have atomicity of instruction fetches you *cannot*
safely concurrently modify and execute instructions.

> Only one jalr instruction makes the entry atomicity.

I'll have to take your word for that.

As above, I don't think this sequence is safe regardless.

> There are already several proposed solutions:
> 1. Make stop_machine guarantee all CPU out of preemption point.
> 2. Expand -fpatchable-function-entry from 4 to 24, and make detour
> codes atomicity.
> 3. We want to propose a solution to make auipc by hardware mask_irq.
> For more details, see:
> https://www.youtube.com/watch?v=4JkkkXuEvCw

Ignoring things which require HW changes, you could consider doing something
like what I'm doing for arm64 with DYNAMIC_FTRACE_WITH_CALL_OPS:

  https://lore.kernel.org/lkml/20230109135828.879136-1-mark.rutland@arm.com/

... which would replace the address generation with a load, which can be
atomic, and would give you a number of other benefits (e.g. avoiding branch
range limitations, performance benefits as in the cover letter).

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
