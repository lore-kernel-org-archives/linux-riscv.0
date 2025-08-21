Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB133CA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0VpZa3wyz806HjrDXxWUg4wqKW4gmgEyCsYsVYfaFU=; b=gb3jmL13ZxVE3K
	ZD0n/+igdbIT7DimtubI2wWMb76iwF//48Jpzfs/ffjNXxmguZ5MjYMpkqLrDNo5cNu/myipXA1+c
	qJKq838gO8s2Rdxfx6n6bI1qw8EGYmF5LfEvFG3q+txLNuJGJaQy/EvzfM/Lna637XPi/Ajez2Cml
	st5zIZggMx12kGOi4xVfT0zOJ3OD6V27jXMr5Rk8sqAaTapRGOHPCi0Pi2Zu0PLF0i5nzR9V6WB59
	TiT/W7O4wxHYNhBKX6fklAoCG+Ds0c+eZkd4endacTCntipFmIn8QXNlAtv/5gCtrOjf+5SWtDgYp
	cMIl748l3RtCdKEnEQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFs6-000000013tD-3SF5;
	Fri, 22 Aug 2025 00:43:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa5-00000000NvT-3Qbw
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=; b=MchWWv+zJfBR6BH2/v+pt6kip3
	2YdWVIM9WkWGpSBb3/53zyx8mjL/lWWTDP1ddxM3Ew2DfXCLKDVH0UBY4kVCJvQYo+QYLqA/KjZfC
	yuOa+x6NimpE1sL5IRdLXt6aQ6K5T7ioJlwhdUYD3Yb4IsH5MOKbScWmS/3WnNcV2jbt2OZPvz2Mi
	RKn1PIwCAn0yaxgxPNYuF03LE2h2Tfkg1X3WuNTGlw3njS5CNoLlfC/FJolpC/oYypzySKgOJgW/h
	mSYOgI/o9AOCnOUUU6AfNAfdw+u9kPW0/bX8XAK3Od04WZOYCdt8lsKPWXBjw+TVFTpA9F7igBdGw
	cIlddI/Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa2-00000000eyd-0pSx
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
	b=LAuI4ObQ8SK/1nK29SQ4IEJeO17n4p53HUvNerNItBLRh4TlQsyAA9PyGpyeoH4NcTxHAC
	K9wlfm/6fKZWSTr5BDOHiWmzKPrxGtCJGsVIzgrSK99KJpkRgbq1zSw17F/AJhaUnXB3gq
	wsmylcATFHCNgNF9PJ5A09LoNOxU+2g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
	b=NBJmhThnt6QbKPOfznR1lvSLbOABO9jQHu5pR/CiWkhRPjNrz/CfBRjALP8g7oooiOhYK8
	og9L4oRrCMh59Mh67ndkn6Kt2oc61vVKZToL51BCIrP4zkrOly24SPJS43itQJEvJBc06L
	XmGGH5nOZn7fTX2lW6la78mA9iWXpFo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-PK2xyYzdOD6eO-7vmEQg5Q-1; Thu, 21 Aug 2025 16:08:10 -0400
X-MC-Unique: PK2xyYzdOD6eO-7vmEQg5Q-1
X-Mimecast-MFC-AGG-ID: PK2xyYzdOD6eO-7vmEQg5Q_1755806889
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9d41b88ffso838248f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806889; x=1756411689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
        b=uvmKPzFXf9YloAgYigXrE3kpX0NNWfkq/QNUpi6b/cNy6eur7jTn6tiRr+jXHAN4+2
         uPpraHJXdxRptZ6VfmnBs/NYwEx6u8wxBIXbYcWRShSy3CIP548xm7OM2O8UfdsLg+sA
         g1vRKavocvurweQ3RIDWK1B/2AVd1DL32hdIBZAkGCpL1hbiTDaD2Z6XLm9cagP7v+RS
         +Tow5hhj6dALlPOe8B7syb37jQdQokFj6OJC38jye3GFKSLzdK03AzTKEERjA8O57JAC
         9Fgt0PWZBrXy5q0Z2dalsGuDEX6vz9e+hnWkQVd5IcClo1fPCyxaPxdQMWyj/tlzhRB5
         6K6A==
X-Forwarded-Encrypted: i=1; AJvYcCUIzFMcJIkNKiV9xl4s6/jzIFMXr+vSSSPm+Xz9dUjhJTHZxIZJd+maQYhknsLcbECT2jmXsVWrSVH/nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgkGzygHNnus3iIIzgatiUxC+MI/H8a1uxNmGJ8e+ClZFQFXcv
	RbrTR/TDssjnXe0RXivF4sMfC1R0g0XUszFZBdFN6Zpvad6Zqgq4aeWRT8IB8xhBzDpx5rzCmo7
	hIA2u/w8A+An1UyxwzXnoFv2SJygNNfaj4oECPJAUY52A1YAur1IIehtSVAn/CVi4ZG3lfQ==
X-Gm-Gg: ASbGncsF9fadRO17SD8exg8ieoOqHenaWGNqqzvsc9HW0OqTJg6W+xwQowtNqzforXQ
	JUA8sSPnrj49poo2TY+ov2AqnJIszOXzxP9zWl6gC62xDTB9E7Q+c/K21JCmRADxFmDl3a5QA+1
	xv2NvirxxtO/rOrG/OeXeh5NuV5qeAYlRQNXgmYJ2uUthR5oU5L3uePFxgRJmq3RvkeJKVhk8fr
	w//DS27VFkbWvhAC6qbwXfzpwLvOdRTQpP5iN7PrXIaKuHgmMu+VIySBwQV78FZQbNik6teu3gu
	WEw+EhansrUhgcnrD+Q+I25EdeTwLo6xFmAAsGA8ojWUKWWINboJ+/WIyXVJ4EdbRkgI4CFNsEZ
	jmHlGpFHwSgAdRM+rhq45hQ==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id ffacd0b85a97d-3c5da83bf5bmr151960f8f.9.1755806888899;
        Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeHEkncn914iQLB6IDJFbFllUgyuseH1VcCPvg+Bdgchh7CcvmYDhAXktPsYS0hqHcr6hQuQ==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id ffacd0b85a97d-3c5da83bf5bmr151916f8f.9.1755806888456;
        Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4e2790a8sm21120815e9.1.2025.08.21.13.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
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
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 22/35] dma-remap: drop nth_page() in dma_common_contiguous_remap()
Date: Thu, 21 Aug 2025 22:06:48 +0200
Message-ID: <20250821200701.1329277-23-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oM8i5BiiJWuETSW2_DXNTGBK-2aEprRnu2943FMXQ4A_1755806889
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210814_644320_3C16BB41 
X-CRM114-Status: GOOD (  12.54  )
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

dma_common_contiguous_remap() is used to remap an "allocated contiguous
region". Within a single allocation, there is no need to use nth_page()
anymore.

Neither the buddy, nor hugetlb, nor CMA will hand out problematic page
ranges.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/dma/remap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 9e2afad1c6152..b7c1c0c92d0c8 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -49,7 +49,7 @@ void *dma_common_contiguous_remap(struct page *page, size_t size,
 	if (!pages)
 		return NULL;
 	for (i = 0; i < count; i++)
-		pages[i] = nth_page(page, i);
+		pages[i] = page++;
 	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
 	kvfree(pages);
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
