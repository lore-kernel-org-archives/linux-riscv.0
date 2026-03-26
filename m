Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C682109E556
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAualxvkneH+nQTmSjsOv52Zf7HY8kNxSBopBRCSsVM=; b=vtvhhSc5NZRusS
	ahxoNc8hwodLUrPa5BE8Du9TomWy3kuD4OxWR36BNBzRn6s1A7zS7OmQMoawcTn03XLhzi9+gL9CP
	1nDy8RKSopvjA0qUpO0mVC48lNxwehfjt6A0Y0b3Ejwd0FFEL6uWmi/A5fapiAZE7x8H3NQ9RrNOr
	hIfhpZhqkxsxHE71yOcg4ORjGNCiTflJKRX+cHoW4cnAXDQX2tMz7oHrE20u5KpAtSrUUsXbaHxbk
	gpa5eFNlyntUJnNRba/CWkyORdaSkL1t3lEF+qhaM5AiBBXuVthlAJG4C2y1C78rsQULjE+ffF5dp
	VENd1uTiN/WDXQyNBcqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5env-00000004tMZ-0f9Y;
	Thu, 26 Mar 2026 07:06:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ens-00000004tME-1x9x
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 07:06:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2110043A72;
	Thu, 26 Mar 2026 07:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6614C116C6;
	Thu, 26 Mar 2026 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774508812;
	bh=wnrmEoJZhftDGQmoF0Ui8MmyP2+RIp4BULM0C8H6+U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOOgibVJ48ULWk33CvEWj41ytD48I79FlWDOTFI/jInoo6F1+4h9SEzLHCuz1Q3Sl
	 n774ppj1CAeHK1+NghBetLL/rS52eSp53V192Neh4Z0dMkMHG/b87Yc1E4eQjdDSp4
	 x9a4R/i1zPsJQOYjXFFg0adJv/KmFWFhqBZMudvvm/XD/uFIfW2yUyCMOOv/NOVGU6
	 LMvKw/6QttZHOAsIkDCfd9Q9gNQf5Hr7XZIzIs5fVO+kuMbhnfTKQEIcPa6DjWj09h
	 z5dwnxALwfOktYrL1rsi0ACun2m0pHFrdzQpxd262Nd/hZRfXhFCxMM0dXeUz3VyQ+
	 19EqZV2A95roA==
Date: Thu, 26 Mar 2026 15:06:47 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: gaohan@iscas.ac.cn, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, rabenda.cn@gmail.com,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Enable USB3.0/PCIe on
 OrangePi RV2
Message-ID: <20260326070647-GKD777612@kernel.org>
References: <20260310161853.3900605-5-gaohan@iscas.ac.cn>
 <20260314080003.2573296-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260314080003.2573296-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_000652_567110_2B0D8B2E 
X-CRM114-Status: GOOD (  11.96  )
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

Hi Chukun, Han

I've merely checked the schematics..

On 16:00 Sat 14 Mar     , Chukun Pan wrote:
> Hi,
> 
> > +	regulator-usb3-vbus-5v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USB30_VBUS";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
> 
> Is this true?
GPIO97 should be DVL1 which labeled as CAMERA1_RST..

> 
> > +		enable-active-high;
> > +	};
> > +
> > +	usb3_hub_5v: regulator-usb3-hub-5v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "USB30_HUB";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> 
> Although GPIO123 is labeled as USB_HUB_EN, it actually
> supplies for USB3 vbus.
> 
I agree

> > +		enable-active-high;
> > +	};
> 
> > ...
> > +		peer-hub = <&hub_3_0>;
> > +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> 
> Really? GPIO124 is floating.
> 
Right, GPIO123 doesn't connect to any device
check the reset pin of GL3523, it connect to VCC_5V0 which is pulled high
unconditionally..

> > +	};
> 
> I still insist that the regulator name of DT should be the same
> as on the schematic. This will force us to review the schematic.
> 
> Thanks,
> Chukun
Also, it seems the VCC5V0_USB20 is missing too, which controlled by
pin USB0_OTG_EN -> GPIO126

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
