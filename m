Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0589AC636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TU7MP+tWpABpdS1HdxZ/PQlIrEGJNpucUhRWZWr3Xnk=; b=j5+7h2Fk66g4hB
	0EOFacaSunZfNLZp57QKCzrEAVoorUg4aWq0XtjTtJDNFHpeQAF3dr6i7FRY0H8oAblQHltfdDBfX
	24m2GJL86VuyzLhkZ2sl6I5eWmvMQLVxDP/meSjGPd8Tl91NfvOSPejATztOXg2DmYvJdsctfySA/
	FzOqTwyebeMUT+CHoOKmJltGWUkKNND0R+ShjSaxL74KFKhPrqDQ0YejBnQsM08YFI/zMdue0+Bvn
	JWejscO9zJHgDD/vzjCdk3vBfgjkI1O/A+ICcdzjBXUT7m301sXila99Ys07qTLNElPNyr3UxMog3
	QgisJWW2m+OrsMvUZLMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNsTr-001Cxa-Ca; Fri, 03 Feb 2023 09:35:39 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNsTn-001Cwe-OJ
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 09:35:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 500C624E1F2;
	Fri,  3 Feb 2023 17:35:23 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 17:35:23 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 17:35:22 +0800
Message-ID: <f043e351-1875-ad64-e6b5-6c77bae09f69@starfivetech.com>
Date: Fri, 3 Feb 2023 17:35:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: Add mmc node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
References: <20230203081913.81968-1-william.qiu@starfivetech.com>
 <20230203081913.81968-4-william.qiu@starfivetech.com>
 <3c5bda9f-08b9-f2ba-6951-9fc614d4debc@linaro.org>
 <afe28108-9b85-982c-90ee-8cd58c9b6fb2@starfivetech.com>
 <ab9a4a7f-a8fa-fa29-95e9-941096359de1@linaro.org>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <ab9a4a7f-a8fa-fa29-95e9-941096359de1@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_013535_959376_BF39AE35 
X-CRM114-Status: GOOD (  13.14  )
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



On 2023/2/3 17:30, Krzysztof Kozlowski wrote:
> On 03/02/2023 10:23, William Qiu wrote:
>> 
>> 
>> On 2023/2/3 17:02, Krzysztof Kozlowski wrote:
>>> On 03/02/2023 09:19, William Qiu wrote:
>>>> This adds the mmc node for the StarFive JH7110 SoC.
>>>
>>> Do not use "This xxx". Use imperative mode.
>>> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
>>>
>>>> Set mmco node to emmc and set mmc1 node to sd.
>>>>
>>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>>
>>>
>>>> +
>>>>  &gmac0_rmii_refin {
>>>>  	clock-frequency = <50000000>;
>>>>  };
>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>> index 64d260ea1f29..ae1a664e7af5 100644
>>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>> @@ -370,6 +370,11 @@ syscrg: clock-controller@13020000 {
>>>>  			#reset-cells = <1>;
>>>>  		};
>>>>  
>>>> +		sysreg: syscon@13030000 {
>>>> +			compatible = "starfive,sysreg", "syscon";
>>>
>>> No:
>>> 1. Undocumented.
>>> 2. A bit too generic. You should have here SoC specific compatible as
>>> well (either as second or third compatible, if all your SoCs share
>>> register layout).
>>>
>> 
>> Hi Krzysztof,
>> 
>> As for the compatible, I will change it to "starfive,jh7110-sysreg"
>> in next version,but for undocumented, I don't get it, can you
>> clarify that.
>> Thank you anyway.
> 
> You need bindings for it. I don't see it in linux-next, cover letter
> dependencies nor here.
> 

I see, I will update it in next version.
Thank you for taking time to review and provide helpful comments for this patch.

Best regards,
William Qiu
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
