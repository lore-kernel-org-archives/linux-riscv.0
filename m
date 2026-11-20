Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E63606A69D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 23:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VcAPEKOP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VgPZKB/F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tCd8G6IAABAyHqqb95Ih8UiunmWHpJBbZz8c6+w3K0w=; b=VcAPEKOPq4MXTHl0p9Xf1mUv8P
	fV6aZLIjZVzyI3Np9zk8CbHD6jV+HAMhBQrhCx1kw6DvqFsRkUqBHPPO9zo+PqDYam0DBoz351JFa
	HArMGlyYkEsRYt3h74Y3ZaBX7IVtS3WRZ204CsVxznIr9qiaJxb+nWskg56LamMb7FxH1EtcxTrJi
	rczzMUHk7gb0ziLOPer318VAE82aak9KF5tdGonLn0F8fENge1CT4lWR5GgOQHSrrc29AS6kbHEbm
	JkhC7MLmA+5caRrdINA5svXjY9JuMoaF65Id298nAAbo8n04sVYzHNwWLgn88IF61pg22XDhoRWvd
	ikq2Fkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUY7p-0000000GQG0-03MU;
	Fri, 20 Nov 2026 23:34:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUY7l-0000000GQFL-23Ly
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 23:34:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BB38240185;
	Fri, 20 Nov 2026 23:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA221F000D4;
	Fri, 20 Nov 2026 23:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795217672;
	bh=jSVkms071gBFhS0ZEXeIERho5bLbtUl4WQoLD2P05l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VgPZKB/FSgIyhPRU6BJYdxGdGWMbuTB1hYp8WeiDLcp7OqO7xtBLeAWRf0yiArqL1
	 yRmCt4VQ9hNrcQ8cJGcmDLApMT56qKBGzgV3HSE/ALZvkJfpYxQpNtlGG66lU0gHf0
	 T/DnImfPtOY+vW0qgVOARu43s01XRcGkLKL/pjWFzC9nEaWsFA2KZv0OftdLoMhkOu
	 kG2HsjJqwxPkE4/6X5hb2juou9TKL67jsUTjTxpPiM5lQhdKtc0ZcrUySuhuQdFk7M
	 R/mRtk9CmTlXzLmuT/FLb0jDiAPtT1RG+uw1ygFAH1Ph9cXS+fDVECujNZA2jzukGu
	 0aVQC8o8vSyGg==
Date: Fri, 20 Nov 2026 15:34:30 -0800
From: Drew Fustini <fustini@kernel.org>
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: Enable bluetooth on
 BeagleV-Ahead
Message-ID: <awDZBiX1VoSkO6F3@x1>
References: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
 <20261020132604.90708-3-thomas.gerner@muenchen-mail.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020132604.90708-3-thomas.gerner@muenchen-mail.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:26:04PM +0200, Thomas Gerner wrote:
> On the BeagleV-Ahead the bluetooth module of the Ampak AP6203BM is
> identified by the btbcm driver as BCM4362A2. The module is connected by
> UART4, several gpio pins and an I2S interface. The I2S is currently not
> used as there is currently no driver.
> 
> Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
> ---
> Changes in v2:
> 	- use default pinctrl definition for bluetooth in and out pins

Thanks for sending v2. Sorry for the delay in review.

> 	
>  .../boot/dts/thead/th1520-beaglev-ahead.dts   | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index e16484a47653..7161a9d4c61f 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -76,6 +76,23 @@ led-5 {
>  		};
>  	};
>  
> +	reg_vbat_1v8: regulator-vbat-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-boot-on;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "vbat-1v8";
> +	};
> +
> +	reg_vbat_3v3: regulator-vbat-3v3 {
> +		compatible = "regulator-fixed";
> +		enable-active-high;

enable-active-high has no effect without a gpio.

> +		regulator-boot-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "vbat-3v3";
> +	};

Nothing can switch these two rails so regulator-always-on describes them
better than regulator-boot-on.

> +
>  	hdmi-connector {
>  		compatible = "hdmi-connector";
>  		type = "d";
> @@ -152,6 +169,28 @@ led-pins {
>  };
>  
>  &padctrl0_apsys {
> +	bluetooth_pins: bluetooth-0 {
> +		in-pins {
> +			bias-disable;
> +			drive-strength = <1>;
> +			function = "gpio";
> +			input-enable;
> +			input-schmitt-enable;
> +			pins = "GPIO2_30";
> +			slew-rate = <0>;
> +		};
> +
> +		out-pins {
> +			bias-disable;
> +			drive-strength = <3>;
> +			input-disable;
> +			input-schmitt-disable;
> +			pins = "SDIO1_DETN",	/* GPIO2_29 */
> +			       "SDIO1_WPRTN";	/* GPIO2_28 */
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	gmac0_pins: gmac0-0 {
>  		tx-pins {
>  			pins = "GMAC0_TX_CLK",
> @@ -268,6 +307,30 @@ reg-on-pins {
>  	};
>  };
>  
> +&padctrl1_apsys {
> +	uart4_pins: uart4-0 {
> +		rx-pins {
> +			bias-disable;
> +			drive-strength = <1>;
> +			function = "uart";
> +			input-enable;
> +			pins = "UART4_RXD", "UART4_CTSN";
> +			input-schmitt-enable;
> +			slew-rate = <0>;
> +		};
> +
> +		tx-pins {
> +			bias-disable;
> +			drive-strength = <3>;
> +			function = "uart";
> +			input-disable;
> +			pins = "UART4_TXD", "UART4_RTSN";
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &sdio0 {
>  	bus-width = <4>;
>  	max-frequency = <198000000>;
> @@ -314,3 +377,25 @@ &uart0 {
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&uart4 {
> +	pinctrl-0 = <&uart4_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm4329-bt";
> +		device-wakeup-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <30 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "host-wakeup";
> +		max-speed = <921600>;
> +		pinctrl-0 = <&bluetooth_pins>;
> +		pinctrl-names = "default";
> +		shutdown-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>; 	/* BT-REG-ON */

This triggers checkpatch:

WARNING: please, no space before tabs
#230: FILE: arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts:397:
+^I^Ishutdown-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>; ^I/* BT-REG-ON */$

> +		vbat-supply = <&reg_vbat_3v3>;
> +		vddio-supply = <&reg_vbat_1v8>;
> +	};
> +};
> -- 
> 2.53.0
> 

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
