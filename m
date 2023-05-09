Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EE2C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyCct0epNiUL/xjHZmaG2Dzd8DseBexW5J3wuochc/U=; b=wPH1vDVdGzcZLV
	MRJgC5jkx6ZT704RA+bYqZVR6UGl4EQQiOGRWQVT3rR3nHaudqAnFEMFz6oGJT+ln6nzoe0Q4QXxk
	wr/sylmbWhBZRZCbU7AdlYgUGixwUJlxzQ3Xy7b2wg8jD/9wicHGICCbMtYJuNXOUSFGcT6+p9iEY
	KlMub5U6iu5tOGUgiZxu+Q4UNPPfUIjSGIfcfOfBehcdBM791kmwOHhWHZnJxHSlmKbFM+5PKYSDJ
	Ul3YVKAiifSIVFVul1KuZBvZk01wD5bp6XS/hM1/TNxhIB4aXLlWFOGqeJ9N2m74jEbEAcfLuIHJG
	IbBMuOHGXt9bgPCPAEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMqU-003L4R-03;
	Tue, 09 May 2023 12:53:34 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMqP-003L2t-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 12:53:32 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 50AA524E1F0;
	Tue,  9 May 2023 20:52:50 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 9 May
 2023 20:52:50 +0800
Received: from [192.168.125.124] (183.27.98.219) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 9 May
 2023 20:52:49 +0800
Message-ID: <a0932e84-3813-bbbe-762d-948d75fbcd8a@starfivetech.com>
Date: Tue, 9 May 2023 20:52:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add tdm node and sound card
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-4-walker.chen@starfivetech.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230506090116.9206-4-walker.chen@starfivetech.com>
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_055329_838481_BE0BE382 
X-CRM114-Status: GOOD (  16.50  )
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

Hi Conor/Emil,

DT overlay is used to describe combinations of VF2 and hat. Do you have any comments on this patch ?
Thanks!

Best regards,
Walker

On 2023/5/6 17:01, Walker Chen wrote:
> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  3 +
>  .../jh7110-starfive-visionfive-2-wm8960.dtso  | 70 +++++++++++++++++++
>  .../jh7110-starfive-visionfive-2.dtsi         | 40 +++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 21 ++++++
>  4 files changed, 134 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-wm8960.dtso
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 170956846d49..644cc29b5be3 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -4,3 +4,6 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>  
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> +
> +jh7110-starfive-visionfive-2-wm8960-dtbs := jh7110-starfive-visionfive-2-v1.3b.dtb jh7110-starfive-visionfive-2-wm8960.dtbo
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-wm8960.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-wm8960.dtso b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-wm8960.dtso
> new file mode 100644
> index 000000000000..67897f000883
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-wm8960.dtso
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + *
> + * Requires ReSpeaker 2-Mics Pi HAT plugged in 40-pin GPIO header.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	compatible = "starfive,visionfive-2-v1.3b", "starfive,jh7110";
> +
> +	wm8960_mclk: wm8960-mclk {
> +		compatible = "fixed-clock";
> +		clock-output-names = "wm8960_mclk";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		simple-audio-card,name = "Starfive-TDM-Sound-Card";
> +		simple-audio-card,widgets = "Microphone", "Mic Jack",
> +					    "Line", "Line In",
> +					    "Line", "Line Out",
> +					    "Speaker", "Speaker",
> +					    "Headphone", "Headphone Jack";
> +		simple-audio-card,routing = "Headphone Jack", "HP_L",
> +					    "Headphone Jack", "HP_R",
> +					    "Speaker", "SPK_LP",
> +					    "Speaker", "SPK_LN",
> +					    "LINPUT1", "Mic Jack",
> +					    "LINPUT3", "Mic Jack",
> +					    "RINPUT1", "Mic Jack",
> +					    "RINPUT2", "Mic Jack";
> +
> +		simple-audio-card,dai-link@0 {
> +			reg = <0>;
> +			format = "dsp_a";
> +			bitclock-master = <&dailink_master>;
> +			frame-master = <&dailink_master>;
> +
> +			cpu {
> +				sound-dai = <&tdm>;
> +			};
> +			dailink_master: codec {
> +				sound-dai = <&wm8960>;
> +				clocks = <&wm8960_mclk>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	wm8960: codec@1a {
> +		compatible = "wlf,wm8960";
> +		reg = <0x1a>;
> +		wlf,shared-lrclk;
> +		#sound-dai-cells = <0>;
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 1155b97b593d..19b5954ee72d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -214,6 +214,40 @@
>  			slew-rate = <0>;
>  		};
>  	};
> +
> +	tdm0_pins: tdm0-pins {
> +		tdm0-pins-tx {
> +			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +
> +		tdm0-pins-rx {
> +			pinmux = <GPIOMUX(61, GPOUT_HIGH,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_TDM_RXD)>;
> +			input-enable;
> +		};
> +
> +		tdm0-pins-sync {
> +			pinmux = <GPIOMUX(63, GPOUT_HIGH,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_TDM_SYNC)>;
> +			input-enable;
> +		};
> +
> +		tdm0-pins-pcmclk {
> +			pinmux = <GPIOMUX(38, GPOUT_HIGH,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_TDM_CLK)>;
> +			input-enable;
> +		};
> +	};
>  };
>  
>  &uart0 {
> @@ -221,3 +255,9 @@
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&tdm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&tdm0_pins>;
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 866313570a7e..cfda6fb0d91b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -366,6 +366,27 @@
>  			status = "disabled";
>  		};
>  
> +		tdm: tdm@10090000 {
> +			compatible = "starfive,jh7110-tdm";
> +			reg = <0x0 0x10090000 0x0 0x1000>;
> +			clocks = <&syscrg JH7110_SYSCLK_TDM_AHB>,
> +				 <&syscrg JH7110_SYSCLK_TDM_APB>,
> +				 <&syscrg JH7110_SYSCLK_TDM_INTERNAL>,
> +				 <&syscrg JH7110_SYSCLK_TDM_TDM>,
> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> +				 <&tdm_ext>;
> +			clock-names = "tdm_ahb", "tdm_apb",
> +				      "tdm_internal", "tdm",
> +				      "mclk_inner", "tdm_ext";
> +			resets = <&syscrg JH7110_SYSRST_TDM_AHB>,
> +				 <&syscrg JH7110_SYSRST_TDM_APB>,
> +				 <&syscrg JH7110_SYSRST_TDM_CORE>;
> +			dmas = <&dma 20>, <&dma 21>;
> +			dma-names = "rx","tx";
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		stgcrg: clock-controller@10230000 {
>  			compatible = "starfive,jh7110-stgcrg";
>  			reg = <0x0 0x10230000 0x0 0x10000>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
