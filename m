Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33077C38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 09:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HM+sTzOmfufAFjNZly3edBWgGibHszaHxrqSgDMyzQ=; b=pTtbD60A/UREBk
	UK+hb8626Lphf4wsUIs2NcoVw0ZZv9xNbJHvrSBjtMolAiYH4uUyLi89M5O1blFnWFIqHgh05eDmR
	cmbFMtxTc8MHnLaT+0p5VnmGKyfJPTzzkhT1/XutTSK6sA16pC2Io2QYaew2d460KmX/mDfH8uFi8
	97TWzWY7IbE41aNkCEwaj9X5r42Oz2J/sKxc7osKWvANf7pD7zL4/bYypPovCEbMVuxD35G6kqvKa
	MZA9C+rLryW4jtYQcrEEv3vPqZwvNlonihaLUegc+L4X4w9TU88qkv+T+py1zgYXqv12yFTZQ8Nrf
	ePPunYpiQwB/X/uZZl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLhmH-00HYIb-0Y; Sat, 28 Jan 2023 09:45:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLhmD-00HYHX-AG
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 09:45:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9DAF8B802C8
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 09:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D668C43325
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674899131;
	bh=f9WQfwF+UIHMBGkmFmmOCZ4DpAVEy5mUTJ5Co+QE6C8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cqe8P54r1orNNXV4BuqBahgBrHZ9Tf9sHi1iUcQP5ESCXKfkD8mwdFk2wtyDqoYgR
	 ShUPr+TvONuoUcvVi72q7FyCe1tEBU3ITf48LhHuM4Tye0b6B7LwMMVFEcC+o4sB1v
	 0kQioc3A7VLda5AX1nDFmryX4cabhfa+3VLczXoidAy1sLcv6UDfYwh0s3tYekcJHj
	 8WAwhmQ3r7cKZPrklx9aY4oKfNQXSCZNg4o5+TvQOBmAHZ8Y0LVtm5kPvKPhYDkzRU
	 QCc8w1iwwwBPIkTngYo2eMzifWCucsIAmsjCLPMJe1Hl/8p0vixTpBsK3WqsO8ZhBv
	 ezsvYTfGhxdPg==
Received: by mail-ej1-f42.google.com with SMTP id p26so8399489ejx.13
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 01:45:31 -0800 (PST)
X-Gm-Message-State: AFqh2koO7wsnpvXCXqeUx3LoP2Wed5Y1bx4Ze1E3AvemRSB2f2EsIBvT
	8lVhuxh/NON93ikP9wCxWmXJSVL4I6w8mk+5Wsk=
X-Google-Smtp-Source: AMrXdXvgmrDt2cpkeSGs4DnVJ1a+OQNJm74cxV3kv4a1p2jHvsrAZ7/h539yfgPnV/6s7GLj1IRxb9riaMzv84yAcZs=
X-Received: by 2002:a17:906:6d97:b0:85f:f320:2cea with SMTP id
 h23-20020a1709066d9700b0085ff3202ceamr6376965ejt.89.1674899129740; Sat, 28
 Jan 2023 01:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20230112090603.1295340-1-guoren@kernel.org> <20230112090603.1295340-2-guoren@kernel.org>
 <Y7/6AtX5X0+5qF6Y@FVFF77S0Q05N> <Y8ADt98oowRZJdjw@FVFF77S0Q05N>
In-Reply-To: <Y8ADt98oowRZJdjw@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 28 Jan 2023 17:45:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSpCGP55=VyOmRR+439H6PymPVk6cRUc_8LRX74-bHqKQ@mail.gmail.com>
Message-ID: <CAJF2gTSpCGP55=VyOmRR+439H6PymPVk6cRUc_8LRX74-bHqKQ@mail.gmail.com>
Subject: Re: [PATCH -next V7 1/7] riscv: ftrace: Fixup panic by disabling preemption
To: Mark Rutland <mark.rutland@arm.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org, 
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	suagrfillet@gmail.com, andy.chiu@sifive.com, e.shatokhin@yadro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_014537_656507_49715DEC 
X-CRM114-Status: GOOD (  32.61  )
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

On Thu, Jan 12, 2023 at 8:57 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Jan 12, 2023 at 12:16:02PM +0000, Mark Rutland wrote:
> > Hi Guo,
> >
> > On Thu, Jan 12, 2023 at 04:05:57AM -0500, guoren@kernel.org wrote:
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
> > >                                     ...
> > >                             change ftrace function
> > >                                     ...
> > > p|      jalr    -?(ra) <------------- switched back
> > > p|      REG_L   ra, -SZREG(sp)
> > > func:
> > >     xxx
> > >     ret
> >
> > As mentioned on the last posting, I don't think this is sufficient to fix the
> > issue. I've replied with more detail there:
> >
> >   https://lore.kernel.org/lkml/Y7%2F3hoFjS49yy52W@FVFF77S0Q05N/
> >
> > Even in a non-preemptible SMP kernel, if one CPU can be in the middle of
> > executing the ftrace_prologue while another CPU is patching the
> > ftrace_prologue, you have the exact same issue.
> >
> > For example, if CPU X is in the prologue fetches the old AUIPC and the new
> > JALR (because it races with CPU Y modifying those), CPU X will branch to the
> > wrong address. The race window is much smaller in the absence of preemption,
> > but it's still there (and will be exacerbated in virtual machines since the
> > hypervisor can preempt a vCPU at any time).
>
> With that in mind, I think your current implementation of ftrace_make_call()
> and ftrace_make_nop() have a simlar bug. A caller might execute:
>
>         NOP     // not yet patched to AUIPC
>
>                                 < AUIPC and JALR instructions both patched >
>
>         JALR
>
> ... and go to the wrong place.
>
> Assuming individual instruction fetches are atomic, and that you only ever
> branch to the same trampoline, you could fix that by always leaving the AUIPC
> in place, so that you only patch the JALR to enable/disable the callsite.
Yes, the same trampoline is one of the antidotes.

>
> Depending on your calling convention, if you have two free GPRs, you might be
> able to avoid the stacking of RA by always saving it to a GPR in the callsite,
> using a different GPR for the address generation, and having the ftrace
> trampoline restore the original RA value, e.g.
>
>         MV      GPR1, ra
>         AUIPC   GPR2, high_bits_of(ftrace_caller)
>         JALR    ra, high_bits(GPR2)                     // only patch this
I think you mean temp registers here. We are at the prologue of a
function, so we have all of them.

But why do you need another "MV      GPR1, ra"

         AUIPC   GPR2, high_bits_of(ftrace_caller)
         JALR    GPR2, high_bits(GPR2)                     // only patch this

We could reserve ra on the trampoline.
        MV      XX, ra

>
> ... which'd save an instruction per callsite.
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
