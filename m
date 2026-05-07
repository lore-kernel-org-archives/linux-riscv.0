Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9496CD3442
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3ZUyTmFD39nAvOH0z94mJeqMGBg7XSOPnHFy9AQy/s=; b=0YeSiF0ZwbFMYJ
	zG5YVwjOCOaECf68F6fkw2Q9+eL6ZeCxSKPaNqZeObnIU7RL58GkYuJm7APyzajwfxH2bYmW3N8rH
	yGNkeov70bDFf4iDiQrx0F+cGta0qXsrxhsenzQHyHyQ7d+ffLFOks1qrEI68ho0joSmKkHbD8aV8
	ZfT2cXH8FgwNZndE1m5swmwxJe4PB4i6vEAIF73c5dWbkHxY/NDy8tsiEEVf7+3Ced757mEBGBwWX
	9YLRmvgJHpQy33Zg67q7P1SQ6Kuxt0NNb7+j3SU9h8baNZq7E5CtAoO2P2lKlVMlgAylRbY1Le18f
	ZYNh8GZwyuY1MfMN1BwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv95-00000003MiF-1y1g;
	Thu, 07 May 2026 09:35:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv93-00000003MhH-447T
	for linux-riscv@bombadil.infradead.org;
	Thu, 07 May 2026 09:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=; b=aoMzfzsl1SEK7/lxA8CXn6wRqk
	dd+UnpKN0Ams0ugMTkgzEWT4O3MIHaZ/2+TvG493YVXLREx3mMcvPdZGFRnVtlt9E5vLvHTdM+CKO
	+GrYERHYdkq/5j3SDKOIQS6eWlupIkyVfz9QHB70KAL0GT7nE2M0w93MzOsCthpIgozehnU9W/d8A
	iSlIdptXu9gWc9u/nGP1mABxBvy949O4ej1DZLdBjDT7W0/uOmMiE59S9g4a3Y8neh2Mb6GrkylZL
	4grQDfsuH4mvGFUrrKusaLt74qBGzszpIEkvKsr1Zyn4bLPeqrQoElEZMDi/iG6mNB08BZ88NNozA
	s3tarLlA==;
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKv8z-0000000363a-35iW
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 09:35:48 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so200780a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146544; x=1778751344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=bpfq/2HDfg72vYjM32RZpg212fRKAE7SXeISg9P2vkDCFcQarQfSNhArrkBJk2BHXx
         598jq5mXU5j8q2uN7P+IityOW/KrlTmKVyl8VgADcHQC7iHT5QOzV6Ayrv88EunJP5J4
         1Vj7gxHSFC0NFv2A5TM2l9yKpPnQ3c/yPLkqMSdlqlbO49puGqVmmgTrqVNGzQMZ51Yg
         Rhl7JrTy3PGqhf/COS4EbcApdQswJEiDyYxr6C89wtz2sWFGeSqjYOoJYtNp4v17kaAQ
         oHlULYdOfu5EEoSgCODJ07TqHqGXjUJQfq96JY4UDCgCWa6cQp/8ycewocLYlrN1gCwV
         z4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146544; x=1778751344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUkIjpcmnqAY6snj5K4KsoGXaSrVhFlzy2v4P9fV3pM=;
        b=QHZrD8yGeYub/Ekyf7sCgHOzy/ZLVgsyUpKZsZE8wv2vrqe7STC0Ru6Ke8g0dAb0j/
         hc6e1ziIkjDzYDp3QmSK9D4Bntm09tDM/Gljzpg8bfVGChYXaiv/usFV3ZkuXpq7XGbS
         U2COUUddP86OUXQRttBEDScC8lIiHmyxRn4/WfCG5Mga27sXqUTjfDjvhfLxYic19eH4
         V5Y9LB+MaICvghav4tfCpWwAA+iJDN5KHQNxZVmXDaqY+KdBtBjjD/uzsps5lbFEy0tc
         6pNwcMmTzwWfncHohEc9j839eR53+xmawX8VCHJI8Er1we/ZL/p5JNp/kiL0Fw32HYxh
         /S+w==
X-Forwarded-Encrypted: i=1; AFNElJ/hbKz82lrc0vGKsK8k+9fLG7q+G2un+9nT3hTBt3N8STXeEl35Gnz9+2dRl0RQuTd1NLTHpZFjMik0EQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRKQvHhTj+v1wG6kx/4Pgzfy2FeyR1gHn7KM2Wl7X5WSMGzl+A
	I1jVUBHAw9SfbraPRW642GJaB99eO6TrsIlh+oewf//WKWwMVDL3joQw
X-Gm-Gg: AeBDietLbLqJyBLHbkqo5M4RpzjDwrKQODQ2eMCX3lYTeHnzc3WnzKUJMLb0e9uBfdo
	9P2e9P3+zgTW+KRCZrWQ1371DKhZcNtCL28xfj831C9DNdsN9IOwoY/DzwjdBniOIPo9a2lbTrQ
	DhECd0KU4xyI1Ep4n13NAZggJgYoHGkKzAf3iwto3ZMHCCo7qqJHsrAYbhsqARgg1dj5HJEDsCd
	bZE4u28YraSl//TB8tTX/31ohRZOdQRL9zUtvJOwE6Qfx92kzowy5P/ct3lWZypKGTr2f213CkZ
	92oklHKmYArN1qXHBvvzGtzYG1jc1BIEjHXlu73lQPRgCv5h3sz07maAcMULGhdLDL9Mr4Yu9u/
	wb6uERWmI+36X/gl8GDA8XNQoOBTVRiaeJrE3f3CPOMCGU5SAPIu3t7n3gO3+DY2lRndQhfuCeX
	SgCVZXfWbWCMvhvjYFdeUFoPAVNoC5pfmErtoI5rSI0Q==
X-Received: by 2002:a17:90b:1c8b:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-365ab9b8e5dmr6393838a91.4.1778146543874;
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c19387sm6651310a91.7.2026.05.07.02.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:35:43 -0700 (PDT)
Message-ID: <1a8af3cf-5edc-4ca4-b340-12ebeb2ed982@gmail.com>
Date: Thu, 7 May 2026 17:35:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] of: reserved_mem: reject reserved memory outside
 physical address range
To: Rob Herring <robh@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, saravanak@kernel.org, chenwandun@lixiang.com,
 zhaomeijing@lixiang.com, everyzhao@126.com
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
 <20260429065831.1510858-3-chenwandun@lixiang.com>
 <20260506015112.GA286568-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260506015112.GA286568-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_103546_219801_38D48077 
X-CRM114-Status: GOOD (  21.34  )
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



On 5/6/26 09:51, Rob Herring wrote:
> On Wed, Apr 29, 2026 at 02:58:22PM +0800, Chen Wandun wrote:
>> early_init_dt_reserve_memory() does not validate whether the region
>> falls within physical memory. If a device tree incorrectly specifies a
>> reserved memory region outside the physical address range:
>>
>>   - For the non-nomap path, memblock_reserve() blindly adds the region
>>     to memblock.reserved, creating a stale entry that refers to
>>     non-existent memory.
>>
>>   - For the nomap path, memblock_mark_nomap() silently fails to match
>>     any region in memblock.memory, but still returns success.
>>
>> Add a memblock_overlaps_region() check at the entry of
>> early_init_dt_reserve_memory() to reject such regions before any
>> memblock operation takes place. This also simplifies the existing nomap
>> guard: the original "overlaps && is_reserved" condition reduces to just
>> "is_reserved", since the overlap with physical memory is already
>> guaranteed by the new check.
> While I agree, I suspect we already have cases abusing reserved-memory
> like this.
Sashiko reviewed this patch and told me:
"Historically, the reserved-memory binding is often used to describe 
hardware
SRAM, DSP memory, or IOMEM carveouts that reside outside of system RAM."
IIUC, nowdays using mmio-sram DT binding is more appropriate for SRAM or 
IOMEM carveouts.
Should I drop this patch or keep it ?
Thanks.
>
>> Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>> Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
>> ---
>>   drivers/of/of_reserved_mem.c | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
>> index 9d1b0193864c..03c676052dab 100644
>> --- a/drivers/of/of_reserved_mem.c
>> +++ b/drivers/of/of_reserved_mem.c
>> @@ -112,14 +112,21 @@ static int fdt_fixup_reserved_mem_node(unsigned long node,
>>   static int __init early_init_dt_reserve_memory(phys_addr_t base,
>>   					       phys_addr_t size, bool nomap)
>>   {
>> +	if (!memblock_overlaps_region(&memblock.memory, base, size)) {
>> +		phys_addr_t end = base + size - 1;
>> +
>> +		pr_warn("Reserved memory region %pa..%pa is outside of physical memory\n",
>> +			&base, &end);
>> +		return -EINVAL;
>> +	}
>> +
>>   	if (nomap) {
>>   		/*
>>   		 * If the memory is already reserved (by another region), we
>> -		 * should not allow it to be marked nomap, but don't worry
>> -		 * if the region isn't memory as it won't be mapped.
>> +		 * should not allow it to be marked nomap. The region being
>> +		 * physical memory is guaranteed by the overlap check above.
>>   		 */
>> -		if (memblock_overlaps_region(&memblock.memory, base, size) &&
>> -		    memblock_is_region_reserved(base, size))
>> +		if (memblock_is_region_reserved(base, size))
>>   			return -EBUSY;
>>   
>>   		return memblock_mark_nomap(base, size);
>> -- 
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
