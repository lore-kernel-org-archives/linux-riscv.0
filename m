Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E314CD37B4
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 22:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n/9DrH23rYXg+SrTkefniotIgi9eIvDc3QyfqO3uHuU=; b=jvH/SodnVT0GzUQo7CGFDRl+j5
	ljF/Q+3M6u7MCWvx1EH4VEPpaeB1pKzEaADfbWHT0sAnxM+VU1itSyKowPewxcVwz+L0m/Cpit1q0
	O60r/PAv9hs/b7sZkVsdL0idLpGU3n8jDG/se/evPg5GTnezN6HaQXAQ64a7SU9F1+GPrFHt96nJc
	05yNKsgG9moWsEJGF3ruf2+5TrGkxNWVcoypu19EeUaeb/RTcNUL/T52+KVsnui7/MFplR27hN/Ff
	0zVK0rd+UfWGdBKYgM9oomGrr40FBEdjZ3OCzGlWRohlMOuIpdNZ42CKnB7+UnjZCwRiFufCQc0+2
	N/PRwk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi07z-00E3VF-2M;
	Sun, 17 Sep 2023 22:20:31 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi07v-00E3Ul-1W
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 22:20:30 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 79B803F66D
	for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694989225;
	bh=MHzNwi9slcSY5+J98yaBWBbVj/QNNWWNlukZ9uThGv4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=GFgJ3HaviiP8qaOFoz6YdhQK4zoSnC8LospdoE++y4U9paZzALY7jrIFkf+m5JA2t
	 xKuQvYsdqIcRWrQO/WJQY8OmnEDbgeAMvJhWvxacGWOM9QVC8935Mujg9omSMRy20w
	 cnEnJ4/Z+WgIsrZ7DYFMKKenBpA8acB7yMI1tuWVw0wuF8s0moUAsdtum4NIWfudNv
	 dP2QgHcVXHH5Ev8sFcoocCYSb+iKNdxMwuVwUSxYvKaRoChQ5i9Oq6vzHTPbq2mLqr
	 QAuublRriXsLz/bfIKPiSbpsqoCTKhJhvwpjylFZN9j5cwjTopg+sLwsMXRpgX2t8C
	 NKQ/pii2TjrTw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-417992ff7d5so31068491cf.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 15:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694989224; x=1695594024;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHzNwi9slcSY5+J98yaBWBbVj/QNNWWNlukZ9uThGv4=;
        b=wi0Gs2m6asNwJtG3/OEHDj1o8KyXH/LVO7akxdmMP9dyCDpJzztJSXfq5rljgulwEm
         WbO8jxPRcw1ECkSR5Kxc2R4HPr9XTQHkh6kf4zYBv+1yvi9abfpDO4g/pwf592hDo7xC
         Tl0KZuv+phFDV0yu2A13YtYb2czWUK6WS3ovWZ4ldm7CaQRAIoJiBrhilyDt0e65Kk2u
         M/PDiGayMkWaTAL7CJJaxVEr18WXzIl0qPpghpF7zbZVML79GW8d4wsbdNkfX7cUZcZT
         kWj8JJbvbE2J4OnJDUDaZa/fhjE8+rhQ56WOba4t6dKtDoQPHsWwifSMI994RQrMccfC
         ZbyQ==
X-Gm-Message-State: AOJu0YxsCdsEVSvV/oyLD2DUKVyWOA+OjGGda8ASaBaTQgtn1tNV8RDM
	+c/dlHMpAOC9K0W6ZZbjoeik9aPqBPDOWITs4QHGzTuBK3VC8vHgTl6VdCNAetfozGOjG0cLuIg
	80t5CnOQ/Wb7hSk0zfz+d/GZBjxfmMmyKw0qexHJRdXs16guqGcaXSJ1sKeR6OV5qGQUbjw==
X-Received: by 2002:a05:622a:1d1:b0:412:4847:20af with SMTP id t17-20020a05622a01d100b00412484720afmr9875864qtw.23.1694989224323;
        Sun, 17 Sep 2023 15:20:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrYqzVM75uuKU/x9guzZO42+l/vGRJORhbptSN1kBCkn8+skT6lT5TltjUNQpFf7InVCnN+h8fL47vFAieQJ4=
X-Received: by 2002:a05:622a:1d1:b0:412:4847:20af with SMTP id
 t17-20020a05622a01d100b00412484720afmr9875856qtw.23.1694989224089; Sun, 17
 Sep 2023 15:20:24 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Sep 2023 15:20:23 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230915102243.59775-20-minda.chen@starfivetech.com>
References: <20230915102243.59775-1-minda.chen@starfivetech.com> <20230915102243.59775-20-minda.chen@starfivetech.com>
Mime-Version: 1.0
Date: Sun, 17 Sep 2023 15:20:23 -0700
Message-ID: <CAJM55Z8ES9ip53R14OoKVphEr14BFOwk88DCZEp13oGrnPkdvg@mail.gmail.com>
Subject: Re: [PATCH v6 19/19] riscv: dts: starfive: add PCIe dts configuration
 for JH7110
To: Minda Chen <minda.chen@starfivetech.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_152027_681740_D7791966 
X-CRM114-Status: GOOD (  11.57  )
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

Minda Chen wrote:
> Add PCIe dts configuraion for JH7110 SoC platform.
>
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 63 +++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 88 +++++++++++++++++++
>  2 files changed, 151 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index d79f94432b27..8c84852f1c06 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -402,6 +402,53 @@
>  		};
>  	};
>
> +	pcie0_pins: pcie0-0 {
> +		wake-pins {
> +			pinmux = <GPIOMUX(32, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +		clkreq-pins {
> +			pinmux = <GPIOMUX(27, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
> +	pcie1_pins: pcie1-0 {
> +		wake-pins {
> +			pinmux = <GPIOMUX(21, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		clkreq-pins {
> +			pinmux = <GPIOMUX(29, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_NONE)>;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	spi0_pins: spi0-0 {
>  		mosi-pins {
>  			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
> @@ -499,6 +546,22 @@
>  	};
>  };
>
> +&pcie0 {
> +	pinctrl-names = "default";
> +	perst-gpios = <&sysgpio 26 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pcie0_pins>;
> +	phys = <&pciephy0>;
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	pinctrl-names = "default";
> +	perst-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&pcie1_pins>;
> +	phys = <&pciephy1>;
> +	status = "okay";
> +};

These nodes are out of place. The order is
- root node
- clocks sorted alphabetically
- other node references sorted alphabetically

>  &tdm {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&tdm_pins>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index e85464c328d0..97fe5a242d60 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -1045,5 +1045,93 @@
>  			#reset-cells = <1>;
>  			power-domains = <&pwrc JH7110_PD_VOUT>;
>  		};
> +
> +		pcie0: pcie@940000000 {
> +			compatible = "starfive,jh7110-pcie";
> +			reg = <0x9 0x40000000 0x0 0x1000000>,
> +			      <0x0 0x2b000000 0x0 0x100000>;
> +			reg-names = "cfg", "apb";
> +			linux,pci-domain = <0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <1>;
> +			ranges = <0x82000000  0x0 0x30000000  0x0 0x30000000 0x0 0x08000000>,
> +				 <0xc3000000  0x9 0x00000000  0x9 0x00000000 0x0 0x40000000>;
> +			interrupts = <56>;
> +			interrupt-parent = <&plic>;

Is interrupt-parent not inherited from the soc bus like other peripherals?

> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc0 0x1>,
> +					<0x0 0x0 0x0 0x2 &pcie_intc0 0x2>,
> +					<0x0 0x0 0x0 0x3 &pcie_intc0 0x3>,
> +					<0x0 0x0 0x0 0x4 &pcie_intc0 0x4>;
> +			msi-controller;
> +			device_type = "pci";
> +			starfive,stg-syscon = <&stg_syscon>;
> +			bus-range = <0x0 0xff>;
> +			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_STG_AXI>,
> +				 <&stgcrg JH7110_STGCLK_PCIE0_TL>,
> +				 <&stgcrg JH7110_STGCLK_PCIE0_AXI_MST0>,
> +				 <&stgcrg JH7110_STGCLK_PCIE0_APB>;
> +			clock-names = "noc", "tl", "axi_mst0", "apb";
> +			resets = <&stgcrg JH7110_STGRST_PCIE0_AXI_MST0>,
> +				 <&stgcrg JH7110_STGRST_PCIE0_AXI_SLV0>,
> +				 <&stgcrg JH7110_STGRST_PCIE0_AXI_SLV>,
> +				 <&stgcrg JH7110_STGRST_PCIE0_BRG>,
> +				 <&stgcrg JH7110_STGRST_PCIE0_CORE>,
> +				 <&stgcrg JH7110_STGRST_PCIE0_APB>;
> +			reset-names = "mst0", "slv0", "slv", "brg",
> +				      "core", "apb";
> +			status = "disabled";
> +
> +			pcie_intc0: interrupt-controller {
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
> +
> +		pcie1: pcie@9c0000000 {
> +			compatible = "starfive,jh7110-pcie";
> +			reg = <0x9 0xc0000000 0x0 0x1000000>,
> +			      <0x0 0x2c000000 0x0 0x100000>;
> +			reg-names = "cfg", "apb";
> +			linux,pci-domain = <1>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <1>;
> +			ranges = <0x82000000  0x0 0x38000000  0x0 0x38000000 0x0 0x08000000>,
> +				 <0xc3000000  0x9 0x80000000  0x9 0x80000000 0x0 0x40000000>;
> +			interrupts = <57>;
> +			interrupt-parent = <&plic>;

ditto.

> +			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> +			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc1 0x1>,
> +					<0x0 0x0 0x0 0x2 &pcie_intc1 0x2>,
> +					<0x0 0x0 0x0 0x3 &pcie_intc1 0x3>,
> +					<0x0 0x0 0x0 0x4 &pcie_intc1 0x4>;
> +			msi-controller;
> +			device_type = "pci";
> +			starfive,stg-syscon = <&stg_syscon>;
> +			bus-range = <0x0 0xff>;
> +			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_STG_AXI>,
> +				 <&stgcrg JH7110_STGCLK_PCIE1_TL>,
> +				 <&stgcrg JH7110_STGCLK_PCIE1_AXI_MST0>,
> +				 <&stgcrg JH7110_STGCLK_PCIE1_APB>;
> +			clock-names = "noc", "tl", "axi_mst0", "apb";
> +			resets = <&stgcrg JH7110_STGRST_PCIE1_AXI_MST0>,
> +				 <&stgcrg JH7110_STGRST_PCIE1_AXI_SLV0>,
> +				 <&stgcrg JH7110_STGRST_PCIE1_AXI_SLV>,
> +				 <&stgcrg JH7110_STGRST_PCIE1_BRG>,
> +				 <&stgcrg JH7110_STGRST_PCIE1_CORE>,
> +				 <&stgcrg JH7110_STGRST_PCIE1_APB>;
> +			reset-names = "mst0", "slv0", "slv", "brg",
> +				      "core", "apb";
> +			status = "disabled";
> +
> +			pcie_intc1: interrupt-controller {
> +				#address-cells = <0>;
> +				#interrupt-cells = <1>;
> +				interrupt-controller;
> +			};
> +		};
>  	};
>  };
> --
> 2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
