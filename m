Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A316DC36005
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xphqmpP1uLYo6UYtnRFnsMKCN/6WOfPEkQC2tI9QTMA=; b=E74JuIwShNjj8/
	mos6GXXVlAZ6JnpBQDH8JSvISV0TjDTpv0gWRHSyMCiuHXX/XgFxyDX8S4ev8zXyVyMKiCcipmXeY
	hYvcAH3GZWBfUvw5GsNvalK7EmLMXvHvzZGBeX6308QX+cqrwckuqeHZEQJgTSAdGl2HS6YhXWUmp
	6wO1TUf8MFHC0HBJt1fnxLF8r/1heSMLgLuBso1O+/fx1Wr4pjyaR0W6pkq6myXk3yO8gxO20ByXJ
	U22pNklWQ9S7LGDxDl3w+GiYxCxAsBjfpvUYhiYqvCDO6R39/IJSYxQ9Uv1ORJaq0DXg3AL/czJFi
	0NQ2ohf234eY4a4AIlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9L3a-00000005haU-3F78;
	Mon, 28 Apr 2025 09:45:46 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9L2k-00000005hQM-156d
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 09:44:55 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1364b8143;
	Mon, 28 Apr 2025 17:44:46 +0800 (GMT+08:00)
Message-ID: <c94409d9-3bd1-42c3-b5f6-785e994baa77@whut.edu.cn>
Date: Mon, 28 Apr 2025 17:44:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add usb3.0 support for K1
To: Yao Zi <ziyao@disroot.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
 <20250428-b4-k1-dwc3-v2-v1-2-7cb061abd619@whut.edu.cn>
 <aA87PjTsbHxxFOdl@pie.lan>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <aA87PjTsbHxxFOdl@pie.lan>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGBhLVkxLQ0oYSEMYTU1DQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
X-HM-Tid: 0a967bc8e9ca03a1kunm1364b8143
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K1E6OQw5ITIBCTQWIQI9Ng41
	EEwwChxVSlVKTE9OQ0hIT0JJT0hNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBTE5NSTcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_024454_490285_A4952380 
X-CRM114-Status: GOOD (  19.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/28/25 4:24 PM, Yao Zi wrote:
> On Mon, Apr 28, 2025 at 03:38:12PM +0800, Ze Huang wrote:
>> Add USB 3.0 support for the SpacemiT K1 SoC, including the
>> following components:
>>
>> - USB 2.0 PHY nodes
>> - USB 3.0 combo PHY node
>> - USB 3.0 host controller
>> - USB 3.0 hub and vbus regulator (usb3_vhub, usb3_vbus)
>> - DRAM interconnect node for USB DMA ("dma-mem")
>>
>> The `usb3_vbus` and `usb3_vhub` regulator node provides a fixed 5V
>> supply to power the onboard USB 3.0 hub and usb vbus.
>>
>> On K1, some DMA transfers from devices to memory use separate buses with
>> different DMA address translation rules from the parent node. We express
>> this relationship through the interconnects node("dma-mem").
>>
>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 52 +++++++++++++++++++++++
>>   arch/riscv/boot/dts/spacemit/k1.dtsi            | 56 +++++++++++++++++++++++++
>>   2 files changed, 108 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 816ef1bc358ec490aff184d5915d680dbd9f00cb..0c0bf572d31e056955eb2ff377c3262271dcc156 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -28,6 +28,25 @@ led1 {
>>   			default-state = "on";
>>   		};
>>   	};
>> +
>> +	usb3_vhub: regulator-vhub-5v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "USB30_VHUB";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>> +
>> +	usb3_vbus: regulator-vbus-5v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "USB30_VBUS";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-always-on;
>> +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>>   };
>>   
>>   &uart0 {
>> @@ -35,3 +54,36 @@ &uart0 {
>>   	pinctrl-0 = <&uart0_2_cfg>;
>>   	status = "okay";
>>   };
>> +
>> +&usbphy2 {
>> +	status = "okay";
>> +};
>> +
>> +&combphy {
>> +	status = "okay";
>> +};
>> +
>> +&usb_dwc3 {
>> +	dr_mode = "host";
>> +	phy_type = "utmi";
>> +	snps,hsphy_interface = "utmi";
>> +	snps,dis_enblslpm_quirk;
>> +	snps,dis-u1u2-quirk;
>> +	snps,dis-u2-freeclk-exists-quirk;
>> +	snps,dis-del-phy-power-chg-quirk;
>> +	snps,dis_u2_susphy_quirk;
>> +	snps,dis_u3_susphy_quirk;
>> +	snps,dis_rxdet_inp3_quirk;
>> +	snps,xhci-trb-ent-quirk;
> I suspect whether it's the correct place to put these quirks: they look
> like IP quirks which are present in every K1 SoC regardless of the
> board model, if my understanding is correct they should go into SoC
> devicetree.

I checked these quirks in differenct board dts in vendor repo, they are 
actually the same.
Will follow.

>
>> +	vbus-supply = <&usb3_vbus>;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	status = "okay";
>> +
>> +	hub@1 {
>> +		compatible = "usb2109,817";
>> +		reg = <0x1>;
>> +		vdd-supply = <&usb3_vhub>;
>> +		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>> +	};
>> +};
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index c0cc4b99c9356d550a470291dba9f2625b10f8df..c7b86c850da969e5412ad42c63995cd20b4d0484 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -4,6 +4,8 @@
>>    */
>>   
>>   #include <dt-bindings/clock/spacemit,k1-syscon.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/phy/phy.h>
>>   
>>   /dts-v1/;
>>   / {
>> @@ -346,6 +348,13 @@ soc {
>>   		dma-noncoherent;
>>   		ranges;
>>   
>> +		dram_range0: dram-range@0 {
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
>> +			#interconnect-cells = <0>;
>> +		};
>> +
>>   		syscon_rcpu: system-controller@c0880000 {
>>   			compatible = "spacemit,k1-syscon-rcpu";
>>   			reg = <0x0 0xc0880000 0x0 0x2048>;
>> @@ -358,6 +367,53 @@ syscon_rcpu2: system-controller@c0888000 {
>>   			#reset-cells = <1>;
>>   		};
>>   
>> +		usb_dwc3: usb@c0a00000 {
>> +			compatible = "spacemit,k1-dwc3", "snps,dwc3";
>> +			reg = <0x0 0xc0a00000 0x0 0x10000>;
>> +			clocks = <&syscon_apmu CLK_USB30>;
>> +			clock-names = "bus_early";
>> +			resets = <&syscon_apmu RESET_USB3_0>;
>> +			interrupt-parent = <&plic>;
>> +			interrupts = <125>;
>> +			interconnects = <&dram_range0>;
>> +			interconnect-names = "dma-mem";
>> +			phys = <&usbphy2>, <&combphy PHY_TYPE_USB3>;
>> +			phy-names = "usb2-phy", "usb3-phy";
>> +			status = "disabled";
>> +		};
>> +
>> +		usbphy0: phy@c0940000 {
>> +			compatible = "spacemit,usb2-phy";
>> +			reg = <0x0 0xc0940000 0x0 0x200>;
>> +			clocks = <&syscon_apmu CLK_USB_AXI>;
>> +			status = "disabled";
>> +		};
>> +
>> +		usbphy1: phy@c09c0000 {
>> +			compatible = "spacemit,usb2-phy";
>> +			reg = <0x0 0xc09c0000 0x0 0x200>;
>> +			clocks = <&syscon_apmu CLK_USB_P1>;
>> +			status = "disabled";
>> +		};
> Why don't add #phy-cells properties to usbphy{0,1} just like usbphy2?
> You've claimed #phy-cells as an essential property of
> spacemit,k1-usb2-phy nodes in the PHY series and I suspect whether this
> passes dtbs_check.

The DT bindings for the USB PHY were submitted in an earlier patchset,
some dts checks about PHY were missed.

I will add #phy-cells in next version. thanks!

>
>> +		usbphy2: phy@0xc0a30000 {
>> +			compatible = "spacemit,k1-usb2-phy";
>> +			reg = <0x0 0xc0a30000 0x0 0x200>;
>> +			clocks = <&syscon_apmu CLK_USB30>;
>> +			#phy-cells = <0>;
>> +			status = "disabled";
>> +		};
>> +
>> +		combphy: phy@c0b10000 {
>> +			compatible = "spacemit,k1-combphy";
>> +			reg = <0x0 0xc0b10000 0x0 0x800>,
>> +			      <0x0 0xd4282910 0x0 0x400>;
>> +			reg-names = "ctrl", "sel";
>> +			resets = <&syscon_apmu RESET_PCIE0>;
>> +			#phy-cells = <1>;
>> +			status = "disabled";
>> +		};
>> +
>>   		syscon_apbc: system-control@d4015000 {
>>   			compatible = "spacemit,k1-syscon-apbc";
>>   			reg = <0x0 0xd4015000 0x0 0x1000>;
>>
>> -- 
>> 2.49.0
>>
>>
> Best regards,
> Yao Zi
>
>
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
