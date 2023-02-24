Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D267C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeN866oQYaz3uwZBNn1mkL+fZpJu8jzyKT9K69vg3Ys=; b=PrnchsN8wwiVZj
	Blq8GL4v2ICVKbQNnLSi5eqcya0MvAvt6+fp7B5lusUNbmbObmFTAj/2S3gtiX4CQQNFor9spk8/o
	wa++6eusYSTJMdWrCmA0eIvTP1dX5pxgz0Vm/SVsT2BncKsx7vF0kS0Mkria1DOZKvajxkXFG/GTN
	snmID9uUiqIAc3xr+o2QOzvSIAcram7HMEP3Jun+5tUmQePv1kGeGn27qXd/iE6HN8lo+xj27Qx/v
	nNFd4LCxIa8UsQkxs72DQPU2rAnjuc0x3y2JaRKM277OwcYXSLX4kOiYMPHv3TxOU75+boZC22yWj
	Hv01nQRqh686MTDKOKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXpb-002Yk0-5m; Fri, 24 Feb 2023 13:09:47 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXpV-002YZ3-8k
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:09:45 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7A15524E31E;
	Fri, 24 Feb 2023 21:09:08 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 21:09:08 +0800
Received: from [192.168.125.93] (113.72.147.165) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 21:09:07 +0800
Message-ID: <bd4301c5-d79f-6ba5-a840-95b733d2d44e@starfivetech.com>
Date: Fri, 24 Feb 2023 21:09:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add reset
 items
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Eugeniy Paltsev
	<Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230221140424.719-1-walker.chen@starfivetech.com>
 <20230221140424.719-2-walker.chen@starfivetech.com>
 <1467f7c5-07eb-97db-c6f2-573a4208cc28@linaro.org>
 <d0984638-3f7f-7e4e-fe3e-5e1f88375dca@starfivetech.com>
 <36188e04-332f-e944-9c58-f6f2b74987da@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <36188e04-332f-e944-9c58-f6f2b74987da@linaro.org>
X-Originating-IP: [113.72.147.165]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_050941_635183_18A579B1 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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



On 2023/2/24 18:51, Krzysztof Kozlowski wrote:
> On 24/02/2023 11:14, Walker Chen wrote:
>>>>    resets:
>>>> -    maxItems: 1
>>>> +    maxItems: 2
>>>
>>> This breaks ABI and all other users. Test your changes before sending.
>> 
>> I think 'minItems' should be added here. So like this:
>> resets:
>>   minItems: 1
>>   maxItems: 2
>> 
>> Other platform/users will not be affected by this.
> 
> Which will allow two resets on all platforms. Is this correct for these
> platforms? Do they have two resets?
> 
In kernel 6.2, only two platforms use this DMA controller (see 'arch/arc/boot/dts/hsdk.dts' and 'arch/riscv/boot/dts/canaan/k210.dtsi').
There is one reset on k210, while there is no reset of DMA on hsdk at all.
If here minItems with value 1 is added and the value of maxItems is changed to 2, after my testing,
whether it is one reset or two resets, even no reset, there is no errors occur when doing dtbs_check,
the DMA initialization shall not be affected either on their platforms.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
