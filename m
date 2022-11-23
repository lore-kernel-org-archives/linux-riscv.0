Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9799DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 04:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAI6nISufF/xvhNwrv0y0Bw5jK39nVMk2dCTXhHQI4w=; b=UK7eLMjzB4qXXR
	D+s9uGu8otQ5onDpzNCwUIYOyMRhuO0n+hHTCgcnjY7emlUGOTsfvTfqQPl7DKxfAD677pp8YaS4z
	evIZUZpOsTVkFLPkxGbSMlUjE3BQ+4J1IMbljBMRlRM0F2qWvNLKrkC5e/08So9Q7dO3udYXrXHRJ
	ZwNWOJALbuutYXXqmltxekQ338Ev+tIbCE94fWavXaNgB1qKG4LPcvMGNAO8ZzGqtN3Ib/yRE0KhN
	XrGNVDKb7UOclYjtYQi5vaWuc/1SMCCVka/XUneObV7ImKGUuXhx+HPZVIcCDpoGpT9t5A2gTQmX3
	pitGCZxU+/iq3BbO/qSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxhLV-00DsJr-EF; Wed, 23 Nov 2022 04:26:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxhLS-00DsHJ-1y
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 04:26:48 +0000
Received: by mail-ej1-x636.google.com with SMTP id bj12so40066189ejb.13
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 20:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3EuOL+ghAt3LsHWBsR22c5MNj/lDkjJFSot/k6OsYDU=;
        b=c5Ej4bAc6C8zTSNMHVHXD4/ppV/i0GvlLzerVd07mpWd195+P2AviSWbSg1KKdyd3d
         jGKFztaaLDnvOE+UPLi5SbMDWJ012nwlmxEgR95vo5vZFpFSOgjz7yr6/QUUkkVwOQBy
         NZ79ZHAM18B5E/HgU0J696xaMmpa0srgus/i7FlO172p46CXoCoZ6w3TetDMICBjfmE2
         Cq7xNdhUGM4TSKNAZUZ3QdE9xImfyA7JUHfnmugB718Zna5nh7ZZouY6Mf6Qsi2M2/PZ
         Ha5dq6Eh20XO0NrBdJrFeJTQK1Fm0/njY5SAjVfUpdVI+5sTKvnAG5tGPjP72Hzve0PI
         zzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EuOL+ghAt3LsHWBsR22c5MNj/lDkjJFSot/k6OsYDU=;
        b=1r/2UikLqWYQbel+5ndjjCmZ4+SZJffNTVn4uaVm+K5H04QGimhKJuq4Eb5CinPRqu
         qFdw6dLswbAvr3eQFmYK2RQCMsVy4nQ/6vNAWPidL2jX6caiDsxu6Y4zbkyuUHZDulnD
         +Bm7VBOdO+y5uV54Sf0Vs03eJgib2d6SwcAHbqDhlYVbrYyCNhQ6rDatqdysxKdapdkI
         wPEf07JBAiEOh59DVMbBTPIQJgaHNfWMVCdq0dKHlima6aSoRsXmaPrJjO+XXEfRe/fC
         f1UFIBF91iKPWfvBuvyDxOrKC86/NEyd3U+2/MH5qYBOsFPEQOkQp3l+84/r0UWoBSjY
         kh7Q==
X-Gm-Message-State: ANoB5pmzbhtWTFXfLkQfIwU48I3ef8RWS6Ai/zBZIMSRZv3EDyaWG27p
	valYukq9jimYnIjo5k4c1PQRPKEFKy9P3FBe8gY7yQ==
X-Google-Smtp-Source: AA0mqf4D83+Ec3zN/J0yAmt3eLxf8PEuxG0j7MWm6AL0n84S1q1nb5ZD5lRZnIk7bqoNUgSVj4axDGQOQl2JLC4woHE=
X-Received: by 2002:a17:906:b250:b0:7b2:86d5:8b14 with SMTP id
 ce16-20020a170906b25000b007b286d58b14mr22641046ejb.230.1669177602504; Tue, 22
 Nov 2022 20:26:42 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0Fs9ZVoRgtz92RgLnFPvgwUzCP_KpK9SCOiVsA-t3p3Q@mail.gmail.com>
 <mhng-3f44cc1f-7305-41c5-a1cf-dfed096bd364@palmer-ri-x1c9>
 <CAK9=C2USZHdfBQrrgd2Rs3u3_gTyscpRgxvPU5P6ptOPu1+Axg@mail.gmail.com> <Y3ywTzv3vbgRXQGG@wendy>
In-Reply-To: <Y3ywTzv3vbgRXQGG@wendy>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Nov 2022 09:56:31 +0530
Message-ID: <CAAhSdy1UwBQwX2jnmJXUAAjFL5TZXTUrs9yf9DRMSH=GV4BcHg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor@kernel.org>, rafael@kernel.org, daniel.lezcano@linaro.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_202646_341417_5C0012E3 
X-CRM114-Status: GOOD (  53.10  )
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

On Tue, Nov 22, 2022 at 4:50 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Tue, Nov 22, 2022 at 11:06:15AM +0530, Anup Patel wrote:
> > On Tue, Nov 22, 2022 at 10:46 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > >
> > > On Mon, 21 Nov 2022 19:45:07 PST (-0800), anup@brainfault.org wrote:
> > > > On Tue, Nov 22, 2022 at 2:27 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > > >>
> > > >> From: Palmer Dabbelt <palmer@rivosinc.com>
> > > >>
> > > >> As per [1], whether or not the core can wake up from non-retentive
> > > >> suspend is a platform-specific detail.  We don't have any way to encode
> > > >> that, so just stop using them until we've sorted that out.
> > > >>
> > > >> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
> > > >> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> > > >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > >
> > > > This is just unnecessary maintenance churn and it's not the
> > > > right way to go. Better to fix this the right way instead of having
> > > > a temporary fix.
> > > >
> > > > I had already sent-out a patch series 5 months back to describe
> > > > this in DT:
> > > > https://lore.kernel.org/lkml/20220727114302.302201-1-apatel@ventanamicro.com/
> > > >
> > > > No one has commented/suggested anything (except Samuel
> > > > Holland and Sudeep Holla).
> > >
> > > I see some comments from Krzysztof here
> > > <https://lore.kernel.org/lkml/7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org/>
> > > as well.  Looks like everyone is pointing out that having our CPU nodes
> > > encode timers is a bad idea, my guess is that they're probably right.
> >
> > Adding a separate timer DT node, creates a new set of compatibility
> > issues for existing platforms. I am fine updating my series to have
> > separate timer DT node but do we want to go in this direction ?
>
> I don't really follow. How is there a compatibility issue created by
> adding a new node that is not added for a new property? Both will
> require changes to the device tree. (You need not reply here, I am going
> to review the other thread, it's been on my todo list for too long. Been
> caught up with non-coherent stuff & our sw release cycle..)

Adding a new timer DT node would mean, the RISC-V timer driver
will now be probed using the compatible to the new DT node whereas
the RISC-V timer driver is currently probed using CPU DT nodes.

>
> > Even if ARM has a separate timer DT node, the timers are still part
> > of the CPU. It depends on how we see the DT bindings aligning with
> > actual HW.
> >
> > >
> > > > Please review this series. I can quickly address comments to
> > > > make this available for Linux-6.2. Until this series is merged,
> > > > the affected platforms can simply remove non-retentive suspend
> > > > states from their DT.
> > >
> > > That leaves us with a dependency between kernel versions and DT
> > > bindings: kernels with the current driver will result in broken systems
> > > with the non-retentive suspend states in the DT they boot with when
> > > those states can't wake up the CPU.
>
> Can someone point me at a (non D1 or virt) system that has suspend
> states in the DT that would need fixing?

For the QEMU virt machine, the default non-retentive suspend state was
tested using a temporary DTB provided separately via QEMU command
line. The QEMU virt machine does not have its own HART suspend
states so OpenSBI will functionally emulate default retentive/non-retentive
suspend states.

>
> > This is not a new problem we are facing. Even in the ARM world,
> > the DT bindings grew organically over time based on newer platform
> > requirements.
> >
> > Now that we have a platform which does not want the time
> > C3STOP feature, we need to first come-up with DT bindings
> > to support this platform instead of temporarily disabling
> > features which don't work on this platform.
>
> It's the opposite surely? It should be "now that we have a platform that
> *does want* the C3STOP feature", right?

Yes, we can think this way as well.

>
> > > > With all due respect, NACK to this patch from my side.
>
> As Samuel pointed out that the D1 doesn't actually use the timer in
> question, I think we are okay here?

Yes, that's why D1 needs the C3STOP flag.

>
> > > >>
> > > >> ---
> > > >>
> > > >> This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
> > > >> Events are stopped during CPU suspend"), which fixes suspend on the D1
> > > >> but breaks timers everywhere.
> > > >> ---
> > > >>  drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
> > > >>  1 file changed, 11 insertions(+)
> > > >>
> > > >> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > > >> index 05fe2902df9a..9d1063a54495 100644
> > > >> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> > > >> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > > >> @@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
> > > >>         if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
> > > >>             state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
> > > >>                 return false;
> > > >> +
> > > >> +       /*
> > > >> +        * Whether or not RISC-V systems deliver interrupts to harts in a
> > > >> +        * non-retentive suspend state is a platform-specific detail.  This can
> > > >> +        * leave the hart unable to wake up, so just mark these states as
> > > >> +        * unsupported until we have a mechanism to expose these
> > > >> +        * platform-specific details to Linux.
> > > >> +        */
> > > >> +       if (state & SBI_HSM_SUSP_NON_RET_BIT)
> > > >> +               return false;
> > > >> +
> > > >>         return true;
> > > >>  }
> > > >>
> > > >> --
> > > >> 2.38.1
> > > >>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
