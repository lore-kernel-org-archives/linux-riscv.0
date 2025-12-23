Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBBAE6F07B
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJv8KzfzLkQgN02SiFGekHqqfFiCnbcix5yHO/x00I0=; b=kChCOVUvVnTmZd
	VTv8rOdcExBFlFfJoPVufifg2GgqHgg3SwPDhrGhHyemCMidyf+Jna9mYsYougJ+dACI/3lH/S62K
	+QMvStk1yEGM9/HJvwwMJ8GBqI4PV3qd02qO02vh7DXLJirdz16xcccmKvrJHodSwmKy0rNnBIvlC
	hkDHIexCEO/uWWmLpH94elDVCvac/wKmHfImUGUzy6XQzUA1eIr7w0VhvUOHNgD9DTPVaqYb5xpz8
	jDr2HFg3XLoCS4wVkKzl1clWPGZx83JJsg0k+k5WuYoHxC6U4bCp7sJZOp4YQx5ghBT2lrL0VnRmI
	oHbP1ey8VfwV5w475tbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz2Q-0000000EnJo-0dBv;
	Tue, 23 Dec 2025 09:50:42 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXz2N-0000000EnIO-2dP3
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 09:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766483417;
	bh=1KBspn3lmpuGr/bDugn3e48PSLrjb85y6rjRy4Voyt4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=u24iAiyNs6lGt0qgzU2EpPrW9NT9VbylknFN0ewSm6DQpPb+xUtQUwMlS2iFQDRU5
	 AcRVKgh1xCL4jQWtdTl/9BY/qGgB9VMnK0NYaPCQH7W/9BSG+pRuKG/+A/OrbG2+J9
	 txZ/NOuyhksgqwlDVVzHFZ8mZRxzfJMV/RrrLPEA=
X-QQ-mid: zesmtpgz7t1766483410t6e8ce7a7
X-QQ-Originating-IP: B1Taz1X5IZEtgU0JhcBaI4ePti2+yVkLQPsGXXa3Be8=
Received: from = ( [183.48.247.204])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:50:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4315336128673413360
EX-QQ-RecipientCnt: 16
Date: Tue, 23 Dec 2025 17:50:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <B479B24A35F8D731+aUpl0JdKOziIH14S@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <aUpirQFWf3w-5PQ2@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUpirQFWf3w-5PQ2@inochi.infowork>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MIXpHopat2Iaqb1wLJTzqDwL25IVyIFnc+2GWQpFhcUseBA29rIfaqre
	6q8uXAJAI4bMYYDiCNXhm66sTuKeAP+/hEbrYtwfGw7K6YZw6UgjyN59zzk/IQhNyiaCjRj
	7tPaKCmvBIK6BI7J/EZa2ESM8m12JJwFZYfB1gxE9wXypKJYa0yw7RI52Z+ROdjnqEHZ9p2
	BqG6SMSfGxi4eMwbAcydo8meNlx1bCeIOy9BkKicEyJRRASHt2x5ALMISl8BwF/YtH+Qy/V
	7uVL6+zpoc0nhuyMM3d16ZKFcl6/TkdQhxXdgaUdGQINT/cMASyHiFB7VNO8Lwe/GjyRTSL
	w1x0qAvs4TAhC+HM99WAJjLPvbW0R5s7PtSmSn+EgiKna7BYKQJ+FxoPrc6xmRm/WZgddnA
	v0zePzvC78ZMh2K+VpArQ1ijUZWpqswvWK1lMbYtuq2fLQ8RS4rGKiWdAQmXlwdY52nQ4Yn
	9hieQPqjky714PjeaInwWjrAHKGVty0SaCe1KSuApYtor9UxejIuEwv4WC2nVcgjyvrC4sO
	eVt3W+LmFpD0UiFW2d4FTmdDdE76LI7+BGM43dWT7P6EmBvFUfKABFbaRmI/WbGHnM7pAXM
	FJz4uCWGbCrVD/nD8EWgF55zI8zOs1pb1LZoVl2N2TxAgsnbDxz8vTV8kwuD/rp+6T3mYCZ
	k99G7mjZy9rLLKa47aTKiWe7ffHiYZmAWG/JJ8rD8IvSLMP9kWJwOEu2S2n5EN6gTyvP2MD
	vYoT/MVXLoPOPpn+J6AiulTxZ2lSzGvMFvN8t1iz4rgLjXQqeIQ/iVmK8AD3QJ+sJCnaBHn
	oOO3AueXdo4WQAt002WH/GwFyTVBelChuvgvn/6NT0wU7n/lnjDnjr5Uwg2ZusDcCPT1sXW
	Sp11pcSCUlDLZSQGklg+DLFqQky+UciPi23H/h0PjOA8gXD07CDfhysIaU8TxEPkoDvubmR
	9BOlvDcKw44qOAmv2C6pa2l83Xr8WLkUWNFYNVtSNnp9Qh75GOviQNpdvUrYyquIrBf/uFD
	wB2X4DKJIqJm9RvfQJQYw9QmYNLynJsTHMig05EU4T4DqX+4hpJ6twa4dAmCmGhpNblXPw5
	WgyLxs0zGzTWRWIxkuKmbMTlTddgxZH51s/kAQeyAsV0rDE7+SnGjA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_015040_049829_C1BCF2AE 
X-CRM114-Status: GOOD (  22.84  )
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

On Tue, Dec 23, 2025 at 05:42:26PM +0800, Inochi Amaoto wrote:
> On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> > IO domain power control registers are used to configure the operating
> > voltage of dual-voltage GPIO banks. By default, these registers are
> > configured for 3.3V operation. As a result, even when a GPIO bank is
> > externally supplied with 1.8V, the internal logic continues to
> > operate in the 3.3V domain, which may lead to functional failures.
> > 
> > This patch adds support for programming the IO domain power control
> > registers, allowing dual-voltage GPIO banks to be explicitly configured
> > for 1.8V operation when required.
> > 
> > Care must be taken when configuring these registers. If a GPIO bank is
> > externally supplied with 3.3V while the corresponding IO power domain
> > is configured for 1.8V, external current injection (back-powering)
> > may occur, potentially causing damage to the GPIO pin.
> > 
> > Due to these hardware constraints and safety considerations, the IO
> > domain power control registers are implemented as secure registers.
> > Access to these registers requires unlocking via the AIB Secure Access
> > Register (ASAR) in the APBC block before a single read or write
> > operation can be performed.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 131 +++++++++++++++++++++++++++++++++-
> >  2 files changed, 131 insertions(+), 4 deletions(-)
> > 
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 7818ca4979b6a7755722919a5958512aa11950ab..23ecb19624f227f3c39de35bf3078379f7a2490e 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -565,10 +565,12 @@ i2c8: i2c@d401d800 {
> >  
> >  		pinctrl: pinctrl@d401e000 {
> >  			compatible = "spacemit,k1-pinctrl";
> > -			reg = <0x0 0xd401e000 0x0 0x400>;
> > +			reg = <0x0 0xd401e000 0x0 0x400>,
> > +			      <0x0 0xd401e800 0x0 0x34>;
> >  			clocks = <&syscon_apbc CLK_AIB>,
> >  				 <&syscon_apbc CLK_AIB_BUS>;
> >  			clock-names = "func", "bus";
> > +			spacemit,apbc = <&syscon_apbc 0x50>;
> >  		};
> 
> If you insist on a new reg field, you should change the binding as well.
Yes, I forgot to modify the binding.

> This change breaks binding, can we use something like <0x0 0xd401e000 0x0 0x1000>?
I'll double check this. Thanks!

                            - Troy
> 
> Regards,
> Inochi
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
