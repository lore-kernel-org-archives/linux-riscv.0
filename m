Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B130D2592B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEyaJrqJVHmPatvi9ElroS7208tsQER2RnMbU45Q6X8=; b=2vpSM0P7hWgduq
	twcI9wwvSebk0dMDDa2IIey9jjQn3QZC4eXSRrONCqo+CGyyCqdG6EfBsv90akKEsxSwTMxvL3T2/
	AELM9/sXmfWnl12tcH3Mp46xnW/X10hS6CRHW7p4k9HWmkxvF5F8HcxC2cQ8iEyRYEyPCCplc2SoC
	wxauH+ihUXfm6S0vubehM+9bf1FODvv2h+dErftmM8y9kY05HhktVd3Seshkftwv3HlIJdTcEuLWo
	ff3K2PvzCyBIkomgWX9oRdC4mDXODpB3h0z1yC6tXOikQ5OwXres25VaEfhOy3EnI6IWqwihC++6J
	dT8Z8QfLpe0Icra9LH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl61z-0000000G76i-2ZsJ;
	Wed, 28 Jan 2026 13:56:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl61v-0000000G75F-48DC
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 13:56:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97A76402D9;
	Wed, 28 Jan 2026 13:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA35BC4AF0B;
	Wed, 28 Jan 2026 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769608583;
	bh=b91kl2Y7wNS31vuKwPTA6osyXzCzrCdA/U3fWgaFpvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fp6j4ESWls0g4guXmBtJsetkvINSeuu/OyesPMPmy8o3e+WqScuTVci2ECveqONti
	 LXFyxZ8a3XF3N62st3LxSktINQc/fCHXdNRxtP9nVPOFq+uQORS1bacaG2MLO4hDJh
	 Xf11dSizLpArTYmLiaODHds2NmwSkN4CtxuL9zkLsynE/X24FExn5uLN2AmrpsEVZw
	 vTTMKnr4Xk4L3T27yjpTHOb+D2iksejzQh/xP7AUzRbmQ5Tvtl19BM+OTEMjwkTl60
	 5puOfunCE5kYKdRYE5e1oec2JMNdKRe7Ea1X9fX+wwGI2eEFs2cAyi72d1gDNBIQLm
	 Mvb7/gx4ZdEEg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0BD5EF40069;
	Wed, 28 Jan 2026 08:56:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 28 Jan 2026 08:56:22 -0500
X-ME-Sender: <xms:hhV6aQJVBWYjeWHryXDJ5O2cOW1PVek3og8rYHzYpLSJ2lf2gdoy-w>
    <xme:hhV6aZUHLqTRmG7AUfDcX1BGWm5uikU7S8KP36t4kXQa5eANwa6oM0SoiHoYy008P
    NUBfWOYXZusMUsRGQI1GbTolzLXtyTBGvlgKd-HUdjvYOBAiYhH3Q>
X-ME-Received: <xmr:hhV6aa35cnPVojD9_OXPu_6GoUMYMMWLDrz8mpJJs3QZ-4In4yA9wFoh8tmEuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieefheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:hhV6aeQP5eLhTx4zu1ETQKwbDMOmhXDMX8l5FsxIgJiSwhZRGvLs_g>
    <xmx:hhV6aTWGuaoLyGuETHuIz0W1MuqRjjgVJAQoSihAGGlj5HXSHh16hw>
    <xmx:hhV6aVNGuYpQuoEwuiYPN61HNkM3MpC-TOZAADE63U6IkXveRaSIUA>
    <xmx:hhV6aS3r-oD0bU3ng8lxZnNiKzMiwhNQDyr5qgnRUdX-Re2A5zmkdQ>
    <xmx:hhV6aVNwpJsNaS6NncEgFNEDDJvYk6Q2P6s8eJV-rDt2zUwtBpTwQEKy>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 08:56:19 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv5 09/17] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Wed, 28 Jan 2026 13:54:50 +0000
Message-ID: <20260128135500.22121-10-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260128135500.22121-1-kas@kernel.org>
References: <20260128135500.22121-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_055624_064072_A8A57105 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

If page->compound_info encodes a mask, it is expected that vmemmap to be
naturally aligned to the maximum folio size.

Trigger a BUG() for CONFIG_DEBUG_VM=y or WARN() otherwise.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
 mm/sparse.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index b5b2b6f7041b..9c0f4015778c 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -600,6 +600,19 @@ void __init sparse_init(void)
 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
+	if (compound_info_has_mask()) {
+		unsigned long alignment;
+		bool aligned;
+
+		alignment = MAX_FOLIO_NR_PAGES * sizeof(struct page);
+		aligned = IS_ALIGNED((unsigned long) pfn_to_page(0), alignment);
+
+		if (IS_ENABLED(CONFIG_DEBUG_VM))
+			BUG_ON(!aligned);
+		else
+			WARN_ON(!aligned);
+	}
+
 	pnum_begin = first_present_section_nr();
 	nid_begin = sparse_early_nid(__nr_to_section(pnum_begin));
 
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
