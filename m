Return-Path: <SRS0=fari=BR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F8EC433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2020 05:01:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1821E20866
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2020 05:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IH5Qf36a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2cOQrf2x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1821E20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4FILgY+y7h3EntiRV01/LTw/ubeFyg3rA0hMb4jDw2o=; b=IH5Qf36aAriOdItr03QHtCgZB
	g1eH60E/h5PzeuaRLK2RpoTqb4AywEt7tS1wNEP7/iYeUdEC7p8EgNm8VXIHuup2HSHhgqN2tAySO
	KGDAoSMFntig2NR1o50Y13EYksDYHN1GBKgharx011AQIkTRtdHHGckR8Pt5RxgfKRkklzC8vG+xt
	VLSoUPaSw8HmBJTBMnmt6uiYW3a1sI7kkC1tdL0zJMikuUxbvsImnE0UVoEoQObppqpIL7/Nscpo9
	+Uy/4YvbwI/J91dXuMUnoWAK3/klQ/l2R7Uij+81kq0Cu8tedCoExVJmQ3dA4aeYZzjp6bcgG8BeK
	1Ny9mcxpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3uVL-0003jU-7g; Fri, 07 Aug 2020 05:01:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3uVI-0003iy-JM
 for linux-riscv@lists.infradead.org; Fri, 07 Aug 2020 05:01:17 +0000
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2D0F22CF7
 for <linux-riscv@lists.infradead.org>; Fri,  7 Aug 2020 05:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596776475;
 bh=HD6vTGnXl6/pG5exVdRXbejpCLV0GwIQV7nrCK1GhP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2cOQrf2xk7KzxrENeDKfitodVX53N2CZ6GNv5a/qfgghpAibxxZfMIGd4L0nk5IJm
 lqeCGAj1bxYkhLxOho3SKIDAo1nj6UK54+tRgntR0sXVxCGunnGyDzE5w5tDbEkV7A
 z0HrrdTCTKFl3cJV8/CL7vP85cjWIdbWuC/euDhM=
Received: by mail-lj1-f170.google.com with SMTP id v9so817522ljk.6
 for <linux-riscv@lists.infradead.org>; Thu, 06 Aug 2020 22:01:14 -0700 (PDT)
X-Gm-Message-State: AOAM530OqtX6UZUExs7HqFvZdueSsdqFVFRcVRPa85N+h9eiWqGXclCv
 rgP5B5rUJmbm0NuE3xPhLA+AGrB+CxppU1HVwIc=
X-Google-Smtp-Source: ABdhPJyIVJE52Hoz3nwVyEJTCxq+8qBwABTrh+dnKpij088pCkpR2PeuwxtHs4X0SUNxkBoVmMqKltoHT6j3oj6No+g=
X-Received: by 2002:a2e:9e0d:: with SMTP id e13mr5442996ljk.441.1596776473117; 
 Thu, 06 Aug 2020 22:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <1596725454-16245-1-git-send-email-guoren@kernel.org>
 <20200806114850.051f84d0@oasis.local.home>
 <CAJF2gTRufu561K_8p6KS0C=2xTq+YdOfGLbFqkuuiapSk3_cAQ@mail.gmail.com>
 <20200807000145.3d8abc81@oasis.local.home>
In-Reply-To: <20200807000145.3d8abc81@oasis.local.home>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 7 Aug 2020 13:01:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQjYyNnhg8KhFEm6MwOCb=c0hNsSq=HOeuSCrOzR9Qf0Q@mail.gmail.com>
Message-ID: <CAJF2gTQjYyNnhg8KhFEm6MwOCb=c0hNsSq=HOeuSCrOzR9Qf0Q@mail.gmail.com>
Subject: Re: [PATCH] ftrace: Fixup lockdep assert held of text_mutex
To: Steven Rostedt <rostedt@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_010116_891761_5F976AF0 
X-CRM114-Status: GOOD (  33.56  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 7, 2020 at 12:01 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 7 Aug 2020 10:59:16 +0800
> Guo Ren <guoren@kernel.org> wrote:
> > >
> > > This looks like a bug in the lockdep_assert_held() in whatever arch
> > > (riscv) is running.
> > Seems you think it's a bug of arch implementation with the wrong usage
> > of text_mutex?
> >
> > Also @riscv maintainer,
> > How about modifying it in riscv's code? we still need to solve it.
> >
> > ----------------
> > diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> > index ace8a6e..fb266c3 100644
> > --- a/arch/riscv/include/asm/ftrace.h
> > +++ b/arch/riscv/include/asm/ftrace.h
> > @@ -23,6 +23,12 @@ static inline unsigned long
> > ftrace_call_adjust(unsigned long addr)
> >
> >  struct dyn_arch_ftrace {
> >  };
> > +
> > +#ifdef CONFIG_DYNAMIC_FTRACE
> > +struct dyn_ftrace;
> > +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
> > +#define ftrace_init_nop ftrace_init_nop
> > +#endif
> >  #endif
> >
> >  #ifdef CONFIG_DYNAMIC_FTRACE
> > diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> > index 2ff63d0..9e9f7c0 100644
> > --- a/arch/riscv/kernel/ftrace.c
> > +++ b/arch/riscv/kernel/ftrace.c
> > @@ -97,6 +97,17 @@ int ftrace_make_nop(struct module *mod, struct
> > dyn_ftrace *rec,
> >         return __ftrace_modify_call(rec->ip, addr, false);
> >  }
> >
> > +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> > +{
> > +       int ret;
> > +
> > +       mutex_lock(&text_mutex);
> > +       ret = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
>
> Looking at x86, we have the following code:
>
> static int ftrace_poke_late = 0;
>
> int ftrace_arch_code_modify_prepare(void)
>     __acquires(&text_mutex)
> {
>         /*
>          * Need to grab text_mutex to prevent a race from module loading
>          * and live kernel patching from changing the text permissions while
>          * ftrace has it set to "read/write".
>          */
>         mutex_lock(&text_mutex);
>         ftrace_poke_late = 1;
>         return 0;
> }
>
> int ftrace_arch_code_modify_post_process(void)
>     __releases(&text_mutex)
> {
>         /*
>          * ftrace_make_{call,nop}() may be called during
>          * module load, and we need to finish the text_poke_queue()
>          * that they do, here.
>          */
>         text_poke_finish();
>         ftrace_poke_late = 0;
>         mutex_unlock(&text_mutex);
>         return 0;
> }
>
> And if ftrace_poke_late is not set, then ftrace_make_nop() does direct
> modification (calls text_poke_early(), which is basically a memcpy).
>
> This path doesn't have any checks against text_mutex being held,
> because it only happens at boot up.
The solution is ok for me, but I want to get riscv maintainer's
opinion before the next patch.
@Paul Walmsley
@Palmer Dabbelt

>
> > +       mutex_unlock(&text_mutex);
> > +
> > +       return ret;
> > +}
> > +
> >  int ftrace_update_ftrace_func(ftrace_func_t func)
> >  {
> >         int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
> > -------------------
> >
> > > > --- a/kernel/trace/ftrace.c
> > > > +++ b/kernel/trace/ftrace.c
> > > > @@ -26,6 +26,7 @@
> > > >  #include <linux/uaccess.h>
> > > >  #include <linux/bsearch.h>
> > > >  #include <linux/module.h>
> > > > +#include <linux/memory.h>
> > > >  #include <linux/ftrace.h>
> > > >  #include <linux/sysctl.h>
> > > >  #include <linux/slab.h>
> > > > @@ -6712,9 +6713,11 @@ void __init ftrace_init(void)
> > >
> > > ftrace_init() is called before SMP is initialized. Nothing else should
> > > be running here. That means grabbing a mutex is useless.
> > I don't agree, ftrace_init are modifying kernel text, so we should
> > give the lock of text_mutex to keep semantic consistency.
>
>
> Did you test your patch on x86 with lockdep?
Ah.., no :P

>
> ftrace_process_locs() grabs the ftrace_lock, which I believe is held
> when text_mutex is taken in other locations. So this will probably not
> work anyway.
>
> text_mutex isn't to be taken at the ftrace level.
Yes, currently it seemed only to be used by kernel/kprobes.c.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
