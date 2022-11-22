Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1388C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 05:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHqu7tfx0dmNaEW8CEHA7ndAUWaCAFVKp7IyE4mlNEw=; b=MuHXYdRRK/tSZv
	11OIVAcMojZLfjLW7k/SZU76VoxCy+KlVHpGc05N/erXtK3X4nN2pCf0tbCtWmYShKOXHYjyR7dtN
	VICXcNx7qWWBjDEgfvrZowuDJuIeZtPH8FP9DvnjJ5qM9dYnAhN03yByMHVyAA9zelWCvbRZwjsNJ
	HrTJFDwM8FLFHQI2gshKSwQPGGmtj5Is/dnt01oajn5KWBZOMTjYg+5iTdyt/ye/xOa2bvYv9dUst
	OmOUz4HbfYjDgtFtND/OKBijKWTX5hKPrgEZv7OfvBEZfJSwijuD4w38sN8IEekmzra8BQ9ASJiVK
	H4Dehy4u/LtnohYMa5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxLxQ-004QDk-1S; Tue, 22 Nov 2022 05:36:32 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxLxN-004QAA-3J
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 05:36:30 +0000
Received: by mail-ot1-x32f.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so8684808oti.5
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 21:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i5qyeYsVmx6XhfZt4paEL95PnVohNk27++knFv/BVmU=;
        b=KN63+OhwilsyWIs3Ix3N08+28icP335y7QajHdzDMB50KfNfdj7civnR0ceKzd2jJH
         JHSud1kQ9O3GDRtMVBGG5jN1CaoMhvqljkwnpJ9496AwKSTZLWEq286LHFy+Zn3NLLHy
         oUOyD1Awx+2wbbiyeWbyaRyB/WLstJt5KjjQ6xcZV+LJPzOVUjg7O+pxrpGoKLFz20db
         oOve+lxyeTYSrl0ZfrsA+uSyB4EI5IG+m6x+7MmPtKBBw8k3qcm2BaBNOzbEDbatx6T2
         f2Hw4I9rt6u4MuvebLwfuxLO5knV9nK1wHqExaw4Kt4254XSny/4iOWmRqj03X+0tJf1
         i/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5qyeYsVmx6XhfZt4paEL95PnVohNk27++knFv/BVmU=;
        b=RGbl3FR6OYe/19bdymHRryIDFni4H0bP6SMmnXVOENvc60zi6dkPgAAPWrw9u1//cY
         ycC4YKXPb4h8qXHiLLrxmsN2xJd6+Biejog2UqeVBTCjPUgHQ2XIQoi8h+R8UxnjCGq0
         cbVPMJCvdpcyNcZNwZPo8SuP8Y0AaHu5BFNEw+GylaYm86iB41FWfftl++WYIL3te9RY
         DIV3USMJ0NN/buhwfopebmLnUlIFiaj7CCjCV30oIp71a2PzgiDQnIOzE2oDrIjukw4u
         vx2KEDuqkfWxYBpyaAkstsvdu3/OSBJwSLrEe25l7XUi8t8s757yCKovI9FNZiwZ01Xq
         70Ug==
X-Gm-Message-State: ANoB5pnl/ov/WoJKi+vLuESOqFc6F6+oKMX9Sy/SucthnqXKUav0rAeP
	7AifyznOaVfK5b/XwLXC5cOrqkt0AB4dO0teiG3aYg==
X-Google-Smtp-Source: AA0mqf4SqsUgk4Ll2Vp6cdBMpsPY2pdXBHEOaPLJ82EcWt0/XAv2Ftta9n6K6Eo4FFzvuW+VaDb9RFommyqDRkve6Sw=
X-Received: by 2002:a9d:5e0f:0:b0:662:2458:3ef7 with SMTP id
 d15-20020a9d5e0f000000b0066224583ef7mr11466185oti.150.1669095386364; Mon, 21
 Nov 2022 21:36:26 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0Fs9ZVoRgtz92RgLnFPvgwUzCP_KpK9SCOiVsA-t3p3Q@mail.gmail.com>
 <mhng-3f44cc1f-7305-41c5-a1cf-dfed096bd364@palmer-ri-x1c9>
In-Reply-To: <mhng-3f44cc1f-7305-41c5-a1cf-dfed096bd364@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 22 Nov 2022 11:06:15 +0530
Message-ID: <CAK9=C2USZHdfBQrrgd2Rs3u3_gTyscpRgxvPU5P6ptOPu1+Axg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: anup@brainfault.org, Conor Dooley <conor@kernel.org>, rafael@kernel.org, 
	daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_213629_164124_4C252822 
X-CRM114-Status: GOOD (  35.70  )
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

On Tue, Nov 22, 2022 at 10:46 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> On Mon, 21 Nov 2022 19:45:07 PST (-0800), anup@brainfault.org wrote:
> > On Tue, Nov 22, 2022 at 2:27 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> >>
> >> From: Palmer Dabbelt <palmer@rivosinc.com>
> >>
> >> As per [1], whether or not the core can wake up from non-retentive
> >> suspend is a platform-specific detail.  We don't have any way to encode
> >> that, so just stop using them until we've sorted that out.
> >>
> >> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
> >> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > This is just unnecessary maintenance churn and it's not the
> > right way to go. Better to fix this the right way instead of having
> > a temporary fix.
> >
> > I had already sent-out a patch series 5 months back to describe
> > this in DT:
> > https://lore.kernel.org/lkml/20220727114302.302201-1-apatel@ventanamicro.com/
> >
> > No one has commented/suggested anything (except Samuel
> > Holland and Sudeep Holla).
>
> I see some comments from Krzysztof here
> <https://lore.kernel.org/lkml/7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org/>
> as well.  Looks like everyone is pointing out that having our CPU nodes
> encode timers is a bad idea, my guess is that they're probably right.

Adding a separate timer DT node, creates a new set of compatibility
issues for existing platforms. I am fine updating my series to have
separate timer DT node but do we want to go in this direction ?

Even if ARM has a separate timer DT node, the timers are still part
of the CPU. It depends on how we see the DT bindings aligning with
actual HW.

>
> > Please review this series. I can quickly address comments to
> > make this available for Linux-6.2. Until this series is merged,
> > the affected platforms can simply remove non-retentive suspend
> > states from their DT.
>
> That leaves us with a dependency between kernel versions and DT
> bindings: kernels with the current driver will result in broken systems
> with the non-retentive suspend states in the DT they boot with when
> those states can't wake up the CPU.

This is not a new problem we are facing. Even in the ARM world,
the DT bindings grew organically over time based on newer platform
requirements.

Now that we have a platform which does not want the time
C3STOP feature, we need to first come-up with DT bindings
to support this platform instead of temporarily disabling
features which don't work on this platform.

Regards,
Anup

>
> > With all due respect, NACK to this patch from my side.
> >
> > Regards,
> > Anup
> >
> >>
> >> ---
> >>
> >> This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
> >> Events are stopped during CPU suspend"), which fixes suspend on the D1
> >> but breaks timers everywhere.
> >> ---
> >>  drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> >> index 05fe2902df9a..9d1063a54495 100644
> >> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> >> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> >> @@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
> >>         if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
> >>             state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
> >>                 return false;
> >> +
> >> +       /*
> >> +        * Whether or not RISC-V systems deliver interrupts to harts in a
> >> +        * non-retentive suspend state is a platform-specific detail.  This can
> >> +        * leave the hart unable to wake up, so just mark these states as
> >> +        * unsupported until we have a mechanism to expose these
> >> +        * platform-specific details to Linux.
> >> +        */
> >> +       if (state & SBI_HSM_SUSP_NON_RET_BIT)
> >> +               return false;
> >> +
> >>         return true;
> >>  }
> >>
> >> --
> >> 2.38.1
> >>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
