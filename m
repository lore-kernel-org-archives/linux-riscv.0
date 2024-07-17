Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BF8C3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 22:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ctkhs3wlFLcVrIka78jPbAfmE1O5HocZ4s9DqB9uvE=; b=DNceycKpIwoYW/
	hW00dQYV5+Kkutf06ehOXwknc+xJQMFIBAOxpkhuPr2SopZvfUU7DqmqozhSHwsP9S3bh3wPNbmm+
	QbiF+cudG2JAEMlNJIQ5VOFOEAxF07YwimeskQ8KrmuFcnGJrKwgXzOp+Uh5TNNEwmEJmaLfkRJy2
	wh+iFRxIkbLAeMXJSxAVOriSa6UmFNRD2JuSMf9Kw8OUuJukahFxOeQ4+LLMMK8NqnOJm/0KCgZ7j
	JFu97kXzpS+JStrDdtEgiyWFsyQUXT24mdM+iAh059kQfD8I8YRFq+WCvshbBnuh1auVgm4+Hwf6/
	TwT/Nsd7X90awsuop7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUCjl-0000000F3L3-1gBe;
	Wed, 17 Jul 2024 22:03:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUCjQ-0000000F3Eg-1wwQ
	for linux-riscv@bombadil.infradead.org;
	Wed, 17 Jul 2024 22:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=; b=Qc1wUAvXxoh8OwQQuECShNLC5Y
	ZGqbxvOOWr+CWb5yOGwsMQwzLZ40rA2Acf0nG6lqRQzGvo4XnAe3USa8abj9QjBF4rftPzS+CIqXL
	6DFq7bPhK0Euu1o2ObrGmqQkmVKh2pT3meiuQj8XS1pAf6lJJvXDxnkDqAYGabiIX9Zn/Pjm34cqw
	7kY7eaOKQjZp8lG5v53nrbffGztJ6jFYWzFeDFt9gLFncyPu4FBWD3CU4JfgM/0TJoSFGtQ+nheqW
	Tj2fpHJH4vBegUWwyKcB62vK8qVfQaKEUTivjXq0AHkdIg+R2mPDY5aWhZZegmzmLOz3D6Yv2BHyx
	uEMOskmQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUCjL-00000002Q0I-2hvi
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 22:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=;
	b=ESRhlKtK2XbcqjHPvNhWyDnEIg6n6REXvrkJcQueiuwGAKzYFTile1c/uYc4T/kV0Vb7R7
	ljjS0TdBuK0xxTMciaCUbc1FuubY4nbzqzD4YQl+Pnv8xtq/CSUkqO0FxolzY0RjvWQ6kQ
	zBJr1iOivcRXyRGHovl0bnLMeeOe9GA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=;
	b=ESRhlKtK2XbcqjHPvNhWyDnEIg6n6REXvrkJcQueiuwGAKzYFTile1c/uYc4T/kV0Vb7R7
	ljjS0TdBuK0xxTMciaCUbc1FuubY4nbzqzD4YQl+Pnv8xtq/CSUkqO0FxolzY0RjvWQ6kQ
	zBJr1iOivcRXyRGHovl0bnLMeeOe9GA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-1c-2s5iXOEqY4HuuKMA50Q-1; Wed, 17 Jul 2024 18:02:27 -0400
X-MC-Unique: 1c-2s5iXOEqY4HuuKMA50Q-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44aeacbf2baso259341cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 15:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253747; x=1721858547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QImmTBB9J6ICz0B3Smrm8OMXXoPNwmhbbZRF0rUpNQ=;
        b=YwblS76d78ZqSXZpy8sB2YLS/e8cIub9ufHKZ9IizHK3gWziajkEEpM+EjxUaQVKgS
         ljifBo3g+Rvoi/HiuMUAwwMubnwI5G6hiG54BoZnN3e3+JieHFy016GdqFBTVM8Hm7Ng
         HlP4zsBJgX1oLhm2ny5rudM9amSZs5u0qy3WeyymO58Vh4R6qzSJOGzApVEpZQXhmtMZ
         Yzf4nQN4EWvT/82JC2yV3qnbia4h7NbQo0vqGXWCns6GssVMPPwRuX5vrxL0BbTsFPj1
         nQMxJ48jGlxZUAy6ZlhR0UGnZV48RzWtnfD+ZAyg3oNAT3XKjop1PiVYp/UhEs8AQvuH
         dLJw==
X-Forwarded-Encrypted: i=1; AJvYcCWvpMMoDsSw7mXWULj/WMackqjzlTcZMHscBvrwfGrRBXmd8sWj3v8nurFNjhfqOoOvwazAph70U7vQy8w8NLXtSA1mXzgVHkZ8VPkIgl95
X-Gm-Message-State: AOJu0YwSpQT+3z6cYySYGWJn5JMRWHH5Utpwm4OIGjktP5iPAmrgH8Mj
	kgP06kc3QsWVXoUPFzO5FrbdLEZQG9fUQbbtKjfUCc+8aABpeVmBmQTSMntLUGXwwb4sYUFwO7r
	B5GM6s3/qtaPhNGcWU6DuwbAZi0dSDFH2CmsvjhP6iQ6Yc1mGQSNglR9qRMAYMYrZtw==
X-Received: by 2002:a05:622a:3cd:b0:44f:89e3:e8d3 with SMTP id d75a77b69052e-44f89e3ebf3mr16472681cf.10.1721253746702;
        Wed, 17 Jul 2024 15:02:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7KLWkbU1UwJKSHrhdblARNi4OMqfXeCTcT+ovTUhvRHwOTG0GQKyZtUb2OdQ3d+/fWLwEbg==
X-Received: by 2002:a05:622a:3cd:b0:44f:89e3:e8d3 with SMTP id d75a77b69052e-44f89e3ebf3mr16472521cf.10.1721253746301;
        Wed, 17 Jul 2024 15:02:26 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Vlastimil Babka <vbabka@suse.cz>,
	peterx@redhat.com,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	x86@kernel.org,
	Alistair Popple <apopple@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Date: Wed, 17 Jul 2024 18:02:15 -0400
Message-ID: <20240717220219.3743374-3-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_230235_843887_BA7F56F0 
X-CRM114-Status: GOOD (  11.82  )
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

Introduce two more sub-options for PGTABLE_HAS_HUGE_LEAVES:

  - PGTABLE_HAS_PMD_LEAVES: set when there can be PMD mappings
  - PGTABLE_HAS_PUD_LEAVES: set when there can be PUD mappings

It will help to identify whether the current build may only want PMD
helpers but not PUD ones, as these sub-options will also check against the
arch support over HAVE_ARCH_TRANSPARENT_HUGEPAGE[_PUD].

Note that having them depend on HAVE_ARCH_TRANSPARENT_HUGEPAGE[_PUD] is
still some intermediate step.  The best way is to have an option say
"whether arch XXX supports PMD/PUD mappings" and so on.  However let's
leave that for later as that's the easy part.  So far, we use these options
to stably detect per-arch huge mapping support.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 10 +++++++---
 mm/Kconfig              |  6 ++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 711632df7edf..37482c8445d1 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -96,14 +96,18 @@ extern struct kobj_attribute thpsize_shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, tva_flags, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, tva_flags, BIT(order)))
 
-#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
-#define HPAGE_PMD_SHIFT PMD_SHIFT
+#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
 #define HPAGE_PUD_SHIFT PUD_SHIFT
 #else
-#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
 #define HPAGE_PUD_SHIFT ({ BUILD_BUG(); 0; })
 #endif
 
+#ifdef CONFIG_PGTABLE_HAS_PMD_LEAVES
+#define HPAGE_PMD_SHIFT PMD_SHIFT
+#else
+#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
+#endif
+
 #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
 #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
 #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
diff --git a/mm/Kconfig b/mm/Kconfig
index 60796402850e..2dbdc088dee8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -860,6 +860,12 @@ endif # TRANSPARENT_HUGEPAGE
 config PGTABLE_HAS_HUGE_LEAVES
 	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
 
+config PGTABLE_HAS_PMD_LEAVES
+	def_bool HAVE_ARCH_TRANSPARENT_HUGEPAGE && PGTABLE_HAS_HUGE_LEAVES
+
+config PGTABLE_HAS_PUD_LEAVES
+	def_bool HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD && PGTABLE_HAS_HUGE_LEAVES
+
 #
 # UP and nommu archs use km based percpu allocator
 #
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
