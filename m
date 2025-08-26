Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32757CA0EFA
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 13:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jw4GQH5ZKCC+r2Nm5QeChyBZAWzYE5URY1oeqKxxqFk=; b=Q51RbikF2ol9zk
	/Sa8bzp2rRmTyJdadenu4j5/Qwo2XXD5QQUGdljKomhEbhRGVVrK/JviURiSLppzyrBf/sCsYiNti
	Ea6kXTtS98AWnAbwRH7RP6xzhXajk8LJ1PbcINnO0nOjY9USBiHsdyXR4JPwtbWRdxbNWrEYdbe6C
	SWrPsACKQBw1FpD8WZZ1neM2X2d3vnpiFdhjeawS2mda6dbfQTFNmCN3QIaaIQ8S3aEp4uMx7btEY
	MU11riSDjNRb/jgx4QWHX4vazl+Z+jK3iYrwnMjIX+1ZgXxmSj4z++mm7JZ8jIaIqbTqW0/k5duNH
	+1+oB/I3Yv+LU+3VB05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqttc-0000000C86L-1fK4;
	Tue, 26 Aug 2025 13:39:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtSj-0000000C3MC-1shr;
	Tue, 26 Aug 2025 13:11:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C1B82BF2;
	Tue, 26 Aug 2025 06:11:36 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B7A13F63F;
	Tue, 26 Aug 2025 06:11:36 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:11:34 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH RFC 21/35] mm/cma: refuse handing out non-contiguous page
 ranges
Message-ID: <aK2yhtQ0M_0hqQHh@raptor>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-22-david@redhat.com>
 <aK2QZnzS1ErHK5tP@raptor>
 <ad521f4f-47aa-4728-916f-3704bf01f770@redhat.com>
 <aK2wlGYvCaFQXzBm@raptor>
 <ecc599ee-4175-4356-ab66-1d76a75f44f7@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecc599ee-4175-4356-ab66-1d76a75f44f7@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_061145_586257_4E10FF5A 
X-CRM114-Status: GOOD (  27.60  )
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

Hi David,

On Tue, Aug 26, 2025 at 03:08:08PM +0200, David Hildenbrand wrote:
> On 26.08.25 15:03, Alexandru Elisei wrote:
> > Hi David,
> > 
> > On Tue, Aug 26, 2025 at 01:04:33PM +0200, David Hildenbrand wrote:
> > ..
> > > > Just so I can better understand the problem being fixed, I guess you can have
> > > > two consecutive pfns with non-consecutive associated struct page if you have two
> > > > adjacent memory sections spanning the same physical memory region, is that
> > > > correct?
> > > 
> > > Exactly. Essentially on SPARSEMEM without SPARSEMEM_VMEMMAP it is not
> > > guaranteed that
> > > 
> > > 	pfn_to_page(pfn + 1) == pfn_to_page(pfn) + 1
> > > 
> > > when we cross memory section boundaries.
> > > 
> > > It can be the case for early boot memory if we allocated consecutive areas
> > > from memblock when allocating the memmap (struct pages) per memory section,
> > > but it's not guaranteed.
> > 
> > Thank you for the explanation, but I'm a bit confused by the last paragraph. I
> > think what you're saying is that we can also have the reverse problem, where
> > consecutive struct page * represent non-consecutive pfns, because memmap
> > allocations happened to return consecutive virtual addresses, is that right?
> 
> Exactly, that's something we have to deal with elsewhere [1]. For this code,
> it's not a problem because we always allocate a contiguous PFN range.
> 
> > 
> > If that's correct, I don't think that's the case for CMA, which deals out
> > contiguous physical memory. Or were you just trying to explain the other side of
> > the problem, and I'm just overthinking it?
> 
> The latter :)

Ok, sorry for the noise then, and thank you for educating me.

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
