Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AC2C77B75
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 01:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+w8E5RFdj+wx5FB2ZZj9SA3k0PoZzl8BGK4QZtmZgfg=; b=G6KEAIcdSdx2Re
	fGQxGOyvYD+SHLLlT2oxn0OQe3MXKOS5oC517UeT191tZX7inb9HAYFA1kJSSw6zsbL0TP26ERhP3
	kDEMF32gYCZc8+krTM1AJq1fT9W+8HcshF5+HytYJe8sZPp4i4Wf52C8fTF99rAV/MHL9khXRvy0y
	GNF2mWedzBlUJNFCRzD6HPwoaHwHvAMjo4b4/0OJZANpLYYGJEyaYsMpsUFQxHiq37e6aS+L4h3NI
	Uyvzpx6o8xsPxWd8Myq9UZ5h8GgsU3vOW7d4rykbmOGuBi896EA39Bzk3XMnA/iEg50UDbmLTwCC1
	fFh2rUY1BPZF4Nb8A/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puNsM-006Inw-0x;
	Thu, 04 May 2023 01:35:18 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puNsG-006Iky-11;
	Thu, 04 May 2023 01:35:16 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9B0B224E09F;
	Thu,  4 May 2023 09:34:33 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 4 May
 2023 09:34:33 +0800
Received: from [192.168.125.107] (183.27.99.121) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 4 May
 2023 09:34:32 +0800
Message-ID: <0b0f9187-ad6b-a1d9-6ec4-beb8989ca731@starfivetech.com>
Date: Thu, 4 May 2023 09:34:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
References: <20230419-labored-camper-644d51a7ca96@spud>
 <1a5b15fa-4f20-51c2-2ba1-a04a2911a694@starfivetech.com>
 <20230424-baffle-punch-ec73098f2b6a@spud>
 <d685a1d4-c07d-7dfa-f1fb-b35ceb2aa0eb@starfivetech.com>
 <20230425-unquote-eligible-09f743d81981@wendy>
 <a7cdfabf-2312-eaf3-f462-5bda7f0a120d@starfivetech.com>
 <68cb565d-bf39-10b0-9e3e-35ba7f54b90b@linaro.org>
 <0988495f-b87a-7f69-f222-37c67d6eae23@starfivetech.com>
 <20230425-resale-footrest-de667778c4fe@wendy>
 <663e9933-b9b3-a48f-98b6-2207215a8ed7@starfivetech.com>
 <20230425-commotion-prewashed-876247bed4ab@spud>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230425-commotion-prewashed-876247bed4ab@spud>
X-Originating-IP: [183.27.99.121]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_183512_677069_3CBA7FB0 
X-CRM114-Status: GOOD (  16.32  )
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



On 2023/4/26 0:56, Conor Dooley wrote:
> On Tue, Apr 25, 2023 at 08:26:35PM +0800, Changhuang Liang wrote:
>> On 2023/4/25 17:35, Conor Dooley wrote:
>>> On Tue, Apr 25, 2023 at 05:18:10PM +0800, Changhuang Liang wrote:
>>>> On 2023/4/25 16:19, Krzysztof Kozlowski wrote:
>>>>> On 25/04/2023 09:57, Changhuang Liang wrote:
>>>>>> Yes, "starfive,jh7110-aon-pmu" is a child-node of "starfive,jh7110-aon-syscon".
>>>>>> In my opinion, "0x17010000" is "aon-syscon" on JH7110 SoC, and this "aon-pmu" is just 
>>>>>> a part of "aon-syscon" function, so I think it is inappropriate to make "aon-syscon"
>>>>>> to a power domain controller. I think using the child-node description is closer to
>>>>>> JH7110 SoC. 
>>>>>
>>>>> Unfortunately, I do not see the correlation between these, any
>>>>> connection. Why being a child of syscon block would mean that this
>>>>> should no be power domain controller? Really, why? These are two
>>>>> unrelated things.
>>>>
>>>> Let me summarize what has been discussed above. 
>>>>
>>>> There has two ways to describe this "starfive,jh7110-aon-syscon"(0x17010000).
>>>> 1. (0x17010000) is power-controller node:
>>>>
>>>> 	aon_pwrc: power-controller@17010000 {
>>>> 		compatible = "starfive,jh7110-aon-pmu", "syscon";
>>>> 		reg = <0x0 0x17010000 0x0 0x1000>;
>>>> 		#power-domain-cells = <1>;
>>>> 	};
>>>>
>>>>
>>>> 2. (0x17010000) is syscon node, power-controller is child-node of syscon:
>>>>
>>>> 	aon_syscon: syscon@17010000 {
>>>> 		compatible = "starfive,jh7110-aon-syscon", "syscon", "simple-mfd";
>>>> 		reg = <0x0 0x17010000 0x0 0x1000>;
>>>>
>>>> 		aon_pwrc: power-controller {
>>>> 			compatible = "starfive,jh7110-aon-pmu";
>>>> 			#power-domain-cells = <1>;
>>>> 		};
>>>> 	};
>>>
>>> I thought that Rob was suggesting something like this:
>>> 	aon_syscon: syscon@17010000 {
>>> 		compatible = "starfive,jh7110-aon-syscon", ...
>>> 		reg = <0x0 0x17010000 0x0 0x1000>;
>>> 		#power-domain-cells = <1>;
>>> 	};
> 
>> I see the kernel:
>> https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/mediatek/mt8167.dtsi
>> this file line 42:
>> it's power-controller also has no meaningful properties.
>> What do you think?
> 
> I'm not sure that I follow. It has a bunch of child-nodes does it not,
> each of which is a domain?
> 
> I didn't see such domains in your dts patch, they're defined directly in
> the driver instead AFAIU. Assuming I have understood that correctly,
> your situation is different to that mediatek one?
> 
> Cheers,
> Conor.

Conor and Rob, 

How about this way:

aon_syscon: syscon@17010000 {
	compatible = "starfive,jh7110-aon-syscon", "syscon", "simple-mfd";
	reg = <0x0 0x17010000 0x0 0x1000>;
	
	aon_pwrc: power-controller {
		compatible = "starfive,jh7110-aon-pmu";
		regmap = <&aon_syscon>;
		#power-domain-cells = <1>;
	};
};

Add a "regmap" property which is phandle. And it can keep the present child-node
structure. This is more consistent with our soc design.

Best regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
