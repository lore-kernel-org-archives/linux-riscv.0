Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28B9C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 10:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiC7NDyMk+4gbZhpy7Bw1dHJOe25Q8D1hQdMfijG4zg=; b=f4jSBiskIr47e2
	v1ioorHt2cJUAy2DJ0uZIaxMBwZXtZx7A1by1JC555ZuXRF2rk2N58X9hV0Aau8uHfX4GkAsHpdW1
	pbvy5MsQU2uUQJjh809178edcddlY2UBCteH21eW9I/jWViliw0gBOOr+S3/EnsOCOiH5m5PIf2V5
	1exOO+mv9E2TlPEAtIPXDNbq68WnqxrWYQEspHUkqo2a5lyGgx+qjY3LlJR6GttgDzMpmj3IOSkQ+
	MTSelcFYLGo8K7aENzjuwP8boWdhglz+9q+DjkLT2e8RLEBVR43no+WInxr0abZ5lziA9A7Es1bFg
	88QaL6Iev4+aqTipeqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawkR-00Alhg-PA; Wed, 21 Sep 2022 10:14:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oawkE-00AldU-2A; Wed, 21 Sep 2022 10:14:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2E9313D5;
	Wed, 21 Sep 2022 03:14:20 -0700 (PDT)
Received: from [10.57.18.118] (unknown [10.57.18.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71CA13F73D;
	Wed, 21 Sep 2022 03:14:11 -0700 (PDT)
Message-ID: <567e9e6c-e34c-4ded-9622-9ad8387dd24b@arm.com>
Date: Wed, 21 Sep 2022 11:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Similar SoCs with different CPUs and interrupt bindings
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel@sholland.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Atish Patra <atishp@atishpatra.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
References: <CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com>
 <b0f2e13a-ff5d-5bfc-6dda-ca39bb57803e@linaro.org>
 <CA+V-a8t3ukpa1PNz=5fP+BTjWkFJmwDo_EJJYjO9YctF2=K1Vg@mail.gmail.com>
 <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <df9ff0bd-ad0e-4b5b-859d-dd913628edc8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_031418_248933_1E100C0F 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-09-21 10:26, Krzysztof Kozlowski wrote:
> On 21/09/2022 11:20, Lad, Prabhakar wrote:
>>>
>>> What do you mean? Macros support string concatenation and simple
>>> arithmetic like adding numbers. I just tested it.
>>>
>> I did try the below:
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>> b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>> index 689aa4ba416b..0f923c276cd3 100644
>> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
>> @@ -8,6 +8,8 @@
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/clock/r9a07g043-cpg.h>
>>
>> +#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr na
>> +
>>   / {
>>       compatible = "renesas,r9a07g043";
>>       #address-cells = <2>;
>> @@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
>>               compatible = "renesas,r9a07g043-ssi",
>>                        "renesas,rz-ssi";
>>               reg = <0 0x1004a000 0 0x400>;
>> -            interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
>> +            interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,
>>                        <GIC_SPI 331 IRQ_TYPE_EDGE_RISING>,
>>                        <GIC_SPI 332 IRQ_TYPE_EDGE_RISING>,
>>                        <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>;
>>
>> This worked as expected, but couldn't get the arithmetic operation
>> working. Could you please provide an example?
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> index ff6aab388eb7..0ecca775fa3f 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> @@ -8,6 +8,8 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/r9a07g043-cpg.h>
>   
> +#define SOC_PERIPHERAL_IRQ_NUMBER(na)  (na + 32)
> +#define SOC_PERIPHERAL_IRQ(nr, na) GIC_SPI nr SOC_PERIPHERAL_IRQ_NUMBER(na)
>   / {
>          compatible = "renesas,r9a07g043";
>          #address-cells = <2>;
> @@ -128,7 +130,7 @@ ssi1: ssi@1004a000 {
>                          compatible = "renesas,r9a07g043-ssi",
>                                       "renesas,rz-ssi";
>                          reg = <0 0x1004a000 0 0x400>;
> -                       interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +                       interrupts = <SOC_PERIPHERAL_IRQ(330, IRQ_TYPE_LEVEL_HIGH)>,
> 
> 
> 
> Or any other method like that....

Which will generate the text:

	"interrupts = <GIC_SPI 330 (IRQ_TYPE_LEVEL_HIGH + 32)>,"

(give or take some whitespace)

CPP supports constant expressions in #if and #elif directives, but 
macros are purely literal text replacement. It might technically be 
achievable with some insane CPP metaprogramming, but for all practical 
purposes this is a non-starter unless dtc itself grows the ability to 
process arithmetic expressions.

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
