Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB530C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 03:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YUrJN/BnChfFTiZzZuhlioaLCELhNh3FIi1J5R+oCw=; b=j4A8fWXlc8k9CO
	353OgDIXEOeGLmxRQkwhixnjbWFP7U10GQd8LQkFpVRKJg0B4npPdrguXJelP4Pesa4qL0pW10hef
	CpprkZZ5I5hzhF7nrAnhK/GPkAkA2Az0xvUBQjuJ7jdVRS5lDsggPC7LUaZB/S03OHmcKosaTrRWE
	0SY3R1BrdNtNPly9vQ0QgIcGB1kNRCbQDaZJTW8dwWr/hM8lV4lqWnfOWIoFaqsIiTEKNLUKzYra2
	cFDE8H4swdAZdMkxG2+mhSPNjtYtMJJyja1D/145mlFBnvVNkJod5xlVC8wQSZp59cyl8lTAL3VG0
	wNW6+eLCV+KjQqlYjwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkd3I-0096GG-2y;
	Fri, 07 Apr 2023 03:46:16 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkd3E-0096EY-15
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 03:46:15 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 761F524E1B6;
	Fri,  7 Apr 2023 11:45:39 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Apr
 2023 11:45:39 +0800
Received: from [192.168.125.108] (183.27.97.179) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 7 Apr
 2023 11:45:38 +0800
Message-ID: <548b4d0f-447a-23a9-0e58-3d6c80cb8e3b@starfivetech.com>
Date: Fri, 7 Apr 2023 11:45:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 1/3] dt-binding: pci: add JH7110 PCIe dt-binding
 documents.
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring
	<robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
	<kw@linux.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406111142.74410-2-minda.chen@starfivetech.com>
 <38bc48bf-7d8c-8ddd-861f-3b7f3d2edce6@linaro.org>
 <20230406-revisit-patchy-a0063d964070@spud>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230406-revisit-patchy-a0063d964070@spud>
X-Originating-IP: [183.27.97.179]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_204612_535736_13D9E0EC 
X-CRM114-Status: GOOD (  13.15  )
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



On 2023/4/7 2:35, Conor Dooley wrote:
> On Thu, Apr 06, 2023 at 08:24:55PM +0200, Krzysztof Kozlowski wrote:
>> On 06/04/2023 13:11, Minda Chen wrote:
>> > +
>> > +  interrupt-controller:
>> > +    type: object
>> > +    properties:
>> > +      '#address-cells':
>> > +        const: 0
>> > +
>> > +      '#interrupt-cells':
>> > +        const: 1
>> > +
>> > +      interrupt-controller: true
>> > +
>> > +    required:
>> > +      - '#address-cells'
>> > +      - '#interrupt-cells'
>> > +      - interrupt-controller
>> > +
>> > +    additionalProperties: false
>> > +
>> > +required:
>> > +  - reg
>> > +  - reg-names
>> > +  - "#interrupt-cells"
>> 
>> Keep consistent quotes - either ' or "
>> 
>> Are you sure this is correct? You have interrupt controller as child node.
> 
> I know existing stuff in-tree is far from a guarantee that it'll be
> right, but this does at least follow what we've got for PolarFire SoC:
> Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> 
> Both PLDA and both RISC-V w/ a PLIC as the interrupt controller, so in
> similar waters.
> This note existed in the original text form binding of the Microchip
> PCI controller:
> | +NOTE:
> | +The core provides a single interrupt for both INTx/MSI messages. So,
> | +create an interrupt controller node to support 'interrupt-map' DT
> | +functionality.  The driver will create an IRQ domain for this map, decode
> | +the four INTx interrupts in ISR and route them to this domain.
> 
> Given the similarities, I figure the same requirement applies here too.
> Minda?
> 
> Cheers,
> Conor.

Yes, Thanks very much.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
