Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA887CA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUaYmfevhPBmvKUyHAwF5NHPYgUpO3zQsior1WSZl50=; b=zrQMFmFZBvawDL
	kPGnW1791+7aDf6ygzBRhIN/eKhj1UjCeol57DmGKiBCuuBAZjH+nlNMA16UNwDlHCufUhMpPr/hz
	ApkH6R4Tc6sQiNtV3ugpgjqv+tX0MVCHEM3NSL9YL3WjBshHqYE6iKdT6e0qvPKlFw+OvVFfR09Qk
	Le/rPXLPR908GGzZTAz0AQI5C6aosVYiJqj8uJ1e5SMSi7usbmsY4snT8MRLTw90GlNn+aLISDofA
	jjY82PELB9tlMGSffjS/wn+bj4fpJaT6bjF+eZwV/+nirdG6/8tVS8IU6SM9Ucn/5E/gbWoXPvCwH
	Y94JxpwbBFXZ+Jwzasbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXbN-00000003dSD-44kN;
	Tue, 29 Sep 2026 13:10:34 +0000
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXbL-00000003dRA-1jLV
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 13:10:32 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a2ffee6so1471367b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 06:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790687430; x=1791292230; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oZTmxjICgURDLEHLhO6/OoiWcJxhZ7ADO3JC0gvfruw=;
        b=aQfolvRlDu3JLbUsr/xl/BxHVuFWpCnt+VgOyuByKgYE1w+F97VZsJF2nJnqrNxqrV
         wmFMAJ/NdNW6xCOWcLxwVxkByn79aI5aEzCK3vVaVU6zDjkMrQxGLuIhLNRsfFZU8Qle
         WWzWtfRs2Umqpv4KXc5vLVLPWuOnyByNYoKr+iNKJnVEfHobP2iWWbXRSTgiYxk3Rxjj
         /UXW3+Jgg1OT9Uy9Wp0N7YoGPILDP3zRfxl281Kf7m38jNFxBQE3ovWG1NmCZ2ruZ8Ie
         JAYvZIhfjHghmucoFL82BOqiaVTRL8BxK+n36vVSkRtLFP9NS2KdqHgHXqA5sZTAnz5K
         zBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687430; x=1791292230;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZTmxjICgURDLEHLhO6/OoiWcJxhZ7ADO3JC0gvfruw=;
        b=H3+Qxs0u8g3BBhjn9rduh2cNO1AjiF/KfU4a3OIcLHX1JwpCHPwTyAk4Pb693zq8If
         4Wy2YbN3F7jAHvmlEJufeOY+0CO5nd3CM5aKpTelZLVS8gQ51R6MfpUGjgt1LFnH8Ppy
         y0VlUq7OO3ICzk6vEnew0R+ftYQIiMrF5RucZ1OBHVs77qB0HvZ4myVH8CFXqpK6cNv6
         FATDKbLaO8gOCeYazU2hcrWsHaKd0KmsDDUWjpc9vHsEpcy8v1b4fSfUOOX9+7bv8rZs
         81aP0rOBOeHGtBxGNf3kl8FuYCMC4msbtCOfSoOPm7f0dRdz+VI7U5dip8Xj5rto9k72
         TnZg==
X-Forwarded-Encrypted: i=1; AKwUvBzhke3YN6WZZTigYa+MN6cyF72MRjBT4yX4Oj06PN/3y75H4NTaCohTxOViDrngasq4EOGnnSV2xjNP6A==@lists.infradead.org
X-Gm-Message-State: AFuF++nUFZLFD+Slwot4uaXKh6KKWdrv+WUPMl2H7V2D4QC6u/tdQJyn
	f9bVbOp3/xbzj2i8VGRPaXNhOWV934cyeRnDTXa1LITge8602/VbeUrwDAtJ1yIUOi4=
X-Gm-Gg: AYBFou18WHVf7c2fqzg/h9shD1ZSty7PhOkeZCZJCfBjdpnjoE5Ub9oRMwIvWficQQ7
	Tveo6Mud2B6Y8mjE5EFZEChqG+8uh1V/MG86rGVfTGQWNIjrKbAIe4F+hfN/WzHzg+baQIY0zv5
	cgY8vXGmEs9K8jViKLu6Z360+tiIJUFD3yVG0M68PB9kMo0qJPvZUfy2+t80ZJmfKT5InonW7b4
	NxCqp+7+bdaJuQ2Hj4W9OEdaCqnZbHrj5T8YbKd5zXormwn+KvDsJq0d4u3xcg0iJtCPuTnM3mu
	upzX6BxX6rt4K/dWjB/mmSL4LAyJcYaSRZhcVTtLv2Zlh2Mmea7U4zk0nCbIGwNc+DlUsLpawEO
	/Mmb3F2BJCC6jvoQPYEUhRd55jviPgS5oYriIFuJuqJTpli+Q+Ijx3X1MwHobwaz54JZSyM+QCa
	V5uUHBH3H32gJl7czX6I2y032i0fPfZePWEF7CUmsrCXFB8JAZcU5i/oTtkvsY6uwa/c6Y2Yo=
X-Received: by 2002:a05:6808:4fe2:b0:4d6:9283:1be0 with SMTP id 5614622812f47-4dc6812eb3dmr14361082b6e.61.1790687429708;
        Tue, 29 Sep 2026 06:10:29 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.13.74])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbbb2324csm4568858b6e.8.2026.09.29.06.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:10:28 -0700 (PDT)
Message-ID: <a55c26e3-1bf0-4ba1-b8b9-14ad76a44a14@sifive.com>
Date: Tue, 29 Sep 2026 08:10:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] riscv: dts: eswin: add I2C controller support
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Min Lin <linmin@eswincomputing.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-7-pinkesh.vaghela@einfochips.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260814070007.1662455-7-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_061031_480561_0F98319C 
X-CRM114-Status: GOOD (  14.62  )
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

Hi Pinkesh,

On 2026-08-14 2:00 AM, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add I2C nodes for EIC7700 SoC.
> Also add nodes for corresponding slave devices in dts file and
> enable them for HiFive Premier P550 board
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  56 +++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 156 ++++++++++++++++++
>  2 files changed, 212 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 3101fd90d171..5dddcf13fd25 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -130,6 +130,62 @@ &gpio111_pins {
>  	input-disable;
>  };
>  
> +&aon_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c10_pins>;
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +	};
> +};
> +
> +&aon_i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c11_pins>;
> +
> +	adc@10 {
> +		compatible = "microchip,pac1934";
> +		reg = <0x10>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		channel@1 {
> +			reg = <0x1>;
> +			shunt-resistor-micro-ohms = <1000>;
> +			label = "VDD_SOM";
> +		};
> +
> +		channel@2 {
> +			reg = <0x2>;
> +			shunt-resistor-micro-ohms = <1000>;
> +			label = "VDD_SOC";
> +		};
> +
> +		channel@3 {
> +			reg = <0x3>;
> +			shunt-resistor-micro-ohms = <1000>;
> +			label = "VDD_CPU";
> +		};
> +
> +		channel@4 {
> +			reg = <0x4>;
> +			shunt-resistor-micro-ohms = <1000>;
> +			label = "VDD_LPDDR";
> +		};
> +	};
> +
> +	power-sensor@44 {
> +		compatible = "ti,ina226";
> +		reg = <0x44>;
> +		#io-channel-cells = <1>;
> +		label = "sys_power";
> +		shunt-resistor = <1000>;
> +	};
> +};
> +
>  &pinctrl {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gpio0_pins>, <&gpio5_pins>, <&gpio11_pins>,
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> index 771a88645d83..c13432d14504 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -315,6 +315,162 @@ uart4: serial@50940000 {
>  			status = "disabled";
>  		};
>  
> +		i2c0: i2c@50950000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50950000 0x0 0x8000>;
> +			interrupts = <105>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C0_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

Each controller that has only one possible pinmux should reference the
corresponding pinctrl nodes, so it doesn't have to be duplicated in every board DTS.

> +		};
> +
> +		i2c1: i2c@50960000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50960000 0x0 0x8000>;
> +			interrupts = <106>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C1_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@50970000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50970000 0x0 0x8000>;
> +			interrupts = <107>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C2_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@50980000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50980000 0x0 0x8000>;
> +			interrupts = <108>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C3_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@50990000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x50990000 0x0 0x8000>;
> +			interrupts = <109>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C4_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c5: i2c@509a0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509a0000 0x0 0x8000>;
> +			interrupts = <110>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C5_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c6: i2c@509b0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509b0000 0x0 0x8000>;
> +			interrupts = <111>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C6_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c7: i2c@509c0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509c0000 0x0 0x8000>;
> +			interrupts = <112>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C7_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c8: i2c@509d0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509d0000 0x0 0x8000>;
> +			interrupts = <113>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C8_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C8>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c9: i2c@509e0000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x509e0000 0x0 0x8000>;
> +			interrupts = <114>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C9_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_I2C9>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		aon_i2c0: i2c@51830000 {

Please keep nodes sorted (the aon block controllers go below GPIO, etc.).

Regards,
Samuel

> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x51830000 0x0 0x8000>;
> +			interrupts = <290>;
> +			clocks = <&clk EIC7700_CLK_GATE_AON_I2C0_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_ANO0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		aon_i2c1: i2c@51838000 {
> +			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
> +			reg = <0x0 0x51838000 0x0 0x8000>;
> +			interrupts = <291>;
> +			clocks = <&clk EIC7700_CLK_GATE_AON_I2C1_PCLK>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			resets = <&reset EIC7700_RESET_ANO1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		gpio@51600000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0x0 0x51600000 0x0 0x80>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
