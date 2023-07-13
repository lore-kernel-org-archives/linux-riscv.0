Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CF3EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMd1wWF23LUOjpwls4wc5etBI+ZHe4scTo/wIJ5J5vk=; b=ORExegIt8rP3Ek
	ifntbeyus5yaTRdCgOLCuiJIIVCHRAdf13rBtNQILVhjKnudMVchonKs63RpGdZ8rPGHEU7X+rDUk
	RXbx49Fr7UEaZMpSqF7aUWsPdjoS8HSas7xuCX7f+9dtPNpmlO6AgO4NYjzVCqGjjV3CYBHy4MwE5
	tX5DTc2BdnQ9AU3YzlcwiFn/CzhzUeH5W25VCnpxaoDyqci7DgWAT0HBH0CqJhsUAzYYu8fwtSYZH
	e8MF5EePL82dEXZOA3rwnVTxSpcK0aJEpNwmZ25gVPWitOn83qls4KJYtkTZuKKLwkHVkoIddxC6P
	SytQgSgoUO+2cJzfrSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJumc-0038N2-2S;
	Thu, 13 Jul 2023 11:46:54 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJumX-0038KP-2w;
	Thu, 13 Jul 2023 11:46:52 +0000
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R1t8R3SfQzVjcT;
	Thu, 13 Jul 2023 19:45:27 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 19:46:40 +0800
Message-ID: <699d421a-b8cf-a338-5736-acc25f671c57@huawei.com>
Date: Thu, 13 Jul 2023 19:46:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH rfc -next 00/10] mm: convert to generic VMA lock-based
 page fault
Content-Language: en-US
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>
References: <20230713095155.189443-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230713095155.189443-1-wangkefeng.wang@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_044650_294351_CD1E3D40 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

Please ignore this one...

On 2023/7/13 17:51, Kefeng Wang wrote:
> Add a generic VMA lock-based page fault handler in mm core, and convert
> architectures to use it, which eliminate architectures's duplicated codes.
> 
> With it, we can avoid multiple changes in architectures's code if we
> add new feature or bugfix.
> 
> This fixes riscv missing change about commit 38b3aec8e8d2 "mm: drop per-VMA
> lock when returning VM_FAULT_RETRY or VM_FAULT_COMPLETED", and in the end,
> we enable this feature on ARM32/Loongarch too.
> 
> This is based on next-20230713, only built test(no loongarch compiler,
> so except loongarch).
> 
> Kefeng Wang (10):
>    mm: add a generic VMA lock-based page fault handler
>    x86: mm: use try_vma_locked_page_fault()
>    arm64: mm: use try_vma_locked_page_fault()
>    s390: mm: use try_vma_locked_page_fault()
>    powerpc: mm: use try_vma_locked_page_fault()
>    riscv: mm: use try_vma_locked_page_fault()
>    ARM: mm: try VMA lock-based page fault handling first
>    loongarch: mm: cleanup __do_page_fault()
>    loongarch: mm: add access_error() helper
>    loongarch: mm: try VMA lock-based page fault handling first
> 
>   arch/arm/Kconfig          |  1 +
>   arch/arm/mm/fault.c       | 15 ++++++-
>   arch/arm64/mm/fault.c     | 28 +++---------
>   arch/loongarch/Kconfig    |  1 +
>   arch/loongarch/mm/fault.c | 92 ++++++++++++++++++++++++---------------
>   arch/powerpc/mm/fault.c   | 54 ++++++++++-------------
>   arch/riscv/mm/fault.c     | 38 +++++++---------
>   arch/s390/mm/fault.c      | 23 +++-------
>   arch/x86/mm/fault.c       | 39 +++++++----------
>   include/linux/mm.h        | 28 ++++++++++++
>   mm/memory.c               | 42 ++++++++++++++++++
>   11 files changed, 206 insertions(+), 155 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
