Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4343DC433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 08:44:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13A1E20706
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 08:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EXNLDriC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4MsVlSu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13A1E20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qxsuxM+Lu5MF9eKqSfSi4ttoCuaU12qwntG7nH6Ixm4=; b=EXNLDriCyueiqmvspBpBBQJDs
	YmtDNd0iDmXT7zj3JyrqWRBv+747ZSUNAlsziUXG8j9Ow3reNQnAM+m1VtHvP3AZ20/NxzvhNAgEA
	ZI9mj2cGBapgSQmPHs5B77uHysRjT+i0Bb1oUMag2PUOJH32b48UrAUOjhLv6PQPtfNQBoYQx5d+a
	E8vsmK4SmHDtz6Oh7YxXonDOacK0lRxqA/spZvMDa1sCoDjT7SaKwWsvtHXVO3fCXqRWI24w8r8O0
	MrKenlqXwpV32kkEYAkXbtJdcG4LszSwGvV7jSo3aXjxtftjP0zBFTewuCwL+tmXANlbGVcZ/DRhy
	WWQTwxpIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAUZT-000074-VI; Tue, 25 Aug 2020 08:44:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAUZQ-000065-Uu
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 08:44:46 +0000
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB7A820706
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598345084;
 bh=kaOTTUQdjWlozOOBQ4U6g31BVnjoouYMUPoBQ38XHhY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O4MsVlSuxynmsXLN798DjHzrjjgTKAlx/NppPE6Uw2C+ch1DiptbGLd9hZiPYJRRc
 09bmRSRm2G2N7nMM993DTWtu2R3zFvvg0270wU8UaQCFhwq2cZeyPbFbJKUq+42YfN
 zk9XX0KGXcqA17FO7vDPiUj9YgEa7m5l+4KCUvig=
Received: by mail-lj1-f181.google.com with SMTP id g6so12819971ljn.11
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 01:44:43 -0700 (PDT)
X-Gm-Message-State: AOAM532B6P+eG5TQDIg4xInsPq7OSzn9WWvHAoj+qbB2f4QmtdiOxfSu
 W5Gh2rHo6g8cL7I3qpZONwk7SX2KUjV84TAFUZ0=
X-Google-Smtp-Source: ABdhPJyRNpTvcteOh5XqRI/LK8iZUDL/mvDPFP4NcAtHkAW6lGF5HG8k2jBFGIXuZIRiTC5sKKjFqPlVBa748hKTDRQ=
X-Received: by 2002:a2e:9bc1:: with SMTP id w1mr3935622ljj.79.1598345082310;
 Tue, 25 Aug 2020 01:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200825002121.1779187-1-palmerdabbelt@google.com>
 <CAJF2gTTRSLio+7KM2SoUq3xxZWYxAkpuzCZzZugSke9eCpqc1g@mail.gmail.com>
In-Reply-To: <CAJF2gTTRSLio+7KM2SoUq3xxZWYxAkpuzCZzZugSke9eCpqc1g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 Aug 2020 16:44:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRSHOccKXd2FReB70LbpcdzFye4ww2g2wEPB91OoC_EFg@mail.gmail.com>
Message-ID: <CAJF2gTRSHOccKXd2FReB70LbpcdzFye4ww2g2wEPB91OoC_EFg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Take text_mutex in ftrace_init_nop()
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_044445_123070_3CE7CA37 
X-CRM114-Status: GOOD (  32.64  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I'll test it later, and include it in my patchset series.

On Tue, Aug 25, 2020 at 4:43 PM Guo Ren <guoren@kernel.org> wrote:
>
> Thx Palmer,
>
> The patch is what I need.
>
> Acked-by: Guo Ren <guoren@kernel.org>
>
> On Tue, Aug 25, 2020 at 8:29 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> >
> > Without this we get lockdep failures.  They're spurious failures as SMP isn't
> > up when ftrace_init_nop() is called.  As far as I can tell the easiest fix is
> > to just take the lock, which also seems like the safest fix.
> >
> > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> > I haven't actually tested this, as I don't have a workload that exercises
> > ftrace in a meaningful fashion, but this seems pretty safe to me.  It smells to
> > me like we should handle this in the generic code (make the generic
> > ftrace_init_nop() call brand new
> > ftrace_arch_code_modify_{prepare,post_process}_init(), which default to calling
> > ftrace_arch_code_modify_{prepare,post_process}() or just juggling the lock
> > (depending on what most architectures are doing)), but this at least fixes the
> > issue on our end so it seems reasonable for now.
> >
> > Thinking about it: I guess if I just booted with ftrace and lockdep it'd catch
> > this issue, so that seems like an obvious test case to add.  If someone has an
> > easy way to exercise more ftrace stuff I'm happy to run that in addition.
> > ---
> >  arch/riscv/include/asm/ftrace.h |  7 +++++++
> >  arch/riscv/kernel/ftrace.c      | 19 +++++++++++++++++++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> > index ace8a6e2d11d..845002cc2e57 100644
> > --- a/arch/riscv/include/asm/ftrace.h
> > +++ b/arch/riscv/include/asm/ftrace.h
> > @@ -66,6 +66,13 @@ do {                                                                 \
> >   * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
> >   */
> >  #define MCOUNT_INSN_SIZE 8
> > +
> > +#ifndef __ASSEMBLY__
> > +struct dyn_ftrace;
> > +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
> > +#define ftrace_init_nop ftrace_init_nop
> > +#endif
> > +
> >  #endif
> >
> >  #endif /* _ASM_RISCV_FTRACE_H */
> > diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> > index 2ff63d0cbb50..99e12faa5498 100644
> > --- a/arch/riscv/kernel/ftrace.c
> > +++ b/arch/riscv/kernel/ftrace.c
> > @@ -97,6 +97,25 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
> >         return __ftrace_modify_call(rec->ip, addr, false);
> >  }
> >
> > +
> > +/*
> > + * This is called early on, and isn't wrapped by
> > + * ftrace_arch_code_modify_{prepare,post_process}() and therefor doesn't hold
> > + * text_mutex, which triggers a lockdep failure.  SMP isn't running so we could
> > + * just directly poke the text, but it's simpler to just take the lock
> > + * ourselves.
> > + */
> > +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> > +{
> > +       int out;
> > +
> > +       ftrace_arch_code_modify_prepare();
> > +       out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> > +       ftrace_arch_code_modify_post_process();
> > +
> > +       return out;
> > +}
> > +
> >  int ftrace_update_ftrace_func(ftrace_func_t func)
> >  {
> >         int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
> > --
> > 2.28.0.297.g1956fa8f8d-goog
> >
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
