Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62C2C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 03:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UanE8rgg7Q1/b8OWUvm6CuGkH+4XyoTC9Vh/ajVhkY=; b=Bb0kssm86dJYlw
	uj/2+og1NT0h1G2RvKYQO0oVzTGmkaSo3uTefcXpv58zWxFMpX2hFnkn+cKchby8a0hGEl0OxKkHj
	g7iRQzVGLyxYViz48/YFVxaj4hEceJwI9MHm/I/KyADOxFUVDat2ZXITZynkObfST7jxo8/2kWO8g
	m0XiHICZbkKOtoBwgqHXnxkkLi6XuJQxfc6HCHiDoSISX0uWGxfYCPD+zfbUMKdGDqB9oiRQ3Jotn
	gWkzKqdm6u408jkcbjnajNOioG2MI4uX7OTB1PkHi/BFW1W+B6YKL20E+0wLhITKXsBcpepF0GyCA
	icNCEpozeXELM/BKY1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdtL-00F2nS-3D;
	Thu, 16 Mar 2023 03:02:59 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdtH-00F2jg-2S;
	Thu, 16 Mar 2023 03:02:57 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0463B24E208;
	Thu, 16 Mar 2023 11:02:27 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:02:26 +0800
Received: from [192.168.125.108] (113.72.145.194) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:02:25 +0800
Message-ID: <7d573125-c751-3cb1-4506-a65c5705f590@starfivetech.com>
Date: Thu, 16 Mar 2023 11:02:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Content-Language: en-US
To: Peter Chen <peter.chen@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Roger Quadros
	<rogerq@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
 <20230316024305.GA2322573@nchen-desktop>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230316024305.GA2322573@nchen-desktop>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_200256_085734_A289371F 
X-CRM114-Status: GOOD (  11.92  )
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



On 2023/3/16 10:43, Peter Chen wrote:
> On 23-03-15 18:44:11, Minda Chen wrote:
>> USB Glue layer and Cadence USB subnode configuration,
>> also includes USB and PCIe phy dts configuration.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         |  7 +++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 54 +++++++++++++++++++
>>  2 files changed, 61 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index a132debb9b53..c64476aebc1a 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -236,3 +236,10 @@
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
>>  };
>> +
>> +&usb0 {
>> +	status = "okay";
>> +	usbdrd_cdns3: usb@0 {
>> +		dr_mode = "peripheral";
>> +	};
>> +};
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index f70a4ed47eb4..17722fd1be62 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -362,6 +362,60 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		usb0: usb@10100000 {
>> +			compatible = "starfive,jh7110-usb";
>> +			clocks = <&stgcrg JH7110_STGCLK_USB0_LPM>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_STB>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_APB>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_AXI>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_UTMI_APB>;
>> +			clock-names = "lpm", "stb", "apb", "axi", "utmi_apb";
>> +			resets = <&stgcrg JH7110_STGRST_USB0_PWRUP>,
>> +				 <&stgcrg JH7110_STGRST_USB0_APB>,
>> +				 <&stgcrg JH7110_STGRST_USB0_AXI>,
>> +				 <&stgcrg JH7110_STGRST_USB0_UTMI_APB>;
>> +			starfive,stg-syscon = <&stg_syscon 0x4 0xc4 0x148 0x1f4>;
>> +			starfive,sys-syscon = <&sys_syscon 0x18>;
>> +			status = "disabled";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			ranges = <0x0 0x0 0x10100000 0x100000>;
> 
> Why it is four entry at ranges? Your address-cells and size-cells are
> both 1, and your binding-doc is also three?
> 
> Peter
Because the parent soc node address-cells is 2. So the local address is 2 entry.
  	
	soc {
                compatible = "simple-bus";
                interrupt-parent = <&plic>;
                #address-cells = <2>;
                #size-cells = <2>;
                ranges;
                ...

So should I change the binding-doc ?
>> +
>> +			usbdrd_cdns3: usb@0 {
>> +				compatible = "cdns,usb3";
>> +				reg = <0x0 0x10000>,
>> +				      <0x10000 0x10000>,
>> +				      <0x20000 0x10000>;
>> +				reg-names = "otg", "xhci", "dev";
>> +				interrupts = <100>, <108>, <110>;
>> +				interrupt-names = "host", "peripheral", "otg";
>> +				phys = <&usbphy0>;
>> +				phy-names = "cdns3,usb2-phy";
>> +				maximum-speed = "super-speed";
>> +			};
>> +		};
>> +
>> +		usbphy0: phy@10200000 {
>> +			compatible = "starfive,jh7110-usb-phy";
>> +			reg = <0x0 0x10200000 0x0 0x10000>;
>> +			clocks = <&syscrg JH7110_SYSCLK_USB_125M>,
>> +				 <&stgcrg JH7110_STGCLK_USB0_APP_125>;
>> +			clock-names = "125m", "app_125";
>> +			#phy-cells = <0>;
>> +		};
>> +
>> +		pciephy0: phy@10210000 {
>> +			compatible = "starfive,jh7110-pcie-phy";
>> +			reg = <0x0 0x10210000 0x0 0x10000>;
>> +			#phy-cells = <0>;
>> +		};
>> +
>> +		pciephy1: phy@10220000 {
>> +			compatible = "starfive,jh7110-pcie-phy";
>> +			reg = <0x0 0x10220000 0x0 0x10000>;
>> +			#phy-cells = <0>;
>> +		};
>> +
>>  		stgcrg: clock-controller@10230000 {
>>  			compatible = "starfive,jh7110-stgcrg";
>>  			reg = <0x0 0x10230000 0x0 0x10000>;
>> -- 
>> 2.17.1
>> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
