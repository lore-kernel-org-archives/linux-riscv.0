Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35018C5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tO4dHC1rCAVSW78thm+j7/8g8nBt5T7SUxv3MStGEwI=; b=0OVSQ3fjJowULZt15KHVwfJRK8
	XLYk1BOaD+c1IP8LUJhQQ9iyO91tVMZUe8ahwIuWBFcv87CjMsx4p8ozPkFOpjO2KiengFVHz2wtP
	WDzdlmRJSSLsv53QjYPgG9Ahthv9OWhXpk7HJiLwQ35yaTeIS5QHy6bzW5fWAy7R6vvJM2Vqusd6Q
	/UTiUPEuTRuCRlRjLIH6qOFY0DwOOcixhTMs0P8XMGFPpvYSSKVCWbGiHhCyJh4DpdNMNu2xmgRba
	4jmVCJRv60Ywz+VchFP9mJpeXV8amNnkFTopaQDUbWkiFcobHJzkBcG+Y34Q+7U8eT7AWXuH7ao3Q
	PWT+TERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhCji-0000000A7t5-3OwM;
	Mon, 04 Mar 2024 18:08:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhCjf-0000000A7pq-1LBf
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 18:08:25 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso4298585a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709575693; x=1710180493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aizblNvc9Cf2btttMWelCC6kMijS1p5vy42920jDwTY=;
        b=xJ4HkxZmqQjZYnWn1+SS8omAovJJbS7BK+viCu68asfdx85C7wbbZDCH0CVKKnWjUS
         HpQMV4cYr4ky8Mb5vKpinNMpDljisjAHSkd6+0KuyBa2Fv0xQGp427xwCYTEMLASZaZF
         1InSVfRFCe08nLH0gls37zboBWVZPFZsLs4ZhRwe5EVov1L4hNH3dgeKnNrUOqkhG8sL
         PfxdlHor48TrAMclmwvV8ea3+jsovAzrXhiifENRaomFzMcPjGRXp/gKpFocdXAHuxgC
         7EZlAefXb8Rw4tkPcWc9vprkuTSMJt16JjQW4+7rkiw57OIan2nmgCDsqe90xNEBkgCe
         Ze1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709575693; x=1710180493;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aizblNvc9Cf2btttMWelCC6kMijS1p5vy42920jDwTY=;
        b=PiQ1aOYGo6jb24ZxVHdfa6XEKPFBeSDN6H8QPjZ2bCn+5luLzCk5vI7DdSX5KOMxqt
         sxNoCvzMQw7tfmg+k7HnFFTrnrVRDeYLY2qiTKRehny0qOadV8fKz9YSRCuCF+tPL2pT
         kZkN8XF/Ier8HKBdgIPxWkt5c9GsrtZbKhKsXusTt7YRVRQFwFR/yTjTQOuo1IvHiooJ
         jofXiNOUgzu3NW0tIeCPs/7OGAwupIS1RomaByDZjIvGUkhWDogx+vLMsMfKpY+4UgKN
         eDVMRFjs477Ki/f3QMRIWOeujqLRVXY9LQvyVb011yM8fIDHz34AQSXMpXp2kM9ivuiw
         80FA==
X-Forwarded-Encrypted: i=1; AJvYcCVQkoegx24mckYDeY/5TuCWAs5Prt9PcvyKFdH3q7+NbkWWrmTPYcbr1g4+mBFaT5CbHJT+JovLaLgZmixHNoudMIytChwyO6KCqb+Z65Sy
X-Gm-Message-State: AOJu0Yxave9R7F3tdBFPzxxNzJXYWSn1E4ZVlxEf/Z9TAiJ69i/Xgd9R
	pIktFV2lsyMpnehuT9BvqKuc7Srk1x4oAv6henk21H24AJtT8oP+S51EM2MLIlk=
X-Google-Smtp-Source: AGHT+IFhlrCJ7z/RMUFxQQf2zMzCvbw2MLdNLsKVNf46b6Rg0IEtkQiqwfm6zGkZbeAOroe6+Tng3g==
X-Received: by 2002:a17:90a:8a0e:b0:29a:a08d:4809 with SMTP id w14-20020a17090a8a0e00b0029aa08d4809mr7511710pjn.2.1709575693052;
        Mon, 04 Mar 2024 10:08:13 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id l3-20020a17090ac58300b0029b2e00359esm5161382pjt.36.2024.03.04.10.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 10:08:06 -0800 (PST)
Date: Mon, 04 Mar 2024 10:08:06 -0800 (PST)
X-Google-Original-Date: Mon, 04 Mar 2024 10:08:04 PST (-0800)
Subject: Re: [PATCH v15,RESEND 22/23] PCI: starfive: Offload the NVMe timeout workaround to host drivers.
In-Reply-To: <ZeCd+xqE6x2ZFtJN@lpieralisi>
CC: minda.chen@starfivetech.com, Conor Dooley <conor@kernel.org>, kw@linux.com,
  robh+dt@kernel.org, bhelgaas@google.com, tglx@linutronix.de, daire.mcnamara@microchip.com,
  emil.renner.berthing@canonical.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, p.zabel@pengutronix.de, mason.huo@starfivetech.com,
  leyfoon.tan@starfivetech.com, kevin.xie@starfivetech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lpieralisi@kernel.org
Message-ID: <mhng-87e7ef5a-d60b-4057-960d-41bc901b6c7f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_100823_573933_F9B7D678 
X-CRM114-Status: GOOD (  31.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 29 Feb 2024 07:08:43 PST (-0800), lpieralisi@kernel.org wrote:
> On Tue, Feb 27, 2024 at 06:35:21PM +0800, Minda Chen wrote:
>> From: Kevin Xie <kevin.xie@starfivetech.com>
>>
>> As the Starfive JH7110 hardware can't keep two inbound post write in
>> order all the time, such as MSI messages and NVMe completions. If the
>> NVMe completion update later than the MSI, an NVMe IRQ handle will miss.
>
> Please explain what the problem is and what "NVMe completions" means
> given that you are talking about posted writes.
>
> If you have a link to an erratum write-up it would certainly help.

I think we really need to see that errata document.  Our formal memory 
model doesn't account for device interactions so it's possible there's 
just some arch fence we can make stronger in order to get things ordered 
again -- we've had similar problems with some other RISC-V chips, and 
while it ends up being slow at least it's correct.

> This looks completely broken to me, if the controller can't guarantee
> PCIe transactions ordering it is toast, there is not even a point
> considering mainline merging.

I wouldn't be at all surprised if that's the case.  Without some 
concrete ISA mechanisms here we're sort of just stuck hoping the SOC 
vendors do the right thing, which is always terrifying.

I'm not really a PCIe person so this is all a bit vague, but IIRC we had 
a bunch of possible PCIe ordering violations in the SiFive memory system 
back when I was there and we never really got a scheme for making sure 
things were correct.

So I think we really do need to see that errata document to know what's 
possible here.  Folks have been able to come up with clever solutions to 
these problems before, maybe we'll get lucky again.

>> As a workaround, we will wait a while before going to the generic
>> handle here.
>>
>> Verified with NVMe SSD, USB SSD, R8169 NIC.
>> The performance are stable and even higher after this patch.
>
> I assume this is a joke even though it does not make me laugh.

So you're new to RISC-V, then?  It gets way worse than this ;)

> Thanks,
> Lorenzo
>
>>
>> Signed-off-by: Kevin Xie <kevin.xie@starfivetech.com>
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> ---
>>  drivers/pci/controller/plda/pcie-plda-host.c | 12 ++++++++++++
>>  drivers/pci/controller/plda/pcie-plda.h      |  1 +
>>  drivers/pci/controller/plda/pcie-starfive.c  |  1 +
>>  3 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
>> index a18923d7cea6..9e077ddf45c0 100644
>> --- a/drivers/pci/controller/plda/pcie-plda-host.c
>> +++ b/drivers/pci/controller/plda/pcie-plda-host.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/msi.h>
>>  #include <linux/pci_regs.h>
>>  #include <linux/pci-ecam.h>
>> +#include <linux/delay.h>
>>
>>  #include "pcie-plda.h"
>>
>> @@ -44,6 +45,17 @@ static void plda_handle_msi(struct irq_desc *desc)
>>  			       bridge_base_addr + ISTATUS_LOCAL);
>>  		status = readl_relaxed(bridge_base_addr + ISTATUS_MSI);
>>  		for_each_set_bit(bit, &status, msi->num_vectors) {
>> +			/*
>> +			 * As the Starfive JH7110 hardware can't keep two
>> +			 * inbound post write in order all the time, such as
>> +			 * MSI messages and NVMe completions.
>> +			 * If the NVMe completion update later than the MSI,
>> +			 * an NVMe IRQ handle will miss.
>> +			 * As a workaround, we will wait a while before
>> +			 * going to the generic handle here.
>> +			 */
>> +			if (port->msi_quirk_delay_us)
>> +				udelay(port->msi_quirk_delay_us);
>>  			ret = generic_handle_domain_irq(msi->dev_domain, bit);
>>  			if (ret)
>>  				dev_err_ratelimited(dev, "bad MSI IRQ %d\n",
>> diff --git a/drivers/pci/controller/plda/pcie-plda.h b/drivers/pci/controller/plda/pcie-plda.h
>> index 04e385758a2f..feccf285dfe8 100644
>> --- a/drivers/pci/controller/plda/pcie-plda.h
>> +++ b/drivers/pci/controller/plda/pcie-plda.h
>> @@ -186,6 +186,7 @@ struct plda_pcie_rp {
>>  	int msi_irq;
>>  	int intx_irq;
>>  	int num_events;
>> +	u16 msi_quirk_delay_us;
>>  };
>>
>>  struct plda_event {
>> diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
>> index 9bb9f0e29565..5cfc30572b7f 100644
>> --- a/drivers/pci/controller/plda/pcie-starfive.c
>> +++ b/drivers/pci/controller/plda/pcie-starfive.c
>> @@ -391,6 +391,7 @@ static int starfive_pcie_probe(struct platform_device *pdev)
>>
>>  	plda->host_ops = &sf_host_ops;
>>  	plda->num_events = PLDA_MAX_EVENT_NUM;
>> +	plda->msi_quirk_delay_us = 1;
>>  	/* mask doorbell event */
>>  	plda->events_bitmap = GENMASK(PLDA_INT_EVENT_NUM - 1, 0)
>>  			     & ~BIT(PLDA_AXI_DOORBELL)
>> --
>> 2.17.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
