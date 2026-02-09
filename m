Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3170E81BA5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 11:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NK1cvun9lWknC1gbs6J3dVj9Rcmn5Xz949esprKDFVs=; b=upQBSjkrHZNJAj
	zn+0pU4QSjX/zo7S/JPvAUSq/8DIBAgynE9GKrN8RHBQF6+wc3InaTktv2SHw9U1gaeiB+vWH4T7N
	zRXmkg1w8w3y//aq59pAaB1W94ITUl6WPOC5ZVw6zD/RyDx8QYnchDCWezH2QSSfO0LiIaBW0O+Gm
	7PEgemKmggiuBx/2qLS93jG2hoGmNsc+BFFOmSraHKBon38k+DLUUI9axK7r15COo2tv/UU7T5rE6
	ordEgY0bUatzgqiw2rd0PkhPtHVkLpBI+pwSEEa8HttQOq8SEZlLe2cBa9ES+uCidFCepnVuVxdBB
	zhiJa5YlskeGWu0glYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPoW-0000000FKSd-0jiC;
	Mon, 09 Feb 2026 11:52:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPoV-0000000FKSW-2hi7
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 11:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F03C60008;
	Mon,  9 Feb 2026 11:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9196AC4AF0B;
	Mon,  9 Feb 2026 11:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770637941;
	bh=/oVfWEPDEAt5G8rJ12d4rW+JXmSiJVKmDZMLxp+j8rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hH1QHvfKc7CEJbSL0jt1YJJAqkMs759E290lV0qaNYFiNewfF2Ti/nUXuSSLl6rbc
	 wxaeDRbEkGrHOS6hoDtZ9lGQZtbRiCKPU2RrNffy06KwcfMMsZsXJ67vfP2LPwyf/H
	 uqyaL6pGSPycCvB41OiJtW95NihkBpCG7/k57aJJQ2Veom3VNwRF0sNgT7HJFF7ojp
	 u407lKJtbEoLyPWvbYZ6ECZJqjDKWWMuyESJo9WIs4TteL2FqbsNtAI0g86D5mhTFn
	 vXPBSmYoWrii+48+QrwZFcDJSCq5sQbs92l08YQzuXpg9wQ6TQSoVGWvv+1jF7OVGv
	 GyXhG+FdGllNQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7F447F40068;
	Mon,  9 Feb 2026 06:52:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 09 Feb 2026 06:52:19 -0500
X-ME-Sender: <xms:c8qJaRnGgHcwQlUzKxM0pi1M6-sooBlwZEoLpFUFMGR7HRbHFqyO3Q>
    <xme:c8qJaQiJeXcg7jUEq21SU_9vYrWiTR0pldGbxPvjkRdWUvaC-puVBUk87Zn_-b_jp
    pPi1wIM1DBsogn1-UA00mdLWYjp3bRgG40OSLBt7rdrxECqYpa-K0w>
X-ME-Received: <xmr:c8qJaSuWjkk_xgUOyTKjFMNbnGwBGVYvtdWmNUhZy39Lahey-cfTbWuxswkiog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeijeefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:c8qJafBxveFtzYJ6sUMVxdezrYUNbFteSL281M5auAzdFoY-ZftXtw>
    <xmx:c8qJaVVAfx-CKI9XWQgj2X8tsJxQcG_EWguwGOVW9HLLVWHHcfZnVg>
    <xmx:c8qJadJJiU55uXizmOjCpiQQscs8mVm0de_3HA4JnGZLPHwuHr7zOA>
    <xmx:c8qJaeVyZ1n4cPaoHrIWYehWghRX-6E3bvjJAlBHqxqmt7qbPfbzgw>
    <xmx:c8qJaWSArh7v-pa87OwkWLqvR1MBp2DxJl5d6Rv7stWO7ti6O7oPdFzq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Feb 2026 06:52:16 -0500 (EST)
Date: Mon, 9 Feb 2026 11:52:11 +0000
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
Subject: Re: [PATCHv6 08/17] mm: Make page_zonenum() use head page
Message-ID: <aYnJCnE5vooLROnu@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-9-kas@kernel.org>
 <e5831f0b-88c5-4a20-82b3-6e5952388132@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5831f0b-88c5-4a20-82b3-6e5952388132@kernel.org>
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

On Thu, Feb 05, 2026 at 02:10:40PM +0100, David Hildenbrand (Arm) wrote:
> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> > With the upcoming changes to HVO, a single page of tail struct pages
> > will be shared across all huge pages of the same order on a node. Since
> > huge pages on the same node may belong to different zones, the zone
> > information stored in shared tail page flags would be incorrect.
> > 
> > Always fetch zone information from the head page, which has unique and
> > correct zone flags for each compound page.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > ---
> >   include/linux/mmzone.h | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index be8ce40b5638..192143b5cdc0 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -1219,6 +1219,7 @@ static inline enum zone_type memdesc_zonenum(memdesc_flags_t flags)
> >   static inline enum zone_type page_zonenum(const struct page *page)
> >   {
> > +	page = compound_head(page);
> >   	return memdesc_zonenum(page->flags);
> 
> We end up calling page_zonenum() without holding a reference.
> 
> Given that _compound_head() does a READ_ONCE(), this should work even if we
> see concurrent page freeing etc.
> 
> However, this change implies that we now perform a compound page lookup for
> every PageHighMem() [meh], page_zone() [quite some users in the buddy,
> including for pageblock access and page freeing].
> 
> That's a nasty compromise for making HVO better? :)
> 
> We should likely limit that special casing to kernels that really rquire it
> (HVO).

I will add compound_info_has_mask() check.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
