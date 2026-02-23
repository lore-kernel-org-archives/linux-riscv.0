Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D9CEC111A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVfRbJQe3k6H9tofNMZhA7i5YU5vi14rHdzws1nvyU4=; b=MRNDs+a4J3w7HH
	JnVn6E4YumMGfyHSg8uwkYs4woKimTtDEegLurjDIG+jAXBzuIwqlkFq+6qTgNYLg325oW1yHZAqD
	rgUENe6ChKUWW3yG54qVtklDlFd+Qwoz1Bls60XZYBmIXoEck93B7jz2xf93K6MTV+199YSZSJFWK
	pt+e8qlE3rmSL4wrI/3+06aH7tk5G6kOKFV7v7amA1VGT3LzM2dHU5RaEbGXga3mWbFy7p6bnuryN
	RvpPhtaM6MY1Hg1szpR06Rd+5u+QU7BeCapsUOp6aFP53ScUn+OJtVUL/6rjxm9ZGmYeO2ejXuqhp
	Lc7GVD6TpHsiAREXOsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaVY-00000000r2z-1HWI;
	Mon, 23 Feb 2026 18:18:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaVW-00000000r2i-3o7j
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Feb 2026 18:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FfglRdAZ7//oiLVr9rHZZA3KADO9fxzVK1RtdGfizyk=; b=DwysRZ8w8bsWlmYNGYULfAJmG7
	hSJNuNbMf7YB6Bw+2+sdN+gpEHiWW8es4C0T6zJwktdLc3RhPZw2vHww2zYIaIWd9OMMo2f0GMQGB
	+o+JmrdW5o641PR1oftCRk1CdSsMCxhp4d9yPIn62FPbQm05ucvWkQHqdVdKmus/qgvGWHPyoTMq0
	Bi0bMdMVoMOK4+Y5UeEhXVzRwRMx69dUFCB7knGSbhp+g85lK+Ftmjm+AdVAocCgB4qJLd5e7BYXG
	DwhcEFl1UkLOZyTvFO6oylY9vWhv/isIrE2AqJyzG9EjoCNjXR2fZEj1huiJ1sS22n3Y0H4myV9zV
	XW3KWFzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaVP-0000000Et8q-2Mg0;
	Mon, 23 Feb 2026 18:18:03 +0000
Date: Mon, 23 Feb 2026 18:18:03 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>,
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
Message-ID: <aZyZ2-7Xr-zUnInC@casper.infradead.org>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-9-kas@kernel.org>
 <aZJTLwV2SaaKu1k_@casper.infradead.org>
 <ec4a9a1e-8c08-4879-a787-3b9e0bc38160@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec4a9a1e-8c08-4879-a787-3b9e0bc38160@kernel.org>
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

On Mon, Feb 16, 2026 at 10:06:57AM +0100, David Hildenbrand (Arm) wrote:
> On 2/16/26 00:13, Matthew Wilcox wrote:
> > On Mon, Feb 02, 2026 at 03:56:24PM +0000, Kiryl Shutsemau wrote:
> > > With the upcoming changes to HVO, a single page of tail struct pages
> > > will be shared across all huge pages of the same order on a node. Since
> > > huge pages on the same node may belong to different zones, the zone
> > > information stored in shared tail page flags would be incorrect.
> > > 
> > > Always fetch zone information from the head page, which has unique and
> > > correct zone flags for each compound page.
> > 
> > You're right that different pages in the same folio can have different
> > zone number.  But does it matter ... or to put it another way, why is
> > returning the zone number of the head page the correct way to resolve
> > this?
> 
> How can a folio cross zones?

I thought 1GB pages in hugetlb could cross zones?  Maybe that used to be
true and isn't any more, or maybe it was never true and I was just
confused.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
