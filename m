Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2794C71132
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 01:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VijikHSh0sQUPahxG19Pkgw8gwxgcRcWIaDm0tUR2Ls=; b=qNX0q6kB7VhA06
	FrbF+kgNHKr7nnSbdAdMb95PnKgn6+WiR/M/PFxe6L5GkWzHuTXHGZXjoKV/Oj0P7rxJf9sEaVpM3
	xHB+J18J1VGJV6/ZJVARmdha6ttCWIJdBdpvWLO+FCsjW9o1fHey/EYWxVs6id7CZXrB3fV/zyKFg
	w4cs3lzcvMZguJEcAUrm66B3vD0j2CwnC0ah0OixfQB/ouHU59opxt6yeMmYYk/pRA1uhALuBRLlF
	iN9aNFdeAW9xSFssTM5FdI5vBu+4Ikt9f3wwKumuM5NxVlD/3WeWKnSUT9eWx8uyKBOATvNu6LMnT
	8X0XVdz8tKxMb+LyIz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWobg-007VPX-2k;
	Fri, 18 Aug 2023 01:48:56 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWobc-007VOs-2Y
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 01:48:55 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8AxFvH+zd5k5L0ZAA--.52598S3;
	Fri, 18 Aug 2023 09:48:46 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx7yP+zd5kaEddAA--.57387S3;
	Fri, 18 Aug 2023 09:48:46 +0800 (CST)
Message-ID: <9fb7ace8-2f07-17b6-10ce-7116b05b0148@loongson.cn>
Date: Fri, 18 Aug 2023 09:48:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, loongson-kernel@lists.loongnix.cn,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
References: <20230817220853.GA328159@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230817220853.GA328159@bhelgaas>
X-CM-TRANSID: AQAAf8Cx7yP+zd5kaEddAA--.57387S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JryDCF4fZr17XryUJw48KrX_yoWkZwbE9F
	W8ta4xGa4UJa47JanFkF4ruasY9rW5W3WxG34DJr4xX3yfurZ3X3yDtryxtr4ag3WjkrnI
	g34Utw48KwnY9osvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_184853_213489_021AB2E7 
X-CRM114-Status: UNSURE (   8.13  )
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
>> +		if (resource_type(res) != IORESOURCE_MEM)
>> +			continue;
>> +
>> +		if (!res->start || !res->end)
>> +			continue;
>> +
>> +		if (res->start <= fb_start && fb_end <= res->end) {
>> +			pdev_boot_vga = pdev;
>> +
>> +			vgaarb_info(&pdev->dev,
>> +				    "BAR %d contains firmware FB\n", i);
> Print the BAR with %pR and include the framebuffer region from
> screen_info in the same format.
>

I do remember that you already told me to do this in V3, sorry for not 
replying to you at V3. Most of the time, what you tell me is right.But 
here, I think I need to explain. Because doing it that way will make the 
code line too long,and it will exceed 80 characters in the column if we 
print too much.
I believe that the vgaarb_info() at here is already the most compact and 
simplest form. Printing the BAR with %pR is not absolute necessary, 
because we can get the additional information by: $ lspci | grep VGA

$ dmesg | grep 05:00.0
$ dmesg | grep 0000:03:00.0
$ dmesg | grep PCI


Actually, I only add something that is absolute necessary.
Printing BAR with %pR and/or Printing the framebuffer region
is consider to only for *debugging* purpose.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
