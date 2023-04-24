Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA66C7618E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wDIc2twxMYsXsmENXSnZ+oltYxyoEioYPeOJNUUoUI=; b=l9WFJgVmA4Lnmo
	x69r/ynlBVksxEBo9x4whBtOP4Ibfgp0O6rkwnB51AwmIEVUwruYajHZQODe6iZX5YBseMW+FKgTZ
	KlDOxDVK9cP2Kmtrua5vj+CxutvSztAaIEpslnjsyYCRF64Qo03xNMr4mnnYn64wAZwX2J4Xp6HIy
	x/9ZFR5KULxYL1UQ3f+lwgiHhoHgd2F9pC7VkZi2+D38KlYDdyq6IjKyZoL+cl2NvN4FyTkZbQeLl
	X6dyCEtera3o/3TCzO6t1oA53Y2rfuW5iokzko63rH8t5Ct8NW8IH/uXvgTENIoJlbveLLyQaPPTI
	DGV8Z7HZNfkpcg6ReHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqxZM-00GdyY-0S;
	Mon, 24 Apr 2023 14:53:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqxZI-00GdxL-1G;
	Mon, 24 Apr 2023 14:53:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC04860B88;
	Mon, 24 Apr 2023 14:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B466DC433EF;
	Mon, 24 Apr 2023 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682348007;
	bh=9CwJJUrhNP6wOsORyqwvzaE9qMKm02sq+6yuG+Ev91U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TBFPs1eWvgDreKyP2z4H6q2ZZgTj7aEde/gln69W0CfM1jNYwm2ZOwXv2yaa6XSZL
	 ztShbHl41Mc4mpHTmfQu2bddwtSgvi5v4WdqtnWbnTo0ps12xIf1Xcdpe4Yq6mxI2U
	 Yn+El8B1UF43LNtRukJgvLHEi9vqyaGHCHbS9mR2UbwCoT9TBC50+0et1CttRAW/3V
	 xeYYEAoBZd3upWJ/U4xW5tiDzxA18r2RFlLxw1yew0gVPMBJ/LwAGhU2ZQcRQWCG1k
	 hb2WvoqBSq/pfAfIRHr5Fb9NdhMvH/52K3owwrVA78IjFCjAnpzm3H02CBPH5duf2c
	 L+osQEwIwu17Q==
Message-ID: <3f2baded-c5d6-7d94-00f3-6d8fb24262c4@kernel.org>
Date: Mon, 24 Apr 2023 17:53:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 7/7] riscv: dts: starfive: Add USB dts configuration
 for JH7110
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mason Huo <mason.huo@starfivetech.com>
References: <20230420110052.3182-1-minda.chen@starfivetech.com>
 <20230420110052.3182-8-minda.chen@starfivetech.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230420110052.3182-8-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_075328_505264_F6E45567 
X-CRM114-Status: GOOD (  17.05  )
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



On 20/04/2023 14:00, Minda Chen wrote:
> Add USB wrapper layer and Cadence USB3 controller dts
> configuration for StarFive JH7110 SoC and VisionFive2
> Board.
> USB controller connect to PHY, The PHY dts configuration
> are also added.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         |  7 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 44 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 1155b97b593d..fa97ebfd93ad 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -221,3 +221,10 @@
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&usb0 {
> +	phys = <&usbphy0>;
> +	phy-names = "usb2";
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 29cd798b6732..eee395e19cdb 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -366,6 +366,50 @@
>  			status = "disabled";
>  		};
>  
> +		usb0: usb@10100000 {
> +			compatible = "starfive,jh7110-usb";
> +			reg = <0x0 0x10100000 0x0 0x10000>,
> +			      <0x0 0x10110000 0x0 0x10000>,
> +			      <0x0 0x10120000 0x0 0x10000>;
> +			reg-names = "otg", "xhci", "dev";
> +			interrupts = <100>, <108>, <110>;
> +			interrupt-names = "host", "peripheral", "otg";
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
> +			reset-names = "pwrup", "apb", "axi", "utmi_apb";

All this can really be "cdns,usb3" node. The cdns,usb3 driver should
do reset and clocks init as it is generic.

> +			starfive,stg-syscon = <&stg_syscon 0x4>;
> +			status = "disabled";

Only the syscon handling looks starfive specific so only that handling
should be done in starfive USB driver.

This node should look like this

 
	starfive-usb@4 {
		compatible = "starfive,jh7110-usb";
		starfive,stg-syscon = <&stg_syscon 0x4>;

		usb0: usb@10100000 {
			compatible = "cdns,usb3";
			reg = <0x0 0x10100000 0x0 0x10000>,
			      <0x0 0x10110000 0x0 0x10000>,
			      <0x0 0x10120000 0x0 0x10000>;
			reg-names = "otg", "xhci", "dev";
			interrupts = <100>, <108>, <110>;
			interrupt-names = "host", "peripheral", "otg";
			clocks = <&stgcrg JH7110_STGCLK_USB0_LPM>,
				 <&stgcrg JH7110_STGCLK_USB0_STB>,
				 <&stgcrg JH7110_STGCLK_USB0_APB>,
				 <&stgcrg JH7110_STGCLK_USB0_AXI>,
				 <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
			clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
			resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
				 <&stgcrg JH7110_STGRST_USB0_APB>,
				 <&stgcrg JH7110_STGRST_USB0_AXI>,
				 <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
			reset-names = "pwrup", "apb", "axi", "utmi_apb";
			starfive,stg-syscon = <&stg_syscon 0x4>;
			status = "disabled";
		};
	}

In starfife-usb driver you can use of_platform_default_populate()
to create the cdns,usb3 child for you.

> +		};
> +
> +		usbphy0: phy@10200000 {
> +			compatible = "starfive,jh7110-usb-phy";
> +			reg = <0x0 0x10200000 0x0 0x10000>;
> +			clocks = <&syscrg JH7110_SYSCLK_USB_125M>,
> +				 <&stgcrg JH7110_STGCLK_USB0_APP_125>;
> +			clock-names = "125m", "app_125m";
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

cheers,
-roger

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
