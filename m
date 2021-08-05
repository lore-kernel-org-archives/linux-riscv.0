Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14874C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 16:24:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49A5610CD
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 16:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C49A5610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXADN3pOQX7Q2FIO5enXmJVAopeZFYPonQOY5Q79n1I=; b=JhTepZqFoNsPcQNXMSnujzLl4m
	cd0zTZJRJQ/xABiCLNugFBj/FW2Bc4jOICUG9wNFcvrYAfKCFhLyN8cVM9jXaoMitAoR18AgpHix3
	gLxwj62qgHM3TFWT8q6Qy9VKQTBxt7Tc1DA7rht5y0mlUcP9ttjI7wQDmf+QMQpIxj1t0X68dPwNQ
	0J7AzAAkjgLVeUyZf8Xl3/jYboNCIOe6en0UtVOI4sP6b5JbFm4y3panmZ0MZ/bJnkmxb0SLeb+WB
	RapwvOFyahaRXDp9V8DU7Cuh+sLf4/wHan8sconUwNUmgiJmXKGUYY90vXpTfmtfs3kJ+6/Yad10f
	f3vxccgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBgAX-00AEkb-6J; Thu, 05 Aug 2021 16:24:29 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBgAU-00AEkH-1D
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 16:24:28 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GgYhv1Cgzz836s;
 Fri,  6 Aug 2021 00:19:27 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 6 Aug 2021 00:24:19 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 6 Aug 2021 00:24:19 +0800
Subject: Re: [PATCH] riscv: mm: Enable PMD split page table lock for RV64
To: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>
References: <20210730131146.184208-1-wangkefeng.wang@huawei.com>
 <8bb6c662-afbb-feea-dadb-9d2ea49ded5b@ghiti.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <ef07bed0-8f7b-e1d7-69cb-62da120ee52f@huawei.com>
Date: Fri, 6 Aug 2021 00:24:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8bb6c662-afbb-feea-dadb-9d2ea49ded5b@ghiti.fr>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_092426_767916_3AF650E7 
X-CRM114-Status: GOOD (  18.38  )
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


On 2021/8/5 19:51, Alex Ghiti wrote:
> Hi Kefeng,
>
> On 30/07/2021 15:11, Kefeng Wang wrote:
>> After commit 1355c31eeb7e ("asm-generic: pgalloc: provide generic
>> pmd_alloc_one() and pmd_free_one()"), it is easy to enable
>> ARCH_ENABLE_SPLIT_PMD_PTLOCK for RV64.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>> =A0 arch/riscv/Kconfig=A0=A0 | 1 +
>> =A0 arch/riscv/mm/init.c | 3 ++-
>> =A0 2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 8fcceb8eda07..c3e456fc7108 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -12,6 +12,7 @@ config 32BIT
>> =A0 =A0 config RISCV
>> =A0=A0=A0=A0=A0 def_bool y
>> +=A0=A0=A0 select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>> =A0=A0=A0=A0=A0 select ARCH_CLOCKSOURCE_INIT
>> =A0=A0=A0=A0=A0 select ARCH_SUPPORTS_ATOMIC_RMW
>> =A0=A0=A0=A0=A0 select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index e547e53cddd2..ce12905a0224 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -361,7 +361,8 @@ static phys_addr_t __init =

>> alloc_pmd_late(uintptr_t va)
>> =A0=A0=A0=A0=A0 unsigned long vaddr;
>> =A0 =A0=A0=A0=A0=A0 vaddr =3D __get_free_page(GFP_KERNEL);
>> -=A0=A0=A0 BUG_ON(!vaddr);
>> +=A0=A0=A0 BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
>> +
>> =A0=A0=A0=A0=A0 return __pa(vaddr);
>> =A0 }
>>
>
> I took the time to check how the page table lock works, and indeed, =

> the commit you mention makes it easy to enable this feature since the =

> initialization of the lock for the general case is done there and your =

> patch seems correct as this is the only place we allocate a PMD page, =

> and the PTE page allocation already calls pgtable_pte_page_ctor.
>
> Maybe your commit message would need some of the explanation I gave =

> above, or something similar, but this is up to you.
There is a=A0 Documentation/vm/split_page_table_lock.rst doc about this =

feature, we could learn more from changelog with the feature introduced.
>
> You can add:
>
> Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
Thanks, Alex ;)
>
> Thanks,
>
> Alex
> .
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
