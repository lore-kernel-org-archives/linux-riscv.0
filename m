Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0E606A325
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 13:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RyIe3cED;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AVDT2NBg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b0OTKm0Wz1AFSs9AE/AAu8SfeMdpIiVm8noAObZu1t0=; b=RyIe3cEDw6gKjKL8sieIkDbCCx
	ZTMxz7EWv68ipCzWeBJJcFCejYoCnqgr23EGKuQpRF5piHx4KN/1PhXJC5S/Nwbvudq7TAseUnNKQ
	JT0OMNSJteDgFGJ3HmAkno+bP+lCndy284KtJrU7EM7Ig05dBL1NMOOamciflg3lUizXZNqgwjoqh
	m4lKl7+NgZunrXjw9erpDefl6ZshecbgILU3r/6D28YzTpj4hzCjSsKVC+NQdprLx8iVajT3E7Hda
	0Z5sdphsIB8o7Hp1j/eISZ5j3fKFbddccaT6ihLMTpa8TYsJsJc68NuTUkN7AG2VG7Ol+Jd+9krhb
	7iGmhBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOu5-0000000F8Rm-1jFW;
	Fri, 20 Nov 2026 13:43:49 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOtc-0000000F7qY-1Va7
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 13:43:26 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261120134316euoutp01513a55ceeac1fb47c23bbe8b8c80a0f7~pxLJAK9Zp0356703567euoutp01g
	for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 13:43:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261120134316euoutp01513a55ceeac1fb47c23bbe8b8c80a0f7~pxLJAK9Zp0356703567euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795182196;
	bh=9237+tKAR89WsuPxFlAqDCDty0GUNRZKGXXasLOl2ng=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AVDT2NBgHGsRO0KO7DoI41IixNDJ18plqCeYQue7B59xesvIJz3QQok0fPUO6n1Sw
	 vj0Cs19HyEGr45mj1VWnfM6roS9dZozGmwEh6szwoBmt+ZjP9kUdvLbUbcuSP5re48
	 JbPpsDgKcmjI3Lnj0FsAOoSy94VFvUNpn/T9zPRM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261120134315eucas1p14bd143778442db5f514865fe00a49c63~pxLInXiM60242902429eucas1p1r;
	Fri, 20 Nov 2026 13:43:15 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261120134314eusmtip1e5f11fdfc1d113cba0eecae5a72f9eb8~pxLHtfY1G0050900509eusmtip1w;
	Fri, 20 Nov 2026 13:43:14 +0000 (GMT)
Message-ID: <b6dc6c36-9ce1-49dd-bae5-245d983610bc@samsung.com>
Date: Fri, 20 Nov 2026 14:43:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI
 PHY
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Emil Renner
	Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Icenowy Zheng
	<zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Joshua
	Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>, OOHehir
	<oo.hehir@gmail.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
X-CMS-MailID: 20261120134315eucas1p14bd143778442db5f514865fe00a49c63
X-Msg-Generator: CA
X-RootMTR: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
X-EPHeader: CA
X-CMS-RootMailID: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
References: <CGME20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb@eucas1p1.samsung.com>
	<20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_054320_977939_E0B1BA51 
X-CRM114-Status: GOOD (  27.34  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/26 14:52, Michal Wilczynski wrote:
> This series adds the HDMI PHY driver for the StarFive JH7110 and shares
> the pre-PLL code it has in common with the Rockchip RK3328 Innosilicon
> HDMI PHY.
> 
> Up to v5 it was part of the JH7110 display series [1]. It is split out
> as Vinod suggested, so it can go through linux-phy on its own; the rest
> continues as v6 of "drm: starfive: jh7110: Enable display subsystem".
> Nothing here depends on the display series. The display series depends
> on this one: its HDMI subsystem binding references the PHY binding from
> patch 1, and it needs the PHY driver at runtime.
> 
> [1] https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/
> 
> The JH7110 has the same Innosilicon PHY as the RK3328, offset by 0x100
> because it sits behind the HDMI controller in a shared register block.
> Patch 2 factors out the pre-PLL config format, table lookup,
> determine_rate, recalc_rate and the pre-PLL programming; patch 3 moves
> Rockchip onto it; patch 4 adds the JH7110 driver. Pixel clock tables,
> post-PLL and analog config stay SoC specific.
> 
> Patch 3 should be a no-op for Rockchip - same writes, same order, same
> values - and RK3228, whose pre-PLL is at different addresses, keeps its
> own register code and shares only the lookup. I have no Rockchip
> hardware, so it is build tested only (arm and riscv). A Tested-by would
> help.
> 
> Patch 5 adds a MAINTAINERS entry for the binding and the driver, as the
> other JH7110 PHY drivers have.
> 
> Testing
> =======
> 
> Tested on a VisionFive 2 v1.3B together with the display series, using
> modetest: all 42 modes the sink advertises work, with pixel clocks from
> 25.175 MHz up to 297 MHz.
> 
> Every commit builds for riscv and arm.
> 
> Changes in v7:
> - Point the binding example comment at the hdmi-subsystem binding's new
>   location in bindings/display/starfive/, where the display series moved
>   it
> - Rebased onto v7.4-rc1
> - Link to v6: https://lore.kernel.org/r/20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com
> 
> Changes in v6:
> - Split out of the JH7110 display series (Vinod)
> - inno_read() returns the regmap_read() error and recalc_rate checks it,
>   instead of a failed read turning into a zero divisor (Vinod)
> - Bound the pre-PLL and post-PLL table walks with the table size instead
>   of relying on a sentinel (Vinod)
> - Lowercase hex in the JH7110 pixel clock table (Vinod)
> - New patch 5: a MAINTAINERS entry for the JH7110 HDMI PHY, moved out of
>   the display series' entry
> - Rebased onto v7.3, collected tags
> - Link to v5: https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/
> 
> ---
> Michal Wilczynski (5):
>       dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
>       phy: Add common Innosilicon HDMI PHY helpers
>       phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
>       phy: starfive: Add jh7110-inno-hdmi-phy driver
>       MAINTAINERS: Add StarFive JH7110 HDMI PHY entry
> 
>  .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
>  MAINTAINERS                                        |   6 +
>  drivers/phy/Kconfig                                |   8 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-inno-hdmi.c                        | 358 +++++++++++++
>  drivers/phy/rockchip/Kconfig                       |   1 +
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 169 +-----
>  drivers/phy/starfive/Kconfig                       |  20 +
>  drivers/phy/starfive/Makefile                      |   1 +
>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 587 +++++++++++++++++++++
>  include/linux/phy/inno-hdmi-phy.h                  |  88 +++
>  11 files changed, 1144 insertions(+), 144 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3
> 
> Best regards,

Gentle ping on this series.

Is there anything else needed from my side ?

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
