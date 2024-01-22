Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C3DC47DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 19:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ih8ndHamCxV6BpZhCC4xx3B7t7wiMr12CX/2EIsJszk=; b=LR9Ul95/vvMFBt
	o1NwX8G/w1eFsoxvTYKzDeH9lGxoQgbWAFcALDKFvQTr9hlzUrNHEHYLywXCZcOmF9rX7yOYSur11
	gckKGScopeFqjN2N7s8Auubk7e/MT/PZKVDjaoWbhgb1igWvF7j/RmeJ4aE1fD6+Wcej+lp7Pw/kh
	AshQhgqXr8+iK2UP0ddWsghDSjv6s3TLT1RLx1sym1tmQMGk1UxTU727qcRNKUu6DgTbQgPeDLpnr
	T9ExHwJHQq6NKKHpXhLitmyjx+XuXCk2jk5G0bPSC958aH+dvdt6zMDO52CoZIQNcOnD0emqB/7Qq
	HYlkfm9IlnoNO0qJtiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0Cr-00DlzC-32;
	Mon, 22 Jan 2024 19:43:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS0CR-00DlYf-0j
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 19:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705952593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OpHohfrBZPpQ+Ag8soc6zzIQIq/5TLvJxKBi0yYAutY=;
	b=iB5TJCMruJyOUVEIUpxlfDQIgb9LypypkStctisTPuRNxG2RQOMmRPaBNdUtCeASJZyPen
	W40mRoQTTW8N5hgREGsWlDVWWpL3z0ICYbFMWsx8Hmw3/FCM4cHXgwqVbgds2lfvhN5dif
	GZtg4pfY7o53gHkbXLRAb6svCv7xRs0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-dgbcNuPJMAq9R1a_XNgOmg-1; Mon, 22 Jan 2024 14:43:10 -0500
X-MC-Unique: dgbcNuPJMAq9R1a_XNgOmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB3D888D145;
	Mon, 22 Jan 2024 19:43:08 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.195.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 851B33C2E;
	Mon, 22 Jan 2024 19:42:58 +0000 (UTC)
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
Subject: [PATCH v1 10/11] mm/memory: ignore dirty/accessed/soft-dirty bits in folio_pte_batch()
Date: Mon, 22 Jan 2024 20:41:59 +0100
Message-ID: <20240122194200.381241-11-david@redhat.com>
In-Reply-To: <20240122194200.381241-1-david@redhat.com>
References: <20240122194200.381241-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_114315_389553_6A87A878 
X-CRM114-Status: GOOD (  11.95  )
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

Let's ignore these bits: they are irrelevant for fork, and will likely
be irrelevant for upcoming users such as page unmapping.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index f563aec85b2a8..341b2be845b6e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -953,24 +953,30 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
 	set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
 }
 
+static inline pte_t __pte_batch_clear_ignored(pte_t pte)
+{
+	return pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte)));
+}
+
 /*
  * Detect a PTE batch: consecutive (present) PTEs that map consecutive
  * pages of the same folio.
  *
  * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
+ * the accessed bit, dirty bit and soft-dirty bit.
  */
 static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
 		pte_t *start_ptep, pte_t pte, int max_nr)
 {
 	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
 	const pte_t *end_ptep = start_ptep + max_nr;
-	pte_t expected_pte = pte_next_pfn(pte);
+	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
 	pte_t *ptep = start_ptep + 1;
 
 	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
 
 	while (ptep != end_ptep) {
-		pte = ptep_get(ptep);
+		pte = __pte_batch_clear_ignored(ptep_get(ptep));
 
 		if (!pte_same(pte, expected_pte))
 			break;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
