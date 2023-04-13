Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB66AC77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MgZ/x+WT3VUnkE6t0Eyl26gPt99yr5cDgohQHENjMI=; b=tUya25Vb3N1Huu
	ld4dD+1S3nONkNdtdZTxDCqWqtOMDKv7fw+g4CtxQULA3bzGnc/4ZYn/Wo3m2ihtI455yZAMkkwDD
	W0v1LSWuMmdZxqRSG1Z/SheUOFe1S/Jp9SpABkXs2ROdTVeURGmZYGr0YnvAPWFUPrZJ7vwUbLAfa
	RFGznhnS6+rs6C9OBiva7yJn7eQlZFaC69z/cw/2Cgnu/pguPdPGwWj50B4RswYVvKhp7+1JCEM/o
	pirA6hkqa2DZ7yua5aPsP7oQ24M7E8CJCulC1jYfNMAhipWg1GIbhdVcp4prY0KtnaJJ4msbGckgh
	EHOrBqA30k6qGbbh1+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuQE-005uCs-2j;
	Thu, 13 Apr 2023 10:43:22 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmuQ8-005trP-2z;
	Thu, 13 Apr 2023 10:43:20 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6A80224E2AE;
	Thu, 13 Apr 2023 18:42:30 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 18:42:30 +0800
Received: from [192.168.125.108] (183.27.97.249) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Apr
 2023 18:42:29 +0800
Message-ID: <fc30ac6c-7103-f601-429f-c9a180869284@starfivetech.com>
Date: Thu, 13 Apr 2023 18:42:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 5/7] dt-bindings: usb: Add StarFive JH7110 USB Bindings
 YAML schemas
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Mason Huo" <mason.huo@starfivetech.com>
References: <20230406015216.27034-1-minda.chen@starfivetech.com>
 <20230406015216.27034-6-minda.chen@starfivetech.com>
 <a22dff0a-56e6-be1b-10b2-ce3b31f420c5@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <a22dff0a-56e6-be1b-10b2-ce3b31f420c5@linaro.org>
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_034317_302475_2B190016 
X-CRM114-Status: GOOD (  18.11  )
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



On 2023/4/12 16:32, Krzysztof Kozlowski wrote:
> On 06/04/2023 03:52, Minda Chen wrote:
>> StarFive JH7110 platforms USB have a wrapper module around
>> the Cadence USBSS-DRD controller. Add binding information doc
>> for that.
> 
> That's one of the most redundant subjects I saw. You basically used four
> words for one meaning. These are not exactly synonyms, but they all are
> either imprecise or meaning the same.
> 
> Subject: drop second/last, redundant "Bindings YAML schemas". The
> "dt-bindings" prefix is already stating that these are bindings.
> 
> 
ok
> 
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>> ---
>>  .../bindings/usb/starfive,jh7110-usb.yaml     | 136 ++++++++++++++++++
>>  1 file changed, 136 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> new file mode 100644
>> index 000000000000..c8b30b583854
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> @@ -0,0 +1,136 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller
> 
> What do you wrap here? Are you sure this is a wrapper? I think this is
> just USB controller?
> 
Since the previous version is wrapper module. I forgot change this.
I will change to "StarFive JH7110 Cadence USBSS-DRD SoC controller"
>> +
>> +maintainers:
>> +  - Minda Chen <minda.chen@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-usb
>> +
>> +  reg:
>> +    items:
>> +      - description: OTG controller registers
>> +      - description: XHCI Host controller registers
>> +      - description: DEVICE controller registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: otg
>> +      - const: xhci
>> +      - const: dev
>> +
>> +  interrupts:
>> +    items:
>> +      - description: XHCI host controller interrupt
>> +      - description: Device controller interrupt
>> +      - description: OTG/DRD controller interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: host
>> +      - const: peripheral
>> +      - const: otg
>> +
>> +  clocks:
>> +    items:
>> +      - description: lpm clock
>> +      - description: stb clock
>> +      - description: apb clock
>> +      - description: axi clock
>> +      - description: utmi apb clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: lpm
>> +      - const: stb
>> +      - const: apb
>> +      - const: axi
>> +      - const: utmi_apb
>> +
>> +  resets:
>> +    items:
>> +      - description: PWRUP reset
>> +      - description: APB clock reset
>> +      - description: AXI clock reset
>> +      - description: UTMI_APB clock reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: pwrup
>> +      - const: apb
>> +      - const: axi
>> +      - const: utmi
>> +
>> +  starfive,stg-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      items:
> 
> Same problem as for other patches.
> 
I am sorry about this. I should change this in this version.
PCIe PHY dt-binding doc will be also changed. 
>> +        - description: phandle to System Register Controller stg_syscon node.
>> +        - description: register offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +    description:
>> +      The phandle to System Register Controller syscon node and the offset
>> +      of STG_SYSCONSAIF__SYSCFG register for USB.
>> +
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
