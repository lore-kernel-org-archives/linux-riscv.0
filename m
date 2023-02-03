Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66E7C636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JF16oUAPl1+dL5mcS0q5ty5xE3XgksjxhP8ODZ066yA=; b=WF8s/q2jLAkGwA
	d3y2A6OXp6JkjCvdiSesTEorL0E7EhbbAsYlaPsMPsYxAmCZaRhbnzwd9DpDUPSyPxh5peU3Z0iu4
	AUfIhbJnVQx8V6ZfuoQHG193/B75w0XjjkvTuhoDLpea3iBs3RFdEQYW2n/+O+GVj7ZTYLPRGaAQe
	1ql4MyF16mJ3njkzUbBKr2wpjyZIugoj/Re8zB7EQd7JMxT365fXjEUrse7H6kqJA0dnB180DI1AD
	Nl0Y0nR2R23cGrIiU9AH/JJTxeTObwTXdbjoiE/2IGAfIIW2dH4BVOI/HD7IZEYgNnuAo/4kcwgoo
	bh0p2NdRlZ2/WW7xd3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqgl-000qMq-Ht; Fri, 03 Feb 2023 07:40:51 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqgf-000qFv-KS
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 07:40:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2DE5824E1D4;
	Fri,  3 Feb 2023 15:40:12 +0800 (CST)
Received: from EXMBX073.cuchost.com (172.16.6.83) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 15:40:12 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX073.cuchost.com
 (172.16.6.83) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 15:40:10 +0800
Message-ID: <048b3ab0-7c13-b7f7-403c-f4e1d5574a10@starfivetech.com>
Date: Fri, 3 Feb 2023 15:40:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 6/7] riscv: dts: starfive: jh7110: Add ethernet device
 node
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
 <20230118061701.30047-7-yanhong.wang@starfivetech.com>
 <55f020de-6058-67d2-ea68-6006186daee3@linaro.org>
 <f22614b4-80ae-8b16-b53e-e43c44722668@starfivetech.com>
 <870f6ec5-5378-760b-7a30-324ee2d178cf@linaro.org>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <870f6ec5-5378-760b-7a30-324ee2d178cf@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX073.cuchost.com
 (172.16.6.83)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_234046_359669_5395C36A 
X-CRM114-Status: GOOD (  18.49  )
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



On 2023/2/3 15:09, Krzysztof Kozlowski wrote:
> On 03/02/2023 04:14, yanhong wang wrote:
>> 
>> 
>> On 2023/1/18 23:51, Krzysztof Kozlowski wrote:
>>> On 18/01/2023 07:17, Yanhong Wang wrote:
>>>> Add JH7110 ethernet device node to support gmac driver for the JH7110
>>>> RISC-V SoC.
>>>>
>>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>>> ---
>>>>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 93 ++++++++++++++++++++++++
>>>>  1 file changed, 93 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>> index c22e8f1d2640..c6de6e3b1a25 100644
>>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>>>> @@ -433,5 +433,98 @@
>>>>  			reg-shift = <2>;
>>>>  			status = "disabled";
>>>>  		};
>>>> +
>>>> +		stmmac_axi_setup: stmmac-axi-config {
>>>
>>> Why your bindings example is different?
>>>
>> 
>> There are two gmacs on the StarFive VF2 board, and the two
>> gmacs use the same configuration on axi, so the 
>> stmmac_axi_setup is independent, which is different
>> from the bindings example.
>> 
>> 
>>> Were the bindings tested? Ahh, no they were not... Can you send only
>>> tested patches?
>>>
>>> Was this tested?
>>>
>> Yes, the bindings have been tested on the StarFive VF2 board and work normally.
> 
> Then please tell me how did you test the bindings on the board? How is
> it even possible and how the board is related to bindings? As you could
> easily see from Rob's reply they fail, so I have doubts that they were
> tested. If you still claim they were - please paste the output from
> testing command.
> 

Sorry, I didn't check all the bindings, only the modified ones, the command 
used is as follows: 
"make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/snps,dwmac.yaml"
"make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml"

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
