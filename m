Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061E5EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjVExiKA8XKV8TJX0SKPqOP8RZ894+yyUHXeJ7LJfks=; b=q2TMGdRWMJPkNc
	gTSr8p+ljgYT4ZhjHV6A79I6QtYlnPjtAwwOjGK0uPmksXNPVwpSMN9d9B0n8UTo3TQvvN1TmVNuo
	NXVX4sjhy+HbDNqooTH3sJPu0Wum3W5NL5oCnS0kE7f3O6LSWpgRXPfyLysdmdauPGUYObUiuTZct
	8kc2l+nkIcYcpKNsxbheq8ZCoHGH04bezpboOXdhDvttUQWsjMCyC0Liy1hu3KYRzJdAF7ckEJ1rx
	P5ARDxsFvUjYMQdIAxuU7eEF/IVViqc3c12vW9Wsmc13VeN9pOR3T5yMSLi+gmRB/Wf4+trE59vmy
	D0N516lzLV/J3kA0YoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzdw-005FkR-32;
	Wed, 19 Jul 2023 05:22:33 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzc1-005Dg5-0H
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=muvilKyoWvn1tarN80afquV4Wd3ZvyUZATzGD2ucPnA=; b=Ine+dMLeKei6ZpuGq61mbJgGV3
	jUnZqObjMIFezFeqoS65AGvZWbJLDR+48qPp2PqiEDnVbwnbOIVDeqNWaXAkbJ8puguU9+qQk9jg1
	cWCJdsEqcH0WDtnQ/GxpOn/DTgRJ9mcgnEpsEpVsplqpkjPlC373ceuHwGLHt9M/TswWGDsNZZTKb
	uXafaz9j9L7N2yHB7kjC5B+hGBXZHL8VScealv5nxrMuX4qsDqSasyEHD2NAya7nermhvV9KNsyqK
	sVSXeReKezyJOEgj5yRjH40cDo6q800bJlJ8l7tiduza46ittPf8h7jIYG+XWAZGnwEQ0l8DHsyzn
	xcrLjrjA==;
Received: from mail-oa1-f73.google.com ([209.85.160.73])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuS4-005Qft-Iq
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:49:58 +0000
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-1ba5121da9eso6760063fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724131; x=1692316131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=muvilKyoWvn1tarN80afquV4Wd3ZvyUZATzGD2ucPnA=;
        b=dy1/NFlQGuJqswhd4jyp5/5Y2DKjXWq8ZhDnL7jyfQUkTP7A9Hvq/HvrZglV4JQg4M
         0K4GnyosjYX3JEla9t9lm8LJXLHv4GUKKzg9xFm9cJWrlQ5Qmy5LmSHitAR/Xzi9H8/Y
         MjJIFDOPL8g3wik3LCZjllYyd45Gr2H0qgazCaqc+yiHTFw7sn+VQEAa9DzzRpRQoil4
         OF2suL13dOrJbxrD1Es2a+3MSZoSnJ4hgva3/KXiELtegBBB1WkzGy/iAanliFh6iYW0
         B8x8MynR4QN8rTTnTiUPKbxJnJ7ZIBs38bI6aS2sGXphM22HDrUDYnhUpurmEDIvnFzg
         o5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724131; x=1692316131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muvilKyoWvn1tarN80afquV4Wd3ZvyUZATzGD2ucPnA=;
        b=fpk0qJhoXO+IL4uCjChpXhl9BewhPqzrHZErq6IeBk0uMqkCyhvImTf9oOQMoyOsZF
         cdTUB6zYDjMXR3/Spzwar3HaQ9YGOWYWTDp2jqQTU60hRdliLkozKc81SgL/K5JQ0Wqk
         giwoyalq6Ld1q5RYbjdmpcpd88Fcgc6y12XKh8nxL+XAcb8bIZf0h8GOZCJE7PpUH9An
         soHyP7XeBAzxqaAdL3QSGALnOUxt5qMySBSjOaXPzHfLHouJJM8CnTm6BpR3GIS+zXR1
         YQYNk9fkLJLV5WVLxdyFR3WLN9jSzcwAQbGdzTvcYeKT3Np5XO63GDfyb9lGxTNfPUJc
         Hyxw==
X-Gm-Message-State: ABy/qLbskILVcWacp8SiR3RsdcUCPDmszXBEE9nMGuQOqlLi74Adj0vw
	ltvKBsgtnQ+DCHUZjCe4fCHdh/qm0WU=
X-Google-Smtp-Source: APBJJlE49QI+GKjHT7/jwtmKHpb+kXt66N6K7QDVRkzJgeGH+MWu0bF/51TSJcseqrb6U54aALrx+EClwNQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6870:c796:b0:1b0:20bd:eef with SMTP id
 dy22-20020a056870c79600b001b020bd0eefmr758790oab.2.1689724131216; Tue, 18 Jul
 2023 16:48:51 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:53 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-11-seanjc@google.com>
Subject: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
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
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004956_640366_3531EDEC 
X-CRM114-Status: GOOD (  10.95  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/pagemap.h | 11 +++++++++++
 mm/compaction.c         |  4 ++++
 mm/migrate.c            |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 716953ee1ebd..931d2f1da7d5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -203,6 +203,7 @@ enum mapping_flags {
 	/* writeback related tags are not used */
 	AS_NO_WRITEBACK_TAGS = 5,
 	AS_LARGE_FOLIO_SUPPORT = 6,
+	AS_UNMOVABLE	= 7,	/* The mapping cannot be moved, ever */
 };
 
 /**
@@ -273,6 +274,16 @@ static inline int mapping_use_writeback_tags(struct address_space *mapping)
 	return !test_bit(AS_NO_WRITEBACK_TAGS, &mapping->flags);
 }
 
+static inline void mapping_set_unmovable(struct address_space *mapping)
+{
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
index dbc9f86b1934..a3d2b132df52 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
 			goto isolate_fail_put;
 
+		/* The mapping truly isn't movable. */
+		if (mapping && mapping_unmovable(mapping))
+			goto isolate_fail_put;
+
 		/*
 		 * Only allow to migrate anonymous pages in GFP_NOFS context
 		 * because those do not depend on fs locks.
diff --git a/mm/migrate.c b/mm/migrate.c
index 24baad2571e3..c00a4ca86698 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -954,6 +954,8 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (!mapping)
 			rc = migrate_folio(mapping, dst, src, mode);
+		else if (mapping_unmovable(mapping))
+			rc = -EOPNOTSUPP;
 		else if (mapping->a_ops->migrate_folio)
 			/*
 			 * Most folios have a mapping and most filesystems
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
