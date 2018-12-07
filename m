Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9FAC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 02:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A9D20882
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 02:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KmpyV+fk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ieOtFERH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1A9D20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcGLqfdyXdNLAG5kt9dJGQbtftT0iUeaygvWC9vm7v0=; b=KmpyV+fkyN9Qry
	BKrR9pLwdkPbQZHAtdQdUylzibjemlzPwDpFzm0N40s5z6R++mCPIMY3ttmGg08wtiexW06q1Q6T1
	M+fc/ljJzgk4Ygv+b4mphAse70YqmRtPn9Pc825TuZI+lr2LWDTdA8AMoF1VjkTvaZgPEy+G0JPcQ
	uPUwhowl+PHy6YnQCxAxqsX2O2S0ycwa7DdNAxG70NK1sEUUglpWE3QtVorgBX+qb7XQHLTgrA8Ow
	7xydFkykiZvqtj2xv57fRaTIIxND14sFpT+m1o/2qfYOFRFrykCmXHRlmvDbHJdod4O/BXj6CpVAi
	v3Q6AOavq08mhqvuudpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gV5um-0003yd-9E; Fri, 07 Dec 2018 02:30:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV5uf-0003xS-Hd
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 02:30:50 +0000
Received: by mail-wr1-x441.google.com with SMTP id q18so2350972wrx.9
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 18:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kyIUJyfH0fsnc29YOAnZAeFtg8S1AAXJx1uXbtvDs5Y=;
 b=ieOtFERHdhgYkSx5Jp3wMyQvcAPcDnsZ96zEVKrB5XGy1p6TvB8n4Uie+yBMz/oXlH
 6dyEpuVnKoaPXpdhSWxaX1zpMh5bqWUXU9gQjplVaidd/l129tV79y3D+NjA8HWvPktp
 WYbno9E8tN4J3P3ZNo4uZekQwp0WAyQhhLtZ0EOLzjlPb6Wm1L/ki1Zu/Fbn4Jri/4Fk
 mulZmRzC2DD7BoWGzMPaslLjawqkDPIsDVVGQek7+giPb+gddPTc1hvHhi1ol7wQ2z+n
 UVHv2SbQqqRE6ChjbWlh7A1ccurxqYOj57eTcRlyEtZHIjPmcSnADqVFcutk2fzqNjk2
 MJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kyIUJyfH0fsnc29YOAnZAeFtg8S1AAXJx1uXbtvDs5Y=;
 b=srkUUBHP1n90T4LTMZB9LTrXcHXZioKumtb+vdAAepQ/QgwhBCQqa2Iyd92TJbB4Pz
 pu1UIyjAya+A6lW0VSZVfzkKB+wmi219DFNd5CEEt7cgAlC97TpZE+8JDbUP/dR1AACy
 h11L/aqYSvkd4Me4fnhOws1xpsS4r59/zGc4h+gQ8TWIogKi6Ln6R7Pbej668fzhZPSg
 nl4kjO+3RXp75iK9xWN2Pcr/yXcDGKgivxJnegceSNmkoWUnA6NGcetIsM8x9HOAyGap
 NWBTxXDQ8G4OXgRFIeMX7ZNV2VHN3lqi1OHzA2cSVlPPDv+NS/TGGHWvQ9Q/mGBW/0ke
 Y0kQ==
X-Gm-Message-State: AA+aEWZ+Tu48HF3nD/OniI3Z0YKbRbuDgNWBPAI3sk37LMTjMlvOw+wV
 gh90yVFDE2mDj/YF2sqyVLLjAEqkEU7MMvBSBmZJAg==
X-Google-Smtp-Source: AFSGD/Xb0M7R+/40hXSK8QKEnSPKnMLN6zKkeVw/GycWY33wzQMt6M4ekQZENq2KYsDN3o1iFBmaCAtrN2UOkYSCjjc=
X-Received: by 2002:a5d:4ec4:: with SMTP id s4mr296187wrv.187.1544149832601;
 Thu, 06 Dec 2018 18:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20181203123524.11778-1-anup@brainfault.org>
 <mhng-41a72f59-6506-420f-a01e-b01c81ab6e33@palmer-si-x1c4>
In-Reply-To: <mhng-41a72f59-6506-420f-a01e-b01c81ab6e33@palmer-si-x1c4>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Dec 2018 07:57:26 +0530
Message-ID: <CAAhSdy2g_-kYYrW4VJffLPA8evK9mjby06izC6FmNkRe3SceSQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource: riscv_timer: Provide sched_clock
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_183045_586969_018787E9 
X-CRM114-Status: GOOD (  13.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 7, 2018 at 2:02 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 03 Dec 2018 04:35:24 PST (-0800), anup@brainfault.org wrote:
> > Currently, we don't have a sched_clock registered for RISC-V systems.
> > This means Linux time keeping will use jiffies (running at HZ) as the
> > default sched_clock.
> >
> > To avoid this, we explicity provide sched_clock using RISC-V rdtime
> > instruction (similar to riscv_timer clocksource).
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > ---
> >  drivers/clocksource/riscv_timer.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/riscv_timer.c
> > index 084e97dc10ed..431892200a08 100644
> > --- a/drivers/clocksource/riscv_timer.c
> > +++ b/drivers/clocksource/riscv_timer.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/cpu.h>
> >  #include <linux/delay.h>
> >  #include <linux/irq.h>
> > +#include <linux/sched_clock.h>
> >  #include <asm/smp.h>
> >  #include <asm/sbi.h>
> >
> > @@ -49,6 +50,11 @@ static unsigned long long riscv_clocksource_rdtime(struct clocksource *cs)
> >       return get_cycles64();
> >  }
> >
> > +static u64 riscv_sched_clock(void)
> > +{
> > +     return get_cycles64();
> > +}
> > +
> >  static DEFINE_PER_CPU(struct clocksource, riscv_clocksource) = {
> >       .name           = "riscv_clocksource",
> >       .rating         = 300,
> > @@ -97,6 +103,9 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >       cs = per_cpu_ptr(&riscv_clocksource, cpuid);
> >       clocksource_register_hz(cs, riscv_timebase);
> >
> > +     sched_clock_register(riscv_sched_clock,
> > +                     BITS_PER_LONG, riscv_timebase);
>
> Shouldn't this just be 64, not BITS_PER_LONG?  We have 64-bit counters on
> RV32I.

Ahh, yes. I got mislead by "mask" field of clocksource.

I will change this to 64 and add another patch on fix "mask" of
clocksource as well.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
