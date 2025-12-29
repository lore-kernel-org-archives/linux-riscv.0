Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EFFE92734
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 16:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMnNrXHNDBKh3uJv+XL1zCMoUp2VY8yuMbO0BzS4bhQ=; b=rin8D1mwqHJtfV
	YruJAjfscu/59FbGRiLTKtiC8BkMb7W8mDqFWqZ/1Y76C8UjRLnfL0UAJimxLwqTdMB6Vh5sSLmaU
	EEzLWLqHhW76VTcbrTygF8wKq4J3wa4R53beQzF211qdJhi+I+9Y74ntb2yeVX4WELeZDZohkf2kS
	rmGU84RO2RDJTK/rjZjILN4X8GVWCEs6Yh2Fk4QDck+cPLKdn4GDskM0ettT7ftljUze8Gnsp+ApP
	RCDHtZXa6VkC0BcNlm5+Ff8UKGBDTsKn84yyEjKiPACOPgJuZkPVUA7wfokIxSSuHr9Jx53fO3c95
	FMBh8b8BdSLv1WvF/k9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaGAK-00000003soX-1bYU;
	Mon, 29 Dec 2025 16:32:16 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaGAG-00000003smw-1qmw
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 16:32:14 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251229163205euoutp017326870a588be18abd4fdf341a1bc32b~FvLevlXHZ0525505255euoutp01t
	for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 16:32:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251229163205euoutp017326870a588be18abd4fdf341a1bc32b~FvLevlXHZ0525505255euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767025925;
	bh=ExuLuxvl1jriYgk9lUcZeu3ugdqLUTCtudQjE6LZFdU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=OUtfCeto9if+4bYrYwp+GWsRyDWuD6AyJW8UKJeGrqKoriGKr5kYlYTNdA2Lcs7no
	 2jmv7sB5rLPYTOX588jBaXA8gQjpZSs7EJ3XOVBFc2/E2i16RBNXcG3L9mhWnQKJgR
	 WfjSDB8fkHclTM1JBTSCy+WyBwNwrJnNUdNzNAF0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251229163205eucas1p1e9395170d400ce20537e79156f44778b~FvLeQqbAc1226212262eucas1p11;
	Mon, 29 Dec 2025 16:32:05 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251229163204eusmtip2db25adcf9b918fc714030cdbfc1150d0~FvLdReIoO2218922189eusmtip2Y;
	Mon, 29 Dec 2025 16:32:04 +0000 (GMT)
Message-ID: <a1d2fc77-ac57-49d4-a13e-cc391e6e2b92@samsung.com>
Date: Mon, 29 Dec 2025 17:32:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Verisilicon DC8200 driver (and adaption to
 TH1520)
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
	Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
	<heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
X-CMS-MailID: 20251229163205eucas1p1e9395170d400ce20537e79156f44778b
X-Msg-Generator: CA
X-RootMTR: 20251224161255eucas1p24c6de486b021f25007ed1ce24468cab2
X-EPHeader: CA
X-CMS-RootMailID: 20251224161255eucas1p24c6de486b021f25007ed1ce24468cab2
References: <CGME20251224161255eucas1p24c6de486b021f25007ed1ce24468cab2@eucas1p2.samsung.com>
	<20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_083213_073408_AE0ECB6A 
X-CRM114-Status: GOOD (  21.71  )
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



On 12/24/25 17:11, Icenowy Zheng wrote:
> This patchset tries to add a driver for Verisilicon DC8200 driver, and
> demonstrates the driver on T-Head TH1520 with its HDMI output.
> 
> This display controller IP is used on StarFive JH7110 too, but as the
> HDMI controller used there isn't as common as the DesignWare one, I
> choose to use TH1520 in this patchset.
> 
> The DC driver is written with other DC-series (mainly DC8000, which is
> known to be used on Eswin EIC7700 SoC) display controllers in mind, and
> uses the identification registers available on all Vivante branded IPs.
> A known exception is DCNano display controller, which is unlikely to be
> supported by this driver because of totally different register map and
> no known identification registers. (P.S. the in-tree loongson DRM driver
> seems to be for some DCNano instances based on the register map.)
> 
> The HDMI controller seems to come with some common PHY by Synopsys, the
> DesignWare HDMI TX 2.0 PHY. By searching a few register names from the
> BSP driver of that PHY, that PHY seems to be used by a in-tree dw-hdmi
> glue, rcar_dw_hdmi -- an updated downstream version of rcar_dw_hdmi
> contains all 6 registers set here in the th1520-dw-hdmi driver. Some
> more suprising thing is that RK3288 uses the same PHY too, but the
> in-tree dw_hdmi-rockchip driver writes the configuration data array in a
> weird way to reuse the HDMI 3D TX PHY configuring function. It might be
> valuable to add common configuring function and configuration data
> definition for this HDMI 2.0 PHY too, but the current driver in this
> patchset simply duplicated most configuration logic from rcar_dw_hdmi
> driver (but with 3 extra configuration registers configured).
> 
> Icenowy Zheng (9):
>   dt-bindings: vendor-prefixes: add verisilicon
>   dt-bindings: display: add verisilicon,dc
>   drm: verisilicon: add a driver for Verisilicon display controllers
>   dt-bindings: display/bridge: add binding for TH1520 HDMI controller
>   drm/bridge: add a driver for T-Head TH1520 HDMI controller
>   riscv: dts: thead: add DPU and HDMI device tree nodes
>   riscv: dts: thead: lichee-pi-4a: enable HDMI
>   MAINTAINERS: assign myself as maintainer for verisilicon DC driver
>   mailmap: map all Icenowy Zheng's mail addresses
> 

I tested this patchset on the Lichee Pi 4A (TH1520). I successfully ran a 
fully hardware accelerated graphics stack using Weston and Zink over the 
HDMI output.

I have documented the reproduction steps and test results here:
[1] https://mwilczynski.dev/posts/riscv-gpu-zink/#building-the-stack-reproduction-guide

Great work, thank you!

Feel free to add to driver and DTS patches (3,5,6,7).
Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
