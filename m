Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7073FD78761
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osxv8PVS0FaFUUsKY27jcK/wauCx2L4QYsCXl+/l1JE=; b=46KQuG5sL/WTZj
	DEvgh45dKTbuMh0EIbnJmkFG+dejv+JRic+SIXc7xy3g4i/we5vfK/6H/b1LO0ooCPajnFdBu0m4N
	Hgseyyv2av/S2AfPtv6ncgKoVbIXEim25yxssOMlJtBJVTgMEkoZGEPJjWOaUN9cr/1fW6X6ciUp3
	/VZUt9tI0jsbjQ4EM2PvuCnG/sqdzbDqLT/21TCl0HfhnbnTuH64ckqNrOLbcExCPjmoQAGF4D50l
	1ooPgD5v7rf9aHXvpiPvUY3MNATE6x5xksW41WjW0Pb6WYc5WzGAciOmjlTE6sEZN+yOGYNV3+o3H
	0ijDUgdK/1DwMN+Hp6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZRz-0000000AHA8-0nQy;
	Fri, 19 Dec 2025 12:19:15 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZRw-0000000AH98-1Kx2;
	Fri, 19 Dec 2025 12:19:13 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E3D7E34101D;
	Fri, 19 Dec 2025 12:19:09 +0000 (UTC)
Date: Fri, 19 Dec 2025 20:19:01 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, ziyao@disroot.org,
	aurelien@aurel32.net, johannes@erdfelt.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
Message-ID: <20251219121901-GYB1958363@gentoo.org>
References: <20251218151235.454997-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041912_375734_7BD50B3A 
X-CRM114-Status: GOOD (  19.53  )
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

Hi Vinod,
 Could you take a look of this series? I suppose patch 1-3 should go via
the generic phy tree, for patch 3, it's already got Neil's R-y [1] which
Alex should collect the tag..
 the Changelog for previous versions are also dropped.. which is bad

Link: https://lore.kernel.org/all/ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org/ [1]

On 09:12 Thu 18 Dec     , Alex Elder wrote:
> This series introduces a PHY driver to support PCIe on the SpacemiT K1
> SoC.  The PCIe controller implementation is derived from a Synopsys
> DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
> PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
> lane, and the other two ports each have two lanes.  All PCIe ports
> operate at 5 GT/second.
> 
> The PCIe PHYs must be configured using a value that can only be
> determined using the combo PHY, operating in PCIe mode.  To allow
> that PHY to be used for USB, the needed calibration step is performed
> by the PHY driver automatically at probe time.  Once this step is done,
> the PHY can be used for either PCIe or USB.
> 
> The PCIe controller driver that was included in earlier versions of
> this series has already been accepted upstream:
>   a812b09a6b599 ("dt-bindings: pci: spacemit: Introduce PCIe host
> 		  controller")
>   ff64e078e45fa ("PCI: spacemit: Add SpacemiT PCIe host driver")
> However this series still includes devicetree patches to enable the
> PCIe controller (along with the PHYs).
> 
> The patches that remain in version 7 of this series are unchanged;
> they are simply rebased on top of Linux v6.19-rc1.  The first two
> patches are the DT bindings for the PCIe and combo PCIe/USB PHY.
> The third is the PHY driver, and the last two are devicetree updates
> to enable the PCIe controller and PHYs.
> 
> 					-Alex
> 
> Alex Elder (5):
>   dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
>   dt-bindings: phy: spacemit: Introduce PCIe PHY
>   phy: spacemit: Introduce PCIe/combo PHY
>   riscv: dts: spacemit: Add a PCIe regulator
>   riscv: dts: spacemit: PCIe and PHY-related updates
> 
anyway, for this series, I've also tested on bananapi with nvme card, so

Tested-by: Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
