Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30511C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 07:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9uADnFE7nZLIaSdM7C6IHonlYDKf8D+NiO62vP9iVc=; b=XDq9c+nOMXhIc/
	wrnHHx0C3FwQjGKtHlFIviKRdB3lBfegaqrNidXqO4iUlpE6LvaBDY2Z8jVOVFC+RFqLrBWuynpea
	gMQx+EnXin0poy/wl63TOpAVE95wrFZesc/BIOMUrcwlwmLCA2v8DZKu8p9hlwxM1p7j1VIlIUD3U
	mVJV02P/brGWdj1KSQQVwkO4D9JB6S22pvl/WE4BQ5dfMAH+sdUYBvddeOkuPHSo+bqpjeNgyCKke
	lZ0dKJJl/7mz0/Hgg4dUnqPkGkDb6WzeJDYrD4KLLAbPBK53uuJqdBUhLJdAwsAgSzZx/6ZP0ih5H
	provEZcUZQhdtimGTL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppOS7-007FaE-1U;
	Thu, 20 Apr 2023 07:11:35 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppOS3-007FYg-2j
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 07:11:34 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 09E7A24E270;
	Thu, 20 Apr 2023 15:10:47 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 15:10:46 +0800
Received: from [192.168.125.89] (113.72.144.253) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 15:10:45 +0800
Message-ID: <6ce407ab-0d2a-323f-61df-44b2ed8eb0ca@starfivetech.com>
Date: Thu, 20 Apr 2023 15:10:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/3] riscv: dts: starfive: Add cpu scaling for JH7110
 SoC
To: Conor Dooley <conor@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230417063942.3141-1-mason.huo@starfivetech.com>
 <20230417063942.3141-4-mason.huo@starfivetech.com>
 <20230418-talcum-unthread-618a5bd2758a@spud>
Content-Language: en-US
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <20230418-talcum-unthread-618a5bd2758a@spud>
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_001132_217495_0B25BFB7 
X-CRM114-Status: GOOD (  11.89  )
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



On 2023/4/19 1:28, Conor Dooley wrote:
> Hey Mason,
> 
> Just one minor comment in passing..
> 
> On Mon, Apr 17, 2023 at 02:39:42PM +0800, Mason Huo wrote:
>> Add the operating-points-v2 to support cpu scaling on StarFive JH7110 SoC.
>> It supports up to 4 cpu frequency loads.
>> 
>> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
>> ---
>>  .../jh7110-starfive-visionfive-2.dtsi         | 17 ++++++++++
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 33 +++++++++++++++++++
>>  2 files changed, 50 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> index cca1c8040801..b25e6d68ce53 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
>> @@ -227,3 +227,20 @@ &uart0 {
>>  	pinctrl-0 = <&uart0_pins>;
>>  	status = "okay";
>>  };
>> +
>> +&U74_1 {
>> +	cpu-supply = <&vdd_cpu>;
>> +};
>> +
>> +&U74_2 {
>> +	cpu-supply = <&vdd_cpu>;
>> +};
>> +
>> +&U74_3 {
>> +	cpu-supply = <&vdd_cpu>;
>> +};
>> +
>> +&U74_4 {
>> +	cpu-supply = <&vdd_cpu>;
>> +};
>> +
> 
> Applying: riscv: dts: starfive: Add cpu scaling for JH7110 SoC
> /stuff/linux/.git/rebase-apply/patch:30: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.
> 
> Cheers,
> Conor.
> 
Hi Conor,

Will fix it soon.

Thanks
Mason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
