Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0314CC77B73
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 07:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXIPqfX7kx4bwSkDXWXXoruw+NMJLqpml775oZXWZns=; b=4nTPCgKhnkr0Ux
	vRxdIFD16w5rdzFUdYGvT83y6aj4quo3T8/OVrb0CopzUNJRD01gXPdU0lQ59iMQ0EI+p3JYKpqWH
	0UgKIAxPWpUdtVx/CEQRoMPidEoAzwAASPq0HcTHvNXJsfOyTHIyfv33IwiIs122i2D+CRH4naw4b
	JuBDnVHf6ndkCy8tWsNvmRh1KI84aeea9KrEgmy6EX5oTIJDpZIlv7gTRqTcreRaDQmtxqnhNFTv4
	+QitORKBfLfa0GZQALwy+ExL166pMF/JmRuqrZVsAqbFiqAfgpGwV3eM8EYEeIxXG6SLquAV/OhEd
	hWD/hsutKaSfYzmOWIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvBuN-00CjLh-2J;
	Sat, 06 May 2023 07:00:43 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvBuJ-00CjKS-26;
	Sat, 06 May 2023 07:00:42 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C110424E21E;
	Sat,  6 May 2023 15:00:11 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 6 May
 2023 15:00:11 +0800
Received: from [192.168.125.107] (183.27.98.219) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 6 May
 2023 15:00:10 +0800
Message-ID: <c4b72d59-8b50-df57-1cc5-586f5c13b60c@starfivetech.com>
Date: Sat, 6 May 2023 15:00:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
References: <3ed72340-accc-4ad1-098f-4a2eb6448828@linaro.org>
 <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
 <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
 <ea5b5534-8fc2-7c84-a011-c1b42c6ed7a0@starfivetech.com>
 <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
 <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
 <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
 <20230505-magician-poet-724c96020c2f@wendy>
 <ba6a1a47-d3b1-ee16-4785-f5c61d593127@starfivetech.com>
 <9e7b265d-bfe5-f583-2357-d8e342bcf982@linaro.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <9e7b265d-bfe5-f583-2357-d8e342bcf982@linaro.org>
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_000039_872532_7602529E 
X-CRM114-Status: GOOD (  11.05  )
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



On 2023/5/6 14:31, Krzysztof Kozlowski wrote:
> On 06/05/2023 03:45, Changhuang Liang wrote:
>>
>> Hi, Krzysztof and Conor
>>
>> Due to the current aon pmu needs to be adjusted, it affects the syscon in PLL series.
>> So It's inevitable to change syscon in PLL series.
>>
>> My current idea is PLL series don't add the aon_syscon node. I will add it in my
>> aon pmu series in next version like this:
>>
>> aon_syscon: syscon@17010000 {
>> 	compatible = "starfive,jh7110-aon-pmu", "syscon";
>> 	reg = <0x0 0x17010000 0x0 0x1000>;
>> 	#power-domain-cells = <1>;
>> };
>>
>> In my opinion, the first we add "starfive,jh7110-aon-syscon" because "syscon" can 
>> not appear alone in the compatible. If we have "starfive,jh7110-aon-pmu", this
>> "starfive,jh7110-aon-syscon" is not a must-be need.
>>
>> Do you agree with doing so.
> 
> Sorry guys, I don't know what you talk about. I have no clue what are
> PLL and aon series. More over I don't understand what is complicated
> here... all SoCs follow the same rules and similar way of development.
> 

In other words, if I use the above approach, 
[1] https://lore.kernel.org/all/20230414024157.53203-6-xingyu.wu@starfivetech.com/
[2] https://lore.kernel.org/all/20230414024157.53203-7-xingyu.wu@starfivetech.com/
Links [1][2] need to be dropped "aon_syscon" node.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
