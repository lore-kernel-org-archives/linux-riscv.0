Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FF7C7EE21
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 01:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=653X5oS2dOmYso2TJKVLNhKECNVYNRx1rZWJNG9oXmQ=; b=0zbJMVy/vIVqy0
	aVaYglXecmTs0mqdjQ6baHPj+Oq56//7mpD1WGCNh7PGZ0KmnhzVXSjF0qf+3jcNAVNogFCtN7QHq
	2T6liiontjjRIdKIFv614OIYvdmBBX/MNswLjKBvoOiktDESsB5kUDPSx9J+ZfsFkQ11T7jbiHJdc
	BzbEQR3DcwYvmn9XpLyurjKJunuFXL70HrL7feRroGTScsxuMXSWYAiah4wNdjFaeehytn4A6MMVD
	FUq6t8UNBvectSntvgDj1p7kosZ/2KpCBoPVvnBwx7nEy+C9zmvCzMpVG8QgSmhMs5uZ7VRN/sATC
	+GFT5clMgne3noF8GkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pukGq-009Spw-09;
	Fri, 05 May 2023 01:30:04 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pukGl-009Slu-0p;
	Fri, 05 May 2023 01:30:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1593924E1B7;
	Fri,  5 May 2023 09:29:18 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 5 May
 2023 09:29:17 +0800
Received: from [192.168.125.107] (183.27.99.121) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 5 May
 2023 09:29:16 +0800
Message-ID: <2f473307-2219-61a4-fa66-5848fe566cf0@starfivetech.com>
Date: Fri, 5 May 2023 09:29:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Walker Chen
	<walker.chen@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <vkoul@kernel.org>,
	<linux-phy@lists.infradead.org>
References: <20230425-commotion-prewashed-876247bed4ab@spud>
 <0b0f9187-ad6b-a1d9-6ec4-beb8989ca731@starfivetech.com>
 <3ed72340-accc-4ad1-098f-4a2eb6448828@linaro.org>
 <482e812a-05dd-105c-189c-e926b4be9d28@starfivetech.com>
 <089e24d1-588a-4a56-f00b-0b35d1d99295@linaro.org>
 <ea5b5534-8fc2-7c84-a011-c1b42c6ed7a0@starfivetech.com>
 <1ac26c1a-1726-515d-6598-849a07ed0b86@linaro.org>
 <5adda0ad-965c-fbf0-878c-9d41d28b5c39@starfivetech.com>
 <86693969-59bf-5bcc-42a3-b6e94a0d6f3e@linaro.org>
 <fcfc8ba4-40a7-da43-3375-712bd7e7f4d5@starfivetech.com>
 <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230504-worshiper-ongoing-5581e1f2c2c4@wendy>
X-Originating-IP: [183.27.99.121]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_182959_619386_EE701966 
X-CRM114-Status: GOOD (  11.58  )
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



On 2023/5/4 17:57, Conor Dooley wrote:
> On Thu, May 04, 2023 at 05:48:20PM +0800, Changhuang Liang wrote:
>> On 2023/5/4 17:36, Krzysztof Kozlowski wrote:
>>> On 04/05/2023 10:43, Changhuang Liang wrote:
> 
>>>> On 2023/5/4 15:26, Krzysztof Kozlowski wrote:
>>>>
>>>> If compatible = "starfive,jh7110-aon-syscon", "syscon". My pmu drivers need use 
>>>> "starfive,jh7110-aon-syscon" to match.
>>>
>>> And how it would even work with your proposal
>>> "starfive,jh7110-aon-syscon", "syscon", "starfive,jh7110-aon-pmu"?
>>>
>>> Try...
>>>
>>>>  And my pmu series will add this 
>>>> aon_syscon in yaml and device tree, so the syscon patch's owner don't need 
>>>> to add the aon_syscon in its yaml and device tree?
>>>
>>> I don't understand. But if you need to drop syscon, sure, drop it.
>>>
>>
>> Yes, I think it can drop aon_syscon node in syscon patch series. And maybe my
>> compatible = "starfive,jh7110-aon-pmu", "syscon"; is better.
>>
>> aon_syscon: syscon@17010000 {
>> 	compatible = "starfive,jh7110-aon-pmu", "syscon";
> 
> I don't really understand why you actually need to have this compatible.
> Why not keep "starfive,jh7110-aon-syscon" & register the PMU using a
> software mechanism?
> 

But if keep this "starfive,jh7110-aon-syscon" compatible. Which .yaml match to
it? Use this series dt-bindings or syscon series dt-bindings.

>> 	reg = <0x0 0x17010000 0x0 0x1000>;
>> 	#power-domain-cells = <1>;
>> };
>>
>> Best regards,
>> Krzysztof
> 
> ^^^^^^^^^^^^^^
> btw, your mailer is doing something odd with quotation.
> 

OK, will pay attention to it.

> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
