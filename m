Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA122C38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWyXifhjaUgoFxcKyd6xb/CAlHYSVmu7TW4bPByxpuc=; b=sDQhegkkoLLBEJ
	yiLRQn6X0o2pVgEkl23YJNd32inr2sD3xXDHsYdXfRU68oKMJycu0OimAkT4EAJVksPPzbQhXPFg+
	WDf24kRBDwwxRDnkAnrRSSrvqdk/ysjsPj9wDcui4SjuAPljCbKKCWhVLiIr0d1GEYrULSv2gD8B6
	oyn3hCq6cKAcu4eRuPu5bjrdyHb6e3HWdihRl2SD8cu4SwM6UI0kGj449rguOxWTWftFDCsxoyYuI
	S0sCG3CiqcWQvCn25T3Z7ptW/0E4b1DPkD+Ekk4nKQY48XQynk2lvm1UvIEwSMkv3TJc8jq9NuzBw
	ABhUS1ZoHFyXHwfzVvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLi0p-00HZY5-5o; Sat, 28 Jan 2023 10:00:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLi0l-00HZXL-O6
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 10:00:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D947160B59
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 10:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC5CC4339E
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674900034;
	bh=MCHMiUJZGjZQomOHibMkoKZhaLjTTdOYkCQLvfHRWcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JuVTlL6HnHCPw6yEfA6DqFChb/bNXPAEg7APpowUn371sxq0Xdb83wCX/fQrAlzl+
	 8MIcmouaK0zicpkTpQ1SuQdRz2121ctGuYI7k78zD2ybZybMg5eHzY9FvyXz/AgX32
	 P2X18+h29YsWER3Gcbr1UtwRsh12rHuYc2VScjRfhSBU098KpFnJAHZXw0/+K4E5WU
	 /1ToJ0WbmTXBWJ9ZHqH5aXe4PVz6RMTHVAg1CC2FDpgFK9mZyGwj1n45MDbU9ri+HD
	 nW6cRKNvIS6V9NaHdN3fhlePnasxZm5wBD4AJldp3ZGx0C9nxNfsRz+AjHfaKVFuhG
	 s6HCEJMqkEPCg==
Received: by mail-ed1-f53.google.com with SMTP id y19so6768644edc.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 02:00:34 -0800 (PST)
X-Gm-Message-State: AO0yUKWwgtLCRHPyoiUmACcBBf+E8HHVsFY+ReK4SLCqk85QL6JZWgyU
	RWEn4EmWSjCa5ZWvwAQKGzse3kmw4ZCalB1XNso=
X-Google-Smtp-Source: AK7set9itL46BY9OiwWOiG8hsLKcaJ7nYxnxrYBTMXWusBMhKt7EQA1YNKKUKNZRT828u70hkB2uyrbK8k5U0XzarX8=
X-Received: by 2002:a50:c30a:0:b0:4a0:e01c:49aa with SMTP id
 a10-20020a50c30a000000b004a0e01c49aamr2744034edb.66.1674900032474; Sat, 28
 Jan 2023 02:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20230107133549.4192639-1-guoren@kernel.org> <20230107133549.4192639-2-guoren@kernel.org>
 <Y7xMvAJXjHaus0Bm@FVFF77S0Q05N> <CAJF2gTRzS0hBdqBUNbijvKKx3Kf_mY55XSkUyPJsfOK8p15_Mw@mail.gmail.com>
 <Y7/3hoFjS49yy52W@FVFF77S0Q05N>
In-Reply-To: <Y7/3hoFjS49yy52W@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 28 Jan 2023 18:00:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQXRt-mmuA=kKKdQojgLG-eQm6PqTuwf0ccw4cdYdbYfQ@mail.gmail.com>
Message-ID: <CAJF2gTQXRt-mmuA=kKKdQojgLG-eQm6PqTuwf0ccw4cdYdbYfQ@mail.gmail.com>
Subject: Re: [PATCH -next V6 1/7] riscv: ftrace: Fixup panic by disabling preemption
To: Mark Rutland <mark.rutland@arm.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	suagrfillet@gmail.com, andy.chiu@sifive.com, e.shatokhin@yadro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_020039_904998_A8948F3E 
X-CRM114-Status: GOOD (  43.91  )
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

On Thu, Jan 12, 2023 at 8:05 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Wed, Jan 11, 2023 at 09:22:09PM +0800, Guo Ren wrote:
> > On Tue, Jan 10, 2023 at 1:20 AM Mark Rutland <mark.rutland@arm.com> wrote:
> > >
> > > On Sat, Jan 07, 2023 at 08:35:43AM -0500, guoren@kernel.org wrote:
> > > > From: Andy Chiu <andy.chiu@sifive.com>
> > > >
> > > > In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> > > > forming a jump that jumps to an address over 4K. This may cause errors
> > > > if we want to enable kernel preemption and remove dependency from
> > > > patching code with stop_machine(). For example, if a task was switched
> > > > out on auipc. And, if we changed the ftrace function before it was
> > > > switched back, then it would jump to an address that has updated 11:0
> > > > bits mixing with previous XLEN:12 part.
> > > >
> > > > p: patched area performed by dynamic ftrace
> > > > ftrace_prologue:
> > > > p|      REG_S   ra, -SZREG(sp)
> > > > p|      auipc   ra, 0x? ------------> preempted
> > > >                                       ...
> > > >                               change ftrace function
> > > >                                       ...
> > > > p|      jalr    -?(ra) <------------- switched back
> > > > p|      REG_L   ra, -SZREG(sp)
> > > > func:
> > > >       xxx
> > > >       ret
> > >
> > > What happens on SMP but not !PREEMPTION; can't a CPU be in the middle of this
> > > while you're patching the sequence?
> > Yes, when PREEMPTION, a timer interrupt between auipc & jalr may cause
> > context_switch. And riscv uses stop_machine for patch_text. Then, we
> > may modify auipc part, but only execute the jalr part when return.
>
> Please re-read my question; "!PREEMPTION" means "NOT PREEMPTION".
>
> Ignore preeemption entirely and assume two CPUs X and Y are running code
> concurrently. Assume CPU X is in the ftrace prologue, and CPU Y is patching
> that prologue while CPU X is executing it.
>
> Is that prevented somehow? If not, what happens in that case?
>
> At the very least you can have exactly the same case as on a preemptible kernel
> (and in a VM, the hypervisor can preempt the guest ata arbitrary times),
> becuase CPU X could end up executing a mixture of the old and new instructions.
>
> More generally, if you don't have strong rules about concurrent modification
> and execution of instructions, it may not be safe to modify and instruction as
> it is being executed (e.g. if the CPU's instruction fetches aren't atomic).
>
> > > Do you have any guarantee as to the atomicity and ordering of instruction
> > > fetches?
> > Not yet. If the region is short, we could use nop + jalr pair instead.
>
> Ok, so as above I do not understand how this is safe. Maybe I am missing
> something, but if you don't have a guarantee as to ordering I don't see how you
> can safely patch this even if you have atomicity of each instruction update.
>
> Note that if you don't have atomicity of instruction fetches you *cannot*
> safely concurrently modify and execute instructions.
>
> > Only one jalr instruction makes the entry atomicity.
>
> I'll have to take your word for that.
>
> As above, I don't think this sequence is safe regardless.
>
> > There are already several proposed solutions:
> > 1. Make stop_machine guarantee all CPU out of preemption point.
> > 2. Expand -fpatchable-function-entry from 4 to 24, and make detour
> > codes atomicity.
> > 3. We want to propose a solution to make auipc by hardware mask_irq.
> > For more details, see:
> > https://www.youtube.com/watch?v=4JkkkXuEvCw
>
> Ignoring things which require HW changes, you could consider doing something
> like what I'm doing for arm64 with DYNAMIC_FTRACE_WITH_CALL_OPS:
>
>   https://lore.kernel.org/lkml/20230109135828.879136-1-mark.rutland@arm.com/
The idea of DYNAMIC_FTRACE_WITH_CALL_OPS (Using data load/store +
indirect jump instead of auipc+jalr) is similar to Andy's solution
(See youtube link, last page of ppt). But the key problem is you also
expand the size of the prologue of the function. 64BIT is already
expensive, and we can't afford more of it. I would change to seek a
new atomic auipc+jalr ISA extension to solve this problem.

DYNAMIC_FTRACE_WITH_CALL_OPS  would speed up ftrace_(regs)_caller
(Mostly for kernel debug), but it won't help
DYNAMIC_FTRACE_WITH_DIRECT_CALLS. So I do not so care about the
ftrace_(regs)_caller performance gain.

>
> ... which would replace the address generation with a load, which can be
> atomic, and would give you a number of other benefits (e.g. avoiding branch
> range limitations, performance benefits as in the cover letter).
>
> Thanks,
> Mark.



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
