Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A2EC4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXN+VapwOGQ+FQKDKnNijk8u9c+j1Up7YDJlqwBpUY0=; b=FIJ9Yd2SOzdhGP
	QFToUXcmSbe97t24c/2m5dAAP/n4XFE9NIKT8xDZMgoWVFwhjYGmRQZESpNCTs3nzogBacykB58/H
	JFOMfGiaDljshJlv6X81DEecKBlJzWNSVOkZ2UMe3UxZJT7O4ErM+uRdYwebQo2BNuPoxJFbjkKHt
	89EKhq/JVwvgI034fjPFsYn2626s+tYMUEagfgq4fEOPbPlWoxkXrQ4M4A7D9AY/1/zx9UYlaEVmA
	vBZIcq7ok27cfgwy0BlPD3y94LY1RAI3c6oKE4fbaXkFHy2z00+E83C0ZcDPxy1Rxu7/f6Xg3dsNo
	a3ztWqBtEiJiSk7YeWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oywWi-006ehl-IU; Sat, 26 Nov 2022 14:51:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oywWf-006ege-5b
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 14:51:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83B1860B6E;
	Sat, 26 Nov 2022 14:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A162DC433D6;
	Sat, 26 Nov 2022 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669474286;
	bh=BfuxYgpWrdTWTjd62cAYWwFpTYRlVtSz0vlI7ZXJzQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBGdv/lDU1yte9kvp5ZMZnEHzHjfhvaKVQGRI/3kxI4+sR1zJiIjtv++w3c45axKf
	 qlRVPMQ2CkP6s6Wb8cn6cVbwQVGs62Uar91o09eX46/vhp5ynHY9sGS6hMt8mbLt1X
	 1kHNWTlkvCnYxlK+tW+I4yp4Ko+cN3QnehVy7oISh/obpDKuRL7HWpG5C+8HF1BRsR
	 vdjNwSSUh0r+Nt7Z/YCm/krsSD2j4hv52LcBl5FsRZMJdOo3AIrDJ8DrulFrORcbFa
	 bQufY7ze8Y1UXG61YPRR60T7jWQvfGP/2fOdp5+Yk4tarOZ+C32ZFlK8Cly7PrSXRW
	 OXsAcTjdoM8ng==
Date: Sat, 26 Nov 2022 14:51:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 3/3] clocksource: timer-riscv: Set
 CLOCK_EVT_FEAT_C3STOP based on DT
Message-ID: <Y4In6WWcY5yzWXRi@spud>
References: <20221125112105.427045-1-apatel@ventanamicro.com>
 <20221125112105.427045-4-apatel@ventanamicro.com>
 <Y4C/YOoHxX5dxwG3@wendy>
 <Y4FTQenbPLXy/9Bz@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4FTQenbPLXy/9Bz@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_065129_599757_530C06C6 
X-CRM114-Status: GOOD (  63.48  )
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

Hey all,

On Fri, Nov 25, 2022 at 11:44:01PM +0000, Conor Dooley wrote:
> On Fri, Nov 25, 2022 at 01:13:04PM +0000, Conor Dooley wrote:
> > On Fri, Nov 25, 2022 at 04:51:05PM +0530, Anup Patel wrote:
> > > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> > > when riscv,timer-cant-wake-up DT property is present in the RISC-V
> > > timer DT node.
> > > 
> > > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> > > based on RISC-V platform capabilities rather than having it set for
> > > all RISC-V platforms.
> > 
> > I need to go do some testing on what setting the C3STOP flag does on
> > platforms other than PolarFire SoC. I'm not sure that we should be
> > enabling this flag *at all* until we know that it does not break on
> > other platforms too.
> 
> I tried my fu540 & fu740 - both of those seem to exhibit broken timer
> behaviour with C3STOP set. Ethernet doesn't work upstream on the
> VisionFive, so I didn't go through the hassle of testing that - but I
> would imagine it is the same as the fu740. Whenever I get a VisionFive 2
> I'll give that a try too.
> 
> I did try the D1 (thanks for fielding my dumb questions Samuel) but I
> was not able to get the thing to boot if I disabled the sunxi timer :/
> Ethernet would not come up in U-Boot, clearly I did something not
> right..
> 
> Obviously we need to fix things & get it backported etc, so taking a
> pragmatic approach: I think that it is better to merge this stuff even
> though it there's a pretty good chance I think that it'll break the
> SBI timer on a D1, since it is not intended that it will be used.
> 
> It does make me worried about some of the other platforms though, like
> that Bouffalolabs SoC that Jisheng sent in a DT for. It's also using
> thead stuff so I wonder if it needs C3STOP too. I've added Jisheng to
> CC :)
> 
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > ---
> > >  drivers/clocksource/timer-riscv.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > > index a0d66fabf073..0c8bdd168a45 100644
> > > --- a/drivers/clocksource/timer-riscv.c
> > > +++ b/drivers/clocksource/timer-riscv.c
> > > @@ -28,6 +28,7 @@
> > >  #include <asm/timex.h>
> > >  
> > >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> > > +static bool riscv_timer_cant_wake_cpu;
> > >  
> > >  static int riscv_clock_next_event(unsigned long delta,
> > >  		struct clock_event_device *ce)
> > > @@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
> > >  
> > >  	ce->cpumask = cpumask_of(cpu);
> > >  	ce->irq = riscv_clock_event_irq;
> > > +	if (riscv_timer_cant_wake_cpu)
> > > +		ce->features |= CLOCK_EVT_FEAT_C3STOP;
> > >  	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
> > >  
> > >  	enable_percpu_irq(riscv_clock_event_irq,
> > > @@ -139,6 +142,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> > >  	if (cpuid != smp_processor_id())
> > >  		return 0;
> > >  
> > > +	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> > > +	if (child) {
> > > +		riscv_timer_cant_wake_cpu = of_property_read_bool(child,
> > > +						"riscv,timer-cant-wake-cpu");
> > > +		of_node_put(child);
> > > +	}
> > > +
> > >  	domain = NULL;
> > >  	child = of_get_compatible_child(n, "riscv,cpu-intc");
> > >  	if (!child) {
> 
> Anyway, the mechanics of the change here look good to me. The re-use of
> child is understandable but a little odd though, since riscv,timer /is
> not/ actually a child. That's relatively minor thing to change though.
> 
> I'm still not happy about turning on C3STOP when we have not figured out
> why it's breaking timer behaviour, but I think that's the lessor of two
> evils. Somewhat reluctantly:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> I'll try to spend some time looking into why it's broken.

Right, so some good news! After Samuel provided me with an openSBI setup
to actually test that timer & C3STOP is currently breaking the timers on
the D1 too! IOW the same timer durations are rounded up to the next
jiffy. He then suggested the fix for it too, see below the scissors :)

I think the revert in patch 1 is still needed (to preserve suspend
functionality for existing platforms) but the commit message needs to be
changed.

Perhaps, it should become:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This reverts commit 232ccac1bd9b5bfe73895f527c08623e7fa0752d.
> 
> On the subject of suspend, the RISC-V SBI spec states:
> > Request the SBI implementation to put the calling hart in a platform
> > specific suspend (or low power) state specified by the suspend_type
> > parameter. The hart will automatically come out of suspended state and
> > resume normal execution when it receives an interrupt or platform
> > specific hardware event.
> 
> This does not cover whether any given events actually reach the hart or
> not, just what the hart will do if it receives an event. On PolarFire
> SoC, and potentially other SiFive based implementations, events from the
> RISC-V timer do reach a hart during suspend. This is not the case for
> the implementation on the Allwinner D1 - there timer events are not
> received during suspend.
> 
> To prevent a device from entering an unrecoverable sleep state, the
> C3STOP feature was enabled unconditionally for the RISC-V timer driver.
> Unfortunately, this will have disabled sleep states used by existing
> platforms.
> 
> Fortunately, the D1 has a second timer, which is "currently used in
> preference to the RISC-V/SBI timer driver" so a revert here does not
> hurt operation of D1 in its current form.
> 
> Ultimately, a DeviceTree property (or node) will be added to encode the
> behaviour of the timers, but until then revert the addition of
> CLOCK_EVT_FEAT_C3STOP.
> 
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98/
> Link: https://lore.kernel.org/linux-riscv/bf6d3b1f-f703-4a25-833e-972a44a04114@sholland.org/
> Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
> CC: Samuel Holland <samuel@sholland.org>
> CC: Anup Patel <anup@brainfault.org>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Anyways, I think the new order of the patchset would have the below as
patch 1 & the current series on top of that. With those changes, I am
happy with the series & thanks for your (plural) help in figuring all of
this out!

Thanks,
Conor.

-- >8 --
From aaf20926a7645394eab4c4ad934e7f8c55e25981 Mon Sep 17 00:00:00 2001
From: Conor Dooley <conor.dooley@microchip.com>
Date: Sat, 26 Nov 2022 14:19:44 +0000
Subject: [PATCH] RISC-V: time: initialize broadcast hrtimer based clock event
 device

Similarly to commit 022eb8ae8b5e ("ARM: 8938/1: kernel: initialize
broadcast hrtimer based clock event device"), RISC-V needs to initiate
hrtimers before C3STOP can be used. Otherwise, the introduction of C3STOP
for the RISC-V arch timer in commit 232ccac1bd9b
("clocksource/drivers/riscv: Events are stopped during CPU suspend")
breaks timer behaviour, for example clock_nanosleep().

A test app that sleeps each cpu for 6, 5, 4, 3 ms respectively, HZ=250
& C3STOP enabled, the sleep times are rounded up to the next jiffy:
== CPU: 1 ==      == CPU: 2 ==      == CPU: 3 ==      == CPU: 4 ==
Mean: 7.974992    Mean: 7.976534    Mean: 7.962591    Mean: 3.952179
Std Dev: 0.154374 Std Dev: 0.156082 Std Dev: 0.171018 Std Dev: 0.076193
Hi: 9.472000      Hi: 10.495000     Hi: 8.864000      Hi: 4.736000
Lo: 6.087000      Lo: 6.380000      Lo: 4.872000      Lo: 3.403000
Samples: 521      Samples: 521      Samples: 521      Samples: 521

Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
Suggested-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/time.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 8217b0f67c6c..1cf21db4fcc7 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/of_clk.h>
+#include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <asm/sbi.h>
@@ -29,6 +30,8 @@ void __init time_init(void)
 
 	of_clk_init(NULL);
 	timer_probe();
+
+	tick_setup_hrtimer_broadcast();
 }
 
 void clocksource_arch_init(struct clocksource *cs)
-- 
2.38.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
