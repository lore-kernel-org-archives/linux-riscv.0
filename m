Return-Path: <SRS0=fari=BR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD45DC433DF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2020 04:02:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7997A22CBB
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2020 04:02:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v21O0WO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7997A22CBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Kvc21uwaAsHJ9Ikhgin5QZK6FPYW9tJLIwvw6+EE+4=; b=v21O0WO7FsyODTCrQZm8hOpRe
	NtMUNKfHAQYOtgk/KIZJ3g/tgE6z6ODK92BOTAwYFkraC0lOOmarDc2l1eUFP/CmK3Tj3Hs1lCWRO
	+HUhuBPJiI0cgnpuNN9UhiCGMqbT7JvtbWRgN9Fx4uLYaEI9xtVsmQTQ8uQ55doapidyHw1CPeD/I
	QAr0YMoIEQAoqU1QSbzabtaUDCyiaZPydGLwjiwolWEK4dGXI4w0aKK6YdZ8FZIMoBb3stPBvHF0n
	e6A5O4QpVQgLJ1Jn/R+fiC8lm1naDG8LVN0k5Wl7yptHuJBW9W7Z03PVnU1oEkE06dzEGRs9zD2Ov
	eK4XGzRKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3tZn-0007yV-6K; Fri, 07 Aug 2020 04:01:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3tZl-0007y0-5L
 for linux-riscv@lists.infradead.org; Fri, 07 Aug 2020 04:01:50 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEB152173E;
 Fri,  7 Aug 2020 04:01:46 +0000 (UTC)
Date: Fri, 7 Aug 2020 00:01:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] ftrace: Fixup lockdep assert held of text_mutex
Message-ID: <20200807000145.3d8abc81@oasis.local.home>
In-Reply-To: <CAJF2gTRufu561K_8p6KS0C=2xTq+YdOfGLbFqkuuiapSk3_cAQ@mail.gmail.com>
References: <1596725454-16245-1-git-send-email-guoren@kernel.org>
 <20200806114850.051f84d0@oasis.local.home>
 <CAJF2gTRufu561K_8p6KS0C=2xTq+YdOfGLbFqkuuiapSk3_cAQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_000149_362336_716D885A 
X-CRM114-Status: GOOD (  26.98  )
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

On Fri, 7 Aug 2020 10:59:16 +0800
Guo Ren <guoren@kernel.org> wrote:
> >
> > This looks like a bug in the lockdep_assert_held() in whatever arch
> > (riscv) is running.  
> Seems you think it's a bug of arch implementation with the wrong usage
> of text_mutex?
> 
> Also @riscv maintainer,
> How about modifying it in riscv's code? we still need to solve it.
> 
> ----------------
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index ace8a6e..fb266c3 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -23,6 +23,12 @@ static inline unsigned long
> ftrace_call_adjust(unsigned long addr)
> 
>  struct dyn_arch_ftrace {
>  };
> +
> +#ifdef CONFIG_DYNAMIC_FTRACE
> +struct dyn_ftrace;
> +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
> +#define ftrace_init_nop ftrace_init_nop
> +#endif
>  #endif
> 
>  #ifdef CONFIG_DYNAMIC_FTRACE
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 2ff63d0..9e9f7c0 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -97,6 +97,17 @@ int ftrace_make_nop(struct module *mod, struct
> dyn_ftrace *rec,
>         return __ftrace_modify_call(rec->ip, addr, false);
>  }
> 
> +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> +{
> +       int ret;
> +
> +       mutex_lock(&text_mutex);
> +       ret = ftrace_make_nop(mod, rec, MCOUNT_ADDR);

Looking at x86, we have the following code:

static int ftrace_poke_late = 0;

int ftrace_arch_code_modify_prepare(void)
    __acquires(&text_mutex)
{
	/*
	 * Need to grab text_mutex to prevent a race from module loading
	 * and live kernel patching from changing the text permissions while
	 * ftrace has it set to "read/write".
	 */
	mutex_lock(&text_mutex);
	ftrace_poke_late = 1;
	return 0;
}

int ftrace_arch_code_modify_post_process(void)
    __releases(&text_mutex)
{
	/*
	 * ftrace_make_{call,nop}() may be called during
	 * module load, and we need to finish the text_poke_queue()
	 * that they do, here.
	 */
	text_poke_finish();
	ftrace_poke_late = 0;
	mutex_unlock(&text_mutex);
	return 0;
}

And if ftrace_poke_late is not set, then ftrace_make_nop() does direct
modification (calls text_poke_early(), which is basically a memcpy).

This path doesn't have any checks against text_mutex being held,
because it only happens at boot up.

> +       mutex_unlock(&text_mutex);
> +
> +       return ret;
> +}
> +
>  int ftrace_update_ftrace_func(ftrace_func_t func)
>  {
>         int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
> -------------------
> 
> > > --- a/kernel/trace/ftrace.c
> > > +++ b/kernel/trace/ftrace.c
> > > @@ -26,6 +26,7 @@
> > >  #include <linux/uaccess.h>
> > >  #include <linux/bsearch.h>
> > >  #include <linux/module.h>
> > > +#include <linux/memory.h>
> > >  #include <linux/ftrace.h>
> > >  #include <linux/sysctl.h>
> > >  #include <linux/slab.h>
> > > @@ -6712,9 +6713,11 @@ void __init ftrace_init(void)  
> >
> > ftrace_init() is called before SMP is initialized. Nothing else should
> > be running here. That means grabbing a mutex is useless.  
> I don't agree, ftrace_init are modifying kernel text, so we should
> give the lock of text_mutex to keep semantic consistency.


Did you test your patch on x86 with lockdep?

ftrace_process_locs() grabs the ftrace_lock, which I believe is held
when text_mutex is taken in other locations. So this will probably not
work anyway.

text_mutex isn't to be taken at the ftrace level.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
