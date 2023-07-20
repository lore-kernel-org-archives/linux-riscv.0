Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16E8EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiVV5bBU89ewj/JtcZGlCwHQN61VqZm4XGBQDVfatPI=; b=1HZ4gOUlBLUkVv
	U54O9vIjODQzPN6uAEtyzJQZJQS4UastiPpz5GUUJh/G1ID7vq1zciTGzoL/D+qnnS9MTIBPGVZBC
	iSV8e6kRAGCd3z12bCxyiSiapnb05tPkVFaxaCwxdnASZShELkRQvYe43H44WPKHY6OTmbSmi41HS
	eIn7fdEbAlFX2fa/0vaesazNHcjBIYChDQ3AGJnJFEd9kSVUgbjiiGTPC1N7Ae3HhKijnmm8RCme8
	Ul5dI46mV8jsndDd7mGF/W3pGNkLg+/hReFT7qCIWGKlxq9ncPx6RHVXVUM+pnafer7iiStixAt95
	q66Zm+okB4Dpt/zXd9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNh4-00A2dk-1E;
	Thu, 20 Jul 2023 07:03:22 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNh1-00A2cd-0K
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 07:03:21 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D10C724E3C2;
	Thu, 20 Jul 2023 15:03:00 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 15:03:00 +0800
Received: from [192.168.125.127] (113.72.147.86) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 15:02:59 +0800
Message-ID: <8e78ffd6-1cec-ad3b-7809-1b0350bef935@starfivetech.com>
Date: Thu, 20 Jul 2023 15:02:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 5/9] dt-bindings: PLDA: Add PLDA XpressRICH PCIe host
 controller
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
 <20230719102057.22329-6-minda.chen@starfivetech.com>
 <20230719222900.GA882340-robh@kernel.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230719222900.GA882340-robh@kernel.org>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_000319_467967_DC77B005 
X-CRM114-Status: GOOD (  12.66  )
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



On 2023/7/20 6:29, Rob Herring wrote:
> On Wed, Jul 19, 2023 at 06:20:53PM +0800, Minda Chen wrote:
>> Add PLDA XpressRICH host controller dt-bindings. Both Microchip
>> PolarFire SoC and StarFive JH7110 SoC are using PLDA XpressRICH
>> PCIe host controller IP.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../pci/plda,xpressrich-pcie-host.yaml        | 66 +++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
>> new file mode 100644
>> index 000000000000..10a10862a078
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/plda,xpressrich-pcie-host.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/plda,xpressrich-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: PLDA XpressRICH PCIe host controller
>> +
>> +maintainers:
>> +  - Daire McNamara <daire.mcnamara@microchip.com>
>> +  - Minda Chen <minda.chen@starfivetech.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/pci-bus.yaml#
>> +  - $ref: plda,xpressrich-pcie-common.yaml#
>> +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: plda,xpressrich-pcie-host
> 
> What h/w is this in? I don't see why this is needed. You have the common 
> schema for the IP block and then the Microchip and Starfive schemas for 
> the 2 implementations.
> 
> Rob
OK. I will delete this patch and pcie-plda-plat.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
