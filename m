Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206B2C433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 06:45:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D199A20663
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 06:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pqK9HZHv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="PNnTMFUa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D199A20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Is3O/IKL8Yqh9uaVqhQOY4/4+l04FTpS6fh+hgUvwRo=; b=pqK9HZHvv+c5k99ZbjO6Zq6JB
	79jBUjrPVDXTj96NbJX5FNHT6oadhaDPMiG1EXHBUR5QdLGdq7jAPcLUzEQ9NnBsqvOQZ27sPR2Zz
	h3EPejuu+6vl1gvXXkDqQrI7AHuW9w0cb6t8S2kRYLfbDr0kWKY9vD8l1KxpMN4lcUB15hvpMQJ2L
	bUZkEtAWUVR3ZN4BKhaZsIgZEupuJFjupIV+Gtx54u9/GMuvXIvepxQ3pqJb7ljxQW5zT0Zx0vedC
	hIaPpQm1FQhZuVQ5mA+BM0tTLKJIepoTOVAbOhqkRmHNFRF+kdrt86yaIgVOWUHv7u4ykmYw9EeeV
	MX65h+P1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvbAN-0003Mn-RY; Wed, 15 Jul 2020 06:45:19 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvbAL-0003LP-61
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 06:45:18 +0000
Received: by mail-pj1-x1041.google.com with SMTP id mn17so2603366pjb.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=UQyUA0ubFfxJmMbUnrymb8WI75k70w0u5d2M/oPKj6Q=;
 b=PNnTMFUaDmQdTMCr60s6MfOSKKoEQ/DKzp868LN+TIIFkgglr0MOVHKmjJtbMqmkOW
 PfuK1JiGS+WSaKtMlhsSix9IBoJw9L46Bm2MggFDU+Qn5FL1MbH9g+aBF+V8DNLiYq/7
 NaPPldghEKanAcYTmDWFcQjEsbUv5VpBpZ18rrNrtjqbnvRnVI7Wu9x6tzIw+VbH37n+
 DE6p4pzT11ikM+DyTgEYK3mTZBWQ5u8SvsOmvPnyVcq4jx5F48eR+2N+/k70MH7kP+NI
 9Q4Xgu0WQMhm961/5NycmlKvhz59aDN9GHWq3xgTFKy+Z033YSYJIgiMEf+Ht4nq3Ley
 CJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UQyUA0ubFfxJmMbUnrymb8WI75k70w0u5d2M/oPKj6Q=;
 b=SxMZRK3oAJQtZreIUdrbustiIhX7HvpOJqyxzzlTJYaD8T4WarEzzAbKPICkqCta3R
 8LJGMOBre7ksPYr4bsa6G11lcpG5GIrlibYsoMK53kbIAI76gRYxmEQHiFzCcFDW7PnN
 R1oAp5ei/E9sPqhoZfG2tINPL1FAjnMYUQIgwq01dS9s6u/vi/X/mC7JMTR3jUrOV42C
 QigXc6o7MewHNL1FM6T6vXasLoePQBJVIAmDUzn5BpDPVqklxRp90KYl7kR1nMSg86lE
 HV990BxefTD436xiEUUjogyTZI71FqB9xt5eWrjPDJZ9l/1HFBHgOczRkszwrPAdV9Op
 II0A==
X-Gm-Message-State: AOAM531srZDY7eWxw/xiHLcRvbqdvKjzB3jJup9lEeBJUuykfiGMOqo8
 LmbOBwH4jJQ0wIs48pLsmXCw/K2yIq0=
X-Google-Smtp-Source: ABdhPJwu0FzKuHfaAToD93LPsAJTFBqyDv6gPZzwiaevlrxB11POmiHnzDDtwjI6+tlPJ4ZiGI8Mcg==
X-Received: by 2002:a17:90a:3770:: with SMTP id
 u103mr9225390pjb.102.1594795512617; 
 Tue, 14 Jul 2020 23:45:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p1sm4473115pja.2.2020.07.14.23.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 23:45:11 -0700 (PDT)
Date: Tue, 14 Jul 2020 23:45:11 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Jul 2020 23:45:07 PDT (-0700)
Subject: Re: [PATCH] asm-generic/mmiowb: Get cpu in mmiowb_set_pending
In-Reply-To: <CANBLGcw8nVvshaOxiBO3zSpjE2oEmWE7C4vuvDXYheRdFVLK0A@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Will Deacon <willdeacon@google.com>, kernel@esmil.dk
Message-ID: <mhng-09237735-4773-4f28-bfb6-b619f1dd4e09@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_024517_331033_EF0730FB 
X-CRM114-Status: GOOD (  43.24  )
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
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 06 Jul 2020 01:08:24 PDT (-0700), kernel@esmil.dk wrote:
> On Mon, 6 Jul 2020 at 02:48, Guo Ren <guoren@kernel.org> wrote:
>> On Mon, Jul 6, 2020 at 1:09 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
>> >
>> > On Sun, 5 Jul 2020 at 17:52, Guo Ren <guoren@kernel.org> wrote:
>> > > On Sun, Jul 5, 2020 at 11:03 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>> > > > On Sun, 5 Jul 2020 at 16:44, Guo Ren <guoren@kernel.org> wrote:
>> > > > >
>> > > > > Hi Emil,
>> > > > >
>> > > > > On Sun, Jul 5, 2020 at 10:27 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>> > > > > >
>> > > > > > Without this enabling CONFIG_PREEMPT and CONFIG_DEBUG_PREEMPT
>> > > > > > results in many errors like this on the HiFive Unleashed
>> > > > > > RISC-V board:
>> > > > > >
>> > > > > > BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
>> > > > > > caller is regmap_mmio_write32le+0x1c/0x46
>> > > > > > CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-hfu+ #1
>> > > > > > Call Trace:
>> > > > > > [<ffffffe000201f6e>] walk_stackframe+0x0/0x7a
>> > > > > > [<ffffffe0005b290e>] dump_stack+0x6e/0x88
>> > > > > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
>> > > > > > [<ffffffe0005c4c26>] check_preemption_disabled+0xa4/0xaa
>> > > > > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
>> > > > > > [<ffffffe0004737c8>] regmap_mmio_write+0x26/0x44
>> > > > > > [<ffffffe0004715c4>] regmap_write+0x28/0x48
>> > > > > > [<ffffffe00043dccc>] sifive_gpio_probe+0xc0/0x1da
>> > > > > > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
>> > > > > > [<ffffffe000469054>] platform_drv_probe+0x24/0x52
>> > > > > > [<ffffffe000467e16>] really_probe+0x92/0x21a
>> > > > > > [<ffffffe0004683a8>] device_driver_attach+0x42/0x4a
>> > > > > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
>> > > > > > [<ffffffe0004683f0>] __driver_attach+0x40/0xac
>> > > > > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
>> > > > > > [<ffffffe000466a3e>] bus_for_each_dev+0x3c/0x64
>> > > > > > [<ffffffe000467118>] bus_add_driver+0x11e/0x184
>> > > > > > [<ffffffe00046889a>] driver_register+0x32/0xc6
>> > > > > > [<ffffffe00000e5ac>] gpiolib_sysfs_init+0xaa/0xae
>> > > > > > [<ffffffe0000019ec>] do_one_initcall+0x50/0xfc
>> > > > > > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
>> > > > > > [<ffffffe000001bea>] kernel_init_freeable+0x152/0x1da
>> > > > > > [<ffffffe0005c4d28>] rest_init+0xde/0xe2
>> > > > > > [<ffffffe0005c4d36>] kernel_init+0xa/0x11a
>> > > > > > [<ffffffe0005c4d28>] rest_init+0xde/0xe2
>> > > > > > [<ffffffe000200ff6>] ret_from_syscall_rejected+0x8/0xc
>> > > > > >
>> > > > > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> > > > > > ---
>> > > > > > This patch fixes it, but my guess is that it's not the right
>> > > > > > fix. Do anyone have a better idea?
>> > > > > >
>> > > > > >  include/asm-generic/mmiowb.h | 6 +++++-
>> > > > > >  1 file changed, 5 insertions(+), 1 deletion(-)
>> > > > > >
>> > > > > > diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
>> > > > > > index 9439ff037b2d..31a21cdfbbcf 100644
>> > > > > > --- a/include/asm-generic/mmiowb.h
>> > > > > > +++ b/include/asm-generic/mmiowb.h
>> > > > > > @@ -34,8 +34,12 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
>> > > > > >
>> > > > > >  static inline void mmiowb_set_pending(void)
>> > > > > >  {
>> > > > > > -       struct mmiowb_state *ms = __mmiowb_state();
>> > > > > > +       struct mmiowb_state *ms;
>> > > > > > +
>> > > > > > +       get_cpu();
>> > > > > > +       ms = __mmiowb_state();
>> > > > > >         ms->mmiowb_pending = ms->nesting_count;
>> > > > > > +       put_cpu();
>> > > > > >  }
>> > > > >
>> > > > > #define __mmiowb_state()        this_cpu_ptr(&__mmiowb_state)
>> > > > >
>> > > > > The ptr is a fixed address, so don't worry about the change, and just
>> > > > > use an atomic_read is enough.
>> > > > > static inline void mmiowb_set_pending(void)
>> > > > > {
>> > > > >         struct mmiowb_state *ms = __mmiowb_state();
>> > > > > -       ms->mmiowb_pending = ms->nesting_count;
>> > > > > +      ms->mmiowb_pending = atomic_read(ms->nesting_count);
>> > > > > }
>> > > >
>> > > > You may be right, but it doesn't fix the BUG. As far as I can tell it
>> > > > happens in __mmiowb_state() which expands through this_cpu_ptr and
>> > > > arch_raw_cpu_ptr to SHIFT_PERCPU_PTR(ptr, __my_cpu_offset), where
>> > > > __my_cpu_offset is per_cpu_offset(smp_processor_id()) and with
>> > > > CONFIG_DEBUG_PREEMPT smp_processor_id is actually
>> > > > debug_smp_processor_id, which eventually checks that preemption is
>> > > > disabled in check_preemption_disabled.
>> > > Thx for explaining.
>> > >
>> > > Seems we need to find who disable preemption during:
>> > > > > > [<ffffffe000201f6e>] walk_stackframe+0x0/0x7a
>> > > > > > [<ffffffe0005b290e>] dump_stack+0x6e/0x88
>> > > > > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
>> > > > > > [<ffffffe0005c4c26>] check_preemption_disabled+0xa4/0xaa
>> > > > > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
>> > > > > > [<ffffffe0004737c8>] regmap_mmio_write+0x26/0x44
>> > > > > > [<ffffffe0004715c4>] regmap_write+0x28/0x48
>> > > > > > [<ffffffe00043dccc>] sifive_gpio_probe+0xc0/0x1da
>> > > > > > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
>> > > > > > [<ffffffe000469054>] platform_drv_probe+0x24/0x52
>> > > > > > [<ffffffe000467e16>] really_probe+0x92/0x21a
>> > > > > > [<ffffffe0004683a8>] device_driver_attach+0x42/0x4a
>> > > > > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
>> > > > > > [<ffffffe0004683f0>] __driver_attach+0x40/0xac
>> > > > > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
>> > > > > > [<ffffffe000466a3e>] bus_for_each_dev+0x3c/0x64
>> > > > > > [<ffffffe000467118>] bus_add_driver+0x11e/0x184
>> > > > > > [<ffffffe00046889a>] driver_register+0x32/0xc6
>> > > > > > [<ffffffe00000e5ac>] gpiolib_sysfs_init+0xaa/0xae
>> > > > > > [<ffffffe0000019ec>] do_one_initcall+0x50/0xfc
>> >
>> > Hmm.. the problem is that preemption is *not* disabled when
>> > smp_processor_id is called, right?
>>
>> Yes!
>>
>> smp_processor_id is defined as:
>>
>>  * This is the normal accessor to the CPU id and should be used
>>  * whenever possible.
>>  *
>>  * The CPU id is stable when:
>>  *
>>  *  - IRQs are disabled;
>>  *  - preemption is disabled;
>>  *  - the task is CPU affine.
>>  *
>>  * When CONFIG_DEBUG_PREEMPT; we verify these assumption and WARN
>>  * when smp_processor_id() is used when the CPU id is not stable.
>>
>> So regmap_write->regmap_mmio_write should be PREEMPT disabled in
>> sifive_gpio_probe().
>
> Ah! Sorry, now I think I understand. So you're saying that the real
> problem is that the driver framework should have disabled preemption
> before calling any .probe functions, but for some reason that doesn't
> happen on RISC-V?

I think it's actually an issue with the generic mmiowb stuff and that we should
just elide the check.  I'm adding Will, for context.  I'll send out a patch.

>> > > do_one_initcall's preempt_count = 0
>> > > (gdb) bt
>> > > #0  do_one_initcall (fn=0xffffffe000003b0e
>> > > <trace_init_flags_sys_exit>) at init/main.c:1190
>> > > #1  0xffffffe000001f20 in do_pre_smp_initcalls () at ./include/linux/init.h:131
>> > >
>> > > #2  kernel_init_freeable () at init/main.c:1494
>> > > #3  0xffffffe0009d6ea6 in kernel_init (unused=<optimized out>) a
>> > >    t init/main.c:1399
>> > > #4  0xffffffe000201c2a in handle_exception () at arch/riscv/kernel/entry.S:188
>> > > Backtrace stopped: frame did not save the PC
>> > > (gdb) p *(struct task_struct*)$tp
>> > > $2 = {thread_info = {flags = 0, preempt_count = 0,
>> > >
>> > > Can you debug like this ? to see which function's preempt_count = 0 in
>> > > your backtrace.
>> >
>> > I'm sorry, I'm not exactly sure what you mean by this, but it seems to
>> > happen multiple places in writel-like functions. Both at probe time in
>> > sifive_gpio_probe and sifive_spi_probe and when the spi driver is
>> > running. Here is the full log:
>> >
>> I mean Use jtag + gdb to detect  preempt_count = 0 in parent function.
>> I do this in qemu :)
>>
>> If couldn't use jtag, then just add printk preempt_count trace, or kgdb.
>
> Right, thanks. I'll look into it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
