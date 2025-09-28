Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D8CCAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 05:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTJ7DjiyDtqIcCu1g9naPSbGSUxvkyX5HU3RBPrvROs=; b=XXsIy6zmznIuL7
	h0SbrMzaNfgBQBqEfEVFAFaUSCYamfM964YK10CjSTAGkC0H4vwPYDAAvHAqJ/EQ4EwNkHSHPrl8F
	U/8HhLqNTZPu8MolX1Tg46PKyNr7P1BbHd2RZehEotM0wYTQW0AZK1t3KjL9AHy9i8taNPQFP5etm
	vlpAylHlQnJBY7xnzHaWdhPb+VbWxxtjPfebpveGuvihHB/dweW+aGplsqlVTM+h9AeNhhn22J1U1
	htLLLDl+ZEqenNpEKu7G+ox9jOImKarn/zBXI82aOwhmi3pi8PK7Q501Z0E5DVvq5CADd5Vg5AsWi
	aBGB1w5uPU8uQjNNl7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2jhB-0000000Dw81-1cKU;
	Sun, 28 Sep 2025 05:11:37 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2jh8-0000000Dw54-00BB
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 05:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759036214;
	bh=UA1qJURCZwLdvL82SG3SQoBTLla6vgH9fxecp6XUcf0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=XBOi12wjqi1GeJug2xMi8AbYSQjmegbpCwMOAwcD9AdcIaohEnNouW8oKdD3Ri1EX
	 aFmTUJv+DOdG2Qo9YU1k859XIZMZKesqddg36OGyMXCAhvLq2bERaH4uzpcBrA87y/
	 gjWRu9rL60aZIA5OAPie7SspYkhGaFsOGGtarCK4=
X-QQ-mid: esmtpgz16t1759036211te633a7cc
X-QQ-Originating-IP: 5UrDWMN67WjQ6+g3kaNEmQsia4NxmONpMnxQZJnktgo=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 13:10:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15722752708494261181
EX-QQ-RecipientCnt: 16
Date: Sun, 28 Sep 2025 13:10:10 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: E Shattow <e@freeshell.de>, Troy Mitchell <troy.mitchell@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MusePi Pro board device
 tree
Message-ID: <D0091C3AA4E189AD+aNjDMpVOUJ6SZcAJ@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com>
 <beacb546-e4c4-43db-8f4c-97ea3cb55b43@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <beacb546-e4c4-43db-8f4c-97ea3cb55b43@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NWth7vBa++GdjblFVo5LE5OLzN3uMVj+IIGUZtb80IeyZzswZp6McyHv
	eT8WOmbac7J1L6aRNX2zvfzhSVweRzamQ7GGkwzlodF1g9oodiGYy7MB9gEJ7eesMt9TPKj
	Oi0399b4VPTr4MQ/A+/+J2mtXqGPZVQeQL0qbgePVwjgm1eGAoNv53ByaY6yl6/vRJTsOOj
	guK1gPeZb2rA10X2Pu1JIIXya59DCoav5uJTTv6+nAhjlzFNT29AWivOU8C/VuL0fIQbQM1
	020qhqo2pNyAD6mKHOZ6spxJ1Sf/sMwtBlhfCSHL0UUm4PrMOOxh4GmIP0rres2GPahYviE
	C1kCwU/EczW2SdA+LcOd8XMvOeLslqBWxLd/4biCX8CjHK9YkOjCqpL9Q+vl0Rs3219R2Nq
	gz0mEab9ugaSgzDN+bgwE65Ibg3gj8yGrgpoKwZpqB/hzaBxFZl04YakIGgzadTTFAjKCsD
	bvEQIautoAdmtZs5PmKwUgpeUT6ckUojDrGCu357VvwaUNRPOAQo7AXAvsfrpVPOZeU99FS
	hyMc1M5M97q/s6NAANvFypBK1ON8tovlfoEhZQZIXh02xlPPtuIULB42Se4DC+EjH7lPMJE
	2fMHE0aj8FAzPkQY58EE19S17i1W2PVwsjqGIOFd8E7D4OOWlNRYU0wqsdPaJny/ScUS2ln
	tSSPkIYjxYFtGAeVEaeLykVfBGl8d+HDIZzd/u7jBxQZU8npBhVZYA7jXddDKapakULsXhd
	/j+rKv1sPKjw18Eu+kniWwi+EVjy2S+IDS4Qi9znfXM8vO7VGdCXY09Z/gAUm5f+IRI/Kf+
	7CvQKjA5xxyO2DRrLARZoHYZc3tx3Y0eETg5jO3dwaH089rXvZD/MIy6V5WYYP85rOxsgSA
	UhsxMfLrfg7mHdR8yzakHLZxEb3K3bGmi0sgrHGWp4MoaUSnVETr3gOMSSjzXjYDVl+xK48
	cpiuxKoP5/hmfgV4TjdPvIb1xrbP4HyT8N0dJEEyZysYyeII5PZ2ZgS+wHix/hNjd21Z+X8
	00OgPka8tDGGwoJoO4QhnYEvZoblu4bjK45K6LzLsEu57/FgL6z7vtIZfSUhuTQ0dHI1uqU
	4J+bEdJmNgY4qF7bb6zXSA=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_221134_803899_DF988A0E 
X-CRM114-Status: GOOD (  22.07  )
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

On Sat, Sep 27, 2025 at 10:05:54PM -0700, E Shattow wrote:
> On 9/27/25 21:16, Troy Mitchell wrote:
> > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > 
> > Add initial device tree support for the MusePi Pro board [1].
> > The board is using the SpacemiT K1/M1 SoC.
> > 
> > The device tree is adapted from the SpacemiT vendor tree [2].
> > 
> > This minimal device tree enables booting into a serial console with UART
> > output and a blinking LED.
> > 
> > Link:
> > https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> > https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_MUSE-Pi-Pro.dts [2]
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/Makefile          |  1 +
> >  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 40 ++++++++++++++++++++++++++
> >  2 files changed, 41 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> > index 152832644870624d8fd77684ef33addb42b0baf3..76b98096e2a46c3192651d6d66af7742f740c635 100644
> > --- a/arch/riscv/boot/dts/spacemit/Makefile
> > +++ b/arch/riscv/boot/dts/spacemit/Makefile
> > @@ -2,3 +2,4 @@
> >  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
> >  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
> >  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> > +dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3791186ce47b88887eab4321dcd7035668e7f02d
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > @@ -0,0 +1,40 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
> > + * Copyright (C) 2025 Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "k1.dtsi"
> > +#include "k1-pinctrl.dtsi"
> > +
> > +/ {
> > +	model = "MusePi Pro";
> > +	compatible = "spacemit,musepi-pro", "spacemit,k1";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0";
> > +	};
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +
> 
> > +		led1 {
> > +			label = "sys-led";
> > +			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +			default-state = "on";
> 
> Can you explain how you decided to sort this?  I think the documentation
> examples needs updating but it is unclear to me.
This snippet comes from the BPI-F3 DTS.
I only verified the pins and polarity against the schematic.

                           - Troy
> 
> > +		};
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_2_cfg>;
> > +	status = "okay";
> > +};
> > 
> 
> Best regards,
> 
> -E Shattow
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
