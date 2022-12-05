Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1BEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBp3T7BBoU6zYTZB3R0Woz8k+VVBQxGFTEb5ozoZM4g=; b=zBdSJ+87AlRd7r
	hI/6U6Bzg0A4X55lFH2cynH0Xg1gT1an2MH7Nroiogu1215sX267i4TgqrLo75gFUIhR6B9UtYFc2
	sDESwRw8FYbqYRpA0sGaooDJJn8Vyv6Hef7t3HfC7LYErd0lvHdBsMQNjWmw1Sa27fgUVYsKKtmx2
	2RYlxtnebzYT4H7GRmYF4HjCm4MRAXS9Qeo9w/lqur3OdenPvBQfjWHvOIexeYeNyHMkF3XA1t/Nz
	UA6BPg8CmhjcOCdOcQ5XcGYbz1rtN2uRs5SFT5D/CSeMa+Bh7WX2LLbr0LtfoH6Q2VlaU4p+Rf2bB
	UZn7vIfTuTOa53nrLayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26vm-00GJh1-IU; Mon, 05 Dec 2022 08:34:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26vd-00GJK3-Qx
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 08:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670229261; x=1701765261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IATEYJx4a5AMyo7aV0mVnSZjiA+z3IBbzmRcgsGBH20=;
  b=1HUqJDwKFNMkckrt7WM6k3HsqemvIqteJ2jTcbgyGxNn2etL0g7FLnlk
   7Hsd3LomS0eu4t8utfnU2yEqcdkZMzRDp3n+UFNSFhhYKUgHolsWn0P+4
   mYbw1Ek8gn13NepkYhWlEv662oa28UB/4If4Bw50yjxb4cnGzlNQj9Pk1
   iuAxQvpTkvg7EBxlGat04kZUoj/ztQTqgVpNgtr2i3x7EQPJKQk3DphFZ
   aoCv/kgtaLne/NubTEYMKwp7+mxa7j/Bqt5iewNy4ZwjpqeMGgYVIYaWh
   AsDuickcvYOXur0wNkbZyopXyks/kf1PkQ4X3+qm/rGiIIYQU9oEJjcgt
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; 
   d="scan'208";a="190018603"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Dec 2022 01:34:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Dec 2022 01:34:15 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Dec 2022 01:34:12 -0700
Date: Mon, 5 Dec 2022 08:33:53 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Rob
 Herring <robh@kernel.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v5 3/3] clocksource: timer-riscv: Set
 CLOCK_EVT_FEAT_C3STOP based on DT
Message-ID: <Y42s8d+RSPMkrR6j@wendy>
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
 <20221201123954.1111603-4-apatel@ventanamicro.com>
 <20221202000603.GA1720201-robh@kernel.org>
 <CAK9=C2VbM+CP0Y9Xx-SM9O4TFrQmOKvVWy-u5mxdPxrhacK4JQ@mail.gmail.com>
 <Y40ueQiTZK6hi7RS@spud>
 <0515dc20-2e82-bd16-301a-6ffff010af13@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0515dc20-2e82-bd16-301a-6ffff010af13@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_003422_043005_811A075B 
X-CRM114-Status: GOOD (  45.16  )
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

On Mon, Dec 05, 2022 at 02:17:40AM -0600, Samuel Holland wrote:
> On 12/4/22 17:34, Conor Dooley wrote:
> > Hey Rob, Anup, Prabhakar,
> > 
> > On Fri, Dec 02, 2022 at 12:03:05PM +0530, Anup Patel wrote:
> >> On Fri, Dec 2, 2022 at 5:36 AM Rob Herring <robh@kernel.org> wrote:
> >>>
> >>> On Thu, Dec 01, 2022 at 06:09:54PM +0530, Anup Patel wrote:
> >>>> We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> >>>> when riscv,timer-cannot-wake-cpu DT property is present in the RISC-V
> >>>> timer DT node.
> >>>>
> >>>> This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> >>>> based on RISC-V platform capabilities rather than having it set for
> >>>> all RISC-V platforms.
> >>>>
> >>>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >>>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >>>> ---
> >>>>  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
> >>>>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> >>>> index 969a552da8d2..1b4b36df5484 100644
> >>>> --- a/drivers/clocksource/timer-riscv.c
> >>>> +++ b/drivers/clocksource/timer-riscv.c
> >>>> @@ -28,6 +28,7 @@
> >>>>  #include <asm/timex.h>
> >>>>
> >>>>  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> >>>> +static bool riscv_timer_cannot_wake_cpu;
> >>>>
> >>>>  static int riscv_clock_next_event(unsigned long delta,
> >>>>               struct clock_event_device *ce)
> >>>> @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
> >>>>  static unsigned int riscv_clock_event_irq;
> >>>>  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
> >>>>       .name                   = "riscv_timer_clockevent",
> >>>> -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> >>>> +     .features               = CLOCK_EVT_FEAT_ONESHOT,
> >>>
> >>> A platform that depended on CLOCK_EVT_FEAT_C3STOP being set will break
> >>> with this change because its existing DT will not have the new property.
> >>>
> >>> It needs to be the other way around which would effectively be the
> >>> existing 'always-on' property.
> >>
> >> There are no RISC-V platforms using C3STOP. The patch which
> >> added C3STOP has been reverted.
> >> (Refer, https://lore.kernel.org/lkml/a218ebf8-0fba-168d-6598-c970bbff5faf@sholland.org/T/)
> >>
> >> I just need to rebase this patch upon the C3STOP revert patch.
> > 
> > I guess you could say that the C3STOP addition was done spec-ulatively*,
> > as the platform that actually exhibits that behaviour does not use the
> > riscv-timer & its maintainer acked the revert (allwinner d1 family).
> 
> For clarity: that doesn't mean the platform will _never_ use the SBI
> timer facility, just that Linux happens to not use it right now.

Yeah sorry - should have been a bit clearer there. There's a few other
SoCs about that are using the thead cores, so I'd be "worried" that they
share the timer behaviour but do not have an alternative like you do on
the D1. That's part of what's kinda given me cold feet on the current
approach.

> > *The spec does not make any guarantees about whether events arrive
> > during suspend, only the behaviour *if* they arrive.
> > 
> > Switching the property to "always-on" would require retrofitting that
> > property to every other existing platform (and therefore regressing some
> > behaviour there, no?).
> > 
> > Most of the existing platforms are "toys" or demo platforms though, so
> > it would not, I guess, be the end of the world to do so. Doubly so since
> > none of them actually implement any sleep states that making it an
> > "always-on" property.
> 
> Specifically, only sleep states with a "local-timer-stop" property would
> be inhibited by the C3STOP flag, so there is only possibility of a
> regression if some DT declaring such a sleep state exists anywhere.
> 
> Regards,
> Samuel
> 
> > I've said since the start that defaulting to C3STOP is the "safer" thing
> > to do, and although we disagreed on this last time Anup, I think the
> > better outcome of someone missing a DT property is inaccessible sleep
> > states rather than going into sleep states they cannot get out of.
> > 
> > For PolarFire SoC, which I guess is one of the few "commerical"
> > platforms, I'd be willing to accept retrofitting, since we have not yet
> > implemented such sleep states yet.
> > 
> > Maybe Prabhakar knows whether the RZ/Five has either a) implemented
> > sleep states and b) which side of the "timer events arrive in suspend"
> > divide their platform lies on.
> > I'm particular interested here since that is not a SiFive core complex.
> > 
> > I would like to get DT maintainer approval of an approach here soon-ish
> > so that we can something sorted for the jh7110 stuff and for the
> > bouffalolabs SoC - the latter of which may very well be in the "no
> > events in suspend" camp as it also uses thead stuff.
> > 
> > Sorry for kinda rowing back on my previous acceptance of the approach,
> > but I am really between two minds on this.
> > 
> > Thanks,
> > Conor.
> > 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
