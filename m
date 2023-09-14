Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7956BEE0203
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7aB2WXjguPWfVEycwBpfdmgLAo5QJm7+l6jYDg7lsk=; b=zldM03+O8iBHrp
	P5z9Y3ne6fdBa+niQGTP225otXB3llVfIVx9RJmWKpLdwpcyMQe0jMRcnSvVoxfNAIkdm4OFXcmoI
	9gQRBmeausz8LkTIRXSB/wQwXSjAyuU/Tcwahds4y21OkYZyCy+ZNwS+5PBQ3+RfDTrTw7wungIwF
	VmPgkK9SlTtuN7Sa01DyS9vUmqURY8M76qWjbRKsFHnAJl9O7u6MA1+bsUU8eWe3K0gR1pS/ChoiR
	PAzpMBNJee8XAtJIu+Qs5JCkYYULAnZEPhTbeH+64r8WamptTqKc56mMxTg37POPMC8lpABJyGT7x
	cDZlMZ36OzX++gfWLO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbbq-0074cW-1l;
	Thu, 14 Sep 2023 01:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaS-0073CL-20
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IroGtA6z4X06VM4XXyW5Hwunrfyb2UP8Ai0nAjfYz+0=; b=ZdHTx71G/7mfcP0YBTiAbc+5L5
	cuckM6LEJkv46Up5r/wue3QlG2kCbsffu1GNVzqVbOIhHZhLmyHF70MT+I0IQythp8edkBGpURGIO
	s7WZ7RKvudH0YHu7apy3tIM0aTeV3O/8uK1g6LQRvIkaeHF3HFLuaXAp7h5clNGWzqk+KE5TBOIlN
	5OiP/oAJODRM545tAEzEU+am9S7jfh3d+hDIy5BEY+XkibI1DPnzOeSy36IOETvYLB9t/4BhZTUA8
	wBK1ZYQRNanLr/Ji2uFGZhzRJE+7fp5NIuLCVhIA032JqOUfFYTqI0jhL1Px/E7x34bvSRxr+9slA
	shZL9muw==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaL-007TX1-2G
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:06 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bf681d3d04so3895415ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656561; x=1695261361; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IroGtA6z4X06VM4XXyW5Hwunrfyb2UP8Ai0nAjfYz+0=;
        b=MKz0LqgjNaURFRSJCrS36KtQYbsAL8HY3Dx0Zs6jbXCqatyNV0nKIO0HOyewGWQkhF
         p4pEIi5Lo1CP4LbaeXn9HMJaWVMp2AAAJwpb3o7CxOaTtcP4Jn85JgxaHXuTCZKKCRUd
         yOXJrRT6trhulw+nfQEm1tSu2F/FrFqlgAVlwCh9aJ01BWUV27hvNQk5oWuP6QgI5pJ0
         /QDU5ZtYxFpi4G+6fUOfY0FHCwtB1oMDccGnyO6wPEEKzSVrBwxF3B1qdcDrrs2FFJX3
         UjLfqnjctHfPOG4/mEosW8Bunuq6zK4l/FWdkKlwBg4W0ru8YytGoxnuNKc86BNWbJfb
         HiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656561; x=1695261361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IroGtA6z4X06VM4XXyW5Hwunrfyb2UP8Ai0nAjfYz+0=;
        b=O5jIY4sMFZaLCqBtHEIY28+rJLNROmrs1v2ymbY6fJVEcYI2Fx3Qy7ZuXbG1kfrcTr
         4dRFGmCT2DcV+qWV0d/HsG084aEL7O4hXWWidUNQwnvTl9zunQqS9245+OLpcEwHIZcA
         bPW2o3yWGiqFV55N+e0EGmwzbjjWIs198nbRkP8iJH9EXBwogKzXFX3QkceqdHCvX2Kx
         tBQC4fd0LOIl+cWPPX3Y/hlY95Hag5ByITs13hM4dABcfdcuTsC7v2jMpuEbBef5gXSK
         duv2yuItRXW/J86Ol2uNxtK4jpHFp0or0GEFsTFOmDOLOy3DF/SL0r0N/N8gA4bRkYXC
         qi+A==
X-Gm-Message-State: AOJu0YzDy5mwQZkpE86SoMtuKkGLtj3vPSUwJikZDamJXBMG5smbOQXV
	BBLcp7srE9jLNZGSERLiFlt4Y4yerpM=
X-Google-Smtp-Source: AGHT+IGFyRd+BYegO6/D6beA7XY/sIg6slB9OxyqJyx+o15XvIYq7E/XS8tz54WBztwLFVG+Qn77mgnd2p8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:fb83:b0:1c0:ac09:4032 with SMTP id
 lg3-20020a170902fb8300b001c0ac094032mr144135plb.9.1694656559883; Wed, 13 Sep
 2023 18:55:59 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:10 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-13-seanjc@google.com>
Subject: [RFC PATCH v12 12/33] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025603_275821_8DBDC5BA 
X-CRM114-Status: GOOD (  18.82  )
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
index b7fa020003f3..3d25c145098d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -953,6 +953,8 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (!mapping)
 			rc = migrate_folio(mapping, dst, src, mode);
+		else if (mapping_unmovable(mapping))
+			rc = -EOPNOTSUPP;
 		else if (mapping->a_ops->migrate_folio)
 			/*
 			 * Most folios have a mapping and most filesystems
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
