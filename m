Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D38FC2B9F7
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 01:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B86A9613EC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 01:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B86A9613EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2i3B1TXcKxkahDUE5D5VCaQfCooJtTqwwJXPk9A7P0k=; b=I/x4WfuK4yCPaG
	uRB0B32jCn7S/0lj2lakPPAp8dt5AxNZKYEUD8SOGavAYV2vIxHR181hBIZOBE2ljomU8AJfjVnt+
	TuG082c78P4YQg+J2uSOcmAPn1nx6BOrey5Dg+7Igrgf6oM4BVuCxidNrPlAB8ukVX+ZC8sEEhzvL
	ucpW0fpOi29cUQmv0Q92d74g9gg8Q+9KaqMzZ0Svf8hRN0nfZSKrTxsTW+xw8tnygeOck+9Xj+jF7
	KI7m8F/hD7Vk0I9mr49Ff73FtNQi4wtTu4inLAwY61lAxvIrJk2PEr5EB+49zP+Atgb+ALKr49/Sr
	w80Pjp5QWajxeEL2X7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llLUZ-002hSa-Pj; Tue, 25 May 2021 01:04:19 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llGJn-001gh9-Fj
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 19:32:53 +0000
Received: by mail-yb1-xb32.google.com with SMTP id r7so17552349ybs.10
 for <linux-riscv@lists.infradead.org>; Mon, 24 May 2021 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NYka7qvCrcJU8Em4l3NhmhKnLm9g5PqEfLQWSjQZDlQ=;
 b=LofD4uMbAUk7pk2j9vx3bE4G1qAfo7dILNxp8FLk+PWXy8N6gQCaZcxJ3681iuFoxJ
 mV8XB6rd+p8VRvXkb+93kEXhqb9R3t/3vzadFkIeqxPpAFpXQfIjFrUnEwubdSMBDCSW
 L8N2MQ6RI695HawGT/Zwp1C6iiJnrjpA+xqk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NYka7qvCrcJU8Em4l3NhmhKnLm9g5PqEfLQWSjQZDlQ=;
 b=qvIppXaSqjKrZBthpp/mP9ERDhrrb8T99d1UxpgrqXi+VicWWTP7wf1OrsqTetPXTR
 RYChWkZswif6fJ/N4jS0AXFCqWcx9kYcaqH78ZqcExh/PpUBiunxLRO0zTI43VFAkKAQ
 qRdk4Q1qoF/mdd9N+mYcEA7nn5E0aSrHPsSSsy5lNfUuBXzeDKBDacRSOVilVrBbaXJl
 H6+qb19x54Gf6NXoKh/2+eeWfuC2WviKJD6hXsQa8NjOUauQwvPWKD95QLOrWAzLq2+Y
 l475jw7YnbxpYCcesLEPz7ieV4KqX4wU/0H2XatFcHwO0VKj9Rk95Ut4Dx8Y5pI3tPuq
 nBKg==
X-Gm-Message-State: AOAM531UNHs3ljiqmH7vABkYNb3nWlDV/ShsUfIjq6rQ1nZJgpL8dqHa
 ak3uL01pMNVVcVdCPJXd1y7Jp+hYGe4qJwCpZe1NNw==
X-Google-Smtp-Source: ABdhPJxdsQHMvsH4dno8sUybs/q+RK8dePva6brNnXtbhDmlmG1HKJnI7SaPIO7icqB4Xl7KP0cqbtrsD3H5MSemmEY=
X-Received: by 2002:a25:7745:: with SMTP id s66mr17955046ybc.302.1621884769648; 
 Mon, 24 May 2021 12:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4kBBJqF=AxTu50PF=EshLSyqn0=yeC2dwf4JJj_Grsi_Tccg@mail.gmail.com>
 <mhng-1c10179a-d96b-4cf1-860a-03f0313ac980@palmerdabbelt-glaptop>
In-Reply-To: <mhng-1c10179a-d96b-4cf1-860a-03f0313ac980@palmerdabbelt-glaptop>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Mon, 24 May 2021 21:32:38 +0200
Message-ID: <CAM4kBBK1BJSE-LeDiEJL-z+tgZMi6Zcb+6AnnQiB8ceaU98k0w@mail.gmail.com>
Subject: Re: [PATCH] riscv: code patching only works on !XIP_KERNEL
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_123251_589414_B60A3080 
X-CRM114-Status: GOOD (  31.00  )
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

On Sat, May 22, 2021 at 7:15 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 10 May 2021 11:19:30 PDT (-0700), vitaly.wool@konsulko.com wrote:
> > On Mon, May 10, 2021 at 6:35 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
> >>
> >> From: Jisheng Zhang <jszhang@kernel.org>
> >>
> >> Some features which need code patching such as KPROBES, DYNAMIC_FTRACE
> >> KGDB can only work on !XIP_KERNEL. Add dependencies for these features
> >> that rely on code patching.
> >
> > Since we can define extra RW sections to place some tiny code bits in
> > RAM, I would suggest that you hold back this patch for a while.
> > I am not going to support the idea of e. g. compiling KGDB support
> > into a XIP kernel, but disabling the whole HAVE_ARCH_JUMP_LABEL is
> > hardly the way to go.
>
> Do you have any updates on this?  The SOC_SIFIVE disable thread floated
> back to the top of my inbox and I didn't see anything there.  I'd prefer
> to avoid chasing around Kconfig disables for a bunch of stuff that we're
> just going to fix soon, but if this is going to be a big change then
> it's likely for next cycle anyway so in that case I'll start picking up
> these compile disable patches.

Sorry, was caught up in fixing other stuff but now I'm on it so expect
some updates soon.

Best regards,
   Vitaly

> Not trying to rush any thing here, just don't want to have a bunch of
> broken configs.
>
> >
> > Best regards,
> >    Vitaly
> >
> >> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >> ---
> >> Hi,
> >>
> >> Currently, the RISCV_ERRATA_ALTERNATIVE also only works on !XIP_KERNEL
> >> but from the maillist it seem there's effort to make the co-exist, so
> >> I drop RISCV_ERRATA_ALTERNATIVE dependency on !XIP_KERNEL.
> >>
> >> Thanks
> >>
> >>  arch/riscv/Kconfig | 18 +++++++++---------
> >>  1 file changed, 9 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> index a8ad8eb76120..61320b94ef97 100644
> >> --- a/arch/riscv/Kconfig
> >> +++ b/arch/riscv/Kconfig
> >> @@ -60,11 +60,11 @@ config RISCV
> >>         select GENERIC_TIME_VSYSCALL if MMU && 64BIT
> >>         select HANDLE_DOMAIN_IRQ
> >>         select HAVE_ARCH_AUDITSYSCALL
> >> -       select HAVE_ARCH_JUMP_LABEL
> >> -       select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >> +       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> >> +       select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
> >>         select HAVE_ARCH_KASAN if MMU && 64BIT
> >>         select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
> >> -       select HAVE_ARCH_KGDB
> >> +       select HAVE_ARCH_KGDB if !XIP_KERNEL
> >>         select HAVE_ARCH_KGDB_QXFER_PKT
> >>         select HAVE_ARCH_MMAP_RND_BITS if MMU
> >>         select HAVE_ARCH_SECCOMP_FILTER
> >> @@ -79,9 +79,9 @@ config RISCV
> >>         select HAVE_GCC_PLUGINS
> >>         select HAVE_GENERIC_VDSO if MMU && 64BIT
> >>         select HAVE_IRQ_TIME_ACCOUNTING
> >> -       select HAVE_KPROBES
> >> -       select HAVE_KPROBES_ON_FTRACE
> >> -       select HAVE_KRETPROBES
> >> +       select HAVE_KPROBES if !XIP_KERNEL
> >> +       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> >> +       select HAVE_KRETPROBES if !XIP_KERNEL
> >>         select HAVE_PCI
> >>         select HAVE_PERF_EVENTS
> >>         select HAVE_PERF_REGS
> >> @@ -230,11 +230,11 @@ config ARCH_RV64I
> >>         bool "RV64I"
> >>         select 64BIT
> >>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
> >> -       select HAVE_DYNAMIC_FTRACE if MMU && $(cc-option,-fpatchable-function-entry=8)
> >> +       select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
> >>         select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> >> -       select HAVE_FTRACE_MCOUNT_RECORD
> >> +       select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
> >>         select HAVE_FUNCTION_GRAPH_TRACER
> >> -       select HAVE_FUNCTION_TRACER
> >> +       select HAVE_FUNCTION_TRACER if !XIP_KERNEL
> >>         select SWIOTLB if MMU
> >>
> >>  endchoice
> >> --
> >> 2.31.0
> >>
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
