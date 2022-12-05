Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BB4C47089
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wnVCWMJuQp4bswHUWs91SsJ5TaNPLdZSs+lX4Ps22o=; b=4vMnvWltzRCezX
	LP5+tE8hiz6fCoO138plEx4jw7jOyAWtYjP+fmtMi1p4TPLl6e1wIO6ePzK2dnNKLDqDO+L60TbOU
	ROs+hA55+8PnheBtZLrXB7QKBdrbYzvzxnwBEFCViL3NC8VAzWRnp4+VOw5ApyFf1rx4PwHUhUmJ1
	aTl03AD371bq3jcS0PnsHLoHx30yTtuYROdunMqu9nAXB7b7GpYZawAIIwFR6nfQTJjjF5mflcyXZ
	wpVH3y14TLdTGk1KjL2cRQAKx+5oQilWwaQW/mrCTET+AJjFvNjf7i09vBSsT/GQoIEtCAkMGsBjd
	u5L2/i1IdXcGyUhi4ALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26sT-00GGSe-Jt; Mon, 05 Dec 2022 08:31:05 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26sP-00GGRi-TY
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 08:31:03 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5EF9924E254;
	Mon,  5 Dec 2022 16:30:47 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 5 Dec
 2022 16:30:47 +0800
Received: from [192.168.125.128] (113.72.146.33) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 5 Dec
 2022 16:30:46 +0800
Message-ID: <8e75f250-7f1b-ba79-77c8-09ec801e9c05@starfivetech.com>
Date: Mon, 5 Dec 2022 16:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: jh7110: Add watchdog node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
	<linux-watchdog@vger.kernel.org>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
References: <20221202093943.149674-1-xingyu.wu@starfivetech.com>
 <20221202093943.149674-4-xingyu.wu@starfivetech.com>
 <66e66749-cc0f-f147-2648-03b52f95cca5@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <66e66749-cc0f-f147-2648-03b52f95cca5@linaro.org>
X-Originating-IP: [113.72.146.33]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_003102_261146_1346617D 
X-CRM114-Status: GOOD (  10.40  )
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

On 2022/12/2 18:48, Krzysztof Kozlowski wrote:
> On 02/12/2022 10:39, xingu.wu wrote:
>> From: Xingyu Wu <xingyu.wu@starfivetech.com>
>> 
>> This adds the watchdog node for the Starfive JH7110 SoC.
> 
> Do not use "This commit/patch".
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Will drop 'This'.

> 
>> 
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index c22e8f1d2640..22f5a37d691e 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -433,5 +433,19 @@ uart5: serial@12020000 {
>>  			reg-shift = <2>;
>>  			status = "disabled";
>>  		};
>> +
>> +		wdog: watchdog@13070000 {
>> +			compatible = "starfive,jh7110-wdt";
>> +			reg = <0x0 0x13070000 0x0 0x10000>;
>> +			interrupts = <68>;
>> +			clocks = <&syscrg JH7110_SYSCLK_WDT_CORE>,
>> +				 <&syscrg JH7110_SYSCLK_WDT_APB>;
>> +			clock-names = "core_clk", "apb_clk";
>> +			resets = <&syscrg JH7110_SYSRST_WDT_APB>,
>> +				 <&syscrg JH7110_SYSRST_WDT_CORE>;
>> +			reset-names = "rst_apb", "rst_core";
>> +			timeout-sec = <15>;
>> +			status = "okay";
> 
> Why? okay is by default
> 

Will drop it.

Best regards,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
