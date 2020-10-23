Return-Path: <SRS0=wzy2=D6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B8AC388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 19:06:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5656220BED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2020 19:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z7pRyTrE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5656220BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1B/bk0gs2pH/PxqHJW9ks6rhVWUapazPkIOhEwsDG7c=; b=Z7pRyTrEDQBu05+sNodqyTDcG
	V3BDBctPYIgFfjEV6fe4oE3ncdkZWlZYW4zYsUPZ6F+7nw5tznbk3nyLoyHxDx52CKom1qefohs9K
	u1UpVDY3n6BzpjdQTop9klVe11ZxKeZTdA60blWsEy/XyQYZWEZVTbKA5IDlF30bFNNpRTLETFY7v
	Sqvvh1wTKCZMXilWMWeLs7YOGlLMFYb6MjIXTPGh30VclbJJqm9bnFqLHgzIWaQUrG3TaY8a/q82F
	D0KFCQ4EF5fAqiIBXoZGGHLyjFKByAahzcVe6RpowrqiBFmQPbwyQBDeu//f0/n8JJARMzTmLR72c
	5OuVS2peg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kW2Nz-0004jB-Qu; Fri, 23 Oct 2020 19:05:59 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kW2Nu-0004h1-Ui; Fri, 23 Oct 2020 19:05:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07FFE101E;
 Fri, 23 Oct 2020 12:05:51 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ABDA3F66E;
 Fri, 23 Oct 2020 12:05:50 -0700 (PDT)
Subject: Re: [PATCH v4 0/7] arm64: Default to 32-bit wide ZONE_DMA
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, robh+dt@kernel.org,
 catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org
References: <20201021123437.21538-1-nsaenzjulienne@suse.de>
From: Jeremy Linton <jeremy.linton@arm.com>
Message-ID: <9bccc5ef-9457-044b-7193-d002a395e461@arm.com>
Date: Fri, 23 Oct 2020 14:05:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201021123437.21538-1-nsaenzjulienne@suse.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_150555_089567_26C7328B 
X-CRM114-Status: GOOD (  17.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, linux-mm@kvack.org,
 robin.murphy@arm.com, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 guohanjun@huawei.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 10/21/20 7:34 AM, Nicolas Saenz Julienne wrote:
> Using two distinct DMA zones turned out to be problematic. Here's an
> attempt go back to a saner default.
> 
> I tested this on both a RPi4 and QEMU.

I've tested this in ACPI mode on the rpi4 (4+8G with/without the 3G 
limiter) as well, with Ard's IORT patch. Nothing seems to have regressed.

Thanks,

Tested-by: Jeremy Linton <jeremy.linton@arm.com>




> 
> ---
> 
> Changes since v3:
>   - Drop patch adding define in dma-mapping
>   - Address small review changes
>   - Update Ard's patch
>   - Add new patch removing examples from mmzone.h
> 
> Changes since v2:
>   - Introduce Ard's patch
>   - Improve OF dma-ranges parsing function
>   - Add unit test for OF function
>   - Address small changes
>   - Move crashkernel reservation later in boot process
> 
> Changes since v1:
>   - Parse dma-ranges instead of using machine compatible string
> 
> Ard Biesheuvel (1):
>    arm64: mm: Set ZONE_DMA size based on early IORT scan
> 
> Nicolas Saenz Julienne (6):
>    arm64: mm: Move reserve_crashkernel() into mem_init()
>    arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
>    of/address: Introduce of_dma_get_max_cpu_address()
>    of: unittest: Add test for of_dma_get_max_cpu_address()
>    arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges
>    mm: Remove examples from enum zone_type comment
> 
>   arch/arm64/mm/init.c      | 16 ++++++------
>   drivers/acpi/arm64/iort.c | 52 +++++++++++++++++++++++++++++++++++++++
>   drivers/of/address.c      | 42 +++++++++++++++++++++++++++++++
>   drivers/of/unittest.c     | 18 ++++++++++++++
>   include/linux/acpi_iort.h |  4 +++
>   include/linux/mmzone.h    | 20 ---------------
>   include/linux/of.h        |  7 ++++++
>   7 files changed, 130 insertions(+), 29 deletions(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
