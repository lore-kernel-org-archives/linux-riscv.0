Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BE7C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YL45XKvzYJ/TM4cq/7Dn/blLedjFwZLtdYYv/GSK8Os=; b=nYbKRNMHZqTK5G
	b2hhi0oCuhJOvf6i2YFZ1/EL+L0G5c0cQ++1ydZoDT58gtKt3EWSw2EsNjb3iSa2eyuziUcL+LmKC
	V4xlEHSv2MM4uQdNXbRs6R+rUkmrE/OKTrAzgkiCQu5rucpJ69pOu0G+nc955e0tES4hn39W78xFi
	oyU0dwHggmE16rZhlWiIStSVZ43bushZLp+XQBBQQDqOXJ6pAuQOSEaLSFQfrXcrGJ3ygvVCndoVn
	y34BH9AD4pmRFcyJxnALtLIRRnBYZu1mxTyllBb/QWoR7VzcG1uGFD+XdbOzrfyLtU2algd+wcr5k
	09xdiebaSad5CaToww1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hfH-002zog-3Z; Mon, 13 Jun 2022 10:51:23 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hf4-002zke-Ka; Mon, 13 Jun 2022 10:51:12 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LM7bq14W9z1K9Sb;
	Mon, 13 Jun 2022 18:49:11 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 18:50:47 +0800
Received: from [10.174.178.120] (10.174.178.120) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 18:50:45 +0800
Message-ID: <4e312b22-73ba-8d59-b494-b7cb1d7bbb49@huawei.com>
Date: Mon, 13 Jun 2022 18:50:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: mawupeng <mawupeng1@huawei.com>
Subject: Re: [PATCH v4 5/6] mm: Only remove nomap flag for initrd
To: <ardb@kernel.org>, <will@kernel.org>, <catalin.marinas@arm.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <dvhart@infradead.org>, <andy@infradead.org>,
	<rppt@kernel.org>, <akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <david@redhat.com>,
	<anshuman.khandual@arm.com>, <thunder.leizhen@huawei.com>,
	<wangkefeng.wang@huawei.com>, <gpiccoli@igalia.com>, <chenhuacai@kernel.org>,
	<geert@linux-m68k.org>, <vijayb@linux.microsoft.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-efi@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, <mawupeng1@huawei.com>
References: <20220613082147.183145-1-mawupeng1@huawei.com>
 <20220613082147.183145-6-mawupeng1@huawei.com>
 <CAMj1kXFn_FKt2jLJOntvT0FBtL9b=VWZdrBFpn48LBMDLy1WBQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAMj1kXFn_FKt2jLJOntvT0FBtL9b=VWZdrBFpn48LBMDLy1WBQ@mail.gmail.com>
X-Originating-IP: [10.174.178.120]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_035111_074219_B390FB70 
X-CRM114-Status: GOOD (  11.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 6/13/2022 5:42 PM, Ard Biesheuvel wrote:
> On Mon, 13 Jun 2022 at 10:00, Wupeng Ma <mawupeng1@huawei.com> wrote:
>>
>> From: Ma Wupeng <mawupeng1@huawei.com>
>>
>> Commit 177e15f0c144 ("arm64: add the initrd region to the linear mapping explicitly")
>> remove all the flags of the memory used by initrd. This is fine since
>> MEMBLOCK_MIRROR is not used in arm64.
>>
>> However with mirrored feature introduced to arm64, this will clear the mirrored
>> flag used by initrd, which will lead to error log printed by
>> find_zone_movable_pfns_for_nodes() if the lower 4G range has some non-mirrored
>> memory.
>>
>> To solve this problem, only MEMBLOCK_NOMAP flag will be removed via
>> memblock_clear_nomap().
>>
>> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> 
> This needs and ack from the arm64 maintainers, please?
> And also please fix the subject to include 'arm64'
> 

Ok, I will include 'arm64' in my subject in v5.

Thanks for reviewing.

> 
>> ---
>>  arch/arm64/mm/init.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index 339ee84e5a61..8456dbae9441 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -350,8 +350,8 @@ void __init arm64_memblock_init(void)
>>                         "initrd not fully accessible via the linear mapping -- please check your bootloader ...\n")) {
>>                         phys_initrd_size = 0;
>>                 } else {
>> -                       memblock_remove(base, size); /* clear MEMBLOCK_ flags */
>>                         memblock_add(base, size);
>> +                       memblock_clear_nomap(base, size);
>>                         memblock_reserve(base, size);
>>                 }
>>         }
>> --
>> 2.25.1
>>
> .

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
