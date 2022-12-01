Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64316C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIGxpKZOSkbLR9D9i+dZK/YcZkhWDW5RSEG1NmIyZbY=; b=QvD5GRjRDwjt6i
	4E/kQ2yTczWOxIwb93fDvMalS0zSXhEUKXU0CRLJgivKh/HcjSLZLi1u1OqfyirKynaodFQRs+/YE
	7trNQSC9Q2TpFbgm8pyGmdJDnzY9X96Rt7pUMv5eju+kpCNz1/1IRENVuoiMlYEXw+H2fLGUAdkJ3
	wqEDNXyfxsk8U/Ip0lNjKoAmKylnO5N6/A8GsnHMMxNc5DyAGCj7YM3b1vWr6+1rAe8TbvFejZ1PV
	NvvpYGf1LKSV085MKDERh2PcMHnTy4dphF0U6H7aTpuc/u7OvMsfVdkal1xtH6hBrz7evVN71KXSY
	+d9r4N28M7o2UtbfPElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fSk-0068EM-WD; Thu, 01 Dec 2022 09:02:35 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fSg-00684J-CS
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:02:33 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6D70224E255;
	Thu,  1 Dec 2022 17:01:58 +0800 (CST)
Received: from EXMBX064.cuchost.com (172.16.6.64) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 17:01:58 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX064.cuchost.com
 (172.16.6.64) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 17:01:57 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Thu, 1 Dec 2022 17:01:58 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
 driver
Thread-Topic: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive
 crypto driver
Thread-Index: AQHZBH/2P5dLP9b8iUC7OZp9LCFzsa5W7gcAgAHFddA=
Date: Thu, 1 Dec 2022 09:01:58 +0000
Message-ID: <aa388c8c99b74436ad556aeb47a5c60a@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-6-jiajie.ho@starfivetech.com>
 <8a8f502e-e0ed-d638-0b56-74edcbca2134@linaro.org>
In-Reply-To: <8a8f502e-e0ed-d638-0b56-74edcbca2134@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_010230_741694_98B1E09C 
X-CRM114-Status: GOOD (  27.50  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Wednesday, November 30, 2022 9:21 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; David S . Miller <davem@davemloft.net>;
> Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH 5/6] dt-bindings: crypto: Add bindings for Starfive crypto
> driver
> 
> On 30/11/2022 06:52, Jia Jie Ho wrote:
> > Add documentation to describe Starfive crypto driver bindings.
> 
> Please wrap commit message according to Linux coding style / submission
> process:
> https://elixir.bootlin.com/linux/v5.18-
> rc4/source/Documentation/process/submitting-patches.rst#L586
> 
> 
> Subject: drop second, redundant "bindings".
> 
> 

I'll fix the commit title and message in the next version.

> >
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > ---
> >  .../bindings/crypto/starfive-crypto.yaml      | 109 ++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
> > b/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
> > new file mode 100644
> > index 000000000000..6b852f774c32
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
> 
> Filename based on compatible, so starfive,jh7110-crypto.yaml
> 

Will update filename.

> > @@ -0,0 +1,109 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/crypto/starfive-crypto.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive Crypto Controller Device Tree Bindings
> 
> Drop "Device Tree Bindings"
> 

Will update title.

> > +
> > +maintainers:
> > +  - Jia Jie Ho <jiajie.ho@starfivetech.com>
> > +  - William Qiu <william.qiu@starfivetech.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: starfive,jh7110-crypto
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  reg-names:
> > +    items:
> > +      - const: secreg
> 
> Why do you need reg-names for one entry?
> 

Will remove need of reg-names and update probe function accordingly.

> > +
> > +  clocks:
> > +    items:
> > +      - description: Hardware reference clock
> > +      - description: AHB reference clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: sec_hclk
> > +      - const: sec_ahb
> 
> sec seems redundant, so just "ahb". The first clock then "hclk" or "ref"?
> 

Will fix in next version.

> > +
> > +  interrupts:
> > +    items:
> > +      - description: Interrupt pin for algo completion
> > +      - description: Interrupt pin for DMA transfer completion
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: secirq
> > +      - const: dmairq
> 
> Drop "irq" from both.
> 

Will fix.

> > +
> > +  resets:
> > +    items:
> > +      - description: STG domain reset line
> > +
> > +  reset-names:
> > +    items:
> > +      - const: sec_hre
> 
> Drop "sec". Why do you need the names for one entry?
> 

Will remove names.

> > +
> > +  enable-side-channel-mitigation:
> > +    description: Enable side-channel-mitigation feature for AES module.
> > +        Enabling this feature will affect the speed performance of
> > +        crypto engine.
> > +    type: boolean
> 
> Why exactly this is a hardware (DT) property, not runtime?
> 

This is a hardware setting provided in StarFive crypto engine only.
The crypto API doesn't control this setting during runtime and leaving this always on will impact speed performance.
So, I added this property to allow user to control this in dtb.

> > +
> > +  enable-dma:
> > +    description: Enable data transfer using dedicated DMA controller.
> > +    type: boolean
> 
> Usually the presence of dmas indicates whether to use or not to use DMA.
> Do you expect a case where DMA channels are provided by you don't want
> DMA? Explain such case and describe why it is a hardware/system integration
> property.
> 

I'll remove this property as DMA is always enabled.

> > +
> > +  dmas:
> > +    items:
> > +      - description: TX DMA channel
> > +      - description: RX DMA channel
> > +
> > +  dma-names:
> > +    items:
> > +      - const: sec_m
> 
> tx
> 

Will fix.

> > +      - const: sec_p
> 
> rx
> 

Will fix.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/starfive-jh7110.h>
> > +    #include <dt-bindings/reset/starfive-jh7110.h>
> > +
> > +    soc {
> > +            #address-cells = <2>;
> > +            #size-cells = <2>;
> 
> Use 4 spaces for example indentation.

I'll fix the indentation.

Thank you for taking time to review and provide helpful comments for this patch.

Best regards,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
