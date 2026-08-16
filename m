Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC4CC5DF66
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sy5/LNx6pBK2lRiYUAaj7lWV9NBCoMjDPPZ+IHIBVQQ=; b=AFz90pck5BVRmM
	Rf1/JtvAsrmQVfCeRK4U/OdU1gPubfGisQlWJ1QMi5m16j+LzocJEXJY9eLOm7SGu/STKtQxmltIq
	pRehvIwft+4Lphq/Mmb8qrZOseJxyYnF4v3UC1Oy2vFZRSt3NutH7ZzV1/7wRcF91u+EU1XeUI9F/
	kTY/Oz4LSy8TPfIKpjMTFCkGWxoxvqkj/pW76KSxb0kOhi+WlfEPOgp4MDrnxu9DyPdd06GLH3OpB
	d/VYmeZH7tfhg3pwotr5Z51PZtbXjX2gBqF03hM2eZG6/dT3C+hlW4V/mkJtrklP8UWci9X6YxKzA
	XU4ZM2O3vRwbY6m8Pv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYau-00000004fgl-24KD;
	Sun, 16 Aug 2026 11:00:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvYas-00000004ffk-3t7d;
	Sun, 16 Aug 2026 10:59:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D59860055;
	Sun, 16 Aug 2026 10:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C301F000E9;
	Sun, 16 Aug 2026 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786877998;
	bh=0zXvRlHUb1dGVaacwG9Y/iGMhzo5Pl/L8wZbO2uLtAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BxkOfn6VXnfpjzEv/q4Dlg5AnuN8R3AjObhLqH0Nhb8Qm+HMlKpfhw7MlM7pUcjpx
	 j094iQDlHr8uFSOixHJALZDscK3HM5dSJjMTUZJSzGsE08HWLOUuOiScutS8UdHYdx
	 jTRJq/AyQbxDXEqaKgGOqCLlryQeICddB3wgdUNgRhhhw5CfvMk9L+Ot1f/ozzREIb
	 pduODEEIbS3L4UslReNxhI00hG/eu7x1ASfbqfi1c6Z+g+iXDQzIKXWBBFNaoU/pxl
	 5cmOMyKyPQBHzXHaWoFhw7byGMNzbh2WO3UiuFJSgyZSqt30xw1gIJC5WER1i8Dt3B
	 Mh8FSD60GW7qg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 16 Aug 2026 13:59:25 +0300
Subject: [PATCH 2/6] mm/vmalloc: set area's page_order after allocation
 succeeds
MIME-Version: 1.0
Message-Id: <20260816-execmem-set-vm-perms-v0-2-v1-2-90944a3ad43f@kernel.org>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
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

__vmalloc_area_node() calls set_vm_area_page_order() to set area's
page_order before actually allocating pages to populate the area.

If allocation of large pages in HUGE_VMAP case fails midway, this leaves
the area with elevated page_order throughout the cleanup path.

There is no actual issue with this because the only place that currently
relies on area->page_order on the cleanup path is the loop calculating
the direct map alias range in vm_reset_perms() and it anyway skips
unpopulated pages.

But having set_vm_area_page_order() in the middle of __vmalloc_area_node()
makes things very obscure, hard to reason about and error prone against
future changes of the cleanup path.

Move the call to set_vm_area_page_order() after __vmalloc_area_node()
succeeded where page order is guaranteed.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/vmalloc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 22566e0b6e38..6822f0fe9583 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3901,8 +3901,7 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 		goto fail;
 	}
 
-	set_vm_area_page_order(area, page_shift - PAGE_SHIFT);
-	page_order = vm_area_page_order(area);
+	page_order = page_shift - PAGE_SHIFT;
 
 	/*
 	 * High-order nofail allocations are really expensive and
@@ -4106,6 +4105,14 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
 	if (!ret)
 		goto fail;
 
+	/*
+	 * Set area->page_order once it's known exactly that the order of the
+	 * pages the area contains.
+	 * Even if we succeeded to partially populate the area with large pages,
+	 * still treat the area as populated with order-0 pages.
+	 */
+	set_vm_area_page_order(area, shift - PAGE_SHIFT);
+
 	/*
 	 * Mark the pages as accessible, now that they are mapped.
 	 * The condition for setting KASAN_VMALLOC_INIT should complement the

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
