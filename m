Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6ADC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Dec 2021 06:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Acuz+zccj3Rom6IFqzOvrsoyGwleeoxxnI5t0qFt6as=; b=4Q0d2aTCGKeON9I4mbKhNYDEbY
	J4HHugapF+/6c3SA9sLOYeAGehOXVLcLFqM+xchvKZy32rhZOF1lOsTjk5Pd22zK5Td1n9x27kkRx
	OG0ORC5TNnc2IN8E2hv9qiquiOa+9R20Z78qQYlq+cmkvWqS5WekFjxshlYf2FSghfNwTL7HDsQQ6
	VQd9fS1Lmq7wv/8V4/Q79VT8iexXn4lG2f8YvysHJJ0+yX2kJHEwLog+DXAkRKw8JCeg0RhPkvwVu
	Id+CGSTB6LZKMXut6LWgef5S7Ky4GjGnsM1zUBzmH0bEE8yw436X3OVziMlYUyjjqxFHsDlMy8v86
	eiUTKs5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2pCQ-003i8e-8F; Thu, 30 Dec 2021 06:46:06 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2pCN-003i7M-39
 for linux-riscv@lists.infradead.org; Thu, 30 Dec 2021 06:46:04 +0000
Received: from kwepemi100004.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JPdxW5nyDzZdsk;
 Thu, 30 Dec 2021 14:42:39 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 kwepemi100004.china.huawei.com (7.221.188.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 14:45:58 +0800
Received: from [10.174.179.79] (10.174.179.79) by
 kwepemm600003.china.huawei.com (7.193.23.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 30 Dec 2021 14:45:58 +0800
Subject: Re: [PATCH -next 0/2] riscv/mm: Enable THP migration
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <palmerdabbelt@google.com>, <wangkefeng.wang@huawei.com>,
 <anup@brainfault.org>, <alex@ghiti.fr>, <jszhang@kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211123140638.3852400-1-sunnanyong@huawei.com>
From: Nanyong Sun <sunnanyong@huawei.com>
Message-ID: <3c9ba160-74b2-a933-e8e5-9fd5359dc2cc@huawei.com>
Date: Thu, 30 Dec 2021 14:45:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211123140638.3852400-1-sunnanyong@huawei.com>
X-Originating-IP: [10.174.179.79]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_224603_354467_07B5FF08 
X-CRM114-Status: GOOD (  11.49  )
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

Hi Palmer,

This patchset has been sent for one month ago, I was wondering if you could

have a review and give a feedback please, thanks.

On 2021/11/23 22:06, Nanyong Sun wrote:
> This series enables THP migration on riscv via ARCH_ENABLE_THP_MIGRATION.
> But first this adjusts PAGE_PROT_NONE to satisfy generic memory semantics
> like the behavior of pmd_present() and pmd_trans_huge() when in
> THP splitting or migration.
>
> This feature can reduce the time of THP migration by not splits THP
> before migration and can guarantee the pages after migration are still
> contiguous.[1]
>
> I have tested the below test case on qemu based on riscv after
> enabling this feature, the throughput of THP migration gains 13x
> performance improvement:
> https://github.com/x-y-z/thp-migration-bench
>
> I also have tested and passed the test cases under
> tools/testing/selftests/vm.
>
> [1]: https://lwn.net/Articles/723764/
>
> Nanyong Sun (2):
>    riscv/mm: Adjust PAGE_PROT_NONE to comply with THP semantics
>    riscv/mm: Enable THP migration
>
>   arch/riscv/Kconfig                    |  1 +
>   arch/riscv/include/asm/pgtable-bits.h |  2 +-
>   arch/riscv/include/asm/pgtable.h      | 16 +++++++++++-----
>   3 files changed, 13 insertions(+), 6 deletions(-)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
