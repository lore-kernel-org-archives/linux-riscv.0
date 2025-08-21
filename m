Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE63CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VsbHepBBneNaJ05JMpQetveUhEuPO/gwmufJop4cESg=; b=UNFoJZHYKL8rCF
	Z2VMjYGRnUHHmLDCDZZVVwCRAk8XqY0Z6+vIRC7jX/ZUjosrV5UYPI9B2MVpinsOJ6jhaYYna+U+L
	xeQ2Bw6nbTz9B11ICg2VFIrSo+/SXGllGHlJexFJsl4M1h/qU71G9UsWlh31hzVyBHmitDRKTtP3s
	sRb0c7fRUbaa0Q9d77t8ormv1d07IbHclp22vZePXq3kxiJkkJacJfQQZmlZBDUYuUHV/UqEtPetw
	lJ0up62Ysoj/vKAl5giOAl+yNuRKz/wYYIFyOlIGNJsi64WbOe0XnTCvgSbuyjxoBLaM5xl+OARBz
	GxneFUqvqdTb+kcr3/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFui-000000014CC-3N2H;
	Fri, 22 Aug 2025 00:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa7-00000000Nww-1etO
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jaRFM4K4Pg6WYlxhcM2k1BGbQ/DW6XfjnDsCttbmjXY=; b=kJY0bFR6le8zCY6MAOLLVwdpPx
	zF2/Wl+MslC2F00td2KgLyp0Z9AJQRWuSSnVWDPpdEoZtqRAm8tfoKxft5RDQQQ3WRVGsxD+sQoez
	92C1d1Np/1QZkVLdFQo5pRdoVo67VhIJtUI49m8SU2CjFsNSeoozSruIwHqatwLylM3LlV6JSu3kh
	6TrI1Qim1YJvQRPe4Cx3YNE2lv3AlmLLrTg3kKrmbicu4oG0XZNgc0mo3UH46chbtkxivARYQ894S
	n4E2+ySxA8MgHwHKuM5N5Y16ywQZy/48GfQfcpB4G1aHgvQkiq9vsxPR80T2jInoHoZWQ0966fgK6
	GqiEymug==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa3-00000000exB-3ou6
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaRFM4K4Pg6WYlxhcM2k1BGbQ/DW6XfjnDsCttbmjXY=;
	b=FD3FMq3pyETLhnnaGPuY3Bkhgw5faBJuu8bXQHSHyqI5bbIAUDDp1AbtHxxrnaZbn6DV8E
	1cZmyorXc6J9FxGofGgqoFib2vTlWpdhQOVWV5oTFhksuZMnvCz+eURSeyR114jhwc8wS1
	VN5HGVQHpyFIAR6QRnb7bb/CARSUsM4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaRFM4K4Pg6WYlxhcM2k1BGbQ/DW6XfjnDsCttbmjXY=;
	b=FD3FMq3pyETLhnnaGPuY3Bkhgw5faBJuu8bXQHSHyqI5bbIAUDDp1AbtHxxrnaZbn6DV8E
	1cZmyorXc6J9FxGofGgqoFib2vTlWpdhQOVWV5oTFhksuZMnvCz+eURSeyR114jhwc8wS1
	VN5HGVQHpyFIAR6QRnb7bb/CARSUsM4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-wgAJtPSrM2-6GSr0rZ3uOw-1; Thu, 21 Aug 2025 16:08:04 -0400
X-MC-Unique: wgAJtPSrM2-6GSr0rZ3uOw-1
X-Mimecast-MFC-AGG-ID: wgAJtPSrM2-6GSr0rZ3uOw_1755806883
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3c584459d02so247363f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806883; x=1756411683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaRFM4K4Pg6WYlxhcM2k1BGbQ/DW6XfjnDsCttbmjXY=;
        b=cE3aKmNBUDvPYMD8/gtalfOGarVVeAR4VdUDUGamBWIQIoV3vUxgZkK3pvR0hhroep
         ewlHnkYEagVn7mEwYrVuwJRpmXtRZBSVCzNxdcHbH/m/9jYezrY48LREvatBws7eLmx1
         THDQvcdVlqWxfTBlDI7a8QeGPDhSfWhgAuit0mNZKHYmO33t5ZDBDwwRBiBb0LgOpHng
         gm/4n8EJ3LF/93vGn7IAxUuDSUe8mLKn8zlGfObce6+/F0KigF8cpiarkA1zx04kOCJI
         i68nQhEuefYROJSeztMSUnQqTWjJ6Vn+Ke0OKaylfjlLzdF7q9um+TOl/hoOJq9gdGZy
         aM7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/YKpd7LI0J/b8u2YyyLtW++QD1MwhO3P/81A+Sm+7tdUAhWBo8oFNgXJppPQs3yE68mEJl2m9jetJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yws/g8779TM7B5wF6jNyG6+TGjYvxw9grHvYgldHDKoYpG+vw4i
	LF2WebaMKPVCPZPmg0BgarulQyPx7T9OPcuCXie/fki/lrlfrpPOZNuFtBowWWXIgsnETINm5zx
	ZFMysedkatyyIxEDH3RhK/DsFhlzSUSgKGWJb1wvEP4nRabyzqo3XwsYr62DatcXGWsBmKg==
X-Gm-Gg: ASbGnctP3c7rR4JRyUyvMjOFa6t6TMrK19VfGaHt0qOX3n3ecRoAIHWX4dAwUSQXRZ8
	9KESLbYmEIlKWgVJshfDgJlKguE4aOKj7aURudV0KllYSKb4qNiiVC4+jNyhvMkyd6XglatOE/S
	LzQZRz3bVrbf3S7EbSDveIYBeqAPVrvSd8G2QFU6zJxBk7PQU7xUvmMefbB7jfLTZ26nDxtg6hn
	X7GOkJgClgOTr8RCWoIbzfq/cscX8Op2ofCGoLsCU83mccMCSHfLy6xWRftWb+VuUeizHx/aQe0
	J7lj3T9dDiwO7luWJBG5glfffiFBY6e00kUIsT2d+feh+IznSTE5JNV6RoD3+t2TR8L2BYiBGoj
	RCu5p1YkaA/AeO1ztFFZ/JQ==
X-Received: by 2002:a05:6000:2012:b0:3b7:dd87:d741 with SMTP id ffacd0b85a97d-3c5dcc095c3mr196202f8f.42.1755806882815;
        Thu, 21 Aug 2025 13:08:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiRO9AsztHDXjXXwtKcCswXKV/HQQvQjujQOlltIgK9F5s1Ca8ikdDYrX2bvCVEtKZoFK6NA==
X-Received: by 2002:a05:6000:2012:b0:3b7:dd87:d741 with SMTP id ffacd0b85a97d-3c5dcc095c3mr196155f8f.42.1755806882316;
        Thu, 21 Aug 2025 13:08:02 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e0b299sm8957945e9.22.2025.08.21.13.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:01 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 20/35] mips: mm: convert __flush_dcache_pages() to __flush_dcache_folio_pages()
Date: Thu, 21 Aug 2025 22:06:46 +0200
Message-ID: <20250821200701.1329277-21-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3L8UuQKJg_2ZAAhhndw4Vy2RJDtZPxFEikmf5Ot1Zso_1755806883
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210816_223972_F6F20F7A 
X-CRM114-Status: GOOD (  15.80  )
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

Let's make it clearer that we are operating within a single folio by
providing both the folio and the page.

This implies that for flush_dcache_folio() we'll now avoid one more
page->folio lookup, and that we can safely drop the "nth_page" usage.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/mips/include/asm/cacheflush.h | 11 +++++++----
 arch/mips/mm/cache.c               |  8 ++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/cacheflush.h b/arch/mips/include/asm/cacheflush.h
index 1f14132b3fc98..8a2de28936e07 100644
--- a/arch/mips/include/asm/cacheflush.h
+++ b/arch/mips/include/asm/cacheflush.h
@@ -50,13 +50,14 @@ extern void (*flush_cache_mm)(struct mm_struct *mm);
 extern void (*flush_cache_range)(struct vm_area_struct *vma,
 	unsigned long start, unsigned long end);
 extern void (*flush_cache_page)(struct vm_area_struct *vma, unsigned long page, unsigned long pfn);
-extern void __flush_dcache_pages(struct page *page, unsigned int nr);
+extern void __flush_dcache_folio_pages(struct folio *folio, struct page *page, unsigned int nr);
 
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
 static inline void flush_dcache_folio(struct folio *folio)
 {
 	if (cpu_has_dc_aliases)
-		__flush_dcache_pages(&folio->page, folio_nr_pages(folio));
+		__flush_dcache_folio_pages(folio, folio_page(folio, 0),
+					   folio_nr_pages(folio));
 	else if (!cpu_has_ic_fills_f_dc)
 		folio_set_dcache_dirty(folio);
 }
@@ -64,10 +65,12 @@ static inline void flush_dcache_folio(struct folio *folio)
 
 static inline void flush_dcache_page(struct page *page)
 {
+	struct folio *folio = page_folio(page);
+
 	if (cpu_has_dc_aliases)
-		__flush_dcache_pages(page, 1);
+		__flush_dcache_folio_pages(folio, page, folio_nr_pages(folio));
 	else if (!cpu_has_ic_fills_f_dc)
-		folio_set_dcache_dirty(page_folio(page));
+		folio_set_dcache_dirty(folio);
 }
 
 #define flush_dcache_mmap_lock(mapping)		do { } while (0)
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index bf9a37c60e9f0..e3b4224c9a406 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -99,9 +99,9 @@ SYSCALL_DEFINE3(cacheflush, unsigned long, addr, unsigned long, bytes,
 	return 0;
 }
 
-void __flush_dcache_pages(struct page *page, unsigned int nr)
+void __flush_dcache_folio_pages(struct folio *folio, struct page *page,
+		unsigned int nr)
 {
-	struct folio *folio = page_folio(page);
 	struct address_space *mapping = folio_flush_mapping(folio);
 	unsigned long addr;
 	unsigned int i;
@@ -117,12 +117,12 @@ void __flush_dcache_pages(struct page *page, unsigned int nr)
 	 * get faulted into the tlb (and thus flushed) anyways.
 	 */
 	for (i = 0; i < nr; i++) {
-		addr = (unsigned long)kmap_local_page(nth_page(page, i));
+		addr = (unsigned long)kmap_local_page(page + i);
 		flush_data_cache_page(addr);
 		kunmap_local((void *)addr);
 	}
 }
-EXPORT_SYMBOL(__flush_dcache_pages);
+EXPORT_SYMBOL(__flush_dcache_folio_pages);
 
 void __flush_anon_page(struct page *page, unsigned long vmaddr)
 {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
