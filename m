Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1046AC88E40
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fo8iwZNIfomzzGXdM4P2pbptEsivkUnHP+SWjxY8CSU=; b=LHuSoTK306oN9D
	1AK35DainJK88KL9qEd4iVhlx65DI4pCxLaWlHIfgUzztw1fftY5Ze5HcwujsrDseHwxo8cqNehSC
	MG6w1lQKxbUdhgC3RcvwFHhBhmBcVLmevm5zwbEyVTgTnCfTOHxAnWqv06SJZFaGn7klHaPVWABe1
	J5oMjXYAhodcH4M/8usbP+pihi43wG/4zAzuFR8Irtu8mE3OAs6RXS//WiaVdofMyJYSVpVu0H4vh
	/FTshMtOH3Stpolm2UT+x96UgJ+774xaoZdOToUylLttTJ6F4NEb3dc9mAoNvILhkn5Lz4GMBXl64
	infkdBQS4wGhfbDWiLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5feh-00000001WIU-3yYN;
	Sun, 13 Sep 2026 08:33:43 +0000
Received: from out-14.mta0.migadu.com ([2001:41d0:1004:224b::e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5fed-00000001WI8-2ihP
	for linux-riscv@lists.infradead.org;
	Sun, 13 Sep 2026 08:33:42 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gZziKGY+pciV87A1gXHM0LG1L5PqC5q8IxSkp5BXcFM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789288415; v=1; x=1789893215;
 b=RbqEKwPm+UDNhCYp4igfDd8ifXT8+vzuhRnEeLyVVJd7ar9jXqF509TrOkkgjFn4wIxuix1L
 ylrqPuk6809otSHl+zzkkAxdQFN3LTg6BA7liS61SS2rN+jqpxw/QFVhB5pEWcJq62+KJeqq1wR
 Vp9pyXXIOSa1IXdJBPWraPSQ=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0bf7a0079990b2f0;
	Sun, 13 Sep 2026 08:33:24 +0000
X-Mizu-Trace-ID: 0bf7a0079990b2f0
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Date: Sun, 13 Sep 2026 16:33:19 +0800
Message-Id: <DLE1SV7ZDI16.39A7FPB6DOCQ8@linux.dev>
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Ze Huang" <huang.ze@linux.dev>
Subject: Re: [PATCH v2 8/9] riscv: dts: spacemit: enable USB2.0 controllers
 on OrangePi RV2
From: "Ze Huang" <huang.ze@linux.dev>
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Xu Yang" <xu.yang_2@nxp.com>, "Peng Fan"
 <peng.fan@nxp.com>, "Peter Chen" <peter.chen@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com> <20260908-b4-spacemit-k1-usb2-v2-8-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-8-f07342ffa051@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_013340_482306_E4CE6A6A 
X-CRM114-Status: GOOD (  10.14  )
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

On Tue Sep 8, 2026 at 5:48 PM CST, Junzhong Pan wrote:
> On OrangePi RV2, usb2_0 is connected to a Type-A connector at host
> mode, its vbus output is controlled by gpio 126. And the usb2_1 is
> connected to the USB2.0 connector pins onboard.
>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index b907a1396b21..32d1aafc88f7 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -64,6 +64,16 @@ vcc5v0_usb30: regulator-vcc5v0-usb30 {
>  		vin-supply = <&vcc_5v0>;
>  	};
>  
> +	vcc5v0_usb20: regulator-vcc5v0-usb20 {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
> +		regulator-name = "vcc5v0_usb20";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> @@ -341,10 +351,28 @@ &uart0 {
>  	status = "okay";
>  };
>  
> +&usbphy0 {
> +	status = "okay";
> +};
> +
> +&usbphy1 {
> +	status = "okay";
> +};
> +
>  &usbphy2 {
>  	status = "okay";
>  };
>  
> +&usb2_0 {
> +	vbus-supply = <&vcc5v0_usb20>;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usb2_1 {
> +	status = "okay";
> +};
> +
>  &usb_dwc3 {
>  	dr_mode = "host";
>  	#address-cells = <1>;


Works fine on rv2, thanks!

Tested-by: Ze Huang <huang.ze@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
