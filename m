Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732EFEA4FC7
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 14:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57Xh8iSn9FdroC+ziEflQlUzJujIAFybrcrFDjCGCRM=; b=Yr9905HGRB6iEp
	t+NR2p1h3iyxYO9omlu9gh3z7+fvvH4/KEVs6IvGjg/IlNnEQ5PUT42D4CTUIbe6T3h4VkxqJ0r3o
	b6Cok+WWa6I9LjxTtNYcwib/vSozUTF8dk2Nxt+Pa7wwyeUbhEk9kZjXRyTE4vwM/xGPyV0FyiA6U
	y1Sz8UUipvU8JZOUM1jRYPzu8ZoRs26l1c5/R11vjE1tUNvjCiI9o88irfBxHNdsDSvrQZoKiif4V
	B0rFUizFL82ECoUQzGMkGqwLp1I6ATIC7WqSCq1hfy5wrfur8bnNbabxKy9MCicQlkjWoT2e4nQ46
	Rd+9Ao8hXNb6nHmnhzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXIc-00000000VC9-2jDF;
	Mon, 23 Feb 2026 14:52:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXIa-00000000VBK-0gtg
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 14:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DF66442E4;
	Mon, 23 Feb 2026 14:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55B9C4AF0B;
	Mon, 23 Feb 2026 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771858354;
	bh=UVAFpGopAm1uHGWKPm+YTJ1SMuDgyk8tqHgCMtYq+7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4yqZFpaipymBSDijM07NWYMUzRVMGQxKSvag/WbJsRZMXu8UPpkgdYVQDK+ZmOjS
	 CQe8IAiTjs7khPJ1nlJnmZSOB5h0jRhjgvVLZ5cGZVU1pOv8frRsiEDRpqtnmbplDy
	 Lht/XzygjzffCqWtbIO99oCnpuIBgrOWGynu0ZtOvDn7md9VbLqpMR7HcuGskaJCjA
	 yxdNAgpnjq1fiWvog+AgwOVgenVeAJZW480BSTugFXQmZOe/CPWEGoEVF8Qof2ybAg
	 C7pVZtKtiygDfIIXagz4qs+RaBRL6jUCnzS9rjZ1Fe+svcwKUAHOvDvuVzzk00arpC
	 G96e2vc5zIrpA==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id D183DF4006C;
	Mon, 23 Feb 2026 09:52:32 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 23 Feb 2026 09:52:32 -0500
X-ME-Sender: <xms:sGmcaW8L9wvFHE9xaKhbeX8JgZt0lnMyi9ulvqIu-cRvaG3b6rt2pA>
    <xme:sGmcaaZSaG8I5M6m1GvoKUH4LaO8U4CEWh114E5A0nNudgyzuIUKncAqQ5T_e66G-
    NOslw5KSJB8Qo6MeB8VALGBCHzEytytGzyAA_Ljg2fxngRougTPbA>
X-ME-Received: <xmr:sGmcaXFiBkUGBA_xw9Nzg3RQQEQBYqkXKxm4WowbCJKYKx2umbWxPLKBfTn14w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeejhedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepheegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehvsggrsghkrgesshhushgvrdgtiidprhgtphhtthhopegurghvihgusehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhn
    rdhorhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprh
    gtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuhhs
    rghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhvughlsehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpdhr
    tghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:sGmcab5PzpnO5klB-RmRGOlp75eh_0ZN1UWzu3rtxmVrF0HDL3Ytmg>
    <xmx:sGmcaQvF3MOs6LmVkT3fJrDl4ASxADJy5NxGaaSRi4g9Ae-_RJtIyw>
    <xmx:sGmcaVBPXnseaXteAEKPGybiYblNvylyKEz-quFqXS1vgYJFTwH0bQ>
    <xmx:sGmcaYv9MSdgZdgG3nnKOXXoxjbQ8gJUrE_GKyyzeQp8t6KF3Wop_A>
    <xmx:sGmcaRKthHvOALCnZzC9C5_ytVbe1T1h3tw12XeJuRFen4yWwxEa5du9>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 09:52:30 -0500 (EST)
Date: Mon, 23 Feb 2026 14:52:25 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
Message-ID: <aZxn34ebvSKFCWth@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-9-kas@kernel.org>
 <e5831f0b-88c5-4a20-82b3-6e5952388132@kernel.org>
 <aYnJCnE5vooLROnu@thinkstation>
 <6afd7334-82e8-4f87-8ed3-6448e89328c2@suse.cz>
 <aZL-7mpPT_S3Paon@thinkstation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZL-7mpPT_S3Paon@thinkstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065236_375615_2C3FECAB 
X-CRM114-Status: GOOD (  29.96  )
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

On Mon, Feb 16, 2026 at 11:30:22AM +0000, Kiryl Shutsemau wrote:
> On Tue, Feb 10, 2026 at 04:57:55PM +0100, Vlastimil Babka wrote:
> > On 2/9/26 12:52, Kiryl Shutsemau wrote:
> > > On Thu, Feb 05, 2026 at 02:10:40PM +0100, David Hildenbrand (Arm) wrote:
> > >> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > >> > With the upcoming changes to HVO, a single page of tail struct pages
> > >> > will be shared across all huge pages of the same order on a node. Since
> > >> > huge pages on the same node may belong to different zones, the zone
> > >> > information stored in shared tail page flags would be incorrect.
> > >> > 
> > >> > Always fetch zone information from the head page, which has unique and
> > >> > correct zone flags for each compound page.
> > >> > 
> > >> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > >> > Acked-by: Zi Yan <ziy@nvidia.com>
> > >> > ---
> > >> >   include/linux/mmzone.h | 1 +
> > >> >   1 file changed, 1 insertion(+)
> > >> > 
> > >> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > >> > index be8ce40b5638..192143b5cdc0 100644
> > >> > --- a/include/linux/mmzone.h
> > >> > +++ b/include/linux/mmzone.h
> > >> > @@ -1219,6 +1219,7 @@ static inline enum zone_type memdesc_zonenum(memdesc_flags_t flags)
> > >> >   static inline enum zone_type page_zonenum(const struct page *page)
> > >> >   {
> > >> > +	page = compound_head(page);
> > >> >   	return memdesc_zonenum(page->flags);
> > >> 
> > >> We end up calling page_zonenum() without holding a reference.
> > >> 
> > >> Given that _compound_head() does a READ_ONCE(), this should work even if we
> > >> see concurrent page freeing etc.
> > >> 
> > >> However, this change implies that we now perform a compound page lookup for
> > >> every PageHighMem() [meh], page_zone() [quite some users in the buddy,
> > >> including for pageblock access and page freeing].
> > >> 
> > >> That's a nasty compromise for making HVO better? :)
> > >> 
> > >> We should likely limit that special casing to kernels that really rquire it
> > >> (HVO).
> > > 
> > > I will add compound_info_has_mask() check.
> > 
> > Not thrilled by this indeed. Would it be a problem to have the shared tail
> > pages per node+zone instead of just per node?
> 
> I thought it would be overkill. It likely is going to be unused for most
> nodes. But sure, move it to per-zone.

I gave it a try, but stumbled on a problem.

We need to know the zone in hugetlb_vmemmap_init_early(), but zones are
not yet defined.

hugetlb_vmemmap_init_early() is called from within sparse_init(), but
span of zones is defined in free_area_init() after sparse_init().

Any ideas, how get past this? :/

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
