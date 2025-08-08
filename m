Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFF8C87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 03:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRIT5GxWAOJcH0VhFTw0IiMIjn6RrhOb6/kuBJKZ1b4=; b=x1Bh//mD0ODNwz
	U6WECCOyZLwwQ0VpUdi/xkvvuB+6ClW6Hq2USqoWHI08PTw5gEoMOtAZCyy7BVLB64E0Mty/Y7PL6
	ZChjzQXVAFb/xsqLWMAYJp8vsrQx/4di6Czx9ezXZDK4BeVQ4P4kInF7NZv4WKpYF7X5Ev95snSVx
	jY/0FabrRJ6bddd8rfqWcUbE/baHTyVCmJMdC/kLx/r/WpuwIO4oz0RihQ0oi5425bwFhkRmR7PH/
	xcy2TkePD0M3nsOIQez7jMCB6Lt9Dy5NIee/yfETobX/R+z2pcg5VjGzj1RCdDgklGWZS4nL+g/Ul
	HPPwu6kk9YopurFb1IVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukEGQ-00000001wWo-44Kd;
	Fri, 08 Aug 2025 03:59:30 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukEGO-00000001wVn-1wjX
	for linux-riscv@lists.infradead.org;
	Fri, 08 Aug 2025 03:59:30 +0000
Received: from localhost (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 26EDC12FB44A;
	Thu, 07 Aug 2025 20:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1754625565; bh=wtMbvb7F9YleOMpn+fsVw/m1posEl67MokbxgopQZdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YE39mL1ow/vlMUHMkucfPFRjWqe0Q5hIXKsVLj00CB+GSNLycwHDAAW+Kjr7SQNBV
	 MmgjAs408I3PJNtyfG+fEldw4visd+IIYSZ/LVf8cRDrtcTdwHTjNacmGEiVvo4S61
	 ek/psqJ/L8LnrryL3cJ43nXMH4zdpTtQIzW36ms/D2lfrVmrrDavBe2vrV/i9253Ah
	 h0wmizUgRCgUaeHRcTJu1MW+Aj/ULKmaP24KFols9jD/0wDY5+OSA2AZEuwTNTHpHY
	 xjBdoQDdX3oH81Ru89frUQRS5mSAcBEAPPZiz6EyuQb9DUWph5w9+2pFVSvSwHGyW4
	 U886mM7VtQu8w==
X-Virus-Scanned: amavis at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by localhost (bayard.4d2.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHoPHkzHj3rG; Thu,  7 Aug 2025 20:59:23 -0700 (PDT)
Received: from ketchup (unknown [117.171.65.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id C432012FB405;
	Thu, 07 Aug 2025 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1754625563; bh=wtMbvb7F9YleOMpn+fsVw/m1posEl67MokbxgopQZdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mH+nuok18zbDE1z0KZvWKhix4d/OV9noQQo+K64HR1eDxG3v4mU+Z9wCrEC/xag1a
	 /dvGKZ6bAUKfD3IxUurD35YGod4DGuLFdpuzlWmVGjwnb+s6WVJ5pc8vQBi7gFv0OP
	 j42ZCULMVHZ5s7T4/QtA3Hb+/aBhqhd8fyzJMPj38qcgRoDHFLRDFvBVUophhYN5/C
	 NPgVXeWmqJd5W18rN9n19/io39fmCy6iQrBDar0NCSH+Dzf6MtYJLxikU2jHQE9cJW
	 Y6+jA1++nHer4eFVDgQdJDhwEj/ZHW4lpTfclzWYvwNsRUSjyCFCvTi2R4WGv44oy2
	 HlJLm1bvMhldw==
Date: Fri, 8 Aug 2025 03:59:12 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH 2/2] clk: spacemit: introduce i2s pre-clock and fix i2s
 clock
Message-ID: <aJV2EIC_0E1FQX7L@ketchup>
References: <20250807-k1-clk-i2s-generation-v1-0-7dc25eb4e4d3@linux.spacemit.com>
 <20250807-k1-clk-i2s-generation-v1-2-7dc25eb4e4d3@linux.spacemit.com>
 <aJQXKN_ccpWVJ5oZ@ketchup>
 <C7EA7A1D0F9884EB+aJVcqFqix0GF_RnX@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C7EA7A1D0F9884EB+aJVcqFqix0GF_RnX@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_205928_818855_5B5C3BF4 
X-CRM114-Status: GOOD (  39.86  )
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

On Fri, Aug 08, 2025 at 10:10:48AM +0800, Troy Mitchell wrote:
> Hi, Haylen!
> 
> On Thu, Aug 07, 2025 at 03:02:00AM +0000, Haylen Chu wrote:
> > On Thu, Aug 07, 2025 at 09:30:11AM +0800, Troy Mitchell wrote:
> > > Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
> > > for real I2S use cases.
> > 
> > This is a little misleading: they're modeled as gates with fixed-factor
> > for now whose rate is calculated from their parents instead of defined
> > statically. You could avoid possible confusion by replacing "fixed-rate"
> > with "fixed-factor".
> >
> I'll change it in next version.
> 
> > 
> > > Moreover, the current I2S clock configuration does not work as expected
> > > due to missing parent clocks.
> > > 
> > > This patch adds the missing parent clocks, defines i2s_sysclk as
> > > a DDN clock, and i2s_bclk as a DIV clock.
> > > 
> > > The i2s_sysclk behaves as an M/N fractional divider in hardware,
> > > with an additional gate control.
> > > 
> > > To properly model this, CCU_DDN_GATE_DEFINE is introduced.
> > 
> > Could it be represented as a DDN clock taking a gate as parent? Just
> > like what is described in the published clock diagram. Generally I'd
> > like to avoid introducing more clock types, there're already a lot.
> Uh, our new chip(K3) may uses this macro that I introduced..
> so I don't wanna take a gate as parent everywhere..
> how about we leave it? ;)

I wasn't proposing a workaround. What will go wrong if a gate is taken
as parent of DDN everywhere? Not to mention this DDN variant actually
duplicates the code in ccu_mix.c.

> > 
> > > The original DDN operations applied an implicit divide-by-2, which should
> > > not be a default behavior.
> > > 
> > > This patch removes that assumption, letting each clock define its
> > > actual behavior explicitly.
> > > 
> > > The i2s_bclk is a non-linear, discrete divider clock.
> > > The previous macro only supported linear dividers,
> > > so CCU_DIV_TABLE_GATE_DEFINE is introduced to support
> > > the hardware accurately.
> > 
> > The divider IS linear, from the perspective of functionality, it just
> > implies a 1/2 factor. Could it be represented as an usual divider and a
> > 1/2 fixed factor?
> ditto.
> 
> I know you don't wanna introduce new macro..

It's not about new macros. It's about new clock types. And the solution
I proposed for the divider with a factor isn't meant to be a workaround.

For the divider's case, I think combining a fixed-factor and a normal
divider looks more clean than introducing a new LUT. It solves the
problem for K1, right?

> But K3 requires this, so whether it is introduced now or future,
> the final result is the same.

Could you please confirm whether K3's dividers requiring this patch are
really non-linear or just imply a fixed-factor?

> Please leave it..
> > 
> > > The I2S-related clock registers can be found here [1].
> > 
> > So this patch actually does four separate things,
> > 
> > - Introduce a gate-capable variant of DDN clocks
> > - Make the pre-divider of DDN clocks flexible
> > - Support looking up mappings between register values and divisors
> >   through a table when calculating rates of dividers
> > - Fix the definition of i2s_bclk and i2s_sysclk
> > 
> > IMHO it's better to split them into separate patches for clearness.
> Ok, I will split them into separate patches.

Thanks, that'll be easier to review.

> ...
> > 
> > ...
> > 
> > > diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> > > index c59bd7a38e5b4219121341b9c0d9ffda13a9c3e2..253db8a602fe43a1109e2ba248af11109c7baa22 100644
> > > --- a/include/soc/spacemit/k1-syscon.h
> > > +++ b/include/soc/spacemit/k1-syscon.h
> > > @@ -29,10 +29,11 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
> > >  #define APBS_PLL3_SWCR3			0x12c
> > >  
> > >  /* MPMU register offset */
> > > +#define MPMU_FCCR			0x0008
> > >  #define MPMU_POSR			0x0010
> > > -#define  POSR_PLL1_LOCK			BIT(27)
> > > -#define  POSR_PLL2_LOCK			BIT(28)
> > > -#define  POSR_PLL3_LOCK			BIT(29)
> > > +#define POSR_PLL1_LOCK			BIT(27)
> > > +#define POSR_PLL2_LOCK			BIT(28)
> > > +#define POSR_PLL3_LOCK			BIT(29)
> > 
> > This reformatting doesn't seem related to the patch.
> It's worth that create a new commit to reformatting it?

IIRC, the indentation is intended to show the relationship between
register bits and offsets, which seems easier to read for me. Do you
have a good reason to change it?

>                 - Troy
> > 
> > >  #define MPMU_SUCCR			0x0014
> > >  #define MPMU_ISCCR			0x0044
> > >  #define MPMU_WDTPCR			0x0200
> > > 
> > > -- 
> > > 2.50.1
> > > 
> > 
> > Best regards,
> > Haylen Chu
> > 

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
