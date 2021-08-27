Return-Path: <SRS0=rXXN=NS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B24C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 15:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1856160E90
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Aug 2021 15:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1856160E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWUG5zVZv7F/+KSvLt0nm7Ao/o2kruFdwKoGLn2qH44=; b=xcYhl5rZSG74yn5H82lVlRnWEU
	+YYiEa1oOfLplYcKWYVA4gtQglyVumx5sGZJcXaWezLRMwTLyQx5ArefwdgVPn0wL2xMiQX567l6D
	uDKlB4FjzdPZ2qRFIQKanRrpT5u3YM13NcvWeSn0a5Me28zh/WYT//E1a8hg7wCs2yLAuMQRvUMxM
	MEX7L15bpPZQM+uvWbapbu4vrdm+cafnXvtD4t2g8Xlz6136/V5EM53cnbdyqWHf8xIn1flXjjpxo
	5iTdCZ4x2lJUqnkOhM9Px3zS8XrqBl99XTUm5zWaKcN/1dicbkdAgGncxFgGP1moRtM1aKhSpdwLn
	8uRI+F1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJdcc-00CfeJ-3y; Fri, 27 Aug 2021 15:18:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJdcZ-00CfdF-9w
 for linux-riscv@lists.infradead.org; Fri, 27 Aug 2021 15:18:21 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gx3Cb4nLtzbdCK;
 Fri, 27 Aug 2021 23:14:19 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 23:18:11 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 23:18:10 +0800
Subject: Re: [PATCH] riscv: mm: Enable PMD split page table lock for RV64
To: Palmer Dabbelt <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
References: <20210730131146.184208-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <b39cf00f-f6c4-3a19-9fb3-23135a17f0d3@huawei.com>
Date: Fri, 27 Aug 2021 23:18:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210730131146.184208-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_081819_681435_3869B21E 
X-CRM114-Status: GOOD (  12.35  )
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

Hi Palmer, ping ...

On 2021/7/30 21:11, Kefeng Wang wrote:
> After commit 1355c31eeb7e ("asm-generic: pgalloc: provide generic
> pmd_alloc_one() and pmd_free_one()"), it is easy to enable
> ARCH_ENABLE_SPLIT_PMD_PTLOCK for RV64.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/riscv/Kconfig   | 1 +
>   arch/riscv/mm/init.c | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8fcceb8eda07..c3e456fc7108 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,6 +12,7 @@ config 32BIT
>   
>   config RISCV
>   	def_bool y
> +	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>   	select ARCH_CLOCKSOURCE_INIT
>   	select ARCH_SUPPORTS_ATOMIC_RMW
>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index e547e53cddd2..ce12905a0224 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -361,7 +361,8 @@ static phys_addr_t __init alloc_pmd_late(uintptr_t va)
>   	unsigned long vaddr;
>   
>   	vaddr = __get_free_page(GFP_KERNEL);
> -	BUG_ON(!vaddr);
> +	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
> +
>   	return __pa(vaddr);
>   }
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
