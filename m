Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF33EC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcuoya1uYro8lYGNKd/GRTIHMaERRDYVgzzq1dWLPao=; b=gvgShvm/gL/mCx
	TsLiyAFbLbZeWqRW3D6fCNxWrv31VEMv6/m4Qtr7ysz8TRTQhCpoVZgnIxI3vLEMCaD7wsmdSVTRa
	d1hkOo4TcbkVaxQZ177JjItq3SOuY0FWoaImRK+8r1KuFtHST+apkJZWPXG8q9DpwupemG3lUAxr5
	qG6WT7Jun2dBUuRprTqc3Klsgq8JvOSEst9e4KBZT+cgSxwnF4juCADTuaW6wjLHkYQufVAxgGhwe
	S8MrEXKqGl7KY/Id1aZ3RVO332C3l45DZ1uMgXtGKSWiSLQxbg0YR8gSjj9lowJpW4b/da16u6bv+
	h78E4ckb0mxFeoCehyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nkA-004luQ-2L;
	Wed, 07 Jun 2023 07:38:10 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6nk7-004lsP-0w
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 07:38:09 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-977d55ac17bso583092466b.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686123485; x=1688715485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNSVpTGK/l9iZwOWNmHI2F19yNhHKxnKGcZzUtPUdPM=;
        b=ULkXjzQUh10+WTvid47PSYTfNolUEhpdm0pUGX4COa+AKaF56Lo1LEWLnJJLkMTtDk
         1bu8DW26K2ZWIKauxfZBMLPFVq+1NaKdyWF36l+Djo6nB8KezB+LlKmThOeAOcQokC77
         rd6mUJw2vIcay0nQc4onaXwFdHtel0CItpPmLaaB6SPBbHvwT+gDZWCSX3SULDuXVwQR
         rEcJWNiETnCPR2sBojc8GzYqz9YevQgC0fruyK4yGMYGqmaLkb/3kg69m5d2Ctsk71zV
         eITRSn697jIqgkelnOEW++XCjaltRsY+vxgXcGOWy4b0lvZ6y6qkeR9Qewzg2dl41Rq+
         ml/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123485; x=1688715485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNSVpTGK/l9iZwOWNmHI2F19yNhHKxnKGcZzUtPUdPM=;
        b=C/TbsGd8L7IfGMxIl2C8co+/R07FHPDKYYkEHfnMvICJbHHemg7WWH+Zi8XORHahum
         fai65Vn6UikemBM5XGye9nedxjPbYFvzxHb5RzSErpugipAcr9m7oXxZongRLhFtMDYa
         jb+wi9SwRdpOdYYqdknTY25V0y05td2nmp/Y/wttw8P1am7XJXPA0sOsYRvHOFuZkCc2
         TjcBTLWjZh6lnUPg41fGBXqluz96841M5mdVJQFsP64xlDRrQlKAnEazARdlAc2T3Rbh
         ns2QHJJ5sEnnRQdmCa5ePX7woXK8ZaUfVatDqZMsKtuPIDZi/a4+jRhl6rcZN+CoLj//
         3VPw==
X-Gm-Message-State: AC+VfDzxjP0CbU9g+gYpzKBoMG84RnPjhcx0K5snCCLOn325eqTG6nXD
	irJgOZbL1OHAQb+OgilaWz283Q==
X-Google-Smtp-Source: ACHHUZ4eKaPNF9Y7Ctvy7bb6DgDgKJYoGYQGb84V/eSeixnqSw+c+G9oT2Nf3z6Gs7xy3BpZkwvUJg==
X-Received: by 2002:a17:907:9710:b0:974:c1c:8217 with SMTP id jg16-20020a170907971000b009740c1c8217mr5128815ejc.55.1686123485324;
        Wed, 07 Jun 2023 00:38:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170906b1cd00b00978743b54bdsm1369725ejb.78.2023.06.07.00.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:38:04 -0700 (PDT)
Message-ID: <d97987f2-58e1-f46f-4b33-ccc72285d089@linaro.org>
Date: Wed, 7 Jun 2023 09:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/9] riscv: dts: starfive: jh7110: add dc&hdmi controller
 node
Content-Language: en-US
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Chris Morgan <macromorgan@hotmail.com>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-3-keith.zhao@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602074043.33872-3-keith.zhao@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_003807_335114_FDA8C30E 
X-CRM114-Status: GOOD (  16.27  )
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

On 02/06/2023 09:40, Keith Zhao wrote:
> Add the dc controller and hdmi node for the Starfive JH7110 SoC.
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 46 ++++++++++
>  2 files changed, 133 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 1155b97b593d..8dc6c8a15c59 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -31,6 +31,21 @@ memory@40000000 {
>  		reg = <0x0 0x40000000 0x1 0x0>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x20000000>;
> +			alignment = <0x0 0x1000>;
> +			alloc-ranges = <0x0 0x80000000 0x0 0x20000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
>  	gpio-restart {
>  		compatible = "gpio-restart";
>  		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
> @@ -214,6 +229,41 @@ GPOEN_DISABLE,
>  			slew-rate = <0>;
>  		};
>  	};
> +
> +	hdmi_pins: hdmi-0 {
> +		hdmi-scl-pins {
> +			pinmux = <GPIOMUX(0, GPOUT_SYS_HDMI_DDC_SCL,
> +					     GPOEN_SYS_HDMI_DDC_SCL,
> +					     GPI_SYS_HDMI_DDC_SCL)>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		hdmi-sda-pins {
> +			pinmux = <GPIOMUX(1, GPOUT_SYS_HDMI_DDC_SDA,
> +					     GPOEN_SYS_HDMI_DDC_SDA,
> +					     GPI_SYS_HDMI_DDC_SDA)>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		hdmi-cec-pins {
> +			pinmux = <GPIOMUX(14, GPOUT_SYS_HDMI_CEC_SDA,
> +					     GPOEN_SYS_HDMI_CEC_SDA,
> +					     GPI_SYS_HDMI_CEC_SDA)>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		hdmi-hpd-pins {
> +			pinmux = <GPIOMUX(15, GPOUT_HIGH,
> +					     GPOEN_ENABLE,
> +					     GPI_SYS_HDMI_HPD)>;
> +			input-enable;
> +			bias-disable; /* external pull-up */
> +		};
> +	};
> +
>  };
>  
>  &uart0 {
> @@ -221,3 +271,40 @@ &uart0 {
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&voutcrg {
> +	status = "okay";
> +};
> +
> +&display {
> +	status = "okay";
> +};
> +
> +&hdmi {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_pins>;
> +
> +	hdmi_in: port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		hdmi_input: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&dc_out_dpi0>;

This does not make any sense. You wrote in bindings that this is display
output, but you call it HDMI input. If this is input, where is your output?

> +		};
> +	};
> +};
> +
> +&dc8200 {
> +	status = "okay";
> +
> +	dc_out: port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		dc_out_dpi0: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&hdmi_input>;
> +		};
> +

Stray blank line.

> +	};
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 9acb5fb1716d..66be6e65a066 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -249,6 +249,11 @@ tdm_ext: tdm-ext-clock {
>  		#clock-cells = <0>;
>  	};
>  
> +	display: display-subsystem {
> +		compatible = "verisilicon,display-subsystem";

Drop fake nodes which do not represent hardware. Instead, DTS and
bindings should describe real hardware.


> +		ports = <&dc_out>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -570,5 +575,46 @@ voutcrg: clock-controller@295c0000 {
>  			#reset-cells = <1>;
>  			power-domains = <&pwrc JH7110_PD_VOUT>;
>  		};
> +
> +		dc8200: dc8200@29400000 {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			compatible = "verisilicon,dc8200";
> +			reg = <0x0 0x29400000 0x0 0x100>,
> +			      <0x0 0x29400800 0x0 0x2000>,
> +			      <0x0 0x295B0000 0x0 0x90>;
> +			interrupts = <95>;
> +			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
> +				<&hdmitx0_pixelclk>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
> +			clock-names = "clk_vout_noc_disp",
> +				"clk_vout_pix0","clk_vout_pix1",

Fix alignment

> +				"clk_vout_axi","clk_vout_core",
> +				"clk_vout_vout_ahb","hdmitx0_pixel",
> +				"clk_vout_dc8200";
> +			resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
> +				 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
> +				 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
> +			reset-names = "rst_vout_axi","rst_vout_ahb",
> +						"rst_vout_core";

Fix alignment.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
