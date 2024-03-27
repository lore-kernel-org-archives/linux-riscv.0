Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B2ECD1280
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROzow6XucFkLMSr0dX/P9txY60787ucuVBPup2hF7uw=; b=sFvyigR2X7WWTN
	EUmcU5zQgt5XR17fDnbc+FA3ETc4x2AVsQMXR7Ul2icHOwLyy76+WkoRkZlo+ZDezvYxjOXc/Vwhq
	QK/K4lLcgGAoAGdRL1IbmERfNGWToMFsuJeKyicpkY9gmdBMQBPc4Ybs8K579ZE46Kkx5AGCFlnFg
	6IMdyqypN9c/0tnXTtcs8Ds8kEc+9lvYkHbCvIv1JS3nQT6AD5AE6tnHQtzKVla0B7GXATHQY1B9Y
	/NviABt1w9GKjoiDnnFiG0gzGniutBtFnluiGadUTGrfSYWarBuGn1uuqkiN8ItSKmO8bZH6iE/rJ
	eSaoQKXBuAt9qpspuPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8S-00000009lhR-2iMl;
	Wed, 27 Mar 2024 15:24:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV84-00000009lMa-1ram
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 15:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iN7hVKxpU9yGNoa0FvV6QQfaV15Sbc5QZKf/pqr08oc=; b=rDQo7ngeFL6dXnYlJ/hTQ6s7Sw
	Pjcy8ufQkpzoKe53+t6qqhmL2GmR+NebLU4bq/AIcq/lMmrIvgRusEFyg+JZtStCb1m9pbIzkbHra
	BQfywIhxnFLn+Cue9Iud19DwtFkq2esNmcOfAk5APzQ4NaFjt2xEC5Wj3oQGLCA/PRREyWPu41IpH
	gAYtnzBuuMDF1BuWzWMfEFuzyk5EArBh/My2OqlSDcclpBvtgEhBXll9RWKFpI/LrQG4MC+jIVoOY
	wiW+8cuKuahhUyKHDMCXYEIVVHE3HjWu2avXR3ZeOxLLH/mGfi4sw9gEKrvwM64qd4EkZ0asfJH4V
	gfIsPr6A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV80-00000000KzI-0X7U
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iN7hVKxpU9yGNoa0FvV6QQfaV15Sbc5QZKf/pqr08oc=;
	b=E0m8c0g4mMcVpRGlZq3lof8PUsb6a7CeiZTHQhuS5Deitn7B3/6mUZJkHOYFCUK5u+VK8+
	gNN6+/+fKJNfKjNqYJK5MxZmuIg9GV3UiDZOtn60DpbXqKNYof4bF4TwhtAtI1wpHO5vdF
	hbduVgMnvApSArxYYTzzbQDAGnIHV8k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iN7hVKxpU9yGNoa0FvV6QQfaV15Sbc5QZKf/pqr08oc=;
	b=YoUFMiqFRQwhob84m5cE7rl4ymoqHhlX4EDmjLX6XYrePEOIIbfmCh/MAOwdaYeQHBYR+R
	zahoAgoWPVh3bqDzBgpodsIDqI1r7v4l2TP9JFH8fqbyuDel/wgMjx+Yz4rmFKVIbWqbHw
	hXtPSMsy4uouiL7XlpLU7jvFHIs5uZE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-uFmadyJ3Ne2S53oZu8wyjQ-1; Wed, 27 Mar 2024 11:23:45 -0400
X-MC-Unique: uFmadyJ3Ne2S53oZu8wyjQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69152af7760so25772506d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553025; x=1712157825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iN7hVKxpU9yGNoa0FvV6QQfaV15Sbc5QZKf/pqr08oc=;
        b=tavU+Z/waR9t7o/ZO8sBKGFbzJGNTI1lJoKee/qYX16WpZU7lMNegW7tGbUu01FQMP
         Mhb3flCXYj09YO+19m0hlPuFdKdvK1kaZbAmeLrZBcNgOul0m6k3jMEQ3AG53EqlctPI
         faJBjXki8JUYemifCvJbs0patXUfOc9JPc8otxo/bZWpPHG47hCAGBG+e5Orliyo/r+V
         eZhxBbqCvEg115qUb5c+hWVLls5hkYsgGuorvAuQDZuaKMahM/21DEDwbcx7sivCCaBf
         VHdezmXmRU4RvrTonBen1t8DTqfjtVXo8+EfgIHWXimDj30N+3j5UT9S7LDoqZR/GyfI
         MCwA==
X-Forwarded-Encrypted: i=1; AJvYcCUGMzlGQj/mS0UWmJv9/HLxG7wuVi/QPrymZjNF1tX3dLsPXKyz12XWzMSBImIaJxUSew/B22NiHtap6PNb5WUhKLU60tm9wxiUdyvs25Vk
X-Gm-Message-State: AOJu0YxMa2vnnsAQrJOlbPtdsC1FWSNjmotyhWBRuDf8PzJY1IZcdI5J
	hFs2xE1MYb1UpNclyWP6XOeiYH4ws3slDSBsxtDm3VeT9B+BqccRI9bKvmaaZnx60uIRDPFvZnh
	nfkjtKafQ0Xs6QDc9p9nj4UBfAhmSTMa9PheirGKBcHEhr1xOBbiA74Zbs+upoFXZtw==
X-Received: by 2002:a05:6214:4598:b0:696:7b32:cceb with SMTP id op24-20020a056214459800b006967b32ccebmr13869561qvb.6.1711553024696;
        Wed, 27 Mar 2024 08:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS0Dr3UNRPnI4el/D5x8gcrtCXLMsQwIvd4dOzHJoXuoNg03xhCSCfsu9VpmJMAiYn3G+95A==
X-Received: by 2002:a05:6214:4598:b0:696:7b32:cceb with SMTP id op24-20020a056214459800b006967b32ccebmr13869513qvb.6.1711553024070;
        Wed, 27 Mar 2024 08:23:44 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:43 -0700 (PDT)
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
Subject: [PATCH v4 04/13] mm: Introduce vma_pgtable_walk_{begin|end}()
Date: Wed, 27 Mar 2024 11:23:23 -0400
Message-ID: <20240327152332.950956-5-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_152348_383958_295A1C45 
X-CRM114-Status: GOOD (  11.30  )
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

Introduce per-vma begin()/end() helpers for pgtable walks.  This is a
preparation work to merge hugetlb pgtable walkers with generic mm.

The helpers need to be called before and after a pgtable walk, will start
to be needed if the pgtable walker code supports hugetlb pages.  It's a
hook point for any type of VMA, but for now only hugetlb uses it to
stablize the pgtable pages from getting away (due to possible pmd
unsharing).

Reviewed-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/mm.h |  3 +++
 mm/memory.c        | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index afe27ff3fa94..d8f78017d271 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4233,4 +4233,7 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
 }
 
+void vma_pgtable_walk_begin(struct vm_area_struct *vma);
+void vma_pgtable_walk_end(struct vm_area_struct *vma);
+
 #endif /* _LINUX_MM_H */
diff --git a/mm/memory.c b/mm/memory.c
index 3d0c0cc33c57..27d173f9a521 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6438,3 +6438,15 @@ void ptlock_free(struct ptdesc *ptdesc)
 	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
+
+void vma_pgtable_walk_begin(struct vm_area_struct *vma)
+{
+	if (is_vm_hugetlb_page(vma))
+		hugetlb_vma_lock_read(vma);
+}
+
+void vma_pgtable_walk_end(struct vm_area_struct *vma)
+{
+	if (is_vm_hugetlb_page(vma))
+		hugetlb_vma_unlock_read(vma);
+}
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
