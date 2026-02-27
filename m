Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE86FFD8FFD
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GS/+rG/vnMYO/fbRQbkBp4h5xnllLDVZrZ21DarPXMY=; b=VU5YY34BoGNsol
	ZgB57TNzkFwNdxH/+Zut0AEQgK121VvSTmPBhUWa12fP/1z16v1FBOm/wZwF4NXJnU46UJH/Hlr5w
	Eu1Lmv5PW0SEbQxeV2/EP4ju1Nl69nSX7lddHyvJYHzpBnkvwvJqL1nXcXKw6aSL/HlKv93zkDKUO
	GMhDR+azGrAcwUzir/BDYTon7K6V6i9GSTkK76IVjXh9maNHnVIIBc9rRIjcyAa8wa3Fm1/ZnNuob
	IKWLkMFbic1L/xyw/mvOdVgleP95S2dqgc61NSBF4IJ6VUr53H6iBBxSj56wtsBGBELYj/wCYfCEC
	cF8fSDj0jsSJ5T83uTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3j2-000000092V6-3TnG;
	Fri, 27 Feb 2026 19:42:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw3j0-000000092Uy-3XLr
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 19:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E50E960130;
	Fri, 27 Feb 2026 19:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A2FC116C6;
	Fri, 27 Feb 2026 19:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772221329;
	bh=qix5xWTZDms/A62vFZUqjLyjGKPSA6VqMVFDJq6TWjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRJvXF3fbr382lsZe850hbuq9j2JDOKV2XZPmh+z/rg6YPJmsZJ0SVFAT9XEUXPkc
	 pOXr0I9yUmoutFoqqNA2ucqYDU/wdEGiKNP2owFrRl8s2rNtFR40MafvGtb60kyBA+
	 840cibMCM3XKWjfw+XGo2sdfV9rNrTjo3Q1QzLLXyDx7upGDirSvn5LqSiAnCLffDe
	 3pw/54OCYfvwLR38FAIfiqkwgSprW+Z10tr4sP60IbptX8QkIH0GxoX3hkZxmsUo3i
	 X41ngQO5Z2WYS8My+sW8C1KEtjCaVh8m3TYYPNZbdEyC/2p1ohHKmvE2mxoI0piXiu
	 pGLCAQqEJNz7A==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0F16FF40068;
	Fri, 27 Feb 2026 14:42:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 27 Feb 2026 14:42:08 -0500
X-ME-Sender: <xms:j_OhaZ7T8xofTbSV_wxzruxN-nXeWOHmR9ZUD1N8fdum7Ka9GtazMQ>
    <xme:j_OhaanINzpVNXlZDJYg638MRgHKQ46XBK26arkcwRiDKPsDRV2RWCU4v7MgZ3jwX
    _VssFV-r2qgouJQB_7JssLJfMR2vG6D0MleT2NV1wp59l5i4lkiVAk>
X-ME-Received: <xmr:j_OhabhTJmjGZzRPAgdx-N67m3ARSYHeGQPgi0a6vxPrAPS9vrUeatHTMZkmKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeelkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepheegpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:kPOhafnUoUDPlFCZDk2Q6YSXDMzCj3KxenrCgMhAaoYIYmX6Qrgxvw>
    <xmx:kPOhaSqBA9KT8bWFyqwoAM-s_hzFRN_uj898EqG-swi9NYuIvCnGjg>
    <xmx:kPOhaYNCdJ1cD37tHA4NIBWRC7GtH4Iy1Sg8pe6g-XyC34N49zVwYg>
    <xmx:kPOhaUJcDtBW1voctED0w0hVn5SxnOGPTX87wunEpNeAe432yBjBzQ>
    <xmx:kPOhaf1qJWEWG-0cmHQxVXVAKA_1czZ0-hfziyUmT2Cem0dtfjvqENGh>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Feb 2026 14:42:05 -0500 (EST)
Date: Fri, 27 Feb 2026 19:42:01 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv7 00/17] mm: Eliminate fake head pages from vmemmap
 optimization
Message-ID: <aaHzKykadJwN7tF1@thinkstation>
References: <20260202155634.650837-1-kas@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
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

I've screwed up threading in the submission, please ignore.
I will resend properly.

Sorry for this mess. I should have figured out mail by now :/

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
