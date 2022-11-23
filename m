Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB29EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRW9lciepD/vDDcZjFQBkvkUowjaMO3cUFBCBm68l7I=; b=CzBNl3OX7IQWW/
	47l1xMEP4mz93h1f7k0DWutywi58yEJQ3ILgk8lP3+bDokiWQRBTDl6srQf+uMzObRFTIg005Nni0
	zGhCAkNNT8BHprb9Qna14KJUhzHayfZp2S1tpkUfSDQRdZ9e1Pf4+/QY+JNsqEoRjXvv9cN5KhpeD
	CKhR7h3gf0n/fKfT0dIeQBw1ZAZSh/B7R0ymm+bj40v5a3GKXVjyZXNrAcxgXiflaADJRFkHev1vv
	S38tz1FIm196NsjeMeffeM2l/L7qnVscu4da+UAgqhYPLQw5viy6TFOKayYLmAzdsUvNe5o5OVzVI
	pQnAFDkj0PG/jPEr2qfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnHR-00GROV-PQ; Wed, 23 Nov 2022 10:47:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnHM-00GRMx-Dh
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 10:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669200416; x=1700736416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ExYIHLvCt5/rD5+mucH1shR+P7Rdt20GrJ8oCYWI4Bo=;
  b=UOy4vjO16b26EKyTw7SDHO7EgJecZZEt0B9Ahg5angdC3ZMzxbeSMBR7
   jhpgFIAxY6e4SR0awCQfytJtT6K6fI6TW6IO+9RiPRB7t8F5MBIaP3NdA
   FYf017bKuPUrjqRFUiilERI6himT51GEr9nR2YU7LnHUPkFRaRx02xM7m
   dqtMxxNxgwwCku2cUQyyrF0NTUwTITYPIDDclE6bm4LSW5W/cIfAIL+hK
   f/AAS1vT7EVl4Rnp7KSYP2ZBCUOyT9/5LMaYyEfZeILLFxqbetzc3ZsjN
   EFtx22ccAW1IGaPxThJ6wtfmNhOMc/S9dadASwGk2gwBJPrEnHNQouqIF
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="188309618"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2022 03:46:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 23 Nov 2022 03:46:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 23 Nov 2022 03:46:51 -0700
Date: Wed, 23 Nov 2022 10:46:33 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Holland <samuel@sholland.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor@kernel.org>,
	<anup@brainfault.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <linux-pm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux@rivosinc.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
Message-ID: <Y336CQ81NFv7Ev7n@wendy>
References: <20221121205647.23343-1-palmer@rivosinc.com>
 <bf6d3b1f-f703-4a25-833e-972a44a04114@sholland.org>
 <Y3ytSj6NEeU54z7m@wendy>
 <2309d3e5-0e37-c77b-1c0b-610abf0af62d@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2309d3e5-0e37-c77b-1c0b-610abf0af62d@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_024656_559347_63AC19B3 
X-CRM114-Status: GOOD (  32.98  )
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

>On Tue, Nov 22, 2022 at 09:42:24PM -0600, Samuel Holland wrote:
> On 11/22/22 05:06, Conor Dooley wrote:
> > On Mon, Nov 21, 2022 at 06:45:25PM -0600, Samuel Holland wrote:
> > > On 11/21/22 14:56, Palmer Dabbelt wrote:

> > > > As per [1], whether or not the core can wake up from non-retentive
> > > > suspend is a platform-specific detail.  We don't have any way to encode
> > > > that, so just stop using them until we've sorted that out.
> > >
> > > We do have *exactly* a way to encode that. Specifically, the existence
> > > or non-existence of a non-retentive CPU suspend state in the DT.
> > >
> > > If a hart has no way of resuming from non-retentive suspend (i.e. a
> > > complete lack of interrupt delivery in non-retentive suspend), then it
> > > makes zero sense to advertise such a suspend state in the DT.
> > 
> > I would have to agree with that. I think the sprawling conversation has
> > confused us all at this point, I (prior to reading this mail) thought
> > that suspend was borked on the D1. I don't think anyone is advertising
> > specific states in the DT at the moment though, I had a check in the D1
> > patchset and didn't see anything there - unless you're adding it
> > dynamically from the bootloader?
> 
> The availability and latency properties of idle states depend on the SBI
> implementation, so yes, they need to be added dynamically.

Right, thanks for clarifying.

> > > I do not have any functioning RISC-V
> > > hardware with SMP, so it is hard for me to help debug the root issue in
> > > the Linux timer code. I do not know why turning on the C3STOP flag
> > > breaks RCU stall detection or clock_nanosleep(), but I agree that
> > > breakage should not happen.
> > >
> > > So while I still think 232ccac1bd9b is the right change to make from a
> > > "following the spec" standpoint
> > 
> > Right, so the spec says:
> > Request the SBI implementation to put the calling hart in a platform
> > specific suspend (or low power) state specified by the suspend_type
> > parameter. The hart will automatically come out of suspended state and
> > resume normal execution when it receives an interrupt or platform
> > specific hardware event.
> > 
> > That, as we have discussed a bunch of times, does not say whether a
> > given interrupt should actually arrive during suspend. The correct
> > behaviour, to me, is to assume that no events arrive during suspend.
> 
> Are you suggesting that we need some property to declare the delivery of
> each kind of interrupt (software, timer, external, PMU)? 

I'm possibly taking things to an extreme, since if we're having a
discussion that covers what the spec does and does not allow I see no
harm in going down the rabbit hole!

Obviously, some sort of event must get the CPU out of suspend - what I
meant was more like "The correct (software) behaviour, to me, is to
assume that, when looking at an individual source, its events may not
arrive during suspend."

I've not looked at the relevant specs to see if they specify whether
their interrupts *must* arrive, just the SBI one that the issue was
created against.

> I assumed that
> external interrupt delivery would be required to consider an idle state
> "viable", but I suppose it would be _possible_ to have a state where
> only timer interrupts are deliverable.

Who knows what some hardware folks will come up with! Maybe I am being
pretty <whatever the modern version of black & white> is here, but I
fear for a repeat whenever someone does something "creative".

I know I've not answered your question about other kinds of properties
but I am well outside my comfort zone here.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
