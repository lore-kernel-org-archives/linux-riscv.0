Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C55C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnH3JqnBWkwvbGejXbzxDmW1E5kx9IPNs/nQdCjwBRs=; b=NHNb9EjNYh3aPJ
	p+xxcMTwoIXCIIFKihsMVM8YQEN8VdAqmxinrZFz2Q2T0Z1lFRpW4NLJTZo9yfcvZcmXTO9Dc6k7R
	/pwF8pWtsYr0lItCeUq1VYCM261nrheH+HP3d5eiUw6EJIzv/0LY+jVOS7qc+P8BRPq8YUo4Ztapm
	GJ/Z9l3GVQ7yZsAhO958KFCtEdx4+FGkP/m8iqbSG7zuRPtjYCvp92kp63vh9X2hzdF24CoaX2zZx
	xhHn3Rr33ga+8tljtQ7+YopKBcUWeO8rtE1++8a0lKS2aekQFZWHvC1ltEvix2Y7t8oPiSvXTugXf
	JSo/CWFkO++bFfxWt//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppOHe-007Elf-1u;
	Thu, 20 Apr 2023 07:00:46 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppOHa-007EkM-0J;
	Thu, 20 Apr 2023 07:00:44 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0A42F24E0F6;
	Thu, 20 Apr 2023 15:00:13 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 15:00:13 +0800
Received: from [192.168.125.106] (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Apr
 2023 15:00:12 +0800
Message-ID: <1a5b15fa-4f20-51c2-2ba1-a04a2911a694@starfivetech.com>
Date: Thu, 20 Apr 2023 15:00:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-2-changhuang.liang@starfivetech.com>
 <20230419-labored-camper-644d51a7ca96@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230419-labored-camper-644d51a7ca96@spud>
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_000042_411015_061B0CF4 
X-CRM114-Status: GOOD (  26.55  )
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



On 2023/4/20 2:29, Conor Dooley wrote:
> Hey Changhuang, DT/PHY folks,
> 
> On Tue, Apr 18, 2023 at 08:56:41PM -0700, Changhuang Liang wrote:
>> Add AON PMU for StarFive JH7110 SoC, it can be used to turn on/off DPHY
>> rx/tx power switch, and it don't need the properties of reg and
>> interrupts.
> 
> Putting this here since the DT guys are more likely to see it this way..
> Given how the implementation of the code driving this new
> power-controller and the code driving the existing one are rather
> different (you've basically re-written the entire driver in this series),
> should the dphy driver implement its own power-controller?
> 
> I know originally Changuang had tried something along those lines:
> https://lore.kernel.org/linux-riscv/5dc4ddc2-9d15-ebb2-38bc-8a544ca67e0d@starfivetech.com/
> 
> I see that that was shut down pretty much, partly due to the
> non-standard property, hence this series adding the dphy power domain to
> the existing driver.
> 
> If it was done by looking up the pmu with a
> of_find_compatible_node(NULL, "power-controller", "starfive,jh7110-aon-pmu")
> type thing, would that make sense? Although, maybe that is not a
> question for you, and this series may actually have been better entirely
> bundled with the dphy series so the whole thing can be reviewed as a
> unit. I've added 
> 
> IOW, don't change this patch, or the dts patch, but move all of the
> code back into the phy driver..
> 

Maybe this way can not do that? power domain is binding before driver probe,
if I use "of_find_compatible_node" it phy(DPHY rx) probe. Maybe I can only operate 
this power switch in my phy(DPHY rx) driver, so the all patch of this series isn't 
make sense.

In my opinion, We will also submit DPHY TX module later which use this series.
Maybe this series should independent?

> Sorry for not asking this sooner Changhuang,
> Conor.
> 
> (hopefully this didn't get sent twice, mutt complained of a bad email
> addr during sending the first time)
> 

I'm sorry for that, I will notice later.

>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> ---
>>  .../bindings/power/starfive,jh7110-pmu.yaml       | 15 +++++++++++++--
>>  include/dt-bindings/power/starfive,jh7110-pmu.h   |  3 +++
>>  2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
>> index 98eb8b4110e7..c50507c38e14 100644
>> --- a/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
>> +++ b/Documentation/devicetree/bindings/power/starfive,jh7110-pmu.yaml
>> @@ -8,6 +8,7 @@ title: StarFive JH7110 Power Management Unit
>>  
>>  maintainers:
>>    - Walker Chen <walker.chen@starfivetech.com>
>> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
>>  
>>  description: |
>>    StarFive JH7110 SoC includes support for multiple power domains which can be
>> @@ -17,6 +18,7 @@ properties:
>>    compatible:
>>      enum:
>>        - starfive,jh7110-pmu
>> +      - starfive,jh7110-aon-pmu
>>  
>>    reg:
>>      maxItems: 1
>> @@ -29,10 +31,19 @@ properties:
>>  
>>  required:
>>    - compatible
>> -  - reg
>> -  - interrupts
>>    - "#power-domain-cells"
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: starfive,jh7110-pmu
>> +    then:
>> +      required:
>> +        - reg
>> +        - interrupts
>> +
>>  additionalProperties: false
>>  
>>  examples:
>> diff --git a/include/dt-bindings/power/starfive,jh7110-pmu.h b/include/dt-bindings/power/starfive,jh7110-pmu.h
>> index 132bfe401fc8..0bfd6700c144 100644
>> --- a/include/dt-bindings/power/starfive,jh7110-pmu.h
>> +++ b/include/dt-bindings/power/starfive,jh7110-pmu.h
>> @@ -14,4 +14,7 @@
>>  #define JH7110_PD_ISP		5
>>  #define JH7110_PD_VENC		6
>>  
>> +#define JH7110_PD_DPHY_TX	0
>> +#define JH7110_PD_DPHY_RX	1
>> +
>>  #endif
>> -- 
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
