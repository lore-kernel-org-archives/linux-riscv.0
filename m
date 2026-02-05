Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74394EC1EB9
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iq6rO3xCKKCMn+/l4x8aPWTcxGIjh7yFjcwttMKjBkU=; b=tcSihazaacfbDo
	tIiJpi/ZoCMUY6pqPe3cRJagT7EB5Y4GD3FCXuJi/KsOH/cY0B1jWFmSdjzfx3Cd4vswzMDqCig9Z
	Wf+aggB7bDUEvBlXrOUDf8sAb1zpvyVouK+FPJzeTrRJGNONlMXnVIWGp9RwIKcrUmmvmSJf6c34m
	9ZvHoM6PRDmuPp6f/ufmznCUYFcFKp0dlibgIqPBtd8HUE+OQAWdAiULtRNH9MqWYzAoAM1e+135n
	7thZPt3EQlUpljS8FE7mwjz6sM81qfm+DpgvQdXPAOs0RbLfs1JYjFDTVP6IItGy7oB177X3rrLBj
	qiorgLI7xT/lASauTqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzkd-00000009zQ0-1CW6;
	Thu, 05 Feb 2026 13:50:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzkc-00000009zPt-0C8d
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 13:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AA2260122;
	Thu,  5 Feb 2026 13:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D13C4CEF7;
	Thu,  5 Feb 2026 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299428;
	bh=3TY2LvtZnrCiQseYdsb0tgxnCGw9BQjaOFOmpcNjY34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZjt/qf9VJzwFHOgqySxuAcrbSQuBulW3qm/ouJrbXrHLZ8x9pa9nwMgX+3jZo6mU
	 N4ifhi7PUe9zhliFzPLyXsxoVeLSXF0e6ob9+MuKAQ7Jn5iQvx59m8BbNQ/6fYZIVm
	 RfSeKPKJpsbdoiBt8Jne2ISM9DDP5cLeWA++u6OsBmvof7sYwh2DvltqJMX0/AGT7/
	 FyaXn8CIRNnAgm3tAUjjNoO6gUIwFlX/CNrNgoDO7hTBW0CJ3kXk4QORwkTGwf6LGu
	 v/sYAB0S2Keapjr6rAebNdO7eGUqPtTHQEhj33GWQpAsdidUkrLHNZg7J2BH4rWzLf
	 y7+WUGfjW0+ng==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0D54DF40068;
	Thu,  5 Feb 2026 08:50:27 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 05 Feb 2026 08:50:27 -0500
X-ME-Sender: <xms:IqCEaZf6StkWfOqu8wFSOZeK9vXsBWrdIeava6LuaFgh6MhYGi-y-w>
    <xme:IqCEaQ5qls25rtsGHqFrm2Ttf2ZPHFXPplBaTUa4iYpfpLkNRd7SjVQfMZkBxqdaP
    5jbZJcwMo_ziIilnQwc0Y2dZ5ffYmh-ZBxRxDMc4_GMbK_-ACh8Ncw>
X-ME-Received: <xmr:IqCEaZebtFCUBddCzka2qZR1s7YPqIztazpkzNjE7oPAi1YH8moJgmlpqubZNA>
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
X-ME-Proxy: <xmx:IqCEaXAGHKZMBJS6DUsJ98T7WyuRMoEUVJhkNCQ9KG1MejXV8BfpSw>
    <xmx:I6CEaVHlKYRyqwTh2vTVJYQ9F735Nv0bH_bNCRQM-oWLhwZ-9a_fqg>
    <xmx:I6CEafjBkfUHcOHA-WfHtJvjD79HzFhOUFGs7C8chXL6k23xFLRu_A>
    <xmx:I6CEaXs9Qf8A_cpGbYT3ZbCh3Xs_yGK5n3wyq6EE5VNQ2zEc4GNTkw>
    <xmx:I6CEaV-n2W8zWDLDGHDrciU6x5-ShBKOSo7gnftoJrzCpdjBdgcLcSiJ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 08:50:25 -0500 (EST)
Date: Thu, 5 Feb 2026 13:50:18 +0000
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
Subject: Re: [PATCHv6 05/17] riscv/mm: Align vmemmap to maximal folio size
Message-ID: <aYSe0TAIzxJ9i1Wy@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-6-kas@kernel.org>
 <1b80b189-b549-40ba-800c-8037ce12b081@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1b80b189-b549-40ba-800c-8037ce12b081@kernel.org>
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

On Wed, Feb 04, 2026 at 05:50:23PM +0100, David Hildenbrand (arm) wrote:
> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
> > struct pages of the head page to be naturally aligned with regard to the
> > folio size.
> > 
> > Align vmemmap to MAX_FOLIO_NR_PAGES.
> 
> I think neither that statement nor the one in the patch description is
> correct?
> 
> "MAX_FOLIO_NR_PAGES * sizeof(struct page)" is neither the maximum folio size
> nor MAX_FOLIO_NR_PAGES.
> 
> It's the size of the memmap that a large folio could span at maximum.
> 
> 
> Assuming we have a 16 GiB folio, the calculation would give us
> 
> 	4194304 * sizeof(struct page)
> 
> Which could be something like (assuming 80 bytes)
> 
> 	335544320
> 
> -> not even a power of 2, weird? (for HVO you wouldn't care as HVO would be
> disabled, but that aliment is super weird?)
> 
> 
> Assuming 64 bytes, it would be a power of two (as 64 is a power of two).
> 
> 	268435456 (1<< 28)
> 
> 
> Which makes me wonder whether there is a way to avoid sizeof(struct page)
> here completely.

I don't think we can. See the other thread.

What about using roundup_pow_of_two(sizeof(struct page)) here.

> Or limit the alignment to the case where HVO is actually active and
> sizeof(struct page) makes any sense?

The annoying part of HVO is that it is unknown at compile-time if it
will be used. You can compile kernel with HVO that will no be activated
due to non-power-of-2 sizeof(struct page) because of a debug config option.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
