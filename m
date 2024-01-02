Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC4AC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 06:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+ORxCHE9qYW8PNSTf3st+gWvlG64R6e/sDysTLlTWY=; b=YeJmsoIq3BA8wn
	3kRJ7uLUwX1nFzGlFObpJdEdymJeiSAS68mcLcnOke4G537lhz62lgk2FSksVdfhkRM+SxQLPva8v
	Zi9gyiRwvB/UMl0Krno0s+/qqdliF2JPln8C3qw+8T3Z9zfsZlvogrr8j4nQdxqVqejKNcuccvA/t
	JumG6PgWKe8YvD+KeNfFgPmM9wFp4muqh3TVVUBZ6hHfAFixyRiUhAdL7BoV3zC9/cAmM9qtWEpBa
	NftKDeGqakWCaaN8+8yrgqEIf0CR4C66TOI/9Co3BnP+gE6ICjLwvHv1SAIcKbsPmGWZRgXdPmf47
	tCEcJb3/eGPtzj5XzR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKYIq-007B7d-2M;
	Tue, 02 Jan 2024 06:31:04 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKYIn-007B60-2C
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 06:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1704177059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwM83SlsLb1lbvo4JCqZZv0h8wT6KPgcWS/HAwN04/0=;
	b=o38+Omrur7cm8Q/e0nLnXqBIsWvLMDkbm5ptAnn/ZlZWQiCVmcDjZtwoEs60A94RgcAauv
	E132opwWBTvCsPeDzfzlh9A4yzPTIVTPtHNC/5L0+b6GA84IBDoYN0L7I27E5LuYL9UL8A
	OyzbfsSDRORVadxA5D4C39d8zPUzD98=
Mime-Version: 1.0
Subject: Re: [PATCH 03/13] mm: Provide generic pmd_thp_or_huge()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ZZOhCuuozrBscdRC@x1n>
Date: Tue, 2 Jan 2024 14:30:25 +0800
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Mike Rapoport <rppt@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>,
 Andrew Jones <andrew.jones@linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 linuxppc-dev@lists.ozlabs.org,
 Rik van Riel <riel@surriel.com>,
 linux-riscv@lists.infradead.org,
 Yang Shi <shy828301@gmail.com>,
 James Houghton <jthoughton@google.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>
Message-Id: <4B38660D-3AC2-4F96-9DD1-2D8CAA55E7E4@linux.dev>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-4-peterx@redhat.com>
 <135b3189-f459-4b57-9861-bb8acb999d91@linux.dev> <ZZOhCuuozrBscdRC@x1n>
To: Peter Xu <peterx@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_223101_869058_50D0F3B5 
X-CRM114-Status: GOOD (  12.40  )
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



> On Jan 2, 2024, at 13:37, Peter Xu <peterx@redhat.com> wrote:
> 
> On Mon, Dec 25, 2023 at 02:29:53PM +0800, Muchun Song wrote:
>>> @@ -1355,6 +1355,10 @@ static inline int pmd_write(pmd_t pmd)
>>>  #endif /* pmd_write */
>>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>> +#ifndef pmd_thp_or_huge
>> 
>> I think it may be the time to rename to pmd_thp_or_hugetlb,
>> the "huge" is really confusing. thp is not huge? Actually,
>> it is huge. It is better to make it more specific from now on, like
>> "hugetlb".
> 
> The rename will need to touch ARM code, which I wanted to avoid, see:

I see.

> 
> arch/arm64/include/asm/pgtable.h:#define pmd_thp_or_huge(pmd)   (pmd_huge(pmd) || pmd_trans_huge(pmd))
> 
> So far this series only touches generic code.  Would you mind I keep this
> patch as-is, and leave renaming to later?

OK.

THanks.

> 
>> 
>> BTW, please cc me via the new email (muchun.song@linux.dev) next edition.
> 
> Sure.  Thanks for taking a look.
> 
> -- 
> Peter Xu
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
