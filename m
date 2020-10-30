Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3430C388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 20:29:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FFEC2076D
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 20:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iEYE5A55";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="DMUlqDBS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FFEC2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=myfO5vTp/HIpnxWlRmXiQ0muGzt7oHQHXnVPfZjvQHw=; b=iEYE5A55ldhKJcmFewJqf+rin
	VYpCh9SWTOyHMHJAzd7ON+GDTTGDwHPjoKaeMUBP7J5k6fU/mB81KFEnayLUUsxFgHlOeRLAfq00t
	VySD9dIc7Vqc5PGcR6I6oCG+qxFoIKxoBzLaAKoXosh2VQtDQha0yNXDqAv69lnwp1TO9Te04oPh9
	+IVmYZRcBBdYUtUZYDszfSIzrWgDQE/E2NQX++72UiMqXm/alZxOpyrOPpwbey0nWAooQE+w9oMxC
	XsFyLo3DAF2I8xKXIjQLjOW6R8/zixmy1uQACbbVKJzI8r9LS9A45qxXfKVcoJZp9KgNCfdUNbkPU
	QjzoiXilw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYb1S-00027C-LO; Fri, 30 Oct 2020 20:29:18 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYb1P-00026e-Pz
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 20:29:16 +0000
Received: by mail-io1-xd44.google.com with SMTP id u19so8847417ion.3
 for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2020 13:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7VREF7/JJHI66A/48k9gSIWFihXYo0nC0DsshW2DhXo=;
 b=DMUlqDBS/HfvoY5Up8fsprLugIn/vkn1Fjvd//pbjobYFG89McRnVf43UIjpDXd9rA
 3NE9R5uE2CtPkMmiBFyCwR+lFLy/M0z7OQFzyomTi16k0sUNwXdmx1MUJb6CDt7QrNo5
 vhD5qCsUpgyPOgAIwVHhbFUQjhWjZax3/Ldv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7VREF7/JJHI66A/48k9gSIWFihXYo0nC0DsshW2DhXo=;
 b=AZffggMzPXzwNAMkK56XQfW7Xifv0738vTEPDDWgJtePwPdg5eNTn2dFYCfebiGqup
 hpaJaO9bG81JsjU43WqkTvn0Mu7XpMVE62yxjbaOsA5JMJsu0iTlI5s8vel6SFGiWyIC
 ArlZQSlyafFYtSqCqkYskz9FasJ9KmNPAbke+PRrtUWSF4JdWYLCHVC6M5TqODkHyYJ0
 PQcDbWoZiGD7w87I3mef/85GJFj/b+vdwGY6t74AMPtXY/2lMDXVduDDmAMszIxF3cNv
 Ep8ljRnR3ft21y6/xNOjU0Uc6/LMWhPyhl2+uws6oIZRHhqv8+2pnH2kleaXnATtdSow
 zYug==
X-Gm-Message-State: AOAM533FDyQLfMGfCPd3xZUR5NrbMZ+FWY0z3ewjTUbH2JszEG4zdgpc
 cuCnjS5IrvE5l0s1SXdeqXuo8rx4B4/ivbVj5HEAZrFKVUls
X-Google-Smtp-Source: ABdhPJzdzkOqM24jGONDbH5CFcA1utJ+rlF756F0BuufHd154tG4AL9WwW90wJJ55eBWWufh6PVX4sP6C3iLW5I9G54=
X-Received: by 2002:a02:6a5b:: with SMTP id m27mr1211998jaf.58.1604089753954; 
 Fri, 30 Oct 2020 13:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201026230254.911912-1-atish.patra@wdc.com>
 <20201026230254.911912-6-atish.patra@wdc.com>
 <20201027104545.GM1154158@kernel.org>
 <CAOnJCULsowob2sgs9qFyUDBRUcuci6e4HEMoE_JuucCX082LCA@mail.gmail.com>
 <20201030084915.GB4319@kernel.org>
In-Reply-To: <20201030084915.GB4319@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 30 Oct 2020 13:29:03 -0700
Message-ID: <CAOnJCUJFiNJ2-v4jGxCug7Xc78MXns4jYypnYFOR0L6Gkew8fA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] RISC-V: Protect .init.text & .init.data
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_162915_873927_E5D7DD82 
X-CRM114-Status: GOOD (  31.51  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 30, 2020 at 1:49 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Thu, Oct 29, 2020 at 12:21:41PM -0700, Atish Patra wrote:
> > On Tue, Oct 27, 2020 at 3:46 AM Mike Rapoport <rppt@kernel.org> wrote:
> > >
> > > On Mon, Oct 26, 2020 at 04:02:53PM -0700, Atish Patra wrote:
> > > > Currently, .init.text & .init.data are intermixed which makes it impossible
> > > > apply different permissions to them. .init.data shouldn't need exec
> > > > permissions while .init.text shouldn't have write permission.
> > > >
> > > > Keep them in separate sections so that different permissions are applied to
> > > > each section. This improves the kernel protection under
> > > > CONFIG_STRICT_KERNEL_RWX. We also need to restore the permissions for the
> > > > entire _init section after it is freed so that those pages can be used for
> > > > other purpose.
> > > >
> > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > ---
> > > >  arch/riscv/include/asm/sections.h   |  2 ++
> > > >  arch/riscv/include/asm/set_memory.h |  2 ++
> > > >  arch/riscv/kernel/setup.c           |  9 +++++
> > > >  arch/riscv/kernel/vmlinux.lds.S     | 51 ++++++++++++++++-------------
> > > >  arch/riscv/mm/init.c                |  8 ++++-
> > > >  arch/riscv/mm/pageattr.c            |  6 ++++
> > > >  6 files changed, 54 insertions(+), 24 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> > > > index 3a9971b1210f..1595c5b60cfd 100644
> > > > --- a/arch/riscv/include/asm/sections.h
> > > > +++ b/arch/riscv/include/asm/sections.h
> > > > @@ -9,5 +9,7 @@
> > > >
> > > >  extern char _start[];
> > > >  extern char _start_kernel[];
> > > > +extern char __init_data_begin[], __init_data_end[];
> > > > +extern char __init_text_begin[], __init_text_end[];
> > > >
> > > >  #endif /* __ASM_SECTIONS_H */
> > > > diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> > > > index 4cc3a4e2afd3..913429c9c1ae 100644
> > > > --- a/arch/riscv/include/asm/set_memory.h
> > > > +++ b/arch/riscv/include/asm/set_memory.h
> > > > @@ -15,6 +15,7 @@ int set_memory_ro(unsigned long addr, int numpages);
> > > >  int set_memory_rw(unsigned long addr, int numpages);
> > > >  int set_memory_x(unsigned long addr, int numpages);
> > > >  int set_memory_nx(unsigned long addr, int numpages);
> > > > +int set_memory_default(unsigned long addr, int numpages);
> > > >  void protect_kernel_text_data(void);
> > > >  #else
> > > >  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
> > > > @@ -22,6 +23,7 @@ static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
> > > >  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
> > > >  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
> > > >  static inline void protect_kernel_text_data(void) {};
> > > > +static inline int set_memory_default(unsigned long addr, int numpages) { return 0; }
> > > >  #endif
> > > >
> > > >  int set_direct_map_invalid_noflush(struct page *page);
> > > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > > index b722c5bf892c..abfbdc8cfef3 100644
> > > > --- a/arch/riscv/kernel/setup.c
> > > > +++ b/arch/riscv/kernel/setup.c
> > > > @@ -123,3 +123,12 @@ static int __init topology_init(void)
> > > >       return 0;
> > > >  }
> > > >  subsys_initcall(topology_init);
> > > > +
> > > > +void free_initmem(void)
> > > > +{
> > > > +     unsigned long init_begin = (unsigned long)__init_begin;
> > > > +     unsigned long init_end = (unsigned long)__init_end;
> > > > +
> > > > +     set_memory_default(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
> > >
> > > And what does "default" imply?
> > > Maybe set_memory_rw() would better name ...
> > >
> > > > +     free_initmem_default(POISON_FREE_INITMEM);
> > > > +}
> > >
> > > ...
> > >
> > > > diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> > > > index 19fecb362d81..04f3fc16aa9c 100644
> > > > --- a/arch/riscv/mm/pageattr.c
> > > > +++ b/arch/riscv/mm/pageattr.c
> > > > @@ -128,6 +128,12 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
> > > >       return ret;
> > > >  }
> > > >
> > > > +int set_memory_default(unsigned long addr, int numpages)
> > > > +{
> > > > +     return __set_memory(addr, numpages, __pgprot(_PAGE_KERNEL),
> > > > +                         __pgprot(_PAGE_EXEC));
> > >
> > > ... because you'd need to find what _PAGE_KERNEL is, do bitwise ops and
> > > than find out that default is apparently RW :)
> > >
> >
> > Yeah. But We have explicitly disable the EXECUTE bit as these pages were marked
> > with RWX earlier. set_memory_rw makes sure that RW bits are set but
> > doesn't disable
> > the X bit.
>
> Maybe set_memory_rw_nx() then?
> Then there will be no ambiguity about what this function does.
>

Sure. I will do that in v2.

> Besides, having set_memory_default() and set_direct_map_default() with
> different masks would be confusing :)
>

Of course :).

> > > > +}
> > > > +
> > > >  int set_memory_ro(unsigned long addr, int numpages)
> > > >  {
> > > >       return __set_memory(addr, numpages, __pgprot(_PAGE_READ),
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > --
> > > Sincerely yours,
> > > Mike.
> > >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> >
> >
> > --
> > Regards,
> > Atish
>
> --
> Sincerely yours,
> Mike.



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
