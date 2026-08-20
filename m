Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D147FC5DF85
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSFWRLOSDRkRkCqlR9ND0VpW9iLF5xPRYNxQz5AZu10=; b=PBvQWc2YK22xpv
	JJnE+aCIn2d0cL5hRWIRUE2caS0OE6uYKESeSbVoITeIXkGnYbDSfi76YPRHw2Zym1jeR/6XFtXB1
	3SrvwtY+KRIWe+Ff37C9CuQpwKVs6QeweXHPK9qNG0914fsApl0krcIhBkDbyXYkw4I5gNEDu8dgb
	m6w2RgMl83RBTEFkKRk+yo2fMe5XHKMJ4g7aEhgJ6PUhE+isRbx4ftZemxY8+0xAroxFNM6vIpZR3
	nYnsSXQGyumcvEOibRa+IcO50prtvz0LrSlkhmV/A8HX5iP5kv/vNNYIEDHCRmebUcZo+fRHayVb5
	QBLDTLU/bFp8CChjNJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4W6-0000000Bn2d-2zeb;
	Thu, 20 Aug 2026 15:17:18 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4W3-0000000Bn23-32H5;
	Thu, 20 Aug 2026 15:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=hCBCfkhuylDswajnEAey0yhp/w2gaAIUfLfZkrqLJZI=;
	b=jz7Yb4NV2f4ape26Kp1GE/Cg4BTdXVJCyxo9NcOQCjfIZGGbmJazQ27Qg+bQ8E
	K9iqAp0NKgajM4aFMscqoafCMxBrzSFXaGCX0qxzW+EEXJDVnZ6q9s4aaPkyr85P
	DVveMqpuEMuJ7rSa8XEECERFA43Wfvq3V2lj4f80cLFVM=
Received: from [IPV6:240e:b8f:91b3:d000:fc9b:5f4:477a:dca5] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCHTa9jGodqjxLpQQ--.14990S2;
	Thu, 20 Aug 2026 23:16:52 +0800 (CST)
Message-ID: <a2f0c2d6-750e-4076-aae2-6efaba1009a1@163.com>
Date: Thu, 20 Aug 2026 23:16:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] PCI: dwc: Use cached PCIe capability offset in
 core
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 jingoohan1@gmail.com, imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-3-18255117159@163.com>
 <ps2qzgcb5lixkoqz2xbofdurkgmsiojg7e5ueqfdhyissqvzf2@tuderrjgzg6b>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <ps2qzgcb5lixkoqz2xbofdurkgmsiojg7e5ueqfdhyissqvzf2@tuderrjgzg6b>
X-CM-TRANSID: _____wCHTa9jGodqjxLpQQ--.14990S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF15GFy5tryfZw17uFy8Zrb_yoW8ur18p3
	yaqr4ayr4kZrW2vFWxJa1YqF10gF98trW3J3s3Kr15ZwsxCFWxJrW2yryYvF9rGrWqyr1F
	kF4UXryDur98AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRi2-OUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:fc9b:5f4:477a:dca5]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AQcv2qHGmR67gAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_081716_210070_485254A3 
X-CRM114-Status: GOOD (  16.11  )
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



On 8/13/26 14:06, Manivannan Sadhasivam wrote:
> On Mon, Jul 20, 2026 at 11:06:05PM +0800, Hans Zhang wrote:
>> Modify the DWC core functions to use the cached pcie_cap offset instead
>> of calling dw_pcie_find_capability() each time.
>>
>> In the DWC core, dw_pcie_find_capability() is called at several locations:
>> - dw_pcie_ep_init_non_sticky_registers()
>> - dw_pcie_wait_for_link()
>> - dw_pcie_link_set_max_speed()
>> - dw_pcie_link_get_max_link_width()
>> - dw_pcie_link_set_max_link_width()
>>
>> The cached offset is initialized after hardware is ready:
>> - In host mode: dw_pcie_host_init() calls pp->ops->host_init() (enables
>>    clocks/resets), then dw_pcie_get_pcie_cap() caches the offset.
>> - In endpoint mode: the core no longer caches automatically. Instead,
>>    drivers must call dw_pcie_get_pcie_cap() after hardware is enabled
>>    (e.g., after PERST# deassert).
> 
> But you didn't modify all DWC EP drivers to call dw_pcie_get_pcie_cap(). This
> can lead to pcie_cap being 0.
> 
>> dw_pcie_ep_init_non_sticky_registers()
>>    is called after that point, so it can safely use pci->pcie_cap.
>>
>> dw_pcie_ep_init_non_sticky_registers() now assumes pci->pcie_cap is
>> valid. if not, it prints a warning and skips the operation.
> 
> Where is this warning printed?
> 
> These are already pointed out by Sashiko. You should go really go through all of
> them (not the pre-existing issues) and comment whether the issues are valid or
> false positive. For a series touching many controller drivers, this is necessary
> to avoid introducing regressions.
> 
> I'm not going to merge this series until you fix the real issues Sashiko
> reported or mark them as false positive if not valid.

Hello Mani,

I'm truly sorry. Recently, due to work commitments, I haven't had any 
spare time. I plan to handle this series after v7.3-rc1 is released. 
Thank you very much for your reply. I will carefully consider the 
subsequent review comments regarding Sashiko. Thank you again.


Best regards,
Hans

> 
> - Mani
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
