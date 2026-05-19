Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF85CCD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7mBkjnwdWf5UAlYhqKOYBarmPRre1Lwq/27Zavpog4=; b=mcpt8NlSQXlmH+
	HcvEaGIg5aq8TvNh1WDDOnShpw9Q8nGpqc1sGzrAOAMG+P/MHqqXMhhV40uaKfT0Vl7PIA8XwZjTy
	Vfl8Rkr0E4dcnwfuJMU0NB4JyUC1Wy4srRBjmWTtP39bLmdcpCrWbyMjGB8GFoN/DrCYdDlYJhMzK
	Clw79qrrWmf2bMpMKMewTLPFT2EODDgl0kaBeFudlCfFh6J+Bh/iV5lV46Z8Faw7VIzODsvNTsDQV
	4yHvGEsZbpCi/yz8b5NeTuYxNy/XvioOlTmFrxl85/3EKtIIq8EG4oqoxiUatgfoHVkd+fbEywZ2c
	YAq1n6ztRyvmrFOjPFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNIY-00000002EPp-05GN;
	Tue, 19 May 2026 16:28:02 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNIR-00000002ENZ-0zjl;
	Tue, 19 May 2026 16:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=HEzVodalGePwQa0r0A0yc+dOQ9J8DF1f8pqfWHrsuSk=;
	b=mkAQ+9qgGabS1i8OItgzH9nPB22PSXb1+d91WzICOmsEtS/r6QFeeHtqKA1W5/
	m9VrN7fmFjkpo6vTEdLqaVrbjqtXsvmwIJodwhdIl3IMv7T2BavKmxqxify2H8uO
	PjyXtOG+aBdv1+ITi0wqxv/8WztCkfwZOUJRUZNCESIyk=
Received: from [IPV6:240e:b8f:91b3:d000:9130:b3d8:6241:39fd] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDXEFBpjwxq6iYtCQ--.55083S2;
	Wed, 20 May 2026 00:27:22 +0800 (CST)
Message-ID: <3464ded9-721a-4eb2-afb6-bbca6fdc8a46@163.com>
Date: Wed, 20 May 2026 00:27:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] PCI: dwc: Cache PCIe capability offset and simplify
 drivers
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 jingoohan1@gmail.com, mx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260509135152.2241235-1-18255117159@163.com>
 <beqy5ykxgo4ianya6r4mahkkyujs6lly475u26vqaemgqsdnhp@2pn5ipczwc34>
 <5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com>
 <bejh7em2a67a6wohtakovbg6wqwhjoxkuqtdompsexfm5bbzrf@yqwcqeg6yugq>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <bejh7em2a67a6wohtakovbg6wqwhjoxkuqtdompsexfm5bbzrf@yqwcqeg6yugq>
X-CM-TRANSID: _____wDXEFBpjwxq6iYtCQ--.55083S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr47Gw4rWF47AFy3tr43Jrb_yoW8uryfpa
	y3JF1Syr48XF4fXan2va1rZF4xt3ZxArWUZ395Cryavr9I9Fy3JrsY9ryYkF9rCFs2yr15
	uF4Yqry29r15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRiiSJUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:9130:b3d8:6241:39fd]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAubP2oMj2sFdQAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_092755_716847_8EC19923 
X-CRM114-Status: GOOD (  10.81  )
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



On 5/20/26 00:15, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 12:09:28AM +0800, Hans Zhang wrote:
>>
>>
>> On 5/19/26 21:57, Manivannan Sadhasivam wrote:
>>> On Sat, May 09, 2026 at 09:51:49PM +0800, Hans Zhang wrote:
>>>> The DWC PCIe core and its many platform drivers repeatedly call
>>>> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
>>>> PCI Express Capability structure. This is wasteful and makes the code
>>>> verbose. And some even search for the PCI_CAP_ID_EXP offset value within
>>>> the suspend/resume functions.
>>>>
>>>
>>> Sashiko has flagged some real issues with this series in accessing DBI space
>>> very early and 'pci->pcie_cap' being 0.
>>
>>
>> Hi Mani,
>>
>> We have discussed this issue in the Cadence driver. I think it won't cause
>> any problems. Specifically as follows:
>>
>> https://lore.kernel.org/linux-pci/5823faec-d972-4c77-90ec-a215c686e0a8@163.com/
>> """
>> As per PCIe r7.0, sec 7.5.1.1.11, Since all PCI Express Functions are
>> required to implement the PCI Express Capability structure, which
>> must be included somewhere in this linked list.
>> """
>>
>>
>>
>> Bjorn also responded as follows:
>> https://lore.kernel.org/linux-pci/20260505212306.GA744158@bhelgaas/
>> """
>> It's true that all Root Ports must have a PCIe Capability.
>> """
>>
> 
> Ok, what about reading the DBI registers very early?

Hi Mani,

Yes. I have performed the DBI read register operation at the very 
beginning of the following code.


dw_pcie_ep_init()
   dw_pcie_get_pcie_cap(pci);

dw_pcie_host_init
   dw_pcie_get_pcie_cap(pci);


However, for some glue drivers, they need to configure the registers of 
the PCIe Express Capability earlier than calling 
dw_pcie_host_init()/dw_pcie_ep_init(). So, for example, in the file: 
drivers/pci/controller/dwc/pcie-tegra194.c. Here, it is necessary to 
find the value of 'pci->pcie_cap' earlier. Then, 
dw_pcie_host_init()/dw_pcie_ep_init() will no longer search for the 
offset value of the PCIe Express Capability.


Best regards,
Hans


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
