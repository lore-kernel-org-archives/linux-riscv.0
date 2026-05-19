Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FD4CD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mq5ME+Z+JQN8gfZIyNnQYc9ffdHmRJ6AgVFJa/5j1ho=; b=Qbd+hH+ARKMaOz
	JzH0cy9+GOXduI+XsY3ObQRMcdHWMoet8+qoclrhNOKEwCn7rQ8KcoThgwCat5wniugNorT7MI6dZ
	xb7duC4ens4C2YVxTJDlv6zKlvCvprphplQoKiVfABejUOHA9SDf4iS1t6S/a7U8e6JyAIITMhHsd
	H7b7g1WBCBs/dDQrewoTRQWkzJ1AgF603JT/lx+SQs39qVpGKM82QGQo64xi8FnDHibQ6EA7ySzlz
	zxWMlFW3Y1d8NGJO8jobb9n+eWyCDnCZrianu6rgX0sZth2QJspYrSbNaU96rSc/Z7Ll1C+05ELbT
	ZWc/XAsNkDMLF5AAJA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNhA-00000002InU-1kQm;
	Tue, 19 May 2026 16:53:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNh8-00000002Imu-3xWx;
	Tue, 19 May 2026 16:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8sTqgK7mp+Unp9Wpw9+a9pZzPmJnG02xCCH/x+as8c0=; b=nmERGW3C6z9yJ13+llDJotvz+H
	AVDZL+4P5FLMLbsPzeZybLlRMSPtk2n0h+4Iwn0ayeulBG7mrs0flpjhw4Z5bCtfzOiuNCcckIYRE
	nkEVecGxv/0C0j0QAmzlHrdA3KNs23y6PeaF1BgCztaNqVW6jWWSEqdQkJ7kJ+GSrPtxffP/5N0hZ
	HIGd04H+LsDul71vCvzOHjcPoXH5dhNF7NNEz6BfCNPvPQStLmUEdBxGvMOSupqRS4vixKuc0R0ST
	IWDzE2oUVFcUWQGbFWcy6DAnBxNg35kw65Ye6ZeEx45NOTVO9Om4LEvWIjzp+qisI9AWZyX7nAUEa
	Hmlx9dQg==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNh4-0000000ErVS-39gZ;
	Tue, 19 May 2026 16:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=8sTqgK7mp+Unp9Wpw9+a9pZzPmJnG02xCCH/x+as8c0=;
	b=Xu0Xi0jk2I5naAv7BW68F8wp+zf1WAfWvdPqJpYEhtBNnvKKpsM19fbiGRrZPS
	F4gw7ba0Z9JxW9iVOQ/J8DKU643Vejg2Re33hDXOK5KpZquw7itTVc+DsmEKjzR9
	6MmRfJR7mRKX3hFEotycCpHiXhM1D+4enlNArWgobDb24=
Received: from [IPV6:240e:b8f:91b3:d000:7f44:7c72:8a1e:7e64] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCHGflilQxqMA8gCQ--.43458S2;
	Wed, 20 May 2026 00:52:51 +0800 (CST)
Message-ID: <e0c89a4a-709e-42c6-ad1c-7ec50cc5790c@163.com>
Date: Wed, 20 May 2026 00:52:49 +0800
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
 <3464ded9-721a-4eb2-afb6-bbca6fdc8a46@163.com>
 <m332ocvmmdzcgnzmzxmbn2nmczxuhplt5efh64fd22fagrot42@x3okixj5qjb2>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <m332ocvmmdzcgnzmzxmbn2nmczxuhplt5efh64fd22fagrot42@x3okixj5qjb2>
X-CM-TRANSID: _____wCHGflilQxqMA8gCQ--.43458S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr4rZw1kKFy5Gr48Xr47Jwb_yoW8uFWDpa
	y3JayFyF4UXF4Iya1Ivw48XF4xKasxJry7Xr95Gry5Arn0vF1rJr4FvrWYkF9rGrWvyr1Y
	vF4Yq3429r15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRMrW7UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:7f44:7c72:8a1e:7e64]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AQcv2oMlWSKKgAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_175323_633987_E4418C59 
X-CRM114-Status: GOOD (  11.46  )
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



On 5/20/26 00:49, Manivannan Sadhasivam wrote:
> On Wed, May 20, 2026 at 12:27:21AM +0800, Hans Zhang wrote:
>>
>>
>> On 5/20/26 00:15, Manivannan Sadhasivam wrote:
>>> On Wed, May 20, 2026 at 12:09:28AM +0800, Hans Zhang wrote:
>>>>
>>>>
>>>> On 5/19/26 21:57, Manivannan Sadhasivam wrote:
>>>>> On Sat, May 09, 2026 at 09:51:49PM +0800, Hans Zhang wrote:
>>>>>> The DWC PCIe core and its many platform drivers repeatedly call
>>>>>> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
>>>>>> PCI Express Capability structure. This is wasteful and makes the code
>>>>>> verbose. And some even search for the PCI_CAP_ID_EXP offset value within
>>>>>> the suspend/resume functions.
>>>>>>
>>>>>
>>>>> Sashiko has flagged some real issues with this series in accessing DBI space
>>>>> very early and 'pci->pcie_cap' being 0.
>>>>
>>>>
>>>> Hi Mani,
>>>>
>>>> We have discussed this issue in the Cadence driver. I think it won't cause
>>>> any problems. Specifically as follows:
>>>>
>>>> https://lore.kernel.org/linux-pci/5823faec-d972-4c77-90ec-a215c686e0a8@163.com/
>>>> """
>>>> As per PCIe r7.0, sec 7.5.1.1.11, Since all PCI Express Functions are
>>>> required to implement the PCI Express Capability structure, which
>>>> must be included somewhere in this linked list.
>>>> """
>>>>
>>>>
>>>>
>>>> Bjorn also responded as follows:
>>>> https://lore.kernel.org/linux-pci/20260505212306.GA744158@bhelgaas/
>>>> """
>>>> It's true that all Root Ports must have a PCIe Capability.
>>>> """
>>>>
>>>
>>> Ok, what about reading the DBI registers very early?
>>
>> Hi Mani,
>>
>> Yes. I have performed the DBI read register operation at the very beginning
>> of the following code.
>>
>>
>> dw_pcie_ep_init()
>>    dw_pcie_get_pcie_cap(pci);
>>
>> dw_pcie_host_init
>>    dw_pcie_get_pcie_cap(pci);
>>
> 
> These both calls will cause crash on a lot of platforms because these will be
> reading the DBI registers while the resources are not enabled.

Hi Mani,

Next, I will check all the DBI register-related issues. It will be fixed 
in the next version. Thank you very much.

Best regards,
Hans


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
