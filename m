Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F2FCA1007
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0cJRS4bGIbLZA5ZjSDwralgz7mJUpBW0SCtfaRjTBE=; b=WA6Yza/7FHoIgu
	lqMA9FW1vfph6N+115JqnTwjwJLmWm+5RiUOKTUIqnrLKaHvTeGOEJScT3cJtFm86wnrDkA8Dn1Dg
	P8ytlxExL++6FsHEFaycrtAfms8aF6e31M52DudA1DDLuYIw/Wh7BE8vOTAQBykDrB+w3uaIjZyPx
	SjQlDiZUQieo/dRedDo3trSw7xWAHOzbrMShyRdZe6IXc7GmjUBg15WzndZoJO4CJt4He1hk/mmkp
	JzXaxQALRE3qZdwmF+kPzbFuBCeVosbYse6ebCoG/O9f12tNXEAFWg91VnOey9lpLASKT4LpA4hsx
	VQfLPMi+MW4ZS8fmfb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAXN-0000000DgKL-2cuI;
	Mon, 01 Sep 2025 19:49:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6BJ-0000000D0Kx-3AmV
	for linux-riscv@bombadil.infradead.org;
	Mon, 01 Sep 2025 15:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fIzsdHZ3fBP51ER2numDMmmgvS6jLZjlCpLLEi+lFJs=; b=IYHwh7wnlNR3UFcJtZY5vDZ81X
	AD2wiZAksfH1TDm54nSktaOrYxbdefGL5n3p5iNqVrruDoA5KJKidKwDe3x4sofMb+LaeAIHmnsBr
	AC1Nvb5hFR4cOtLhuB9hj0N+oliGD3jWNI9JWkkmnK6FZ9VuqCmfpC/ZXyzOKLmBh1OSvYMVOcvcp
	fQntGu8uXDIiBga4YI7gz/7oJNjzarUSH/ZCfJJZ2mtUcg7V2lYQ1c+4VcbUaITladipbyTO9wJqc
	WW6hIaZxKY4SjcqxuuxDDXg52BivCX3np3+IK0xsU6PJnINcoy3NtBgMgX4K4uFX6V9XjuvqC43kE
	EREEpC4w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6BB-00000009p4M-0dXw
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 15:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756739441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fIzsdHZ3fBP51ER2numDMmmgvS6jLZjlCpLLEi+lFJs=;
	b=NlvaKFNTkc034UYI235Aw3j/FpdiwIdzLrgbFd8mf09oLb0yk0RZ1lOppjiV1leEgS++u/
	GhOXwD0q/gA7yPVe3bqWAsnj/rRX71GtObSKuECrpg6IZdlH3KP7AigqUxsW1zWG7PNMiE
	nuKGDiVblc2Hr4YmyfLo/ObbqDV9bpU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756739442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fIzsdHZ3fBP51ER2numDMmmgvS6jLZjlCpLLEi+lFJs=;
	b=ca11vZ2M9+Mx+NBLW+SlAPmSH1eHEUd8njQPYy0oCKxzDPxu0cKFO4/uPJCMdlx/CuNlbV
	ll0Bb8dHT0YeCKD3Q44V/WKIoZkxrjDIJ1XwvazM3jYpOfgQ9AMbMODnoKmUwRI6sEhvf5
	jR7946Yy83AGtDAcoK4jiyloBXn8+LM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756739442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fIzsdHZ3fBP51ER2numDMmmgvS6jLZjlCpLLEi+lFJs=;
	b=ca11vZ2M9+Mx+NBLW+SlAPmSH1eHEUd8njQPYy0oCKxzDPxu0cKFO4/uPJCMdlx/CuNlbV
	ll0Bb8dHT0YeCKD3Q44V/WKIoZkxrjDIJ1XwvazM3jYpOfgQ9AMbMODnoKmUwRI6sEhvf5
	jR7946Yy83AGtDAcoK4jiyloBXn8+LM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-326-b49aMdn1OuiZpoH1EqfeVQ-1; Mon,
 01 Sep 2025 11:10:36 -0400
X-MC-Unique: b49aMdn1OuiZpoH1EqfeVQ-1
X-Mimecast-MFC-AGG-ID: b49aMdn1OuiZpoH1EqfeVQ_1756739429
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9D7819560BF;
	Mon,  1 Sep 2025 15:10:28 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.22.88.45])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F426180028F;
	Mon,  1 Sep 2025 15:10:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
Subject: [PATCH v2 23/37] dma-remap: drop nth_page() in dma_common_contiguous_remap()
Date: Mon,  1 Sep 2025 17:03:44 +0200
Message-ID: <20250901150359.867252-24-david@redhat.com>
In-Reply-To: <20250901150359.867252-1-david@redhat.com>
References: <20250901150359.867252-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_161046_144992_468AED26 
X-CRM114-Status: GOOD (  11.42  )
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

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
