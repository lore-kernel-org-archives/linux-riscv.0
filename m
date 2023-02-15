Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C960FC636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 07:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aJ2wtLy72gU8uQy2beg0nvEz8IvikZMH+I5ivLiJyg=; b=a070q59DUYX6EY
	ciNprzaIWCZPkIdnR/SP/Ln8XOvaT82YhxrKzhhEy6yhepSOvfd2LAdxcuZPxKHksL5E1Off3b/Xt
	JXJjwUh3qOdCBymheJgi3Re/4zsfcq2cIAhoac9PO8iukaw3Z8FdRL7Z8UumgtWeqRskWvtFTQhBf
	CmFLT3w3yo9rm60UbYWEDPXwWabDSXPmsUQ9/IJFsRUsZgSF9DmOTK3eW9v1cqmggl3WCntlkX0HU
	Wlt/17UC0V4W0c03qSG5e+EkidSB53/iACeg0HKLyk3AtuJ3t3FsNKSJ4Q6yqcalccTdPykHSwyov
	q8qWvdZGU1bXw0rwdFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCVU-0055TU-IF; Wed, 15 Feb 2023 07:47:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSCVQ-0055R9-CT
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 07:47:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5027E24E28B;
	Wed, 15 Feb 2023 15:46:12 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 15:46:12 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Feb
 2023 15:46:11 +0800
Message-ID: <e066920c-26a9-0f0e-3304-2b9940274d57@starfivetech.com>
Date: Wed, 15 Feb 2023 15:46:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-3-yanhong.wang@starfivetech.com>
 <15a87640-d8c7-d7aa-bdfb-608fa2e497cb@linaro.org>
 <c9ab22b5-3ffb-d034-b8b8-b056b82a96ce@starfivetech.com>
 <aa85caa3-6051-46ab-d927-8c552d5a718d@linaro.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <aa85caa3-6051-46ab-d927-8c552d5a718d@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_234708_758775_37956997 
X-CRM114-Status: GOOD (  11.22  )
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



On 2023/2/7 15:59, Krzysztof Kozlowski wrote:
> On 07/02/2023 03:43, yanhong wang wrote:
>> 
>> 
>> On 2023/1/18 23:47, Krzysztof Kozlowski wrote:
>>> On 18/01/2023 07:16, Yanhong Wang wrote:
>>>> Some boards(such as StarFive VisionFive v2) require more than one value
>>>> which defined by resets property, so the original definition can not
>>>> meet the requirements. In order to adapt to different requirements,
>>>> adjust the maxitems number definition.
>>>>
>>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 9 +++------
>>>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> index e26c3e76ebb7..baf2c5b9e92d 100644
>>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>> @@ -133,12 +133,9 @@ properties:
>>>>          - ptp_ref
>>>>  
>>>>    resets:
>>>> -    maxItems: 1
>>>
>>> Also, this does not make sense on its own and messes constraints for all
>>> other users. So another no for entire patch.
>>>
>> 
>> Thanks. Change the properties of 'resets' and reset-names like this:
>> 
>>   resets:
>>     minItems: 1
>>     maxItems: 2
>> 
>>   reset-names:
>>     minItems: 1
>>     maxItems: 2
>> 
>> Is it right?  Do you have any other better suggestions?
> 
> Isn't this allowing two reset items for every variant of snps,dwmac?
> 

Sorry for not getting back to you faster.
After referring to the above modification, i used the command 'make DT_CHECKER_FLAGS=-m dt_binding_check'
to check all the bindings(including 'starfive,jh7110-dwmac.yaml'), no errors are reported,
and the errors reported by Rob Herring are gone.

> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
