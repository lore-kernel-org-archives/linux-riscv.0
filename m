Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439E7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 10:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCCYqR0hTUGXVpKS7IbNZ4IuT09jANzCvID8bwmDzHw=; b=PSQdR/JmBgFa17
	ogLq1wn2Kd99alqaT18x5nfStqeKCUnt6XYxnm4UQsNUDhuiHILEQuhGE90d0rTvwSwyD8j2bhZGH
	5YjmgIwLtNsyBQJ4i+FnxDhZHIdfqx0ei1x2Ef/WhZYNM8vHkZloADxd0zqTHAvWYJi03s1P6OZW0
	eyjSFvMAlIrAd3Rsmpmkx7o1ELOJSlOlVF6S/iBMJEZs/m+lVuwFZ+d9jfIFP6aR+n6HOf2BXm0pe
	pkwBD9l/GFmKWzjMS64ib0Of86ih6xeZ7155jterfizto+w/6pSBGp1Bhzc5qTo45f5fWi3r+Jeuz
	x5Enoyv6mVXpXJcGj+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmi3-00GGQf-Gc; Wed, 23 Nov 2022 10:10:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmhw-00GGJk-JV
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 10:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669198220; x=1700734220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+TpboofMEOuW566fs/EUm7LVwp3TsGK1qTspl5yq6EM=;
  b=Vi8B5p3PtarwLddoLJfk/pQvVD4w0OpE9ryTHPM9jQodAR+ltmDC335J
   Ts8JOfyKZZrCdiuNN1o6DRH+AVcpF0iLk0CeI/M9g6qo43t0JOFkrP3M0
   2eJ/htZRdl0n4sN2Fu/+rWEQS6nGJpLuVIBCvhw1MC7iqV3VE2uIdkBgQ
   wZVC8lIhsjvMsM42yOthaogDFYs4mIcB+pZ2xujuL4g9/hDVU2RL4QN2r
   cmyGCTnoc3VNysY5u5IQZ8ixT6SZ7f+CiH8kLYhG/OJGDrgFVrBd933Ht
   +7DZbSg0eqjd8kWumS8tFWSbWQGFtXseEq7DLqxh1MWpl/bIMWzRsN9VD
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="188305129"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2022 03:10:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 23 Nov 2022 03:10:11 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 23 Nov 2022 03:10:09 -0700
Date: Wed, 23 Nov 2022 10:09:51 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <anup@brainfault.org>
CC: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>, <rafael@kernel.org>,
	<daniel.lezcano@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <linux-pm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux@rivosinc.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
Message-ID: <Y33xb0jxZqdexzRc@wendy>
References: <CAAhSdy0Fs9ZVoRgtz92RgLnFPvgwUzCP_KpK9SCOiVsA-t3p3Q@mail.gmail.com>
 <mhng-3f44cc1f-7305-41c5-a1cf-dfed096bd364@palmer-ri-x1c9>
 <CAK9=C2USZHdfBQrrgd2Rs3u3_gTyscpRgxvPU5P6ptOPu1+Axg@mail.gmail.com>
 <Y3ywTzv3vbgRXQGG@wendy>
 <CAAhSdy1UwBQwX2jnmJXUAAjFL5TZXTUrs9yf9DRMSH=GV4BcHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1UwBQwX2jnmJXUAAjFL5TZXTUrs9yf9DRMSH=GV4BcHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_021022_402498_43AF2530 
X-CRM114-Status: GOOD (  53.09  )
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

Hey Anup,

On Wed, Nov 23, 2022 at 09:56:31AM +0530, Anup Patel wrote:
> On Tue, Nov 22, 2022 at 4:50 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> >
> > On Tue, Nov 22, 2022 at 11:06:15AM +0530, Anup Patel wrote:
> > > On Tue, Nov 22, 2022 at 10:46 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > > >
> > > > On Mon, 21 Nov 2022 19:45:07 PST (-0800), anup@brainfault.org wrote:
> > > > > On Tue, Nov 22, 2022 at 2:27 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > > > >>
> > > > >> From: Palmer Dabbelt <palmer@rivosinc.com>
> > > > >>
> > > > >> As per [1], whether or not the core can wake up from non-retentive
> > > > >> suspend is a platform-specific detail.  We don't have any way to encode
> > > > >> that, so just stop using them until we've sorted that out.
> > > > >>
> > > > >> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
> > > > >> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> > > > >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > >
> > > > > This is just unnecessary maintenance churn and it's not the
> > > > > right way to go. Better to fix this the right way instead of having
> > > > > a temporary fix.
> > > > >
> > > > > I had already sent-out a patch series 5 months back to describe
> > > > > this in DT:
> > > > > https://lore.kernel.org/lkml/20220727114302.302201-1-apatel@ventanamicro.com/
> > > > >
> > > > > No one has commented/suggested anything (except Samuel
> > > > > Holland and Sudeep Holla).
> > > >
> > > > I see some comments from Krzysztof here
> > > > <https://lore.kernel.org/lkml/7a0477a0-9f0f-87d6-4070-30321745f4cc@linaro.org/>
> > > > as well.  Looks like everyone is pointing out that having our CPU nodes
> > > > encode timers is a bad idea, my guess is that they're probably right.
> > >
> > > Adding a separate timer DT node, creates a new set of compatibility
> > > issues for existing platforms. I am fine updating my series to have
> > > separate timer DT node but do we want to go in this direction ?
> >
> > I don't really follow. How is there a compatibility issue created by
> > adding a new node that is not added for a new property? Both will
> > require changes to the device tree. (You need not reply here, I am going
> > to review the other thread, it's been on my todo list for too long. Been
> > caught up with non-coherent stuff & our sw release cycle..)
> 
> Adding a new timer DT node would mean, the RISC-V timer driver
> will now be probed using the compatible to the new DT node whereas
> the RISC-V timer driver is currently probed using CPU DT nodes.

Ahh, that is what I have missed. I'll continue my thoughts on this in
the dt-binding thread.

> > > Even if ARM has a separate timer DT node, the timers are still part
> > > of the CPU. It depends on how we see the DT bindings aligning with
> > > actual HW.
> > >
> > > >
> > > > > Please review this series. I can quickly address comments to
> > > > > make this available for Linux-6.2. Until this series is merged,
> > > > > the affected platforms can simply remove non-retentive suspend
> > > > > states from their DT.
> > > >
> > > > That leaves us with a dependency between kernel versions and DT
> > > > bindings: kernels with the current driver will result in broken systems
> > > > with the non-retentive suspend states in the DT they boot with when
> > > > those states can't wake up the CPU.
> >
> > Can someone point me at a (non D1 or virt) system that has suspend
> > states in the DT that would need fixing?
> 
> For the QEMU virt machine, the default non-retentive suspend state was
> tested using a temporary DTB provided separately via QEMU command
> line. The QEMU virt machine does not have its own HART suspend
> states so OpenSBI will functionally emulate default retentive/non-retentive
> suspend states.

So since I asked for non D1 or virt systems, that's a no & no DTs
actually needs to be fixed :)

> > > This is not a new problem we are facing. Even in the ARM world,
> > > the DT bindings grew organically over time based on newer platform
> > > requirements.
> > >
> > > Now that we have a platform which does not want the time
> > > C3STOP feature, we need to first come-up with DT bindings
> > > to support this platform instead of temporarily disabling
> > > features which don't work on this platform.
> >
> > It's the opposite surely? It should be "now that we have a platform that
> > *does want* the C3STOP feature", right?
> 
> Yes, we can think this way as well.

No, there's no "thinking" involved here from what I can tell. Pre-D1
systems do not seem to need the flag and the D1 does want that flag for
its riscv,timer. We have to operate with respect to hardware timelines
& the corresponding software implementations, not specs in this context.

If it was the case that you proposed, there would be no chance for
regressions if someone updates their kernel but not their DT.

> > > > > With all due respect, NACK to this patch from my side.
> >
> > As Samuel pointed out that the D1 doesn't actually use the timer in
> > question, I think we are okay here?
> 
> Yes, that's why D1 needs the C3STOP flag.

I don't understand what you mean here, you don't appear to be replying
to what I said.

I was saying that the current D1 configuration does not actually use
the timer-riscv driver as there's another one that has a higher rating
& therefore we are okay to not apply this patch as my revert will not
cause it to be put into sleep states that it cannot return from.

Your reply makes no sense to me in that context.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
