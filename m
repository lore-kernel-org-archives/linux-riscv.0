Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEEDC77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 08:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPmn6cQTkATSSeGoqpsTNLXLsEPpm+jYUY4fCNfPm7E=; b=L/+SDWqi4147zy
	SGIcOMq0Z8uwTQZ0qRj2xlkCLaxOA3kFYsuYfPThoIHXj/rjOlYL/gYjUZVuxsMIugHlea6n/dbN8
	TFtOt57WjbQY/Xg61VGYLeZ+EQ1Qp6x5BgNHoXIZG2vOvBJtLzfTSKRx2taKHRvyi25qm/Na9T35T
	Cl19ZXy1ue9lL9lkYd5aOjZY7Em4zVTtR8+SOp8gWeuJbXy2NlCm8CZEoMNzpRPOgRLCzTtAAXxGb
	LsbAOtBqi5xRnOHzGUEGBL8A0Rfi2Srq0anlB469CIsvj5GiPwPBF/21oiVwiSzN8tbRLoJFNuWI9
	N60B/398znYKyOpp+Zqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyTpw-001Rp9-0b;
	Mon, 15 May 2023 08:45:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyTpr-001RmA-3D
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 08:45:42 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id AAA9724E1CF;
	Mon, 15 May 2023 16:44:55 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 16:44:55 +0800
Received: from [192.168.125.124] (113.72.146.187) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 16:44:54 +0800
Message-ID: <cd7803a2-38a0-c498-467f-1ef802645527@starfivetech.com>
Date: Mon, 15 May 2023 16:44:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: add the node and pins
 configuration for tdm
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-4-walker.chen@starfivetech.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230511091549.28003-4-walker.chen@starfivetech.com>
X-Originating-IP: [113.72.146.187]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_014540_336034_92C54432 
X-CRM114-Status: GOOD (  14.28  )
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

On 2023/5/11 17:15, Walker Chen wrote:
> Add the tdm controller node and pins configuration of tdm for the
> StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 40 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 21 ++++++++++
>  2 files changed, 61 insertions(+)
> 
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

Hi Conor / Emil,

Based on our discussion a few days ago, the new version of patch for dts looks like this,
Please help to review and provide your comments if you feel free.
Thank you very much!

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
