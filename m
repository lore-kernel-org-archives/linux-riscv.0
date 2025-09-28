Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EE8CAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNRp50ddo7pRnaxPxXcPVhsH+XIrQ4hRs0huEonnINQ=; b=oyndDhL8D1m4xH
	uYSgw+AyWwzZxll1Sr4DeZV8Ozv8QyEXsItAuDMZUKQ9GXO01a9X02fDxZahRX0q/uW0IGePKVKEm
	oLz8f7Nn4c/5TAjBEfVB4/GUshLkBEH83B3V/iuUY3NyqoeReT1BXDq/jAmnywR4ttl0dFqXkmS/p
	SlVTfqVOAMntEMVx9NpZwMBZ1qY9uQPMnFAs96+c7zhIBaOZuHN7KRDw2bR4E4BaR592myVRvb/JS
	4eHxnQ5HMxvFKuBjL16TDYqT5PyQXGnkWSLKDrZ+SHd8QNVuBmKo2vfDX6XPsFYaycBTFi2V1kfWK
	oDwFROITwO+smiLdK8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mQc-0000000EDbj-2zlg;
	Sun, 28 Sep 2025 08:06:42 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mQZ-0000000EDSX-2JLn
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 08:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759046733;
	bh=XydPf2hr5/LRillZoWelSgipJxHnxGk3kjMNGJt/nPE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=zAJe62i66neIscKAMAFNC62viSwONrq9JVNUIDEeXatHfPfuusRclOfWc+LY2Ny3b
	 d07TK6EIDa7ozzoOX+EUOBjt3ImaQwYXEdCVsja/x1ckRzxwiDEOKBx8DtK9mhgtLK
	 cpuhNKTYhNYHK76QR6AycxlTz6eSNzFv7fC1W03U=
X-QQ-mid: esmtpgz12t1759046731te1cd0686
X-QQ-Originating-IP: XgNb6m+8gRGQNrsjYykMtwnmjmXfp6Q8mOdpagPnEDI=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 16:05:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15804236060269286392
EX-QQ-RecipientCnt: 15
Date: Sun, 28 Sep 2025 16:05:29 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MusePi Pro board device
 tree
Message-ID: <3074FC8521909735+aNjsSWwkd1aH-moh@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com>
 <20250928080003-GYB1344940@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250928080003-GYB1344940@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MZQfbS02KrT5L+9ftrY4nKMxxuyC22YfZ7Yk2KDeBKQvgP49/eZczRCq
	M73bM4cMPxxAsAlCZlNWUgi7g520zVhg0f0WYf6BrYvMRYJbLYi/N2EF7dWHY2H5q/05mWp
	Xw9NJUUOZa12Yb+EyHSttfLWdkFBhWF4QZUoSHFt99+yipy5309pUUjsiccdGMWUtRp0D/7
	TRNhEAPPG6Veqd9yW/eHFW472iQfsCnqHfLaWwRgZPNcV8Dggz1jVDRppkdMUVjJdNZWwWi
	bepyGow4GMqvMN83Zv9UA0meF0qb2fkGFh/5QJAEMNV4nasMKsJbQ2nX+vtpy0uSz0suRaY
	eMnJkHgHUKWlTpUZJhoAwwi89R4SmsSpngXTuJwWg20DdQyyCSrcIujLhmlUWdYWjPiuFgy
	q9fE3cwUkdCKW42SqEnxv8g/e8Vehsv8PYyTlQzFJzEAnyuxoLB5AkvPiwzTzckVTyzjQ9U
	yzRrNVMW3SdC+f/GnJs0+g4No+X0NWq+tYO+PUD3SXnKt2r9mMOhFFxTYHOZZsDp35AavDp
	DB7qfuOkJc5RhWQDln+U0NhKvaBv7tm/L3oR/vUm8Qn4wXJzb5trsZBAm17OXP2KWQyz4CR
	cXyqbORpMTG8EiuOHQkOxMYwOQTiGUmqp3rVfpbOtt/TOw0gtSAfSSozE++ktwOOroLeFHG
	kTRwgQ4At3MZwC1CoUImXEzX85lLa2j6Jv0rsWHmp1vKAKKiWBT754tKBaFjxoWj6em0Euj
	ZzlDcej2hatUROubPVxpZNiCOTkbfhD2OFdFk60lhkElWA5AMG7l1lrX2J4turthGs79w2u
	jqu940xjgr07kzdN0iIn9ODl8Y+OKRmXm2AUgZvB+aQPuIVX1wiv5WWFHGxuoiOyLhdcZXi
	tJs/vWqNJwTHbs5pxzegFmLdVd333MmT+qorFazmVwz7jB+/B6gfrT6mbv3ywZCA+ZlpJtp
	p9SkPyWpPDRdqidinKrJ6l9E9o47mR5M3mBrRLkw/nNBRu+TqzwJFca/pU36GCzuAjjIJs9
	PTEG4qTOMYSqGfth2Pj9kfTt4ntk5/iYd/LW7e2wJ9Ps/wqtMc8L17QW8G0QBKVUDaBRn09
	v/hsGhECgwBrIv/MeHE8o/cQ34Ec8QJzxtpzdMd2D/K6uW3D+mSvOjJmMldfFaCMGvkRxa0
	0kJ1
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_010640_085565_CB51E9D3 
X-CRM114-Status: GOOD (  26.64  )
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

On Sun, Sep 28, 2025 at 04:00:03PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
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
> same as patch 1
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
> please sort
Oh my gosh..
That's my mistake. I will fix it in the next version.

> 
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
> this is a little bit short, how about make it "SpacemiT MusePi Pro"?
Sounds good to me.

> 
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
> > +		led1 {
> > +			label = "sys-led";
> > +			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +			default-state = "on";
> > +		};
> > +	};
> > +};
> > +
> > +&uart0 {
> ..
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&uart0_2_cfg>;
> swap these two lines, for similar reason, see my comment here
> https://lore.kernel.org/all/20250918133209-GYB1273705@gentoo.org/
Thanks for this link.
> 
> > +	status = "okay";
> > +};
> > 
> > -- 
> > 2.51.0
> > 
> 
> while you are here, I'd suggest to push as many features as possible
> instead of this minimal DT, which say - PMU, emmc, ethernet should be ready..
> (ethernet is in next, should show up at v6.18-rc1)
Good idea.
I think I should split these into multiple commits, right?
Like, PDMA and EMAC should definitely be two separate commits.

                                  - Troy
> 
> -- 
> Yixun Lan (dlan)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
