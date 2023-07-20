Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAB3C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 02:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UR72WrfBzj2pGmAIstrZmQoTc3egh8TlEct6TRxGzgY=; b=dpOqZV+b91LAa2
	W0LyCUYGaKPwqyRhUP+J2aIC/oiWj1bGre/lY/5796CH6sfgDUftZdBfbE/KOwing82XfiGFAUtnV
	sxcnmzYXeDZtwDLIYe0sPrhvxZ04cEv+iXCj2YlHf/6hVorCsbbtkJaE5kRv5AoSGNpDBl2MMABz+
	/vAPm/iOKo+HNHzUQ+TUO2UPFBuY3YNQhiVZDkslkAemfw5bWf6QWRzMmxqyoOSqYunNJpZ6ZkFBe
	oTQKwOwoEzmerFRGt/73ahj3suNAefUVvGUcov8vPMdBY07sjSPIxqEMDhwEzgsf54w5IB0MmfGV8
	DjBdJSc/MC9XNQmGXvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMJDT-009XJA-1P;
	Thu, 20 Jul 2023 02:16:31 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMJDO-009XHD-33
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 02:16:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3FCC580C5;
	Thu, 20 Jul 2023 10:15:54 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 10:15:54 +0800
Received: from [192.168.125.127] (113.72.147.86) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 20 Jul
 2023 10:15:53 +0800
Message-ID: <52ebc991-0e73-8df4-61b2-32989ab4e62c@starfivetech.com>
Date: Thu, 20 Jul 2023 10:15:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 0/9] Refactoring Microchip PolarFire PCIe driver
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230719152626.GA502469@bhelgaas>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230719152626.GA502469@bhelgaas>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_191627_346152_87A46ED3 
X-CRM114-Status: GOOD (  15.91  )
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



On 2023/7/19 23:26, Bjorn Helgaas wrote:
> On Wed, Jul 19, 2023 at 06:20:48PM +0800, Minda Chen wrote:
>> This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
>>   dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
>> JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
>> same IP and have commit their codes, which are mixed with PLDA
>> controller codes and Microchip platform codes.
> 
> I guess this actually adds TWO drivers: PCIE_PLDA_PLAT_HOST (claims
> "plda,xpressrich-pcie-host" devices) and PCIE_STARFIVE_HOST (claims
> "starfive,jh7110-pcie" devices), right?
> 
Yes, plda,xpressrich-pcie-host is IP controller driver. Do it like designware/cadence/mobiveil, (pcie-(ip)-plat.c)
But I can't test it. I don't whether need it. If it not required, I will delete it.
>> For re-use the PLDA controller codes, I request refactoring microchip
>> codes, move PLDA common codes to PLDA files.
>> Desigware and Cadence is good example for refactoring codes.
>> 
>> So first step is extract the PLDA common codes from microchip, and
>> refactoring the microchip codes.(patch1 - 4)
>> Then add the PLDA platform codes. (patch5, 6)
>> At last, add Starfive codes. (patch7 - 9)
>> 
>> This patchset is base on v6.5-rc1
> 
> Doesn't quite apply cleanly for me:
> 
I am sorry, The driver need stg clk and syscon driver, which are have't be merge to main line.
mainly dts is(patch9) rejected, Must apply this series patch first. (I forget add this link in cover letter)
https://patchwork.kernel.org/project/linux-riscv/cover/20230712092007.31013-1-xingyu.wu@starfivetech.com/
and this syscon patch 
https://patchwork.kernel.org/project/linux-riscv/patch/20230717023040.78860-7-xingyu.wu@starfivetech.com/
>   10:10:15 ~/linux (main)$ git checkout -b wip/minda-starfive-v1 v6.5-rc1
>   Switched to a new branch 'wip/minda-starfive-v1'
>   10:10:33 ~/linux (wip/minda-starfive-v1)$ git am m/20230719_minda_chen_refactoring_microchip_polarfire_pcie_driver.mbx
>   Applying: dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
>   Applying: dt-bindings: PCI: microchip: Remove the PLDA common properties
>   Applying: PCI: PLDA: Get PLDA common codes from Microchip PolarFire host
>   Applying: PCI: microchip: Move PCIe driver to PLDA directory
>   Applying: dt-bindings: PLDA: Add PLDA XpressRICH PCIe host controller
>   Applying: PCI: PLDA: Add host conroller platform driver
>   Applying: dt-bindings: PCI: Add StarFive JH7110 PCIe controller
>   Applying: PCI: PLDA: starfive: Add JH7110 PCIe controller
>   Applying: riscv: dts: starfive: add PCIe dts configuration for JH7110
>   error: patch failed: arch/riscv/boot/dts/starfive/jh7110.dtsi:629
>   error: arch/riscv/boot/dts/starfive/jh7110.dtsi: patch does not apply
>   Patch failed at 0009 riscv: dts: starfive: add PCIe dts configuration for JH7110
> 
>>   dt-bindings: PCI: Add PLDA XpressRICH PCIe host common properties
>>   dt-bindings: PCI: microchip: Remove the PLDA common properties
>>   PCI: PLDA: Get PLDA common codes from Microchip PolarFire host
>>   PCI: microchip: Move PCIe driver to PLDA directory
>>   dt-bindings: PLDA: Add PLDA XpressRICH PCIe host controller
>>   PCI: PLDA: Add host conroller platform driver
> 
> "controller"
>ok
>>   dt-bindings: PCI: Add StarFive JH7110 PCIe controller
>>   PCI: PLDA: starfive: Add JH7110 PCIe controller
>>   riscv: dts: starfive: add PCIe dts configuration for JH7110
> 
> Use "PCI: plda: " prefix for PLDA things that are shared across
> multiple drivers.
> 
> Use "PCI: starfive: " prefix for starfive-specific things.
> 
> This is the same as how drivers/pci/controller/dwc/* looks.
> 
ok, thanks.
> Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
