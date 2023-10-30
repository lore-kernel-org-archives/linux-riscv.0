Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69515C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc5hIcoSknMgBC8fIhW91oSiiIGJaL4GCnew7unH9Wg=; b=C3N+xduS1GyBqJ
	SohjBUXSP6enk/ffwJ6qX2evmqQYB2jzmpm6RLvE4FGII91XW9wPboqL+CcBsPp5kwGvIdFdTkleH
	FVaxwJxyKZKpK3mfsL1jsrSaqr7FyadjKn0oZeo2df21Jp3DflOiVYWRS2P0VTVc4JgaisxWoD/Tl
	ss7xK3W5ird4oQxyxSAHXjfL2r5WiVqVRPiL0Lez4UPNUCmOSuuwF743HjAipySLyBAAK2vRcL0dl
	cH8I7CrZuWqAJnCEwzasuHCDy2JsnHaopt3woDNuvhO/MAG8z8hoeiKLls1/iCCJQ5V6IaIrzeZKw
	ELAHAQIFBym0WwQnuYxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxY2z-003wEp-0S;
	Mon, 30 Oct 2023 19:35:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxY2v-003wDq-2l;
	Mon, 30 Oct 2023 19:35:35 +0000
Received: from [192.168.1.90] (unknown [188.24.143.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EDAD36607391;
	Mon, 30 Oct 2023 19:35:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698694531;
	bh=WWn284JKSMebLrEmi0rI0JDzDGrgnLxf/WFScs6DuyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CfD8pBzu37iX8/yO+b0ao9EJvGtfscPSiSQOwcP3nqk+yMSV9vlKt3zGk+C2br3Gg
	 O4ZY4Y5ckxDY9aafrOXqfShO5Oxu8bovMEY/P1Xk/hwh9Gv5caQSPZJOzAPo9tlAvW
	 u8r9Gu2w+qyiccFBm3LTYMXtD9zb79Aq19L6tAWy3APC0rKvj0CP6sePKOBUa3Rvhk
	 z0ZsELzh6YGu/TK0TwM+HeBiTSVrDWmrMOGBlKbDfSFQJs3Yc+8zFQJ5B8viXU/Qno
	 visBXDQVXdWw8d+A3yJZ8Dn8FMAduGJPAMztle+wARDTrROcd+4ucd8OEHsUSl3RzF
	 uCyvLGfbRyQJQ==
Message-ID: <f4d0b216-5bdc-4559-aabb-8af638d33721@collabora.com>
Date: Mon, 30 Oct 2023 21:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] dt-bindings: net: starfive,jh7110-dwmac: Drop
 redundant reset description
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-4-cristian.ciocaltea@collabora.com>
 <ad023e4d-51d2-4fba-bf85-0c8ba358ab39@linaro.org>
 <0ff7a905-d8f2-401b-a0ff-47947d12ce05@collabora.com>
 <fa413fc8-f882-471d-aea8-39f83767a46d@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <fa413fc8-f882-471d-aea8-39f83767a46d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_123534_023106_CDD49AEA 
X-CRM114-Status: GOOD (  12.21  )
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

On 10/30/23 09:29, Krzysztof Kozlowski wrote:
> On 29/10/2023 22:23, Cristian Ciocaltea wrote:
>> On 10/29/23 13:19, Krzysztof Kozlowski wrote:
>>> On 29/10/2023 05:27, Cristian Ciocaltea wrote:
>>>> The reset description items are already provided by the referenced
>>>> snps,dwmac.yaml schema, hence replace them with the necessary
>>>> {min,max}Items.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  .../devicetree/bindings/net/starfive,jh7110-dwmac.yaml       | 5 ++---
>>>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>>> index cc3e1c6fc135..44e58755a5a2 100644
>>>> --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>>>> @@ -46,9 +46,8 @@ properties:
>>>>      maxItems: 3
>>>>  
>>>>    resets:
>>>> -    items:
>>>> -      - description: MAC Reset signal.
>>>> -      - description: AHB Reset signal.
>>>> +    minItems: 2
>>>> +    maxItems: 2
>>>
>>> You must also update reset-names. They must have same constraints.
>>
>> reset-names explicitly lists the items and we need to keep them as such
>> because the order is not fixed, i.e. PATCH 1 allows using 'ahb' instead
>> of 'stmmaceth' as the first (and only) item.
>>
>>         reset-names:
>>           items:
>>             - const: stmmaceth
>>             - const: ahb
> 
> OK. Anyway this patch is no-op because next one removes this code.
> Adding cleanup which is immediately removed does not make much sense.
> Drop it.

The next patch just moves that under an if clause.

Regards,
Cristian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
