Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBABC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMGqxjNgdIxncdJ9eFcIMyEBM8X9pZ/pnAEiVAU50Hg=; b=kCNWe9aP5eqIfh
	YDH/3AE1loMUUrVDhN+VubgtbMHS8NGL+I46uza5MzVxUv7oio+ozjUo33fzXIf3d+Bud0TaNVryM
	MIkemLpSGAtpV6P0vX1TG4B4JZHmwqNgiH6bBlIFIi+NpZLPyUe5GjG/VgywvtFcEcDnWOCOWL9CF
	PdC/AfYdRKnlBRNKRl2MZyVluM9r1vHTpFxyCcONWj7ET+iQiBUNIOa8yoc8WBQIL56dFl8YNz0Hg
	P64Z+CEjosoHTVf+UbdCTWe/iHpR3hAINFz4UsNspi9tijK33r9C/oke/G+bOye1FTgbukugYoHnY
	Y76JNmunOFthylF9/7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHWl-009Zmj-2l;
	Mon, 20 Mar 2023 15:34:27 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHWi-009ZlX-0Y;
	Mon, 20 Mar 2023 15:34:25 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-17aeb49429eso13094126fac.6;
        Mon, 20 Mar 2023 08:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679326461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT0AHmQ3LShuOXZctue2K5uPH5tMEpocTPWo5CKLfa0=;
        b=QQcey/izMJi6/gAS2rYNh7i0VI/ZYnNdzb9KohlWgWJiYI3F5xRnAepA7mpkwYQdwB
         CKDSgTdHmBdI28T7ZsJ8B6gNBSOLMQYPNhcvS39M+zBnVFLKCZs6KNU3Hw0CMA/FknUD
         QSvgNLJWZ2UZwnDild46vt/EYruo4JLsB3jBZySJvwL2GIDyw89CnH0U8IUBE/iwEuf8
         Lu3MV8PNsLH1FolG8ufJwnk2q6Z25cWB4T16PEAkjf3ROfqgPpw3Dv1gB9k5hYPdl2mm
         wY9/LF/6pjDFvyvHSNW4m0GBU1A7h0IQpkitXj2uQZKOoPiL+eVtnzkCSOz/dn78mZYT
         Jj8A==
X-Gm-Message-State: AO0yUKW0uuVGG/VqQydt5la7dKA54L6m/UG4Qjhq8KC2J4B5MR2BKNB3
	Ah2IPP16Yi6e4GPd/kPt4g==
X-Google-Smtp-Source: AK7set9L5/qTXuFZHlohcnrxPqSNgsXDyQvryNGkS1I36QP55MJIx++eLXjYhVeo+Ka0kocDB+oHog==
X-Received: by 2002:a05:6870:8092:b0:177:ac2e:fc5 with SMTP id q18-20020a056870809200b00177ac2e0fc5mr5391174oab.50.1679326461151;
        Mon, 20 Mar 2023 08:34:21 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id di7-20020a0568303a0700b00690e21a46e1sm4018649otb.56.2023.03.20.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:34:20 -0700 (PDT)
Received: (nullmailer pid 1733448 invoked by uid 1000);
	Mon, 20 Mar 2023 15:34:19 -0000
Date: Mon, 20 Mar 2023 10:34:19 -0500
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Message-ID: <20230320153419.GB1713196-robh@kernel.org>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315104411.73614-6-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_083424_211322_0825A0E4 
X-CRM114-Status: GOOD (  15.41  )
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

On Wed, Mar 15, 2023 at 06:44:11PM +0800, Minda Chen wrote:
> USB Glue layer and Cadence USB subnode configuration,
> also includes USB and PCIe phy dts configuration.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         |  7 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 54 +++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index a132debb9b53..c64476aebc1a 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -236,3 +236,10 @@
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&usb0 {
> +	status = "okay";
> +	usbdrd_cdns3: usb@0 {
> +		dr_mode = "peripheral";
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index f70a4ed47eb4..17722fd1be62 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -362,6 +362,60 @@
>  			status = "disabled";
>  		};
>  
> +		usb0: usb@10100000 {
> +			compatible = "starfive,jh7110-usb";
> +			clocks = <&stgcrg JH7110_STGCLK_USB0_LPM>,
> +				 <&stgcrg JH7110_STGCLK_USB0_STB>,
> +				 <&stgcrg JH7110_STGCLK_USB0_APB>,
> +				 <&stgcrg JH7110_STGCLK_USB0_AXI>,
> +				 <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
> +			clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
> +			resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
> +				 <&stgcrg JH7110_STGRST_USB0_APB>,
> +				 <&stgcrg JH7110_STGRST_USB0_AXI>,
> +				 <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
> +			starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
> +			starfive,sys-syscon = <&sys_syscon 0x18>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x0 0x10100000 0x100000>;
> +
> +			usbdrd_cdns3: usb@0 {
> +				compatible = "cdns,usb3";

This pattern of USB wrapper and then a "generic" IP node is discouraged 
if it is just clocks, resets, power-domains, etc. IOW, unless there's an 
actual wrapper h/w block with its own registers, then don't do this 
split. Merge it all into a single node.

> +				reg = <0x0 0x10000>,
> +				      <0x10000 0x10000>,
> +				      <0x20000 0x10000>;
> +				reg-names = "otg", "xhci", "dev";
> +				interrupts = <100>, <108>, <110>;
> +				interrupt-names = "host", "peripheral", "otg";
> +				phys = <&usbphy0>;
> +				phy-names = "cdns3,usb2-phy";

No need for *-names when there is only 1 entry. Names are local to the 
device and only to distinguish entries, so 'usb2' would be sufficient 
here.

> +				maximum-speed = "super-speed";
> +			};
> +		};
> +
> +		usbphy0: phy@10200000 {
> +			compatible = "starfive,jh7110-usb-phy";
> +			reg = <0x0 0x10200000 0x0 0x10000>;
> +			clocks = <&syscrg JH7110_SYSCLK_USB_125M>,
> +				 <&stgcrg JH7110_STGCLK_USB0_APP_125>;
> +			clock-names = "125m", "app_125";
> +			#phy-cells = <0>;
> +		};
> +
> +		pciephy0: phy@10210000 {
> +			compatible = "starfive,jh7110-pcie-phy";
> +			reg = <0x0 0x10210000 0x0 0x10000>;
> +			#phy-cells = <0>;
> +		};
> +
> +		pciephy1: phy@10220000 {
> +			compatible = "starfive,jh7110-pcie-phy";
> +			reg = <0x0 0x10220000 0x0 0x10000>;
> +			#phy-cells = <0>;
> +		};
> +
>  		stgcrg: clock-controller@10230000 {
>  			compatible = "starfive,jh7110-stgcrg";
>  			reg = <0x0 0x10230000 0x0 0x10000>;
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
