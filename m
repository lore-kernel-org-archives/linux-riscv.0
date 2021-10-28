Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F48C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 01:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0D561108
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 01:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C0D561108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTOttb1tqGQ0rcw8nz95hMCv2wyZ1CFUcM6Pzut+708=; b=UV1wawsqMgXIxP
	x06RUhQ5cRCaclimF2o65qpFfMjkYjQ6jphMCRxU5HzI2JzWvnjpHN6Y8hilTd06SB5bsy1lMwUAA
	U7uxeyIUlUZW7C/0YhhwSpGRHGRkwmehBFvWtzTuLBhtaEXyx/2LvFdVASdtTDY/pi16MYTYCkLtc
	87EoEYNRdwQ9ifJ2b3NMZEqi2HBEcFxmmAkqTUdjgMFcBqURK+f1Sp+mo2BsbagTf3ADSAdu0+n1g
	xSgrSNN/BCFqSmct5KJMBf0LfiE3XGaq1c98ZNMRhbmlv3iYinAtcT/MdzIWOuxacPNaNO6S6wNZX
	IKkMpAycYjxy8Eve6bHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfuDz-006cHg-Ks; Thu, 28 Oct 2021 01:28:59 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfuDu-006cFv-2p
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 01:28:58 +0000
Received: by mail-yb1-xb32.google.com with SMTP id v138so5588721ybb.8
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 18:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xfzKd2vgkQfDrWQZtVDjJh7Mhi+T2vul4wAXZwlcYCo=;
 b=hgWwmgVV6g5xybQgwSLBtjXyugKqAY1Irq7ojaDOA4ea2QyEXEFeTUE14eZ/v/oGIn
 BFYGADNpK7FuoI20MC6kvuVqZPZ2de1wUXs4N7vSEYjyHqCYy2PzO+Sy9SU0P4TfRJVA
 0NiZby1Hqb/98HVjVyuLLRgBuuM243Kf9vFjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xfzKd2vgkQfDrWQZtVDjJh7Mhi+T2vul4wAXZwlcYCo=;
 b=IhtHt/BMJ/FYgYNSulLnOfDgtw2rGhqFkf9jHLqkr2XQYpKqIbGyR/FY9tuXLPk2HG
 MC776sGih7I93VCEMKqcWeR1/DegLW5nAqffUFOCw1LybJHGCaD0r7QBK/VkFYPOnKwU
 19NtjSwcVEnLzZRmL+NPba/lXd07wbPuHCTcuigFiCRJFsYhexp0gSXl4vcyIDK5JGa8
 Af7UY3tj0rNCAUts9mCDVeux26+N5XGAaIHWpLZzrAkO+M3k7UJv828uIUdvXFpe2HAC
 KpnslSOEPm1cjcJMxPSQChBV/xydn4FvvN7VCaeoVIG/FkXTu1X+pK11sZiCQT7aBq89
 q04A==
X-Gm-Message-State: AOAM530v7rcOosKK0Kyl6ewURarOtUmyAwDPi6PjkPoqoZfL42MhgWSx
 WkOy4i56VHufJTskgbPc9U/Vy0F4Fo3LFEh+j3FK
X-Google-Smtp-Source: ABdhPJwg3HxikGp82SuVl8GjPiHpQ0jVVz+E+HzYhzxNsyemMVi28uqNPMGwGaBfjOOdFQXeQ7ddO+rw35fGWQoMrbw=
X-Received: by 2002:a25:4010:: with SMTP id n16mr1354592yba.204.1635384533140; 
 Wed, 27 Oct 2021 18:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
 <CAOnJCULgjUsnb__QrUFdop3Nr9t6G5WtSsG+EE2d4_e+b7Dy5Q@mail.gmail.com>
 <CAMuHMdUBFE+dzg0Lqechmj8D4ssJS5O_UCrDBtToWn-EP+0T_g@mail.gmail.com>
In-Reply-To: <CAMuHMdUBFE+dzg0Lqechmj8D4ssJS5O_UCrDBtToWn-EP+0T_g@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 27 Oct 2021 18:28:42 -0700
Message-ID: <CAOnJCUJHXcaLve3Nei+PnnA1-kKUXjShDneK5qNh5ebVnnWMXw@mail.gmail.com>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_182854_192096_346FF55D 
X-CRM114-Status: GOOD (  47.66  )
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

On Tue, Oct 26, 2021 at 2:03 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Atish,
>
> On Tue, Oct 26, 2021 at 10:55 AM Atish Patra <atishp@atishpatra.org> wrote:
> > On Mon, Oct 25, 2021 at 8:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > When booting a kernel with CONFIG_NR_CPUS=4 on Microchip PolarFire,
> > > the 4th CPU either fails to come online, or the system crashes.
> > >
> > > This happens because PolarFire has 5 CPU cores: hart 0 is an e51,
> > > and harts 1-4 are u54s, with the latter becoming CPUs 0-3 in Linux:
> > >   - unused core has hartid 0 (sifive,e51),
> > >   - processor 0 has hartid 1 (sifive,u74-mc),
> > >   - processor 1 has hartid 2 (sifive,u74-mc),
> > >   - processor 2 has hartid 3 (sifive,u74-mc),
> > >   - processor 3 has hartid 4 (sifive,u74-mc).
> > >
> > > I assume the same issue is present on the SiFive fu540 and fu740
> > > SoCs, but I don't have access to these.  The issue is not present
> > > on StarFive JH7100, as processor 0 has hartid 1, and processor 1 has
> > > hartid 0.
> > >
> > > arch/riscv/kernel/cpu_ops.c has:
> > >
> > >     void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
> > >     void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> > >
> > >     void cpu_update_secondary_bootdata(unsigned int cpuid,
> > >                                        struct task_struct *tidle)
> > >     {
> > >             int hartid = cpuid_to_hartid_map(cpuid);
> > >
> > >             /* Make sure tidle is updated */
> > >             smp_mb();
> > >             WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> > >                        task_stack_page(tidle) + THREAD_SIZE);
> > >             WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
> > >
> > > The above two writes cause out-of-bound accesses beyond
> > > __cpu_up_{stack,pointer}_pointer[] if hartid >= CONFIG_NR_CPUS.
> > >
> > >     }
> > >
> >
> > Thanks for reporting this. We need to fix this and definitely shouldn't hide it
> > using configs. I guess I never tested with lower values (2 or 4) for
> > CONFIG_NR_CPUS which explains how this bug was not noticed until now.
>
> > > How to fix this?
> > >
> > > We could skip hartids >= NR_CPUS, but that feels strange to me, as
> > > you need NR_CPUS to be larger (much larger if the first usable hartid
> > > is a large number) than the number of CPUs used.
> > >
> > > We could store the minimum hartid, and always subtract that when
> > > accessing __cpu_up_{stack,pointer}_pointer[] (also in
> > > arch/riscv/kernel/head.S), but that means unused cores cannot be in the
> > > middle of the hartid range.
> >
> > Yeah. Both of the above proposed solutions are not ideal.
> >
> > >
> > > Are hartids guaranteed to be continuous? If not, we have no choice but
> > > to index __cpu_up_{stack,pointer}_pointer[] by cpuid instead, which
> > > needs a more expensive conversion in arch/riscv/kernel/head.S.
> >
> > This will work for ordered booting with SBI HSM extension. However, it may
> > fail for spinwait booting because cpuid_to_hartid_map might not have setup
> > depending on when secondary harts are jumping to linux.
> >
> > Ideally, the size of the __cpu_up_{stack,task}_pointer[] should be the maximum
> > hartid possible. How about adding a config for that ?
>
> (reading more RISC-V specs)
> Hart IDs can use up to XLEN (32, 64, or 128) bits. So creative sparse
> multi-level encodings like used in MPIDR on ARM[1] makes using a
> simple array infeasible.
>

Hmm. Should we worry about similar creative sparse encodings when it appears ?
Maybe we can dodge it all together.

The other approach would be to go with your proposed solution to
convert the hartid it to the cpuid in head.S
However, this can only be fixed for ordered booting. Most of today's
users have probably moved on to ordered booting.
The only user who would be using spinwait would be

1. whoever still uses BBL
2. whoever still uses OpenSBI v0.6 or older

Maybe we can document this bug in the Linux kernel for the spinwait
method and move on.
Hopefully, we can remove the spinwait method in a couple of years.

Is that acceptable ?

> [1] arch/arm{,64}/include/asm/cputype.h
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
