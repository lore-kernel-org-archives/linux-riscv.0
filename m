Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2119CC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 16:42:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E171420658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 16:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xiFps/Hn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="J/GEN9w2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E171420658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=AC4x9iB7Pifn7mgNq4m60HoJWN9N7G3V8ShANc8QS1Y=; b=xiFps/Hn+AkezvugX5tsAVhdR
	gE2qCZYWIbRYuk8ZQVQf6l+ZrvYw4CvOl74RXGJA6uXita8TyP5wSOIztBO01iuE3KWgs11K6cUHE
	DmcPOOnp55HJ4eYPvp0RG4J+piG+tzyjlGSy5oc3R4HU4f7ZFyOCtsFjrF7kkfEFD6wMmeIn2gibx
	QixFKo5K3WqtkrAEyFug6Qh1rWl75zG/9PncatR2zqGQQme9hp29BeGJi5IniSzOGzcXSU5rnWhR/
	++p0irNMPwZ02FwyFBCExIiUrtKd3HnGVVpcLLPduUTmNNCbDCaPtk4ExHrE2oNm79Fn+m0Jv7OgF
	W/Zx9AqeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvkTk-0004wD-4n; Wed, 15 Jul 2020 16:41:56 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvkTi-0004vj-18
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 16:41:55 +0000
Received: by mail-pj1-x1044.google.com with SMTP id ls15so3339199pjb.1
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 09:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IFg/qhe1tGFGIq2mHH09v79WVNDPxkqeT0VsNSpiH00=;
 b=J/GEN9w2DoHbfbWbq7Z+bwLnKFcOto9RohyZHGFkxV9D9zS2Q+8KVoLfGlszJuSQ6N
 HL0zNA8G4MOc+zJshPkeUHK7dzlKNwY66UigPV54aziKn6gBID1FdMvpIy8+K4LsxYIq
 LpDj2i364KsquRrVbf8RbQ4wsrYFVeoMjYO9NgD+CQBDg92DEN5/3n8uYX2nuRwqGOmn
 OS0/bVUWwX8uwEIr/J8g13U984xOSOq1SAAf6lYbMr0a+8WHPs80A/wBvRw06GYdhiUl
 Lti5UyXaFAeGmvm93fdWHEBdWDZDpXeWtCft+dYYyNDMN0EsAYOu0S8iKdZD3cu9dJlp
 rQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IFg/qhe1tGFGIq2mHH09v79WVNDPxkqeT0VsNSpiH00=;
 b=ljOSIwOnGk9JxyCfsUcXtoViARyHHvi7NBksJ2xBTx/7nx7IUutSrbdNhZvZIVvWmG
 1QZkusXE6Xw4C2hrmSIZ1GLVpDLpkv7k8f5EiIhLoTQa3fRMs6WslGhRES1LyqmLtDhU
 QGfirqk8HC5OsWqA/lK7wiH5tCgeIsdcLwEAIXIpFlYrS95NM+pb3z20x6rVoC6B9fuA
 0IAsFvDhC6Zp7wlAKj46H74YdqGeOQZlwt3lZcOwBuhE8U/XLYxsVuVV//8TA5scrPo0
 FAwXsUM7oj+lGHnwITP4UIZpEP4jfB8FAA5W17vkVU5A02TYCc6kT2fF5I3ElhymqRr4
 3o0g==
X-Gm-Message-State: AOAM531+oNEVX+bu7hTnHeT11LXJ9GXt4YwomhYoS/y7n1TUUKMvVEC2
 sfDK2WrxzyvTYDcfkcTj89pIIg==
X-Google-Smtp-Source: ABdhPJwf4iZPOyrWQW+lXidhTAK1NDcipr63F1hVwh5G0N3eeeQzSwYkEi8WyffBv3V5UIDjYdjHhg==
X-Received: by 2002:a17:902:d685:: with SMTP id
 v5mr255563ply.117.1594831311455; 
 Wed, 15 Jul 2020 09:41:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j2sm173066pjy.1.2020.07.15.09.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 09:41:50 -0700 (PDT)
Date: Wed, 15 Jul 2020 09:41:50 -0700 (PDT)
X-Google-Original-Date: Wed, 15 Jul 2020 09:41:48 PDT (-0700)
Subject: Re: [PATCH] asm-generic/mmiowb: Get cpu in mmiowb_set_pending
In-Reply-To: <20200715144806.GA3443108@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Will Deacon <willdeacon@google.com>
Message-ID: <mhng-d6287ba3-3b57-431e-b0e7-9d17b514748c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_124154_242310_37236EB0 
X-CRM114-Status: GOOD (  39.80  )
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
Cc: linux-arch@vger.kernel.org, kernel@esmil.dk, Arnd Bergmann <arnd@arndb.de>,
 guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020 07:48:06 PDT (-0700), Will Deacon wrote:
> On Wed, Jul 15, 2020 at 07:03:49AM -0700, Palmer Dabbelt wrote:
>> On Wed, 15 Jul 2020 03:42:46 PDT (-0700), Will Deacon wrote:
>> > Hmm. Although I _think_ something like the diff below ought to work, are you
>> > sure you want to be doing MMIO writes in preemptible context? Setting
>> > '.disable_locking = true' in 'sifive_gpio_regmap_config' implies to me that
>> > you should be handling the locking within the driver itself, and all the
>> > other regmap writes are protected by '&gc->bgpio_lock'.
>>
>> I guess my goal here was to avoid fixing the drivers: it's one thing if it's
>> just broken SiFive drivers, as they're all a bit crusty, but this is blowing up
>> for me in the 8250 driver on QEMU as well.  At that point I figured there'd be
>> an endless stream of bugs around this and I'd rather just.
>
> Right, and my patch should solve that.
>
>> > Given that riscv is one of the few architectures needing an implementation
>> > of mmiowb(), doing MMIO in a preemptible section seems especially dangerous
>> > as you have no way to ensure completion of the writes without adding an
>> > mmiowb() to the CPU migration path (i.e. context switch).
>>
>> I was going to just stick one in our context switching code unconditionally.
>> While we could go track cumulative writes outside the locks, the mmiowb is
>> essentially free for us because the one RISC-V implementation treats all fences
>> the same way so the subsequent store_release would hold all this up anyway.
>>
>> I think the right thing to do is to add some sort of arch hook right about here
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index cfd71d61aa3c..14b4f8b7433f 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -3212,6 +3212,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
>> 	prev_state = prev->state;
>> 	vtime_task_switch(prev);
>> 	perf_event_task_sched_in(prev, current);
>> +	finish_arch_pre_release(prev);
>> 	finish_task(prev);
>> 	finish_lock_switch(rq);
>> 	finish_arch_post_lock_switch();
>>
>> but I was just going to stick it in switch_to for now... :).  I guess we could
>> also roll the fence up into yet another one-off primitive for the scheduler,
>> something like
>
> What does the above get you over switch_to()?
>
>> > diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
>> > index 9439ff037b2d..5698fca3bf56 100644
>> > --- a/include/asm-generic/mmiowb.h
>> > +++ b/include/asm-generic/mmiowb.h
>> > @@ -27,7 +27,7 @@
>> >  #include <asm/smp.h>
>> >
>> >  DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
>> > -#define __mmiowb_state()       this_cpu_ptr(&__mmiowb_state)
>> > +#define __mmiowb_state()       raw_cpu_ptr(&__mmiowb_state)
>> >  #else
>> >  #define __mmiowb_state()       arch_mmiowb_state()
>> >  #endif /* arch_mmiowb_state */
>> > @@ -35,7 +35,9 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
>> >  static inline void mmiowb_set_pending(void)
>> >  {
>> >         struct mmiowb_state *ms = __mmiowb_state();
>> > -       ms->mmiowb_pending = ms->nesting_count;
>> > +
>> > +       if (likely(ms->nesting_count))
>> > +               ms->mmiowb_pending = ms->nesting_count;
>>
>> Ya, that's one of the earlier ideas I had, but I decided it doesn't actually do
>> anything: if we're scheduleable then we know that pending and count are zero,
>> thus the check isn't necessary.  It made sense late last night and still does
>> this morning, but I haven't had my coffee yet.
>
> What it does is prevent preemptible writeX() from trashing the state on
> another CPU, so I think it's a valid fix. I agree that it doesn't help
> you if you need mmiowb(), but then that _really_ should only be needed if
> you're holding a spinlock. If you're doing concurrent lockless MMIO you
> deserve all the pain you get.
>
> I don't get why you think the patch does nothing, as it will operate as
> expected if writeX() is called with preemption disabled, which is the common
> case.

Aside from PREEMPT_RT, I don't understand how you can be scheduled onto a CPU
that has a non-zero nesting_count.  Doesn't that mean that the CPU you're
scheduled on to is itself holding a spinlock, and therefor can't be scheduled
on?

Sure, some interrupt could come in the middle, but it's still going to see the
non-zero nesting_count left over from the spinlock being held and therefor will
avoid trashing the accumulated mmiowb.  As far as I can tell everything then
proceeds acceptably: when the interrupt unlocks it'll do an mmiowb (whether it
did an IO or not), which is sufficient to ensure that the IO from the
interrupted code is completed before the unlock from that code.

I must be missing something here?

>> I'm kind of tempted to just declare "mmiowb() is fast on RISC-V, so let's do it
>> unconditionally everywhere it's necessary".  IIRC that's essentially true on
>> the existing implementation, as it'll get rolled up to any upcoming fence
>> anyway.  It seems like building any real machine that relies on the orderings
>> provided by mmiowb is going to have an infinate rabbit hole of bugs anyway, so
>> in that case we'd just rely on the hardware to elide the now unnecessary fences
>> so we'd just be throwing static code size at this wacky memory model and then
>> forgetting about it.
>
> If you can do that, that's obviously the best approach.
>
>> I'm going to send out a patch set that does all the work I think is necessary
>> to avoid fixing up the various drivers, with the accounting code to avoid
>> mmiowbs all over our port.  I'm not sure I'm going to like it, but I guess we
>> can argue as to exactly how ugly it is :)
>
> Ok.
>
> Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
