Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AB4C44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pU/02pJNzO2GdHMz/fs+jmBpuwxTBgfzh2kOu0gWJ0=; b=JuwBzAD1bLohQp
	OId5ZHAJOwvoHNXDk+or1YEH4UsnhdRn0X6oQ518Xdl+zIcadek5+zHI34ZfCdFxx6uwp5mwZQhVr
	R5OLJdWYXnPl78hdzoGgUXJIBkMIr54Q9kItqQNTPufX9ajgdogVZ6K8BiWT06d4Ymc7Wyrj3GtAV
	U1eTjbhTel36+3EKenFuxA3qTMbOEVjYsCeZg7pgr0LvqY8egyMnxPP3ebT33JIX7Kuxnh8V57Hf5
	DgZH74JZREdxH66XE+7oTS5s2skeRxn/8D1R5DoF5/Brmc+CXcttJDUUg6OO/vz+lIbaQMU5GhqXG
	QjeYMB33t6zFMN5iztnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjy9s-0000000Ee0w-3mf5;
	Wed, 15 Jul 2026 11:52:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjy9r-0000000Ee0o-0fau
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 11:52:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F6A06001A;
	Wed, 15 Jul 2026 11:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7271F1F000E9;
	Wed, 15 Jul 2026 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784116330;
	bh=QFDdMoKX1RyN8bBSjTRWdd3gXuAAm8i7lQ495KTpXO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rtf7k/8J4bvntFdgQC37Z8dbnz/QGQIQC2JeJVTFZP6LtyDOv0EGNk6mSGRgkvml5
	 e9IGBhIDU3/H+aEkNFE/ZKlo0zI2nrYEwINq64H0hjDvePTWh0IYROUKoyk7mz8OLt
	 mJWICIYDqSeq3AYIERkwEga6hwK4F2Zj/0//oVAp1xyAPBwZ8BakFYlcjSH8AIuUip
	 SaY7UNCMfAC3EOz1arKsranb7dH/w9o6RmBsFWjEYwrnGzzXmwLEs7Id5LzhXS6Qdm
	 o/k3mPFC4XPNW5L7rYcl0YCSlE7aCCt1Be1kw5MLYDcNX5AtB7EwOQ8mRuCf7cnBPN
	 2Dtyxfg75f53Q==
Date: Wed, 15 Jul 2026 11:52:06 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: Re: [PATCH v3 0/3] spacemit: k1: Add support for Banana Pi BPI-CM6
 IO board
Message-ID: <20260715115206-GKF106000@kernel.org>
References: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
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

Hi Junhui,

On 12:00 Sun 12 Jul     , Junhui Liu wrote:
> This adds initial support for the Banana Pi BPI-CM6 IO board. The
> BPI-CM6 is an industrial-grade RISC-V compute module powered by the
> SpacemiT K1 SoC, featuring board-to-board connectors similar to the
> Raspberry Pi CM4 form factor. For evaluation and development, the module
> is paired with a companion IO carrier board.
> 
> During the board bring-up, GPIO45 and GPIO46 were found to be used by
> the BPI-CM6 hardware as Ethernet PHY reset GPIOs, while the common K1
> GMAC pinctrl groups currently mux them as optional GMAC reference clock
> pins. Since the reference clock pins are not required on all K1 boards,
> the second patch separates them into independent pinctrl groups so board
> DTS files can select them only when the signal is actually wired.
> 
> Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

For the series, looks good to me

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> Changes in v3:
> - Remove uncontrolled always-on intermediate fixed regulators to
>   reduce device tree bloat
> - Rebase to v7.2-rc1
> - Link to v2: https://lore.kernel.org/r/20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
