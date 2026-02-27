Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A13FD9E3C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgGrpyPBa7F3hSSyLVi09sbpCK7TG3RSNmnopTlBHzQ=; b=hVdeXk1Y0ftQWP
	/97WfYKZ3/SGwSGbJlGsOACyEBbnsF5LMxxIiNFMsxD/9V+2XOcSIkQOQpjE8K6DAmKQyctfGaYS4
	3GIcK+tA/Rpn0P7vKHa+oy1cR35Au0wE6WmFJquCeciBH/a+Jji8kQ9ZHUd9nNpwcS11wN1MVyccd
	SG8/GQyZv/qeeABmHCbOMndtD8tzeOGG8XmvwXAo51MUKP8gFEilV260tb1kqXv/oh5a//HEXOyL8
	n3l+AMm4eDWtgi49zE9ZZ/LETmdY7wMfqC4Im77efv1XhzBKiC5jsM/W17QyJL+nWlgRi9QO6ZJwv
	9nFHsHzoIbtKTqwg2N+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqM5-00000007i6r-2WP4;
	Fri, 27 Feb 2026 05:25:37 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqLz-00000007i5t-2OFZ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 05:25:36 +0000
Received: from [192.168.0.103] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowABH72qvKqFp4fXQCA--.7323S2;
	Fri, 27 Feb 2026 13:25:04 +0800 (CST)
Message-ID: <c9329ae2-721d-4127-9380-b1ea454bd8f2@iscas.ac.cn>
Date: Fri, 27 Feb 2026 13:25:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
To: Mark Bloch <mbloch@nvidia.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Brett Creeley <brett.creeley@amd.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
 Maor Gottlieb <maorg@nvidia.com>
References: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
 <20260129-pci-msi-addr-mask-v4-1-70da998f2750@iscas.ac.cn>
 <fb23d54a-fca0-43a2-ae1d-03ae52112192@nvidia.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <fb23d54a-fca0-43a2-ae1d-03ae52112192@nvidia.com>
X-CM-TRANSID: qwCowABH72qvKqFp4fXQCA--.7323S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrykArWkCrW7tr1xAr48tFb_yoW8Gr4fpF
	WDWF4rtF4UKry7t39Fvw1DZF45Zws5Z3s3Wry5twnakan0v3W2qr1qyr4aga42gr48Jw4Y
	kryjgw1vqrs8Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRM6wCDUUUU
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_212532_879442_6D51251D 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

On 2/27/26 02:25, Mark Bloch wrote:

> On 29/01/2026 3:56, Vivian Wang wrote:
>> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
>> implement less than 64 address bits. This breaks on platforms where such
>> a device is assigned an MSI address higher than what's reachable.
>>
>> Currently, the no_64bit_msi bit is set for these devices, meaning that
>> only 32-bit MSI addresses are allowed for them. However, on some
>> platforms the MSI doorbell address is above the 32-bit limit but within
>> the addressable range of the device.
>>
>> As a first step to enabling MSI on those combinations of devices and
>> platforms, conservatively generalize the single-bit flag no_64bit_msi
>> into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
>> with msi_mask.)
>>
>> The translation is essentially:
>>
>> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
>> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
>> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
>>
> Hey Vivian,
>
> We are seeing issues while reloading mlx5 on a PPC64 platform.

Mea culpa. There's a fix on the list [1] since last Friday. I'm not sure
why it hasn't moved yet, but please take a look.

Vivian "dramforever" Wang

[1]: https://lore.kernel.org/all/20260220070239.1693303-1-nilay@linux.ibm.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
