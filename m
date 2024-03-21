Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBFFC54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 22:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcOJXOXaFIEC/46sHgfdOCL+K4dYCLDuGWEpwyKp/kg=; b=c4/MO+LLWHIvWx
	1vTiq1e5zzHiwFD1hztQgTNjfEx3gof34R9TN17nXoF3IaS1LNgZK/qH3RZlrqSEDNOZsj9xQQhVs
	JcaYF7VtqmOSrVg4xY8hXASIq7GmEo3DQfUXm+wk0s0yk0YbVhJ9X7Z/vuEJ6QGozgOPYvyNtch0K
	z4QggmBD62uLKSMyXg6DeqK2kUe+Cyw7npVS38oPzJrOHpxv2B/0fVcjoaSmMGya9TqghowiVwiyQ
	AAezk0yoZQPYm8lS9Qhe6uaRElzNHOVg9if6dN9nfWw702nUe+5A76m9cuc9oBfeT2NL/h9ogrCPx
	hzCe7o9828eqSX5a1shQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQaj-00000004qqZ-46WN;
	Thu, 21 Mar 2024 22:08:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnQa6-00000004qHd-1m6b
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 22:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wdRUTOTGji9K1EOtUzCYNHXUg1STGKkafiwUdqA6oYA=;
	b=ddEbQRS7uISRVpiE543XZzi76iOwqW75Ahq9OpyxnA4p7RAtKWfYimvu9giRHxIXv1lSeG
	FwmMHbjjH/SueJq9l4PB75WWNQNbpI3vOjhMoH1iiFewI0pLk6+AwYIhrJLf3T7ysiC/8l
	MO5Ao+4uqii5sZIjbsGBImV1lzH6cOo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-N_zkJ6hOM5qRPd-AIqUwDg-1; Thu, 21 Mar 2024 18:08:12 -0400
X-MC-Unique: N_zkJ6hOM5qRPd-AIqUwDg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-430c76df729so4253841cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 15:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058891; x=1711663691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdRUTOTGji9K1EOtUzCYNHXUg1STGKkafiwUdqA6oYA=;
        b=kBlOjodsvJxLNhK8+rFBRDg0y1b0qpGRN000fCpNuYcuoxfzuK51hYEOMZXj84AVc1
         +CacFcEZTZlHCNoW/Z11+CCl9GgKEwqiKYUEJrY2lbmIPvszNDLB9IbMTcC1kqKXJPwg
         GcShy18Vc+NQ6yS9XNgSNvBegnINyGY4LJ8XPntzPMDP46WLkwfM1XdG7B5uhes9K+o2
         lNVvVJwULcv5urjK1UgRslHv4HI0ge82//6VXWTiwSCdw2c6kHvZc+3TRtTWJ+I2SODr
         duGbg8ZqtZ7H+h/yfCJLiqmu7izcuuCLvVF0tsXSLlAetdYIhjmWk1txHv8Gjf/Dfr8G
         75Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUGixmQdqFgzcsXdWm6LEfDoemHSioYyBt/maYLTaGnAWzaN+vygsYEWOeMfqLrHuFRWcxh+6CcAnkVrLEFPAmi7t1o4yDQv+JiMGH7OEdt
X-Gm-Message-State: AOJu0Yxhz7yVdRHYeMCMLHTLnfFp19vCk2Zv/XYNyLjVupU/tkcHGqna
	LOhfpCVMDfsnQ05/htG//bwFr/MHuS6tXrOpN1h5d/awxsAoGY/K5OHeRauB84xvKDsCf4vVJdH
	iMfVQX41tEBryb0woU8q4l4DTPQe0YJdWmpmAbwXAYpvDQO7Xf8AGAWEdyHkk01P8Xg==
X-Received: by 2002:a05:6214:3a8a:b0:690:3c85:c5b with SMTP id nz10-20020a0562143a8a00b006903c850c5bmr195553qvb.3.1711058891331;
        Thu, 21 Mar 2024 15:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG16ns9jJ9MJ80ThL7hh1B1qvLdYLgSNyXX5iyvBQC6076/qVHetDei+F5v2+719IrZ5asQ9g==
X-Received: by 2002:a05:6214:3a8a:b0:690:3c85:c5b with SMTP id nz10-20020a0562143a8a00b006903c850c5bmr195527qvb.3.1711058890838;
        Thu, 21 Mar 2024 15:08:10 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:10 -0700 (PDT)
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
Subject: [PATCH v3 03/12] mm: Make HPAGE_PXD_* macros even if !THP
Date: Thu, 21 Mar 2024 18:07:53 -0400
Message-ID: <20240321220802.679544-4-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_150814_687070_51B15BD5 
X-CRM114-Status: GOOD (  12.29  )
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

These macros can be helpful when we plan to merge hugetlb code into generic
code.  Move them out and define them even if !THP.

We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
Reorganize these macros.

Reviewed-by: Christoph Hellwig <hch@infradead.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index de0c89105076..3bcdfc7e5d57 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -64,9 +64,6 @@ ssize_t single_hugepage_flag_show(struct kobject *kobj,
 				  enum transparent_hugepage_flag flag);
 extern struct kobj_attribute shmem_enabled_attr;
 
-#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
-#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
-
 /*
  * Mask of all large folio orders supported for anonymous THP; all orders up to
  * and including PMD_ORDER, except order-0 (which is not "huge") and order-1
@@ -87,14 +84,19 @@ extern struct kobj_attribute shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define HPAGE_PMD_SHIFT PMD_SHIFT
 #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
 #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
+#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 
 #define HPAGE_PUD_SHIFT PUD_SHIFT
 #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
 #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
+#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
+#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 extern unsigned long transparent_hugepage_flags;
 extern unsigned long huge_anon_orders_always;
@@ -378,13 +380,6 @@ static inline bool thp_migration_supported(void)
 }
 
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
-#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
-#define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
-#define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
-
-#define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
-#define HPAGE_PUD_MASK ({ BUILD_BUG(); 0; })
-#define HPAGE_PUD_SIZE ({ BUILD_BUG(); 0; })
 
 static inline bool folio_test_pmd_mappable(struct folio *folio)
 {
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
