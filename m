Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC4CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 03:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYLm4ABLKq1wUHBPbU+zRr+rBicZKjdqUZEQ+rzrJnY=; b=zJNGksUMD3Riuu
	EeIyW2d+2+EspZ9OxDwJO4ti3LqbaMnlJN3vPW1IwJ9P9/oyTpM9Ahm8Y4oGTGA+RvwgK6vd7qs8x
	iJhEk3/zkd8skCPvEQfA/U7cfAZ54ws12Jv17sukHJjsHB6f5bEpRcGodz4PNh8Ht3rAEtJCe4lev
	YGBE8hBRcdBNQOibdYPrJTBoqlCFRSIuRvqkzaWhT1Xce2Sh3l6RDAqUUucQkzSznb2Qu+JQ3g4L8
	vT1E6DxOx0fJkv82DSIGNHKLD32CEEszYFtcfiBYQcN9gmMs5Ywk23SLVzPXDyuQffweDHNPMUqAR
	WHRdfl+ol4SxXKoZQTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPcD7-0056WI-Fc; Thu, 03 Mar 2022 03:33:01 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPcD4-0056VV-G7
 for linux-riscv@lists.infradead.org; Thu, 03 Mar 2022 03:33:00 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2dbc48104beso41447727b3.5
 for <linux-riscv@lists.infradead.org>; Wed, 02 Mar 2022 19:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUluA6SWzxvZ02iLUZbuuzUTHgef/Y3t3378aRSkrak=;
 b=NqsrKJiWQ5xYAcuCo4rToX8VEyawlmkbY8AvtN/9a14QR2zvrXu0rwqLRwNBhNCymw
 G/+u7w0AnpYDhSX53jnZKVXvyfMJd0+lb5IsTJHwTuDvgy6/skYbB0Njb1g6NE6sFhKx
 YS1gE1Uyoq4iHSVlmE8ClEaDXOFZlzpi/1JtusSpNOKcdOHhphV0mvbFRKWmKbSBzNP4
 cwUqYUMaiBpV8tbfrIojb5VLUd/9jVvsg4vfNLZNhJ4+1cNMlwU96kATxIzW8tmK0run
 E9fZIeTZ71jpakp4OBKvyeoGsbe341TjCTz1inx3vVzc3ZtVhVuuZ/HC6ytR0MKul+IH
 GclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUluA6SWzxvZ02iLUZbuuzUTHgef/Y3t3378aRSkrak=;
 b=FD4WfmwqYoTX/47aS7t2RCR7oz30xwsj3uQTPJ7P2Ra80ZoEx00xrReHyP3gGOmAoF
 E0svMHXbr2M+Tj0tCfWdGoRsbWGCArN6OYASvZwsWiUr5r9VHydz9OHN1YAx189oFS9v
 lm9clITntgxFfZkcVD9FCCc3Zk5ZcKtRzjgt3l/axCMKECe/XoeXcdODeJ/PUwh6DPzC
 4O9ikgPWoMSslA71YmDtVeNSUg4RzkDgNmIrC/kuiaULJ1N9ymejNnISM+85B1BSURU5
 aidiVq+GicCW6Yrn3Bewdml/a0LDbirGOTcqXefglQEdVxvFO6LTrBKc8QJOFUhfXxhL
 GOow==
X-Gm-Message-State: AOAM530cdVp32JoxjykGkHmNQJRAyDFXVbdMEK2G76sqXHe/8Hq09O4m
 sK9R4ytkCxeFql0rdhGcWSdrByyYoOHdI8M9LEVBJ+wA2W5md8Un
X-Google-Smtp-Source: ABdhPJz90r9laU3UJED/j3CM9rsRh7gv9bGkg4ekC9VzGdoYGzwrX7MxGTe70B3fR7y+GgTZT/8IlTS1nqCCBHke7aY=
X-Received: by 2002:a81:570f:0:b0:2d6:9a2e:a448 with SMTP id
 l15-20020a81570f000000b002d69a2ea448mr33990451ywb.344.1646278376788; Wed, 02
 Mar 2022 19:32:56 -0800 (PST)
MIME-Version: 1.0
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-2-vincent.chen@sifive.com>
 <1029793052.117276.1646238563508.JavaMail.zimbra@efficios.com>
In-Reply-To: <1029793052.117276.1646238563508.JavaMail.zimbra@efficios.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 3 Mar 2022 11:32:46 +0800
Message-ID: <CABvJ_xjzQ4Q8Qce71iQQMPANwdqE2VWk19eAaTk6gQVKhwUPGQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: Add support for restartable sequence
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_193258_569945_0BFF5AB5 
X-CRM114-Status: GOOD (  25.08  )
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

On Thu, Mar 3, 2022 at 12:29 AM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Mar 1, 2022, at 9:30 PM, Vincent Chen vincent.chen@sifive.com wrote:
>
> > Add calls to rseq_signal_deliver() and rseq_syscall() to introduce RSEQ
> > support.
> >
> > 1. Call the rseq_signal_deliver() function to fixup on the pre-signal
> >   frame when a signal is delivered on top of a restartable sequence
> >   critical section.
> >
> > 2. Check that system calls are not invoked from within rseq critical
> >   sections by invoking rseq_signal() from ret_from_syscall(). With
> >   CONFIG_DEBUG_RSEQ, such behavior results in termination of the
> >   process with SIGSEGV.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>
> Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>
> Will it be picked by by riscv maintainers ?
>
Hi Mathieu,
Thank you very much for reviewing it.
Yes, I hope it can be picked up by riscv maintainers.

Thanks,
Vincent

> Thanks,
>
> Mathieu
>
> > ---
> > arch/riscv/Kconfig         | 1 +
> > arch/riscv/kernel/entry.S  | 4 ++++
> > arch/riscv/kernel/signal.c | 2 ++
> > 3 files changed, 7 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 5adcbd9b5e88..67a671b099b6 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -101,6 +101,7 @@ config RISCV
> >       select HAVE_FUNCTION_ARG_ACCESS_API
> >       select HAVE_STACKPROTECTOR
> >       select HAVE_SYSCALL_TRACEPOINTS
> > +     select HAVE_RSEQ
> >       select IRQ_DOMAIN
> >       select IRQ_FORCED_THREADING
> >       select MODULES_USE_ELF_RELA if MODULES
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index ed29e9c8f660..56ada2a583fa 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -225,6 +225,10 @@ ret_from_syscall:
> >        * (If it was configured with SECCOMP_RET_ERRNO/TRACE)
> >        */
> > ret_from_syscall_rejected:
> > +#ifdef CONFIG_DEBUG_RSEQ
> > +     move a0, sp
> > +     call rseq_syscall
> > +#endif
> >       /* Trace syscalls, but only if requested by the user. */
> >       REG_L t0, TASK_TI_FLAGS(tp)
> >       andi t0, t0, _TIF_SYSCALL_WORK
> > diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> > index c2d5ecbe5526..16da3c3b53a1 100644
> > --- a/arch/riscv/kernel/signal.c
> > +++ b/arch/riscv/kernel/signal.c
> > @@ -258,6 +258,8 @@ static void handle_signal(struct ksignal *ksig, struct
> > pt_regs *regs)
> >               }
> >       }
> >
> > +     rseq_signal_deliver(ksig, regs);
> > +
> >       /* Set up the stack frame */
> >       ret = setup_rt_frame(ksig, oldset, regs);
> >
> > --
> > 2.17.1
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
