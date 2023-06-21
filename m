Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514B8EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 06:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGKi78eesrBkGK08bzfKSpQf2Why5HLLT/JyxWCQ6vk=; b=fvpsIcXzyfYIM7
	1MqtIhPvhhG0dyQhKY7tSWg3V2cX99U/HuHELULxo0TKfdtEnVVBJ6z6OOgzySAVg6MMyd714LpEm
	WXLuvCvYehJg420153eNo72Qa0K+mAT/5U8AEQ2tbuLBRutmK+G9/OD/vFMSyvKRdKcq4rbiNP3mu
	wsZdNGgNJ8g8oR1XbeFkTSNE7bdtyIQbY3/uaynCS3lWiX1FLfiVOmk8s58ag9exYmFN4evU3ufeI
	Xxev/1BXTuQQO9bmfoLagLjDO+4qnkGqvVNTFMpJIiosjByIi9EjCgYAP6LmcAH66KCWDBPPAs5VO
	T5x9GAh2/Ri1Q7dQsKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBqyS-00DMcf-0s;
	Wed, 21 Jun 2023 06:05:48 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBqyO-00DMaM-07
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 06:05:47 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8781024E276;
	Wed, 21 Jun 2023 14:04:59 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 21 Jun
 2023 14:04:59 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 21 Jun
 2023 14:04:58 +0800
Message-ID: <4bed9d52-6729-6e0d-5267-17d8f6eb892a@starfivetech.com>
Date: Wed, 21 Jun 2023 14:04:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add QSPI controller node for
 StarFive JH7110 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>
References: <20230619083517.415597-1-william.qiu@starfivetech.com>
 <20230619083517.415597-4-william.qiu@starfivetech.com>
 <7b7694da-8b40-d76a-adca-4cf9aa206ff4@linaro.org>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <7b7694da-8b40-d76a-adca-4cf9aa206ff4@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_230544_409402_C8428F72 
X-CRM114-Status: GOOD (  12.48  )
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



On 2023/6/19 20:20, Krzysztof Kozlowski wrote:
> On 19/06/2023 10:35, William Qiu wrote:
>> Add the quad spi controller node for the StarFive JH7110 SoC.
>> 
>> Co-developed-by: Ziv Xu <ziv.xu@starfivetech.com>
>> Signed-off-by: Ziv Xu <ziv.xu@starfivetech.com>
>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         | 32 +++++++++++++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 18 +++++++++++
>>  2 files changed, 50 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index 2a6d81609284..22212c1150f9 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -126,6 +126,38 @@ &i2c6 {
>>  	status = "okay";
>>  };
>>  
>> +&qspi {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	nor_flash: flash@0 {
>> +		compatible = "jedec,spi-nor";
>> +		reg=<0>;
> 
> Missing spaces.
> 
Will fix.
>> +		cdns,read-delay = <5>;
>> +		spi-max-frequency = <12000000>;
>> +		cdns,tshsl-ns = <1>;
>> +		cdns,tsd2d-ns = <1>;
>> +		cdns,tchsh-ns = <1>;
>> +		cdns,tslch-ns = <1>;
>> +
>> +		partitions {
>> +			compatible = "fixed-partitions";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			spl@0 {
>> +				reg = <0x0 0x20000>;
>> +			};
>> +			uboot@100000 {
>> +				reg = <0x100000 0x300000>;
>> +			};
>> +			data@f00000 {
>> +				reg = <0xf00000 0x100000>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>>  &sysgpio {
>>  	i2c0_pins: i2c0-0 {
>>  		i2c-pins {
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 4c5fdb905da8..0b24f9e66e67 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -440,6 +440,24 @@ i2c6: i2c@12060000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		qspi: spi@13010000 {
>> +			compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
>> +			reg = <0x0 0x13010000 0x0 0x10000
>> +				0x0 0x21000000 0x0 0x400000>;
> 
> This should be two items so <>, <>. Not one item.
> 
> Best regards,
> Krzysztof
> 
Will fix.
Thanks for taking time to review this patch series.

Best reagards
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
