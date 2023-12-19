Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F66DC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yGhNHbQ4mlpeyFuPnfzNLONec+ZH2qcx+4v40Jrj148=; b=ugRWRM9KO6imXu
	32zQnyTRx8U4SleyqVszeXhbiAUtdS16cisa1CyKp0PHC2KJNpWUSkppZF0mxSnrj3lvCp0gjIOo/
	6hZsSd7o5qQRk5bxsYFmC3v4KI09xRubPVB+TySJFZ6Y+YY8FVuiUxlBgavEIaAM3UX8UQaG9RU4h
	qvq8xA4AucDi+VAjJlrRPko317fg5k6z9dDByGoqNPVPvD/GpjRJKiTlR2T7R3XESZdqJPPlR78B1
	cwQmuiHgS9mphtFdKqbVT19hJ127G97cMbpTHJre+ZagZlwnOweqwEAPOr70l3Yk/DG0oCq91uSue
	kpnpamgr+C+xELdp4sEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFUy0-00DB5g-1r;
	Tue, 19 Dec 2023 07:56:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFUxv-00DB0R-16
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 07:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdhTUt+FrTuSBSRKmaD9aOddOtS2xHAJn3bdMelwyoI=;
	b=W983tIn/dNXHko0SpoDfYEqWisDM0YES4tID6DXXKBe/imTFl64dYBWBde1wP6sn1vXKmp
	KdnLWo8PQ6OmWSNTEuolGM6rkiFLMORC9KcPeqaDBQW+crnn4RKdLWdjliz+vMQpQ46rdI
	HkQuxh+E5swZ2F3KRCNYB3hSVclxFWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-zvB374S3NdqDENm7NImiSg-1; Tue, 19 Dec 2023 02:56:29 -0500
X-MC-Unique: zvB374S3NdqDENm7NImiSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 298F1185A782;
	Tue, 19 Dec 2023 07:56:28 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B65A2026D6F;
	Tue, 19 Dec 2023 07:56:17 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	linuxppc-dev@lists.ozlabs.org,
	Rik van Riel <riel@surriel.com>,
	linux-riscv@lists.infradead.org,
	Yang Shi <shy828301@gmail.com>,
	James Houghton <jthoughton@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	peterx@redhat.com,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH 03/13] mm: Provide generic pmd_thp_or_huge()
Date: Tue, 19 Dec 2023 15:55:28 +0800
Message-ID: <20231219075538.414708-4-peterx@redhat.com>
In-Reply-To: <20231219075538.414708-1-peterx@redhat.com>
References: <20231219075538.414708-1-peterx@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_235635_493183_E7D3E327 
X-CRM114-Status: GOOD (  14.24  )
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

From: Peter Xu <peterx@redhat.com>

ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
can be a helpful helper if we want to merge more THP and hugetlb code
paths.  Make it a generic default implementation, only exist when
CONFIG_MMU.  Arch can overwrite it by defining its own version.

For example, ARM's pgtable-2level.h defines it to always return false.

Keep the macro declared with all config, it should be optimized to a false
anyway if !THP && !HUGETLB.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/pgtable.h | 4 ++++
 mm/gup.c                | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index af7639c3b0a3..6f2fa1977b8a 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1355,6 +1355,10 @@ static inline int pmd_write(pmd_t pmd)
 #endif /* pmd_write */
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#ifndef pmd_thp_or_huge
+#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
+#endif
+
 #ifndef pud_write
 static inline int pud_write(pud_t pud)
 {
diff --git a/mm/gup.c b/mm/gup.c
index 0a5f0e91bfec..efc9847e58fb 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3004,8 +3004,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
 		if (!pmd_present(pmd))
 			return 0;
 
-		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
-			     pmd_devmap(pmd))) {
+		if (unlikely(pmd_thp_or_huge(pmd) || pmd_devmap(pmd))) {
 			/* See gup_pte_range() */
 			if (pmd_protnone(pmd))
 				return 0;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
