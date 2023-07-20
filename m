Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DACEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCQkesGX/WqG/JYBOPilh7KhMJERC92uvbGr40yeLe8=; b=w3pQEAjNInOoEL
	LacV95lrLM63J6Oris9PObrtd5QTe7yMuwydEe98UKmJPJ+gcbG4cbT1HvL3EZDs0VS99Aw8y8O9m
	BWi5buOUsQQbRe9oS+bzj4PsqbNDTpKTej65XaE3Vc6nBE2tCrK2C0n45X7RpepDzIvF/So/z9eDU
	QDp+a9LXGdTKI6Ww9JDxqRvy6GpQEiNWQJoC7TAoy3kleGq3owycF56PBaVxN3sgzHAJVKNrl0yhY
	VgG0Lcb1QSvK1r4imk4W9beW0HAvUCJDWZZ1ykkuHpEcWnz3T1R8yG304291bAncaEo2mdDVVtJu1
	zN1UO9lnryoeH/nGz/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNdi-00A20C-2Q;
	Thu, 20 Jul 2023 06:59:54 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNde-00A1vY-1o
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:59:53 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 21FB424E3BF;
	Thu, 20 Jul 2023 14:59:27 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 14:59:27 +0800
Received: from [192.168.125.127] (113.72.147.86) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 14:59:23 +0800
Message-ID: <5e4d5920-f346-a6ae-8548-f70d9fa911fe@starfivetech.com>
Date: Thu, 20 Jul 2023 14:59:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/9] dt-bindings: PCI: Add PLDA XpressRICH PCIe host
 common properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Conor Dooley <conor@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-2-minda.chen@starfivetech.com>
 <c1dea7c8-2bc4-a113-0d40-098228fe3860@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <c1dea7c8-2bc4-a113-0d40-098228fe3860@linaro.org>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_235950_957017_24990828 
X-CRM114-Status: GOOD (  15.66  )
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



On 2023/7/19 18:52, Krzysztof Kozlowski wrote:
> On 19/07/2023 12:20, Minda Chen wrote:
>> Add PLDA XpressRICH PCIe host common properties dt-binding doc.
>> Microchip PolarFire PCIe host using PLDA IP.
>> Extract properties from Microchip PolarFire PCIe host.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../pci/plda,xpressrich-pcie-common.yaml      | 72 +++++++++++++++++++
>>  1 file changed, 72 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-common.yaml
> 
> How is it related with existing plda,xpressrich3-axi?
> 
 yes, I just found plda,xpressrich3-axi. It is same IP in ARM juno soc. But it is firmware-initialized while microchip and starfive not.
maybe I can rename this file to plda,xpressrich3-axi-common.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-common.yaml b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-common.yaml
>> new file mode 100644
>> index 000000000000..3627a846c5d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-common.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/plda,xpressrich-pcie-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: PLDA XpressRICH PCIe host common properties
>> +
>> +maintainers:
>> +  - Daire McNamara <daire.mcnamara@microchip.com>
>> +  - Minda Chen <minda.chen@starfivetech.com>
>> +
>> +description:
>> +  Generic PLDA XpressRICH PCIe host common properties.
>> +
>> +select: false
> 
> This should not be needed.
> 
ok
>> +
>> +properties:
>> +  reg:
>> +    description:
>> +      At least host IP register set and configuration space are
> 
> "At least" does not fit here since you do not allow anything else.
> 
I will delete "At least"
>> +      required for normal controller work.
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    oneOf:
>> +      - items:
>> +          - const: cfg
>> +          - const: apb
>> +      - items:
>> +          - const: host
>> +          - const: cfg
> 
> Maybe keep similar order, so cfg followed by host?
> 
I will follow cfg, apb
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
