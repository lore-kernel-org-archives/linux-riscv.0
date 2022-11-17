Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE69BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZrh8RhGIkP3JPeDP9B6tul3/3Wf/g/M4wsPTJkkzi8=; b=3ssietu4/7r5Cc
	B5ihgwJTz+TYLvwUPV3Szzxt6JHH9/f4GaL/67zrwjtI2U1L4X9TnrdspneaFCLrIscu96wxcaPjO
	o09MKV97O+u3FmTTg31nODEf7JrCT/gxT1YtoIQrABzxZquOLKZRPBqRdOrXGMtRIq5MChEzJ/nFq
	VkZ9mtjdvRLWNLMBKfq4Zon27SueSGyKGjedJAFpZARj5faKBcuKjahU1u1830lPD4d9u3B4b9jhv
	gBBgyIexqrhROP9dkk7Gz+2stYFy/hII4dW+HNKWQe+MMabn0rGCLGDBzDZ0mjA+sXUZa/BUigNSv
	aVzZSQzYFaTgGEsxFSYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovl0q-00H351-BZ; Thu, 17 Nov 2022 19:57:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovl0m-00H33Y-R5
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 19:57:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4326EB821DD;
	Thu, 17 Nov 2022 19:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB48C433C1;
	Thu, 17 Nov 2022 19:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668715042;
	bh=gCElGlWGA46iOYzp69MoHYuVOmSDZpYob11i+TmiOis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uT12eTDHxm2DRoHODbjDmitHklpMgERuLBYis+vjfbu+3AJ2dZRxUkqgTyk6UR7XM
	 sB9kV8D654tedS0DcdyQ+abjJO3zV2ERvrceBSFxvwjnp9rZQ8VTgS4H/rbhimNH16
	 ZV+5wzd1DHu9xyiyJpBYj1/aIk0I2VhLlfz46nd+rQIqXWwniTPY/OQULDF7QBdw3P
	 xwg4rk2XVVCAa0xkf7nz9HMc8BxUov/RzlLetQkHs7hCTxnz5MbJfQBp9cwhs5aeLG
	 KVBV88zba2xfZkmOhrA+oe4Rdv/0TSCptz7ZoQ3Zq40L2Mg9B3CAYzSbV5XtGQpxPo
	 ZeIRt8dq+wa8A==
Date: Thu, 17 Nov 2022 19:57:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] irqchip/sifive-plic: default to enabled
Message-ID: <Y3aSHUb8GHnso3Qb@spud>
References: <20221117185942.3896559-1-conor@kernel.org>
 <86y1s9nzja.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86y1s9nzja.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_115725_195688_E62B9214 
X-CRM114-Status: GOOD (  30.25  )
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

On Thu, Nov 17, 2022 at 07:36:57PM +0000, Marc Zyngier wrote:
> On Thu, 17 Nov 2022 18:59:43 +0000,
> Conor Dooley <conor@kernel.org> wrote:
> > 
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > The SiFive PLIC driver is used by all current implementations, including
> > those that do not have a SiFive PLIC. Default the driver to enabled,
> > with the intention of later removing the current "every SOC selects
> > this" situation in Kconfig.socs at the moment.
> > 
> > The speculative "potential others" in the description no longer makes
> > any sense, as the driver is always used. Update the Kconfig symbol's
> > description to reflect the driver's ubiquitous state.
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Hey Marc,
> > 
> > I recall some discussion when this driver was extended to other PLICs a
> > few months ago:
> > https://lore.kernel.org/linux-riscv/20511a05f39408c8ffbcc98923c4abd2@kernel.org/
> > 
> > Perhaps I got the wrong impression, but it seemed to me that you intend
> > for future implementations to reuse this driver where possible?
> 
> Well, within reasons. People seem to have some very liberal
> interpretations of the architecture spec...

Yeah, I know.. something something "RISC-V is meant to be extensible"
something something. Even if that means doing some "standard" thing
your own way apparently.

> > I'd like to think, and surely will be proven wrong, that ~all future
> > plic implementations should be similar enough to fit that bill.
> > It's kinda on this basis that I figure switching this thing to default y
> > should be okay. It's already only buildable on RISC-V & every
> > implementation uses it, so no difference there.
> 
> If you expect this to be present at all times, why isn't this selected
> by the architecture Kconfig instead?

Everyone at the moment needs it, but that's not always going to be true.
The AIA APLIC that's currently out for review is the "next generation"
interrupt controller. When we will actually see one in the wild is
another question.

> I always find it pretty odd to
> have something that is 'default y' and yet constrained by a 'depend
> MYARCH'. A 'select PLIC' would make a lot more sense.
> 
> And then you can stop making this user selectable.

I was considering moving the select to arch level, but settled for this
as while I'd like to stop the individual SOCs doing `select PLIC`, I can
see why someone building for a (future) system with the new AIA stuff
may not care to build it.

Or maybe the overhead of this one driver is nothing to care about?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
