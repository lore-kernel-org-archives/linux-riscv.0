Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82852C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 01:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mb81FPzpnIypi3r1pyfe3xqVBKln4sQZvZb6x6FiPQI=; b=tE9VckmHa422NI
	qcyynI7ECmif8Eqit2a2LT6wj/Cc69Rk78OuDgSVqYccMA99L8Bww9EJSzW3b+QdNMVbOAOEPikEd
	6bW8ZR12LMkBAEjkBDiAvF3Z1kFSLytITEoMf97dHbpty/Or2FvkYwlPff4BVvpz6NDsCUvavsxCS
	uCu6eAh29SDgi7LG3sUcX7Wv/2bmgQInTzOvMf/jkV8ptWhsmWPOFQ6aFcw6Yh+WnBRWnjjcniGRY
	rO0eYI+cV0k+qYlQyUxCJuQ5BMqpQ3YiwnGlibX1/siyaQuw0ApwPLfmk5Cojg5nnXvGapTwvxBZQ
	I6eQJQjNssk7nEd9uPuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSKB-00H6FQ-3K; Tue, 20 Sep 2022 01:45:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaSK7-00H6Dw-J5
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 01:45:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BE552B823AD
	for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 01:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D06C43142
	for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663638315;
	bh=hM4ARRwu7HP3L22Jz7ahem9ASH5TM4RTeIReN46ib0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GK+KksYrXL4Ui2VP52zrPYdiVEstBK3nMfuUi+rtYNamsgNKbqqaulzkhPWE6zjdr
	 ycq9HWRHSg5D86Y5TGLNjonhwqX6bJ9musEyBzhR5wSmnyB2jUaYShH8CZlwQlV+Yi
	 ywibChefBfA6DMNmzn30SwPqghkoqKyCWk4e8tTSkHvMKYm+ObAP7CFdZQecJeEc2E
	 z24ZLh9N6C+/KVRayNZ5wpITp77mGFC3Jo+R/Kt5bf9KhL9OzLWrwOFPeOdNJGMVRs
	 EaWR2IK622Dhd8tuIFSJyjQ9K07AKl4m16ACYYFqXNlKVHCc+GRAm2zI6UjA39C81g
	 9qN8Vbu4saG7A==
Received: by mail-oi1-f177.google.com with SMTP id o184so1838929oif.13
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 18:45:15 -0700 (PDT)
X-Gm-Message-State: ACrzQf3zI2Ngu4BKCcelRwndtiO+IMxD7bgu+zqP2zEYUmTbygiHJFTn
	L6RPr62D1WiI9+yCIlKi+0RNYlfX/bc3MMukg5k=
X-Google-Smtp-Source: AMsMyM7uitoWQ2wP2lLplABVBobqc5ORHtBKx+vIP5fl4T3iv6x3SGzJf91sDczKyJfzzmEFljNZDO3ZNZVx2oQu7Jc=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr513697oiw.112.1663638314437; Mon, 19
 Sep 2022 18:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220918155246.1203293-1-guoren@kernel.org> <20220918155246.1203293-7-guoren@kernel.org>
 <YyhZfUi17TEaOLWv@hirez.programming.kicks-ass.net>
In-Reply-To: <YyhZfUi17TEaOLWv@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Sep 2022 09:45:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQxfuHVe=drT3tMCK4prULR5iPS6F++HTokswjD2yRZZQ@mail.gmail.com>
Message-ID: <CAJF2gTQxfuHVe=drT3tMCK4prULR5iPS6F++HTokswjD2yRZZQ@mail.gmail.com>
Subject: Re: [PATCH V5 06/11] entry: Prevent DEBUG_PREEMPT warning
To: Peter Zijlstra <peterz@infradead.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, mark.rutland@arm.com, zouyipeng@huawei.com, 
	bigeasy@linutronix.de, David.Laight@aculab.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_184519_930252_3DD4CA4F 
X-CRM114-Status: GOOD (  21.00  )
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

On Mon, Sep 19, 2022 at 7:59 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sun, Sep 18, 2022 at 11:52:41AM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > When DEBUG_PREEMPT=y,
> >       exit_to_user_mode_prepare
> >       ->tick_nohz_user_enter_prepare
> >         ->tick_nohz_full_cpu(smp_processor_id())
> >           ->smp_processor_id()
> >             ->debug_smp_processor_id()
> >               ->check preempt_count() then:
> >
> > [    5.717610] BUG: using smp_processor_id() in preemptible [00000000]
> > code: S20urandom/94
> > [    5.718111] caller is debug_smp_processor_id+0x24/0x38
> > [    5.718417] CPU: 1 PID: 94 Comm: S20urandom Not tainted
> > 6.0.0-rc3-00010-gfd0a0d619c63-dirty #238
> > [    5.718886] Hardware name: riscv-virtio,qemu (DT)
> > [    5.719136] Call Trace:
> > [    5.719281] [<ffffffff800055fc>] dump_backtrace+0x2c/0x3c
> > [    5.719566] [<ffffffff80ae6cb0>] show_stack+0x44/0x5c
> > [    5.720023] [<ffffffff80aee870>] dump_stack_lvl+0x74/0xa4
> > [    5.720557] [<ffffffff80aee8bc>] dump_stack+0x1c/0x2c
> > [    5.721033] [<ffffffff80af65c0>]
> > check_preemption_disabled+0x104/0x108
> > [    5.721538] [<ffffffff80af65e8>] debug_smp_processor_id+0x24/0x38
> > [    5.722001] [<ffffffff800aee30>] exit_to_user_mode_prepare+0x48/0x178
> > [    5.722355] [<ffffffff80af5bf4>] irqentry_exit_to_user_mode+0x18/0x30
> > [    5.722685] [<ffffffff80af5c70>] irqentry_exit+0x64/0xa4
> > [    5.722953] [<ffffffff80af52f4>] do_page_fault+0x1d8/0x544
> > [    5.723291] [<ffffffff80003310>] ret_from_exception+0x0/0xb8
> >
> > (Above is found in riscv platform with generic_entry)
> >
> > The smp_processor_id() needs irqs disable or preempt_disable, so use
> > preempt dis/in protecting the tick_nohz_user_enter_prepare().
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  kernel/entry/common.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> > index 063068a9ea9b..36e4cd50531c 100644
> > --- a/kernel/entry/common.c
> > +++ b/kernel/entry/common.c
> > @@ -194,8 +194,10 @@ static void exit_to_user_mode_prepare(struct pt_regs *regs)
> >
> >       lockdep_assert_irqs_disabled();
>
>     Observe ^^^^
Thanks! I would enable PROVE_LOCKING for test.

>
> >
> > +     preempt_disable();
> >       /* Flush pending rcuog wakeup before the last need_resched() check */
> >       tick_nohz_user_enter_prepare();
> > +     preempt_enable();
>
> This makes no sense; if IRQs are disabled, check_preemption_disabled()
> should bail early per:
>
>         if (irqs_disabled())
>                 goto out;
Ditto.


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
