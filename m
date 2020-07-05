Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C7BC433DF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 20:32:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 044882073E
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 20:32:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1lTtyaZi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JDpzbBFH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 044882073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uc488PZIXv7IwPd2fHVmKYmmYVCPXRx4+SUxUqScSbo=; b=1lTtyaZi2HIljsr4TlfaVsGj1
	tQQGYsN+LkU2cz/ZeWZgs84lUHT9iW2qhYXhoBKgNzVE/gObFwkeH6fXsABChsezkrj6wZTUbLzAb
	lFfcrXHNDwXTkUsH63CnRCuVZjxko8GlmGhwy+aN356K03OL/K9AJZvOWUEZrwSeTMgTSU8AtMNwL
	55Pas14pUQO2sB1j5pscOAVZF861/BE+Nb7luPsnfsZxOqvxD+BpeKbnJ2bgsp+cWLmrRl6EqslPf
	Mm7u8mNmrUXEPxe3hCdVjClT/0EIG2Witjzq/leGlgLpmqIJ3aREB8AJdrbf1WTfoBnaC0/+Ep3FK
	LQz/Ft9Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsBIs-0001Rr-Ke; Sun, 05 Jul 2020 20:31:58 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsBIq-0001RL-Sv
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 20:31:57 +0000
Received: by mail-pg1-x544.google.com with SMTP id w2so16630368pgg.10
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 13:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ur7mB1HQd3aacYwlGEFeNIXsEbUuMF415cElS3tVlkQ=;
 b=JDpzbBFHelJ+U3gs0XnqMdc/wE1/wEy2lbGSnkGrl84Cxopx0PV7YffkPDncy+PyuR
 XCG9Sqzhws6JDKzAfs4dnTSCmZ4jbLklFaKH1xvR6cHeQb7xmHJSxB1QSff5g07yw91J
 GmVq69VJBztKqy+z680mZmPxPEkKYR2EhdVyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ur7mB1HQd3aacYwlGEFeNIXsEbUuMF415cElS3tVlkQ=;
 b=XO81OiM8EVkLoIaxh9i7AktsncaULtV6qpamVnV853nW4qv1vxSauNzl6d89EODFob
 5dab2swNgeLP9A3lsHvjkhRCpn9r6ovjBFqRwU8YUFFeda+h9FYW8rBXL0bkutsMhco+
 OOi9b08x4atbrasPKDDNXkuCvc5KBBAlBylZ3ioIZYu6+MCH6W0bjkz4CVqnPTGUTaOT
 nmscO9+6CONn8tWgnLUEda1G4SH2UPYaxDy0X+Nmel84NQB7nIU54ev2YT7jQCoHYJuC
 N2LIQEJAkDaH/2VMjqFmzl918eIOXp1EcNpKBrhIzv1Nti/rIEh6bhOt/miIuBwiPOmy
 Wjxw==
X-Gm-Message-State: AOAM533cm+eBc6U2XM67TvmJhheYiTE4Ac0SkiFKKjUd1J6DM/dPsA4W
 ncYObbkzjZVP+GCTcjBp9GfkOQ==
X-Google-Smtp-Source: ABdhPJxGflcwOaYyfs2gLTjaHiikusvtN11502CcX43vmcvaWqy2v3cL096nKsEZPkw+SWGXAu7ksA==
X-Received: by 2002:a62:164a:: with SMTP id 71mr43090161pfw.266.1593981113896; 
 Sun, 05 Jul 2020 13:31:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m9sm1342538pjs.18.2020.07.05.13.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 13:31:53 -0700 (PDT)
Date: Sun, 5 Jul 2020 13:31:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: Add STACKPROTECTOR supported
Message-ID: <202007051328.FE9EF99@keescook>
References: <1593930255-12378-1-git-send-email-guoren@kernel.org>
 <202007042350.4C153C4F8@keescook>
 <CAJF2gTQFqH7GMvRgmtb=hBwvUy6NZyM8xLqOsUTvnYhO48tQbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQFqH7GMvRgmtb=hBwvUy6NZyM8xLqOsUTvnYhO48tQbg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_163156_952479_BCCC7D3F 
X-CRM114-Status: GOOD (  17.74  )
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
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jul 05, 2020 at 10:16:14PM +0800, Guo Ren wrote:
> On Sun, Jul 5, 2020 at 2:53 PM Kees Cook <keescook@chromium.org> wrote:
> > On Sun, Jul 05, 2020 at 06:24:15AM +0000, guoren@kernel.org wrote:
> > > +static __always_inline void boot_init_stack_canary(void)
> > > +{
> > > +     unsigned long canary;
> > > +
> > > +     /* Try to get a semi random initial value. */
> > > +     get_random_bytes(&canary, sizeof(canary));
> > > +     canary ^= LINUX_VERSION_CODE;
> > > +     canary &= CANARY_MASK;
> >
> > Does riscv have any kind of instruction counters or other trivial timers
> > that could be mixed in here? (e.g. x86's TSC)
> Do you mean:
>   get_random_bytes(&canary, sizeof(canary));
> + canary += get_cycles64() + (get_cycles64() << 32UL);
>   canary ^= LINUX_VERSION_CODE;
>   canary &= CANARY_MASK;
> 
> Ok ?

Sure -- I assume get_cycles64() is architecturally "simple"? (i.e. it
doesn't require that the entire time-keeping subsystem has started?)

> >
> > > +
> > > +     current->stack_canary = canary;
> > > +     __stack_chk_guard = current->stack_canary;
> >
> > What's needed for riscv to support a per-task canary? (e.g. x86's TLS or
> > arm64's register-specific methods)
> Some archs change __stack_chk_guard in _switch_to of entry.S, but it
> depends on !CONFIG_SMP.

Oh, funny. I hadn't actually noticed that logic for the !CONFIG_SMP
cases. I see to problem with that, but the more important case, I think
is the per-task canaries.

> #if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_SMP)
>         get  value  from next_task->stack_canary
>         store  value to __stack_chk_guard
> #endif
> 
> It's a so limitation solution for per-task canary, so I didn't copy it
> into riscv?

Right -- it's a limited solution. On the other had, is !CONFIG_SMP
expected to be a common config for riscv? If so, it's worth adding. If
not, I'd say skip it. (Though it looks very simple to do...)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
