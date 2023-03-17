Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2F7C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfEEezbXvJv2S04VZnFwSo5SvOZtUATZnkFAdEAHa44=; b=imiQtSkpjhmk6v
	Y7L89N18IMf/aT19fikt+NRNmi6vm3uNc2zf/XWObVSB0TM5P577oUWN1KMMiXQYYa/N5mCyWQ2Kk
	+KG62mjcaWSsWlFB5YovX6KVyw0O5xBIa3KP8rLzCTD2uzuyKlav9SXFFKaKSbp/Qit+wisPv65tc
	RMhWjw22siFzxwzPF6RyHy208C3LO6ESVrQNwU+/r+5U7f1FTqO8IP6OSJDNd+u39jv96RHFO+3An
	mi9GNx8tC3ETMQlRvGATcQpTuixnT+PWSy/u9/ZFsTl2w/wNAZhrKd1gI4swTUjdSQwsoPwhsXd2g
	s27NUhR43ZVwimgk3m4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd7Mi-001ubR-1p;
	Fri, 17 Mar 2023 10:31:16 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd7Mf-001uZD-1F;
	Fri, 17 Mar 2023 10:31:15 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 50F1D24E289;
	Fri, 17 Mar 2023 18:30:41 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 18:30:41 +0800
Received: from [192.168.125.108] (113.72.145.194) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 18:30:40 +0800
Message-ID: <e304283e-c564-527a-b1a3-0a04b80604d0@starfivetech.com>
Date: Fri, 17 Mar 2023 18:30:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/5] dt-binding: Add JH7110 USB wrapper layer doc.
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
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-4-minda.chen@starfivetech.com>
 <451c8112-c7f3-f435-5d90-840f01c60bd5@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <451c8112-c7f3-f435-5d90-840f01c60bd5@linaro.org>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX071.cuchost.com
 (172.16.6.81)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_033113_717367_E5A076C6 
X-CRM114-Status: GOOD (  17.28  )
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



On 2023/3/17 16:43, Krzysztof Kozlowski wrote:
> On 15/03/2023 11:44, Minda Chen wrote:
>> The dt-binding doc of Cadence USBSS-DRD controller wrapper
>> layer.
> 
> Subject: drop full stop. It's not a sentence.
> 
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).
> 
> 
Thanks. I should check all the commits title and commit messages.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  .../bindings/usb/starfive,jh7110-usb.yaml     | 119 ++++++++++++++++++
>>  1 file changed, 119 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> new file mode 100644
>> index 000000000000..b1a8dc6d7b4b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/starfive,jh7110-usb.yaml
>> @@ -0,0 +1,119 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/starfive,jh7110-usb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 wrapper module for the Cadence USBSS-DRD controller
>> +
>> +maintainers:
>> +  - Minda Chen <minda.chen@starfivetech.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-usb
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
>> +      - description: APB reset
>> +      - description: AXI reset
>> +      - description: UTMI_APB reset
>> +
>> +  starfive,sys-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      items:
>> +        - description: phandle to System Register Controller sys_syscon node.
>> +        - description: offset of SYS_SYSCONSAIF__SYSCFG register for USB.
>> +    description:
>> +      The phandle to System Register Controller syscon node and the offset
>> +      of SYS_SYSCONSAIF__SYSCFG register for USB.
>> +
>> +  starfive,stg-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      items:
>> +        - description: phandle to System Register Controller stg_syscon node.
>> +        - description: register0 offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +        - description: register1 offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +        - description: register2 offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +        - description: register3 offset of STG_SYSCONSAIF__SYSCFG register for USB.
>> +    description:
>> +      The phandle to System Register Controller syscon node and the offset
>> +      of STG_SYSCONSAIF__SYSCFG register for USB. Total 4 regsisters offset
>> +      for USB.
>> +
>> +  "#address-cells":
>> +    maximum: 2
> 
> enum: [ 1, 2 ]
> (because 0 should not be valid for you)
> 
>> +
>> +  "#size-cells":
>> +    maximum: 2
> 
> ditto
> 
ok
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^usb@[0-9a-f]+$":
>> +    type: object
> 
> missing $ref and unevaluatedProperties: false
> 
ok, thanks
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - starfive,sys-syscon
>> +  - starfive,stg-syscon
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +additionalProperties: false
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
