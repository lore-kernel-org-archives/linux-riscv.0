Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06373D232CC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 04:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIf9w4vHgRhAUVh/BHvd1rmSZ9AUL+ZP3r4DQvyaMjc=; b=u6u+6VqxxHDiWX
	dgqnzidKcT0pvsmjUdUlekONXkGCe8eL+dauzm/O9C6mwer5sxZ6U9ZbB1vzciMyfuH+w9YQwvgWQ
	h0/z94M14qOwIBm0+HGVacIUyCRFND+4WKJJVxlIoIyOfj0xvv8d0ijAfcFtT8sl3Ua9JdT1CPnNQ
	jojyRN4NNPyboVbWnF/OYPIcldLg7dK7jhccy5cROrj81K+8Q+yBecsKkLx0RIisaHBSYz7oWUsDO
	87TIVp+WpxXbZckfVO3iGH8p0FqXXybX8Y20e+O/NiWFeEALhqkEgpH6bQQM+4KGsZ473uh/jzQEA
	/GbIz+hDbDiqwnZMARqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3gU-00000001Ekv-428B;
	Fri, 09 Jan 2026 04:01:11 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3gR-00000001Ehf-2rKn
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 04:01:09 +0000
Date: Fri, 9 Jan 2026 12:00:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767931252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lavz1MSmjFqCciY/xo3Qbip068Uin2Q84GMzH2IKmGg=;
	b=pUaBBrS7sf/Nm3jDcO68XK5WakK795Qs2FNRiaTDXrAnRBCNm7K2HtrFYgw/gIYYB2dA5O
	uvY7rN7jHX+VXxRSMRekISM4Eyka9nry9AC//dq4l9ZxRg/Tj87LCW6LFqukJuoh5tgWfR
	9Ygo39IYeUOHf0lIu41pTvK/RhTdg30=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Yixun Lan <dlan@gentoo.org>, Ze Huang <huang.ze@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
Message-ID: <aWB9ZN1iDkvoAiDj@monica.localdomain>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
 <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
 <20260108012157-GYA2355@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108012157-GYA2355@gentoo.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_200108_103113_4D13801C 
X-CRM114-Status: GOOD (  27.84  )
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

On Thu, Jan 08, 2026 at 09:21:57AM +0800, Yixun Lan wrote:
> Hi Ze,
> 
>   thanks for your patch, I have few comments, see below..
> 
> On 20:05 Wed 07 Jan     , Ze Huang wrote:
> > Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
> > Banana Pi F3 board.
> > 
> > The board utilizes a VLI VL817 hub, which requires two separate power
> > supplies: one VBUS and one for hub itself. Add two GPIO-controlled
> > fixed-regulators to manage this.
> > 
> > Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 3f10efd925dc..013df91c6a4c 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -59,6 +59,26 @@ reg_vcc_4v: vcc-4v {
> >  		regulator-always-on;
> >  		vin-supply = <&reg_dc_in>;
> >  	};
> > +
> > +	usb3_vbus: regulator-vbus-5v {
> I've checked the schematics, the name is 5V_VBUS there, so for the consistency
> with previous naming convention, let's change to:
> 	usb3_vbus_5v: usb3-vbus-5v 

Agreed. I will rename it to match the schematic.

> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USB30_VBUS";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> ..
> > +		regulator-always-on;
> do you think the "always-on" property really necessary? it indicate the
> power regulator is critical, and should never been disabled even during
> suspend/resume state, for the case of USB, I think it should be totally
> fine to poweroff once the device is not used(suspended) or even disabled
> 
> besides, the regulator is designed with a gpio enabling/disabling control
> which means it can be powered to on/off state?
> 

As you pointed out in the following email, dwc3-generic-plat did not manage any
regulator. So, either keep "always-on" here, or manage vbus in dwc3-generic-plat.

> > +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> > +
> > +	usb3_vhub: regulator-vhub-5v {
> why use vhub, but not hub? where does this name come from?
> 
> and for same reason, the name in schematics is VCC5V0_HUB, so how about
> change it to:
> 	usb3_hub_5v: usb3-hub-5v 
> 

I previously used 'vhub' just to align with the 'vbus'. However, using the
schematic name is better. I will update it to usb3_hub_5v.

> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USB30_VHUB";
>                                     ~~~need to fix too, if above is valid
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> ..
> > +		regulator-always-on;
> ditto
> > +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> >  };
> >  
> >  &combo_phy {
> > @@ -67,6 +87,34 @@ &combo_phy {
> >  	status = "okay";
> >  };
> >  
> ..
> > +&usbphy2 {
> > +	status = "okay";
> > +};
> > +
> > +&usb_dwc3 {
> > +	dr_mode = "host";
> > +	vbus-supply = <&usb3_vbus>;
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "okay";
> > +
> > +	hub_2_0: hub@1 {
> > +		compatible = "usb2109,2817";
> > +		reg = <0x1>;
> > +		vdd-supply = <&usb3_vhub>;
> > +		peer-hub = <&hub_3_0>;
> > +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > +	hub_3_0: hub@2 {
> > +		compatible = "usb2109,817";
> > +		reg = <0x2>;
> > +		vdd-supply = <&usb3_vhub>;
> > +		peer-hub = <&hub_2_0>;
> > +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> > +
> can you move these two after &uart0? I'd like to keep them sorted by 
> label alphabet order..
> 

OK

> >  &emmc {
> >  	bus-width = <8>;
> >  	mmc-hs400-1_8v;
> > 
> > -- 
> > 2.52.0
> > 
> 
> -- 
> Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
