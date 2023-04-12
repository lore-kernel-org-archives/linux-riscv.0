Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A721C77B70
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 02:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/YG9NTzQ8gMBGur2XcQZPirrsPJY6B11q4Pux3k0kX8=; b=TWnLZsCHR+f8nx
	57/BTd6wOJ+UFXyxvTUwV/O/PgeOgyeX1JhQEv3WcrvtAXfvtCL7T5lYYauI7s4UvJh9uJkFgzkd2
	sWNWNHTHNfjvod4ZP6q1S9RZvVt2B5qekrcoIYtkKHRWO3MyL3AcjyWMIx3AOlOVxldb+y2OebMXg
	IlYDEql1vhcJDVs8I/ILcH0Isr2Y5u5hkXD6cGIuAUX2oOkPCY75f896JmrcMUnF9mDztAd+6Yd5l
	2yAW7ZDVwt5cNebtxvSxluHlaitlYHivSqx9hkanonKVIIAPRA4UUSYJoVXCR16DHRyKSDgjlZd4h
	y0ihbdJJoohJmiA/h0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQLF-001d6a-09;
	Wed, 12 Apr 2023 02:36:13 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQL8-001d4o-2f
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 02:36:10 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id F112324E201;
	Wed, 12 Apr 2023 10:35:53 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:35:53 +0800
Received: from [192.168.125.89] (113.72.145.176) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:35:53 +0800
Message-ID: <2f5b4e94-0476-83df-0b18-a6b2ba1ea896@starfivetech.com>
Date: Wed, 12 Apr 2023 10:35:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: Add cpu scaling for JH7110
 SoC
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411083257.16155-1-mason.huo@starfivetech.com>
 <20230411083257.16155-4-mason.huo@starfivetech.com>
 <20230411-darling-chump-faaf8dec29ef@wendy>
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <20230411-darling-chump-faaf8dec29ef@wendy>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_193607_015632_B67DCE80 
X-CRM114-Status: GOOD (  15.02  )
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



On 2023/4/11 17:06, Conor Dooley wrote:
> Hey Mason,
> 
> On Tue, Apr 11, 2023 at 04:32:57PM +0800, Mason Huo wrote:
>> Add the operating-points-v2 to support cpu scaling
>> on StarFive JH7110 SoC.
> 
> (btw, there's no need to wrap commit messages at 52 columns, you have
> 72 to work with)
> 
Hi Conor,

Thanks for your review.
Will place it in the same line.

>> It supports up to 4 cpu frequency loads.
>> 
>> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         | 25 +++++++++++++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 25 +++++++++++++++++++
>>  2 files changed, 50 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index df582bddae4b..ae446b268e78 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -228,3 +228,28 @@ &uart0 {
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
>>  };
>> +
>> +&U74_1 {
>> +	clocks =  <&syscrg JH7110_SYSCLK_CPU_CORE>;
>> +	clock-names = "cpu";
>> +	cpu-supply = <&reg_dcdc2>;
>> +};
>> +
>> +&U74_2 {
>> +	clocks =  <&syscrg JH7110_SYSCLK_CPU_CORE>;
>> +	clock-names = "cpu";
>> +	cpu-supply = <&reg_dcdc2>;
>> +};
>> +
>> +&U74_3 {
>> +	clocks =  <&syscrg JH7110_SYSCLK_CPU_CORE>;
>> +	clock-names = "cpu";
>> +	cpu-supply = <&reg_dcdc2>;
>> +};
>> +
>> +&U74_4 {
>> +	clocks =  <&syscrg JH7110_SYSCLK_CPU_CORE>;
>                 ^^
> There's a double space in each of these.
> 
>> +	clock-names = "cpu";
>> +	cpu-supply = <&reg_dcdc2>;
>> +};
> 
> How come these two clock properties are being added in <board>.dtsi?
> Should they not be in <soc>.dtsi?
>> Thanks,
> Conor.
Yes, will move them to <soc>.dtsi

Thanks
Mason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
