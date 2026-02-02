Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9EBE7DEF5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MR9Iol00nt7oZdTBfbcRmfO0NfleR0Xu6vU5jj2xjug=; b=KJnpfa8uSIzHB3
	kfj0QZjGySn1L7raWMKzW+998iPye4vOHkjHOKdcGEmMkgl+JSxLex0HHxH0G60klEMWzFkcQ7JUd
	Qc30XjR5GnpG0bqa+Rvx71hafutk2YXbLi7MpyUk9goOzurELfueYyNhYOx8ddrvflRG5sMptqJHx
	ACJr6ICouaOvFTD+xMOzgscT7Ln3hlW1dfeA+VDMCD3MvDT1SFpgA3W9+m58dLj8M6vYR9UKTwAEV
	wwYqipCLaFxTd8CJ0I4GpUJW3HZhZvT+aetbHgyHwSVL1L17+z8U64LtMeugFeir2WWa5SsHyOfEM
	U0eaasfjIkxzxS4MfEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwIz-00000005EGn-39tH;
	Mon, 02 Feb 2026 15:57:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwIx-00000005EFG-01I2
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 15:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D0AB433EF;
	Mon,  2 Feb 2026 15:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C53C116C6;
	Mon,  2 Feb 2026 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770047854;
	bh=gSmvqtqPx9nfy8Fha/oZ+Wj5/HcAhp/Bj63bLn9BVgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=izIKUzYLZJXR2WeI7uakNi4F82v5uaw2wWsdekl5LIQe0+3irnuxFOcYsokeANFo9
	 BPGBTFZMJSJvMo9l2pb8k1Abi7RceVpX9l47L3Z+bNiLmqU/Xye7n8Ca6JIexgKrIr
	 XRL8CXHQFDOoiGGbVKi9t6KRSFv/nBd/6Lb5PRcyy7YO/T5oP0T1ciz1HZj/sd+uZj
	 dKZjkR8DkNj8JhEKW0CcR6taomqmuLh05966fvdr1/j8OWPYUY1Q90isGr2/XR7C3R
	 F+qiKwajZNl6SI1IReH43XujW3Ap8dcdNlEqscYmvyuMCvgxdCHt8wvSk+qUbWGEi/
	 oHv4gcHyg2S9A==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id CEB09F40069;
	Mon,  2 Feb 2026 10:57:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 02 Feb 2026 10:57:32 -0500
X-ME-Sender: <xms:bMmAaSCzcV5HuR7RJqpanDvjJDdNlFkuvC94IELMOTza9EKqNR1nFg>
    <xme:bMmAaVsOiY6uEI5blRsby8H2_uZCVHiouoW2HGLLXwZnQljYs9d30uBBB5wRKAqf2
    iQfgQpu_YvmiZinco7_EGakCrzBA9U0KBVRdYiEwDxJ-M0ZzjBwJcs>
X-ME-Received: <xmr:bMmAafu_0vbGRSJSn8kPuLq1vkF2ltv2YTvHV6V7PZrvaOec4UCCuhP6CSCQEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeektdeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:bMmAaRqTvlKVGJza3f8bEETEcQLhAkukYXxBppzgmGFAd86GXAyhWA>
    <xmx:bMmAaTPoAIB0vrAQLwY5_OjpT2zjbCkRyT1kdRJZ60qw1SnxmZ_Emw>
    <xmx:bMmAaXkzUBbNOvaDtlQfdJVWpos31RDXba8S-nesVoJyPQEwkakqug>
    <xmx:bMmAaVsIVhxfdkZFBh5YITP170M0Lxfh_rPnpeQ4XzAhcu74dCyr8w>
    <xmx:bMmAaekwD2iLHzTQDSNSC9gfE4-g0rjO0kM1JEZhdAY3GGOLZBodlnru>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 10:57:31 -0500 (EST)
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
Subject: [PATCHv6 06/17] LoongArch/mm: Align vmemmap to maximal folio size
Date: Mon,  2 Feb 2026 15:56:22 +0000
Message-ID: <20260202155634.650837-7-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260202155634.650837-1-kas@kernel.org>
References: <20260202155634.650837-1-kas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_075735_088026_DC1C04AC 
X-CRM114-Status: UNSURE (   8.96  )
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

The upcoming change to the HugeTLB vmemmap optimization (HVO) requires
struct pages of the head page to be naturally aligned with regard to the
folio size.

Align vmemmap to MAX_FOLIO_NR_PAGES.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 arch/loongarch/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index c33b3bcb733e..f9416acb9156 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -113,7 +113,8 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 	 min(PTRS_PER_PGD * PTRS_PER_PUD * PTRS_PER_PMD * PTRS_PER_PTE * PAGE_SIZE, (1UL << cpu_vabits) / 2) - PMD_SIZE - VMEMMAP_SIZE - KFENCE_AREA_SIZE)
 #endif
 
-#define vmemmap		((struct page *)((VMALLOC_END + PMD_SIZE) & PMD_MASK))
+#define VMEMMAP_ALIGN	max(PMD_SIZE, MAX_FOLIO_NR_PAGES * sizeof(struct page))
+#define vmemmap		((struct page *)(ALIGN(VMALLOC_END, VMEMMAP_ALIGN)))
 #define VMEMMAP_END	((unsigned long)vmemmap + VMEMMAP_SIZE - 1)
 
 #define KFENCE_AREA_START	(VMEMMAP_END + 1)
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
