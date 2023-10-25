Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F474C25B47
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7iajMnmYSad8mLjT7k6OE5g+SKrwzmH6mZqZ3UWb44=; b=K/ewO7cUqDvZDv
	DpIWfwbQNyII8M5k0IRffA8aqEuWut+NI1pk3mAe/9aVMWD+IV8dSLjWwS0FjyN6f7fzmq7aga5vk
	9wiPXig2qOy0QsQ+w8nMICF2asD5YV6plWssNITLa7bsiMS+NuKNJxXrBMY0QzJPSj978sJB4SXUM
	+j+lVCa+d2LYxYUQiSHkMr5WJlV9cBLdbzkSglVyqKbd60NqYdlQ5Eoc1DDjvBTj1Dtd9bv3hdAYE
	vmREQ9ZNnrjXZ1TFowMPQonQ5oV17pXdLZatZcjqNygc2ElRtaix/ptBNsUX34OUJVWVN7I0T3uqJ
	R0P6NWvFdVl6lV4Ofixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvXKM-00BTsI-1u;
	Wed, 25 Oct 2023 06:25:14 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvXKI-00BTpt-1j
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 06:25:13 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3186D80CF;
	Wed, 25 Oct 2023 14:24:23 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 25 Oct
 2023 14:24:23 +0800
Received: from [192.168.125.136] (183.27.99.126) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 25 Oct
 2023 14:24:21 +0800
Message-ID: <2857e5b8-0a87-26b7-1057-8ef8ecf94f2c@starfivetech.com>
Date: Wed, 25 Oct 2023 14:24:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 19/20] PCI: starfive: Add JH7110 PCIe controller
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Minda Chen
	<minda.chen@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
	<kw@linux.com>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
References: <20231024175253.GA1662387@bhelgaas>
From: Kevin Xie <kevin.xie@starfivetech.com>
In-Reply-To: <20231024175253.GA1662387@bhelgaas>
X-Originating-IP: [183.27.99.126]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_232511_096559_6F4977E8 
X-CRM114-Status: GOOD (  38.30  )
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



On 2023/10/25 1:52, Bjorn Helgaas wrote:
> On Fri, Oct 20, 2023 at 06:43:40PM +0800, Minda Chen wrote:
>> Add StarFive JH7110 SoC PCIe controller platform
>> driver codes, JH7110 with PLDA host PCIe core.
> 
> Wrap all your commit logs to fill about 75 columns (as suggested
> before).  "git log" adds a few spaces, so if you fill to 75 columns,
> the result will still fit in a default 80 column window.
> 

OK.

>> +config PCIE_STARFIVE_HOST
>> +	tristate "StarFive PCIe host controller"
>> +	depends on OF && PCI_MSI
>> +	select PCIE_PLDA_HOST
>> +	help
>> +	  Say Y here if you want to support the StarFive PCIe controller
>> +	  in host mode. StarFive PCIe controller uses PLDA PCIe
>> +	  core.
> 
> Add blank line between paragraphs.  Wrap to fill 75-78 columns.
> 

OK.

>> +	  If you choose to build this driver as module it will
>> +	  be dynamically linked and module will be called
>> +	  pcie-starfive.ko
> 
>> +++ b/drivers/pci/controller/plda/pcie-plda.h
>> @@ -6,14 +6,26 @@
>>  #ifndef _PCIE_PLDA_H
>>  #define _PCIE_PLDA_H
>>  
>> +#include <linux/phy/phy.h>
> 
> I don't think you need to #include this.  In this file you only use a
> pointer to struct phy, so declaring the struct should be enough, e.g.,
> 
>   struct phy;
> 
> You will have to #include it in pcie-starfive.c where you actually
> *use* phy, of course.
> 

OK.

>> +#define CONFIG_SPACE_ADDR			0x1000u
> 
> This looks like an *offset* that you add to ->bridge_addr.  Adding two
> addresses together doesn't really make sense.
> 

OK, I will rename it.

>> +static int starfive_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
>> +				      int where, int size, u32 value)
>> +{
>> +	if (starfive_pcie_hide_rc_bar(bus, devfn, where))
>> +		return PCIBIOS_BAD_REGISTER_NUMBER;
> 
> I think this should probably return PCIBIOS_SUCCESSFUL.  There's
> nothing wrong with the register number; you just want to pretend that
> it's hardwired to zero.  That means ignore writes and always return 0
> for reads.
> 
>> +	return pci_generic_config_write(bus, devfn, where, size, value);
>> +}
>> +
>> +static int starfive_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
>> +				     int where, int size, u32 *value)
>> +{
>> +	if (starfive_pcie_hide_rc_bar(bus, devfn, where))
>> +		return PCIBIOS_BAD_REGISTER_NUMBER;
> 
> Set *value to zero and return PCIBIOS_SUCCESSFUL.
> 

Agree, PCIBIOS_BAD_REGISTER_NUMBER is imprecise.
I will return PCIBIOS_SUCCESSFUL here, ignore writes and always return 0 for reads.

>> +	return pci_generic_config_read(bus, devfn, where, size, value);
>> +}
>> +
>> +static int starfive_pcie_parse_dt(struct starfive_jh7110_pcie *pcie, struct device *dev)
> 
> 95% of this driver (and the rest of drivers/pci) is wrapped to fit in
> 80 columns, e.g.,
> 
>   static int starfive_pcie_parse_dt(struct starfive_jh7110_pcie *pcie,
>                                     struct device *dev)
> 

Sorry, I will check and make them are wrapped to fit in 80 columns.

>> +	domain_nr = of_get_pci_domain_nr(dev->of_node);
>> +
>> +	if (domain_nr < 0 || domain_nr > 1)
>> +		return dev_err_probe(dev, -ENODEV,
>> +				     "failed to get valid pcie id\n");
> 
> "id" is too generic and doesn't hint about where the problem is.
> Update the message ("pcie id") to mention "domain" so it corresponds
> with the source ("linux,pci-domain" from DT).
>
Yes, domain is better.

>> +	ret = reset_control_deassert(pcie->resets);
>> +	if (ret) {
>> +		clk_bulk_disable_unprepare(pcie->num_clks, pcie->clks);
>> +		dev_err_probe(dev, ret, "failed to resets\n");
> 
> "failed to ... resets" is missing a word.  "Failed to deassert
> resets", I guess?
> 

Yes, I will make a supplement.

>> +	/* Ensure that PERST has been asserted for at least 100 ms,
>> +	 * the sleep value is T_PVPERL from PCIe CEM spec r2.0 (Table 2-4)
>> +	 */
> 
> Use multiline comment formatting (also below):
> 
>   /*
>    * Ensure ...
>    */
> 

OK.

>> +	msleep(100);
>> +	if (pcie->reset_gpio)
>> +		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
>> +
>> +	/* As the requirement in PCIe base spec r6.0, system (<=5GT/s) must
>> +	 * wait a minimum of 100 ms following exit from a conventional reset
>> +	 * before sending a configuration request to the device.
> 
> Mention sec 6.6.1, where (I think) this value comes from.  Eventually
> we should make a #define for this because it's not specific to any one
> PCIe controller.
> 

I would like to add a new define in drivers/pci/pci.h:
/*
 * PCIe r6.0, sec 6.6.1, <Conventional Reset>
 * Requires a minimum waiting of 100ms before sending a configuration
 * request to the device.
 */
#define PCIE_BEFORE_CONFIG_REQUEST_WAIT_MS     100

When drivers use it, they can put them into the right place depends on the link speed:
1) With a Downstream Port(<=5.0 GT/s), system waits after conventional reset done.
2) With a Downstream Port(> 5.0 GT/s), system waits after link training completes. 

Thus, our code will be:
+	if (pcie->reset_gpio)
+		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
+       /*
+        * With a Downstream Port (<=5GT/s), software must wait a minimum
+        * of 100ms following exit from a conventional reset before
+        * sending a configuration request to the device.
         */
-       msleep(100);
+       msleep(PCIE_BEFORE_CONFIG_REQUEST_WAIT_MS);

Is that what you expected?

>> +	msleep(100);
>> +
>> +	if (starfive_pcie_host_wait_for_link(pcie))
>> +		dev_info(dev, "port link down\n");
>> +
>> +	return ret;
> 
> We know the value here, so return it explicitly:
> 
>   return 0;
> 

OK

>> +static int starfive_pcie_suspend_noirq(struct device *dev)
>> +{
>> +	struct starfive_jh7110_pcie *pcie = dev_get_drvdata(dev);
>> +
>> +	if (!pcie)
>> +		return 0;
> 
> How could it happen that "pcie" is zero?  I think it could only happen
> if there were a driver bug or a memory corruption.  Either way, we
> should remove the check so we take a NULL pointer fault and find out
> about the problem.
> 

I will remove it.

>> +static int starfive_pcie_resume_noirq(struct device *dev)
>> +{
>> +	struct starfive_jh7110_pcie *pcie = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = starfive_pcie_enable_phy(dev, &pcie->plda);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = clk_bulk_prepare_enable(pcie->num_clks, pcie->clks);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable clocks\n");
>> +		starfive_pcie_disable_phy(&pcie->plda);
>> +		return ret;
>> +	}
>> +
>> +	return ret;
> 
>   return 0;
> 

OK.

Thanks!

> Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
