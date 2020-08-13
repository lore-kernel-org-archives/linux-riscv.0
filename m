Return-Path: <SRS0=qf9j=BX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D9DC433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 05:13:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72697206DC
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 05:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8yerT3Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="zR2bfU+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72697206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=V1PrDrEiWQaStGDCFAwR3xuBqJCeR/0dkgaNCW4L6uk=; b=f8yerT3YOlLOMAZPRGNzab0dO
	Qwzhx0OmIQHx2fpJcG/oC24exc5smmMf5QM8/ZLb/OxshOHD49UN6aS8AKMqn2RTcwltqzzRKjnt5
	4y/1tc5kKPT2NSGSgWw7uz8d0xMr9mdmytxRJUrf9AlvsdRtJgVJDS3Yig+L5USpG8MNKTZ0TL6H8
	7ycIDWvjqe58sBeTAqTQY2JOer8py9mqwccPWB+zaAcUa5IsFGexYmLYpYbJffdYCN8JZlIET53gz
	BECta4GxrZmsugTKz0B2YV/HbCsagEU22C3LB+bAz/pskzk83+fIcwSlZSRSkmCtc1Ii5ssByQMWy
	I2GRzOYNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k65YP-0008N2-2h; Thu, 13 Aug 2020 05:13:29 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k65YM-0008MD-Fo
 for linux-riscv@lists.infradead.org; Thu, 13 Aug 2020 05:13:28 +0000
Received: by mail-pl1-x643.google.com with SMTP id f10so2105339plj.8
 for <linux-riscv@lists.infradead.org>; Wed, 12 Aug 2020 22:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+J8A0qF/eNe42BPDc+xMFoc9GcTD6VVzaJumEar2SQc=;
 b=zR2bfU+KPhwPWrAaEka7wqg4fbcY+CJtGs5VH5TN7eC9XPdneRbLFmgKDuwdEGZEkd
 iKF5arQVHJFrokETZHdZhjDq28L5ucSC2Km/IrQ93ZxQBjoVdIgpfHn3HO7W8OfGYUnj
 4XG0hqjFA4pz1L43K8NGXCZLvxeIggMc0oX7twkIYjhdGe1XpzMwaITtf0G9d+MLjZsj
 hUI9F+XUC9W277t1VloFb81EndIFF/0mNvO4GXJzIE/IaZnonp31b4M3h875MXXSdm+6
 +utAaaq5iKMCDW4w8te35PRDt0Tqy5eBENO/EfY0SbVoNv2L017aDVH1xxYKT6Ysmpx0
 iiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+J8A0qF/eNe42BPDc+xMFoc9GcTD6VVzaJumEar2SQc=;
 b=s1GloSeEgxkDhJHincsxeiDKRh9MDAQ+1N85GUkVLCZXHbWYcvhsYHG+t98oubLhQw
 wdaWLfk6RNWXQsvLGYp2dCbgVmHU/xy40Yb9Bt2N9tpYyEFfYCAZxvZX1d9GmVGzePBg
 arUMqMjr7+SdEsTgf3mC14qVrg5AmZKCBJM1Kdr9I18CQX4mywlzXDTL3UpaxnizyzRV
 tdWisGm+zlRJHwLGSUrr/C3q1d8S5vP0vaeIRVnjIWZnAjuKzbZoAZ4Jxa51ZZytJsL5
 jHXE7lVxue4VijkHsZ6l2FZLFI0XEp4PDD6FtXDi4UdcXBhrsbipvAGJ2+GkW+Ar9FY3
 ZwlQ==
X-Gm-Message-State: AOAM532ndtS2L2DjJ575W/v0hsfuHrHuFzfa5qiJIBspDg276l+ebi5N
 2jFfjMmR4+ruVbrt5qts3ka+5Q==
X-Google-Smtp-Source: ABdhPJyF6AYwTg19jJKmW4oQqCoviEKZqDJ+3nXP9DnLdpgpKoNaMloOaDfSPDQQEeQZrAHvs1F8jg==
X-Received: by 2002:a17:90a:fa11:: with SMTP id
 cm17mr3466801pjb.153.1597295600514; 
 Wed, 12 Aug 2020 22:13:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f63sm3821776pjk.53.2020.08.12.22.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 22:13:19 -0700 (PDT)
Date: Wed, 12 Aug 2020 22:13:19 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Aug 2020 22:13:18 PDT (-0700)
Subject: Re: [PATCH] ftrace: Fixup lockdep assert held of text_mutex
In-Reply-To: <CAJF2gTQjYyNnhg8KhFEm6MwOCb=c0hNsSq=HOeuSCrOzR9Qf0Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-609449f5-6f1e-4669-8cb0-f06493d58cf2@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_011326_542761_D25268F4 
X-CRM114-Status: GOOD (  36.99  )
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
Cc: guoren@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, mingo@redhat.com, rostedt@goodmis.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 06 Aug 2020 22:01:01 PDT (-0700), guoren@kernel.org wrote:
> On Fri, Aug 7, 2020 at 12:01 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>>
>> On Fri, 7 Aug 2020 10:59:16 +0800
>> Guo Ren <guoren@kernel.org> wrote:
>> > >
>> > > This looks like a bug in the lockdep_assert_held() in whatever arch
>> > > (riscv) is running.
>> > Seems you think it's a bug of arch implementation with the wrong usage
>> > of text_mutex?
>> >
>> > Also @riscv maintainer,
>> > How about modifying it in riscv's code? we still need to solve it.
>> >
>> > ----------------
>> > diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
>> > index ace8a6e..fb266c3 100644
>> > --- a/arch/riscv/include/asm/ftrace.h
>> > +++ b/arch/riscv/include/asm/ftrace.h
>> > @@ -23,6 +23,12 @@ static inline unsigned long
>> > ftrace_call_adjust(unsigned long addr)
>> >
>> >  struct dyn_arch_ftrace {
>> >  };
>> > +
>> > +#ifdef CONFIG_DYNAMIC_FTRACE
>> > +struct dyn_ftrace;
>> > +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>> > +#define ftrace_init_nop ftrace_init_nop
>> > +#endif
>> >  #endif
>> >
>> >  #ifdef CONFIG_DYNAMIC_FTRACE
>> > diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
>> > index 2ff63d0..9e9f7c0 100644
>> > --- a/arch/riscv/kernel/ftrace.c
>> > +++ b/arch/riscv/kernel/ftrace.c
>> > @@ -97,6 +97,17 @@ int ftrace_make_nop(struct module *mod, struct
>> > dyn_ftrace *rec,
>> >         return __ftrace_modify_call(rec->ip, addr, false);
>> >  }
>> >
>> > +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>> > +{
>> > +       int ret;
>> > +
>> > +       mutex_lock(&text_mutex);
>> > +       ret = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
>>
>> Looking at x86, we have the following code:
>>
>> static int ftrace_poke_late = 0;
>>
>> int ftrace_arch_code_modify_prepare(void)
>>     __acquires(&text_mutex)
>> {
>>         /*
>>          * Need to grab text_mutex to prevent a race from module loading
>>          * and live kernel patching from changing the text permissions while
>>          * ftrace has it set to "read/write".
>>          */
>>         mutex_lock(&text_mutex);
>>         ftrace_poke_late = 1;
>>         return 0;
>> }
>>
>> int ftrace_arch_code_modify_post_process(void)
>>     __releases(&text_mutex)
>> {
>>         /*
>>          * ftrace_make_{call,nop}() may be called during
>>          * module load, and we need to finish the text_poke_queue()
>>          * that they do, here.
>>          */
>>         text_poke_finish();
>>         ftrace_poke_late = 0;
>>         mutex_unlock(&text_mutex);
>>         return 0;
>> }
>>
>> And if ftrace_poke_late is not set, then ftrace_make_nop() does direct
>> modification (calls text_poke_early(), which is basically a memcpy).
>>
>> This path doesn't have any checks against text_mutex being held,
>> because it only happens at boot up.
> The solution is ok for me, but I want to get riscv maintainer's
> opinion before the next patch.
> @Paul Walmsley
> @Palmer Dabbelt

Sorry, I'm not really sure what's going on here.  I'm not really seeing code
that matches this in our port right now, so maybe this is aginst some other
tree?  If it's the RISC-V kprobes patch set then I was hoping to take a look at
that tomorrow (or I guess a bit earlier this week, but I had some surprise work
stuff to do).  IIRC there were a handful of races in the last patch set I saw,
but it's been a while so I don't remember for sure.

That said, I certainly wouldn't be surprised if there's a locking bug in our
ftrace stuff.  It'd be way easier for me to figure out what's going on if you
have a concrete suggestion as to how to fix the issues -- even if it's just a
workaround.

>
>>
>> > +       mutex_unlock(&text_mutex);
>> > +
>> > +       return ret;
>> > +}
>> > +
>> >  int ftrace_update_ftrace_func(ftrace_func_t func)
>> >  {
>> >         int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
>> > -------------------
>> >
>> > > > --- a/kernel/trace/ftrace.c
>> > > > +++ b/kernel/trace/ftrace.c
>> > > > @@ -26,6 +26,7 @@
>> > > >  #include <linux/uaccess.h>
>> > > >  #include <linux/bsearch.h>
>> > > >  #include <linux/module.h>
>> > > > +#include <linux/memory.h>
>> > > >  #include <linux/ftrace.h>
>> > > >  #include <linux/sysctl.h>
>> > > >  #include <linux/slab.h>
>> > > > @@ -6712,9 +6713,11 @@ void __init ftrace_init(void)
>> > >
>> > > ftrace_init() is called before SMP is initialized. Nothing else should
>> > > be running here. That means grabbing a mutex is useless.
>> > I don't agree, ftrace_init are modifying kernel text, so we should
>> > give the lock of text_mutex to keep semantic consistency.
>>
>>
>> Did you test your patch on x86 with lockdep?
> Ah.., no :P
>
>>
>> ftrace_process_locs() grabs the ftrace_lock, which I believe is held
>> when text_mutex is taken in other locations. So this will probably not
>> work anyway.
>>
>> text_mutex isn't to be taken at the ftrace level.
> Yes, currently it seemed only to be used by kernel/kprobes.c.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
