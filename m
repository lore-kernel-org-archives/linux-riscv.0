Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99E1FD8741
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fw+bBSjsm06Hl+yXQN59CEOlwZoyKSxUeP609Jvr+w=; b=gXiEUxi+OaTTnm
	ioVN0xeEeYC3hcWHIrZYVFJm8FpBm7Zl1SDWGovgEbcwnfIJlVSo7agZ9UrtI8UYXxPlarS1gMP0H
	FnGQZjolz8iIJuo7nbpPaE5J+25Rkh4fIWo45clfJIP/7l8neXFj9Luymi4BHbI84QcveVQwjWZfo
	tsEF19EM3Nn2KF2HidM2Sr/dZeaE0LhxrFglqYgEBSMheZQS8H1g4BJsk6N1ihaKqd+u59HsnlEMX
	lHmdvHoeQ4zpDhU9E3x0kppvjEcznv6ET/iE+MSeaWJzjOdrvntCxKBOfyUCJFrQVBum9fWwhzMEp
	nE7aIEJLZ9KY5Udnxrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SbS-000000068V5-0NX9;
	Tue, 17 Mar 2026 11:28:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SbQ-000000068UK-1z6G
	for linux-riscv@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I9ks/T4YP0lNoMvxyMbbQ32C1Tx190z0EOoIY0aEysg=; b=Apsc8V3wRI7X1dmqopSONYtZEf
	xCJ255+TzGtGaeRzntWuqJHbWrG/RFeGaHv9Nyki434GgCQ5dfi/Sns7Fx0o5gfXosWToX6kron+P
	xaobKxnzu6iJybSj2ChXKOQxskDB8Dhplr6zZdfQvVKPp+ZRGMti8FlUFw6LUBbJ28xT9/SxAKKca
	aTcT0fu41y0SteXUQpcxrVTV2UC0nG46Rx1BKU+X99eyIqR7QHWkQPpzRXcQfduE5Zgll8zP3Mkl5
	A8MpMuPCtd2+PuXZPuJLnhwAom91EgPapplT3A2Ai9H8JTJZ/jV6IpEjeErrej0vFqqtP+ccXVaSm
	zoOIX1Fg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SbL-00000008p66-3uh7
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 11:28:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F4F74374A;
	Tue, 17 Mar 2026 11:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C537EC4AF09;
	Tue, 17 Mar 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746922;
	bh=32qbYYZEgqHyAOOKzk5WrymnIe+x73RqYh712Mog1As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdIGeuR59iiqFhPnWcecegpZD30lBPjH6oyJgNrZ6sTuqfj67G8KwOQMWRpH66ln7
	 Tb+7rKSnyapJxOuOYPf0JqsZH2UEsi7+u7bYXa84wITJpd0GoQExdA157pROiQ0xUG
	 FkP/HT0QhUuw5NL2RQRZavEB2AO8Z6ynUUE65XnPSOjoNXoU74KUjQ+SHXoxtRuIUS
	 TOnUblaSujaS4wEbaEDE+Z0BBhVvhMdSbMomo10xrl9uEkH5esYJK4Bo9jOSvD5lO9
	 UHg+lN1Vc3K6yiC0r5V5MihGfutd9Xtk6BEwYZhd4ijbJ2iH45Yye6vueuxh2SZZSA
	 WmIwjPwb4DRKw==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id E28B8F40068;
	Tue, 17 Mar 2026 07:28:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 17 Mar 2026 07:28:40 -0400
X-ME-Sender: <xms:6Dq5aRezeypjqaoWwhIQjsBuBEhtrdSNLXG62S2ccj2KBrdeDFlkMQ>
    <xme:6Dq5aY74Fzu_kW2IqbfV7ADlOCPU3a5H6IRhoUJbaJFuIFM6vzTvk6CH4GA_9jHxe
    pdSR_A8fESh31IsvOjhte6pYMvlqQX2L24C8ZGztBbjCN7_vsrTO-o>
X-ME-Received: <xmr:6Dq5aRdI5bQ3PZ3PcWm9JNgk0qQj8TjCz4neksWXvW5aj-IlU9F2Xjfx8kX_RQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduudefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:6Dq5afB40A8o3F4M6vXhGQivGB23CU8zGa6dY7zbd2L7KjB6TmweRw>
    <xmx:6Dq5adGl3TJC6mmbn9eD1LlxwlRJZfuXH1_ME-MYxf98BtvkMSsgnQ>
    <xmx:6Dq5aXi4DU2MhQ1B_Ii0EIM91z-qBbr92LZM83CYfF-7lQlzf6SkjQ>
    <xmx:6Dq5afsxgNwr3DMB23qGX1nysq_EKzWatd4vzWcPpqaHXuIM_OQKzQ>
    <xmx:6Dq5ad_BUpkXLTbLl-0RPF25cJY_OlBhTA00Q_FsAXEWdi13FUI84bed>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Mar 2026 07:28:38 -0400 (EDT)
Date: Tue, 17 Mar 2026 11:28:34 +0000
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
Subject: Re: [PATCHv7 09/18] mm/hugetlb: Defer vmemmap population for bootmem
 hugepages
Message-ID: <abk58j2bV0sGabEU@thinkstation>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-10-kas@kernel.org>
 <4e52f70d-e0c3-471f-8073-68c0e9bc94ca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4e52f70d-e0c3-471f-8073-68c0e9bc94ca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_112844_333673_F23E4A0F 
X-CRM114-Status: GOOD (  22.17  )
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

On Mon, Mar 16, 2026 at 05:48:24PM +0100, David Hildenbrand (Arm) wrote:
> On 2/27/26 20:42, Kiryl Shutsemau (Meta) wrote:
> > Currently, the vmemmap for bootmem-allocated gigantic pages is populated
> > early in hugetlb_vmemmap_init_early(). However, the zone information is
> > only available after zones are initialized. If it is later discovered
> > that a page spans multiple zones, the HVO mapping must be undone and
> > replaced with a normal mapping using vmemmap_undo_hvo().
> > 
> > Defer the actual vmemmap population to hugetlb_vmemmap_init_late(). At
> > this stage, zones are already initialized, so it can be checked if the
> > page is valid for HVO before deciding how to populate the vmemmap.
> > 
> > This allows us to remove vmemmap_undo_hvo() and the complex logic
> > required to rollback HVO mappings.
> > 
> > In hugetlb_vmemmap_init_late(), if HVO population fails or if the zones
> > are invalid, fall back to a normal vmemmap population.
> > 
> > Postponing population until hugetlb_vmemmap_init_late() also makes zone
> > information available from within vmemmap_populate_hvo().
> 
> So we'll keep marking the sections as SECTION_IS_VMEMMAP_PREINIT such
> that sparse_init_nid() will still properly skip it and leave population
> to hugetlb_vmemmap_init_late().
> 
> Should we clear SECTION_IS_VMEMMAP_PREINIT in case we run into the
> hugetlb_bootmem_page_zones_valid() scenario?
> 
> I suspect we don't care about SECTION_IS_VMEMMAP_PREINIT after boot and
> can just leave the flag set. (maybe we wan to add a comment in the code?
> above the vmemmap_populate() ?)

I think keeping the flag is right thing to do.

SECTION_IS_VMEMMAP_PREINIT indicates to core-sparse that the section
should not be populated and it will be initialized elsewhere. Even in
!hugetlb_bootmem_page_zones_valid() we take care of it in
hugetlb_vmemmap_init_late().

And, as you mentioned, nobody looks at the flag after boot.

> Nothing else jumped at me
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
