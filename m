Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550A9EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 02:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5BTyNJy1Hiu1mmAYSosjQQt9kwzGmtQoNEfoP4Xz8s=; b=KnibWv3XVgb7A8
	sEFu9gM5ou3mbX22FfAixXl+tHGlkDTisu73MQTozjt4PWzi1fJF78jeSPz9z9WwtDsCaKspGKZHd
	tFWFUldlZ6HMp9hbyZ3nvPL08GyV5WsBDug1KSCgr21H6HwynNAjERHVnFrRJG4cPNom0WI6QOLN5
	6JFjt0885WCG98gzozNbQNsqhpyWUKR7KDaConbmlyOBNee9zjuhcj6n6wski1R1PpievQ8YkbjCh
	8tPu43LI4OFvtxQIzsWmHf/a66BYIstAr32sVtRDRqqBls9Y9d7bFtglOTZPN8IrysWXqs32ysUTp
	0/QtGwPMJfYD6JVRvnjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfSi-00Catt-1T;
	Fri, 21 Jul 2023 02:01:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfSg-00CatT-12
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Jul 2023 02:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tmFjpUsbgGHlDwdYrMQEB0+Txp3W2rkAzv8U2h5RCoo=; b=S8AuInqhwHNyytEpOvStich7lR
	JRQ/ISXtNP6gVVGaRFF0we1eIGi1wut1QqBzvG8gZae0cpqjFUvIxvA1NAhppZKv7CWMPQX5O3kUx
	9YU+ync6lHcNsigGq7hOJdMT28f9+d+EcKYljOqmN8+1ZEWVWWyqS1s03hJJaeWXeL3JQjItZbo3b
	PvsqU6UHwSVceaQU1INgA3k3V1af9q6R1ageMQJgYuYXhqL2F6GiymFwNVSZWBiLetJyUCgRa9J2O
	qTnxtL83H1jX7bvNl2HlLsrA9Ip6iKn6m8N/LRYasS8LfACQfhV0eaTM6hOvH1XZ9Xx6W4x0ipiBN
	lTp7N6gw==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMeaR-00G0wg-2i
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 01:05:44 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A166281B1;
	Fri, 21 Jul 2023 09:03:36 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 09:03:36 +0800
Received: from [192.168.125.127] (113.72.147.86) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 09:03:35 +0800
Message-ID: <2ace898a-c919-1388-28cd-0c39ac88dc62@starfivetech.com>
Date: Fri, 21 Jul 2023 09:03:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 8/9] PCI: PLDA: starfive: Add JH7110 PCIe controller
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
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
References: <20230719102057.22329-1-minda.chen@starfivetech.com>
 <20230719102057.22329-9-minda.chen@starfivetech.com>
 <20230720-vanquish-upcoming-1145e052c849@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230720-vanquish-upcoming-1145e052c849@wendy>
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_020540_759043_B49B6870 
X-CRM114-Status: GOOD (  11.67  )
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



On 2023/7/20 19:14, Conor Dooley wrote:
> On Wed, Jul 19, 2023 at 06:20:56PM +0800, Minda Chen wrote:
>> Add StarFive JH7110 SoC PCIe controller platform
>> driver codes.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
>> ---
>>  MAINTAINERS                                 |   7 +
>>  drivers/pci/controller/plda/Kconfig         |   8 +
>>  drivers/pci/controller/plda/Makefile        |   1 +
>>  drivers/pci/controller/plda/pcie-plda.h     |  58 ++-
>>  drivers/pci/controller/plda/pcie-starfive.c | 415 ++++++++++++++++++++
>>  5 files changed, 487 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/pci/controller/plda/pcie-starfive.c
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f02618c2bdf5..b88a54a24ae5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20356,6 +20356,13 @@ S:	Supported
>>  F:	Documentation/devicetree/bindings/watchdog/starfive*
>>  F:	drivers/watchdog/starfive-wdt.c
>>  
>> +STARFIVE JH71x0 PCIE DRIVER
>> +M:	Minda Chen <minda.chen@starfivetech.com>
>> +L:	linux-pci@vger.kernel.org
>> +S:	Supported
>> +F:	Documentation/devicetree/bindings/pci/starfive*
>> +F:	drivers/pci/controller/plda/pcie-starfive.c
>> +
>>  STATIC BRANCH/CALL
>>  M:	Peter Zijlstra <peterz@infradead.org>
>>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
>> diff --git a/drivers/pci/controller/plda/Kconfig b/drivers/pci/controller/plda/Kconfig
>> index a3c790545843..eaf72954da9f 100644
>> --- a/drivers/pci/controller/plda/Kconfig
>> +++ b/drivers/pci/controller/plda/Kconfig
>> @@ -24,4 +24,12 @@ config PCIE_MICROCHIP_HOST
>>  	  Say Y here if you want kernel to support the Microchip AXI PCIe
>>  	  Host Bridge driver.
>>  
>> +config PCIE_STARFIVE_HOST
>> +	tristate "StarFive PCIe host controller"
>> +	select PCIE_PLDA_HOST
> 
> Ditto here, I think this suffers from the same issue, although its
> probably only really randconfigs that'll trigger it.
> 
ok, thanks, I will change it with microchip.
>> +	help
>> +	  Say Y here if you want to support the StarFive PCIe controller
>> +	  in host mode. StarFive PCIe controller uses PLDA PCIe
>> +	  core.
>> +
>>  endmenu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
