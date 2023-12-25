Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3326DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxwhDUx3PySFpBJ80JfPbAX6/mu9pohoMlWADGMFa9A=; b=OYDTMwU9q0eTFN
	Hx0ntaqis0XEuv6BjL/ipgrkL499w9JCXp5BFVFoM32JVNF3Ac5Pmjkb2tY4squP2EgGtJ6tYPUpB
	fSO+tEBv+/GZRPxiCCo56kvAFkyNcM59gTXQxiJUyxeExqr8urQyERfwT3Fw1N7v1F9RD7koI7HIf
	LfbgyPS6CkdEgQJ4JFcYmX4CUMnSRa8AqLF4tKLrPK63gPUkmcDgAB5EG4dCJbiwy7W+ZGpebN3Ix
	41oiMW/gkZzPL62RGiS977cNynWXwE0TKkdSjghEMiURRYQjOcS2THoHHO0vatO268RvWRfzhZTut
	Z8NFYzHvn2lJMKFrdN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHeYs-00AH9q-1z;
	Mon, 25 Dec 2023 06:35:38 +0000
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHeYp-00AH8O-0E
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 06:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1703486132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Mj5NvpEvY0iaWI1AN4f/AnoPa53HvYK2B531TwP00g=;
	b=XmL7t7s1mV7uCwwvgAvOsQNdk/tGvy2JL2lM6W19eCBhgHn71dxcaoEEYsrHNYenfGaMpQ
	Py9rLBYF5VznAlI0wgRIke5z88kJE8izkPcvSvHAZg64NlIgJ9nuzcCZVZDSGOh5qMb6sY
	eIEJ36Kut/a/uk8xqi0T4yvgH/wybTk=
Mime-Version: 1.0
Subject: Re: [PATCH 05/13] mm: Introduce vma_pgtable_walk_{begin|end}()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20231219075538.414708-6-peterx@redhat.com>
Date: Mon, 25 Dec 2023 14:34:48 +0800
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
Message-Id: <0D9E28F4-AFA8-479C-8311-093DAFD9DF41@linux.dev>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-6-peterx@redhat.com>
To: Peter Xu <peterx@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_223535_531914_8438E348 
X-CRM114-Status: UNSURE (   9.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> On Dec 19, 2023, at 15:55, peterx@redhat.com wrote:
> 
> From: Peter Xu <peterx@redhat.com>
> 
> Introduce per-vma begin()/end() helpers for pgtable walks.  This is a
> preparation work to merge hugetlb pgtable walkers with generic mm.
> 
> The helpers need to be called before and after a pgtable walk, will start
> to be needed if the pgtable walker code supports hugetlb pages.  It's a
> hook point for any type of VMA, but for now only hugetlb uses it to
> stablize the pgtable pages from getting away (due to possible pmd
> unsharing).
> 
> Reviewed-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
