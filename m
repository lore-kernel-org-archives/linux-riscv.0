Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E262EC1EB9
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXiuZtkUs/cD2p0pnvtA2TLOxxe3hYrTccIAhQiOqd4=; b=KxFVIIRDXCFGG6
	QqVLIZFPtbFVrh8NUF15FEOHMB3qsztH3rXzX/Fg5ZhI+OC7xlTYnQvF025W/FphMaDlEkmeWekXg
	GRm8fXe785KjNHn0qDDbsi+kfEo7UENbBSRFI2H+juMWskuPbppQGvOvy5lzTdgKSgC8a3LPwY9ar
	aEkkCXKpTLM56u0Anta8IXXwCuujovxToNflQe3iMrDoxH2oMQ6oUfxydC8ZKkQ8eQ3P+aJASJ6vP
	5rdaQ20CoiY2JCRQtgeomiNoP0nYb5t1UnSOeQ0n5ArfxdX3k6wYjlDCm5+sAH15BK5l5pdgSXLhr
	oYRfy7EuF2Ormbf0MeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzeV-00000009y8g-2Kli;
	Thu, 05 Feb 2026 13:44:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzeT-00000009y8K-06qF
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 13:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 881A34066E;
	Thu,  5 Feb 2026 13:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C666C4CEF7;
	Thu,  5 Feb 2026 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299047;
	bh=zbAqPoMW8uRm4vnv38zuUnwWsFnsj8UNXtCVNmXf7C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6eiX6lzbwi3mcjWTLjOR9hgujeNI51sOYc0ooy0Mi4x7K9F8hAUDeeHzKbynrFn9
	 kRGp+YJO1sZleB6zcJVAYCc1dOWZMTP6KVx/17TKAL4r3B7shQy7wMRQ2Kz2kx4pIA
	 UCFlHD1snGZk4Qt5doDftxIBkgzBt8Gnc6m3r5Pz11COTZDAjKNiacUv1NwhCPAU7t
	 uOGg/15FZBbvs5jNQfxXHOIRzO1lvRXi+7EAwXM839tx37Ul+D5NCbibqg9Hj58qoc
	 J32wQHETLbxMyiaAf+aaFU66WP5HRaVGi1KX7PaM9SMZU+KU6fPuNMf3BenMSRl74Y
	 0Ciu0j6Wi5/Mg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 86159F4006B;
	Thu,  5 Feb 2026 08:44:05 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 05 Feb 2026 08:44:05 -0500
X-ME-Sender: <xms:pZ6EaSwZIqcQbi3eSr2YeSyNY4soW7jIrW7KmxqFCodpBsJhmMqIng>
    <xme:pZ6EaR_6UL-HGKaU9kn078cFaH47RcIX-KhAhlp-s0QPg22Tvt0mBeORnm4DgAasp
    a900ohlCLT7uvqL5JOucndpSFZmzDKToYeC13QOxu3CJbz9yRWFf_1A>
X-ME-Received: <xmr:pZ6EafZmGKOvZwxi9DHeE6Y2VFHt1kmMw83NW8vMrNwYQ9lhbGY2CIFNR5dleg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehgeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeludettdeigfefhffhhfelveeludeuleduvefhgefgueeitedtleffudegfffg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeehgedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlih
    hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmuhgthhhunhdrshho
    nhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdp
    rhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvh
    grughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:pZ6EaV-6JVghQKxYV_55hxtxUr4iQA-30PgRWCcUY9Xf7uhmyhO0Lg>
    <xmx:pZ6EaZjRTUOTpn-mSaE2tDB2ylLW_8-qfcbK_oEpeURhBS7Ej8EW0g>
    <xmx:pZ6EaVlVwycuCa55s_M8An0K5sVkf5dS5d_JRAvkWPk7p2-WBE0hZQ>
    <xmx:pZ6EaWCl7a_Al3zWzIrd-nfqWzXQPB4PFdHAg5OpAt3vK9Z9oYlT3w>
    <xmx:pZ6EacOAkLoPSQQtH2x-RFqLuZSXT0NwgUCuBq8jTs4nTH97CVjwbWAA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 08:44:03 -0500 (EST)
Date: Thu, 5 Feb 2026 13:43:58 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv6 06/17] LoongArch/mm: Align vmemmap to maximal folio size
Message-ID: <aYSdW2YaJdpgXYos@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-7-kas@kernel.org>
 <2ce0e684-de54-43ec-be7d-c58bbffb3f4e@kernel.org>
 <062900fa-6419-4748-81d1-9128ce6c46d0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <062900fa-6419-4748-81d1-9128ce6c46d0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_054409_104230_3134F3C2 
X-CRM114-Status: GOOD (  26.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 05, 2026 at 01:56:36PM +0100, David Hildenbrand (Arm) wrote:
> On 2/4/26 17:56, David Hildenbrand (arm) wrote:
> > On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > > The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> > > struct pages of the head page to be naturally aligned with regard to =
the
> > > folio size.
> > > =

> > > Align vmemmap to MAX_FOLIO_NR_PAGES.
> > > =

> > > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > > ---
> > > =A0 arch/loongarch/include/asm/pgtable.h | 3 ++-
> > > =A0 1 file changed, 2 insertions(+), 1 deletion(-)
> > > =

> > > diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/
> > > include/asm/pgtable.h
> > > index c33b3bcb733e..f9416acb9156 100644
> > > --- a/arch/loongarch/include/asm/pgtable.h
> > > +++ b/arch/loongarch/include/asm/pgtable.h
> > > @@ -113,7 +113,8 @@ extern unsigned long empty_zero_page[PAGE_SIZE /
> > > sizeof(unsigned long)];
> > > =A0=A0=A0=A0=A0=A0 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * P=
TRS_PER_PTE
> > > * PAGE_SIZE, (1UL << cpu_vabits) / 2) - PMD_SIZE - VMEMMAP_SIZE -
> > > KFENCE_AREA_SIZE)
> > > =A0 #endif
> > > -#define vmemmap=A0=A0=A0=A0=A0=A0=A0 ((struct page *)((VMALLOC_END +=
 PMD_SIZE) &
> > > PMD_MASK))
> > > +#define VMEMMAP_ALIGN=A0=A0=A0 max(PMD_SIZE, MAX_FOLIO_NR_PAGES *
> > > sizeof(struct page))
> > > +#define vmemmap=A0=A0=A0=A0=A0=A0=A0 ((struct page *)(ALIGN(VMALLOC_=
END,
> > > VMEMMAP_ALIGN)))
> > =

> > =

> > Same comment, the "MAX_FOLIO_NR_PAGES * sizeof(struct page)" is just
> > black magic here
> > and the description of the situation is wrong.
> > =

> > Maybe you want to pull the magic "MAX_FOLIO_NR_PAGES * sizeof(struct
> > page)" into the core and call it
> > =

> > #define MAX_FOLIO_VMEMMAP_ALIGN=A0=A0=A0 (MAX_FOLIO_NR_PAGES * sizeof(s=
truct
> > page))
> > =

> > But then special case it base on (a) HVO being configured in an (b) HVO
> > being possible
> > =

> > #ifdef HUGETLB_PAGE_OPTIMIZE_VMEMMAP && is_power_of_2(sizeof(struct pag=
e)
> > /* A very helpful comment explaining the situation. */
> > #define MAX_FOLIO_VMEMMAP_ALIGN=A0=A0=A0 (MAX_FOLIO_NR_PAGES * sizeof(s=
truct
> > page))
> > #else
> > #define MAX_FOLIO_VMEMMAP_ALIGN=A0=A0=A0 0
> > #endif
> > =

> > Something like that.
> > =

> =

> Thinking about this ...
> =

> the vmemmap start is always struct-page-aligned. Otherwise we'd be in
> trouble already.
> =

> Isn't it then sufficient to just align the start to MAX_FOLIO_NR_PAGES?
> =

> Let's assume sizeof(struct page) =3D=3D 64 and MAX_FOLIO_NR_PAGES =3D 512=
 for
> simplicity.
> =

> vmemmap start would be multiples of 512 (0x0010000000).
> =

> 512, 1024, 1536, 2048 ...
> =

> Assume we have an 256-pages folio at 1536+256 =3D 0x111000000

s/0x/0b/, but okay.

> Assume we have the last page of that folio (0x011111111111), we would just
> get to the start of that folio by AND-ing with ~(256-1).
> =

> Which case am I ignoring?

IIUC, you are ignoring the actual size of struct page. It is not 1 byte :P

The last page of this 256-page folio is at 1536+256 + (64 * 255) which
is 0b100011011000000. There's no mask that you can AND that gets you to
0b11100000000.

-- =

  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
