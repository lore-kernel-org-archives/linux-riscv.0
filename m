Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF403C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 02:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5T3VHN9Dt+y6M/N8Ky3QmnJfvZNf4EbsuHwR1eiuCjk=; b=l9T8co8mJp+NFX
	sLwihcZEsJMR5GWS6ZJBSbkhqjGGWuIQDHyi1ewa2O1SY22clWhW5vcXoEex61Hmlr/zuiACfxzpE
	/bGAFYpLOmJYBqRVoLUliueGGMTpj93WadkSbs8G+pi604eHlxZQWbza93cT0Ya0UEeEWTngqDL/T
	YSjRQnhwUWxsKULH51BPcyXEEYr/ZDPpi5/NGPAbGpIC8GqcU+S5Mu6RAFjtP9gGNNrM6ZbC17rqW
	w/GP9bf4iIT/GduN1rawZU0ZplFxevUv39Zk4f0Rgex6LvUIhU+sKPmVDUhLoWoI4g9avDiWxEwCx
	tO/eR/iBcL7fhDZSgJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxfFN-00CvY0-D1; Wed, 23 Nov 2022 02:12:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxfFJ-00CvOt-KA
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 02:12:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CC8AD24E236;
	Wed, 23 Nov 2022 10:11:45 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Nov
 2022 10:11:44 +0800
Received: from [192.168.125.96] (113.72.144.23) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Nov
 2022 10:11:43 +0800
Message-ID: <f794e9fb-7ce0-2649-9839-b9ce36b80d1d@starfivetech.com>
Date: Wed, 23 Nov 2022 10:11:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 4/4] riscv: dts: starfive: add power controller node
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-5-walker.chen@starfivetech.com>
 <CAJM55Z9bJqpEGbbx1=EBXhmhigxuHw=ObBdTJ7xy+QY=pTJyoQ@mail.gmail.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <CAJM55Z9bJqpEGbbx1=EBXhmhigxuHw=ObBdTJ7xy+QY=pTJyoQ@mail.gmail.com>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_181217_963226_AC0326A0 
X-CRM114-Status: GOOD (  13.65  )
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

On 2022/11/19 2:36, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 14:35, Walker Chen <walker.chen@starfivetech.com> wrote:
>>
>> This adds the power controller node for the Starfive JH7110 SoC.
>> The pmu needs to be used by other modules such as ISP, VPU, etc.
>>
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> 
> Hi Walker,
> 
> You called the driver jh71xx which suggests it also applies to the
> jh7100. Are you missing a node in the jh7100 device tree?

No, there is no power domain controller on the jh7100. Our next generation of chips jh7120 will 
still use this power management unit, so here this driver name is called jh71xx_pmu.c or changed
to jh71xx_power.c , do you think such a name is appropriate ?  
Your reply will be highly appreciated!

> 
>> ---
>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index c22e8f1d2640..fa7b60b82d71 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -356,6 +356,13 @@
>>                         #gpio-cells = <2>;
>>                 };
>>
>> +               pwrc: power-controller@17030000 {
>> +                       compatible = "starfive,jh7110-pmu";
>> +                       reg = <0x0 0x17030000 0x0 0x10000>;
>> +                       interrupts = <111>;
>> +                       #power-domain-cells = <1>;
>> +               };
>> +
>>                 uart0: serial@10000000 {
>>                         compatible = "snps,dw-apb-uart";
>>                         reg = <0x0 0x10000000 0x0 0x10000>;
>> --
>> 2.17.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
