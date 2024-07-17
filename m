Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B25FC3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 22:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GudNUeBXFAVYmPqNkxHlIXKRQKKOee72suKUTBQc/Jw=; b=p95/h+HK7/4zIq
	YyR3n4fiMh4PstW9KlBiqHs7eahapY3n0DTqlv+2dDE0u3TFs9WA6vDmVFe9Kicd2DxfjOGAdqioO
	nj6w235dEbhPK+sKdgKuNGUts1fXFmFLvDrfFqq0IxWUX961xopNKtYwfhf1rtUIGrxvaeGlFNlgA
	CH8azSXu2pWcAmEywjeZwiPERQpZJn05VoUZ+OBnt+/x7O+km0G7D4S7e61QLCMpNkWz8DO3mGczu
	iUzUtHo35/04nBVWECJRbsjXzUfx4sX7iueW2d9Alxfj25iW4k8yU0tzk0w6MW87/hZYsVMgRZQRO
	xZwLmVDsqrfA4grn9FOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUClA-0000000F42p-0Bjz;
	Wed, 17 Jul 2024 22:04:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUCjG-0000000F3A4-08Vk
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 22:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jtsZY5Ha1GOE7eeXCKiwGrLCKWt0M5FAlFhM8vgy8I=;
	b=JyyrznhH7PKYjfMHJ3adtMwE/px0QtCPV2ihma2ICUkzJDdpoeQTDhKXwJuyWm2iVlFHcC
	Io8iG29tmdBzjIlVoY8UGZqJBv1YPqtSRfh1JVHt6oiCZWHp8b31b4R9owwaRpSgPD/0Ov
	uPLaxCdhEup8snzIfGC0negn50hJDwU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-RE_ail3zP5qJ62vzltAsxg-1; Wed, 17 Jul 2024 18:02:25 -0400
X-MC-Unique: RE_ail3zP5qJ62vzltAsxg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-447f9d993c2so175531cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 15:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253745; x=1721858545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jtsZY5Ha1GOE7eeXCKiwGrLCKWt0M5FAlFhM8vgy8I=;
        b=o+1403LZ96/t6p4ZIGEBIFKGzH8pY3TB6Xf/wbJVm5WW4myBDNDku+su0taMs6nb8H
         N/Iy34cBkbCIEBtxJ/hhvsC1v8rc3AieO2ZuqZ74Z4eFTWTFWM+ynL13a4rRr9A61+K5
         DJEK5e9DH/RZPtBoWntYqSTDHGQyPWfEnfzFSdlWnrlq0xqTQHpZ7lekH9cUM9NzpxHG
         YeHZKzfJzzOhweSYjNqz4OZe1NAkqgW54Zj2KcmGaUljgP6+ivQjntz6XFmg9fQth8Hu
         tFtVkwi4bEIqf+ZDIC7hb8wPf0EzrONyfFeT33mONknk7NKiYp+f/Kvh3QgYKopbMd7d
         ugiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9tt2HvcJruBE2NudNy0hUKtSNRstWHxXkF3/bZlL5huL5lKND5kbIqgb+xiBOg8WJTwMNute+tVeK1PJVE+zSuDeg9xPM9wLKPtY2jP8x
X-Gm-Message-State: AOJu0YzD/lCY3+BIi9De/uzrQOBvgrSscBrzw2wSIhLP00oaX743nkrJ
	92+v1+9wdazJ1N+S74smVsteYSu/5NzkNYK1bLpCuDuI9kuJ8Wybex/uV3HBumBtS5zP3e2Nee6
	QrbaXbD1psan1b3i1YZ2qKPgplrcCVwmMjg7Z4iyy5eTvW8uQRxPcODpnMqNHT+LVWA==
X-Received: by 2002:a05:622a:19a8:b0:446:5a29:c501 with SMTP id d75a77b69052e-44f864afa6cmr22369421cf.1.1721253744673;
        Wed, 17 Jul 2024 15:02:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvRqkcMnpaLn941R1BXuIssxTrm35f8/3mo50id9Lq3VPmnZD9wDrl4u3hs2U9BoucnNtpA==
X-Received: by 2002:a05:622a:19a8:b0:446:5a29:c501 with SMTP id d75a77b69052e-44f864afa6cmr22369171cf.1.1721253744329;
        Wed, 17 Jul 2024 15:02:24 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:23 -0700 (PDT)
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
Subject: [PATCH RFC 1/6] mm/treewide: Remove pgd_devmap()
Date: Wed, 17 Jul 2024 18:02:14 -0400
Message-ID: <20240717220219.3743374-2-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_150230_387837_DB5FC578 
X-CRM114-Status: GOOD (  11.04  )
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

It's always 0 for all archs, and there's no sign to even support p4d entry
in the near future.  Remove it until it's needed for real.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm64/include/asm/pgtable.h             | 5 -----
 arch/powerpc/include/asm/book3s/64/pgtable.h | 5 -----
 arch/x86/include/asm/pgtable.h               | 5 -----
 include/linux/pgtable.h                      | 4 ----
 mm/gup.c                                     | 2 --
 5 files changed, 21 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index f8efbc128446..5d5d1b18b837 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1119,11 +1119,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return 0;
 }
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 5da92ba68a45..051b1b6d729c 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1431,11 +1431,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return pte_devmap(pud_pte(pud));
 }
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 701593c53f3b..0d234f48ceeb 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -311,11 +311,6 @@ static inline int pud_devmap(pud_t pud)
 	return 0;
 }
 #endif
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2289e9f7aa1b..0a904300ac90 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1626,10 +1626,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return 0;
 }
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 
 #if !defined(CONFIG_TRANSPARENT_HUGEPAGE) || \
diff --git a/mm/gup.c b/mm/gup.c
index 54d0dc3831fb..b023bcd38235 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3149,8 +3149,6 @@ static int gup_fast_pgd_leaf(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 	if (!pgd_access_permitted(orig, flags & FOLL_WRITE))
 		return 0;
 
-	BUILD_BUG_ON(pgd_devmap(orig));
-
 	page = pgd_page(orig);
 	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
 
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
