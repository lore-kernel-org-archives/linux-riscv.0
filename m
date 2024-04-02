Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E50BCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+qDaAuuakf28f1/Hvxp8xQpmwZ++fA4jdDblrE+6OE=; b=vcpcCbT4xf6X5H
	Tz85bVVJBkWh9thQR18HSVegle8CWgE+qubsSL9UdtG1hZHt1YNtmbFaOnG5PfYs22Eo9DAU0bK/0
	ReXWf2qD2pTbzmZDXVJUNC95w7WaGr2BvWz8Qd52nwa5H2KCAxsgjD1Aj8Zy2qjHH9zYvtBuV5ebU
	6ZVjuNKDWU1WJLsIfbSP68p1Y8groa137cCqYJI7WwhmJ42tn+l0V9E8lQlC2sAy7d45D0lNdjr+l
	WJe9h7xTFvIus+3gA9rFsZQZC2YYkfTqSqh20i/sXZynrxAixsX1r+9aA4o58muIrI05Y9c9N0A7/
	OcLpZ5ZIrECPYp+806/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdgb-0000000BBt2-2WjA;
	Tue, 02 Apr 2024 12:56:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdgM-0000000BBgR-2DPx
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 Apr 2024 12:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=z7LWvvJr0ZLeVlbglQU3vOlFLqLTXjJjluvDd3mIpGc=; b=Yv5VSf24mXl9/Hdg3HlakBUiF4
	IQrhjLCxTvgC0wxX6XVxwL0XPU6e7Lms8/Yl/OMBECIuAFaR1gZp4xPAFj8wS+9ngrMB1TmXCD2xz
	eaDh9/BsvnRek6jNUORD0o/GVd5HumVRGRXJAsyof1d6ldodVYnaZC+JkCFgU3z7PdeEzl8k654QZ
	UEtDaslwoPvs0xAXDdefL/TNXolPOI5gYKdb/ZfW2LwBJv6ZienlA42csv1w1QGuhEFC5pUD9h/MR
	U/aXIj4sBsUVxaiGWR2R3L+LDC72Ixy9lu0dhKNGkNQP7LkjRZLY1+2YG8OXC5u1UR28rIFV0WQJ7
	2renD7+w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdgH-00000003d6T-1F6c
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 12:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712062559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7LWvvJr0ZLeVlbglQU3vOlFLqLTXjJjluvDd3mIpGc=;
	b=Qy8DJMsv1oj/169Nn7Z0Q1biW+RKbHp8OcovWMUYc2Of4XhhMDxMfQDpiZt5o6l55lXaiH
	cXdcFwb8SBx/J1t82dB34TPzLMVknEzKDbSwR+qkbqjYRj6Iu2ytGUSY/PHUheY7knBUYk
	RmoEefisEgI9PRLXc/AKdHKA8KkEz3A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712062560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7LWvvJr0ZLeVlbglQU3vOlFLqLTXjJjluvDd3mIpGc=;
	b=fj0kHomCx+QBfVD12G/6ClWpGqWAlqODDDI775NUdm0sWGuf2Qfz69bqU/X36fWnHzWyCD
	zKS8BZp9FztncWR6srfIteOZTGJxivcANcX9pSYTsO7tL0XMFbxSbZcaev4H3uVBGLvDFS
	x7y/aV3282qDG2ZhKF4Nu+2lKMLMuvw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410-rp9IQ797NSqx0sgO2R02KQ-1; Tue,
 02 Apr 2024 08:55:55 -0400
X-MC-Unique: rp9IQ797NSqx0sgO2R02KQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FBAA2823F33;
	Tue,  2 Apr 2024 12:55:54 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.247])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02C913C22;
	Tue,  2 Apr 2024 12:55:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v1 3/3] mm: use "GUP-fast" instead "fast GUP" in remaining comments
Date: Tue,  2 Apr 2024 14:55:16 +0200
Message-ID: <20240402125516.223131-4-david@redhat.com>
In-Reply-To: <20240402125516.223131-1-david@redhat.com>
References: <20240402125516.223131-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_135601_935851_412B4F52 
X-CRM114-Status: GOOD (  13.21  )
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

Let's fixup the remaining comments to consistently call that thing
"GUP-fast". With this change, we consistently call it "GUP-fast".

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/filemap.c    | 2 +-
 mm/khugepaged.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 387b394754fa..c668e11cd6ef 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1810,7 +1810,7 @@ EXPORT_SYMBOL(page_cache_prev_miss);
  * C. Return the page to the page allocator
  *
  * This means that any page may have its reference count temporarily
- * increased by a speculative page cache (or fast GUP) lookup as it can
+ * increased by a speculative page cache (or GUP-fast) lookup as it can
  * be allocated by another user before the RCU grace period expires.
  * Because the refcount temporarily acquired here may end up being the
  * last refcount on the page, any page allocation must be freeable by
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 38830174608f..6972fa05132e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1169,7 +1169,7 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 	 * huge and small TLB entries for the same virtual address to
 	 * avoid the risk of CPU bugs in that area.
 	 *
-	 * Parallel fast GUP is fine since fast GUP will back off when
+	 * Parallel GUP-fast is fine since GUP-fast will back off when
 	 * it detects PMD is changed.
 	 */
 	_pmd = pmdp_collapse_flush(vma, address, pmd);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
