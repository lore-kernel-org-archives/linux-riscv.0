Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E17CC77B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bj31Vfe6UqomC2p3LoU0/oCANjGDSxUIvXGIQ+jUc78=; b=JlzBO18e6/K5r7
	HaBZutvKc4GJXwwc7ho3iaBwgJBwjtP06Xx+vACMACuImtwVWT2i4pgHW+VAKBS8+CydtRRotbzgi
	NpLfMH7fbzTXwjvWhcLyGQaw+SCuS1EJ41u9slvojBxEYp7y/fSEFFQ1HdPXUFO8yusgb/fupVjup
	GKAAVH6zaR40MZ5r13P0/5npSlDXIyjqjym0LTTsHSX3xyonkxacjR9GzFkn6RV/d6Mv3h4cz8tTw
	rISRqmWntgw9cY0NOWGpKOn8R8Gn/cDoozRlIYIWfVdXviPvHoN5z5Pq5eD01hqx1Ur3TNnEFac0J
	Hes50tJvva4WVmF/9y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmUye-0026T3-1H;
	Wed, 12 Apr 2023 07:33:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmUyZ-0026OA-2s
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 07:33:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0157A24E1BE;
	Wed, 12 Apr 2023 15:31:43 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 15:31:43 +0800
Received: from [192.168.125.82] (113.72.145.176) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 15:31:42 +0800
Message-ID: <1d085fe3-39f8-232a-e628-1eb138b899b7@starfivetech.com>
Date: Wed, 12 Apr 2023 15:31:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 6/7] soc: starfive: Add dphy pmu support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-7-changhuang.liang@starfivetech.com>
 <20230411-iron-everybody-70b78e94aee5@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230411-iron-everybody-70b78e94aee5@spud>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_003308_259559_244AA582 
X-CRM114-Status: GOOD (  16.18  )
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



On 2023/4/12 5:15, Conor Dooley wrote:
> On Mon, Apr 10, 2023 at 11:47:42PM -0700, Changhuang Liang wrote:
[...]
>> +++ b/MAINTAINERS
>> @@ -19944,6 +19944,7 @@ F:	include/dt-bindings/reset/starfive?jh71*.h
>>  
>>  STARFIVE JH71XX PMU CONTROLLER DRIVER
>>  M:	Walker Chen <walker.chen@starfivetech.com>
>> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> 
> Unmentioned in the commit message, plus I would like an R-b or an Ack
> from Walker.
> 

OK, I will make a discuss with Walker.

>>  S:	Supported
>>  F:	Documentation/devicetree/bindings/power/starfive*
>>  F:	drivers/soc/starfive/jh71xx_pmu.c
>> diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh71xx_pmu.c
>> index 990db6735c48..d4092ca4dccf 100644
[...]
>> @@ -94,6 +97,8 @@ static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool *is_o
>>  
>>  	if (pmu->match_data->pmu_type == JH71XX_PMU_GENERAL)
>>  		offset = JH71XX_PMU_CURR_POWER_MODE;
>> +	else if (pmu->match_data->pmu_type == JH71XX_PMU_DPHY)
> 
> There are only two options for this "enum", so why `else if`?
> 

OK, will change to else.

>> +		offset = JH71XX_PMU_DPHY_SWITCH;
>>  
>>  	regmap_read(pmu->base, offset, &val);
>>  
>> @@ -170,6 +175,23 @@ static int jh71xx_pmu_general_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bo
>>  	return 0;
>>  }
>>  
[...]
>>  static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
>>  {
>>  	struct jh71xx_pmu *pmu = pmd->pmu;
>> @@ -191,6 +213,8 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
>>  
>>  	if (pmu->match_data->pmu_type == JH71XX_PMU_GENERAL)
>>  		ret = jh71xx_pmu_general_set_state(pmd, mask, on);
>> +	else if (pmu->match_data->pmu_type == JH71XX_PMU_DPHY)
>> +		ret = jh71xx_pmu_dphy_set_state(pmd, mask, on);
> 
> Perhaps I am verging on over-complication, but I dislike this carry on.
> Is this the only time we'll see a power domain provider coming out of
> a syscon, or are there likely to be more?
> Either way, I think having an ops struct w/ both parse_dt() and the
> set_state() implementations would be neater than what you have here.
> 
> Very much open to dissenting opinions there though. Emil? Walker?
> 
> Cheers,
> Conor.
> 

"else if" will change to "else"
As far as I know, there are only two types power domain on the JH7110 SoC.
One is the original, another one is coming out of a syscon.

>>  
>>  	return ret;
>>  }
[...]
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
