Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E21C5DF97
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRPyIo7QAnk9Oq+gYO/ZB0ZlrDqliIx/WziRhvnswrk=; b=vasWxvLHP4hGNj
	lW7FUwDo7Eq7oWM/H9OBiRDM9/XSxa/7CjYN+4v0e9EI83w2ezH9wXwjhXQhpsNUE3Mut2DiEv9ge
	fFhZ4bCKw5yneCMmgJeDzJjMQBEO1e6UfHWkgj7aZv+3lhKULYmo47OaLdiXFfChRdvizSK4qedCu
	ReFaxlkSKwcPDYOeQMl3muAyVOC/cKyIJTmUAvz/zlrakrTEs5jCNIcuWFM2j8uvlktNaqcdMkhd8
	7rVL6BVenX40FCqfDUVoAEoQ/sMS+qj+kP+qdV8hCr7K3LxfhixMNrrxXAB/77B47MujcY5dC/V7H
	nAYAs7yg5WKMYqmbjBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6fK-0000000FILh-2K2h;
	Sun, 23 Aug 2026 11:47:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6fI-0000000FIJk-3PMS;
	Sun, 23 Aug 2026 11:47:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D5F9600C8;
	Sun, 23 Aug 2026 11:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879281F000E9;
	Sun, 23 Aug 2026 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787485623;
	bh=JNbaKBJKZiPBWFXiQZSzBAcWECdyW1psqwwnhscXogA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MIM7FsVqFQDwxEVqELOzWyRouVAcV/zT99s47WF8sDGz0/F3hE64vb8Nc7ZGQ6TZQ
	 guKkDJgym0SQoUX7GbxQVEzrbPfAdBfUlyqfFTws30j9T4oZBaJ7m1FzhBRlM8Y541
	 hk6+RYrgiHCw7kuAJrpr8CJzF6KPkdCCz8i4QVZemN8l3ab46v110aaqS4AR28vYwb
	 XER8Eo2D0JhPLqBYOMP72mYryOFYB59Iciip8vmWeHAvcBSgfnOEyWj3W057KVdhr+
	 06QPG/smqTW3N4dHyZfBcpY04dITAwYDaqovV12DxZIUwhAjWFVLe3/5Bz9DqWxsND
	 NhbUa8zPT1Xug==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 23 Aug 2026 14:46:15 +0300
Subject: [PATCH v2 4/6] mm/vmalloc: make set_area_direct_map HUGE_VMAP
 friendly
MIME-Version: 1.0
Message-Id: <20260823-execmem-set-vm-perms-v0-2-v2-4-b013a37d84b3@kernel.org>
References: <20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org>
In-Reply-To: <20260823-execmem-set-vm-perms-v0-2-v2-0-b013a37d84b3@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Len Brown <lenb@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Gleixner <tglx@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, 
 Will Deacon <will@kernel.org>, x86@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 loongarch@lists.linux.dev
X-Mailer: b4 0.17-dev
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

set_area_direct_map() always updates direct map alias permissions in
single page increments.

For HUGE_VMAP areas it's suboptimal. Not only the loop in
set_area_direct_map() needlessly has more iterations (e.g times 512 on
x86), but it also causes fragmentation of the direct map that could be
avoided for the HUGE_VMAP areas populated with large pages.

All pages in an area are always of the same order: either same-order
large pages when VM_ALLOW_HUGE_VMAP is set and all huge pages were
successfully allocated, or order-0 page when VM_ALLOW_HUGE_VMAP is
cleared or when huge pages allocation fails and fallback path is taken.

Instead of updating the direct map permissions for every order-0 page in
an area, use the area's page_order as the loop increment and update the
large pages in one call to set_direct_map_{invalid,default}_noflush().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/vmalloc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a3e2e4244c0f..395358b363fc 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3361,12 +3361,15 @@ static inline void set_area_direct_map(const struct vm_struct *area,
 				       int (*set_direct_map)(struct page *page,
 							     unsigned int nr))
 {
-	unsigned long i;
+	unsigned int nr = (1U << vm_area_page_order(area));
+
+	for (unsigned long i = 0; i < area->nr_pages; i += nr) {
+		if (page_address(area->pages[i])) {
+			int err = set_direct_map(area->pages[i], nr);
 
-	/* HUGE_VMALLOC passes small pages to set_direct_map */
-	for (i = 0; i < area->nr_pages; i++)
-		if (page_address(area->pages[i]))
-			set_direct_map(area->pages[i], 1);
+			WARN_ON_ONCE(err);
+		}
+	}
 }
 
 /*

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
