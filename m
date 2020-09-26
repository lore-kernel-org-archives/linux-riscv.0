Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C260CC4741F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 09:57:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 669B42311D
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 09:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wDWNeabl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="slrSgc1b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 669B42311D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NJqvsySe2xBJAAhrltXqbSH0aKbk/QSbA3AoEDzN94c=; b=wDWNeabl8N4OH0JK+munA6uJD
	v/sZz5quXKmhpQ/L2rGCwuj7VCEEJJhmk01MvyQ3KX6N+Wy9rkdhBJpgUx6L04fBTNTrwSCbPsp8E
	PlzH8jtf1npvs8jftxdIeN2IsIWRAYsIdAgXMbdwkTDRsLUn1qhyFJqNjIqMldDQhqqi33pHbtVfB
	8H2VQOe+cOb/C/L4GcygUVUvKpsCRT4j5xsoIVFMUmn6AuQ6ABOVVsZ66/BYV/5eWDdNj4gFnVIKN
	nEPE1XsbbpMYODEU2btzrk1gMXZpaXmahw6puKSxVRC0J2rzfr7yHf5lQCqcsBjUqkoQkPOBba1hh
	YQdOGjLeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM6xS-0006CH-NL; Sat, 26 Sep 2020 09:57:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM6xP-0006BM-Fc
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 09:57:32 +0000
Received: by mail-wm1-x343.google.com with SMTP id l15so1031220wmh.1
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7RiAAzjPvo//bkBjb7L92b9sRrqJWtIiA4pr+XMHBk=;
 b=slrSgc1bSJfkGs1cBAiYGxnx9x8rn5rWjkSmIYr5TVY4w8f+NAHhfUrRglPYBJy6Wl
 MfwttVheYGBpzoS7ygX8pCTc5DTiPd34B+RKmz1u0CtyUXmB4KyAbKhzOUAX/bvrRrvZ
 l3YnRrb0qIXpy2qif26lQUphbsqVPVZm//XzgFRoedPewA+rc0UW52hVDn9BLjUaZLtp
 67QPP2cvffaW9JNyghHL52FsF6tSn80Wva0ppmGozeuDDuZy0xgZIru6dHbXB0blWxdx
 RdBlychlkopKx8cCiIMrz5LGL7a4qfBQFD/BNTdjEgEYs79MDAH/KxEvg7jziuw33+YF
 uhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7RiAAzjPvo//bkBjb7L92b9sRrqJWtIiA4pr+XMHBk=;
 b=J56bFl4NjFbDGe9jb5uv1EVHOcH+hRXTi9smy67T1uP5A4zWYSc22tijja1hIQ+fKG
 Bqdb+x5Lro3Rf8y1OcKN9/er6mEJos7txSnH9ZfA9ZSH0HxqqAOsYIAUk9ouTL+/Fco1
 c5T1SwCP+XEr1JnK9bqOQb379r4Xhs7sw3RMQ2/fOmKfO1O4fuLvESXe2eBag/rxFOys
 a1I0BxJCigktzS/eCGucGC8Vr9ILM4R9Ye6uXsiI+ozOKpz2LMv5Bb5kRM9kOEi0obz6
 NgDRaSKVMCpDHsnJuvr1IpAoJmiaLeuxF1FxciZMAYvpPoOWOmAqv4zOcA41C7CpysyW
 6leA==
X-Gm-Message-State: AOAM533lFSXiCeCpCJAnXAF1u6S+jxYw1PSiOCVzMdTw5yUj5Rt4hrGP
 Wi+HzQEWgTrt6OmO/P474SLprmA0QAzjvprrs8SAsQ==
X-Google-Smtp-Source: ABdhPJzMIyVfRdC+xHpVsteyN8vvFBZh/hjPoOGslAfJmO8Z00Hkjt/ut6W72sQLm5ZHEPu5JIBqM4wNfH/XtaQSnE0=
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr2016423wmj.134.1601114247209; 
 Sat, 26 Sep 2020 02:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200926072750.807764-1-anup.patel@wdc.com>
 <1ee25b9bca3956d15a4a0dbf83f43d1ead454220.camel@wdc.com>
 <DM6PR04MB62017875C739101DF83280ED8D370@DM6PR04MB6201.namprd04.prod.outlook.com>
 <0e1990c99bf2a342cd2e78ec7ecfc2fdecaf67fb.camel@wdc.com>
In-Reply-To: <0e1990c99bf2a342cd2e78ec7ecfc2fdecaf67fb.camel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 26 Sep 2020 15:27:15 +0530
Message-ID: <CAAhSdy0-rj3LWf+Ma6PTJkiwnMPq-mRXdvR+esfZefhcZeyayA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_055731_633116_EE92C21F 
X-CRM114-Status: GOOD (  26.03  )
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
Cc: "palmerdabbelt@google.com" <palmerdabbelt@google.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 26, 2020 at 3:16 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On Sat, 2020-09-26 at 09:31 +0000, Anup Patel wrote:
> > > -----Original Message-----
> > > From: Damien Le Moal <Damien.LeMoal@wdc.com>
> > > Sent: 26 September 2020 14:55
> > > To: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > > palmerdabbelt@google.com; Anup Patel <Anup.Patel@wdc.com>;
> > > aou@eecs.berkeley.edu
> > > Cc: anup@brainfault.org; linux-riscv@lists.infradead.org; Atish Patra
> > > <Atish.Patra@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>; linux-
> > > kernel@vger.kernel.org
> > > Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
> > >
> > > On Sat, 2020-09-26 at 12:57 +0530, Anup Patel wrote:
> > > > The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> > > > because the get_cycles() and friends are called very early from
> > > > rand_initialize() before CLINT driver is probed. To fix this, we
> > > > should check clint_time_val before use in get_cycles() and friends.
> > > >
> > > > Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> > > > for M-mode systems")
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > > ---
> > > >  arch/riscv/include/asm/timex.h | 12 +++++++++---
> > > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/timex.h
> > > > b/arch/riscv/include/asm/timex.h index 7f659dda0032..52b42bb1602c
> > > > 100644
> > > > --- a/arch/riscv/include/asm/timex.h
> > > > +++ b/arch/riscv/include/asm/timex.h
> > > > @@ -17,18 +17,24 @@ typedef unsigned long cycles_t;  #ifdef
> > > > CONFIG_64BIT  static inline cycles_t get_cycles(void)  {
> > > > - return readq_relaxed(clint_time_val);
> > > > + if (clint_time_val)
> > > > +         return readq_relaxed(clint_time_val);
> > > > + return 0;
> > > >  }
> > > >  #else /* !CONFIG_64BIT */
> > > >  static inline u32 get_cycles(void)
> > > >  {
> > > > - return readl_relaxed(((u32 *)clint_time_val));
> > > > + if (clint_time_val)
> > > > +         return readl_relaxed(((u32 *)clint_time_val));
> > > > + return 0;
> > > >  }
> > > >  #define get_cycles get_cycles
> > > >
> > > >  static inline u32 get_cycles_hi(void)  {
> > > > - return readl_relaxed(((u32 *)clint_time_val) + 1);
> > > > + if (clint_time_val)
> > > > +         return readl_relaxed(((u32 *)clint_time_val) + 1);
> > > > + return 0
> > > >  }
> > > >  #define get_cycles_hi get_cycles_hi
> > > >  #endif /* CONFIG_64BIT */
> > >
> > > Applying this on top of rc6, I now get a hang on Kendryte boot...
> > > No problems without the patch on the other hand.
> >
> > Not sure about the issue with Kendryte but I get a crash on
> > QEMU virt machine without this patch.
>
> With this applied in addition to your patch, it works.
>
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-
> clint.c
> index d17367dee02c..8dbec85979fd 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
>  static unsigned int clint_timer_irq;
>
>  #ifdef CONFIG_RISCV_M_MODE
> -u64 __iomem *clint_time_val;
> +u64 __iomem *clint_time_val = NULL;
>  #endif
>
>  static void clint_send_ipi(const struct cpumask *target)

Ahh, clint_time_val is an uninitialized variable.

I will send a v2 with your SoB.

Regards,
Anup

>
> --
> Damien Le Moal
> Western Digital

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
