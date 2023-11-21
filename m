Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5D1C61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 00:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GzX5EcJveBRhVwWHvL6QZJPyt/9TLbRGAmin2CBRNA=; b=h8lCV5b5+aUUTd
	jpNg1efzpXvFjXsbh8yGQwfA4+K4GW9wzSdq6AZ3IjLWBQ3J6TvWDxhCgTU9sC2qVuS5cEdBnglsS
	xY2BzogUO7PFEXHqjqpkxCa/yhTh/2pM3cAk+5iJozwoXcxLWV56wbKg3LO8zMJjdVzVvFzf+0cMz
	ZQLmqM4LEgBbqzMyBKNtMWl6A1/ZpukHCgoIm91lf1auTEZS4ynJieFXJs3DInCObp9KKluJ4Fp/I
	7e1ij3JtK7hZDF8pqWwHwQbIlN9YkXWIAFPztWhpiFRu+H6Dxuv7l8TpMzG/kQGxB3XtOO+6DCc0Z
	OU6XQEbTlZWfHNHDkrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5F0c-00FGnH-1v;
	Tue, 21 Nov 2023 00:52:58 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5F0Y-00FGl5-1t
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 00:52:56 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2A7FC24E203;
	Tue, 21 Nov 2023 08:52:23 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Nov
 2023 08:52:23 +0800
Received: from [192.168.125.85] (183.27.97.46) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Nov
 2023 08:52:21 +0800
Message-ID: <ad43c202-3796-469c-b7fb-7591026e6888@starfivetech.com>
Date: Tue, 21 Nov 2023 08:52:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 19/20] PCI: starfive: Add JH7110 PCIe controller
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
	<kw@linux.com>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20231120182347.GA207554@bhelgaas>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20231120182347.GA207554@bhelgaas>
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_165254_820773_8EB965DB 
X-CRM114-Status: GOOD (  19.65  )
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



On 2023/11/21 2:23, Bjorn Helgaas wrote:
> On Mon, Nov 20, 2023 at 06:07:31PM +0800, Minda Chen wrote:
>> On 2023/11/15 19:49, Minda Chen wrote:
>> > Add StarFive JH7110 SoC PCIe controller platform driver codes, JH7110
>> > with PLDA host PCIe core.
>> ...
> 
>> > --- a/drivers/pci/pci.h
>> > +++ b/drivers/pci/pci.h
>> > @@ -22,6 +22,13 @@
>> >   */
>> >  #define PCIE_PME_TO_L2_TIMEOUT_US	10000
>> >  
>> > +/*
>> > + * PCIe r6.0, sec 6.6.1, <Conventional Reset>
>> > + * Requires a minimum waiting of 100ms before sending a configuration
>> > + * request to the device.
>> > + */
>> > +#define PCIE_BEFORE_CONFIG_REQUEST_WAIT_MS	100
>> > +
>> >  extern const unsigned char pcie_link_speed[];
>> >  extern bool pci_early_dump;
>> >  
>> Hi Bjorn
>>   I have not checked this carefully.
>>   I think the change of pci.h should be moved to a indepent patch.
>>   Could you approve this? Kevin will commit a new patch for this.
>>   Next version I will remove this change. 
> 
> Yes, I think it makes sense to add that #define in a separate patch.
> 
> Please trim out the unnecessary context; there's no need for readers
> to scroll through the entire driver to get to the useful part, which
> is just the last dozen lines or so.
> 
> Bjorn

Thanks. I will notice this next time. 
Happy Thanksgiving! Wish you and Rob have a good holiday.

BTW. Could you give any comments to Refactoring patches (patch 2 - patch 16)and PLDA patch(patch 17) next week?  Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
