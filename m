Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5E0CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 03:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0kfCIW3e8/inM0S2ddkpS/Gy1CiNdSCD6eEEV5OQRU=; b=e+n4wLJyj5jj0z
	nfCsgObi1RWg2QF7TQsSnUBktbdJxTE0SE3gvF10kTXP9Jq7uP+82u7U0qvFssZwkS6TCWLiRlvAW
	JbsUzBp3vQtK9dqJJ44ji5iHP6/islY832DGtmv758tQpYrBZqCB6319Ao4LAjOoTovEBUrD5oPtk
	wmH5Ns+cqGkFLZ7OtzVm63EduuXu+lu0li3eHwuBiMJGhzkmGu23SIYppaeOlcOjoX58gHheA2jXb
	i0on4IwwBpEl1FXRmstQ4t5NOjF3mv1OOXc+8Fj1qIOEVmJf+HtiVoLgjiPRK72DuD8GwRBoo421x
	aL7QPgrXO/6LIEnjzgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbvIp-00GQgH-1m;
	Fri, 01 Sep 2023 03:58:35 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbvIk-00GQf7-1a
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 03:58:33 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1474580CF;
	Fri,  1 Sep 2023 11:57:47 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Sep
 2023 11:57:48 +0800
Received: from [192.168.125.127] (183.27.96.188) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 1 Sep
 2023 11:57:45 +0800
Message-ID: <837c3675-51d4-2eba-e8c6-3065d6e5d301@starfivetech.com>
Date: Fri, 1 Sep 2023 11:57:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 08/11] PCI: microchip: Move IRQ init functions to
 pcie-plda-host.c
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel
	<p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Kevin Xie <kevin.xie@starfivetech.com>
References: <20230825090129.65721-1-minda.chen@starfivetech.com>
 <20230825090129.65721-9-minda.chen@starfivetech.com>
 <20230825-sip-pentagon-e1760dcfce58@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230825-sip-pentagon-e1760dcfce58@wendy>
X-Originating-IP: [183.27.96.188]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_205832_216571_CD2AD25B 
X-CRM114-Status: GOOD (  13.53  )
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



On 2023/8/25 20:09, Conor Dooley wrote:
> Daire, can you look at this one too please?
> 
> On Fri, Aug 25, 2023 at 05:01:26PM +0800, Minda Chen wrote:
>> Move IRQ init functions to pcie-plda-host.c.
>> mc_handle_event() is merged to plda_handle_event().
>> Set most of the IRQ functions to static in pcie-plda-host.c
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> 
>> -void plda_handle_event(struct irq_desc *desc)
>> +static void plda_handle_event(struct irq_desc *desc)
>>  {
>>  	struct plda_pcie_rp *port = irq_desc_get_handler_data(desc);
>>  	struct irq_chip *chip = irq_desc_get_chip(desc);
>> @@ -264,14 +268,18 @@ void plda_handle_event(struct irq_desc *desc)
>>  
>>  	chained_irq_enter(chip, desc);
>>  
>> -	val = readl_relaxed(port->bridge_addr + ISTATUS_LOCAL);
>> -	origin = val;
>> -	val = val >> A_ATR_EVT_POST_ERR_SHIFT;
>> -	events |= val & 0xff;
>> -	if (origin & PM_MSI_INT_INTX_MASK)
>> -		events |= BIT(EVENT_PM_MSI_INT_INTX);
>> -	val = (origin >> PM_MSI_INT_MSI_SHIFT) & 0xf;
>> -	events |= val << EVENT_PM_MSI_INT_MSI;
>> +	if (port->ops && port->ops->get_events) {
> 
> I still don't love the dancing here. Can you just always register a
> callback?
> 
> Thanks,
> Conor.
> 
OK, Thanks.
>> +		events = port->ops->get_events(port);
>> +	} else {
>> +		val = readl_relaxed(port->bridge_addr + ISTATUS_LOCAL);
>> +		origin = val;
>> +		val = val >> A_ATR_EVT_POST_ERR_SHIFT;
>> +		events |= val & 0xff;
>> +		if (origin & PM_MSI_INT_INTX_MASK)
>> +			events |= BIT(EVENT_PM_MSI_INT_INTX);
>> +		val = (origin >> PM_MSI_INT_MSI_SHIFT) & 0xf;
>> +		events |= val << EVENT_PM_MSI_INT_MSI;
>> +	}
>>  
>>  	for_each_set_bit(bit, &events, port->num_events)
>>  		generic_handle_domain_irq(port->event_domain, bit);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
