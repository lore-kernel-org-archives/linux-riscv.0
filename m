Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CD0C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0w0SDINyJE8S6W6KjS59cptR7uAPVrwEVgTqKo3VHk=; b=SYn5PH/0e/8BG3
	gF/m31m1oYIIa/t3rmwWZX8Z0HbU35fxLTyzoUdGBzbMOc8BTPVPRejuLMapjXw/eTGs6/NsCJHsi
	Q2m55U3OzEQ9c1gVNHB0B3bEXQnFY5FV+6rj8+OipHvwb7zTOe1+FuD6A8MxKQt2uSED8VdAzlGbl
	mVXiAawyffRB04sATdHLT8b9Q5oZ90C5p+56iGt7Dj71LFZCPpiShnbeBQoC7cmkq95A4yH4YXQ1N
	6aH+S2h7pkhObKXx0inj3BWTRItfYMv+cWKKFVxsfjQfzMTQF3QJkt8wBTz+zvvg6GKMWnIIdPn4C
	glwoUKU69uE1XHtdWJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virqe-00000006pZp-10fm;
	Thu, 22 Jan 2026 10:23:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virqc-00000006pYp-2SiV
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fm50/tGbng8CPrJ5pxlBGJVNYim53O0nEqjQ/KJUWQw=; b=azQzAZOiW0AHs9BIiqC03x67DV
	p+bcgtrDAIgmjnhSBSMLc2JPQhtcMiycm6U6uze5GeUpueq0RKG6TkfQdFVFnJc1tyTR0esaSzcMh
	Z5g2ZHs1ryAFgpNZsHs+kGTlE7pCS0sYmNfFIohzUvvmW4pmOu8eIJM2hIeF4GACjOsqUF+gwUVKI
	UcCsX6dJl4vg1WCEejso2M2Hj9uwsUjz0Nu5Bc6/fq4jB9KHfGLIymNu/Z6GXWf/nZP/YjYa2rMYn
	+8vUbGWuXh1T0clfX2Are1XTOJkcXRsvwz8Lv9WDi/+WtVXIVxEYdfiovsE/3qKaqb5XVtLdqx/d0
	em+m+qwQ==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virqW-000000008TQ-3RKZ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 10:23:28 +0000
Received: from [10.213.20.167] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowABXZ85++nFpwkNDBg--.14326S2;
	Thu, 22 Jan 2026 18:22:56 +0800 (CST)
Message-ID: <8e0cae73-3ca0-47a8-8ac7-aa8edba3e0f9@iscas.ac.cn>
Date: Thu, 22 Jan 2026 18:22:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI/MSI: Check msi_addr_mask in
 msi_verify_entries()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Creeley, Brett" <bcreeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Han Gao <gaohan@iscas.ac.cn>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>
References: <20260121233804.GA1221537@bhelgaas>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260121233804.GA1221537@bhelgaas>
X-CM-TRANSID: rQCowABXZ85++nFpwkNDBg--.14326S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy3GF15Cr48tryxAFy3twb_yoW8CFyxpa
	yDKa1qyrsYk3yUJrsFqw1UXF1jvFZYqayfGrWUK34Y9FnIvFnFyrySka47u3srXF1xGw10
	vF1Yya1UJFs09aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0pRVVbgUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_102325_603081_1E7834B9 
X-CRM114-Status: GOOD (  14.33  )
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


On 1/22/26 07:38, Bjorn Helgaas wrote:
> [+cc Thomas, thread at https://lore.kernel.org/r/20260121-pci-msi-addr-mask-v2-0-f42593168989@iscas.ac.cn]
>
> On Wed, Jan 21, 2026 at 11:49:38AM +0800, Vivian Wang wrote:
>> Instead of a 32-bit/64-bit dichotomy, check the MSI address against
>> msi_addr_mask.
>>
>> This allows platforms with MSI doorbell above 32-bit address space to
>> work with devices without full 64-bit MSI address support, as long as
>> the doorbell is within addressable range of MSI of the device.
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>>
>> ---
>> v2: No changes
>> ---
>>  drivers/pci/msi/msi.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
>> index 48f5f03d1479..2ecbcd6c436a 100644
>> --- a/drivers/pci/msi/msi.c
>> +++ b/drivers/pci/msi/msi.c
>> @@ -321,14 +321,17 @@ static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
>>  static int msi_verify_entries(struct pci_dev *dev)
>>  {
>>  	struct msi_desc *entry;
>> +	u64 address;
>>  
>>  	if (dev->msi_addr_mask == DMA_BIT_MASK(64))
>>  		return 0;
>>  
>>  	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
>> -		if (entry->msg.address_hi) {
>> -			pci_err(dev, "arch assigned 64-bit MSI address %#x%08x but device only supports 32 bits\n",
>> -				entry->msg.address_hi, entry->msg.address_lo);
>> +		address = (u64)entry->msg.address_hi << 32 |
>> +			  entry->msg.address_lo;
>> +		if (address & ~dev->msi_addr_mask) {
>> +			pci_err(dev, "arch assigned 64-bit MSI address %llx above device MSI address mask %llx\n",
> Use %#llx so it's clear these addresses are hex.  The previous message
> did that, not sure why you dropped it.

Thanks for catching. I misunderstood the purpose of the original message
formatting.

I will fix this in v3.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
