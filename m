Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1853CEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LscrQWO5yCm/PBkAekTjJWnXG4eJqWKwYrsWsUQKeEs=; b=WJiG1ax5H08XCL
	gVyeKtZlL2p/amH+3LFBsyR7swthebpYujxvORMwRQ7dRUmMwkzjIxRVz+93+4OjIRu+o70Uyk43T
	O500P1uiwAI2MyQfAggXwbkv532ByTEaOztnyqXP2foqmt9eqbPi+1hYrogH1b0Hv+bb2IESZhPH7
	aZWsFvPLtET65N8nYXNPL2exQ1wXVTXkghaamrNiOJKMTJrD9V/L6zP9JmxVqNsuRhJb+lPK+Ga6Z
	hGKveLLTHaefhCSw2UQiYpft1Y6Dou4fPpbt29gIJAYG+gUxiHTVgIhGzwZlqWMMn393vITOUyJfY
	zn5tRTsq/QmKf2Jdjzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Zo-006MdF-2K;
	Wed, 19 Jul 2023 08:30:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Zm-006MbO-00
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=MGfyKlxwa/IgNGjXxR0ConBvE6/7Yq6sVk+gfmAXb9Y=; b=qQa5hpj3G7t0jD6OGQ7ycyTsSM
	6BFHYhKA/IJ8G/vZJO9rh2KPLtedw6TVxdP3XkPLzRe5wjCW5bi8dQ79mSfNyyEnDBrv8KPgKpni6
	mpf5NO1PCUPE/aCc2vIBLUZ2feYl/x/51FhDT+N2Dw+xMGGLlX3iIqXt439Tp+hsRJbIELnrqHOr8
	NGVP9SsFjW4FDexpxHBaOwoRAO1HGEUej+DUqgzuFZ2jKf0mATKGEJEXYzQAD2IRfsw0K4vWTAGDt
	9/kFKDtzP0kMi/10QW5MI9uUOsHOPyHntbSDtKsIxSzq5tY/Bx2M8HJfVwgK4AuuQH1+SwI7bEBB8
	6C3GqLDw==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLdyN-00BD94-1E
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 06:14:16 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E33CF24E22F;
	Tue, 18 Jul 2023 14:12:41 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 14:12:41 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 14:12:41 +0800
Message-ID: <018b8bd3-ede0-d6ad-d50e-b4c959ac1660@starfivetech.com>
Date: Tue, 18 Jul 2023 14:12:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/3] riscv: dts: starfive: Add QSPI controller node for
 StarFive JH7110 SoC
Content-Language: en-US
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Ziv Xu <ziv.xu@starfivetech.com>
References: <20230704090453.83980-1-william.qiu@starfivetech.com>
 <20230704090453.83980-4-william.qiu@starfivetech.com>
 <ZLV2vqycWIA5TanD@aurel32.net>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <ZLV2vqycWIA5TanD@aurel32.net>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_071413_707173_763A6633 
X-CRM114-Status: GOOD (  13.08  )
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



On 2023/7/18 1:13, Aurelien Jarno wrote:
> Hi,
> 
> On 2023-07-04 17:04, William Qiu wrote:
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
>> index 2a6d81609284..983b683e2f27 100644
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
>> +		reg = <0>;
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
> 
> It appears that this uses the old layout for the SPI flash. The new
> layout is described there:
> 
> https://doc-en.rvspace.org/VisionFive2/Boot_UG/JH7110_SDK/boot_address_allocation.html
> 
> Regards
> Aurelien
> 
I'll take a look, and use it then.
Thanks for your comments.

Best regards,
William

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
