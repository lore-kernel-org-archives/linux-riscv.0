Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2732C433DF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 00:55:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E2B120739
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 00:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1oWja/X6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbxuE8Ja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E2B120739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qTiWXo3+f9owmRIvF6Xxl4PyfjtYRGkfReQZYfPN49U=; b=1oWja/X6GSjJHMUmR6gJT0/Gl
	CU/cQwkU6ZDQV2K6w7G647cAh2emEhyw0YFc0LjoB5Gr4iyWvqOXOLVW0fi4ytRChBigzDUtHOYrx
	jH1sB3hFU1B7Ju9G0jG8gtb1uqOAA7sMxVQ+rwWvzcP3LC0oSGlqSyuDvdAo3Alk9ixDHCts+Nkxw
	A9xKcJcgIvM1+cLVQfru2/37hmN3EipGHXiAC/2p1P6rE3SoqgO+TVZRbK+9Ye2JJT3efa6yvKuoX
	/MWLRHiQwD6hu6N1n9nN7uP6qQzSGjbEqDk/xIc+vodSGyiKyZY3CUmJvXCeV0+2Xa6YthP1Zxw5Y
	vejXjVMsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsFQG-0008CX-FF; Mon, 06 Jul 2020 00:55:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsFQD-0008Al-FP
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 00:55:50 +0000
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39B5820747
 for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2020 00:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593996948;
 bh=RHq2frbr5C2baeMa24wuxuxZcDCDS1+l6jz9s81NhXo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DbxuE8Ja5OroOh1pVX2wqFvRGK1khawlOaVNo+AECDr0akQUHQWP9vJGAXE2EQOPh
 VJOTas95HHPDyo65YRvvDv8SQszatJW6Y9wUYSXK5QyNRpV6KlIhg43qh+9kMHY3Xf
 p5N838jjl7Z+aNhZ5g3yWN54RIpBtqop8uHbrJqs=
Received: by mail-lj1-f178.google.com with SMTP id e4so43407408ljn.4
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 17:55:48 -0700 (PDT)
X-Gm-Message-State: AOAM532hIM8oTpHs5POVkYK0FaDDh+ib6x8MFehso/Bd5TooS8XVbr75
 j7JK/ocTbg94mDmgsxNTkKKLBBigLg3oWBsQknc=
X-Google-Smtp-Source: ABdhPJyqg4cj0aC4F94U/7Fo1d/pfDDfpEAE94q72fMqGwsQBE7GhkSUNlvcT9PsuxV5GVDiB93U5qFrLHBSMAj0AvA=
X-Received: by 2002:a05:651c:111:: with SMTP id
 a17mr3380595ljb.265.1593996946540; 
 Sun, 05 Jul 2020 17:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <1593930255-12378-1-git-send-email-guoren@kernel.org>
 <202007042350.4C153C4F8@keescook>
 <CAJF2gTQFqH7GMvRgmtb=hBwvUy6NZyM8xLqOsUTvnYhO48tQbg@mail.gmail.com>
 <202007051328.FE9EF99@keescook>
In-Reply-To: <202007051328.FE9EF99@keescook>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 6 Jul 2020 08:55:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTCEEoP3a9i_REXPwkJZ4Si_hYfjk_hwqHxkyfgw_xBLw@mail.gmail.com>
Message-ID: <CAJF2gTTCEEoP3a9i_REXPwkJZ4Si_hYfjk_hwqHxkyfgw_xBLw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add STACKPROTECTOR supported
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_205549_653963_F2107D1A 
X-CRM114-Status: GOOD (  22.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu <mhiramat@kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Greentime Hu <green.hu@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 6, 2020 at 4:31 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Sun, Jul 05, 2020 at 10:16:14PM +0800, Guo Ren wrote:
> > On Sun, Jul 5, 2020 at 2:53 PM Kees Cook <keescook@chromium.org> wrote:
> > > On Sun, Jul 05, 2020 at 06:24:15AM +0000, guoren@kernel.org wrote:
> > > > +static __always_inline void boot_init_stack_canary(void)
> > > > +{
> > > > +     unsigned long canary;
> > > > +
> > > > +     /* Try to get a semi random initial value. */
> > > > +     get_random_bytes(&canary, sizeof(canary));
> > > > +     canary ^= LINUX_VERSION_CODE;
> > > > +     canary &= CANARY_MASK;
> > >
> > > Does riscv have any kind of instruction counters or other trivial timers
> > > that could be mixed in here? (e.g. x86's TSC)
> > Do you mean:
> >   get_random_bytes(&canary, sizeof(canary));
> > + canary += get_cycles64() + (get_cycles64() << 32UL);
> >   canary ^= LINUX_VERSION_CODE;
> >   canary &= CANARY_MASK;
> >
> > Ok ?
>
> Sure -- I assume get_cycles64() is architecturally "simple"? (i.e. it
> doesn't require that the entire time-keeping subsystem has started?)
Yes, it's just a csr read. But it's necessary? get_random_bytes should enough.

>
> > >
> > > > +
> > > > +     current->stack_canary = canary;
> > > > +     __stack_chk_guard = current->stack_canary;
> > >
> > > What's needed for riscv to support a per-task canary? (e.g. x86's TLS or
> > > arm64's register-specific methods)
> > Some archs change __stack_chk_guard in _switch_to of entry.S, but it
> > depends on !CONFIG_SMP.
>
> Oh, funny. I hadn't actually noticed that logic for the !CONFIG_SMP
> cases. I see to problem with that, but the more important case, I think
> is the per-task canaries.
Maybe some race condition problems. When canary changed the in the
switch to, but other CPUs still get that value concurrently.

>
> > #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_SMP)
> >         get  value  from next_task->stack_canary
> >         store  value to __stack_chk_guard
> > #endif
> >
> > It's a so limitation solution for per-task canary, so I didn't copy it
> > into riscv?
>
> Right -- it's a limited solution. On the other had, is !CONFIG_SMP
> expected to be a common config for riscv? If so, it's worth adding. If
> not, I'd say skip it. (Though it looks very simple to do...)
CONFIG_SMP is mostly default for me and let's talk about arm64/x86
per-task solution. That is the right way.


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
