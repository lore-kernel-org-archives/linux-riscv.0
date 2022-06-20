Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7E8CCA47C
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 23:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhFFQwkSyqaSc/bglzNe7royuHsMuT5CP/wlb4UGAyg=; b=fJcjEmOt4H2bFE
	cI9gT3x3mEbVFjsx+Nvb1pX1oNaN9HLh89inwB8jhFynx1NrhFb+Qzd3sqfEx9fnJcKEC/biBCBg5
	VCdHAAd6PXSp7mWkWG/0DY0nvCgp+dL9dwvUcRFGCzWlDoQz4NGRQt2x6fbl0ewVmx1If3NZZx11S
	7d+3DCLn6sqUuWxAWmy4araBpKDON1rRtgELxvUlG5nafP5Vv9fYnvhRfARIQGeKgFeueXOap40fr
	VTZGejtT6cHzys0mhjgU0MtlWlr9aOtwuCKTKKIh0Dr6foFioLN+0LxweZJ3N6bb8pqJQCDnGFO07
	RvEpsLpgnJo0GKChNemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QeI-002qMS-Cd; Mon, 20 Jun 2022 23:17:38 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QeE-002qL3-Gp
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 23:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1655767054; x=1687303054;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8Iz6YFZtbcFYcwcjopjjArKVT0IuGvxeSilsHzUbATU=;
  b=RbAvGYIR2pACn9s9fzAYe40Dwd/vxQDRs9Ekug1UoZtsUMaHhyEfUH4i
   1h65sGyTbmeL0kCwQYH7+DpjjmKY4BDgTotH41rxd7I5VDyPIfruBms3+
   6ANFbC6sGxtqPlRiaZfSs/sN+z7BNmpC72AYfG91fKzyYodHn69tqTwpE
   9hkCM0M81CELC/OjYdxXIa9SrfdcS9ZJcMuyWPF/S7tVVSZC0rrb5Inzx
   e4sVl+PuGOUUkISwWIYQFq+BXbtI8vfEaqo1LjCYIwWgoGvOv2YX4A3+c
   AGnqqyEJ2OZicOYyB6fsOlj6Gql2pFouUI6hyXn5rpnhjUA+dcnDqT6bn
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650902400"; 
   d="scan'208";a="307982128"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jun 2022 07:17:30 +0800
IronPort-SDR: eACBya22EgVzh8Sd8hXHSxv8aXHi9vYjIsWO98LN5pf3z2mJEx68kRkgwnBAGsgVlGG+JC75L6
 0DAsCI9EZN/ILMPjqmxK45/Fh1Vz72nLRVT6xy+ovEgO/w+BGazrhZLcUBhPcFlS/pdDle+t2T
 1rYp9bkAHWwE3zZGpTxh2MOrFMv0sSQPlDfulhoSRm2Co7tRnQ1kzI2JJlZG7N9wa3mMWLkjTt
 AxCNP8JRO87MUCOjQ42NTOcZPdfqKmzJQtamWr2Bay+C9EVaEWLauxZJhzLu9AB5kJkRDfZQVD
 0/VLyGOieDVq9W+NqNGsLioq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2022 15:40:00 -0700
IronPort-SDR: f343qP5qpi8nH3gT6emHRH4EjW2bPZrfu+mL+tgckRZaW/Tfr1cvdl5RNTa9b0NmxjfXrBJrLF
 rXxLapcK0jl4sPyG9mLxpBPO8zAIAEdHFvZfjC8Hdb2jLHPLZFfjXFzmnlGMdAb7ZIM/kcYeOO
 URgWiXSr4iyWdAUG2ZVcLmNt7H42IpiR4t0m4ydP4d4N7YbCNmAB+Zw07GK2o2UbtRRriACZAU
 JdvaFsIXmC7QZbhCg4h3fz6J2e8l4tpRlqLKHjoNZaAZc2AUEc3fGtvZNgqzj2BH7u9Gb58qeO
 Fiw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2022 16:17:29 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LRlt11rrNz1SVp2
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 16:17:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1655767047; x=1658359048; bh=8Iz6YFZtbcFYcwcjopjjArKVT0IuGvxeSil
	sHzUbATU=; b=UQxdQIO/DgiT8AvQoecraHX41EUJtYAtz6fgPeku15XW9M5Stm3
	LY7Hc/LYEdpIRpDooBsIzkWFCA2tZYmcebwwwMCIzwTYfeVjWFVJ7QavztL4GxHp
	H2KdJA/p/Qu1y+y9xjt05HheIEUjOdHrEDmIp6Plnv+acg2GR2vOOXckPsmjyGDk
	YNaxlUEefaB6rBauRplBz4zbwmT2bypE85jX90H5sdA7lJASFEtjlPUeZb2wmJmk
	KFzNIap5bdwTDtRhIqj9ctHa46mvrWGNEX90XkZliFW94X3nEHIdVC9noWGvp9NI
	6mVz4a2o9C8N9hcfAiiirGYDj2/7hMhTVKg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Wba4DVxXAiLF for <linux-riscv@lists.infradead.org>;
	Mon, 20 Jun 2022 16:17:27 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LRlss3Tsdz1Rvlc;
	Mon, 20 Jun 2022 16:17:21 -0700 (PDT)
Message-ID: <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
Date: Tue, 21 Jun 2022 08:17:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Conor.Dooley@microchip.com,
 fancer.lancer@gmail.com
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
 sam@ravnborg.org, Eugeniy.Paltsev@synopsys.com, vkoul@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, daniel.lezcano@linaro.org,
 palmer@dabbelt.com, palmer@rivosinc.com, tglx@linutronix.de,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, masahiroy@kernel.org,
 geert@linux-m68k.org, niklas.cassel@wdc.com, dillon.minfei@gmail.com,
 jee.heng.sia@intel.com, joabreu@synopsys.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
 <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_161734_718598_BA10A833 
X-CRM114-Status: GOOD (  20.51  )
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

On 6/21/22 07:49, Conor Dooley wrote:
> 
> 
> On 20/06/2022 23:46, Damien Le Moal wrote:
>> On 6/21/22 06:06, Conor.Dooley@microchip.com wrote:
>>> On 20/06/2022 21:56, Serge Semin wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>>>> this.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> ---
>>>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>>> index e25d44c218f2..f2b9e3f062cd 100644
>>>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>>> @@ -135,19 +135,41 @@ properties:
>>>>>        of the designware controller, and the upper limit is also subject to
>>>>>        controller configuration.
>>>>>
>>>>> -patternProperties:
>>>>> -  "^.*@[0-9a-f]+$":
>>>>> -    type: object
>>>>> -    properties:
>>>>> -      reg:
>>>>> -        minimum: 0
>>>>> -        maximum: 3
>>>>> -
>>>>> -      spi-rx-bus-width:
>>>>> -        const: 1
>>>>> -
>>>>> -      spi-tx-bus-width:
>>>>> -        const: 1
>>>>> +if:
>>>>> +  properties:
>>>>> +    compatible:
>>>>> +      contains:
>>>>> +        const: snps,dwc-ssi-1.01a
>>>>> +
>>>>> +then:
>>>>> +  patternProperties:
>>>>> +    "^.*@[0-9a-f]+$":
>>>>> +      type: object
>>>>> +      properties:
>>>>> +        reg:
>>>>> +          minimum: 0
>>>>> +          maximum: 3
>>>>> +
>>>>> +        spi-rx-bus-width:
>>>>> +          const: 4
>>>>> +
>>>>> +        spi-tx-bus-width:
>>>>> +          const: 4
>>>>> +
>>>>> +else:
>>>>> +  patternProperties:
>>>>> +    "^.*@[0-9a-f]+$":
>>>>> +      type: object
>>>>> +      properties:
>>>>> +        reg:
>>>>> +          minimum: 0
>>>>> +          maximum: 3
>>>>> +
>>>>> +        spi-rx-bus-width:
>>>>> +          const: 1
>>>>> +
>>>>> +        spi-tx-bus-width:
>>>>> +          const: 1
>>>>
>>>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
>>>
>>> 8 too? sure.
>>>
>>>> irrespective from the compatible string. The modern DW APB SSI
>>>> controllers of v.4.* and newer also support the enhanced SPI Modes too
>>>> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
>>>> run-time there is no way to create a DT-schema correctly constraining
>>>> the Rx/Tx SPI bus widths. So let's keep the
>>>> compatible-string-independent "patternProperties" here but just extend
>>>> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
>>>> properties values.
>>>
>>> SGTM!
>>>
>>>>
>>>> Note the DW APB SSI/AHB SSI driver currently doesn't support the
>>>> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
>>>> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
>>>> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
>>>> activated by means of the corresponding CSR. So most likely the DW AHB
>>>> SSI controllers need some specific setups too.
>>>
>>> hmm, well I'll leave that up to people that have Canaan hardware!
>>
>> I will test this series.
>>
> 
> Cool, thanks.
> I'll try to get a respin out tomorrow w/ the memory node "unfixed".

OK. I will test that then :)

> Conor.
> 
>>> Thanks,
>>> Conor.
>>>
>>>>
>>>> -Sergey
>>>>
>>>>>
>>>>>  unevaluatedProperties: false
>>>>>
>>>>> --
>>>>> 2.36.1
>>>>>
>>>
>>
>>


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
