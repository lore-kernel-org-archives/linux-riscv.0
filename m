Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AC4C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 08:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:CC:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mFP+ppTt9OvMoN+Of5pWXfLkU5+E8+il09L/PserPx0=; b=HSSVJJLhXV527l+wAb7FWxUfrb
	uptYbgY1Q/lKdQmFVW/3mhBXpByPwYFyOQw5/eb+qHqTyl/BwSRK3KRWNICG+U0qwV2JJIP32lXJJ
	uoEF/mrrJOfIj6//EkAvtMtLYUw075B7w9AJxObLmzYqM5UzTjHAV61p2sCvArfL+iYba0u9kAEBw
	vx4IWt/Cq1XTP6UjdTjlusd1ZXbZ+0LaKCPLf/pIXtETaLKv7sYnI75y2ZhgguYnWdL6z+/heCgbX
	h6B4mty5Nrf6/qtPwAN0CsyrFqcNCStktbn2Znk+GeOoOuFkE5zzC6VTqIFJrfAiNQx7QpmsdLv9u
	z5uNQ8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVULX-00BVkE-9C; Tue, 06 Sep 2022 08:54:15 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUKk-00BVDz-CL; Tue, 06 Sep 2022 08:53:29 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MMJwq2Zl9zmVCj;
	Tue,  6 Sep 2022 16:49:47 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 6 Sep 2022 16:53:20 +0800
CC: <corbet@lwn.net>, <peterz@infradead.org>, <arnd@arndb.de>,
	<linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
	<yangyicong@hisilicon.com>, <huzhanyuan@oppo.com>, <lipeifeng@oppo.com>,
	<zhangshiming@oppo.com>, <guojian@oppo.com>, <realmz6@gmail.com>,
	<linux-mips@vger.kernel.org>, <openrisc@lists.librecores.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, Barry Song <21cnbao@gmail.com>,
	<wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
References: <20220822082120.8347-1-yangyicong@huawei.com>
Message-ID: <34762b48-3da4-4f2e-64a7-68a44f21d4fd@huawei.com>
Date: Tue, 6 Sep 2022 16:53:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220822082120.8347-1-yangyicong@huawei.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_015326_988260_4455BF05 
X-CRM114-Status: GOOD (  15.76  )
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

Hi mm and arm64 maintainers,

a gentle ping for this..

Thanks.

On 2022/8/22 16:21, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Though ARM64 has the hardware to do tlb shootdown, the hardware
> broadcasting is not free.
> A simplest micro benchmark shows even on snapdragon 888 with only
> 8 cores, the overhead for ptep_clear_flush is huge even for paging
> out one page mapped by only one process:
> 5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
> 
> While pages are mapped by multiple processes or HW has more CPUs,
> the cost should become even higher due to the bad scalability of
> tlb shootdown.
> 
> The same benchmark can result in 16.99% CPU consumption on ARM64
> server with around 100 cores according to Yicong's test on patch
> 4/4.
> 
> This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
> 1. only send tlbi instructions in the first stage -
> 	arch_tlbbatch_add_mm()
> 2. wait for the completion of tlbi by dsb while doing tlbbatch
> 	sync in arch_tlbbatch_flush()
> My testing on snapdragon shows the overhead of ptep_clear_flush
> is removed by the patchset. The micro benchmark becomes 5% faster
> even for one page mapped by single process on snapdragon 888.
> 
> -v3:
> 1. Declare arch's tlbbatch defer support by arch_tlbbatch_should_defer() instead
>    of ARCH_HAS_MM_CPUMASK, per Barry and Kefeng
> 2. Add Tested-by from Xin Hao
> Link: https://lore.kernel.org/linux-mm/20220711034615.482895-1-21cnbao@gmail.com/
> 
> -v2:
> 1. Collected Yicong's test result on kunpeng920 ARM64 server;
> 2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
>    according to the comments of Peter Zijlstra and Dave Hansen
> 3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
>    is empty according to the comments of Nadav Amit
> 
> Thanks, Peter, Dave and Nadav for your testing or reviewing
> , and comments.
> 
> -v1:
> https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/
> 
> Anshuman Khandual (1):
>   mm/tlbbatch: Introduce arch_tlbbatch_should_defer()
> 
> Barry Song (3):
>   Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't
>     apply to ARM64"
>   mm: rmap: Extend tlbbatch APIs to fit new platforms
>   arm64: support batched/deferred tlb shootdown during page reclamation
> 
>  Documentation/features/arch-support.txt       |  1 -
>  .../features/vm/TLB/arch-support.txt          |  2 +-
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++
>  arch/arm64/include/asm/tlbflush.h             | 28 +++++++++++++++++--
>  arch/x86/include/asm/tlbflush.h               | 15 +++++++++-
>  mm/rmap.c                                     | 19 +++++--------
>  7 files changed, 61 insertions(+), 17 deletions(-)
>  create mode 100644 arch/arm64/include/asm/tlbbatch.h
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
