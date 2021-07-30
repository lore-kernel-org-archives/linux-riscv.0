Return-Path: <SRS0=Eoui=MW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93AAC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 13:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EA26052B
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 13:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48EA26052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMZhPSn/bNyIWWiBRo/vft1H6/8qqORtdB/pQLWAMTg=; b=YVJOtnR4xvRIalomGmYpSg1dVq
	g5gJvty1wDN2oG+PvGtpzUSnv2BkbHmJN6INZWAiQ69ovueKC+hV5nRfhQ5a3s5SCiw3iuonOoC4r
	a9Fh6HgeyhQXA0lCVezIqFDKwyY+ZP5AQesc9jAf5Vb0u7ufnCLElMCrPxqstaGp7tSdTKA5tznLp
	U2I/xAUgREJjRt6eksnQw58PldiyjSbnG70Ytk5BBRG5eV7tUvfaefEu0EbZLD1nvNuqdqrizcKBN
	MCcRieqycM4/e8l47OdH3ustwo44uyqsATg2P09tQiwh45QAKq7MCY0P4c/6y76ANXuhQYjr+Gd6p
	vwkuTRcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9S8y-008iqt-Gz; Fri, 30 Jul 2021 13:01:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9S8u-008ip7-Iz
 for linux-riscv@lists.infradead.org; Fri, 30 Jul 2021 13:01:38 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GbnVy6KBtz80xm;
 Fri, 30 Jul 2021 20:57:46 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 21:01:33 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Jul 2021 21:01:33 +0800
Subject: Re: [PATCH v2] riscv: Add support to allocate gigantic hugepages
 using CMA
To: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>
References: <20210730013017.50651-1-wangkefeng.wang@huawei.com>
 <09d4ec9c-c95a-c6c7-32b8-65822a8a2640@ghiti.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <3a21d44b-58e6-6fe9-e782-37aeccafb979@huawei.com>
Date: Fri, 30 Jul 2021 21:01:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <09d4ec9c-c95a-c6c7-32b8-65822a8a2640@ghiti.fr>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_060136_844402_EFAC7787 
X-CRM114-Status: GOOD (  13.74  )
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


On 2021/7/30 20:09, Alex Ghiti wrote:
> Le 30/07/2021 =E0 03:30, Kefeng Wang a =E9crit=A0:
>> commit 9e953cda5cdf ("riscv: Introduce huge page support for32/64bit
>
> "Commit"
>
>> kernel") add support gigantic hugepage support for RV64.
>
> "adds support for gigantic huge pages for RV64."
>
>>
>> This patch add support to allocate gigantic hugepages using CMA by
>
> "adds"
>
>> specifying the hugetlb_cma=3D kernel parameter on RV64.
>>
>> Cc: Alexandre Ghiti <alex@ghiti.fr>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>> v2: don't disable hugepage support on RV32.
>>
>> =A0 arch/riscv/mm/init.c | 3 +++
>> =A0 1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index a14bf3910eec..e547e53cddd2 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -19,6 +19,7 @@
>> =A0 #include <linux/set_memory.h>
>> =A0 #include <linux/dma-map-ops.h>
>> =A0 #include <linux/crash_dump.h>
>> +#include <linux/hugetlb.h>
>> =A0 =A0 #include <asm/fixmap.h>
>> =A0 #include <asm/tlbflush.h>
>> @@ -216,6 +217,8 @@ static void __init setup_bootmem(void)
>> =A0 =A0=A0=A0=A0=A0 early_init_fdt_scan_reserved_mem();
>> =A0=A0=A0=A0=A0 dma_contiguous_reserve(dma32_phys_limit);
>> +=A0=A0=A0 if (IS_ENABLED(CONFIG_64BIT))
>> +=A0=A0=A0=A0=A0=A0=A0 hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
>> =A0=A0=A0=A0=A0 memblock_allow_resize();
>> =A0 }
>>
>
> Apart from the minor nits above, you can add:
>
> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
>
Resend with update, thanks :)
> Thanks!
>
> .
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
