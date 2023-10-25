Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79442C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AH5F1E5af4VFQ5hrG/1s4DsFga+EfqiOFFZoze0mfP4=; b=lS1rSPTsO9Mf/IYgKvItkm8pF0
	sobEuhOzGEmVBB15RB0Ec/U+90U8f7q3cmVnz15I0cc8AL6YEaKwr9H//g4WdJs0c/g2YEOHJYJrK
	Q7oQllzNZz4LKf8ldRd/PQy87v3iRYrKzvtnH1r1Lr+PSDQbEHW+1wDZbyoSCT4p45Pd+uxOkepIk
	4maJVb8eES82atkp57pmpkNncq6eSMghdL5pd5ilrbdxCB0axQ33RJNQtgEIfxiSA+L5+NOSisCod
	VKrlWZWCFGZUz7ZOYbjSNkgXJ+ws54ZtMUeKqQ/+d1+0St+yBF+HO62XzkUZ2ltgpfWaeFAsoqTLp
	ArkEcXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qve5V-00CQSA-1h;
	Wed, 25 Oct 2023 13:38:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qve5S-00CQRb-2V
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 13:38:20 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6A3ED420AF
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698241091;
	bh=4kZetE1rdZ7P5Qi3G+jzZsycI0EzhJ2peFQaOTjHG8s=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Zbm7JNN2Kn7owckCN61T9VLnq7JznyG0uypYpg7GhfIVzNywEinmhNxr1xJtZ573f
	 IIq6YSNAkpkpiOIPz6Ubg6qJz5QC5uqdXSVOUppYeQQIKWQ1GCwE0EyQN3O0pGpx6Z
	 WLzsPhjE/EouOaakO0m8TMcbrgNLl0kqyoAwyuGojTwNliBn8lUdUBYYl7P4SvgOVS
	 xOjPEvPQs3QXzvDbN24KXy3hsfTLn7YtZDzYzEhTCLg+xvOyStKnAGS5aIWmB6XQwW
	 OF+1jq0sKV4PE4Qq8wcNZH8Av2oMgXQFrl21ViaN+VDrQXdpR0Tswq7t/cZMLG2fi2
	 n1UXxIuKw3aBw==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cbb2970f4so63892031cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 06:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698241090; x=1698845890;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4kZetE1rdZ7P5Qi3G+jzZsycI0EzhJ2peFQaOTjHG8s=;
        b=Trb6qRSR1I77ZY7J8159JHL8iFIARuXfoyB1lmPZ3Squ6Tr1T0TtdM9/i3lGGlsjAh
         xrIvVxOqbGD0DDks36iO1QtiFgRMvG/HA50djjTjcV+yh9TzK3gVU/plmiiC1doKiUma
         +McgwHg5pjuYzP9Wfa3YwZqwkqM8wAchLYJ8ctqmqFKQY0vI9HEN/AblCSccDVW4d/Jy
         Jxd2VmhRjM3Mz+2yGsvy/oLNpDR/5yYcfCHNhK3tswiLqjmKKQKNwDMAS+lH0F8U7ak5
         Bt8oX5OWNx6pFrCp4wU7opmtg+AnSFF9VrQkYLJZds8aCVbWttv5L7NnI0AeT7nBlBvd
         R96g==
X-Gm-Message-State: AOJu0YwXodSznzwbMIsRj4jmNIMmXLB84nnbvqJtZAVFK/6jFAl9qZuZ
	QWI6d1b64aKvYNG8ez+1hlB6E+u2pgtSaYKiBSH1QwkolvUf9JkmUe/m+us5t11R8IuAU/gSdC3
	LSrbobITEo+etydKb/8Q5xk59T+rUUCro8CMghsA4fWFScaMMA6+UnE7GET8nkA==
X-Received: by 2002:a05:622a:1b9f:b0:417:bd2c:2683 with SMTP id bp31-20020a05622a1b9f00b00417bd2c2683mr16970917qtb.19.1698241090315;
        Wed, 25 Oct 2023 06:38:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9sqk9O9NSffONLMLkF62MheH44KULbbJziO/VE+15eqK7tXOWni0WrQFzdn8ozLKmF0Jvc5dWLHw93tWI6nk=
X-Received: by 2002:a05:622a:1b9f:b0:417:bd2c:2683 with SMTP id
 bp31-20020a05622a1b9f00b00417bd2c2683mr16970883qtb.19.1698241090030; Wed, 25
 Oct 2023 06:38:10 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 06:38:09 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231025103957.3776-3-keith.zhao@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com> <20231025103957.3776-3-keith.zhao@starfivetech.com>
Mime-Version: 1.0
Date: Wed, 25 Oct 2023 06:38:09 -0700
Message-ID: <CAJM55Z_Y_qp0J5FmWDPdziCRY7duNBhHnvM0Zza2pG-vK0etbw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] riscv: dts: starfive: jh7110: add dc controller
 and hdmi node
To: Keith Zhao <keith.zhao@starfivetech.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com, 
	Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, 
	Jagan Teki <jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, 
	Shengyang Chen <shengyang.chen@starfivetech.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_063819_171296_158ACE99 
X-CRM114-Status: GOOD (  16.35  )
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

Keith Zhao wrote:
> Add the dc controller and hdmi node for the Starfive JH7110 SoC.
>
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 91 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 41 +++++++++
>  2 files changed, 132 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index de0f40a8b..97909b6d2 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -31,6 +31,25 @@ memory@40000000 {
>  		reg = <0x0 0x40000000 0x1 0x0>;
>  	};
>
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* vout applies for space from this CMA
> +		 * Without this CMA reservation,
> +		 * vout may not work properly.
> +		 */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x20000000>;
> +			alignment = <0x0 0x1000>;
> +			alloc-ranges = <0x0 0x70000000 0x0 0x20000000>;
> +			linux,cma-default;
> +		};
> +	};
> +
>  	gpio-restart {
>  		compatible = "gpio-restart";
>  		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
> @@ -231,6 +250,41 @@ GPOEN_DISABLE,
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

Please don't break the alphabetical ordering of these nodes.

>  };
>
>  &uart0 {
> @@ -254,3 +308,40 @@ &U74_3 {
>  &U74_4 {
>  	cpu-supply = <&vdd_cpu>;
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
> +		hdmi_in_dc: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&dc_out_hdmi>;
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
> +		dc_out_hdmi: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&hdmi_in_dc>;
> +		};
> +
> +	};
> +};

Some goes for these node references. The order is /-node, clocks, node refences
sorted alphabetically.


> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 0005fa163..1670452fb 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -282,6 +282,11 @@ tdm_ext: tdm-ext-clock {
>  		#clock-cells = <0>;
>  	};
>
> +	display: display-subsystem {
> +		compatible = "starfive,display-subsystem";
> +		ports = <&dc_out>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -613,5 +618,41 @@ voutcrg: clock-controller@295c0000 {
>  			#reset-cells = <1>;
>  			power-domains = <&pwrc JH7110_PD_VOUT>;
>  		};
> +
> +		dc8200: lcd-controller@29400000 {
> +			compatible = "starfive,jh7110-dc8200";
> +			reg = <0x0 0x29400000 0x0 0x100>,
> +			      <0x0 0x29400800 0x0 0x2000>;
> +			interrupts = <95>;
> +			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX0>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX1>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_AXI>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_AHB>,
> +				<&hdmitx0_pixelclk>,
> +				<&voutcrg JH7110_VOUTCLK_DC8200_PIX>;
> +			clock-names = "noc_bus", "channel0", "channel1",
> +				      "dc_core", "axi_core", "ahb",
> +				      "hdmi_tx", "dc_parent";
> +			resets = <&voutcrg JH7110_VOUTRST_DC8200_AXI>,
> +				 <&voutcrg JH7110_VOUTRST_DC8200_AHB>,
> +				 <&voutcrg JH7110_VOUTRST_DC8200_CORE>;
> +			reset-names = "axi","ahb", "core";
> +		};
> +
> +		hdmi: hdmi@29590000 {
> +			compatible = "starfive,jh7110-inno-hdmi";
> +			reg = <0x0 0x29590000 0x0 0x4000>;
> +			interrupts = <99>;
> +
> +			clocks = <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +				 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +				 <&hdmitx0_pixelclk>;
> +			clock-names = "sysclk", "mclk", "bclk", "pclk";
> +			resets = <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +			#sound-dai-cells = <0>;
> +		};

These nodes, however, are sorted by their address which you alse break in this
patch :(

>  	};
>  };
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
