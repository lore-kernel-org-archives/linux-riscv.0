Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC4AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoU13PGoZpDRXkHUBotxWowri83FVemOj7s01kOpx9k=; b=m62R/rW7PyzkZW
	fyMnmhxr98JYVOrvxYF86h47AB9kPbUJuYn/PY30ntp4VBEFk10sKd9AYlt8kqlth3VkpRxd68x5w
	NX1nhndeb8jxKF0vk+99k0KxPr4tdbGkqCxth+2ErwYay+IABABGwhE+Fjf2SANnpPmOqeYZIGqlq
	j1vqoiRlECjz0ZRvPycMCbRhdkk4wslGU++XSInc8Y2dIziA4fcWmy35Kh7nCwlwZRQWFtJUp9tI6
	gRiFW4Rm3tMzrV2ISZ+LYz8AOvb3hdNPtPF8Nk46RWWoh3jqVKvNztmIInEvehMpbKDZr9lRg71Oj
	zCR3J3bF8UzzUBKaUnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQcJ-00000004rv8-1H19;
	Thu, 21 Mar 2024 22:10:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaR-00000004qas-1dBG
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Mar 2024 22:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ha5DGM0IN3r6kIFCrMZt60pb/ho2ZGKh4AhFb2qqPrM=; b=g1MUvdV3W8YxFTpOQXPvVxbOFz
	3LX97qUU8vfzXKD6pFDFDB3UTCUPw+dj8rG73zKVOgXZxs2bmO2Z7cCu56D5i75wadNGx7Kn++jYp
	e3EY4967XMhyoqqy6RSkrnupGkoy9LHvhLWqc1raue10UnGX9Xy22wiexjrzbczABvS8QEl37C7p0
	x+jMIj3i+xhsZrY4hU2z9WOz1P0aCVUVjZJZNOL1BYSuY0EdlwPwJzr2protw62QG/UI1aWLIBCtY
	uvuA6aQGB1HJbvL5s7a1xO3edd/m02HIWL00yK8dNY/GXZxGqsNkiwDHYr/fDSs4LcYeLWnN89tdE
	ThKGcnfw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaL-0000000ESZu-3l4A
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ha5DGM0IN3r6kIFCrMZt60pb/ho2ZGKh4AhFb2qqPrM=;
	b=ckOUdmzDPoMlV6BrrHRXMzbwIZQpg350yNfe4fPr6sUofOytxXlRCgta8KmyAO6kIPWEyY
	emsuB/M7x3Iu412R86bpBHI5PR9HbMlk0gUAo1zn7+9mXIVyPy0YoP4H8rcu4VYriu7Dib
	2FLUXXUkr2FE7ZJNqz74q1YW4u28wl8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ha5DGM0IN3r6kIFCrMZt60pb/ho2ZGKh4AhFb2qqPrM=;
	b=ckOUdmzDPoMlV6BrrHRXMzbwIZQpg350yNfe4fPr6sUofOytxXlRCgta8KmyAO6kIPWEyY
	emsuB/M7x3Iu412R86bpBHI5PR9HbMlk0gUAo1zn7+9mXIVyPy0YoP4H8rcu4VYriu7Dib
	2FLUXXUkr2FE7ZJNqz74q1YW4u28wl8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-xWdZ55pTMqGCZJ_o9LCD6w-1; Thu, 21 Mar 2024 18:08:21 -0400
X-MC-Unique: xWdZ55pTMqGCZJ_o9LCD6w-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-690d3f5af86so3056926d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058901; x=1711663701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ha5DGM0IN3r6kIFCrMZt60pb/ho2ZGKh4AhFb2qqPrM=;
        b=mQSN1Qk7lMwe6QmUZHqVjqC4rEBNKzvsYJzubtk01D6TFrpgI8VgDo4T+JuIJfmVX+
         gtjL1C94C/Js2wTcDFd06Q5w9mqLpmkX0R47sq32wWXmj3p8Pdxc8by7QHzivI9B7khi
         vLF0m1CQvjL0vlly+6+ilkcHKXiosLztKzl6/elYhGStRyUE/x1VSZM5JtX/HMyZX4nb
         ZCckOtx3y1x8M1LodGL0DjcZ4mW4O7m/rjzgO4E4kg+yocHKPOhDBYkXTeVduxdoHXQ7
         So9AqpdqhOw05jon8a5G9Jk9o4hW5rrQrlVlgLlBRqgMNhAuohY/j/sH45py0VH5scoG
         JNUg==
X-Forwarded-Encrypted: i=1; AJvYcCWvn0ES/Zd3sDWhVS5Ca4DbSvFg6MbuFp4eQzWGyVn212IbgT4242iRSzCL1dPnkD49UHpCWMI8gpwKzk5y/K+/fL8gmU4BqUZkjzynj/c2
X-Gm-Message-State: AOJu0YwwuNAIdA3eHaV+fWoFwziCso8MtiQcjPZmbLVy+lUZxmcTQmQE
	2jCRCEOvQYUNa5K4MtHPbcPVWW1pOaL194+5pBjjKNCwCv6DfKgVi6UbLupu1wS9hPEBuDeCMb1
	go70tuI0YqapTieN8DQFPWFDDPDp4N7zc3gfhB09far0qgH6rHc9tg2U/gs/cUfGWig==
X-Received: by 2002:a05:6214:3f89:b0:690:de72:316f with SMTP id ow9-20020a0562143f8900b00690de72316fmr214818qvb.1.1711058900918;
        Thu, 21 Mar 2024 15:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9Op81dSYI2sDIbFIL6Ox+mlvTFr9echbLfQb+zyBeeZ6FRPjC6M2m9xSIjZkrEy5V/lebFg==
X-Received: by 2002:a05:6214:3f89:b0:690:de72:316f with SMTP id ow9-20020a0562143f8900b00690de72316fmr214791qvb.1.1711058900463;
        Thu, 21 Mar 2024 15:08:20 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:20 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	peterx@redhat.com,
	Yang Shi <shy828301@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andrew Jones <andrew.jones@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Christoph Hellwig <hch@infradead.org>,
	linux-riscv@lists.infradead.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH v3 08/12] mm/gup: Cache *pudp in follow_pud_mask()
Date: Thu, 21 Mar 2024 18:07:58 -0400
Message-ID: <20240321220802.679544-9-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_220830_573486_B5681F9F 
X-CRM114-Status: GOOD (  12.73  )
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
index 943671736080..a338944e4425 100644
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
