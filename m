Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C1C678DC
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 10:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngpccK6XvXImBrZIn2EN4KoKuZq8QSWgMU76KOlahNY=; b=0gW6yn3S6zThA2
	uEwhF7t57EgpNim+tzffRfvoAW80mfymswJOUY21gogHWc/mcIRgFXoFKLLmyAn5gdxGMg5dLZ8P0
	jMobqpyFnmss1wwK58vk0OeCqYPhC744lmEASElkxILrpd1rk386k3g3OogADH5I5E7oiHRznGmnV
	bT+CONJORR0W5Vh30qYmRdUXaCNyCTzslx2WOcNZKVwWvc4FU9oz0M7kle4Bs9bb3IoDrvH5NtDgX
	JClNktsGAWOwHNalaQDAK+C0C2ti3rKnzU5WrHObRUfar6B/6uUJR4KOm+RNYAFk07vP1nyju0CuY
	88Cxl2/OthXXrKa5GCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwbG-008ClP-1a;
	Fri, 18 Aug 2023 10:21:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwbE-008Cl7-29
	for linux-riscv@bombadil.infradead.org;
	Fri, 18 Aug 2023 10:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=U5/h4Jty+HOcYmdchBXiWgZGsK0UrC7R9kQU61pG61Y=; b=R6lePe3FRI8fmr1QSu/GM8HrTM
	mJg2pdMEhd1gVY7zVCIPNMUBhh5ENupgjJTQFreBcWIaCBFh3L4jZ6iM51l93I6FS79hXA020fafK
	pIVn+XL/lKwiWDuNnvhl4dBZQVUYxXeD0vvHT0zpZBxku12WIgjXL0G5YfoSQYqOxGbm2KO5ja++T
	zUI6WUxg01VkUwmTa8By4x7mufI0/2qVnU4shXS1I/9PHjH7lRuUPkSD62RyiTeiA5DxvucF0EvuD
	FrtEd0s42grXKHNacSRqzZX4anVsZALSBaL9nETo59m/ZjQd0YNm9lLoUBzSBfSwY3sH2OjVurrT9
	J0Cnc21g==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qWwb8-008rAa-Kc
	for linux-riscv@lists.infradead.org; Fri, 18 Aug 2023 10:20:58 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8BxbOr8Rd9kLdgZAA--.25768S3;
	Fri, 18 Aug 2023 18:20:44 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHCP8Rd9kYIpdAA--.13478S3;
	Fri, 18 Aug 2023 18:20:44 +0800 (CST)
Message-ID: <fb242a7e-b1ee-7be0-cbc4-be710e246279@loongson.cn>
Date: Fri, 18 Aug 2023 18:20:44 +0800
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
X-CM-TRANSID: AQAAf8BxHCP8Rd9kYIpdAA--.13478S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWrGr4fCF15Jr4DCF1xZwc_yoW5XryfpF
	yfua93tF4kWrs8KanFvw18WF47urZ7Aa9xArnxJry0kr43W34FgrZIkr4Yya47JFsaqFyS
	va9Fq348t3WDAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
	daVFxhVjvjDU0xZFpf9x07jYSoJUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_112055_408993_B98FBAF0 
X-CRM114-Status: GOOD (  12.91  )
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
>> Please note that before apply this patch, vgaarb can not select the
>> right boot vga due to weird logic introduced with the commit
>> 57fc7323a8e7c ("LoongArch: Add PCI controller support")
> If we need this reference to 57fc7323a8e7c, we need more specifics
> about what the "weird logic" is.  pci_fixup_vgadev() is the only
> obvious VGA connection, so I suppose it's related to that.
>
Yes, you are right.

The pci_fixup_vgadev() function will set the last VGA device enumerated as the default boot device.
By "the last" VGA device, I mean that this device has the largest PCI bus, domain, and function triple.
Thus, it is added to vgaarb in the end of all VGA device.
So that logic expresses that the last one added will be the default.
This probably is not what we want.


On the LS3A5000+LS7A1000 platform, the last VGA device is a S3 graphics 
(08:00.0). This GPU has two cores. Say the log below:


$ lspci | grep VGA

  00:06.1 VGA compatible controller: Loongson Technology LLC DC (Display Controller) (rev 01)
  03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Caicos XT [Radeon HD 7470/8470 / R5 235/310 OEM]
  07:00.0 VGA compatible controller: S3 Graphics Ltd. Device 9070 (rev 01)
  08:00.0 VGA compatible controller: S3 Graphics Ltd. Device 9070 (rev 01)

[    0.361781] vgaarb: loaded
[    0.367838] pci 0000:00:06.1: Overriding boot device as 1002:6778
[    0.367841] pci 0000:00:06.1: Overriding boot device as 5333:9070
[    0.367843] pci 0000:00:06.1: Overriding boot device as 5333:9070

1) The "weird" logic completely overrides whatever decision VGAARB ever made.

It seems to say that the decision ever made by VGAARB is useless.
Well, I think VGAARB shouldn't endure this; VGAARB has to be small.

  

2) The results it gives are not correct either.

In the first testing example in my commit message,
it overrides the S3 graphics as the default boot VGA instead of the AMD/ATI GPU.
Actually, the firmware chooses the AMD/ATI GPU as the "frimware default".

  

3) It tries to make the decision for the end user instead of the firmware.

Therefore, that function is always wrong. Again, it's a policy, not a mechanism.


Since that already have been merge, I'm fine.
Maybe Huacai is busy, he might don't has the time to carry on a deep thinking.
But I think we should correct the mistake ever made,
let's merge this patch to make vgaarb great again ?


Well, that commit is not a dependency, I don't mind delete the referencing
to that commit. After all, I think my patch will be effective on other architectures.
Is additional testing on ARM64 and X86 is needed, if so I have to find the machine to
carry on the testing.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
