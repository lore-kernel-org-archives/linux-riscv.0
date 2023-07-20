Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31058EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C46VdxnWGc9GPCRhfp2LaP+y8LSQ/HJUqt6Ipoapi1k=; b=Mf/29Qj4yjGTRs
	lQHhQxuBn3ThTZirdLxsg4NIq1KOFFucvDAQSgm57A30jldwTWoNoO/X6ezXCYG93EkEK6qerbaJP
	uybau+u0ClWUbUjkOAKueFJGSQETw00OhgqFCOzEAHkjZS9Mm0I+ljU97L50VxcqKtM23S69o/GMd
	6RRNsWZ9FP1DzI6L2BCHfaJCY9joHkXiPkEHuRWzN6pwqN3dKwflHUTFkU6BwmjcYV+uOP43gIg1w
	7l4VmzDIuPe5lnsYDre5thgsM0ZTIzBVQDB/GUXABkfqen7z/sFagaTq11/Bq/LRh213w4VHZbKDA
	0yIBw6WZP6Dsvfk9tm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNS6-009zOY-34;
	Thu, 20 Jul 2023 06:47:54 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNS2-009zIm-0u
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:47:53 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A08178803;
	Thu, 20 Jul 2023 14:47:12 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 14:47:12 +0800
Received: from [192.168.125.127] (113.72.147.86) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 14:47:11 +0800
Message-ID: <285bcdc4-832f-c278-7a14-7ccf295aaa09@starfivetech.com>
Date: Thu, 20 Jul 2023 14:47:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/9] dt-bindings: PCI: Add PLDA XpressRICH PCIe host
 common properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
	<kw@linux.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-2-minda.chen@starfivetech.com>
 <20230719223124.GB882340-robh@kernel.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230719223124.GB882340-robh@kernel.org>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_234750_700416_C00F9BCD 
X-CRM114-Status: GOOD (  11.22  )
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



On 2023/7/20 6:31, Rob Herring wrote:
> On Wed, Jul 19, 2023 at 06:20:49PM +0800, Minda Chen wrote:
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
>> +
>> +properties:
>> +  reg:
>> +    description:
>> +      At least host IP register set and configuration space are
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
> This didn't exist before. Where's the reasoning?
> 
> There's no reason for 'cfg' to be in different spots and little reason 
> to have different names for the host/apb space.
> 
> Rob
> 
ok, I will follow cfg and apb

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
