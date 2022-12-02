Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C85AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DI1fBzjjY0mPX6HEcyPvGsFmmjEm3AIoyM7KNaA6KsQ=; b=BeV9NIn1TjXnoe
	ek/kpndunMoorMioScxMrdyPNOMugt1Of/Q5ip4CuQbrWNa7VDgx06csYCAYPnkThi6TUJI1q1Fq0
	T94cGz/z4RAttq3DLZNxJM7pjy42JZXYLDkq6EDryLLWsXbbxEOJ1r7ftO48Kpw4ndutUl3sRSwnl
	c3z0St5KHkow49sY9kyto5dK9srUX4RjM1JAcqNUE7kVOsury9pNg/tyQke1d9k/QYDkoEIxmuK+k
	GPmKonHB30U7pYdzRdGOADekAmY8sB8LOPyKCucWXaanWUCDQ8AP6XNviYoYsop7H1QKs9fFnAwFa
	55WGM/FgnO6A4hA8UW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p10I6-00E6DL-Ad; Fri, 02 Dec 2022 07:16:58 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p10I3-00E68K-E3
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 07:16:56 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1C61624E15C;
	Fri,  2 Dec 2022 15:16:32 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Dec
 2022 15:16:32 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Dec
 2022 15:16:30 +0800
Message-ID: <1d3f1334-b6bf-57cb-7f7e-48e3c08a5560@starfivetech.com>
Date: Fri, 2 Dec 2022 15:16:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-4-yanhong.wang@starfivetech.com>
 <36565cc1-3c48-0fa8-f98b-414a7ac8f5bf@linaro.org> <Y4jl6awCMFgZsQGC@spud>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <Y4jl6awCMFgZsQGC@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_231655_768246_84053815 
X-CRM114-Status: GOOD (  13.83  )
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



On 2022/12/2 1:35, Conor Dooley wrote:
> On Thu, Dec 01, 2022 at 05:21:04PM +0100, Krzysztof Kozlowski wrote:
>> On 01/12/2022 10:02, Yanhong Wang wrote:
>> > Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.
>> 
>> Subject: drop second, redundant "bindings".
>> 
>> > 
>> > Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>> > ---
>> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>> > +properties:
>> > +  compatible:
>> > +    oneOf:
>> 
>> Drop oneOf. You do not have more cases here.
>> 
>> > +      - items:
>> > +          - enum:
>> > +               - starfive,dwmac
>> 
>> Wrong indentation.... kind of expected since you did not test the bindings.
>> 
>> > +          - const: snps,dwmac-5.20
> 
> Disclaimer: no familiarity with the version info with DW stuff
> 
> Is it a bit foolish to call this binding "starfive,dwmac"? Could there
> not be another StarFive SoC in the future that uses another DW mac IP
> version & this would be better off as "starfive,jh7110-dwmac" or similar?
> 

The StarFive JH8100 SoC in the future that uses the same mac IP version, so call this binding "starfive,dwmac".

> Thanks,
> Conor.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
