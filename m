Return-Path: <SRS0=Eoui=MW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D854AC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 00:59:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A9E60F0F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 00:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72A9E60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awrJT+Vo456fPS4VBoTc5II8RjcFFlcnm/PeUvhLlNk=; b=I/D+dfLwgD5dpNA2qCsBLgCsjC
	j3aBOI1azqnun9EA1RB7wMjRXE74aUGzfeiy0H5IbNnzcD/a/HODo+PQgwlUMq/PiA8VxUBQ9xUIp
	yHIvMFd4fYBxsm/zv9wh+enXhAc7wB1uB0L5j2ud1A6iV98kyKBeuiJH6J17Z0VBa/UKLJMjH5sKz
	Lf5wwboEudu0W4AZ8OmiirT9Fno6MkZ9tSBCPBBhuL2chMZLPOLarXzlOVvtYT1BWJgl1lRKBwlcG
	qtCLDTgzfSyAlCh/3mHHmdXfYFma4J1nECKbvxLTICLV18bh1d/ubLAwziK6vDI7rO55BeyrMt3Aq
	spV6BHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Gqq-006YWL-CQ; Fri, 30 Jul 2021 00:58:12 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Gqn-006YVq-Kt
 for linux-riscv@lists.infradead.org; Fri, 30 Jul 2021 00:58:11 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GbTPf0Gk2zYjDw;
 Fri, 30 Jul 2021 08:52:06 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 08:58:04 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 08:58:03 +0800
Subject: Re: [PATCH] riscv: Add support to allocate gigantic hugepages using
 CMA
To: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>
References: <20210729062417.157133-1-wangkefeng.wang@huawei.com>
 <0c8c5b9c-eb03-4d27-59e3-f544b0a96487@ghiti.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <b870eb43-d38a-f76a-129d-6ab5f5d292bb@huawei.com>
Date: Fri, 30 Jul 2021 08:58:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0c8c5b9c-eb03-4d27-59e3-f544b0a96487@ghiti.fr>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_175809_901309_5A138F63 
X-CRM114-Status: GOOD (  18.37  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2021/7/29 22:32, Alex Ghiti wrote:
> Hi Kefeng,
>
> Le 29/07/2021 =E0 08:24, Kefeng Wang a =E9crit=A0:
>> The RV32 only has at most 1GB memory(MAXPHYSMEM_1GB), so let's
>> disable HUGETLBFS on RV32.
>
> There is only one size of hugepages for RV32 which is 4MB, there isn't =

> any gigantic hugepage of 1GB: there are only 2 levels of page table, a =

> PGDIR represents 4MB and this is the only way to have a hugepage on =

> RV32. So I think we should leave hugetlbfs available on RV32.

OK,=A0 will update, thanks.

>
> Thanks,
>
> Alex
>
>> And add support to allocate gigantic
>> hugepages using CMA by specifying the hugetlb_cma=3D kernel parameter.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>> =A0 arch/riscv/Kconfig=A0=A0 | 2 +-
>> =A0 arch/riscv/mm/init.c | 2 ++
>> =A0 2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 8fcceb8eda07..20a589605307 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -33,7 +33,7 @@ config RISCV
>> =A0=A0=A0=A0=A0 select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BR=
OADCAST
>> =A0=A0=A0=A0=A0 select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNE=
L_RWX
>> =A0=A0=A0=A0=A0 select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>> -=A0=A0=A0 select ARCH_SUPPORTS_HUGETLBFS if MMU
>> +=A0=A0=A0 select ARCH_SUPPORTS_HUGETLBFS if MMU && 64BIT
>> =A0=A0=A0=A0=A0 select ARCH_USE_MEMTEST
>> =A0=A0=A0=A0=A0 select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>> =A0=A0=A0=A0=A0 select ARCH_WANT_FRAME_POINTERS
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index a14bf3910eec..f2268402894b 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -19,6 +19,7 @@
>> =A0 #include <linux/set_memory.h>
>> =A0 #include <linux/dma-map-ops.h>
>> =A0 #include <linux/crash_dump.h>
>> +#include <linux/hugetlb.h>
>> =A0 =A0 #include <asm/fixmap.h>
>> =A0 #include <asm/tlbflush.h>
>> @@ -216,6 +217,7 @@ static void __init setup_bootmem(void)
>> =A0 =A0=A0=A0=A0=A0 early_init_fdt_scan_reserved_mem();
>> =A0=A0=A0=A0=A0 dma_contiguous_reserve(dma32_phys_limit);
>> +=A0=A0=A0 hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
>> =A0=A0=A0=A0=A0 memblock_allow_resize();
>> =A0 }
>>
> .
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
