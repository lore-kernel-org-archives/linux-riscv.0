Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5867C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 12:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEZNSeH8Tih4L4DwAUszDVeLmQZJmD4Jg23ZGvg42A4=; b=4meTW6eWocfi+n
	6V7JUpbyC6PdjmF/nSa9f0ChgygkA2x5X2QeRoNBJJmyhtgGWFvgVpEGf7SYDv8LbJ8cuSTajwVeR
	LWaSx0qOvgAcJrRiUl/fLgqhZdnu36HhHV/2cGATjP/nUMtwW5ciHjjRbOtYll5eL1oemApFPM9ff
	vqgahYjyelEQeT9CD+BxfG2P3acxI96mj4Nt8v7ZW8dbVZxSa35fiExwmVTVgP2Djfa/GS18gFjq/
	4+O9g/wTu+SPfEUz6nLalUtb21YgeNrp43JDe8CqzI9O2BAPNfC33arOBVSYFRNswQp0azyOgTzeJ
	JHe/AgvHKLrtvD7QlLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsNt-0000000ACwd-1EE9;
	Wed, 18 Jun 2025 12:59:21 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqne-00000009upk-05x7
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:17:51 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E2552341E5E;
	Wed, 18 Jun 2025 11:17:47 +0000 (UTC)
Date: Wed, 18 Jun 2025 11:17:37 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/6] reset: spacemit: add K1 reset support
Message-ID: <20250618111737-GYA157089@gentoo>
References: <20250613011139.1201702-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_041750_084557_0E8577AF 
X-CRM114-Status: GOOD (  22.87  )
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

Hi ALL,
  As the reset driver going through several review cycles,
it becomes quite calm down now, I'd like to request to merge
it into v6.17, because various drivers (pwm, emac..) will depend
on it, even in the worst case if there is problem, I believe Alex
will help to address..

Hi Philipp,
  I'd like to query if you willing to take the reset driver -
patch [5/6] through the reset tree? It sounds more intuitive,
which also will avoid potential conflicts with Kconfig/Makefile..
  I've created a prerequisite immutable tag which could be
shared between clock and reset subsytem. It's tag -
spacemit-reset-deps-for-6.17 at SpacemiT's SoC tree [1], which 
effectively are patches [1-4] of this series.
But, to make your life easy, I've also applied patch [5/6] at tag
spacemit-reset-drv-for-6.17 [2] which has a small macro adjustment
requested by Alex at [3]
  Let me know what you think of this, thanks


Link: https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-deps-for-6.17 [1]
Link: https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-drv-for-6.17 [2]
Link: https://lore.kernel.org/all/528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com/ [3]

On 20:11 Thu 12 Jun     , Alex Elder wrote:
> This series adds reset controller support for the SpacemiT K1 SoC.
> A SpacemiT reset controller is implemented as an auxiliary device
> associated with a clock controller (CCU).  A new header file
> holds definitions used by both the clock and reset drivers.
> 
> In this version several "multi-bit" resets have been redefined as
> individual ones.  For example, RESET_AUDIO had a mask that included
> 3 bits.  Now there are 3 separate resets (one for each bit):
> RESET_AUDIO_SYS; RESET_AUDIO_MCU_CORE; and RESET_AUDIO_APMU.
> 
> The reset symbols affected (their previous names) are:
>     RESET_USB3_0 ->
>       RESET_USB30_AHB,  RESET_USB30_VCC, RESET_USB30_PHY 
>     RESET_AUDIO ->
>       RESET_AUDIO_SYS, RESET_AUDIO_MCU, RESET_AUDIO_APMU
>     RESET_PCIE0 ->
>       RESET_PCI0_DBI, RESET_PCI0_SLV, RESET_PCI0_MSTR, RESET_PCI0_GLB
>     RESET_PCIE1 ->
>       RESET_PCI1_DBI, RESET_PCI1_SLV, RESET_PCI1_MSTR, RESET_PCI1_GLB
>     RESET_PCIE2 ->
>       RESET_PCI2_DBI, RESET_PCI2_SLV, RESET_PCI2_MSTR, RESET_PCI2_GLB
> 
> No other code has changed since v10.
> 
> All of these patches are available here:
>   https://github.com/riscstar/linux/tree/outgoing/reset-v11
> 
> 					-Alex
> 
> Between version 10 and version 11:
>   - Rebased onto Linux v6.16-rc1
>   - Redefined several "multi-bit" resets as individual ones.
> 
> Here is version 10 of this series.
>   https://lore.kernel.org/lkml/20250513215345.3631593-1-elder@riscstar.com/
> 
> All other history is available via that link, so I won't reproduce
> it again here.
> 
> Alex Elder (6):
>   dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
>   soc: spacemit: create a header for clock/reset registers
>   clk: spacemit: set up reset auxiliary devices
>   clk: spacemit: define three reset-only CCUs
>   reset: spacemit: add support for SpacemiT CCU resets
>   riscv: dts: spacemit: add reset support for the K1 SoC
> 
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
>  arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
>  drivers/clk/spacemit/Kconfig                  |   1 +
>  drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
>  drivers/reset/Kconfig                         |   9 +
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
>  .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
>  include/soc/spacemit/k1-syscon.h              | 160 +++++++++
>  9 files changed, 775 insertions(+), 127 deletions(-)
>  create mode 100644 drivers/reset/reset-spacemit.c
>  create mode 100644 include/soc/spacemit/k1-syscon.h
> 
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 
> 2.45.2
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
