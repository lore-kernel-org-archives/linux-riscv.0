Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A1C54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZUekCjm+W9czQvKVgLGuYUCLzVd0EJdJcuos5jbRSs=; b=PClFEUzhOAXQG3
	OPAUylAnGW5vmyhVPU7flHaV2tG7WeBeBjizIuZwC5Fx+u8Mf6jT87qQzFBIt674ZXxipliWeFdXL
	Ae/nkYdZq9mvCSJHrcIUqY68cpAKMi+GWLnluEp+0Jdl9H5YX+4eExXBa9SOjb72jeWI6voVcgBDO
	Mj888ONfMjvvy6hQKlKkq4v51sMlhrIzauATkIMYA71/8+1/uM5synnAdkTf2yry30f5rxKGsZmgM
	i9N+vrTwqn4QGpvUtfFpjbhya9Y28Y9B0eUiUoVvunqxJh9tDu5XkJaYMhPW//q/0ANGelGVQPwU9
	AlyVMVP0zKMzACCWIjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQar-00000004qv6-2JNU;
	Thu, 21 Mar 2024 22:09:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQa8-00000004qJC-07Kw
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwZ/C3Y+mq5srgVBOLaWiB530mwVuOVA1xifIUFcqIU=;
	b=e17x3FP9D4AjpkF8LFJ+st+8sb6zzeFymsTgfF4db2f4ry3muxxWuknm8+wrrmMpFWEjwc
	HSdUhHJaTeTr+cTELps/QGqfmuIll7HbwOdaGjwT+HSDIOoG8ngfht6+S9h83subskWafc
	cV5cIQbZlH0LSX8BbREmBn7uumvjWtI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-kwUSFjIGPae_PNzUGBg4kA-1; Thu, 21 Mar 2024 18:08:13 -0400
X-MC-Unique: kwUSFjIGPae_PNzUGBg4kA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69651ab4c4fso3556856d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058893; x=1711663693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwZ/C3Y+mq5srgVBOLaWiB530mwVuOVA1xifIUFcqIU=;
        b=Kmi1LgLDMD/rNFPgxOR7yvl23m6Ux2Au7L8tZW8GEqrFGIpnxfgdIQfSx+K9rZZfUF
         U+aO9Ts7Tc/enCwTBwvFhjUM1kKyBFamBPfUjpExteiWot4XvVZhVI35ej1Z1OYI1Icq
         OWBdFiraR70s7aNFXTvtmATp+p4mEQ05y3GETCGuqaNZyH5J7bxc9tz47ApFFW3TsoQh
         G+4fJSwLotRwzfLII5D7GzkbTF2C+2rei18zREn62KhsEWTd8rV2Hf6NAnITrJipwfL6
         XpZsTwwyGFMUgidWgFHGnJHlZl5BsmlbrQ1k5PII9obvqs9ww77iEBEOh7Vdu2oohmKE
         q7kg==
X-Forwarded-Encrypted: i=1; AJvYcCXZUJ5Jjl/0lMxAeiT6iftgOUFMZsFTL8RBy5XbcxWwRNLGUP+Ll5u6KCDoFgkjAY9XQb1njenq8gljiAP1x153aOaLdAgE8hciIQJnj1Ip
X-Gm-Message-State: AOJu0YyV9ka8NDX9g+2bn1jvIOZT4IViq9l4+6NfftsnOfWueBHm87Qw
	8Lhbx1L7CqQ06fUGvyl74ZPRahAOVX+nm/H+pkvkOPJ/jAqJRDmLhhQE6eYrHn9oGRLZycASSKk
	zHrodo3jndPAHn+s5zt0ivvgRf+jz+f+dY4OQkZvfW4EPGrs6uUgshFMROPIoIC07iA==
X-Received: by 2002:a05:6214:3f89:b0:690:c35c:7590 with SMTP id ow9-20020a0562143f8900b00690c35c7590mr218140qvb.2.1711058893171;
        Thu, 21 Mar 2024 15:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl1Qmf0wBzWRoAAACR5bZA/I9hFYAFMFu/sm/LF6+WMAng7TWyPkikdWZMgBZCHnmtXnvmwg==
X-Received: by 2002:a05:6214:3f89:b0:690:c35c:7590 with SMTP id ow9-20020a0562143f8900b00690c35c7590mr218110qvb.2.1711058892727;
        Thu, 21 Mar 2024 15:08:12 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:12 -0700 (PDT)
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
Subject: [PATCH v3 04/12] mm: Introduce vma_pgtable_walk_{begin|end}()
Date: Thu, 21 Mar 2024 18:07:54 -0400
Message-ID: <20240321220802.679544-5-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_150816_243331_F6612D24 
X-CRM114-Status: GOOD (  11.38  )
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
index 8147b1302413..d10eb89f4096 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4198,4 +4198,7 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
 }
 
+void vma_pgtable_walk_begin(struct vm_area_struct *vma);
+void vma_pgtable_walk_end(struct vm_area_struct *vma);
+
 #endif /* _LINUX_MM_H */
diff --git a/mm/memory.c b/mm/memory.c
index 9bce1fa76dd7..4f2caf1c3c4d 100644
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
