Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9083CD4F2E
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdZ0UzVBeAqA8ciADZi5gXy+pIBAVMOFhYweKlP7YcY=; b=oqahdXzphi9rNr
	I/gAToTMTKVn/iZolUTyoW8A1M/KcE4gAXuvBLTLeqOFbxj8I7wdeCruO1mHhD2vgw2cKd/StiSJu
	HQtb9gskpsEGCcWH7CvJtV7qCjEEhsB9C0ILdIaTXxrJVxdn6eQkhBU/PgAI2JVFYOehIDSqrXZww
	h+/hBdv4+JXGvSW+18beAMByEtBhm5NB1bT2Ev/I+hGpaBeQ6ZXJsHxDhcP4o5Ckyv9gWrE8TSDMg
	DgRZyP3CVVHQZVd2aYEovDHIjp4+cfuPiiu/D+CYO8M3GoFN/lWho7jDsdPLGHdyOkdhO/2vPKknt
	kjMyHpKkMBRBDnFBzc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaom-008Ez7-0b;
	Fri, 22 Sep 2023 07:43:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjanf-008EGJ-34;
	Fri, 22 Sep 2023 07:42:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CC2DDA7;
	Fri, 22 Sep 2023 00:42:43 -0700 (PDT)
Received: from [10.57.65.11] (unknown [10.57.65.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3AA23F5A1;
	Fri, 22 Sep 2023 00:41:54 -0700 (PDT)
Message-ID: <af6a0bb0-4645-4667-aa0e-e78fac3aad28@arm.com>
Date: Fri, 22 Sep 2023 08:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Fix set_huge_pte_at() panic on arm64
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 SeongJae Park <sj@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921093026.230b2991be551093e397f462@linux-foundation.org>
 <7c5c2c00-d657-44fd-b478-743b43c57e8a@arm.com> <ZQx/f35o0zT2lug4@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZQx/f35o0zT2lug4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_004208_301415_C2F630FA 
X-CRM114-Status: GOOD (  15.15  )
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

On 21/09/2023 18:38, Catalin Marinas wrote:
> On Thu, Sep 21, 2023 at 05:35:54PM +0100, Ryan Roberts wrote:
>> On 21/09/2023 17:30, Andrew Morton wrote:
>>> On Thu, 21 Sep 2023 17:19:59 +0100 Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>> Ryan Roberts (8):
>>>>   parisc: hugetlb: Convert set_huge_pte_at() to take vma
>>>>   powerpc: hugetlb: Convert set_huge_pte_at() to take vma
>>>>   riscv: hugetlb: Convert set_huge_pte_at() to take vma
>>>>   s390: hugetlb: Convert set_huge_pte_at() to take vma
>>>>   sparc: hugetlb: Convert set_huge_pte_at() to take vma
>>>>   mm: hugetlb: Convert set_huge_pte_at() to take vma
>>>>   arm64: hugetlb: Convert set_huge_pte_at() to take vma
>>>>   arm64: hugetlb: Fix set_huge_pte_at() to work with all swap entries
>>>>
>>>>  arch/arm64/include/asm/hugetlb.h              |  2 +-
>>>>  arch/arm64/mm/hugetlbpage.c                   | 22 ++++----------
>>>>  arch/parisc/include/asm/hugetlb.h             |  2 +-
>>>>  arch/parisc/mm/hugetlbpage.c                  |  4 +--
>>>>  .../include/asm/nohash/32/hugetlb-8xx.h       |  3 +-
>>>>  arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 +-
>>>>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  2 +-
>>>>  arch/powerpc/mm/nohash/8xx.c                  |  2 +-
>>>>  arch/powerpc/mm/pgtable.c                     |  7 ++++-
>>>>  arch/riscv/include/asm/hugetlb.h              |  2 +-
>>>>  arch/riscv/mm/hugetlbpage.c                   |  3 +-
>>>>  arch/s390/include/asm/hugetlb.h               |  8 +++--
>>>>  arch/s390/mm/hugetlbpage.c                    |  8 ++++-
>>>>  arch/sparc/include/asm/hugetlb.h              |  8 +++--
>>>>  arch/sparc/mm/hugetlbpage.c                   |  8 ++++-
>>>>  include/asm-generic/hugetlb.h                 |  6 ++--
>>>>  include/linux/hugetlb.h                       |  6 ++--
>>>>  mm/damon/vaddr.c                              |  2 +-
>>>>  mm/hugetlb.c                                  | 30 +++++++++----------
>>>>  mm/migrate.c                                  |  2 +-
>>>>  mm/rmap.c                                     | 10 +++----
>>>>  mm/vmalloc.c                                  |  5 +++-
>>>>  22 files changed, 80 insertions(+), 64 deletions(-)
>>>
>>> Looks scary but it's actually a fairly modest patchset.  It could
>>> easily be all rolled into a single patch for ease of backporting. 
>>> Maybe Greg has an opinion?
>>
>> Yes, I thought about doing that; or perhaps 2 patches - one for the interface
>> change across all arches and core code, and one for the actual bug fix?
> 
> I think this would make more sense, especially if we want to backport
> it. The first patch would have no functional change, only an interface
> change, followed by the arm64 fix.

OK I'll do it like this for v2.

> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
