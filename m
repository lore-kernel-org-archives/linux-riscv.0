Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B8EEE49A0
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Aug 2023 02:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HO0tEWspbHO5R2UiBvfZxYPGBdtVzvOqFXGt2QTSjhI=; b=EWx1pcVjVZAr6j
	DXcnLzET3qslCnr0GN6uFQPJN2H1gRyS9OqrtYqUH4yooLnFlTR5ArJhUBbcXFmPZ4svRKYQ24KUF
	6wx5Dbg5MM1U6h3uhCDr7dNrynlF2VOASmK2nuzaBLgXmSu33k5hcIyneuY0rRdaonyscw2mDuRpZ
	tYpdmDdCWQYBF5t8uvXoIb5Ls797XR6NVWkaRfTRUz+h8J4gfK7jCpa4tLAq6cCDq2xCJMk5+7iIv
	gnMe7SPM2Q4Q9bYJjx2LJFJe1nxQEULIg5WlOfGwXg2FUnOk57FNtvI4KzVX+dZbGF0lj7Rpdx/eJ
	05OLa4LBMSabuI0bfWag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBXp-00AHiY-20;
	Sat, 19 Aug 2023 02:18:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBXo-00AHi1-0R
	for linux-riscv@bombadil.infradead.org;
	Sat, 19 Aug 2023 02:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=t10IKV1uZQzR9UXNiWk3GqVt/5mZUEC0Gge3Fu+de1s=; b=BBf+44ZC4khoo6uZAvW/DPwV3E
	mnlsd1OLV4E/H2MuWhwNVMvQcoUZYWx3TiU4sRMNwfWAwH8u2eNfYZ2KaK0L5EWUgDgskc+Vxv0tH
	bQSmnwcRyAKMLlmmMq83a+rQcmO6vqvHE1QYdHkOojHgIwyg3c7BiB1pF0vmDOlZUVPicueICHj/g
	8lthBKWUzSPbthRl6LbR4v9iSMH19W2INNcCQnnKOqWVCROX/QqlkkPjWXi2NIwcHBF6SwBXOHqCq
	z5OixxcADrUjF0mZG6fHsMxxlISQa0WonfYSmBD8CIjpHGkOIMNi1S03S4oCXrn9u5Cr53S4MFPlW
	/SHu7hWg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qXBXi-00D0Ud-AH
	for linux-riscv@lists.infradead.org; Sat, 19 Aug 2023 02:18:25 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8DxBfFsJuBk4QwaAA--.53547S3;
	Sat, 19 Aug 2023 10:18:20 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxvM5rJuBkThFeAA--.33669S3;
	Sat, 19 Aug 2023 10:18:19 +0800 (CST)
Message-ID: <a0df769c-13af-f5cf-6070-594c614ef318@loongson.cn>
Date: Sat, 19 Aug 2023 10:18:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, loongson-kernel@lists.loongnix.cn,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230817220853.GA328159@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230817220853.GA328159@bhelgaas>
X-CM-TRANSID: AQAAf8CxvM5rJuBkThFeAA--.33669S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JryfKFy3ur15CF45Zw45XFc_yoW3Awb_ZF
	W0k34UCryrJFykJwn5GF1fuay3Wrs09FWIgFyaya1UJ343XFs5ZFW8X3s2qr48ta1DAr97
	CFnxJa1rC3WDuosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jz2NtUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_031823_177053_05C036FC 
X-CRM114-Status: UNSURE (   8.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 2023/8/18 06:08, Bjorn Helgaas wrote:
>> +
>> +/*
>> + * Identify the PCI VGA device that contains the firmware framebuffer
>> + */
>> +static void pci_boot_vga_finder(struct pci_dev *pdev)
>> +{
>> +	resource_size_t fb_start;
>> +	resource_size_t fb_end;
>> +	unsigned int i;
>> +
>> +	/* Already found the pdev which has firmware framebuffer ownership */
>> +	if (pdev_boot_vga)
>> +		return;
>> +
>> +	if (!vga_arb_get_firmware_fb_range(&fb_start, &fb_end))
>> +		return;
>> +
>> +	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
>> +		struct resource *res = &pdev->resource[i];
> This is essentially identical to vga_is_firmware_default() so it
> should look the same, i.e., it should use pci_dev_for_each_resource().
>

OK, will be fixed at the next version. Thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
