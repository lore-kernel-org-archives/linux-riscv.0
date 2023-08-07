Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C46EC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5F/kUB/8rP1KZt8dMwOBe22QdJjXI8urXpS1zCpANho=; b=IOS5dZ2//e+5Gj
	VqjhefXxB7ENci+koaUAO1EaPGdL5b288reP4v1or6JRtab6E5034BWZb1V1Dftova5ZxwLM9U2Wu
	+nG38qKZTrqhu4gxTonpxhqF+ordzgk6qpfuHXyt1N3PTtu+Ic9P2y7aom+ZMjaJG3vFHFWlu8Rsj
	xaQzKX6Ed2zfNGoZfJfM0tt1sPzG8JZ4ZQJqDYSe1mnNLQFG6/x5T3J3qA0Eeh4pNZjWHFOsMzpiE
	iPNDetERYqiosda7NCbdOe4nhuvG5o96HmWHPj/caN8fC9mI7SNFWrL929cuvL6pVUR8Zyq+sJOQj
	X7lDMGLJFyeFP4wsViwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwgw-00Ga5S-0K;
	Mon, 07 Aug 2023 09:38:22 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSwgs-00Ga3m-1o
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 09:38:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7F62F7FD3;
	Mon,  7 Aug 2023 17:37:40 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 17:37:40 +0800
Received: from [192.168.125.128] (113.72.146.246) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 17:37:39 +0800
Message-ID: <80d6ac43-2b78-97e4-9905-38bf8440ffb9@starfivetech.com>
Date: Mon, 7 Aug 2023 17:33:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-riscv@lists.infradead.org>
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-3-xingyu.wu@starfivetech.com>
 <37a636dd-fbd8-d475-8814-e0cc6d5cc812@linaro.org>
 <12a9bfda-9c9f-6baf-3e5f-ce7cc7d79aee@starfivetech.com>
 <f0744dfd-00fe-2f58-065e-6828b6bd3450@linaro.org>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <f0744dfd-00fe-2f58-065e-6828b6bd3450@linaro.org>
X-Originating-IP: [113.72.146.246]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_023818_937525_FC971586 
X-CRM114-Status: GOOD (  11.64  )
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

On 2023/8/7 17:17, Krzysztof Kozlowski wrote:
> On 07/08/2023 11:03, Xingyu Wu wrote:
>>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: snps,designware-i2s
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          maxItems: 1
>>>> +        clock-names:
>>>> +          maxItems: 1
>>>> +        resets:
>>>> +          maxItems: 1
>>>> +    else:
>>>> +      properties:
>>>> +        resets:
>>>> +          minItems: 2
>> 
>> The resets of TX0/TX1/RX on JH7110 SoC are mentioned in 'else' here.
> 
> Ah, its fine. Clocks seem to be also constrained.

OK, I will keep it here.

> 
>> 
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: starfive,jh7110-i2stx0
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 5
>>>
>>> Also maxItems
>> 
>> Will add.
>> 
>>>
>>>> +        clock-names:
>>>> +          minItems: 5
>>>
>>> Also maxItems
>> 
>> Will add.
>> 
>>>
>>> What about resets? 1 or 2 items?
>> 
>> Mentioned it in the 'else'.
>> Or do you mean I should drop the 'else' and add the resets in here?
>> And is the same for TX1 and RX?
> 
> It won't be easy to read... probably the binding should be split.
> Anyway, it's fine as is, except the maxItems above.
> 

So I will keep it and just add the maxItems in next version.

Thanks,
Xingyu Wu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
