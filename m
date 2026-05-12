Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBF6CD4F21
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05SlYQ1X+uqIxGdCWOBgY2AMPEFywFm+rWgZ5IdH+F8=; b=C8KaNb1bcQzan/
	P09u/wB3icpYY3Iq1hwNkmF6hCn626dcCfLL4qJBSGiipnMjinbclTRb4RMYDRVH56ZM5RegZ0Hc8
	SXxkdiCI2mzxqBP76LTzjtV5ZFtl7ldqMXGSWYC6cp/TcDKONJlopy+q9jHbINY5l/PkP2Jq13EJI
	D/DK/lDOnjkMiwl/a3595uCpq2QWi6q9HGklwIwjgD0ColEM+v8rIXr2QZr+NyGJb7wF9nHzG2LwM
	9fBjeaVjHX2H+XCT30AycbNTqq6AikpbJ+OqECKr1md1aCYbvd6pD8QV92z55RE4uur/ytItyv3z0
	oWD2Ej111h1VaB78Dfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlNx-0000000GZv0-0Ry6;
	Tue, 12 May 2026 11:34:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlNu-0000000GZuB-1F2A
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 11:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 586A0438B4;
	Tue, 12 May 2026 11:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2701C2BCB0;
	Tue, 12 May 2026 11:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585685;
	bh=rEH0LubyCwBzQ9XB43fGcRH9yWcSU7fpspDXa3oAJV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huhAFQz0karYLPQmSKNvruvCoi9lXwDr+HDIeX1PLbcemcWgTcyi1FHXNgUOlw35X
	 QUp0wFLaXU6CWU4hhnxo9409qn8U5rpGBgONtlq9J65ZABGGU3wl/AMsIymEFbmRvp
	 GS7OWxtVkaE92OV0P+2OxFOExJfH54t39olwbk/p2mfNPWV+q1vK6oO5tOyKs0KS7S
	 84ualVrNHj0xC8bx1XYfwWKsRhI/Cq14GsYD8KuQyHfMXugh0Q31/V6vZJlK6VvpTZ
	 IW16r5BvcRS2OBKnMUff/wkL5Qe68X/hMaCAxqMlRmIiHBOx3z/p6/lU6ghGNdXG8s
	 JPAGhj16JAggQ==
Date: Tue, 12 May 2026 11:34:41 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe
 ports
Message-ID: <20260512113441-GKF3624147@kernel.org>
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-6-a.heider@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511111116.1109643-6-a.heider@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_043446_355539_34F1FBDC 
X-CRM114-Status: GOOD (  12.84  )
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

Hi Andre,

On 13:11 Mon 11 May     , Andre Heider wrote:
> Enable the two PCIe controller along with and their associated PHYs. They
> are routed to the M.2 M-key connector and to the PCIe slot.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>
> ---
>  .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 9c90c2817ecb7..2d3e30f0bd806 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -36,6 +36,24 @@ led1 {
>  		};
>  	};
>  
> +	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_VCC3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_usb_vbus>;
> +	};
> +
> +	mpcie_vcc_3v3: regulator-mpcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "MPCIE_VCC3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		vin-supply = <&reg_usb_vbus>;
> +	};
> +
>  	reg_usb_vbus: regulator-usb-vbus {
>  		compatible = "regulator-fixed";
>  		regulator-name = "USBVBUS";
> @@ -275,6 +293,38 @@ dldo7 {
>  	};
>  };
>  
> +&pcie1_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie1_3_cfg>;
> +	status = "okay";
> +};
> +
> +&pcie1_port {
> +	phys = <&pcie1_phy>;
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
> +};
> +
> +&pcie1 {
..
> +	vpcie3v3-supply = <&pcie_vcc_3v3>;
drop vpcie3v3-supply which not needed

> +	status = "okay";
> +};
> +
> +&pcie2_phy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2_4_cfg>;
> +	status = "okay";
> +};
> +
> +&pcie2_port {
> +	phys = <&pcie2_phy>;
> +	vpcie3v3-supply = <&mpcie_vcc_3v3>;
> +};
> +
> +&pcie2 {
> +	vpcie3v3-supply = <&mpcie_vcc_3v3>;
same here
> +	status = "okay";
> +};
> +
>  &qspi {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&qspi_cfg>;
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
