Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546A1E63F1E
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Feb 2026 23:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUvQUhNOaSlrwhnJa0anCEJt56zA3FtYFY0sj8w0uRI=; b=cniwKrf4OtUysr
	hXitKDPY+MHyVI/CcHxt76wslzDrPvePD2b+BrOujK/udVz5daVy8p/HFB/E+lHoXWvOv256n4UR1
	HVEdN1EpXT6A9YHvuLIjvM/G2St2xdWJkazGHa69cCXCNspHGq1CqprXM+8jhANF7t7pjZ+DDat2m
	fmX2K+WjMowN8HCOZpL0xW0Po5MY2rzrW4So8rM7UW/Tjk6GJIvHBolx/C589frjqU+nVJ77V/Hvw
	tUrQJswufnCKuPEFuIVyyljDGJk4N0N+QAeuUNDbVR77mr1x1eVgbDmyyDhMYrVyPG6EvKIcEdJIZ
	9YaZ/47I5830Z5f39QNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrlJQ-00000005l5S-0Hkm;
	Sun, 15 Feb 2026 23:14:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrlJO-00000005l5K-3jth
	for linux-riscv@bombadil.infradead.org;
	Sun, 15 Feb 2026 23:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Orx67w0OdZsiD/sxqMgXoLutvDapJy44psufStBNd34=; b=Tq38ZBkwHinLdgKHuJ2F6wb0Lw
	nuKJ0utimPTEs5necEg4OiOp93omwKGRX71185wTqzVACW8X/Btm5RQFtI2l9t/0LXp/dZlyaIOLM
	GehWSFz/SBsnkXJyZynrq8iJyDwnyPiZ75nYhPdeisBx/mBVpuALLKyyepWJzVzLGdsoKKXUpVTrP
	UiG1h5BkIqArcpktGdrJGEQfcuC7wHIfdw2rR8FSTBse3ekOr3x0SqqKT2TOwpGA16cFQh9WQ4mcJ
	1LELudn4ti3SdkfASP4GSMU16UMLBkxEsG2Ob5cpm0F+uWJ/zPQ4zd/VuW57a7wmiDUp7TXRaurH9
	jJ6U3oAw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrlJH-00000001duk-2IlM;
	Sun, 15 Feb 2026 23:13:51 +0000
Date: Sun, 15 Feb 2026 23:13:51 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
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
Message-ID: <aZJTLwV2SaaKu1k_@casper.infradead.org>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-9-kas@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202155634.650837-9-kas@kernel.org>
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

On Mon, Feb 02, 2026 at 03:56:24PM +0000, Kiryl Shutsemau wrote:
> With the upcoming changes to HVO, a single page of tail struct pages
> will be shared across all huge pages of the same order on a node. Since
> huge pages on the same node may belong to different zones, the zone
> information stored in shared tail page flags would be incorrect.
> 
> Always fetch zone information from the head page, which has unique and
> correct zone flags for each compound page.

You're right that different pages in the same folio can have different
zone number.  But does it matter ... or to put it another way, why is
returning the zone number of the head page the correct way to resolve
this?

Arguably, the caller is asking for the zone number of _this page_, and
does not care about the zone number of the head page.  It would be good
to have a short discussion of this in the commit message (but probably
not worth putting this in a comment).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
