Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4000EC1EB9
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDyhg6jxWtKRwovLwwRyb03KhVqNSjKBPdlfTEIjKn4=; b=q54jV1Buz4dSia
	mcqj2go9Vy19ofeBqNZLHjcuFRyGwbp9lM6DSGH7EgY3JzQzD0hbIw2y9uIvfjNPKeHGunFTFLksy
	VTqj+GYD9+RjuFjkN5cR+RTG6x6prUtIfHy2sLWstOzxsiLg6/gbMYrAY4aN9r6vQxrA9dMllTvhl
	vxoe/SZC+Io9KNbiCwsF0CeWcmWQKrdGRbuAn1nWptCaxLWAYM8SRflSySPzDI4NHX62am3VscSJQ
	1WcZGY/qkVSyYFmJ4QCs1Ra3UNhBgiw14NJVHZ5AWU9GthyY2iB0XfO1gufLe291xDqBp3daX4tUh
	PwqsYZ6kjbiAz+enPbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzmi-00000009zZT-0NAF;
	Thu, 05 Feb 2026 13:52:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzmh-00000009zZA-2bi5
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 13:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1370A60138;
	Thu,  5 Feb 2026 13:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C81DC4AF09;
	Thu,  5 Feb 2026 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299558;
	bh=SWTU0hoYf/UnGmVIbKL9BuYlq2a5aSmIMAh2fyWcba8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szZPoJaflynZpd82roRpeUy08KECBeN6DrO1YMzpPoPANaWujbeGfuQmbZCRKFm+s
	 duJZyo9/LXtgDSLHO00eZEMWMJwleOnZuwy+KBE/pAxUKEzLlWj0/ffpG6/sHNcvox
	 yrUznFEFXMBbes9e1CKGFJPNb3J9ebrh/oiWzwk7Dm5Euy3eVGGRdQwE6260rulEC6
	 GJNIWN8JeIwlp330LvL1yVfmDkVrkP8xxPRZFmuXo5IaARIIQ1NT57cGAXfY0IccGS
	 D7W2/dFVPCSuaLW/EckAnJNWZPBz42C4jhLMle3AYv1De76xkTkTk1Us8q4KHMpA/m
	 /sRwHCCCG7d/g==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id BA787F40068;
	Thu,  5 Feb 2026 08:52:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 05 Feb 2026 08:52:36 -0500
X-ME-Sender: <xms:pKCEaZTYTZ4IdYhPmFOtDhYpWfv4VFHVKZqyS-hSNC4z-tE8UR0vew>
    <xme:pKCEaWfpyO5I-lTzDqJVQOdI5AoM4kEpvx0mv0EgMXwJIhd1OJyrVgj7O33_oTnr0
    qNJjcVrzz3R_PAMsVcMZpZEbzO8-mi1x_xqOV80kF4S-1tGt5mHFdE>
X-ME-Received: <xmr:pKCEaZ74g6CGqmIPHCouJ15dBueoscoDiYdrYOV8edikmGPwvoxiCNcWt9fpAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepheegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinh
    hugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhn
    gheslhhinhhugidruggvvhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:pKCEaeeur9pRhbizjFCCinU-IuCYrPMXf4IBShFFSog8cvq7XVScQQ>
    <xmx:pKCEaYAfHScjWLu3e9YOFE8w4RCHICCAsBJ9eTDkLVfyndU7yW3xOA>
    <xmx:pKCEaSHx5WhMPKTaoiKiwPhHa0FF22br4dAcmB3NaDUAA6t-_JUcvQ>
    <xmx:pKCEaYip_49tpAQBrIqS3y5WPakF-TN_GGYetR1lV7ES2iPnMSSq-g>
    <xmx:pKCEacs12NYuU7aC8364rHxeHnpUOW0I17oXjZq81pJTM6rj4qukWIfw>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 08:52:34 -0500 (EST)
Date: Thu, 5 Feb 2026 13:52:30 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (arm)" <david@kernel.org>
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
Message-ID: <aYSgQknBNs5r-Tf5@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-7-kas@kernel.org>
 <2ce0e684-de54-43ec-be7d-c58bbffb3f4e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ce0e684-de54-43ec-be7d-c58bbffb3f4e@kernel.org>
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

On Wed, Feb 04, 2026 at 05:56:45PM +0100, David Hildenbrand (arm) wrote:
> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> > struct pages of the head page to be naturally aligned with regard to the
> > folio size.
> > 
> > Align vmemmap to MAX_FOLIO_NR_PAGES.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > ---
> >   arch/loongarch/include/asm/pgtable.h | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> > index c33b3bcb733e..f9416acb9156 100644
> > --- a/arch/loongarch/include/asm/pgtable.h
> > +++ b/arch/loongarch/include/asm/pgtable.h
> > @@ -113,7 +113,8 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
> >   	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, (1UL << cpu_vabits) / 2) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SIZE)
> >   #endif
> > -#define vmemmap		((struct page *)((VMALLOC_END + PMD_SIZE) & PMD_MASK))
> > +#define VMEMMAP_ALIGN	max(PMD_SIZE, MAX_FOLIO_NR_PAGES * sizeof(struct page))
> > +#define vmemmap		((struct page *)(ALIGN(VMALLOC_END, VMEMMAP_ALIGN)))
> 
> 
> Same comment, the "MAX_FOLIO_NR_PAGES * sizeof(struct page)" is just black magic here
> and the description of the situation is wrong.
> 
> Maybe you want to pull the magic "MAX_FOLIO_NR_PAGES * sizeof(struct page)" into the core and call it
> 
> #define MAX_FOLIO_VMEMMAP_ALIGN	(MAX_FOLIO_NR_PAGES * sizeof(struct page))
> 
> But then special case it base on (a) HVO being configured in an (b) HVO being possible
> 
> #ifdef HUGETLB_PAGE_OPTIMIZE_VMEMMAP && is_power_of_2(sizeof(struct page)

This would require some kind of asm-offsets.c/bounds.c magic to pull the
struct page size condition to the preprocessor level.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
