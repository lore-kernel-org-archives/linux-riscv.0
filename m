Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167ADEE49A0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 01:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDuvxrE6tbaxFl8Sg8TIjtjH5Vn2BDh2Y9WcJeikLdU=; b=yN1AzNefsuW9u8
	+ZjG0Xkvi2lACXvm+J/Q13ZVEYbv3epPr1Mil45lyvxS+19nMR42BbNFuM561HxsXpWZSEcNUBvuA
	gjPRR6ga+hoxiUs7z0EZo2N5wIJGDWmPaU8JWUK1Na4MsSiUd+GU001Ko1IAmiDeezxm4WXxmB/S3
	eZJPBZGeQ9tc0xJ48CARVf6hvn8qZQKDe3I5duJW2yxsGFGAjY7TGZtPIJekhVcxXsrSnL2QWmCIP
	ThD9ujYtKG4CQCO5pF5OB70jH/qdvVVmaKZ/tfVwr3oCiyTAVB/kzwECD3C7NZp9hd80kLafJ88ae
	IkshX3WHD+KXrowRSOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYG3y-00Evv1-0t;
	Tue, 22 Aug 2023 01:20:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYG3w-00Evut-1S
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Aug 2023 01:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3Sdwa6dQu+iEPi7l5cQ5BnYC0PCkUGYuNoAE3ClVdaM=; b=MF1pJYBFNnguQ0Yl/e4j9St7Gc
	RY7yD+ViEMhlVJXa5XdgGMqyKFhrexZucL0ZCJSq7cpSczHpPIi5eC6iYdiLlZzILiuUwP2xIpb2i
	IepPXVWAgOx7oA+TFsnuw4znaLxLwq9X65VidowSlyUQ6WZar0RIUxCuMQHOLZBM/W263+07/CMeA
	+K8efDhmv4HAVTt1OngUEG7859gQyCLjlWMKkqbZGK+V7u1M1UgMHQEJtW31X32u+y4grZtv5PWxo
	l3VEv2iol9DVi1zLNXCulESoYQumJEKJKwKrDwP7EFIvz/2r4b5CHXRps6/uR+xoRmqrNLkVvhB1G
	zMMsRa7g==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qYG3q-00DU49-7o
	for linux-riscv@lists.infradead.org; Tue, 22 Aug 2023 01:20:02 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8CxRugvDeRkfsIaAA--.1349S3;
	Tue, 22 Aug 2023 09:19:43 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxvM4gDeRkSe1fAA--.37428S3;
	Tue, 22 Aug 2023 09:19:43 +0800 (CST)
Message-ID: <bc1e31ca-eb54-9696-792c-9749c0582167@loongson.cn>
Date: Tue, 22 Aug 2023 09:19:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org
References: <20230821173320.GA362442@bhelgaas>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230821173320.GA362442@bhelgaas>
X-CM-TRANSID: AQAAf8CxvM4gDeRkSe1fAA--.37428S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1xAw1ruFy8ury3uFWfWFX_yoW8CFWxpa
	yfWFn8Cr4DAwnrArn2v3W8XF9avayrXrWUGrs8tr1rAF98uryF9r1rJw15Cwn3Z39rJa1j
	vrs8Jw1kGrs0qagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9N3UU
	UUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_021958_995235_8A2B6B3A 
X-CRM114-Status: GOOD (  14.16  )
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

Hi,


On 2023/8/22 01:33, Bjorn Helgaas wrote:
> On Fri, Aug 18, 2023 at 09:48:46AM +0800, suijingfeng wrote:
>> On 2023/8/18 06:08, Bjorn Helgaas wrote:
>>>> +		if (resource_type(res) != IORESOURCE_MEM)
>>>> +			continue;
>>>> +
>>>> +		if (!res->start || !res->end)
>>>> +			continue;
>>>> +
>>>> +		if (res->start <= fb_start && fb_end <= res->end) {
>>>> +			pdev_boot_vga = pdev;
>>>> +
>>>> +			vgaarb_info(&pdev->dev,
>>>> +				    "BAR %d contains firmware FB\n", i);
>>> Print the BAR with %pR and include the framebuffer region from
>>> screen_info in the same format.
>> I do remember that you already told me to do this in V3, sorry for not
>> replying to you at V3. Most of the time, what you tell me is right.But here,
>> I think I need to explain. Because doing it that way will make the code line
>> too long,and it will exceed 80 characters in the column if we print too
>> much.
>> I believe that the vgaarb_info() at here is already the most compact and
>> simplest form. Printing the BAR with %pR is not absolute necessary, because
>> we can get the additional information by: $ lspci | grep VGA
>>
>> $ dmesg | grep 05:00.0
>> $ dmesg | grep 0000:03:00.0
>> $ dmesg | grep PCI
> Fair enough.  The BAR info is already there.  But I don't think the
> screen_info framebuffer data is in the dmesg log anywhere, and I think
> that would be useful.
>
> It's fine if dmesg lines or kernel printk lines exceed 80 columns.
>
>> Actually, I only add something that is absolute necessary.
>> Printing BAR with %pR and/or Printing the framebuffer region
>> is consider to only for *debugging* purpose.
> I think printing the framebuffer region is important because it makes
> it clear *why* we're selecting the device as the default VGA device.
> It's more than just debugging; it helps make the system more
> transparent and more understandable.

OK, I'm clear what to do next.
The printing will be added at the next version.

> Bjorn


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
