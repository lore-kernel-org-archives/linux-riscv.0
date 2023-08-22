Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99307EE4996
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 02:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ix1X6myPfwGSdIjEpfjE5MaDYiL57v9saIK2dh4Zuo=; b=M+IFUWNGAsL+tk
	2cJflBQgl4+UDA/utTd88i77PgYuBYE1wXCOyyiIlR5SfbHgfsSKDX6VFRUXvRC4jNBPhEuUSWuEC
	BiwLUxUytwWf2Q1wKMA1R4eMv9L7CX5teeFomjVjP66gFg4fpmd778A2QIizUdkmmInjUHs2U97X7
	cFAuSHiUdUrXMwo6UlNtVGkjHM1WOT+af4yiFWPbSAXXM9Fmzmeu777OgT9ycfTgWykRU79FI2Yzt
	pGADGOnUDNueYpl5W+cgrR/t6MC+hQ5E5HGrMKE9a2q5F4PnAwIfslB8CakIioaQvkJZeN31kPS9V
	q6lSrr4FhAU6WRHHmPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYHHr-00EzmR-0y;
	Tue, 22 Aug 2023 02:38:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYHHp-00EzmL-2N
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Aug 2023 02:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hOQdPtnw3m19UDDITnRXpdQBxqvbDomPjsl4zD5Ej+c=; b=CWkUgz/flH7rPCbPCiN38nPtDL
	y8Ba21qBHeWwiWZ0vWlZ126Hbmz0k3oWaAa5M7kmTydb+14Xp8BbO/QO6LxzM4/VUwuWb6dBNepXR
	FGeniR+UpUchbjIu13hZnqEWpF6p8OtWia8/KrjpKrdSY7FkbIg3A5pau348I8Wnh58LVRjnxNO0C
	SNYmUtmAp47RUuUabDjVTopRRmPq/TbdkpLox8lyTz/2Qqx4SeFDdk75OeS0Ne4C5kJ35eUOFQgbz
	CCNRxF5NXa7YZfOwoMXDVgQ6B1Gynlr8DM59XcMT0z7burYoBbI/fhoHWRc7UE1XOJfWaTeUKnBID
	gQEGcoLA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYHHi-002DPn-2u
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 02:38:27 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8DxBfGFH+RkNscaAA--.54886S3;
	Tue, 22 Aug 2023 10:37:57 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxX8+EH+RkBPhfAA--.37065S3;
	Tue, 22 Aug 2023 10:37:56 +0800 (CST)
Message-ID: <79c3b66a-61b0-aafb-0935-975b0ce1ecb3@loongson.cn>
Date: Tue, 22 Aug 2023 10:37:56 +0800
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
 Emil Velikov <emil.velikov@collabora.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
References: <20230821173819.GA362570@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230821173819.GA362570@bhelgaas>
X-CM-TRANSID: AQAAf8AxX8+EH+RkBPhfAA--.37065S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFy8Cr13Cw1rGw17Gw4rJFc_yoW5WF4xpr
	WrJFs5KF4kJr4Syrs7Gw1kXF1Fyw4rXas0kFn0vwn8A345urnaqFW0yrZ09FnrWrs7J3W2
	vF4Fg34rWFWYvagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUU
	U==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_033824_028897_CAACF28E 
X-CRM114-Status: GOOD (  25.02  )
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

On 2023/8/22 01:38, Bjorn Helgaas wrote:
> On Fri, Aug 18, 2023 at 12:09:29PM +0800, suijingfeng wrote:
>> On 2023/8/18 06:08, Bjorn Helgaas wrote:
>>> On Wed, Aug 16, 2023 at 06:05:27AM +0800, Sui Jingfeng wrote:
>>>> Currently, the vga_is_firmware_default() function only works on x86 and
>>>> ia64, it is a no-op on ARM, ARM64, PPC, RISC-V, etc. This patch completes
>>>> the implementation for the rest of the architectures. The added code tries
>>>> to identify the PCI(e) VGA device that owns the firmware framebuffer
>>>> before PCI resource reallocation happens.
>>> As far as I can tell, this is basically identical to the existing
>>> vga_is_firmware_default(), except that this patch funs that code as a
>>> header fixup, so it happens before any PCI BAR reallocations happen.
>> Yes, what you said is right in overall.
>> But I think I should mention a few tiny points that make a difference.
>>
>> 1) My version is *less arch-dependent*
> Of course.  If we make the patch simple and the commit log simple by
> removing extraneous details, this will all be obvious.
>
>> 2) My version focus on the address in ranges, weaken the size parameter.
>>
>> Which make the code easy to read and follow the canonical convention to
>> express the address range. while the vga_is_firmware_default() is not.
> Whether it's start/size or start/end is a trivial question.  We don't
> need to waste time on it now.
>
>> 3) A tiny change make a big difference.
>>
>> The original vga_is_firmware_default() only works with the assumption
>> that the PCI resource reallocation won't happens. While I see no clue
>> that why this is true even on X86 and IA64. The original patch[1] not
>> mention this assumption explicitly.
>> [1] 86fd887b7fe3 ('vgaarb: Don't default exclusively to first video device with mem+io')
>>
>>> That sounds like a good idea, because this is all based on the
>>> framebuffer in screen_info, and screen_info was initialized before PCI
>>> enumeration, and it certainly doesn't account for any BAR changes done
>>> by the PCI core.
>> Yes.
>>
>>> So why would we keep vga_is_firmware_default() at all?  If the header
>>> fixup has already identified the firmware framebuffer, it seems
>>> pointless to look again later.
>> It need another patch to do the cleanup work, while my patch just
>> add code to solve the real problem.  It focus on provide a solution
>> for the architectures which have a decent way set up the
>> screen_info.  Other things except that is secondary.
> I don't want both mechanisms when only one of them is useful.  PCI BAR
> reassignment is completely fine, and keeping the assumption in
> vga_is_firmware_default() that we can compare reassigned BAR values to
> the pre-reassignment screen_info range is a trap that we should
> remove.


OK,it's clear now.  I know what to do next.
Thanks.


> Bjorn


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
