Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432BDCA5FA1
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 22:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TijfjD6kDVMrQWjGOwxJhrcHS0CAy1RhiEBUg1ijYEc=; b=KffnQ2DCc2KgSy
	gL07JJWVv0HUriIcNeA1/tYTHRCtEqk7DDBiJGrdjgvfMX3FGgRW0R44hPEdGQ2A6L/E3nFQcHlU9
	QOc/rR+6nFCRdsah9iaharXVKgw3ZTAxIdolgh+4Hy7V5J6nmGFNX3L0Hp14vGdSsrVAdsCAufLOZ
	PsVyXsIpZUYBQ0ulZbfywiF5JefV231H9jVO3dfgVpCE84inXP5JjTLD7IC3HGNiNq4gMCHX6tDJZ
	1lKGsdixNKIwp3Del7Zm3LedSTj7XqSRTIYmBme4OXtBSsjiTXblTjNmMEt7C9U8pYnO2aapbkEkc
	XbJIqLiogCK7PeaHqRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKIk-00000001oOb-3GQX;
	Mon, 28 Sep 2026 22:58:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKIj-00000001oOT-0k1w
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 22:58:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 397AD600D1;
	Mon, 28 Sep 2026 22:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDF61F000FF;
	Mon, 28 Sep 2026 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790636303;
	bh=cfTQnP72O8yqoNFmdtkzTTYSL3ptcW/zrw9B4W+6/9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mL5T2JIAbu9d2imTAacgjzW7ZmK8KIw2PWCZCicBvUq42ZqylDq8vhRnlFK9JQqK1
	 RJDTi23Gn6W+dKD5C96Mkcjwddq6xoIKAtH7BU+meta60Sj+OCObpHrCBlzz9rTB2V
	 pIsjib0tlQHXJ7d+yzgnbaYFBePlx5V4VRGI+yW4Wx0bOvKWtGCx9AcLYlio6Twvbh
	 pQReEvxr9S+08tYKTKsXaSdacCMOs0sgBzV0dQxr65bREHe2Sh0sJofrSyB2BUeUwO
	 27j/H0StmEgKa/Gxpq9Tsook7DQ0p0VG3SeFhM9aprguauHNn3WilLXery2HnnCPFT
	 p4Ns7Vbuipzgw==
Date: Mon, 28 Sep 2026 22:58:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Ze Huang <huang.ze@linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 0/8] Add SpacemiT K1 USB2.0 controllers support
Message-ID: <20260928225821-GKA2079@kernel.org>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
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

Hi Junzhong,

On 19:40 Sun 27 Sep     , Junzhong Pan wrote:
> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
> support, but the hardware has no internal OTG registers, the other is
> Host only. These controllers are compatible with Chipidea USB2 driver
> with some flags set and reset control support.
> 
> This series is based on 7.3-rc1 and has been tested on Banana Pi F3
> development board.
> 
> A self-powered USB device/hub is needed to test the host function of the
> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
> cellular module e.g.) is needed to test the host only controller.
> 
> ---
> Changes in v3:
> - collect tags
> - merge the two dt-binding commits
> - use local variables when acquiring devm managed clock/reset
> - drop manual clk_disable_unprepare() from the remove path
> - enable related drivers as modules in defconfig
> - Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com
> 
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> ---
> Junzhong Pan (8):
>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>       usb: chipidea: usb2: use devm_clk_get_optional_enabled()
>       usb: chipidea: usb2: add optional reset support
>       usb: chipidea: usb2: add SpacemiT K1 support
>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>       riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
>       riscv: defconfig: enable ChipIdea USB controller support
> 
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 28 +++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
>  arch/riscv/configs/defconfig                       |  4 +++
>  drivers/usb/chipidea/ci_hdrc_usb2.c                | 35 +++++++++++--------
>  6 files changed, 123 insertions(+), 15 deletions(-)
> ---
The series looks good, so 

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
