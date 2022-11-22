Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD9BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iyjl7osTfB18EzQcCOItEvNznx8XZISlWFtjU+UDU4=; b=dFJXEzouRBv3vz
	kQEHO9hWp0Z6Lr6mY4eRrH560KunLdQZo/oQETsdgF+jTdlrY4EH+/Qv7Ko4B4Hmp+J9Fdk0wlMxF
	HimK+1f+382XTLJXaKFAKMoewbIiDZrGl5/bNHr16w7h8q/e8Oigo+1OMxazAF1nfvqELb9TJuCpB
	d2b9O+CIP7KKLteGEbfWIcZ9neu0Wj8rOqh0kFWM3plPP0jJkvWHqh4SeYul4jE0lNbhuX0Jwcdn9
	Mu24V7mc/vN3GCUDe2Qv0/+lk5U4xj/g4tPs8aiVJpdB85QtKpP3lm8gcPADjRW5eFsX9NYtShxDY
	Dtz8SXpLgPPCg2hHz0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRK9-008JgU-J1; Tue, 22 Nov 2022 11:20:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxRJy-008JbW-2F
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 11:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669116009; x=1700652009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yEGM0bLZYKdCMc87oRno0uNXS7/YK4qufWtxP5E5skc=;
  b=js5sPAQlYOSgsQR/c8BceEqGk8yZUl7MsGxfxoi3l7cwy9ULb1XWjyXt
   8B4j2RCIDhkcHWwfJeBEoZpy9cHgcmnRrvlYVCkPp4hwe0k1UdWz2xhNi
   GF1HB0xvaz8I5my+gctMYGR1/EiMmai0D9+z2+ivZT9ZYhY3HrkNLJK3H
   L5alffaVeLHkyZJyGVnbeg7Bgqvj6vh+2uTrqlCFSgQPXDud7IgBofSd7
   ne34VhrYcrc/68E5Pu4fCODzkwSLKElyZJO+5y0/pcFf7wZvuJQndKod5
   r3V9ZekBqNsGLcioJ+WkxmNJgg1ggGnhbTKefbGz3kyFRQlYXT5f/Jy/x
   g==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="188128298"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 04:20:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 04:20:03 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 04:20:01 -0700
Date: Tue, 22 Nov 2022 11:19:43 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>, <anup@brainfault.org>, Conor Dooley
	<conor@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@rivosinc.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
Message-ID: <Y3ywTzv3vbgRXQGG@wendy>
References: <CAAhSdy0Fs9ZVoRgtz92RgLnFPvgwUzCP_KpK9SCOiVsA-t3p3Q@mail.gmail.com>
 <mhng-3f44cc1f-7305-41c5-a1cf-dfed096bd364@palmer-ri-x1c9>
 <CAK9=C2USZHdfBQrrgd2Rs3u3_gTyscpRgxvPU5P6ptOPu1+Axg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2USZHdfBQrrgd2Rs3u3_gTyscpRgxvPU5P6ptOPu1+Axg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_032010_212647_9493F567 
X-CRM114-Status: GOOD (  46.56  )
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

On Tue, Nov 22, 2022 at 11:06:15AM +0530, Anup Patel wrote:
> On Tue, Nov 22, 2022 at 10:46 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> >
> > On Mon, 21 Nov 2022 19:45:07 PST (-0800), anup@brainfault.org wrote:
> > > On Tue, Nov 22, 2022 at 2:27 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > >>
> > >> From: Palmer Dabbelt <palmer@rivosinc.com>
> > >>
> > >> As per [1], whether or not the core can wake up from non-retentive
> > >> suspend is a platform-specific detail.  We don't have any way to encode
> > >> that, so just stop using them until we've sorted that out.
> > >>
> > >> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
> > >> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> > >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > >
> > > This is just unnecessary maintenance churn and it's not the
> > > right way to go. Better to fix this the right way instead of having
> > > a temporary fix.
> > >
> > > I had already sent-out a patch series 5 months back to describe
> > > this in DT:
> > > https://lore.kernel.org/lkml/20220727114302.302201-1-apatel@ventanamicro.com/
> > >
> > > No one has commented/suggested anything (except Samuel
> > > Holland and Sudeep Holla).
> >
> > I see some comments from Krzysztof here
> > <https://lore.kernel.org/lkml/7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org/>
> > as well.  Looks like everyone is pointing out that having our CPU nodes
> > encode timers is a bad idea, my guess is that they're probably right.
> 
> Adding a separate timer DT node, creates a new set of compatibility
> issues for existing platforms. I am fine updating my series to have
> separate timer DT node but do we want to go in this direction ?

I don't really follow. How is there a compatibility issue created by
adding a new node that is not added for a new property? Both will
require changes to the device tree. (You need not reply here, I am going
to review the other thread, it's been on my todo list for too long. Been
caught up with non-coherent stuff & our sw release cycle..)

> Even if ARM has a separate timer DT node, the timers are still part
> of the CPU. It depends on how we see the DT bindings aligning with
> actual HW.
> 
> >
> > > Please review this series. I can quickly address comments to
> > > make this available for Linux-6.2. Until this series is merged,
> > > the affected platforms can simply remove non-retentive suspend
> > > states from their DT.
> >
> > That leaves us with a dependency between kernel versions and DT
> > bindings: kernels with the current driver will result in broken systems
> > with the non-retentive suspend states in the DT they boot with when
> > those states can't wake up the CPU.

Can someone point me at a (non D1 or virt) system that has suspend
states in the DT that would need fixing?

> This is not a new problem we are facing. Even in the ARM world,
> the DT bindings grew organically over time based on newer platform
> requirements.
> 
> Now that we have a platform which does not want the time
> C3STOP feature, we need to first come-up with DT bindings
> to support this platform instead of temporarily disabling
> features which don't work on this platform.

It's the opposite surely? It should be "now that we have a platform that
*does want* the C3STOP feature", right?

> > > With all due respect, NACK to this patch from my side.

As Samuel pointed out that the D1 doesn't actually use the timer in
question, I think we are okay here?

> > >>
> > >> ---
> > >>
> > >> This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
> > >> Events are stopped during CPU suspend"), which fixes suspend on the D1
> > >> but breaks timers everywhere.
> > >> ---
> > >>  drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
> > >>  1 file changed, 11 insertions(+)
> > >>
> > >> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > >> index 05fe2902df9a..9d1063a54495 100644
> > >> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> > >> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > >> @@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
> > >>         if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
> > >>             state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
> > >>                 return false;
> > >> +
> > >> +       /*
> > >> +        * Whether or not RISC-V systems deliver interrupts to harts in a
> > >> +        * non-retentive suspend state is a platform-specific detail.  This can
> > >> +        * leave the hart unable to wake up, so just mark these states as
> > >> +        * unsupported until we have a mechanism to expose these
> > >> +        * platform-specific details to Linux.
> > >> +        */
> > >> +       if (state & SBI_HSM_SUSP_NON_RET_BIT)
> > >> +               return false;
> > >> +
> > >>         return true;
> > >>  }
> > >>
> > >> --
> > >> 2.38.1
> > >>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
