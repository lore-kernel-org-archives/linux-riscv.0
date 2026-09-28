Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3BECA5FA1
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 23:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfyaw+gLfBcyyZUO6EIF9s5WiFUwSAbCa1eNN2TXCTo=; b=GEwcQAnk+an82O
	yexZ15f6SysyQZy7I/Crt+vXIIXv/Jiml6w0na9t1/1RNrT0b976vZIJJePaqF27l2h2tgwnJ+Lr2
	sBfOvRE5Mpa3g2ayRpQzvP1DvSqqXbmjooKDUWCqTpsphr1r+8TE2g3DIuLZnVXL7cqReb9nS7HrN
	X1AtCA3aDV16bTAPZz6SOLrVd5HALEAr1LXmj4q4rX/YFpCil1rKlNagf1eZHwz1r0I55bKUCs/TU
	uet84By5em9WU4hYT+w8uuoduDRvJJlmGiIjstI8n57DCuV6QStQDWywKSbYOE1QCxHX+4oULmnde
	wtEt5sFCdcgzteiazYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKNP-00000001odR-0ttQ;
	Mon, 28 Sep 2026 23:03:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKNN-00000001odL-3eaa
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 23:03:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F74560210;
	Mon, 28 Sep 2026 23:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467D01F00899;
	Mon, 28 Sep 2026 23:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790636592;
	bh=KuqmdeBCx72SaUXKQSQQxu5JtyZyMYa7iPdmUqkdNWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aePDqIKYLLkaJCp5DjwnmNByYccW9cKLDaQdKTEd1iaMi73TCW9Ujz0G1CkjYqaNP
	 uo9pIFDb2U110ovMPZ5MBlPw1Gt6/LkWgUpi+xB5jaTiyAgI7zhAy0hKN57+T/lJm+
	 c/te2KkaO1AY92ii9DHGabdvgNYCaUjKwg2Us54CMJcEyl9k4OvxQQZCdaNZEEZl9j
	 5g1eF4kGd4sLHCSOzyoP4K1777ZPlQZxuyXs+6nyRMi4wMsq011I4M11/6lZr62SDZ
	 CABkR2uI1CU92Oz1zm+W1WCjXK0H5XKtHCRMmQE0UU6b13pH34dECVLxyuh5ApJ3X5
	 nzIaB/dJc1aJQ==
Date: Mon, 28 Sep 2026 23:03:10 +0000
From: Yixun Lan <dlan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
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
Message-ID: <20260928230310-GKB2079@kernel.org>
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

Hi Greg,

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
Any chance to queue these patches (1-4) for v7.4 cycle? Hope it not too late,
and then I will handle the rest part, thanks


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
