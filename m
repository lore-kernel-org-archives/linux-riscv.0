Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB1C761A6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Be+kpkQzm4tCH05avTo4ej0ab9fFb3QamacN49zIyk=; b=UrqO8WdF5CS8t2
	AaCveM0bidobrxc4/FgzniCra7bSJb8glySsP0T/cKvh33f93pIaFaH0m+QTV18q8mWpqDqwWEHr1
	6j2V1OxJA+EKUK2mOV2j3z/AjNQWhJsNqV9QED3a/pCnN+ZUGX1SbuLVuV75dWsLjuuaI+zdVPbEl
	bMBMSEoOWArCvztwN6eHXc5QiVkmUKosMez5gGuok4p0dR242hLayoeyLQUzx3Cw3QJ8roA3OTlaf
	pUnVdpTLtvr6sf0vSehCnb8xyYrCArGh0V/LL8vF+Hq0OsAkMkwZXeXkVBo4U8bWGtGa2CdGM3Vfa
	Rt1yejjJpqMsG1pk04LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJmQ-00FN1b-02;
	Mon, 03 Apr 2023 12:59:26 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJmK-00FMzc-0R
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:59:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2625724E094;
	Mon,  3 Apr 2023 20:58:56 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:58:56 +0800
Received: from [192.168.125.145] (183.27.97.179) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Apr
 2023 20:58:55 +0800
Message-ID: <693c38f8-6aec-dd50-94a0-65300b6ed1b2@starfivetech.com>
Date: Mon, 3 Apr 2023 20:58:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: add tdm node and sound card
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-4-walker.chen@starfivetech.com>
 <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <d455a90a-7e63-2254-75cb-70cb26ae7483@linaro.org>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_055920_566857_A9248ECC 
X-CRM114-Status: GOOD (  14.37  )
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



On 2023/3/30 15:43, Krzysztof Kozlowski wrote:
> On 29/03/2023 17:33, Walker Chen wrote:
>> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
>> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         | 87 +++++++++++++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 34 ++++++++
>>  2 files changed, 121 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index 1155b97b593d..35137c2edf5d 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -62,6 +62,10 @@
>>  	clock-frequency = <297000000>;
>>  };
>>  
>> +&wm8960_mclk {
>> +	clock-frequency = <24576000>;
>> +};
>> +
>>  &i2srx_bclk_ext {
>>  	clock-frequency = <12288000>;
>>  };
>> @@ -102,6 +106,14 @@
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&i2c0_pins>;
>>  	status = "okay";
>> +
>> +	wm8960: codec@1a {
>> +		compatible = "wlf,wm8960";
>> +		reg = <0x1a>;
>> +		#sound-dai-cells = <0>;
>> +
>> +		wlf,shared-lrclk;
>> +	};
>>  };
>>  
>>  &i2c2 {
>> @@ -214,6 +226,40 @@
>>  			slew-rate = <0>;
>>  		};
>>  	};
>> +
>> +	tdm0_pins: tdm0-pins {
>> +		tdm0-pins-tx {
>> +			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
>> +					      GPOEN_ENABLE,
>> +					      GPI_NONE)>;
>> +			bias-pull-up;
>> +			drive-strength = <2>;
>> +			input-disable;
>> +			input-schmitt-disable;
>> +			slew-rate = <0>;
>> +		};
>> +
>> +		tdm0-pins-rx {
>> +			pinmux = <GPIOMUX(61, GPOUT_HIGH,
>> +					      GPOEN_DISABLE,
>> +					      GPI_SYS_TDM_RXD)>;
>> +			input-enable;
>> +		};
>> +
>> +		tdm0-pins-sync {
>> +			pinmux = <GPIOMUX(63, GPOUT_HIGH,
>> +					      GPOEN_DISABLE,
>> +					      GPI_SYS_TDM_SYNC)>;
>> +			input-enable;
>> +		};
>> +
>> +		tdm0-pins-pcmclk {
>> +			pinmux = <GPIOMUX(38, GPOUT_HIGH,
>> +					      GPOEN_DISABLE,
>> +					      GPI_SYS_TDM_CLK)>;
>> +			input-enable;
>> +		};
>> +	};
>>  };
>>  
>>  &uart0 {
>> @@ -221,3 +267,44 @@
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
>>  };
>> +
>> +&tdm {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&tdm0_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&sound0 {
>> +	simple-audio-card,dai-link@0 {
>> +		reg = <0>;
>> +		status = "okay";
> 
> Why? Drop.

Will drop it.

> 
>> +		format = "dsp_a";
>> +		bitclock-master = <&dailink_master>;
>> +		frame-master = <&dailink_master>;
>> +
>> +		widgets =
> 
> Drop line break.

OK, will drop it.

> 
>> +				"Microphone", "Mic Jack",
>> +				"Line", "Line In",
>> +				"Line", "Line Out",
>> +				"Speaker", "Speaker",
>> +				"Headphone", "Headphone Jack";
>> +		routing =
> 
> Drop unnecessary line break.

OK, will drop it.

> 
>> +				"Headphone Jack", "HP_L",
>> +				"Headphone Jack", "HP_R",
>> +				"Speaker", "SPK_LP",
>> +				"Speaker", "SPK_LN",
>> +				"LINPUT1", "Mic Jack",
>> +				"LINPUT3", "Mic Jack",
>> +				"RINPUT1", "Mic Jack",
>> +				"RINPUT2", "Mic Jack";
>> +		cpu {
>> +			sound-dai = <&tdm>;
>> +		};
>> +
>> +		dailink_master:codec {
> 
> Missing space after label:.

Will be fixed.

> 
>> +			sound-dai = <&wm8960>;
>> +			clocks = <&wm8960_mclk>;
>> +			clock-names = "mclk";
>> +		};
>> +	};
>> +};
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index b503b6137743..a89158d1d7a6 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -210,6 +210,12 @@
>>  		#clock-cells = <0>;
>>  	};
>>  
>> +	wm8960_mclk: wm8960_mclk {
> 
> No underscores in node names. Use consistent naming - do you see here
> any nodes named "mclk"?
> 
> Anyway this is some fake clock. Real clock should come out from wm8960.

Thank you for pointing out this, it will be fixed.

> 
>> +		compatible = "fixed-clock";
>> +		clock-output-names = "wm8960_mclk";
>> +		#clock-cells = <0>;
>> +	};
>> +
>>  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
>>  		compatible = "fixed-clock";
>>  		clock-output-names = "i2srx_bclk_ext";
>> @@ -375,6 +381,27 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		tdm: tdm@10090000 {
>> +			compatible = "starfive,jh7110-tdm";
>> +			reg = <0x0 0x10090000 0x0 0x1000>;
>> +			clocks = <&syscrg JH7110_SYSCLK_TDM_AHB>,
>> +				 <&syscrg JH7110_SYSCLK_TDM_APB>,
>> +				 <&syscrg JH7110_SYSCLK_TDM_INTERNAL>,
>> +				 <&syscrg JH7110_SYSCLK_TDM_TDM>,
>> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
>> +				 <&tdm_ext>;
>> +			clock-names = "tdm_ahb", "tdm_apb",
>> +				      "tdm_internal", "tdm",
>> +				      "mclk_inner", "tdm_ext";
>> +			resets = <&syscrg JH7110_SYSRST_TDM_AHB>,
>> +				 <&syscrg JH7110_SYSRST_TDM_APB>,
>> +				 <&syscrg JH7110_SYSRST_TDM_CORE>;
>> +			dmas = <&dma 20>, <&dma 21>;
>> +			dma-names = "rx","tx";
>> +			#sound-dai-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>>  		stgcrg: clock-controller@10230000 {
>>  			compatible = "starfive,jh7110-stgcrg";
>>  			reg = <0x0 0x10230000 0x0 0x10000>;
>> @@ -601,5 +628,12 @@
>>  			#reset-cells = <1>;
>>  			power-domains = <&pwrc JH7110_PD_VOUT>;
>>  		};
>> +
>> +		sound0: snd-card0 {
> 
> 1. Why card0?

There are several audio interfaces in JH7110 SoC, each as an independent sound card.
TDM is for snd-card0, latter i2s will be for snd-card1, spdif will be for snd-card2, etc.

> 2. Where is this node located? In MMIO bus? Run some basic checks on
> your DTS before submitting upstream.
> dtbs_check
> dtbs W=1
> 
> 3. Why this is even in the DTSI? This really looks wrong.

It seems that the sound node should be located in DTS file more appropriately.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
