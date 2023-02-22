Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6677BC6379F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 01:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbmVjvq72966GkG9gtfW0UoHc0uLgOSlfEIbjosVJyc=; b=4y1BaHYrKQaD4S
	jDjLH+Ojk94Jh55w+DhUgp9M6wgv7kFSWPus9Wp0KJZDF1irm20PxDyZk4uz9aggjo5q2fikTC6cx
	KrtKKbMB8w4oZNxLH+hNatgopkLLkMyn1G/FCCDdbSMRFUvJav6OU/+y/EHZ9HBiA7T6k7PHGRiKI
	Kak6nmIby7jhuVKoACfqBet8kisS/0jpjqnsxacLbkDX9zh8IUVJiuHzOyALPrSHEFNa1PA6Gk3OX
	0hh8bQatWM7m5lGie4Axfryny7hIi9cBstiZ/Jk/YAJqL2zgY3W/ItEsKnfOmkIDjCEX/nessTr68
	bz1UeCMOQy1dq4VUNwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUeFA-00AMxJ-Sg; Wed, 22 Feb 2023 01:48:28 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUeF7-00AMuo-Ef
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 01:48:28 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E426F24E1D1;
	Wed, 22 Feb 2023 09:47:51 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Feb
 2023 09:47:51 +0800
Received: from [192.168.125.128] (113.72.147.165) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Feb
 2023 09:47:50 +0800
Message-ID: <7b3e09f0-a44f-0735-a049-eef7f0acec4c@starfivetech.com>
Date: Wed, 22 Feb 2023 09:48:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: Add StarFive JH7110
 System-Top-Group clock and reset generator
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com>
 <20230221083323.302471-2-xingyu.wu@starfivetech.com>
 <430318ed-5b30-e549-a5ce-df83aa18adf9@linaro.org>
 <43d00fd9-ab24-442e-3f82-208edaf399d0@starfivetech.com>
 <ae468e63-d8d3-dbfb-64da-75a147e1cd2d@linaro.org>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <ae468e63-d8d3-dbfb-64da-75a147e1cd2d@linaro.org>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_174825_788007_A2E707A3 
X-CRM114-Status: GOOD (  11.71  )
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

On 2023/2/21 21:37, Krzysztof Kozlowski wrote:
> On 21/02/2023 14:01, Xingyu Wu wrote:
>> On 2023/2/21 19:25, Krzysztof Kozlowski wrote:
>>> On 21/02/2023 09:33, Xingyu Wu wrote:
>>>> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
>>>> on the JH7110 RISC-V SoC by StarFive Ltd.
>>>>
>>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>>
>>>
>>>> +    };
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 93eb504c3b21..2e70c9f21989 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -19914,6 +19914,7 @@ F:	arch/riscv/boot/dts/starfive/
>>>>  STARFIVE JH71X0 CLOCK DRIVERS
>>>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>>>  M:	Hal Feng <hal.feng@starfivetech.com>
>>>> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
>>>
>>> No improvements here. You add here new bindings for one device and then
>>> - without explanation - add yourself to all Starfive clock bindings.
>>> Either explain it or drop it or move it to separate patch.
>>>
>>> You already got comment for this.
>>>
>> 
>> Sorry, I didn't understand what you meant before. Now my understanding is that, 
>> If I improvements JH71X0 driver no JH7110 driver, I could add this here. Right?
>> 
>> Is it OK if I do it this way to move it to separate patch like this?:
>> +STARFIVE JH7110 STG CLOCK DRIVERS
>> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
> 
> If you want to be the maintainer of all drivers, add separate commit for
> this, so this is obvious. Or at least explain this change in commit msg.
> 

OK, got it. Thanks.

Best regard,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
