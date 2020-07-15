Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D68C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 14:04:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3C620658
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 14:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPrIs3gZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="A0NUmCxj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3C620658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mNc2Or5/+ALHTOLMuI5d8lDBvDtTtJbZqH7pUk4j1bw=; b=iPrIs3gZbxizUIm2FAkdaLU9w
	LyhcIaKqwNSCBX0joTweeh8FrWfa0VMh+c87zbpmhDnghvtk5dBLYXCxz82VSOZFdZ9YBLw+JMI7q
	FqPnOIfUiFw9LwXvCkOo2Fk+rfljAPla4HoGM1EruXn1vZVBP8EqIqzoWAf9DXwR29uNTjd76/3AG
	dD3sdvjLCBA/kYAwu6dwmynvVa7/jU4uGoBXJUd6SMD5TD0cUWbI3YJI7xbQTRgeHLmDdpVDawPVV
	gUHZQRMiDPfTzGt8KPGbJ/jDM2ezv9L1fA5rlHyhLoUh+CxcL3J2bCkFeJyrXxlYwzZRoVQ8+VliD
	da3oXqhLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvi0r-0007O7-83; Wed, 15 Jul 2020 14:03:57 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvi0n-0007Mf-Qv
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 14:03:55 +0000
Received: by mail-pf1-x442.google.com with SMTP id 1so2133548pfn.9
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KCbXhY3buvKTYcnZx2YmNOrnrb84retJ2GQkK6OGptM=;
 b=A0NUmCxjYWq/p++O+3geeLdTHdtbnpRc4vAqEkMCoHVsn1iWS6eB5uPkkkSIGwGtQu
 7ybMhoEWOTR2dC01ZdOV3492evLoq7C4FpOKabCwXvo6mjRf+svabx4FcAz9nJUt0ItU
 K/cB9Uqm81tHVxU2j4j3ueyrzeTTf+8ckXzHY2e2ZJp6OpLgBMxrdvt6X5F83U+tGlBp
 4TTedTmBK5SbKcYrWz/xbSRQKBd/j7ftwvtG8tB9vUhATbTG0KtEGOXQnH3jbP0fE/hc
 pTUQeNf2d+p23RKkdxXdUEliBS7fkNDM4LBRpriB9zyVBk356ncBQzM2hDwRtIdmo1pE
 nxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KCbXhY3buvKTYcnZx2YmNOrnrb84retJ2GQkK6OGptM=;
 b=q11O65W8Wbeh+ulmX81JgwEnYP/MuNswiIp4x8H9743cSTyz1gLxLJ3LpYZRMcKde/
 fLfpc1oE3ImsYDK9W/ELsJXdFf9r1mhN0oli9OWS+rrr/qWCj0bA0tpbSn6+xG4He4Z6
 skqvzyb7zC2VOv9iDallvWkOSEmMf3e40Zg6BL+2GXSFQfL5EH4mHtHcgj+bsZmLvmwF
 xXMAtrWGcqVGdtRA6ZCV6g3kTXGZrSeSWnAFNvIz9qEYHeqmP8GVU0Dee5Se88hW7rDi
 0+RW6cfdIhxkuygVYWHf1QzaYNiLVz7/w7lz/BX6vNm9sqRktO+isUdj7dL5AY3Z0Z8G
 M6tQ==
X-Gm-Message-State: AOAM533dfWA3aKpElaEnDThnBABSNSt63HIjNsSLiGTN30B4J6Cz33wR
 JaZSfn9HRv+JD1RSHIix/h4QhQ==
X-Google-Smtp-Source: ABdhPJwV027sukJtXM1zTUUNhkvdPz4xdnE3yMXEvZe3+73XT5bXd39rCOmy47iA6yhrYxOMVerfjw==
X-Received: by 2002:a63:3ece:: with SMTP id l197mr8397637pga.313.1594821831166; 
 Wed, 15 Jul 2020 07:03:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g7sm2212380pfh.210.2020.07.15.07.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 07:03:49 -0700 (PDT)
Date: Wed, 15 Jul 2020 07:03:49 -0700 (PDT)
X-Google-Original-Date: Wed, 15 Jul 2020 07:03:47 PDT (-0700)
Subject: Re: [PATCH] asm-generic/mmiowb: Get cpu in mmiowb_set_pending
In-Reply-To: <20200715104246.GA3143299@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Will Deacon <willdeacon@google.com>
Message-ID: <mhng-4a6c3dd9-b035-49c8-9e92-e881c0d1027c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_100353_903965_71F62BF3 
X-CRM114-Status: GOOD (  40.04  )
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

On Wed, 15 Jul 2020 03:42:46 PDT (-0700), Will Deacon wrote:
> On Tue, Jul 14, 2020 at 11:45:11PM -0700, Palmer Dabbelt wrote:
>> > > > > > > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
>> > > > > > > > [<ffffffe0005c4c26>] check_preemption_disabled+0xa4/0xaa
>> > > > > > > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
>> > > > > > > > [<ffffffe0004737c8>] regmap_mmio_write+0x26/0x44
>> > > > > > > > [<ffffffe0004715c4>] regmap_write+0x28/0x48
>> > > > > > > > [<ffffffe00043dccc>] sifive_gpio_probe+0xc0/0x1da
>> > > > > > > > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
>> > > > > > > > [<ffffffe000469054>] platform_drv_probe+0x24/0x52
>> > > > > > > > [<ffffffe000467e16>] really_probe+0x92/0x21a
>> > > > > > > > [<ffffffe0004683a8>] device_driver_attach+0x42/0x4a
>> > > > > > > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
>> > > > > > > > [<ffffffe0004683f0>] __driver_attach+0x40/0xac
>> > > > > > > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
>> > > > > > > > [<ffffffe000466a3e>] bus_for_each_dev+0x3c/0x64
>> > > > > > > > [<ffffffe000467118>] bus_add_driver+0x11e/0x184
>> > > > > > > > [<ffffffe00046889a>] driver_register+0x32/0xc6
>> > > > > > > > [<ffffffe00000e5ac>] gpiolib_sysfs_init+0xaa/0xae
>> > > > > > > > [<ffffffe0000019ec>] do_one_initcall+0x50/0xfc
>> > > >
>> > > > Hmm.. the problem is that preemption is *not* disabled when
>> > > > smp_processor_id is called, right?
>> > >
>> > > Yes!
>> > >
>> > > smp_processor_id is defined as:
>> > >
>> > >  * This is the normal accessor to the CPU id and should be used
>> > >  * whenever possible.
>> > >  *
>> > >  * The CPU id is stable when:
>> > >  *
>> > >  *  - IRQs are disabled;
>> > >  *  - preemption is disabled;
>> > >  *  - the task is CPU affine.
>> > >  *
>> > >  * When CONFIG_DEBUG_PREEMPT; we verify these assumption and WARN
>> > >  * when smp_processor_id() is used when the CPU id is not stable.
>> > >
>> > > So regmap_write->regmap_mmio_write should be PREEMPT disabled in
>> > > sifive_gpio_probe().
>> >
>> > Ah! Sorry, now I think I understand. So you're saying that the real
>> > problem is that the driver framework should have disabled preemption
>> > before calling any .probe functions, but for some reason that doesn't
>> > happen on RISC-V?
>>
>> I think it's actually an issue with the generic mmiowb stuff and that we should
>> just elide the check.  I'm adding Will, for context.  I'll send out a patch.
>
> Hmm. Although I _think_ something like the diff below ought to work, are you
> sure you want to be doing MMIO writes in preemptible context? Setting
> '.disable_locking = true' in 'sifive_gpio_regmap_config' implies to me that
> you should be handling the locking within the driver itself, and all the
> other regmap writes are protected by '&gc->bgpio_lock'.

I guess my goal here was to avoid fixing the drivers: it's one thing if it's
just broken SiFive drivers, as they're all a bit crusty, but this is blowing up
for me in the 8250 driver on QEMU as well.  At that point I figured there'd be
an endless stream of bugs around this and I'd rather just.

> Given that riscv is one of the few architectures needing an implementation
> of mmiowb(), doing MMIO in a preemptible section seems especially dangerous
> as you have no way to ensure completion of the writes without adding an
> mmiowb() to the CPU migration path (i.e. context switch).

I was going to just stick one in our context switching code unconditionally.
While we could go track cumulative writes outside the locks, the mmiowb is
essentially free for us because the one RISC-V implementation treats all fences
the same way so the subsequent store_release would hold all this up anyway.

I think the right thing to do is to add some sort of arch hook right about here

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index cfd71d61aa3c..14b4f8b7433f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3212,6 +3212,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	prev_state = prev->state;
 	vtime_task_switch(prev);
 	perf_event_task_sched_in(prev, current);
+	finish_arch_pre_release(prev);
 	finish_task(prev);
 	finish_lock_switch(rq);
 	finish_arch_post_lock_switch();

but I was just going to stick it in switch_to for now... :).  I guess we could
also roll the fence up into yet another one-off primitive for the scheduler,
something like

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9a2fbf98fd6f..9dcc35d37a99 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3074,7 +3074,7 @@ static inline void finish_task(struct task_struct *prev)
         *
         * Pairs with the smp_cond_load_acquire() in try_to_wake_up().
         */
-       smp_store_release(&prev->on_cpu, 0);
+       smp_store_release_and_mmiowb(&prev->on_cpu, 0);
 #endif
 }

but in the long term we'd probably want to elide the unnecessary mmiowb()s
which would result in some accounting code.

>
> Will
>
> --->8
>
> diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> index 9439ff037b2d..5698fca3bf56 100644
> --- a/include/asm-generic/mmiowb.h
> +++ b/include/asm-generic/mmiowb.h
> @@ -27,7 +27,7 @@
>  #include <asm/smp.h>
>
>  DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
> -#define __mmiowb_state()       this_cpu_ptr(&__mmiowb_state)
> +#define __mmiowb_state()       raw_cpu_ptr(&__mmiowb_state)
>  #else
>  #define __mmiowb_state()       arch_mmiowb_state()
>  #endif /* arch_mmiowb_state */
> @@ -35,7 +35,9 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
>  static inline void mmiowb_set_pending(void)
>  {
>         struct mmiowb_state *ms = __mmiowb_state();
> -       ms->mmiowb_pending = ms->nesting_count;
> +
> +       if (likely(ms->nesting_count))
> +               ms->mmiowb_pending = ms->nesting_count;

Ya, that's one of the earlier ideas I had, but I decided it doesn't actually do
anything: if we're scheduleable then we know that pending and count are zero,
thus the check isn't necessary.  It made sense late last night and still does
this morning, but I haven't had my coffee yet.

I'm kind of tempted to just declare "mmiowb() is fast on RISC-V, so let's do it
unconditionally everywhere it's necessary".  IIRC that's essentially true on
the existing implementation, as it'll get rolled up to any upcoming fence
anyway.  It seems like building any real machine that relies on the orderings
provided by mmiowb is going to have an infinate rabbit hole of bugs anyway, so
in that case we'd just rely on the hardware to elide the now unnecessary fences
so we'd just be throwing static code size at this wacky memory model and then
forgetting about it.

I'm going to send out a patch set that does all the work I think is necessary
to avoid fixing up the various drivers, with the accounting code to avoid
mmiowbs all over our port.  I'm not sure I'm going to like it, but I guess we
can argue as to exactly how ugly it is :)


>  }
>
>  static inline void mmiowb_spin_lock(void)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
