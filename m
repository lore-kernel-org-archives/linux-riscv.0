Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66358CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 03:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5xOuN7WHlmhjvF7kFZTd06kYfaAf4KSrBAWv0rYVqg=; b=gvYbCNEPJy78cW
	kFGHndcDpNNIGEWXkPLpfs4UIh48dFWVBfL32jO0i7N4xZ+ARwdPmAwX4AnFS3bMZX2ZK7mySxmTk
	DNMwaEn6v8yrTq5kcf6+lPD+s+f4C/2Cwm35UbXsw1E19tN25qG+Iyzb2b6Q+zGK3sRPrFSjUHJlZ
	deoNpjutsD9FKvtfmEzJI3Itw6AhGgkBm7dcV5f1ZjyxXtvM8Nc7x2Ha75iAzhGnJqkvQ5xshUead
	fI8bqedBYguCsztru9eSun8sut4Wh6w7ZkjEAfx/t/8Shl9ZfLnfyEkVs1s2F66MfDkPJazcaGq20
	v1KXDaE6RXb9Z+ZHj6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZqZ-0000000CJLp-4BKM;
	Wed, 20 Aug 2025 03:50:47 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZp2-0000000CJEm-1R0S
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 03:49:13 +0000
Received: from [192.168.2.54] (unknown [98.97.63.12])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C3467B4E0015;
	Wed, 20 Aug 2025 05:49:05 +0200 (CEST)
Message-ID: <4b516172-bd75-432a-9c96-f02fbfb68c16@freeshell.de>
Date: Tue, 19 Aug 2025 20:49:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: jh7110: bootph-pre-ram
 hinting needed by boot loader
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20250815073739.79241-1-e@freeshell.de>
 <20250815073739.79241-4-e@freeshell.de>
 <ZQ2PR01MB1307CE398A5993B9E5B93357E6312@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <ZQ2PR01MB1307CE398A5993B9E5B93357E6312@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_204912_528951_B1F2E206 
X-CRM114-Status: GOOD (  12.33  )
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



On 8/17/25 23:05, Hal Feng wrote:
>> On 15.08.25 15:37, E Shattow wrote:
>> Add bootph-pre-ram hinting to jh7110.dtsi:
>>   - CPU interrupt controller(s)
>>   - core local interrupt timer
>>   - DDR memory controller
>>   - oscillator
>>   - syscrg clock-controller
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 14df3d062a45..884a3526cb0f 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -35,6 +35,7 @@ S7_0: cpu@0 {
>>
>>  			cpu0_intc: interrupt-controller {
>>  				compatible = "riscv,cpu-intc";
>> +				bootph-pre-ram;
>>  				interrupt-controller;
>>  				#interrupt-cells = <1>;
>>  			};
>> @@ -68,6 +69,7 @@ U74_1: cpu@1 {
>>
>>  			cpu1_intc: interrupt-controller {
>>  				compatible = "riscv,cpu-intc";
>> +				bootph-pre-ram;
>>  				interrupt-controller;
>>  				#interrupt-cells = <1>;
>>  			};
>> @@ -101,6 +103,7 @@ U74_2: cpu@2 {
>>
>>  			cpu2_intc: interrupt-controller {
>>  				compatible = "riscv,cpu-intc";
>> +				bootph-pre-ram;
>>  				interrupt-controller;
>>  				#interrupt-cells = <1>;
>>  			};
>> @@ -134,6 +137,7 @@ U74_3: cpu@3 {
>>
>>  			cpu3_intc: interrupt-controller {
>>  				compatible = "riscv,cpu-intc";
>> +				bootph-pre-ram;
>>  				interrupt-controller;
>>  				#interrupt-cells = <1>;
>>  			};
>> @@ -167,6 +171,7 @@ U74_4: cpu@4 {
>>
>>  			cpu4_intc: interrupt-controller {
>>  				compatible = "riscv,cpu-intc";
>> +				bootph-pre-ram;
>>  				interrupt-controller;
>>  				#interrupt-cells = <1>;
>>  			};
>> @@ -321,6 +326,7 @@ mclk_ext: mclk-ext-clock {
>>
>>  	osc: oscillator {
>>  		compatible = "fixed-clock";
>> +		bootph-pre-ram;
>>  		clock-output-names = "osc";
>>  		#clock-cells = <0>;
>>  	};
>> @@ -354,6 +360,7 @@ soc {
>>  		clint: timer@2000000 {
>>  			compatible = "starfive,jh7110-clint", "sifive,clint0";
>>  			reg = <0x0 0x2000000 0x0 0x10000>;
>> +			bootph-pre-ram;
>>  			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc
>> 7>,
>>  					      <&cpu1_intc 3>, <&cpu1_intc 7>,
>>  					      <&cpu2_intc 3>, <&cpu2_intc 7>,
>> @@ -376,6 +383,7 @@ memory-controller@15700000 {
>>  			compatible = "starfive,jh7110-dmc";
>>  			reg = <0x0 0x15700000 0x0 0x10000>,
>>  			      <0x0 0x13000000 0x0 0x10000>;
>> +			bootph-pre-ram;
>>  			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
>>  			clock-names = "pll1_out";
>>  			resets = <&syscrg JH7110_SYSRST_DDR_AXI>, @@ -
>> 892,6 +900,7 @@ qspi: spi@13010000 {
>>  		syscrg: clock-controller@13020000 {
>>  			compatible = "starfive,jh7110-syscrg";
>>  			reg = <0x0 0x13020000 0x0 0x10000>;
>> +			bootph-pre-ram;
>>  			clocks = <&osc>, <&gmac1_rmii_refin>,
>>  				 <&gmac1_rgmii_rxin>,
>>  				 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
> 
> pllclk also needs to add bootph-pre-ram. Because it is the dependency of syscrg.
> 
> 		pllclk: clock-controller {
> 			compatible = "starfive,jh7110-pll";
> +			bootph-pre-ram;
> 			clocks = <&osc>;
> 			#clock-cells = <1>;
> 		};
> 
> Best regards,
> Hal

What users are there for 'pllclk' at U-Boot SPL phase? There does not
seem to be any difference in testing U-Boot and Linux with or without
this hint for 'pllclk'.

Thanks,

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
