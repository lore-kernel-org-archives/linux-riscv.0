Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3F3C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 07:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMEEmGMRCYD+bs7cVL5EAT/EmkaAGzMbsR3oga571is=; b=sla1h1IaOuhciV
	5gzu7lEBx9oaTER/7GugVJZD67+HgqoXDfhFzhKHt4Ejbi/yLTKPlxTlRoPW2KTinGp84+aDr2pJJ
	sW9sbJDEW27Wq5UZCmH2UV8A9U681rnA6B4ECkAPpem2i4uOEyGSRcq5WoT9RDx/ms2pVgha8BgoC
	GmLyHDY6xnwH/6Jh/6DAowXkeFEUt98sfUSBm/f8MndW6aKuMYwuHbg1AGzceHyiJIYi/pm/bIxm8
	ZisRQuYeekPq7AQR0hajGR4dgMZCg8MzHfZAQ5Ot7kmMoUgAHJOMj150ddXbnadxFVaZ3/BAVhGY8
	B5XmYs7qHXF7V/GsQoaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNr0N-00FCQT-Jp; Tue, 16 Aug 2022 07:28:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNqx9-00F6ZX-KE
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 07:25:33 +0000
Received: by mail-lf1-x133.google.com with SMTP id c28so9595347lfh.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ooE16zehdw/Qev5T+ZmUnjytAB9yy5ywmdc6ijRB7DU=;
        b=vsbEHpL2RqIY2QslVwDqFfp3XtMgHpHexPeU7C7kkWJq9Vq0XI2sRGSqgt5nWsO1hm
         +T5H7I3m0VVO7Yygf/ziEdb826My+optK01l52i8aQPhSGBi+y4MkCZ2dLgcR1et5mGa
         N9m32uGyTjvej0rn9DPJiXTvSL4HY4BlnKWuP+YkgjAYdqUuvC3cB1YIF4vX7rQQ4kf5
         JWH7/zpvE4X1qvrDhyPss0d3EBSVe46JZkl5u145kQLkNV+KKV8J9E3p+uIvAcBNng/2
         Cn2LYpunvdGkkOwInxwuCuHNobZOTstauY/+ZLjaJBZb+IKB1BisMwJKdL00sRrOkDyr
         0Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ooE16zehdw/Qev5T+ZmUnjytAB9yy5ywmdc6ijRB7DU=;
        b=c6LVV/I15f2Nry1EkX75S+J7H/NCFu7kpxQTB5YAarU0QNRalByNLXpWKCW8uep9hn
         AFxMfcpDnRLu82p0Gsuip0vnFiW7bGLVLZRo333zmOwy3Mpum8lGrKwbilNRAb+payOW
         tR3PX/PZY8O2NKKO11oMLeQaLJAlN7OWSCrBi7KFjqXrm8tqVeLH0+kEMsBhOYFkoBub
         hA2NS8GBvffTd7cXHMVmH7h7159NnK+9qgF3WI/DYCecE0B57hQSfgHrrAqUDOW0a3SF
         J79QTxQiHVvKBr28I/rg0IvYwBVYmETen9esFDxyJvIqr9eGD7oTxu5SEFxnEvwYoYO4
         gHxw==
X-Gm-Message-State: ACgBeo0H7huAtNibgmuQCQCqQbdPC/e31YVF+XmVZAnRY96Hbd4yqiSZ
	d336xx15cPU2AvdVU28MtN0pUA==
X-Google-Smtp-Source: AA6agR4AvhM4cDhXvQ1UTG+En6e9pMhUjfadNQTORfvzlu9ebxyZUTSlog8Wr6qGvgUaMN87z3ocDA==
X-Received: by 2002:a19:d611:0:b0:492:8e15:ba18 with SMTP id n17-20020a19d611000000b004928e15ba18mr2268836lfg.524.1660634728747;
        Tue, 16 Aug 2022 00:25:28 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id bd18-20020a05651c169200b0025e5b5474a4sm1706639ljb.85.2022.08.16.00.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:25:28 -0700 (PDT)
Message-ID: <febf654a-66ad-48e2-072c-7e1f4b521964@linaro.org>
Date: Tue, 16 Aug 2022 10:25:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 clocks properties
Content-Language: en-US
To: Conor.Dooley@microchip.com, mail@conchuod.ie,
 Daire.McNamara@microchip.com, bhelgaas@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 greentime.hu@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 lpieralisi@kernel.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-3-mail@conchuod.ie>
 <99b5bddb-4a09-a3ac-e01b-d0ae624ad2f8@linaro.org>
 <d25f8901-b9d7-ae8e-0061-2a033af16693@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d25f8901-b9d7-ae8e-0061-2a033af16693@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_002531_741748_4F55DA56 
X-CRM114-Status: GOOD (  31.42  )
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

On 14/08/2022 16:47, Conor.Dooley@microchip.com wrote:
> On 12/08/2022 08:35, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 11/08/2022 23:33, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Upgrading dt-schema to v2022.08 reveals unevaluatedProperties issues
>>> that were not previously visible, such as the missing clocks and
>>> clock-names properties for PolarFire SoC's PCI controller:
>>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
>>>         From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>>
>>> The clocks are required to enable interfaces between the FPGA fabric
>>> and the core complex, so add them to the binding.
>>>
>>> Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  .../bindings/pci/microchip,pcie-host.yaml     | 25 +++++++++++++++++++
>>>  1 file changed, 25 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>> index edb4f81253c8..2a2166f09e2c 100644
>>> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>> @@ -25,6 +25,31 @@ properties:
>>>        - const: cfg
>>>        - const: apb
>>>
>>> +  clocks:
>>> +    description:
>>> +      Fabric Interface Controllers, FICs, are the interface between the FPGA
>>> +      fabric and the core complex on PolarFire SoC. The FICs require two clocks,
>>> +      one from each side of the interface. The "FIC clocks" described by this
>>> +      property are on the core complex side & communication through a FIC is not
>>> +      possible unless it's corresponding clock is enabled. A clock must be
>>> +      enabled for each of the interfaces the root port is connected through.
>>> +    minItems: 1
>>> +    items:
>>> +      - description: FIC0's clock
>>> +      - description: FIC1's clock
>>> +      - description: FIC2's clock
>>> +      - description: FIC3's clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      enum:
>>> +        - fic0
>>> +        - fic1
>>> +        - fic2
>>> +        - fic3
>>> +    minItems: 1
>>> +    maxItems: 4
>>
>> No need for maxItems.
> 
> I brought this up on IRC, but transferring it here since it's been
> an (understandable!!) few days & just didn't want things to get lost
> if my net died. Cutting out the back & forth, in summary:
> "
> I'm trying to remove the maxItems from the clock-names array you
> didn't like - but I can't figure out what to do instead that doesn't
> trigger errors. All 4 clocks are optional, the only requirement is
> that any one of them is present. Either I seem to get complaints that
> my property is not an array (simply removing the maxItems) or complaints
> that because I have clock0,1,3 and not 2 that clock3 is unexpected.

Eh, I misread the code and thought that you list the items, but you just
enumerate the schema for each item. My advice was wrong, you need maxItems.

> The root port is physically on the opposite side of the FPGA to the cpus
> & the AXI connection is through the FPGA fabric. There are 4 AXI
> interconnects to the fabric  which the PCI controller could in theory be
> connected to all 4, but it only needs to be connected to one.. I had
> done done minItems and maxItems a la:
> devicetree/bindings/watchdog/st,stm32-iwdg.yaml
> b/c that seems to have two clocks that it doesnt care about the order of
> "
> 
> Rob then suggested:
> "
> I would remove the 'items' list in 'clocks' and make the description
> clear that any of clocks is possible. It's not ideal, but it's a case of
> that's what is already there.
> "
> 
> I'd then have something along the lines of:
>   clocks:
>     description:
>       Fabric Interface Controllers, FICs, are the interface between the FPGA
>       fabric and the core complex on PolarFire SoC. The FICs require two clocks,
>       one from each side of the interface. The "FIC clocks" described by this
>       property are on the core complex side & communication through a FIC is not
>       possible unless it's corresponding clock is enabled. A clock must be
>       enabled for each of the interfaces the root port is connected through.
>       This could in theory be all 4 interfaces, one interface or any combination
>       in between.
>     minItems: 1
>     maxItems: 4
> 
>   clock-names:
>     items:
>       enum:
>         - fic0
>         - fic1
>         - fic2
>         - fic3
>     minItems: 1
>     maxItems: 4
> 
> Does that seem reasonable to you?


Yes.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
