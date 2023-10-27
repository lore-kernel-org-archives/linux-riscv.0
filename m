Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32926C25B6E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxwE9hUhhCx45q6S5sYeRUwqI1J79mg4ZPoPzQtxw0M=; b=fw8MxYcVJbbkPB
	Gq9xqZNuSDNtilBEvkDpICUa2TcpcOLZ69uXgdhBdaAJ0SkG97GS5S036CVgnRUSm0hCyWwUltW+s
	9eIcaWC1iKkrVoIcSU6T7aI9vLONyVrcRuZIWCG/lrVNNnOFGrLqRQDn5eiWrKgxZdJjikwu7zdqt
	vAg1NxfWlA7WCtFMo7P/KqEde8UfzhTBokN535xoimKkbFSS8BVY6KpecEqUjayXj1qrWrDd3nXEX
	UPWHqRdu28kkxj3kpXs3a+1XEr5G5cSAyOw1q36yRD11BczS1ZWTYBZheHOtVCFSo80jaqV2S4j2+
	CLFBO52GlWA7llYFFY3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSY9-00H5cC-0J;
	Fri, 27 Oct 2023 19:31:17 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRU7-00Gx7U-2C
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:23:06 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-da0c6d62ec8so1153963276.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430973; x=1699035773; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KesXVMWlLgDxABh+fu6pK0xRQzS+y87PSmDv/paodW4=;
        b=zp/mHXMPWsNAHWns10tWhaDecackeLF7a5bB+J4a7MmJWQDjVsPxz2rD3u9Bn6SRIs
         AP+vVa/6ZDIo8VzpGqGVFB6R4gT0ldjfNl79YB9d8fqAeLVB1NGmcqusy5SIl2cAhNXO
         emtSOH4+3S3hIO7b3J3UQcxNuTLSJyh0KxWC6W3dTlT4U6tWluz91/ae7G7hBE1xwSfZ
         BDNlFLYUDUHUgyiKd6XwHg+lIJNvzrG/UTdGLEN7hhlwInr94DIZYbfRlVqa9NWzWIXq
         WtsXyhFd3pqv7p6ZUsYxhmGO/4/p5Ya34L6j9RCsWqxI93ZtycKjCHOkCPLPNTbDC8GZ
         bp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430973; x=1699035773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KesXVMWlLgDxABh+fu6pK0xRQzS+y87PSmDv/paodW4=;
        b=lO+9IjkTJMlnnOr21FKjpK+srrNW+ZX4mo8VhRKPr0DNNcCo4VUC53Fyk3ttnlcgrE
         cWgFYZXiz61y9ttOkgmJ6GgxsNi8OyCcbtlaRQecI8tirhOdNNjPXS3JFQgGXCEuoskw
         /qvWqkOMfhLZvphth74fKxZdk2LxBXRcP7+jwEHBDcJzEa+BvcruQfBpnBF+e9tUS35O
         jP76MNX5IIfnT1bIL5amD9MXwMyZVp3GHAz7wlS06SxnSH0nIVbC+Y13Slnd6W3VOQAv
         6TrGZ1TPc0J0AkA5Pf0j3uNcvCQQlP65pRjUGATz9OsrIw5i3BjGchSd1OHKiAa1i9A4
         ZPLg==
X-Gm-Message-State: AOJu0YysbXf+cxPvRIlYvuo+Bb9tNHrmWU7yN7vkoB9fqjfoBDEqXb2x
	8F0MXX5VpqpuiWg2zOJDX0zKHXHmeYY=
X-Google-Smtp-Source: AGHT+IEnuAFhzspZaQ7IFc3ileY3RuCJW0iKBNsx2McP6lY6HFfWXzfm0mDQuIa0sPNZvKStqElvm4PIJQ8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:da0:567d:f819 with SMTP id
 v3-20020a056902108300b00da0567df819mr78694ybu.10.1698430973571; Fri, 27 Oct
 2023 11:22:53 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:56 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-15-seanjc@google.com>
Subject: [PATCH v13 14/35] mm: Add AS_UNMOVABLE to mark mapping as completely unmovable
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_112303_756421_090A0A04 
X-CRM114-Status: GOOD (  18.90  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add an "unmovable" flag for mappings that cannot be migrated under any
circumstance.  KVM will use the flag for its upcoming GUEST_MEMFD support,
which will not support compaction/migration, at least not in the
foreseeable future.

Test AS_UNMOVABLE under folio lock as already done for the async
compaction/dirty folio case, as the mapping can be removed by truncation
while compaction is running.  To avoid having to lock every folio with a
mapping, assume/require that unmovable mappings are also unevictable, and
have mapping_set_unmovable() also set AS_UNEVICTABLE.

Cc: Matthew Wilcox <willy@infradead.org>
Co-developed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/pagemap.h | 19 +++++++++++++++++-
 mm/compaction.c         | 43 +++++++++++++++++++++++++++++------------
 mm/migrate.c            |  2 ++
 3 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 351c3b7f93a1..82c9bf506b79 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -203,7 +203,8 @@ enum mapping_flags {
 	/* writeback related tags are not used */
 	AS_NO_WRITEBACK_TAGS = 5,
 	AS_LARGE_FOLIO_SUPPORT = 6,
-	AS_RELEASE_ALWAYS,	/* Call ->release_folio(), even if no private data */
+	AS_RELEASE_ALWAYS = 7,	/* Call ->release_folio(), even if no private data */
+	AS_UNMOVABLE	= 8,	/* The mapping cannot be moved, ever */
 };
 
 /**
@@ -289,6 +290,22 @@ static inline void mapping_clear_release_always(struct address_space *mapping)
 	clear_bit(AS_RELEASE_ALWAYS, &mapping->flags);
 }
 
+static inline void mapping_set_unmovable(struct address_space *mapping)
+{
+	/*
+	 * It's expected unmovable mappings are also unevictable. Compaction
+	 * migrate scanner (isolate_migratepages_block()) relies on this to
+	 * reduce page locking.
+	 */
+	set_bit(AS_UNEVICTABLE, &mapping->flags);
+	set_bit(AS_UNMOVABLE, &mapping->flags);
+}
+
+static inline bool mapping_unmovable(struct address_space *mapping)
+{
+	return test_bit(AS_UNMOVABLE, &mapping->flags);
+}
+
 static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
 {
 	return mapping->gfp_mask;
diff --git a/mm/compaction.c b/mm/compaction.c
index 38c8d216c6a3..12b828aed7c8 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -883,6 +883,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 
 	/* Time to isolate some pages for migration */
 	for (; low_pfn < end_pfn; low_pfn++) {
+		bool is_dirty, is_unevictable;
 
 		if (skip_on_failure && low_pfn >= next_skip_pfn) {
 			/*
@@ -1080,8 +1081,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!folio_test_lru(folio))
 			goto isolate_fail_put;
 
+		is_unevictable = folio_test_unevictable(folio);
+
 		/* Compaction might skip unevictable pages but CMA takes them */
-		if (!(mode & ISOLATE_UNEVICTABLE) && folio_test_unevictable(folio))
+		if (!(mode & ISOLATE_UNEVICTABLE) && is_unevictable)
 			goto isolate_fail_put;
 
 		/*
@@ -1093,26 +1096,42 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_writeback(folio))
 			goto isolate_fail_put;
 
-		if ((mode & ISOLATE_ASYNC_MIGRATE) && folio_test_dirty(folio)) {
-			bool migrate_dirty;
+		is_dirty = folio_test_dirty(folio);
+
+		if (((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) ||
+		    (mapping && is_unevictable)) {
+			bool migrate_dirty = true;
+			bool is_unmovable;
 
 			/*
 			 * Only folios without mappings or that have
-			 * a ->migrate_folio callback are possible to
-			 * migrate without blocking.  However, we may
-			 * be racing with truncation, which can free
-			 * the mapping.  Truncation holds the folio lock
-			 * until after the folio is removed from the page
-			 * cache so holding it ourselves is sufficient.
+			 * a ->migrate_folio callback are possible to migrate
+			 * without blocking.
+			 *
+			 * Folios from unmovable mappings are not migratable.
+			 *
+			 * However, we can be racing with truncation, which can
+			 * free the mapping that we need to check. Truncation
+			 * holds the folio lock until after the folio is removed
+			 * from the page so holding it ourselves is sufficient.
+			 *
+			 * To avoid locking the folio just to check unmovable,
+			 * assume every unmovable folio is also unevictable,
+			 * which is a cheaper test.  If our assumption goes
+			 * wrong, it's not a correctness bug, just potentially
+			 * wasted cycles.
 			 */
 			if (!folio_trylock(folio))
 				goto isolate_fail_put;
 
 			mapping = folio_mapping(folio);
-			migrate_dirty = !mapping ||
-					mapping->a_ops->migrate_folio;
+			if ((mode & ISOLATE_ASYNC_MIGRATE) && is_dirty) {
+				migrate_dirty = !mapping ||
+						mapping->a_ops->migrate_folio;
+			}
+			is_unmovable = mapping && mapping_unmovable(mapping);
 			folio_unlock(folio);
-			if (!migrate_dirty)
+			if (!migrate_dirty || is_unmovable)
 				goto isolate_fail_put;
 		}
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 2053b54556ca..ed874e43ecd7 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -956,6 +956,8 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (!mapping)
 			rc = migrate_folio(mapping, dst, src, mode);
+		else if (mapping_unmovable(mapping))
+			rc = -EOPNOTSUPP;
 		else if (mapping->a_ops->migrate_folio)
 			/*
 			 * Most folios have a mapping and most filesystems
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
