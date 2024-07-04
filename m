Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AEAC30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 10:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gorNMUGEE2PSznDuYnnuSgUNUXSpj3Pf27rVfeKhFU=; b=mIx5gh1dIaxCqq
	pyrSL/Ja54K4jBBVTkX/e541Hn9rgVdaxdA1tfJh9DwPzK5u+ApCFFFhyd7ru1Z/2VnEliRb1CswT
	F2WlO7oGDhPYvlyCwRWdlxkFbETJ7IS00MCnWXn0i/NWuG1wx2vmpgGRe6Qso00AyU+HDMRtmgeJI
	M8rIFRrM9skTaT1KtzjueOyoZvl8N9Btj7pa2iKAazopNgsd1OVYFdcBzklQkxEDmRxDa5wgc3jXz
	0sy1lVtYidH/HjkylaX2h+qaYGxJN81IAfekjVACSmv9xZcNzAvtQL4ZzSpMio/CTsX3o7btxs0bb
	/+EEkuFQM1v+4bB7dN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPK0F-0000000Cuw4-2Ij8;
	Thu, 04 Jul 2024 10:47:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPK0C-0000000CuvQ-3FVV
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 10:47:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EDF962669;
	Thu,  4 Jul 2024 10:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B34C3277B;
	Thu,  4 Jul 2024 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720090067;
	bh=pY45yYldwW47Trj7xJ3qAVBLYPUNu/TkSH4X6ZZde0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N/YoHxB1kTqCN7bW73FO6Xa7kuZWF3hT9tn5x/XeRziL/QXJA5fCCkLwIRZwT7r4C
	 R44FQEkSEtNuyk/8OGarvAuCWijJsoJD3snnXIc6tZQOy9toqmRCmeKR1y5iqI7WUE
	 8aEcu/obFTV1oz0ectj8GOekqyaTkbNpDHFXX8805Km8Dvitcie/AxiJ9QsJilgpBA
	 cpnVixMdlzbCcnNtSqGVAL101aAF4NfyY/EOrcA8g80eUXCxeMcpacmkHvbpSoDQV2
	 2drd/0RVEwSAQEmwEjNg93IHOqx/52l3Ro07yRxeNVj3hY7XSPu3bIh5Q+QcryAdZJ
	 XRIwmMkpfr/rA==
Message-ID: <3121cd5e-7fcd-4daf-b51c-afba8074d5a3@kernel.org>
Date: Thu, 4 Jul 2024 12:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: sophgo,cv18xx-saradc.yaml: Add
 Sophgo SARADC binding documentation
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicorn_wang@outlook.com>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240702-sg2002-adc-v1-0-ac66e076a756@bootlin.com>
 <20240702-sg2002-adc-v1-1-ac66e076a756@bootlin.com>
 <b7913f90-7405-4a77-9c57-97ef124de6e1@kernel.org>
 <8d368347-7cee-41af-a033-c495eeb62e2a@bootlin.com>
 <577a5623-6dd8-4229-9c07-61e131a01aa8@kernel.org>
 <0d50df10-4b4e-47c4-930f-cd8f645a7e2d@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0d50df10-4b4e-47c4-930f-cd8f645a7e2d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_034748_982452_F21B549E 
X-CRM114-Status: GOOD (  16.30  )
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

On 04/07/2024 10:52, Thomas Bonnefille wrote:
> 
> 
> On 7/4/24 10:39 AM, Krzysztof Kozlowski wrote:
>> On 04/07/2024 10:35, Thomas Bonnefille wrote:
>>> Hello Krzysztof,
>>> Thank you for your feedback
>>>
>>> On 7/3/24 7:08 AM, Krzysztof Kozlowski wrote:
>>>> On 02/07/2024 13:52, Thomas Bonnefille wrote:
>>>>> The Sophgo SARADC is a Successive Approximation ADC that can be found in
>>>>> the Sophgo SoC.
>>>>>
>>>>> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>>>>> ---
>>>>>    .../bindings/iio/adc/sophgo,cv18xx-saradc.yaml     | 51 ++++++++++++++++++++++
>>>>>    MAINTAINERS                                        |  5 +++
>>>>>    2 files changed, 56 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..21fd5dc8e24e
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/iio/adc/sophgo,cv18xx-saradc.yaml
>>>>> @@ -0,0 +1,51 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/iio/adc/sophgo,cv18xx-adc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Sophgo 3 channels Successive Approximation Analog to Digital Converters
>>>>> +
>>>>> +maintainers:
>>>>> +  - Thomas Bonnefille <thomas.bonnefille@bootlin.com>
>>>>> +
>>>>> +description:
>>>>> +  Datasheet at https://github.com/sophgo/sophgo-doc/releases
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: sophgo,cv18xx-saradc
>>>>
>>>> Except that this was never tested... wild-cards are generally not allowed.
>>>>
>>>
>>> I realized I made a mistake when using the "make dt_binding_check"
>>> command, which led to some errors in this dt_binding. I have now
>>> addressed all of them, but I'm not sure I understand your comment.
>>>
>>> I don't see any wildcards in the YAML file. Could you please provide
>>> more details on what you expect?
>>
>> What is "xx"? Sounds like wildcard. I do not see such SoC compatible.
>>
> 
> The point of cv18xx is to have a single compatible for all SoCs of the 
> cv18xx series from Sophgo (cv1800b, cv1812h but also sg2000 and sg2002). 
> I used that as a reflection of the cv18xx.dtsi used for all those SoCs.
> 
> Should I create multiple compatible for all the SoCs of a same brand ?

See writing bindings (and numerous presentation on this topic).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
