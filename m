Return-Path: <SRS0=E1a4=DE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9D7C4346E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:38:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E8B239EE
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:38:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AVk1b7EY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="RiWp7bza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E8B239EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jB2JxGo94pAnbdfjkZ9Rdjs4o24L3jMEtx050D20ZhU=; b=AVk1b7EYPymrVlLakxJmx/2pD
	ak+KenVcn6XTfdrsh2oss+ZClE5HTcp1SSPxt856zAiErajSyq0Kd9E6HPnIfRxz8pe/MLZkWZVku
	sxqnSpLf4jkqoA7ccLn+jf55BOwy7MiN7ovffbbZpDVhtuI5CKwnY7wOh8GKFHir0/c7KRHGpkSAO
	2DEuYw2Qw9YAZCctBBHk8/uIcLdwPrR+8SNqvWPJ2sK8ZRkiiuh034N+d1SM6sJYdStKP34pqNdXp
	GNUV2QHodBtNPdDpL52ZZb9gADewJkoD19e3MJnT/H6uKsvHhXgd04wt22zvZsGhpLma9MrErkk+8
	vSG1wCmhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMPOL-0000aN-JN; Sun, 27 Sep 2020 05:38:33 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMPOJ-0000a0-3o
 for linux-riscv@lists.infradead.org; Sun, 27 Sep 2020 05:38:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id k18so3311299wmj.5
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 22:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZCfebmeIyQM8Y/MGP8rYATaRiT/OcK0QURRwQB2nGD8=;
 b=RiWp7bza8WWGrzKDwE7UTtZxN4Dno//C5p0F6OPIop77Th0P7xLbMAItUCMNkniyjl
 40gNuRoXhGYgagR5IUOziTUbFM13yfMpvWCKGNRxZQUHIryxydfHj7AIaA35NFkIom2h
 yLuYMvKnmcR8M+cYySisgmkgn0tRNIAHYTFaMoazE8pOaidQpAl3evzc8+ZqydDmYvfd
 cGhCyjHUfTARELvsG7phubW/wbCTE4ATdWyWUQsQIlZ37CPzW6/M3YL6C2mmLnzl4EO3
 xoxXLHu+iLLMdmN7kUvtbquwVZS7fKC1KS4AFBspElx1U/4RbPmkqSHgyW3zJeW23OI/
 EQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZCfebmeIyQM8Y/MGP8rYATaRiT/OcK0QURRwQB2nGD8=;
 b=NMRAQrOAraGh9eW5VAJGGrZEXjy36QXMSkstd8yfHDZj/aA6VsOC3Bd/uyx+eYKUry
 a25HhjasCv95pk6buVus9Y06yV7lvyM7xSr3YJiC6YPb+LjnMW+Eo97LnWsBmWIncxF1
 Bn+rkzpgWuR185vFYHaQNfXZyLmdnQJGxmC83GpNhBzbUcO8muGb2UIFHAwz0MIK3LcO
 382i1YDdrJXAykOZIwOhzsvqlPEEIPncDtrb/BSPFzvuEOnR8OvJETvLEwNPWiBcg4/h
 5bOgjqCabvy6f3llTVzrXdkPzwuxU8og6qUYY0MD2Q1tXIhPuZkeohM66rGvcl1lsWM2
 wO3g==
X-Gm-Message-State: AOAM531LY8ZjboQ28IHPQBSW+zGrFvG2owsXZbshKR5aYeczPouECKv5
 M2T0aX/zwawvp8arZ1jbwouVEIwEaYgAtTbDOLTRfQ==
X-Google-Smtp-Source: ABdhPJzcSZYowLUeEtgs7Yq0yFbU1X/2LLoJ8I3s8qUjfYVf0CVYCVuPVGr8tDNA8DdroS0gDhDvpYknyaeVFp5ux14=
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr5662256wmj.134.1601185109900; 
 Sat, 26 Sep 2020 22:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <4950cd11fcf66bc3606f309d6289577b5dc65b2e.camel@wdc.com>
 <mhng-bcea0448-fc43-406d-a56c-53e16306e12d@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-bcea0448-fc43-406d-a56c-53e16306e12d@palmerdabbelt-glaptop1>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Sep 2020 11:08:17 +0530
Message-ID: <CAAhSdy1EeeNcyHbk-MN+auKX+mZmvF=W=S-UPuRhrqVBjch4ow@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Check clint_time_val before use
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_013831_157725_0DFB3C4B 
X-CRM114-Status: GOOD (  34.99  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Sep 27, 2020 at 5:50 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Sat, 26 Sep 2020 03:31:29 PDT (-0700), Damien Le Moal wrote:
> > On Sat, 2020-09-26 at 15:51 +0530, Anup Patel wrote:
> >> The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> >> because the get_cycles() and friends are called very early from
> >> rand_initialize() before CLINT driver is probed. To fix this, we
> >> should check clint_time_val before use in get_cycles() and friends.
>
> I don't think this is the right way to solve that problem, as we're essentially
> just lying about the timer rather than informing the system we can't get
> timer-based entropy right now.  MIPS is explicit about this, I don't see any
> reason why we shouldn't be as well.
>
> Does this fix the boot issue (see below for the NULL)?  There's some other
> random-related arch functions so this might not be quite the right way to do
> it.
>
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index 7f659dda0032..7e39b0068932 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -33,6 +33,18 @@ static inline u32 get_cycles_hi(void)
>  #define get_cycles_hi get_cycles_hi
>  #endif /* CONFIG_64BIT */
>
> +/*
> + * Much like MIPS, we may not have a viable counter to use at an early point in
> + * the boot process.  Unfortunately we don't have a fallback, so instead we
> + * just return 0.
> + */
> +static inline unsigned long random_get_entropy(void)
> +{
> +       if (unlikely(clint_time_val == NULL))
> +               return 0;
> +       return get_cycles();
> +}
> +
>  #else /* CONFIG_RISCV_M_MODE */
>
>  static inline cycles_t get_cycles(void)
>
> >> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> >> for M-mode systems")
> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >> ---
> >> Changes since v1:
> >>  - Explicitly initialize clint_time_val to NULL in CLINT driver to
> >>    avoid hang on Kendryte K210
> >> ---
> >>  arch/riscv/include/asm/timex.h    | 12 +++++++++---
> >>  drivers/clocksource/timer-clint.c |  2 +-
> >>  2 files changed, 10 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> >> index 7f659dda0032..6e7b04874755 100644
> >> --- a/arch/riscv/include/asm/timex.h
> >> +++ b/arch/riscv/include/asm/timex.h
> >> @@ -17,18 +17,24 @@ typedef unsigned long cycles_t;
> >>  #ifdef CONFIG_64BIT
> >>  static inline cycles_t get_cycles(void)
> >>  {
> >> -    return readq_relaxed(clint_time_val);
> >> +    if (clint_time_val)
> >> +            return readq_relaxed(clint_time_val);
> >> +    return 0;
> >>  }
> >>  #else /* !CONFIG_64BIT */
> >>  static inline u32 get_cycles(void)
> >>  {
> >> -    return readl_relaxed(((u32 *)clint_time_val));
> >> +    if (clint_time_val)
> >> +            return readl_relaxed(((u32 *)clint_time_val));
> >> +    return 0;
> >>  }
> >>  #define get_cycles get_cycles
> >>
> >>  static inline u32 get_cycles_hi(void)
> >>  {
> >> -    return readl_relaxed(((u32 *)clint_time_val) + 1);
> >> +    if (clint_time_val)
> >> +            return readl_relaxed(((u32 *)clint_time_val) + 1);
> >> +    return 0;
> >>  }
> >>  #define get_cycles_hi get_cycles_hi
> >>  #endif /* CONFIG_64BIT */
> >> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> >> index d17367dee02c..8dbec85979fd 100644
> >> --- a/drivers/clocksource/timer-clint.c
> >> +++ b/drivers/clocksource/timer-clint.c
> >> @@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
> >>  static unsigned int clint_timer_irq;
> >>
> >>  #ifdef CONFIG_RISCV_M_MODE
> >> -u64 __iomem *clint_time_val;
> >> +u64 __iomem *clint_time_val = NULL;
>
> This one I definately don't get.  According the internet, the C standard says
>
>     If an object that has static storage duration is not initialized
>     explicitly, it is initialized implicitly as if every member that has
>     arithmetic type were assigned 0 and every member that has pointer type were
>     assigned a null pointer constant.
>
> so unless I'm missing something there shouldn't be any difference between these
> two lines.  When I just apply this I get exactly the same "objdump -dt" before
> and after.  I do see some difference in assembly, but only when I don't pass
> "-fno-common" and that ends up being passed during my Linux builds.

Even checkpatch complains about explicit NULL assignment to global variables.

I will send v3 with a different approach to fix this so hopefully with
v3 we will
not require explicit NULL assignment.

Regards,
Anup

>
> >>  #endif
> >>
> >>  static void clint_send_ipi(const struct cpumask *target)
> >
> > For Kendryte:
> >
> > Tested-by: Damien Le Moal <damien.lemoal@wdc.com>
> >
> > --
> > Damien Le Moal
> > Western Digital

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
