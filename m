Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D4CC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSEhDpEDNfwFY9cCXRSiefJcgbMduqAbFBujcXIB1PY=; b=uuQCsosrdOKTeV
	x/4K91otl4fiS8miCBV3MftdRp93DexeLkdo+VuYOauy7kHPpmEiSaezEtrCX/4NLGwcYL8kxXKiX
	l0hSBonua/kGkD4FE7GkSgJc9nu7HUuHC9F0zACkwO/STrJ13kSR1SDmxLot9yJjnRQvTUAWUzLHV
	zswLk7YnzmAwDqtzVVvpN3g+uewZ9NZJDlsfjncwE4LFksuYor+GrXq8rJJxz/acg3QL+fx99a2h9
	j0IOnCQB52Ucb1PDSb29Ua93bUdfP5gtF0Y6v6ZEMD1Tl7m3YXRskQlsfAJhCpvdriRy2Da+sweGg
	IZUIwYENV4tr0Iw9JFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV8z-00000009m38-07cZ;
	Wed, 27 Mar 2024 15:24:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV89-00000009lRY-1RlT
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 15:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gD68z8/n0HSMW69QF19tjjGBtDgz4n3uypdcneHmRPc=; b=FuBiZQjP59v4kXTXfXU/PkGbt5
	pnFjgPZzCDl7EALqxJhkijIjYUDQOjiNx6EWqoAsYdJsPbXUAfHxVc+Za0TG6LOenK5xMRwgzOfOj
	+lGlcS1KUWsIkO812zW4iXVYLkKQgQ3tDR6jnAEpdYzb74QdFgYh+0sQix3OrSUL/5O22rUUhXrkk
	H4MG5y1xkc7e+YRQCFFy3lUKzc1FB4tbR3yNCBjBhmtIW3NeIV76UhL2zqRb+lrR1FfC1fe5b1wXX
	PYTaJHNRhe9Av+FOfPYn54wAk5wO0akcN7XTm3Kk8mFGPzBBjx22n3PucNS0uR1wX+Kl0yz/kmltn
	BTM7cz1Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpV84-00000000L1f-020P
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 15:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gD68z8/n0HSMW69QF19tjjGBtDgz4n3uypdcneHmRPc=;
	b=URgRD63zRlDW9Tzk+yUQ6m3s3RquSQHPR4IFpodqqffSs0LHiUOuLjiK6wv7x74UWV7Q2Y
	2SpzviHmAdtRg0QSfjeXuXA2cdvaXc7EASWvJ+xiwT5C3UfhzBpNDl0zarUubyu3//ICWm
	vVfDBpawqWWrgLfaqylb7D5lbY1wNxM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gD68z8/n0HSMW69QF19tjjGBtDgz4n3uypdcneHmRPc=;
	b=MmVWvOTmTU6nujh5vqCWOvh40F2hfZGnujaJOTLKSL1yFnAGxQ4g3uLfFiByr/zlkmcOQY
	ilQbcnWPImt4PEV4bgatJGE6JiNqgsB0sGlqJhncvrw/Z5NtDTHzinR+sWw6JzChrB51nU
	VvMjCL3Zn3JP7dFwbrsQZySMmR31jtA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-khkLlAw3MGSbmsLAozcYjA-1; Wed, 27 Mar 2024 11:23:49 -0400
X-MC-Unique: khkLlAw3MGSbmsLAozcYjA-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-690c19ee50bso2422106d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 08:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553029; x=1712157829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gD68z8/n0HSMW69QF19tjjGBtDgz4n3uypdcneHmRPc=;
        b=RH/ApTou+/uJfJ1BSGEiiEDejJMMxTiRE8i/L+DIQltd38PqLC/3psd2wAC+HPAMKc
         cpyzjEbilX+LIK1ZJXFDDVL0j03lazwtGTlgek1I+m6iz+EtwP/nuHuNSivtHYNm7bho
         11HHXOm40BabZpvjitkd5UXsfGFRKEQPeBhSAeeb54GfDYtWgI8eIczTDYvkIsKADypb
         i+N+/ZXP8WWEub8q+ZbhiHmZiocnlGuXOkBr0K8QTDcu80JqlpW/qTV1VsFYU7MYQnnj
         Wu2K0SzYNrzU6KIzNxFstsmwzT9ahXYeDKBdtWgldKFM3fORsRtFZyfRxBGoZS5XTrx/
         kY+w==
X-Forwarded-Encrypted: i=1; AJvYcCWN9fkudMXHoAsB2XRinIwm4yGdA+GO9EzSix8FT8T6eYlXPL8QrBNX0//H5FcXJnGij9BI31Z3Rp9AX/RL9m+UqSF0yqssgoWNnfSuwyEV
X-Gm-Message-State: AOJu0YwwfeAGOh15ttqM0HCrnaAwJ+A8mYZlVcstYpwoo6LLgDZKKZpw
	uB2xwYPalGgZh/jmw1TiNtpbdk8HzMiVHWQPwHcQ6NLjeiL0sPt0VAiJwOt5XK2gwMpw6BuoZsx
	DvIzC/11TqYsl963mMcPfFpirlLd/M08MB/tPXaH1JIHKz5pzI5NStLmNqKxL7xFvtA==
X-Received: by 2002:a05:6214:3a01:b0:696:81b8:a462 with SMTP id nw1-20020a0562143a0100b0069681b8a462mr13234447qvb.0.1711553028762;
        Wed, 27 Mar 2024 08:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaIIFSwEPr6utJECaPIJXCgmHTkHVcLUQEzRJpciko/79sjH/yOlRx7KIof08fJkHOKzrhqQ==
X-Received: by 2002:a05:6214:3a01:b0:696:81b8:a462 with SMTP id nw1-20020a0562143a0100b0069681b8a462mr13234423qvb.0.1711553028305;
        Wed, 27 Mar 2024 08:23:48 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:47 -0700 (PDT)
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
Subject: [PATCH v4 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd processing
Date: Wed, 27 Mar 2024 11:23:25 -0400
Message-ID: <20240327152332.950956-7-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_152353_770969_7B753F79 
X-CRM114-Status: GOOD (  15.57  )
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

Hugepd format for GUP is only used in PowerPC with hugetlbfs.  There are
some kernel usage of hugepd (can refer to hugepd_populate_kernel() for
PPC_8XX), however those pages are not candidates for GUP.

Commit a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
file-backed mappings") added a check to fail gup-fast if there's potential
risk of violating GUP over writeback file systems.  That should never apply
to hugepd.  Considering that hugepd is an old format (and even
software-only), there's no plan to extend hugepd into other file typed
memories that is prone to the same issue.

Drop that check, not only because it'll never be true for hugepd per any
known plan, but also it paves way for reusing the function outside
fast-gup.

To make sure we'll still remember this issue just in case hugepd will be
extended to support non-hugetlbfs memories, add a rich comment above
gup_huge_pd(), explaining the issue with proper references.

Cc: Christoph Hellwig <hch@infradead.org>
Cc: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e7510b6ce765..db35b056fc9a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2832,11 +2832,6 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
-	if (!folio_fast_pin_allowed(folio, flags)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
 	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
 		gup_put_folio(folio, refs, flags);
 		return 0;
@@ -2847,6 +2842,14 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	return 1;
 }
 
+/*
+ * NOTE: currently GUP for a hugepd is only possible on hugetlbfs file
+ * systems on Power, which does not have issue with folio writeback against
+ * GUP updates.  When hugepd will be extended to support non-hugetlbfs or
+ * even anonymous memory, we need to do extra check as what we do with most
+ * of the other folios. See writable_file_mapping_allowed() and
+ * folio_fast_pin_allowed() for more information.
+ */
 static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 		unsigned int pdshift, unsigned long end, unsigned int flags,
 		struct page **pages, int *nr)
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
