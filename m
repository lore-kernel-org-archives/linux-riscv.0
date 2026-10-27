Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D779606A33D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q3yTSyIy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RBTg/FKM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oIyTisW2/ajmoWzqlxiJyTrkRvl6wvOQ0/ovFMtzE4I=; b=q3yTSyIydAVjRWuGhxei8rUhCr
	eLhfthUtq2LNq1DIpwK57oPxwRbBg18JKXS27va3wsdQU0jUnQZmM++qQSrnJ4vV/6ZYYsXndlMCP
	wd/s9/oQhdN6HlynJ1KLPhVK4DFW/nT2OQ5kQWZoUY6blU6NfO803AD4CSh647LbwEn7lPT/+KPoM
	4Hgutd7Pek2Om4xJerjVrNmkG09/jY/nghv62g/vnOGuXIYbIPmm0fqXi3TLw+mHh3dZ0blUujZ2V
	fIYp5vBdFSQcliiQj9Iuw/aGGOKDBcyKOOy7Nx8JyeuyBs0B9RrmxGe2erPYMspslpfm8Z8Sg/0Rs
	2jEC0JRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3X-00000004aSu-2BBd;
	Tue, 27 Oct 2026 12:13:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3V-00000004aQQ-2Y07
	for linux-riscv@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UqgubOSrlWvHKhI1cqoT/fdRktbJuQr2VeGa7H2doB0=; b=RBTg/FKMjiMJhvBeWjtZ6CZIY9
	rvPo1ckUCe6w+h0QiGzd+6cZ2SX9h4XjdR9cge27tpZKPnYIX66xu0ynCGVEVN17tU71OKLzHYeUd
	YqLq2zAJnig/4jV33IsJ4SPBSdrisjLfFdiJlsjpW5dPMWCs+MvV7MeJYcTUbpvu4bgIGirMrhNRT
	rfQtF87hxPbl4GLZG512PZKdcraOJ9bUOs97wFlIO/vsRNJjr0Xeic51ZjNa4hLcU1g1mU3TtvmU/
	TMvXw7zT4HnYQe+O4c+SJwwIKJjffebWKGrSbkUjU7VknhliRZuEvq3AGqvm5+9EA7IZvX/8NaQPB
	FB/pcf5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3R-0000000EufN-04F8;
	Tue, 27 Oct 2026 12:13:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9C1633014C0; Tue, 27 Oct 2026 13:13:23 +0100 (CET)
Date: Tue, 27 Oct 2026 13:13:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Matthew Wilcox <willy@infradead.org>,
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
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <20261027121323.GO2668564@noisy.programming.kicks-ass.net>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auCKv_omLGRc6wv2@thinkstation>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 12:00:47PM +0000, Kiryl Shutsemau wrote:

> Fair enough. Here's some context.
> 
> HVO (HugeTLB Vmemmap Optimization) frees most of the memmap of a hugetlb
> folio by remapping the struct pages after the first vmemmap page to a
> shared page, mapped read-only.
> 
> Every lockless get of a page reference (e.g. page cache lookup, PFN
> scanners) relies on page_ref_add_unless_zero(), which is
> atomic_add_unless(&page->_refcount, nr, 0).
> 
> The page can be freed and reused between finding it and the get; the
> zero refcount is what makes the get fail. The race:
> 
>   lockless get                        other CPU
>   c = atomic_read(&page->_refcount)
>   c != 0
>                                       page freed
>                                       page allocated as a hugetlb tail
>                                       HVO remaps it read-only
>   try_cmpxchg(&page->_refcount, &c, c + nr)
>     -> write fault on read-only vmemmap

I missed a little something here; page->_refcount is in the page-frame;
how does the page itself being RO affect this?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
