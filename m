Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1593BC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1h+4V2vb8Kps4FxsSxOcsBXVHEcvx2w86RF2gsSe/0=; b=XvoiHwkvORVDhJ
	oHesFf/vh5ib7jc76Zea9CjgGA2g0gjh1dJ6oYfTM5OrdNaSH1alMiac5VTHXfs2MN0jiP7tm8Ien
	/8r6D1/SELU1NST9lr1bTYxYxJUBsRxHolNWbevy1KM5yJxTHn9B1AR1ITwdiaNHaaTEQJmYd/yle
	0Wnbpji6x8uL5PrDmNJmDZOZw/LO6kNPknTd5YgqwTqCVVrNO4pSPESgwERFbZcgmYSm9E6HIx91N
	Rer5VDg/Xab+wB1VcNr2243vUD3MBeogskKVUQOCIfP6dOCPPw8Dq0ZAc70f5suCOttGgyQf2kA7V
	7UaQgNFgvF/YX2bwSBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxR7d-008FfE-Ah; Tue, 22 Nov 2022 11:07:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxR7S-008FbT-5p
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 11:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669115233; x=1700651233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vaz4EcmLhMtGxndl6ZH06X/wo75zVOAaQK6XNRZdbAU=;
  b=q5cF7g0dQjhTBBpQaW+ulo6g6vvsKEKXxJvkO51KjZOGxuqpwBS0euB0
   A5dPpiUHwrZnmrT1SC4Hn27UwA5Wv3VkH67fR/6ksz10ptypxFF2Gx2Nd
   ilD4ho72aaXWnvJY95FvZa8/DNo8HFs30y71+7p34QlclTqBWCs5V1uXs
   XBPf424iE52gfX43s4H5HMvkLhhEIBp3dhgqidCdGahZXhHhDdsgD8oQ6
   5ZBghbvIovwoOlgWseVUZcJJrTubhz79sY89vrhMXpwjyeIY39+tJ6ELh
   hqcdHNg2qs1pyxxiytAZPIMiA/UC9M7YD3NNLa6biybA4m2TH+ThHfujX
   w==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="200892955"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 04:07:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 04:07:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 04:07:08 -0700
Date: Tue, 22 Nov 2022 11:06:50 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	<anup@brainfault.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <linux-pm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux@rivosinc.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
Message-ID: <Y3ytSj6NEeU54z7m@wendy>
References: <20221121205647.23343-1-palmer@rivosinc.com>
 <bf6d3b1f-f703-4a25-833e-972a44a04114@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf6d3b1f-f703-4a25-833e-972a44a04114@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_030715_904763_24DC638B 
X-CRM114-Status: GOOD (  46.93  )
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

Hey Samuel,

Thanks a lot for the extra context.

On Mon, Nov 21, 2022 at 06:45:25PM -0600, Samuel Holland wrote:
> Hi Palmer,
> 
> On 11/21/22 14:56, Palmer Dabbelt wrote:
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> > 
> > As per [1], whether or not the core can wake up from non-retentive
> > suspend is a platform-specific detail.  We don't have any way to encode
> > that, so just stop using them until we've sorted that out.
> 
> We do have *exactly* a way to encode that. Specifically, the existence
> or non-existence of a non-retentive CPU suspend state in the DT.
> 
> If a hart has no way of resuming from non-retentive suspend (i.e. a
> complete lack of interrupt delivery in non-retentive suspend), then it
> makes zero sense to advertise such a suspend state in the DT.

I would have to agree with that. I think the sprawling conversation has
confused us all at this point, I (prior to reading this mail) thought
that suspend was borked on the D1. I don't think anyone is advertising
specific states in the DT at the moment though, I had a check in the D1
patchset and didn't see anything there - unless you're adding it
dynamically from the bootloader?

> Therefore,
> if the state exists in the DT, you can assume there is *some* interrupt
> that can wake up the hart. And I would extend that to assume at least
> one of those wakeup-capable interrupts is a timer interrupt, although
> not necessarily the architectural timer interrupt.
> 
> > Link: https://github.com/riscv-non-isa/riscv-sbi-doc/issues/98#issuecomment-1288564687
> 
> This comment refers specifically to the architectural timer interrupt,
> not interrupts more generally.
> 
> > Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > 
> > ---
> > 
> > This should allow us to revert 232ccac1bd9b ("clocksource/drivers/riscv:
> > Events are stopped during CPU suspend"), which fixes suspend on the D1
> > but breaks timers everywhere.
> 
> I understand that reverting 232ccac1bd9b is the easiest way to fix the
> issues you and others are seeing.

I am going to submit another respin of that revert, hopefully with the
extra context from here and elsewhere mixed in.

> I do not have any functioning RISC-V
> hardware with SMP, so it is hard for me to help debug the root issue in
> the Linux timer code. I do not know why turning on the C3STOP flag
> breaks RCU stall detection or clock_nanosleep(), but I agree that
> breakage should not happen.
> 
> So while I still think 232ccac1bd9b is the right change to make from a
> "following the spec" standpoint

Right, so the spec says:
Request the SBI implementation to put the calling hart in a platform
specific suspend (or low power) state specified by the suspend_type
parameter. The hart will automatically come out of suspended state and
resume normal execution when it receives an interrupt or platform
specific hardware event.

That, as we have discussed a bunch of times, does not say whether a
given interrupt should actually arrive during suspend. The correct
behaviour, to me, is to assume that no events arrive during suspend.

We've got a regular old SiFive implementation so I assume (and will go
investigate at some point this week) that the other SiFive {,based}
implementations also have timer events during suspend.

> I am okay with reverting it for
> pragmatic reasons. Since the D1 has another timer driver that is
> currently used in preference to the RISC-V/SBI timer triver,

Once we have got something in place to actually make the determination
we can revert the revert. I'll go give some feedback on Anup's stuff,
I've been meaning to but unfortunately not had the chance to do so yet.

> reverting
> 232ccac1bd9b does not break non-retentive suspend for the D1.

Ah, I did not know this. Probably should have gone looking before I
acked this patch - sorry!
Since that's the case this patch seems un-needed.

> But please do not make the change below. It is unnecessarily broad, and
> will break something that works fine right now. If the DT advertises a
> CPU suspend state that cannot be woken up from at all, then that is a
> bug in the DT. Linux should not try to work around that.

Thanks again Samuel :)

> > ---
> >  drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > index 05fe2902df9a..9d1063a54495 100644
> > --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> > +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > @@ -214,6 +214,17 @@ static bool sbi_suspend_state_is_valid(u32 state)
> >  	if (state > SBI_HSM_SUSPEND_NON_RET_DEFAULT &&
> >  	    state < SBI_HSM_SUSPEND_NON_RET_PLATFORM)
> >  		return false;
> > +
> > +	/*
> > +	 * Whether or not RISC-V systems deliver interrupts to harts in a
> > +	 * non-retentive suspend state is a platform-specific detail.  This can
> > +	 * leave the hart unable to wake up, so just mark these states as
> > +	 * unsupported until we have a mechanism to expose these
> > +	 * platform-specific details to Linux.
> > +	 */
> > +	if (state & SBI_HSM_SUSP_NON_RET_BIT)
> > +		return false;
> > +
> >  	return true;
> >  }
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
