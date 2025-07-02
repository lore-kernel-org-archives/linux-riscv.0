Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E3DC7EE30
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 06:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2/b95BVcahAejuYtefj2aH4jv0Y8bHImsa+6EwDXFg=; b=ccTK7lwx3Kv5k7
	mFJczLAtVV9DUrmgxBoGwCFiBb/fVln2QGwJNWa4PZi1v6L5tVxYXlhDNemljgO6KNNoJAROtjMOP
	O53OmJL9sCVY/FaNqnpyQIUIMIvlvzSGOVnycNXex9k66esnZrYqWFMM5a1acjSBgVSH/Jg0g5cle
	sLtUmfeIVPPOhU6VFOq9sPyervgvyWrEr71NhPIyXKXNtgrOCYGXhlMMnweHcFuw3tZRToo2h7PnG
	DNVdvqBwiQMPmut8DvAIBXXw1E1Oi4gTvoVfMhaNRKJtP4NskKRwt+Rwr80zqO8bAC5xYVHWTbLWN
	R+TEfCYo73noWVou5QNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqmq-00000007Nt2-1wCO;
	Wed, 02 Jul 2025 06:17:40 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWqmn-00000007Nsf-2ufv
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 06:17:39 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 86AE7341F5E;
	Wed, 02 Jul 2025 06:17:35 +0000 (UTC)
Date: Wed, 2 Jul 2025 06:17:17 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/6] reset: spacemit: add K1 reset support
Message-ID: <20250702061717-GYA304216@gentoo>
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250618111737-GYA157089@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618111737-GYA157089@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_231737_761053_C824C87C 
X-CRM114-Status: GOOD (  32.68  )
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

Hi Philipp,

On 11:17 Wed 18 Jun     , Yixun Lan wrote:
> Hi ALL,
>   As the reset driver going through several review cycles,
> it becomes quite calm down now, I'd like to request to merge
> it into v6.17, because various drivers (pwm, emac..) will depend
> on it, even in the worst case if there is problem, I believe Alex
> will help to address..
> 
> Hi Philipp,
>   I'd like to query if you willing to take the reset driver -
> patch [5/6] through the reset tree? It sounds more intuitive,
> which also will avoid potential conflicts with Kconfig/Makefile..
>   I've created a prerequisite immutable tag which could be
> shared between clock and reset subsytem. It's tag -
> spacemit-reset-deps-for-6.17 at SpacemiT's SoC tree [1], which 
> effectively are patches [1-4] of this series.
> But, to make your life easy, I've also applied patch [5/6] at tag
> spacemit-reset-drv-for-6.17 [2] which has a small macro adjustment
> requested by Alex at [3]
>   Let me know what you think of this, thanks
> 
Just want to ping this, what do you want from my side to proceed?

or do you want me to send a more formal Pull-Request for [1],
then you can apply patch [5/6] (still need to fix the macro of [3])


> 
> Link: https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-deps-for-6.17 [1]
> Link: https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-drv-for-6.17 [2]
> Link: https://lore.kernel.org/all/528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com/ [3]
> 
> On 20:11 Thu 12 Jun     , Alex Elder wrote:
> > This series adds reset controller support for the SpacemiT K1 SoC.
> > A SpacemiT reset controller is implemented as an auxiliary device
> > associated with a clock controller (CCU).  A new header file
> > holds definitions used by both the clock and reset drivers.
> > 
> > In this version several "multi-bit" resets have been redefined as
> > individual ones.  For example, RESET_AUDIO had a mask that included
> > 3 bits.  Now there are 3 separate resets (one for each bit):
> > RESET_AUDIO_SYS; RESET_AUDIO_MCU_CORE; and RESET_AUDIO_APMU.
> > 
> > The reset symbols affected (their previous names) are:
> >     RESET_USB3_0 ->
> >       RESET_USB30_AHB,  RESET_USB30_VCC, RESET_USB30_PHY 
> >     RESET_AUDIO ->
> >       RESET_AUDIO_SYS, RESET_AUDIO_MCU, RESET_AUDIO_APMU
> >     RESET_PCIE0 ->
> >       RESET_PCI0_DBI, RESET_PCI0_SLV, RESET_PCI0_MSTR, RESET_PCI0_GLB
> >     RESET_PCIE1 ->
> >       RESET_PCI1_DBI, RESET_PCI1_SLV, RESET_PCI1_MSTR, RESET_PCI1_GLB
> >     RESET_PCIE2 ->
> >       RESET_PCI2_DBI, RESET_PCI2_SLV, RESET_PCI2_MSTR, RESET_PCI2_GLB
> > 
> > No other code has changed since v10.
> > 
> > All of these patches are available here:
> >   https://github.com/riscstar/linux/tree/outgoing/reset-v11
> > 
> > 					-Alex
> > 
> > Between version 10 and version 11:
> >   - Rebased onto Linux v6.16-rc1
> >   - Redefined several "multi-bit" resets as individual ones.
> > 
> > Here is version 10 of this series.
> >   https://lore.kernel.org/lkml/20250513215345.3631593-1-elder@riscstar.com/
> > 
> > All other history is available via that link, so I won't reproduce
> > it again here.
> > 
> > Alex Elder (6):
> >   dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
> >   soc: spacemit: create a header for clock/reset registers
> >   clk: spacemit: set up reset auxiliary devices
> >   clk: spacemit: define three reset-only CCUs
> >   reset: spacemit: add support for SpacemiT CCU resets
> >   riscv: dts: spacemit: add reset support for the K1 SoC
> > 
> >  .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
> >  arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
> >  drivers/clk/spacemit/Kconfig                  |   1 +
> >  drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
> >  drivers/reset/Kconfig                         |   9 +
> >  drivers/reset/Makefile                        |   1 +
> >  drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
> >  .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
> >  include/soc/spacemit/k1-syscon.h              | 160 +++++++++
> >  9 files changed, 775 insertions(+), 127 deletions(-)
> >  create mode 100644 drivers/reset/reset-spacemit.c
> >  create mode 100644 include/soc/spacemit/k1-syscon.h
> > 
> > 
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > -- 
> > 2.45.2
> > 
> 
> -- 
> Yixun Lan (dlan)

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
