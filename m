Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51ACCA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7E0TFLXIekHYNyKJ4+IBxjyr8d5lNpOI7i+D/JfUbo=; b=nMTao8pjPy4yu+
	hRrvxO0d23j38Cxg2Xh640NbeIvM/nvlJkJe6mvTIblzEtRAV+2z+XsVgmQYszxZ9pFV9ewKGKiyR
	zAXMhBVSpBezK3nnBy8dOwkHcHr1BvTWkTXGXDuDKL40fqAjFQOMykOPDkomSGWVzhy0GgNa617mD
	AypNkoSQffPSGlIryoU+aIs2L4x3MXZ0xrYmx2HnVoVYd7PbmrhDTRUbrSfCx6GHDSWYveijMO4cC
	5b73aZAf/tm+s8Ag2vXQwt+J/ft/x6tgoSIFq9CKx8rgdvnaslIXKDESxoYVOY2bncpfguiIIaPud
	8ryJcg1TjBQlmYLVOsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFca-000000011az-1AxI;
	Fri, 22 Aug 2025 00:27:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBZZ-00000000Nch-3s2z
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+ehuLujhp6/6Ui8/ETipqTmnVB5w2txW2o3jJCUzuY=;
	b=avYwfnmWBHx7Q5+yK1yZQ7HXl1r8jy0mqqocL2DYABQ1BUOR5locfhf3Lj9y+2jyyNS1ro
	QMNvmr3P/ofhETQSRdF2kQSLiuHnKrklM6VSvoBGCWqsqpBoUAyxQcZfTn6GzomqCK1fYG
	pzI8kB+Z0ET7kbh0JulgRT4gnwL37JE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-OG_TcLT9Mn-yWKRd6bKxDg-1; Thu, 21 Aug 2025 16:07:41 -0400
X-MC-Unique: OG_TcLT9Mn-yWKRd6bKxDg-1
X-Mimecast-MFC-AGG-ID: OG_TcLT9Mn-yWKRd6bKxDg_1755806861
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45a1b04f817so6124885e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806860; x=1756411660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+ehuLujhp6/6Ui8/ETipqTmnVB5w2txW2o3jJCUzuY=;
        b=P7hah558kkdiutVT9ZOGi4lAtvVHGASAmcur8B6KpXwzSWTp+iZa4L1CJfG0OF29Od
         EMtwbPihGPMn3ED559RUvpvw/Yrj511vmZbLTbbxCYWz+SkV8gRCDA6jgDT10aQmUNqb
         xTPYP1HVFGCx1lBEnfXFOneY1Nzsf8M2R9AdlWfdYhRfRELjJCd2RdCfhD2P2/8iAjqI
         24qNxt4sw/UV7/Ld082I66rMpLZ1vSntHG/cooSPX0l33QnWEEHbHpJJFeP3vARHYKrW
         ND2jIbjFW8mqNX4NU/12dyLdIv35V0caSTrcyIIA3BFuVw/HsVkfXNddWjJfmEZ/b+Pn
         OO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFM9KYNc7Y+7Iq6iExklrRf1tBZFi2jEBVEAZ49yijlAXpJ4Gv5nqTWXb4RU5qCXJZcMYo5px030LEmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWCR+dBE6CmzwxlM0b83Bqk8YjEoNKOaiciBXZG7BoNxxoCKec
	KQx0pUtjCaOv6fKpBR7FkkMUQ9mzZBtK9cbx9hoNYI0Aqevqn+iS2i+CsM8wU0ssGRHVoQ6Ro53
	PyOZwaSQSVudWvtxegXmp5yrILOdJ1wl6e/5wxI9NSevyO9RmKBI26hEVVUJWPeXU2KnZJQ==
X-Gm-Gg: ASbGnctq508ozWvT81yIJ6oKaUYP3jNz8wOnrnWOZrPgcCzSVv4tNRbKo6hUd1aa+HU
	1f/S95TvmOSse/RCJ48z0DyBWreQ0GpRMavY1sXc0SA1dkD4eRXW1cPS5T3nAoLOigMtECclEJy
	LZ2gkYw4My6OsEh01fZpaz/1C25t2D+9mVw6VEv4P6TWqye2lDcqQuQHvzsOjRzDwswBBy9/LoW
	G5a7XMONZW5LMoUxkAOerdAwfWA22WqdVRaxeSpvAZ7Bi6jGRKtooMGcx+I+cYpy/AXpduw4Ag4
	Wvaffs8OpNoIaFPEqiWYd7k/zz5+i8n7CapXUcECoX7Q8+sCxU4FOGxl6Iagf/dPZL4ff7mJXej
	Y7BpnaIx4mLDvrQP83cA2og==
X-Received: by 2002:a05:600c:19cd:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45b517c2fc0mr3572965e9.17.1755806860551;
        Thu, 21 Aug 2025 13:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrtwXyk8M0MMGhBsDq6sn2/zjKB5pcui5JGSP2GUX5VAX4EhNVsrp5ZVJRMStvpa9W7AdEeg==
X-Received: by 2002:a05:600c:19cd:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45b517c2fc0mr3572545e9.17.1755806860106;
        Thu, 21 Aug 2025 13:07:40 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50e3a52bsm8600375e9.21.2025.08.21.13.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:39 -0700 (PDT)
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
Subject: [PATCH RFC 12/35] mm: limit folio/compound page sizes in problematic kernel configs
Date: Thu, 21 Aug 2025 22:06:38 +0200
Message-ID: <20250821200701.1329277-13-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 01da_Aag5ZiePfceG04MaiaHB4rxVd_aDrg9obC-1IM_1755806861
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130746_030928_A815D95E 
X-CRM114-Status: GOOD (  14.13  )
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

Let's limit the maximum folio size in problematic kernel config where
the memmap is allocated per memory section (SPARSEMEM without
SPARSEMEM_VMEMMAP) to a single memory section.

Currently, only a single architectures supports ARCH_HAS_GIGANTIC_PAGE
but not SPARSEMEM_VMEMMAP: sh.

Fortunately, the biggest hugetlb size sh supports is 64 MiB
(HUGETLB_PAGE_SIZE_64MB) and the section size is at least 64 MiB
(SECTION_SIZE_BITS == 26), so their use case is not degraded.

As folios and memory sections are naturally aligned to their order-2 size
in memory, consequently a single folio can no longer span multiple memory
sections on these problematic kernel configs.

nth_page() is no longer required when operating within a single compound
page / folio.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 77737cbf2216a..48a985e17ef4e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2053,11 +2053,25 @@ static inline long folio_nr_pages(const struct folio *folio)
 	return folio_large_nr_pages(folio);
 }
 
-/* Only hugetlbfs can allocate folios larger than MAX_ORDER */
-#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
-#define MAX_FOLIO_ORDER		PUD_ORDER
-#else
+#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
+/*
+ * We don't expect any folios that exceed buddy sizes (and consequently
+ * memory sections).
+ */
 #define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
+#elif defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
+/*
+ * Only pages within a single memory section are guaranteed to be
+ * contiguous. By limiting folios to a single memory section, all folio
+ * pages are guaranteed to be contiguous.
+ */
+#define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
+#else
+/*
+ * There is no real limit on the folio size. We limit them to the maximum we
+ * currently expect.
+ */
+#define MAX_FOLIO_ORDER		PUD_ORDER
 #endif
 
 #define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
