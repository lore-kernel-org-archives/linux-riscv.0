Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C96C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 02:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pX9zBJYoQYXBkVNZ0neMIinP8SuRejix5d3pEJVnypA=; b=xce1lfMO02xWSm
	1C1jthN2YsWrJ1OnqvK13spgQoOiG5DTalXunHOc0I+rjCfe1684dfyXcTA7hjyQ4ys+K/ckoJtB9
	bwxJV3eu6kVe4wonjolVPCb+/9eEmJR6iOcpp9gzQd4t/gcQceqTdohDs17EwmqNPCDYXNFZadfOL
	fBvavfkSppCA2bDmnGa7OnbG2uzwa4PlhjlTBVj9T5k6jzuds4sshkdGu83fH+39jFUaSf9p3Yuna
	R2QE5SsIGfjdHmfmgV0VMhcxokJQWLYqtmrahUL+DqcMYsVhj2PqtUgWU3kbeB1bMaPHDWcSurNyl
	saUHgcmyyfxV2tiGmgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prUdy-002dVA-1L;
	Wed, 26 Apr 2023 02:12:30 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prUdu-002dTv-1O;
	Wed, 26 Apr 2023 02:12:29 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B16BC24DF03;
	Wed, 26 Apr 2023 10:11:50 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Apr
 2023 10:11:50 +0800
Received: from [192.168.125.106] (113.72.145.137) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Apr
 2023 10:11:49 +0800
Message-ID: <f082999f-e870-9685-98c8-e43bdda67744@starfivetech.com>
Date: Wed, 26 Apr 2023 10:11:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
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
Content-Language: en-US
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230425-commotion-prewashed-876247bed4ab@spud>
X-Originating-IP: [113.72.145.137]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_191226_804613_23C5D9C5 
X-CRM114-Status: GOOD (  17.96  )
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

I think there child-nodes just need to operate some clock signals. Maybe
we don't need to discuss other platforms.

If Rob's method is confirmed. I will try it next version.

Maybe like this:
aon_syscon: syscon@17010000 {
	compatible = "starfive,jh7110-aon-syscon", "syscon", "starfive,jh7110-aon-pmu";
	reg = <0x0 0x17010000 0x0 0x1000>;
	#power-domain-cells = <1>;
};

Rob and krzystof:

And I think patch[1][2] need to change. Right? 

[1] https://lore.kernel.org/all/20230414024157.53203-6-xingyu.wu@starfivetech.com/
[2] https://lore.kernel.org/all/20230414024157.53203-7-xingyu.wu@starfivetech.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
