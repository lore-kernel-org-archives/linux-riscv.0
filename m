Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DDEC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwTMRW8kBaP9dt89IDR83L+Snj/+xiOLAX7New+UulM=; b=PnwXrIq+MeA2Ln
	7pni5lIbUtNBo7l8JF/Tk00bP7msamAU+fl9YoZk0/tKDlqZCIj93KWucoa50bcLGVP2SRW6ZfWPP
	j8gw2H0sXoLH2+1rp4sC5hj4JoOcfe+TbZOpNW5grFGeox63e8acXTA3qvbECnb3VOKm2qDpfChp8
	GMwzYz8hAXtVVFRkVlm7G60wG9Cvnit55MBvI00awQ1nuYlFvHdruUMu2w0phy89IcbPmcr31Ub7h
	PDbtCb5D6Yngf/HPwIeHgyAWMBVovhUOlc8edfQ3ikdqdOActzSEh8t6k7/cBTkxUbbiYXuLPl8a0
	JO9kpdnrlF6KlWfqGPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR4m-0000000Cgh2-0Pro;
	Mon, 29 Jan 2024 12:49:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR3k-0000000CfmV-0RG3
	for linux-riscv@bombadil.infradead.org;
	Mon, 29 Jan 2024 12:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cS+fj/Ib0GI5otmzNrt4qLpnZeCkiOZS5Y+GTIa0gvY=; b=dCa/QP4R9fnUutBsbo8wABJ0Gr
	FuqnKiL6WwWGHq56MLNyI4HGkzfiTjtkKVnFZlCGio2HfgTI9MEOq1CXLwpbOnb355ETuIl30Me23
	bOQg+eKpfG2bIxiIZHwgGCZ8J//wJT0hvI2aTVZh6596ZiyVynKtyKyDCs9YtFDXorftVYRvrGx6O
	8KnQE2C4KKTN1DjlxKFqX+60M1RGEEdnwjQtXpjYVO5dPxhe2YWWKcoNUSRxoFwobNVq3/L+PXSmR
	ziouG4a01PIjE2LMCKPDNkbTD5fXrwGg7PbHb5p/BkFAU5KgkmeZUrsQoW8vwaB0LnQT0zvdLl3WV
	0O1YRxQA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR3f-00000007lhi-3bn2
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 12:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cS+fj/Ib0GI5otmzNrt4qLpnZeCkiOZS5Y+GTIa0gvY=;
	b=Yy/T3Ad/2zxHbbUUtH7+hN0jGQYlCcis1VT8OXt6GWmdJhSa+A8owWmNIQzKhRjLnK9bXb
	Xrl4pO47F4Qi9IKF2RkKWVLO9Uhf5F49CyxVHfQz82E6570z8ilaTpH8TM7VWh/Gh/WvBn
	rVDMNxNP2n0g18pMiUZP/t069qyrM08=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706532494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cS+fj/Ib0GI5otmzNrt4qLpnZeCkiOZS5Y+GTIa0gvY=;
	b=apaxodvu5Ho0lNvtdBYOSlY+///nImabbZg/KUjDpZzYNNy6HQZmIXeyUgTBFbKddQy3Er
	FV5Bsfw92j0Brddd0eo9WZf6QF8wwHk9PKIya6+GiZR5y6TdPWIcxXtdicOfSPAydzGtBI
	0FvUvmVHlfbJSnu0pB/Iz2ItPEEP+l8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-uopDDWlrNyiX6spNRSMRFQ-1; Mon, 29 Jan 2024 07:48:10 -0500
X-MC-Unique: uopDDWlrNyiX6spNRSMRFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8CA6867943;
	Mon, 29 Jan 2024 12:48:08 +0000 (UTC)
Received: from t14s.fritz.box (unknown [10.39.194.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99F798B;
	Mon, 29 Jan 2024 12:48:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v3 12/15] mm/memory: pass PTE to copy_present_pte()
Date: Mon, 29 Jan 2024 13:46:46 +0100
Message-ID: <20240129124649.189745-13-david@redhat.com>
In-Reply-To: <20240129124649.189745-1-david@redhat.com>
References: <20240129124649.189745-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_124816_553486_B1FEABC8 
X-CRM114-Status: GOOD (  12.03  )
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

We already read it, let's just forward it.

This patch is based on work by Ryan Roberts.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index a3bdb25f4c8d..41b24da5be38 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -959,10 +959,9 @@ static inline void __copy_present_pte(struct vm_area_struct *dst_vma,
  */
 static inline int
 copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
-		 pte_t *dst_pte, pte_t *src_pte, unsigned long addr, int *rss,
-		 struct folio **prealloc)
+		 pte_t *dst_pte, pte_t *src_pte, pte_t pte, unsigned long addr,
+		 int *rss, struct folio **prealloc)
 {
-	pte_t pte = ptep_get(src_pte);
 	struct page *page;
 	struct folio *folio;
 
@@ -1103,7 +1102,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		}
 		/* copy_present_pte() will clear `*prealloc' if consumed */
 		ret = copy_present_pte(dst_vma, src_vma, dst_pte, src_pte,
-				       addr, rss, &prealloc);
+				       ptent, addr, rss, &prealloc);
 		/*
 		 * If we need a pre-allocated page for this pte, drop the
 		 * locks, allocate, and try again.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
