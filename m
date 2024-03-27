Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE342C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqDV2D91ZFxMKf5iyspCJpuJaCTkbFx5kcql0aKzIN8=; b=yRYKEEFipEYOlX
	f/zCShNAk70lQt2VUHSNQKswhWo0J4KJBSFGrNK6n0yc59OEsODllfgt2PqHYsWxCFYPRqDEsUpSq
	qA5Ux3vmTmZbgVjxqZETn3C5nQ8303E5VnKReAHHodlzyXN3xuZ0aJMBn8sGeSabGZNys5Q8wbhah
	8Ekymeu5htzmJEYF9ki2x0Zd8VYOrrCg+pwx+0rahx+/8EfgiZLzxkPSWL/DlxRtXm0uLWJ2xvt/t
	jl1XafA2Ri8VIhgRKK0wBhT/eyq+6smGwZJSThiGQGMHtp38zk39yYffQxMokQhRL5bGHeCPeRs/0
	Lr6ObpTT+mPv7vSv9jwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVBA-00000009nIL-37he;
	Wed, 27 Mar 2024 15:27:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8F-00000009lYG-0HP4
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 15:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0ClTZB7edrSwahK3rulsC63VROBcD1QOdNuRXa61Ddg=; b=P/pgUn6Colzv/0Sc+BviHQsBqX
	e6BPlnCBA0pq8hKHb3aUqYsvz3YrS4DkNKq96eM4CKt8d0UnF1vBq1LGBiYn15YN9uFYf6lipBEgm
	Prqc7xySuRPxBSputKrO+nV2+Lw1Q8XqrTSODdr/BW6q5LEhZQO2xA03a+N9zHWuzANxsAWyn+vL2
	QdffFlZWUJvdPcIfouYwv1WhR3mejWojGpnTxG712cTWbv3BXMoQDtJDcjJrpBlF0SgYBZa4+TcRz
	f8a1mPI+a3ahwxf1uT5ZdpRLzGOLaX9wwuYWxxtZGeQn8pIwVL5YQVMX7c2kDuh/nwpsy2RRy2mxI
	q5/+omAg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8B-00000000L3l-0weD
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ClTZB7edrSwahK3rulsC63VROBcD1QOdNuRXa61Ddg=;
	b=eey1M4R5QdNvghzCyAdpKgxR3UFQrRHlhz9ErR5bJO0cPAVauYXEwkGN6HpoM+aBd2wFoC
	9wWwEbFNUz4HELmc1fbrJj3MTjTXVnOwYJobAwPCNJH7XJatZhm9aJmpUAyKkjBVnpaElq
	OCsQp2h8LA6Ph/R33xnjDmPxFILHH+o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ClTZB7edrSwahK3rulsC63VROBcD1QOdNuRXa61Ddg=;
	b=eey1M4R5QdNvghzCyAdpKgxR3UFQrRHlhz9ErR5bJO0cPAVauYXEwkGN6HpoM+aBd2wFoC
	9wWwEbFNUz4HELmc1fbrJj3MTjTXVnOwYJobAwPCNJH7XJatZhm9aJmpUAyKkjBVnpaElq
	OCsQp2h8LA6Ph/R33xnjDmPxFILHH+o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-7i7VfY5CP3er1AhAJ6X8Kg-1; Wed, 27 Mar 2024 11:23:55 -0400
X-MC-Unique: 7i7VfY5CP3er1AhAJ6X8Kg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-696a5972507so4146526d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553035; x=1712157835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ClTZB7edrSwahK3rulsC63VROBcD1QOdNuRXa61Ddg=;
        b=JeOhohwfKFiiSTlL0dUwfx98XJmKdisdukaowUK+zWGxTnuqWrXcpPRRFaWaPV3c+q
         GWR64pgf4IZv1oqnmbK3w4/KUEtByvfYtsSAJ7Dcusyx0ZypPI2cwECx1oe9+j50JhFi
         3Fk6in0t4MVWwX/HOtRq2nUoEUU6SA6lZGiDiTxxQrA6f1bWdiGGUrM9rMGE1zTWTu4C
         X2lFcIqXmGq+tvP5WZ1aSe6uH+uMA5yGOGu1M+I3RYt03p9Z3HCepTWGDoS2FftAVw/l
         KO89sz+RDFt1uwD4ys+8Jac8zwp044xHSVczYRcTdWaxYDBx1yJAnxLUmzyXlZQ08Ns0
         iaIA==
X-Forwarded-Encrypted: i=1; AJvYcCXZG2ccw+yTRufTcLqVye1D8SJjkUFQih+g4qBS7AQNocMUpMbUjYh19UMyclhaPPe/O456I/nEyFMYn11bpKi6VkVlbHWN9ezjAsLfgUWJ
X-Gm-Message-State: AOJu0YyxAv86Aj9GjJSq6xmnMovK1q1AMWNkqRVyLIM0hA05szLpxaLv
	OIoelwAXx0XF9viTIKVk6BLskG6PjkTmtvB6Jv4tNOyw1voMoRHIxINpAG9nKu8YG919IvDuTf8
	L84jtbY4yLZKn1T18Y5T5f8nW3BCFrTcldur3PkSWPKQpmwKvhapLyw//wilWNOOH7A==
X-Received: by 2002:a05:6214:3d8c:b0:696:1892:c19f with SMTP id om12-20020a0562143d8c00b006961892c19fmr15035548qvb.3.1711553035020;
        Wed, 27 Mar 2024 08:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT3GjlhPAIM0f0tWP3PNax9bFYBunh5winrPqMP8FazkZOSJ/P00xdKeX4lX2Up3S+10Z8OQ==
X-Received: by 2002:a05:6214:3d8c:b0:696:1892:c19f with SMTP id om12-20020a0562143d8c00b006961892c19fmr15035509qvb.3.1711553034516;
        Wed, 27 Mar 2024 08:23:54 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:54 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	peterx@redhat.com,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH v4 09/13] mm/gup: Cache *pudp in follow_pud_mask()
Date: Wed, 27 Mar 2024 11:23:28 -0400
Message-ID: <20240327152332.950956-10-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_152359_455896_5DF9DCB6 
X-CRM114-Status: GOOD (  12.78  )
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

Introduce "pud_t pud" in the function, so the code won't dereference *pudp
multiple time.  Not only because that looks less straightforward, but also
because if the dereference really happened, it's not clear whether there
can be race to see different *pudp values if it's being modified at the
same time.

Acked-by: James Houghton <jthoughton@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index ef46a7053e16..26b8cca24077 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -753,26 +753,27 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 				    unsigned int flags,
 				    struct follow_page_context *ctx)
 {
-	pud_t *pud;
+	pud_t *pudp, pud;
 	spinlock_t *ptl;
 	struct page *page;
 	struct mm_struct *mm = vma->vm_mm;
 
-	pud = pud_offset(p4dp, address);
-	if (pud_none(*pud))
+	pudp = pud_offset(p4dp, address);
+	pud = READ_ONCE(*pudp);
+	if (pud_none(pud))
 		return no_page_table(vma, flags, address);
-	if (pud_devmap(*pud)) {
-		ptl = pud_lock(mm, pud);
-		page = follow_devmap_pud(vma, address, pud, flags, &ctx->pgmap);
+	if (pud_devmap(pud)) {
+		ptl = pud_lock(mm, pudp);
+		page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
 		spin_unlock(ptl);
 		if (page)
 			return page;
 		return no_page_table(vma, flags, address);
 	}
-	if (unlikely(pud_bad(*pud)))
+	if (unlikely(pud_bad(pud)))
 		return no_page_table(vma, flags, address);
 
-	return follow_pmd_mask(vma, address, pud, flags, ctx);
+	return follow_pmd_mask(vma, address, pudp, flags, ctx);
 }
 
 static struct page *follow_p4d_mask(struct vm_area_struct *vma,
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
