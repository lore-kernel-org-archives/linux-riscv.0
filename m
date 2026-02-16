Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197FBE7BD92
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NnryjFfcwXUdMxuSmWQclHqxBrl25tW5I1L1Qk6oAw=; b=TSZeFZvof3hYTI
	ejdMnOKl3sx7cbrH6I+Q2MqDsG0DfUhkbjgT0GJzDccPPNbp8w97k/X+t+6dv1wDZoJx2K5vvPkdD
	fr+Z7TTbY5Jf1b5qY5MwpIsvID0Clg9zbI7Iulbiok4Vd9cb2+TeypQDXtkZYKB91WZQ3umGfbzE2
	00WMGhLJrjC64klgu/q0Go9wwic0O92TS9aqmz1rWKtEmPn8bF7ntk6vFGK2TrOwI2lEje/LU/4q2
	K5KwROv+MCCbA7MMetr7PxAsTuvyn2CUwU+M7r63PjSTloh8E6MhDQ4p0RdqOaH0gUQeyyaIvZSna
	tPvr/5ZbvseorkhPcHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwo6-00000006S3u-3cuv;
	Mon, 16 Feb 2026 11:30:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwo5-00000006S3m-0rwT
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 11:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1ACE8600C4;
	Mon, 16 Feb 2026 11:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A66FC19423;
	Mon, 16 Feb 2026 11:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771241423;
	bh=KFgAyA/laS4/MU7pCChfZBh0Hjfg1QRQ88qFNdP1x20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWiceWhkirDnroa2amGc7Yzcuqe5G8ZzuTAhP4Vi2rX9YaCZJRFkQEv1BUtrcTxme
	 CoTj9P4GePUXa+2Wik7u0Wa9Lh6eiWEnP85WL5vkfkwuTCedCzTsZIF7r86yv3rmN8
	 EB3pDibfGA3+kpFRt/kznLXW1GxPgr9DifC2KrGsvT6tFlNTTQA5FjR+5Fu0n4QbjA
	 oZuG7n1Usbb9IuvLtGMS7n7BRFUGm4ngi6H4saX9JqxL4vwB6mZIK7FcyjoXUhHmT4
	 ES6C+lZbk7cW84yPq72i7mDl9/00ThL3LQotaKdFI0i4HvL+d1sbmmGneJO0Ny4gR/
	 cLQC7uOK+Iz6Q==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 18EFFF4006D;
	Mon, 16 Feb 2026 06:30:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 16 Feb 2026 06:30:22 -0500
X-ME-Sender: <xms:zv-SafP6SdpwtyKrIy61_w1L6KRCDqa3wojRXdKE-WnfoRqegezjLg>
    <xme:zv-SaTo5THFs5nSUYFTs8rKGfx5IX0WsRqgOhoR-nGDQS3gxV9h-ysxYRQmfQbZRU
    rbR0SvvqJ50mFzQq0muRybdErIXOO4O9sBw69GMNxjx7zvk7ro2CZw>
X-ME-Received: <xmr:zv-SaVNZz4F9fftM3y5usJj4f403Eg3OPTylNcGpQErHuIZy8W7ryInBHKOaaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudeijeeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zv-SaXy3RYYkVrgjT2ePItIoI7nROGRlXkxJI-DmcNGsMg3Ks4NSYw>
    <xmx:zv-SaW0PCwprxWMPv1amXkIEXGoFlPtc4-K63ZVJwbuAOtiDic-kqg>
    <xmx:zv-SaeTXFVwr2DgeActR2sgR2pncUgpqpAePUJrhigvtC8oLr0r4pw>
    <xmx:zv-SafeawC4-UkIKrewg6FMu9XD5_XA_EuL2IW4uShBV2qn_vICcnQ>
    <xmx:zv-SaSvdYc1ErSSH4ujiq4HdlsAPlErFh89bDsMP690zvTe17atmywkM>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Feb 2026 06:30:20 -0500 (EST)
Date: Mon, 16 Feb 2026 11:30:13 +0000
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
Message-ID: <aZL-7mpPT_S3Paon@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-9-kas@kernel.org>
 <e5831f0b-88c5-4a20-82b3-6e5952388132@kernel.org>
 <aYnJCnE5vooLROnu@thinkstation>
 <6afd7334-82e8-4f87-8ed3-6448e89328c2@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6afd7334-82e8-4f87-8ed3-6448e89328c2@suse.cz>
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

On Tue, Feb 10, 2026 at 04:57:55PM +0100, Vlastimil Babka wrote:
> On 2/9/26 12:52, Kiryl Shutsemau wrote:
> > On Thu, Feb 05, 2026 at 02:10:40PM +0100, David Hildenbrand (Arm) wrote:
> >> On 2/2/26 16:56, Kiryl Shutsemau wrote:
> >> > With the upcoming changes to HVO, a single page of tail struct pages
> >> > will be shared across all huge pages of the same order on a node. Since
> >> > huge pages on the same node may belong to different zones, the zone
> >> > information stored in shared tail page flags would be incorrect.
> >> > 
> >> > Always fetch zone information from the head page, which has unique and
> >> > correct zone flags for each compound page.
> >> > 
> >> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> >> > Acked-by: Zi Yan <ziy@nvidia.com>
> >> > ---
> >> >   include/linux/mmzone.h | 1 +
> >> >   1 file changed, 1 insertion(+)
> >> > 
> >> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> >> > index be8ce40b5638..192143b5cdc0 100644
> >> > --- a/include/linux/mmzone.h
> >> > +++ b/include/linux/mmzone.h
> >> > @@ -1219,6 +1219,7 @@ static inline enum zone_type memdesc_zonenum(memdesc_flags_t flags)
> >> >   static inline enum zone_type page_zonenum(const struct page *page)
> >> >   {
> >> > +	page = compound_head(page);
> >> >   	return memdesc_zonenum(page->flags);
> >> 
> >> We end up calling page_zonenum() without holding a reference.
> >> 
> >> Given that _compound_head() does a READ_ONCE(), this should work even if we
> >> see concurrent page freeing etc.
> >> 
> >> However, this change implies that we now perform a compound page lookup for
> >> every PageHighMem() [meh], page_zone() [quite some users in the buddy,
> >> including for pageblock access and page freeing].
> >> 
> >> That's a nasty compromise for making HVO better? :)
> >> 
> >> We should likely limit that special casing to kernels that really rquire it
> >> (HVO).
> > 
> > I will add compound_info_has_mask() check.
> 
> Not thrilled by this indeed. Would it be a problem to have the shared tail
> pages per node+zone instead of just per node?

I thought it would be overkill. It likely is going to be unused for most
nodes. But sure, move it to per-zone.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
