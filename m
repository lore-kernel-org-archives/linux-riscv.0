Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DC6E7DEFA
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4z0Oz0+2gIqaQuyQweQP2il1Qq2SsaWiumlAp+XB3FA=; b=uPLR0i3uZ3KL0O
	h2e3su8yNB9F5E4XHtAgeIB9QRLY4HBx212VRLvIlHenxfZy5sJJ1ieAXU/9kHNqFCibsF7954duP
	pKFhyGMDxIqYs8mhQjrZ0xqUn1XGFWZac1BCcc0Ze6GZz86S4E97G4ZY0nc42wHCDTTLmyfpAXa+i
	rwYMtm2bqMkrgOehKPumXggV0UY70znMnxdV1ohS5Rmyy4vxnHZkVHzf4ncfMDRBuj4OaU6rhs7Hc
	9/TjQlLuO71I/unvsXYaszN8p6+Hx7lyRHNuau35WFeVdYLmEQ0ALvB/0riOFDLU17we9EoYeIrqq
	Ek9PNpUvwDoCZGzcnkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwJO-00000005EWu-1Wgg;
	Mon, 02 Feb 2026 15:58:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwJM-00000005EVC-0zG3
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 15:58:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4F6A4358D;
	Mon,  2 Feb 2026 15:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238C3C2BC87;
	Mon,  2 Feb 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047879;
	bh=WA5hQUJoQwTD5DQSyUz0pDcyfXp3ks3On7x7VB179to=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KTB/JqlEJ0Yf3Mxhwq6g5Eh82E1SFor4YtOXOIN6rO7+jz9lW9Fw29EqJAlEXpsRL
	 iwvtdYp3BaZ5fu3J1xAg713q/QqLl3My9IZgIAQCBiYjfLvhSObD1qCZeWFXkyCsil
	 +vR2/tXjHW0ok76oGn2apDUe0t1dJDx4otlaEv7PuZ5YqUzW25UtS4VIcuR9cKiGoq
	 GqZjOpjlBTkFFAEWMMBEKs+GHBQajRMqu59ZIoprVf6MtX5W2HBsJaA0wE33RKtZ1s
	 Xxn5wZJ7qRNOdEaB2PSAusDvl6Ef+8OTAHQZ+40AtXpTKNOS/Q1Zjc4o85TEqCjXY1
	 9crBnQQSJUBOg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 47309F40069;
	Mon,  2 Feb 2026 10:57:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 10:57:58 -0500
X-ME-Sender: <xms:hsmAaTBQZnR96Q91CZbmjPSTynsTVNZHY1DrMuXy2dOUuuY5IVSovw>
    <xme:hsmAaStOjFcQZEGn751h8X3BtKm2h7RP9etcmAKofmY0s7nHtkRsl7PaXQzIiEMmS
    JN9IyHyC_QB5o_wf4KSpLcS4db3EGHqpT0r303vTIlHGddgIbOaa3o>
X-ME-Received: <xmr:hsmAaYvLSawEGBnSu6hIZGeYAtPiRYjKtE7pbBIAio-yUv6gc6DVSi73tcilPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
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
X-ME-Proxy: <xmx:hsmAaWrfkRMR-C481qatfZVcrV7WP255E9JiKBpBFYHu34vxe6T1sw>
    <xmx:hsmAaUNGSCpkDpGg21FjG5PCQVfurMWNdvxf_13zAqbCu9oHDe3Klw>
    <xmx:hsmAaUmg9Ut75Ri69ArrFnTmH23UMAcC5eOYZyJ9ln4p8ruiWiuQ_w>
    <xmx:hsmAaes8SEOO3JrV17-fS01MfuAA7GyPcoxf10sWs9kU9GIckuILmQ>
    <xmx:hsmAaTnyKO1nCmkLtmeUgvlHwZhpCCTOlpIMK0dE-1r-Nd8eLa9G01Sf>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:56 -0500 (EST)
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
Subject: [PATCHv6 09/17] mm/sparse: Check memmap alignment for compound_info_has_mask()
Date: Mon,  2 Feb 2026 15:56:25 +0000
Message-ID: <20260202155634.650837-10-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_075800_309612_140882AF 
X-CRM114-Status: UNSURE (   8.67  )
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

Add a VM_BUG_ON() to check the alignment.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Acked-by: Zi Yan <ziy@nvidia.com>
---
 mm/sparse.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index b5b2b6f7041b..6c9b62607f3f 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -600,6 +600,13 @@ void __init sparse_init(void)
 	BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
 	memblocks_present();
 
+	if (compound_info_has_mask()) {
+		unsigned long alignment;
+
+		alignment = MAX_FOLIO_NR_PAGES * sizeof(struct page);
+		VM_BUG_ON(!IS_ALIGNED((unsigned long) pfn_to_page(0), alignment));
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
