Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A918CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1WoBPoEmTTWNDs988bEOLq60OBMhhl+2w6RWkJYO0c=; b=vfY4J7DnDW11Q+
	2Q0hzIAYNCSQDdEShPDmPNv6Z+rwNSDABho2QqYljsQLgBZsYdhKBoSSozmcve2PXufgpf2VJGG0I
	N0YAgYG3imxZvNxezXS2FbDzibzW0rAwbIbATnXk03oPGGjpumTLrFb6+k+pp/akItX4Px6A6s4pb
	WeKL74ixkvjA144rHNtWJQRxhFbIKtATHmI6lY0DhDerSEYp3IZmoHAI48xDobXS1vwfbZSb6NnI/
	GMuKgBtngrsBtfhkJMvsH+Ck95Xt9Uxv+tcRxNBfIVu8jY9e9e1iPxgVDLZWFcB8mpSpfMJk7n0qW
	H/KqkheIeMfzK2X/zzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG1o-0000000162A-2mEg;
	Fri, 22 Aug 2025 00:53:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBak-00000000OIC-3IRW
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=; b=j7Wo6GgCUDVv6UzHD00XLdkjhC
	3KbyfRAe9vm2i8iA+zkM4eGKIETFU/rIgLKG1wmoM0EK5/NTnJvS97fT7yHPMj0VmaAIS7SAC6QFX
	T+BHsKWbXgfAgboigtz74xJEC8FuWi+/RrZ5Zh24MPiVaWvD63LjhDDR9fuEuYiHljPuD+zE6218H
	qaRWEoHpBMYgKlWSwNnMb9VUenAZIy9Q80memJ/mBawfqxGGWEYTVBsF75spdCjxNDJJq5B6/QX8g
	pfOZypX1EvI6GB+ouUya1c6dmLWmJu6XmO2YOyjR1OPyfi0Q3sK12NWBbHQaKcTpohtZSgkkhOUcR
	JO5N7wEQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBah-00000000fMd-3hR2
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
	b=TRoQtw3f9xuA3hGHbVXsu6MxPLA3hrXwfyCGLYr/2tA0+KrmA5XMSn1aVF05v1pxtkfSL9
	64LM4k0a8EuQd9ayAMMY0UBqpSENOZ2BkGG9AYBCd9nuEUJf706ShGgMKYmymL/4SVSGDW
	V+eG8E06OvItj9H66RfEbENDPLaD/wk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
	b=TRoQtw3f9xuA3hGHbVXsu6MxPLA3hrXwfyCGLYr/2tA0+KrmA5XMSn1aVF05v1pxtkfSL9
	64LM4k0a8EuQd9ayAMMY0UBqpSENOZ2BkGG9AYBCd9nuEUJf706ShGgMKYmymL/4SVSGDW
	V+eG8E06OvItj9H66RfEbENDPLaD/wk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-eLmQ7Kb7PCOSkxSgSL4_Tw-1; Thu, 21 Aug 2025 16:07:34 -0400
X-MC-Unique: eLmQ7Kb7PCOSkxSgSL4_Tw-1
X-Mimecast-MFC-AGG-ID: eLmQ7Kb7PCOSkxSgSL4_Tw_1755806853
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9dc566cb4so996122f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806853; x=1756411653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/kmddABpvZJu5K+QD662cz6jOGE1r8xokeQdlRgepQ=;
        b=mf3vU8ob72e7skP0S4GoQus5zKAhtoq6SFP/aGLEsDNhHzan/fajsir1iHX4cYrmSI
         7EsYH3R1myZBPbe+o7LjAO1O5R5Tzh5s7prWtEhFzomLeS/xXrUHuhCFnnANhEl6xVxU
         E0j8I+rLkWiWXeJQRXBC+Ox0tj3MtNj+Vt2JOxmJt+XgBkCXlpao/3fkFop5MuP7hIF8
         itDOzzLVs7Mwtnnn3R7TL8p9RyIcUo3jHoWSwJrLTn2AHal66wZ7GMQ6zooPI9Ju5aSX
         Vxf4aCS6egwLAzYGVQsky4TgTbBfbzBnHWtUyjeG42YzNGL3Mekw7EiOPTL3Gd3QkARj
         oftw==
X-Forwarded-Encrypted: i=1; AJvYcCUsHBAA7G1pfzWMMBINsq7sxBOSRkV7wIr+CW0AHv60Ddf7fmgfdBEn3xTJZuMi0wJk9OdYYEEc2XJPmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMEV8VmtHlYXeVYUlcF/zNrkAQIXdSZDHcF1Xi4gRmcNFtykOJ
	JLiXM/KnyAvjs4s+cFETCoUGzkE4LlnjnyaBNcaWEqLTsJeAzLSE1NqnTaRnOiDANgdY1lEcurF
	1OfMhxKQiLjJGnAd9zoFa64D+sPxV8deJmanYxV5nCpsAV3aHXf2AK57sauYxSz64DiTM0A==
X-Gm-Gg: ASbGncv/Vc1fBPo5Hd6on7Vk6tjUK72HITAfXZTP8vgXPqYm7BsG/LGJ3nJE1AxjKyc
	kWgL/tLvZ9PjUpB7mTt2hKTK6/gJInkyPh2Hlk8G8Pvl5Bn2EiG12wX39zBM0IzzKVQl3c7UDol
	vge0x+vN83/OSNzKN0+pGCcy0w1ZIkxTiDEfoTLjF1XJtKusxHnH29eg7J0qDv/KFMlFPuH34V2
	0YI5UeZZCUyRkM0idQsviiIYAVXKZHIHls0HEgNH+4aDIxdTC01GM4HaFFW9kgjZUZJ5CXfL05j
	xu3HjXmnYfv93pIuO2KGZR011B6X6qhVv45j6YzZLZGOzAb/JdEtmVICUF0SpSGSZxxKBihrAcZ
	V9Krb4VqRARBnzCkq8cC8ww==
X-Received: by 2002:a05:6000:2dc7:b0:3b9:15eb:6464 with SMTP id ffacd0b85a97d-3c5daefa9e0mr244687f8f.15.1755806852599;
        Thu, 21 Aug 2025 13:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbqF8V2lF/CygktHxSJZNB7+pmyneW6nxhnLwTxWefpTwvecQ9FG1LkYH8lxi0WUYYPrMQFQ==
X-Received: by 2002:a05:6000:2dc7:b0:3b9:15eb:6464 with SMTP id ffacd0b85a97d-3c5daefa9e0mr244660f8f.15.1755806852102;
        Thu, 21 Aug 2025 13:07:32 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077789c92sm12629958f8f.52.2025.08.21.13.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:31 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
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
Subject: [PATCH RFC 09/35] mm/mm_init: make memmap_init_compound() look more like prep_compound_page()
Date: Thu, 21 Aug 2025 22:06:35 +0200
Message-ID: <20250821200701.1329277-10-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MVClG0GfDqdzP1Z3C-qE6w2CS7J1FJ42roBqNWXWHSM_1755806853
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210856_088091_9E35ED4E 
X-CRM114-Status: GOOD (  16.31  )
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

Grepping for "prep_compound_page" leaves on clueless how devdax gets its
compound pages initialized.

Let's add a comment that might help finding this open-coded
prep_compound_page() initialization more easily.

Further, let's be less smart about the ordering of initialization and just
perform the prep_compound_head() call after all tail pages were
initialized: just like prep_compound_page() does.

No need for a lengthy comment then: again, just like prep_compound_page().

Note that prep_compound_head() already does initialize stuff in page[2]
through prep_compound_head() that successive tail page initialization
will overwrite: _deferred_list, and on 32bit _entire_mapcount and
_pincount. Very likely 32bit does not apply, and likely nobody ever ends
up testing whether the _deferred_list is empty.

So it shouldn't be a fix at this point, but certainly something to clean
up.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/mm_init.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 5c21b3af216b2..708466c5b2cc9 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1091,6 +1091,10 @@ static void __ref memmap_init_compound(struct page *head,
 	unsigned long pfn, end_pfn = head_pfn + nr_pages;
 	unsigned int order = pgmap->vmemmap_shift;
 
+	/*
+	 * This is an open-coded prep_compound_page() whereby we avoid
+	 * walking pages twice by initializing them in the same go.
+	 */
 	__SetPageHead(head);
 	for (pfn = head_pfn + 1; pfn < end_pfn; pfn++) {
 		struct page *page = pfn_to_page(pfn);
@@ -1098,15 +1102,8 @@ static void __ref memmap_init_compound(struct page *head,
 		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
 		prep_compound_tail(head, pfn - head_pfn);
 		set_page_count(page, 0);
-
-		/*
-		 * The first tail page stores important compound page info.
-		 * Call prep_compound_head() after the first tail page has
-		 * been initialized, to not have the data overwritten.
-		 */
-		if (pfn == head_pfn + 1)
-			prep_compound_head(head, order);
 	}
+	prep_compound_head(head, order);
 }
 
 void __ref memmap_init_zone_device(struct zone *zone,
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
