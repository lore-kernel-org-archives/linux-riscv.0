Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C405C61D97
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jan 2023 05:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=un3aTlRqfcj9zsCZQHBo8odOuHQQJrB7Wt0S5pEjttw=; b=TFpFy1CVnIEUhR
	0RJmotiyrl246Evdzf7ZhRdbQ9VjLhKraQmg5UNqPvp+jgOYM34A9+sQtQYdmxFnZESgJ48hxo2zW
	81v9GQSgq92jT9Ld8iYqw+qxg6gQkOELgOWGkZ+JBfO+mGxjOUc3Pl4JeaZbISYS+sIaOCC450/MM
	YKsjPXLdWRsxVtIYXZe+Vm1vsRzsEWGXL4jYiYX8gPwOHq8b3g0mXSxxJL8EFMeS5WIXHxDtUPduL
	MYqeoY6vF60DDjaR1KJ3ig5MObiGYwZv62ykYazDLKDN76DPxqp7cAybJHrCEtrmoEu/mH++I4hdm
	3H69ZSYFZH3jqXLh6+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM0Mp-0014gL-FH; Sun, 29 Jan 2023 05:36:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pM0Mh-0014fv-VW
	for linux-riscv@lists.infradead.org; Sun, 29 Jan 2023 05:36:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 407FBB80C2E
	for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 05:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764C3C433AC
	for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 05:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674970587;
	bh=1k2qDlcK6BCTK6Je2WmnvYm8YTayJKyRpCuL6fDRpBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e2xfuLKiJubRDuv8PmqPNURoUQPW5YqakpIbWHG+SrHCEYLQwiIwa0zIelA9f9Ot8
	 em6NiF6aFqeUAmceQ3Q5g5VCqGR6Nr5xnILJbFZBFuiMiz+xNPEWDOiBEyzT5vCf6Y
	 DdXNoD+D7ZJ/bJzsIeYwohwcOH5NZNCle4eYWsWSTnJjWeLRze+sFSRHBiiQ42/fMf
	 ASMgnXdq7BNK+idG3R7ghAEJ2uulQHmZxmBlcfo+X4YpsobbQLmjupWCSsQANvzyMS
	 aPV66zlv7eKjLNB3NXML5lrd9RPfg8BT+GhC4AjLIVjXVJBphgiqcXCVodjotz3sBF
	 8ZoN0rl5eMZng==
Received: by mail-ed1-f42.google.com with SMTP id g11so8090460eda.12
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 21:36:27 -0800 (PST)
X-Gm-Message-State: AFqh2kqfk6uTL09fGiZ/PoOVWxY2EK+qlt/zTrsJCl4gwIycZfjv67gB
	EX0UbdhY4iavgRBzTAIImNHD8qxOBMiVPwYzGSs=
X-Google-Smtp-Source: AMrXdXvWaW6GPvsXxgfilQRz68gJh7S1klwYt5YMDMwBMZ5zunD/NbFDRZOl/BIvUqrcPcxcw8nFC/385uf+bMg1xAA=
X-Received: by 2002:aa7:dbd9:0:b0:49c:ea59:46b with SMTP id
 v25-20020aa7dbd9000000b0049cea59046bmr8180006edt.54.1674970585503; Sat, 28
 Jan 2023 21:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20230107133549.4192639-1-guoren@kernel.org> <20230107133549.4192639-2-guoren@kernel.org>
 <Y7xMvAJXjHaus0Bm@FVFF77S0Q05N> <CAJF2gTRzS0hBdqBUNbijvKKx3Kf_mY55XSkUyPJsfOK8p15_Mw@mail.gmail.com>
 <Y7/3hoFjS49yy52W@FVFF77S0Q05N> <CAJF2gTQXRt-mmuA=kKKdQojgLG-eQm6PqTuwf0ccw4cdYdbYfQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQXRt-mmuA=kKKdQojgLG-eQm6PqTuwf0ccw4cdYdbYfQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 29 Jan 2023 13:36:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQBhVc1gU3PmN7Rt6qcNoDBi58fEGm9LuiHea4vSN3oXw@mail.gmail.com>
Message-ID: <CAJF2gTQBhVc1gU3PmN7Rt6qcNoDBi58fEGm9LuiHea4vSN3oXw@mail.gmail.com>
Subject: Re: [PATCH -next V6 1/7] riscv: ftrace: Fixup panic by disabling preemption
To: Mark Rutland <mark.rutland@arm.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	suagrfillet@gmail.com, andy.chiu@sifive.com, e.shatokhin@yadro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_213632_346312_8967B635 
X-CRM114-Status: GOOD (  48.74  )
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

On Sat, Jan 28, 2023 at 6:00 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Thu, Jan 12, 2023 at 8:05 PM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Wed, Jan 11, 2023 at 09:22:09PM +0800, Guo Ren wrote:
> > > On Tue, Jan 10, 2023 at 1:20 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > > >
> > > > On Sat, Jan 07, 2023 at 08:35:43AM -0500, guoren@kernel.org wrote:
> > > > > From: Andy Chiu <andy.chiu@sifive.com>
> > > > >
> > > > > In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> > > > > forming a jump that jumps to an address over 4K. This may cause errors
> > > > > if we want to enable kernel preemption and remove dependency from
> > > > > patching code with stop_machine(). For example, if a task was switched
> > > > > out on auipc. And, if we changed the ftrace function before it was
> > > > > switched back, then it would jump to an address that has updated 11:0
> > > > > bits mixing with previous XLEN:12 part.
> > > > >
> > > > > p: patched area performed by dynamic ftrace
> > > > > ftrace_prologue:
> > > > > p|      REG_S   ra, -SZREG(sp)
> > > > > p|      auipc   ra, 0x? ------------> preempted
> > > > >                                       ...
> > > > >                               change ftrace function
> > > > >                                       ...
> > > > > p|      jalr    -?(ra) <------------- switched back
> > > > > p|      REG_L   ra, -SZREG(sp)
> > > > > func:
> > > > >       xxx
> > > > >       ret
> > > >
> > > > What happens on SMP but not !PREEMPTION; can't a CPU be in the middle of this
> > > > while you're patching the sequence?
> > > Yes, when PREEMPTION, a timer interrupt between auipc & jalr may cause
> > > context_switch. And riscv uses stop_machine for patch_text. Then, we
> > > may modify auipc part, but only execute the jalr part when return.
> >
> > Please re-read my question; "!PREEMPTION" means "NOT PREEMPTION".
> >
> > Ignore preeemption entirely and assume two CPUs X and Y are running code
> > concurrently. Assume CPU X is in the ftrace prologue, and CPU Y is patching
> > that prologue while CPU X is executing it.
> >
> > Is that prevented somehow? If not, what happens in that case?
> >
> > At the very least you can have exactly the same case as on a preemptible kernel
> > (and in a VM, the hypervisor can preempt the guest ata arbitrary times),
> > becuase CPU X could end up executing a mixture of the old and new instructions.
> >
> > More generally, if you don't have strong rules about concurrent modification
> > and execution of instructions, it may not be safe to modify and instruction as
> > it is being executed (e.g. if the CPU's instruction fetches aren't atomic).
> >
> > > > Do you have any guarantee as to the atomicity and ordering of instruction
> > > > fetches?
> > > Not yet. If the region is short, we could use nop + jalr pair instead.
> >
> > Ok, so as above I do not understand how this is safe. Maybe I am missing
> > something, but if you don't have a guarantee as to ordering I don't see how you
> > can safely patch this even if you have atomicity of each instruction update.
> >
> > Note that if you don't have atomicity of instruction fetches you *cannot*
> > safely concurrently modify and execute instructions.
> >
> > > Only one jalr instruction makes the entry atomicity.
> >
> > I'll have to take your word for that.
> >
> > As above, I don't think this sequence is safe regardless.
> >
> > > There are already several proposed solutions:
> > > 1. Make stop_machine guarantee all CPU out of preemption point.
> > > 2. Expand -fpatchable-function-entry from 4 to 24, and make detour
> > > codes atomicity.
> > > 3. We want to propose a solution to make auipc by hardware mask_irq.
> > > For more details, see:
> > > https://www.youtube.com/watch?v=4JkkkXuEvCw
> >
> > Ignoring things which require HW changes, you could consider doing something
> > like what I'm doing for arm64 with DYNAMIC_FTRACE_WITH_CALL_OPS:
> >
> >   https://lore.kernel.org/lkml/20230109135828.879136-1-mark.rutland@arm.com/
> The idea of DYNAMIC_FTRACE_WITH_CALL_OPS (Using data load/store +
> indirect jump instead of auipc+jalr) is similar to Andy's solution
> (See youtube link, last page of ppt). But the key problem is you also
> expand the size of the prologue of the function. 64BIT is already
> expensive, and we can't afford more of it. I would change to seek a
> new atomic auipc+jalr ISA extension to solve this problem.
The atomicity here means:
 - auipc + jalr won't be interrupted
 - auipc + jalr should be aligned by 64bit, then one sd instruction
could update them in atomic.


>
> DYNAMIC_FTRACE_WITH_CALL_OPS  would speed up ftrace_(regs)_caller
> (Mostly for kernel debug), but it won't help
> DYNAMIC_FTRACE_WITH_DIRECT_CALLS. So I do not so care about the
> ftrace_(regs)_caller performance gain.
>
> >
> > ... which would replace the address generation with a load, which can be
> > atomic, and would give you a number of other benefits (e.g. avoiding branch
> > range limitations, performance benefits as in the cover letter).
> >
> > Thanks,
> > Mark.
>
>
>
> --
> Best Regards
>  Guo Ren



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
