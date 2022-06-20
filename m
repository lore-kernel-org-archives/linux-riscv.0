Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4035CC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 22:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwigHVuVa1saRq3+svOguOVr+G55oX/tcwYLUQnmnzI=; b=WDlSGVsHq97hMP
	HL8POs5xxEtG48jFnvxrjKzpZyvqgLu12DwOIdkg2OrbgypG+UIxkkfCn78IUezDGYDFc2jS0RqB6
	6MSg7/wfa42OazNgr8ArpJmareBkPRQiu1Zk2gaDLL4vX0NA+b0ig1E6H3R7bA0y91fF5faOVO4Qq
	UtSr22p+SOMis553iK5qITiciQ2uypazvr1pRX4YVmBQY7SumOadJmEjn7FKAOGNbz7ZgP+WYby7b
	CBwxsRdN1IZvyvy/KeDFbe5dQbdnE4GNdeFuAnESkuGpSnHuob/rmyV79QJviql9BkBgknm1elHdb
	GGGc1Q24nfn0Y7OceOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QCk-002iwE-W9; Mon, 20 Jun 2022 22:49:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3QCi-002iuy-4B
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 22:49:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id e5so6548843wma.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 15:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hy0Xdesz3zE5Os2cbPhgUWle+TPKNOoLmrTtPiHUQEo=;
        b=ZYwDRlfKOOYKL+WIoMVmcZBHfH2hZEk5UjfT4f00kyzA1TsSsZ+LLvooOGasTgLcId
         /NSAyz9yGyNuvDaS+3NY3LrQJux2Kre3iqsxIzfjtaHz8yP2JPfiqTY0iIx54VZsLF75
         Bzqxx5NujcXuLdNFG/rKZtgfRcfumIOzcQjIFXgkYjJoapiB7NEOxkt7XIo+thbkpsDZ
         AXPYAD+vnORi81F2kP1c7A3xKDez+YBlJvfQsHH8b+VCDdx2BVjR6HFF0zFQyv0Thecj
         nsZQUG8VQSsn6ub9nbGGdLWLOvXLQCQP14tjSUiP3G3d/xo+501S04egjJ0MAwRhGLpS
         4+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hy0Xdesz3zE5Os2cbPhgUWle+TPKNOoLmrTtPiHUQEo=;
        b=B4v++vIWPNH/qWrqvlpLnXbWDuHM0233WmBU3riyh96NhLLGkp/adqt3TeXQ3HJ70l
         8l9XmSTl+mEWvbSryD41U0VJKE7IQQLLae2JeEUrzHr3qF6BQqnWo84Poby3DFnqipsC
         AZdNNuIwylPvQOQ2kAiWSDOrxxa3TLc7XYnyg4toxkIdjMrguyuWrzSMVJ2BRbghUFc9
         LD4gCDqpj3oyIFfASfJrpun+mj5BRO09jaPbW2crtqUVJL8Br33JCNy3OqoqQdsssy+e
         09Ad34XnGiM6CgL5y2SiT0Ur3Xp5VcjntAycFgk3O5huXEDIXNMgRx0heqVaqkwgp1sn
         WfSw==
X-Gm-Message-State: AJIora9+a0vq7iZcOwEitpAfmFoQ8js6AA9oVhd1hLEKIR54tiH+GQI/
	R1JoCQXwWyGO9t6R6FthE1sAHw==
X-Google-Smtp-Source: AGRyM1sWkC5yVB3Vh70iYg5zpUyg3STH8l29UNOqYvK+YL6zEEjsIRVCZulowHoh/WC9YX4xPFr8HA==
X-Received: by 2002:a05:600c:4f51:b0:39c:7f6c:a8d6 with SMTP id m17-20020a05600c4f5100b0039c7f6ca8d6mr26961636wmq.143.1655765344601;
        Mon, 20 Jun 2022 15:49:04 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d6989000000b0020c5253d8dcsm14187651wru.40.2022.06.20.15.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 15:49:03 -0700 (PDT)
Message-ID: <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
Date: Mon, 20 Jun 2022 23:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Conor.Dooley@microchip.com, fancer.lancer@gmail.com
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
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_154908_252802_2A6AB1C5 
X-CRM114-Status: GOOD (  16.70  )
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



On 20/06/2022 23:46, Damien Le Moal wrote:
> On 6/21/22 06:06, Conor.Dooley@microchip.com wrote:
>> On 20/06/2022 21:56, Serge Semin wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>>> this.
>>>>
>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>> ---
>>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> index e25d44c218f2..f2b9e3f062cd 100644
>>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>>> @@ -135,19 +135,41 @@ properties:
>>>>        of the designware controller, and the upper limit is also subject to
>>>>        controller configuration.
>>>>
>>>> -patternProperties:
>>>> -  "^.*@[0-9a-f]+$":
>>>> -    type: object
>>>> -    properties:
>>>> -      reg:
>>>> -        minimum: 0
>>>> -        maximum: 3
>>>> -
>>>> -      spi-rx-bus-width:
>>>> -        const: 1
>>>> -
>>>> -      spi-tx-bus-width:
>>>> -        const: 1
>>>> +if:
>>>> +  properties:
>>>> +    compatible:
>>>> +      contains:
>>>> +        const: snps,dwc-ssi-1.01a
>>>> +
>>>> +then:
>>>> +  patternProperties:
>>>> +    "^.*@[0-9a-f]+$":
>>>> +      type: object
>>>> +      properties:
>>>> +        reg:
>>>> +          minimum: 0
>>>> +          maximum: 3
>>>> +
>>>> +        spi-rx-bus-width:
>>>> +          const: 4
>>>> +
>>>> +        spi-tx-bus-width:
>>>> +          const: 4
>>>> +
>>>> +else:
>>>> +  patternProperties:
>>>> +    "^.*@[0-9a-f]+$":
>>>> +      type: object
>>>> +      properties:
>>>> +        reg:
>>>> +          minimum: 0
>>>> +          maximum: 3
>>>> +
>>>> +        spi-rx-bus-width:
>>>> +          const: 1
>>>> +
>>>> +        spi-tx-bus-width:
>>>> +          const: 1
>>>
>>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
>>
>> 8 too? sure.
>>
>>> irrespective from the compatible string. The modern DW APB SSI
>>> controllers of v.4.* and newer also support the enhanced SPI Modes too
>>> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
>>> run-time there is no way to create a DT-schema correctly constraining
>>> the Rx/Tx SPI bus widths. So let's keep the
>>> compatible-string-independent "patternProperties" here but just extend
>>> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
>>> properties values.
>>
>> SGTM!
>>
>>>
>>> Note the DW APB SSI/AHB SSI driver currently doesn't support the
>>> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
>>> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
>>> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
>>> activated by means of the corresponding CSR. So most likely the DW AHB
>>> SSI controllers need some specific setups too.
>>
>> hmm, well I'll leave that up to people that have Canaan hardware!
> 
> I will test this series.
> 

Cool, thanks.
I'll try to get a respin out tomorrow w/ the memory node "unfixed".
Conor.

>> Thanks,
>> Conor.
>>
>>>
>>> -Sergey
>>>
>>>>
>>>>  unevaluatedProperties: false
>>>>
>>>> --
>>>> 2.36.1
>>>>
>>
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
