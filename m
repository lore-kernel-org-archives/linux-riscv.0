Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FA4C282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdE4q0EUW0F9kH8gYeOqjQJl0IIx6aQuV4Wiy/tSRzo=; b=vDQZjZTz9oIiup
	V5OYc8M5vLvU/bIUIgHy2KHjA+DTHrYVbIli/518EQeihURANGBPe3nooG3nVbiBwfQfnsolUFWiU
	48dcN3MqH65V5GN19KmAmRGmg6RMV17VXDyogu7Hpu+ItyWoAvw1gqKNS9kESy8WdJ3ESy1RWBjXB
	GtIKV+sETAX0H+cB5fVKB07yCMSSBJhE7uus5BWrDJ3PzWG4avaLotWdMS+RKfBcEJ0c+l2o8sG3A
	RisYMSLAoZhDp8aSwxAorfeqRJHReqWu+wuTrpJYzD6ceTXHBT78Hkpt/N9had1tz3Ryggj3SXglS
	Arv3GO/j4MqVsYkTEJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2Lm-00000000BYQ-3AxT;
	Mon, 03 Mar 2025 09:44:38 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2Iv-00000000Axg-0IcG
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 09:41:43 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 3AC39EC59F4;
	Mon, 03 Mar 2025 01:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1740994897; bh=XsOhRhGgIDJZEEWgUUzXOzwpJUSE7vf/DDvuB57+LP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yFMzXf6x+euNhqYdyFc2mk88iMskDnSIVOTDXSspYDwR61/P5TtT40yJaGze14i99
	 tQuWMrU1/jJkEUPl7lMg/y62pOd3WbyclC+UBtUVcdognCJTCkQXU9pcukBFwMGfdO
	 MFpPPwV4YtsO8RLngunqoBnjFw2PjlOGEq1upPxN7sWbuLb/p1Mz8b4YSLQ7IEFcXn
	 S/loUzkMUg8yqRGlah9v2CZD0xvadgb7TtV05K8J9eDW0F734GoseYmsG/PyH/X0lu
	 0zwNLde4wN4SCC7DmrfK228b5/g3biZSihXiQnDYecKy1nY0B4wijv2IJM0cPiepT1
	 IRQB0sWDRg4Hw==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hd0nTS58Kd8d; Mon,  3 Mar 2025 01:41:29 -0800 (PST)
Received: from ketchup (unknown [183.217.83.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id A2B54EC59F2;
	Mon, 03 Mar 2025 01:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1740994889; bh=XsOhRhGgIDJZEEWgUUzXOzwpJUSE7vf/DDvuB57+LP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/tG6KbQJ4zHh11BSoOdeU+HJBzVDLNbNySGcG3MspSkwmzZQsHkPzJwYts033mig
	 yVsZyD230U/1mJDn+eTLyke8iQT0H6X+2iM9iFn4C0UiAS6ZN28fC/f4+XYoU7vGK2
	 Me5seqNlkGmH4/KibAMv2yg1VI4j0uPK7IugBcqMiWJ5DJJsx+Q7Fu5y0n/zsC2ESE
	 4D/nzftIbi2cDyklPBDP9LXJTe2/g1oOMGsMfM1Upohi9pHUGbeCY5LHK4ju91QokZ
	 /P/GUY2tK/YeM1sGisZi0ZPo5b8166LDKRjgeINFNixcYoWhDz0Oh7kRQ5Z+KWE3/n
	 +cWz0VMMjQo3A==
Date: Mon, 3 Mar 2025 09:41:14 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v4 3/4] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <Z8V5OjQTxVeRLAOU@ketchup>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-5-heylenay@4d2.org>
 <f8b30551-25e7-4626-8c03-6d8807041d8a@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8b30551-25e7-4626-8c03-6d8807041d8a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_014141_468904_A2E9462B 
X-CRM114-Status: GOOD (  38.66  )
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

On Thu, Feb 13, 2025 at 10:04:10PM -0600, Alex Elder wrote:
> On 1/3/25 3:56 PM, Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and is managed by several independent controllers in
> > different SoC parts (APBC, APBS and etc.), thus different compatible
> > strings are added to distinguish them.
> > 
> > Some controllers may share IO region with reset controller and other low
> > speed peripherals like watchdog, so all register operations are done
> > through regmap to avoid competition.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 
> This is a really big patch (over 3000 lines), and a fairly large
> amount of code to review.  But I've given it a really thorough
> read and I have a *lot* of review comments for you to consider.
> 
> First, a few top-level comments.
> - This driver is very comprehensive.  It represents essentially
>   *all* of the clocks in the tree diagram shown here:
> https://developer.spacemit.com/resource/file/images?fileName=DkWGb4ed7oAziVxE6PIcbjTLnpd.png
>   (I can tell you what's missing but I don't think it matters.)
> - In almost all cases, the names of the clocks match the names
>   shown in that diagram, which is very helpful.
> - All of the clocks are implemented using "custom" clock
>   implementations.  I'm fairly certain that almost all of
>   them can use standard clock framework types instead
>   (fixed-rate, fixed-factor, fractional-divider, mux, and
>   composite).  But for now I think there are other things
>   more important to improve.
> - A great deal of my commentary below is simply saying that the
>   code is more complex than necessary.  Some simple (though
>   widespread) refactoring would improve things a lot.  And
>   some of the definitions can be done without having to
>   specify nearly so many values.
> - Much of what might be considered generality in the
>   implementation actually isn't needed, because it isn't used.
>   This is especially true given that there are essentially no
>   clocks left unspecified for the K1 SoC.
> - Once the refactoring I suggest has been done, I expect
>   that more opportunities for simplification and cleanup will
>   become obvious; we'll see.
> - I suggest these changes because the resulting simplicity
>   will make the code much more understandable and maintainable
>   in the long term.  And if it's simpler to understand, it
>   should be easier for a maintainer to accept.
> 
> I'm not going to comment on the things related to Device Tree
> that have already been mentioned, nor on the Makefile or Kconfig,
> etc.  I'm focusing just on the code.
> 
> > ---
> >   drivers/clk/Kconfig               |    1 +
> >   drivers/clk/Makefile              |    1 +
> >   drivers/clk/spacemit/Kconfig      |   20 +
> >   drivers/clk/spacemit/Makefile     |    5 +
> >   drivers/clk/spacemit/ccu-k1.c     | 1747 +++++++++++++++++++++++++++++
> >   drivers/clk/spacemit/ccu_common.h |   51 +
> >   drivers/clk/spacemit/ccu_ddn.c    |  140 +++
> >   drivers/clk/spacemit/ccu_ddn.h    |   84 ++
> >   drivers/clk/spacemit/ccu_mix.c    |  304 +++++
> >   drivers/clk/spacemit/ccu_mix.h    |  309 +++++
> >   drivers/clk/spacemit/ccu_pll.c    |  189 ++++
> >   drivers/clk/spacemit/ccu_pll.h    |   80 ++
> >   12 files changed, 2931 insertions(+)
> >   create mode 100644 drivers/clk/spacemit/Kconfig
> >   create mode 100644 drivers/clk/spacemit/Makefile
> >   create mode 100644 drivers/clk/spacemit/ccu-k1.c
> >   create mode 100644 drivers/clk/spacemit/ccu_common.h
> >   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
> >   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
> >   create mode 100644 drivers/clk/spacemit/ccu_mix.c
> >   create mode 100644 drivers/clk/spacemit/ccu_mix.h
> >   create mode 100644 drivers/clk/spacemit/ccu_pll.c
> >   create mode 100644 drivers/clk/spacemit/ccu_pll.h
> > 

...

> > diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> > new file mode 100644
> > index 000000000000..6fb0a12ec261
> > --- /dev/null
> > +++ b/drivers/clk/spacemit/ccu-k1.c

...

> The next set of clocks differ from essentially all others, in that
> they don't encode their frequency in the name.  I.e., I would expect
> the first one to be named pll1_d2_1228p8.

I found this change may not be possible: with the frequency appended,
their names conflict with another set of MPMU gates.

> 
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d2, "pll1_d2", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(1), BIT(1), 0, 2, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d3, "pll1_d3", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(2), BIT(2), 0, 3, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d4, "pll1_d4", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(3), BIT(3), 0, 4, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d5, "pll1_d5", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(4), BIT(4), 0, 5, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d6, "pll1_d6", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(5), BIT(5), 0, 6, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d7, "pll1_d7", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(6), BIT(6), 0, 7, 1, 0);
> > +static CCU_GATE_FACTOR_DEFINE(pll1_d8, "pll1_d8", CCU_PARENT_HW(pll1),
> > +			      APB_SPARE2_REG,
> > +			      BIT(7), BIT(7), 0, 8, 1, 0);
> > +

...

> > +/*	MPMU clocks start	*/

...

> > +static CCU_GATE_DEFINE(pll1_d3_819p2, "pll1_d3_819p2", CCU_PARENT_HW(pll1_d3),
> > +		       MPMU_ACGR,
> > +		       BIT(14), BIT(14), 0, 0);
> > +
> > +static CCU_GATE_DEFINE(pll1_d2_1228p8, "pll1_d2_1228p8", CCU_PARENT_HW(pll1_d2),
> > +		       MPMU_ACGR,
> > +		       BIT(16), BIT(16), 0, 0);

Here're the conflicts.

Although they don't happen on all the clocks, I prefer to keep the clock
names as is for now to keep the consistency.

Thanks,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
