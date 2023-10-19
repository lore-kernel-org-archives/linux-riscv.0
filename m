Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871EACDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 07:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByCcJKAya74/6cG+W3+bTG4hcyY9G/sZHZoKHhOgy34=; b=aPB6iODIXd5fku
	PgvuKEAoOnnOYGew7NQNg7BCAkAVAtKJBl05YFQx+dI87FBeHRnPlHZPidjik6hfQw4ZSZRx6blm2
	Z8y2WEwjPRhZhDVvPOqdx5Jw6KBYzQvUguuRdNCqUI3HfHk8EYM3+PmQOSSrFCSZhKT++JsFLGQDD
	abBfW2bcHen4FnV9NjuYO3OpepcEHxP6N+oFjsUL4yDtHow7+CT7kf8/7vaMLJ8m3NjFkC34n8U+4
	eWuNzBZNhkv8+cYjghgL612q841+D7U+50Pa9f0CfciXU7tE+6Vp4zjaMr4BCCM+21aQCAzPCkS2l
	VGFhRILBWU9QnvAJOTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNdw-00Gcu1-05;
	Thu, 19 Oct 2023 07:40:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNdq-00Gcpx-08
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 07:40:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BFBBE24E2A5;
	Thu, 19 Oct 2023 15:39:42 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Oct
 2023 15:39:41 +0800
Received: from [192.168.125.85] (183.27.99.123) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 19 Oct
 2023 15:39:40 +0800
Message-ID: <f80c685e-4513-4962-9b47-d6c85d632dd2@starfivetech.com>
Date: Thu, 19 Oct 2023 15:39:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/22] PCI: microchip: Add event IRQ domain ops to
 struct plda_event
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20231011110514.107528-1-minda.chen@starfivetech.com>
 <20231011110514.107528-17-minda.chen@starfivetech.com>
 <20231018-worrier-sizably-b13023f54b36@spud>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20231018-worrier-sizably-b13023f54b36@spud>
X-Originating-IP: [183.27.99.123]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_004026_385037_71AE5A9F 
X-CRM114-Status: GOOD (  19.11  )
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



On 2023/10/18 19:30, Conor Dooley wrote:
> On Wed, Oct 11, 2023 at 07:05:08PM +0800, Minda Chen wrote:
>> PolarFire Implements none-PLDA event interrupts. So the whole event
>> domain ops can not be re-used.
> 
> IIRC, the reason things are like this is to work around the lack of an
> msi controller and are not as a result of changes made to the PLDA IP
> by us.
> 
Oh.  For this reason that new added interrupts have to add to 
global events field, not the MSI. I will add this to commit messages.
Thanks

>> PLDA event domain ops instances will be implemented
>> in later patch.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  drivers/pci/controller/plda/pcie-microchip-host.c | 9 ++++++---
>>  drivers/pci/controller/plda/pcie-plda.h           | 1 +
>>  2 files changed, 7 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
>> index fca1520d56c9..2825c1f5563d 100644
>> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
>> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
>> @@ -811,13 +811,15 @@ static const struct plda_event_ops mc_event_ops = {
>>  };
>>  
>>  static const struct plda_event mc_event = {
>> +	.domain_ops             = &mc_event_domain_ops,
>>  	.event_ops              = &mc_event_ops,
>>  	.request_event_irq      = mc_request_event_irq,
>>  	.intx_event             = EVENT_LOCAL_PM_MSI_INT_INTX,
>>  	.msi_event              = EVENT_LOCAL_PM_MSI_INT_MSI,
>>  };
>>  
>> -static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
>> +static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port,
>> +				      const struct irq_domain_ops *ops)
>>  {
>>  	struct device *dev = port->dev;
>>  	struct device_node *node = dev->of_node;
>> @@ -831,7 +833,8 @@ static int plda_pcie_init_irq_domains(struct plda_pcie_rp *port)
>>  	}
>>  
>>  	port->event_domain = irq_domain_add_linear(pcie_intc_node, port->num_events,
>> -						   &mc_event_domain_ops, port);
>> +						   ops, port);
>> +
>>  	if (!port->event_domain) {
>>  		dev_err(dev, "failed to get event domain\n");
>>  		of_node_put(pcie_intc_node);
>> @@ -930,7 +933,7 @@ static int plda_init_interrupts(struct platform_device *pdev,
>>  		return -EINVAL;
>>  	}
>>  
>> -	ret = plda_pcie_init_irq_domains(port);
>> +	ret = plda_pcie_init_irq_domains(port, event->domain_ops);
>>  	if (ret) {
>>  		dev_err(dev, "failed creating IRQ domains\n");
>>  		return ret;
>> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
>> index 6571a4befac9..080932cbe8c4 100644
>> --- a/drivers/pci/controller/plda/pcie-plda.h
>> +++ b/drivers/pci/controller/plda/pcie-plda.h
>> @@ -129,6 +129,7 @@ struct plda_pcie_rp {
>>  };
>>  
>>  struct plda_event {
>> +	const struct irq_domain_ops *domain_ops;
>>  	const struct plda_event_ops *event_ops;
>>  	int (*request_event_irq)(struct plda_pcie_rp *pcie,
>>  				 int event_irq, int event);
>> -- 
>> 2.17.1
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
