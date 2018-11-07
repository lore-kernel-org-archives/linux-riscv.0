Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3446C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 17:39:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A37820862
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 17:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+/M/KeS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n7Yo6UQ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A37820862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HFVQR431xhZ0PzmrEDPgQOHxK/Xq2Rhd+kKwaXAbi8=; b=G+/M/KeSB4ynrX
	A6CtsgTWKLaZZP7XzVQ9eoCZApjTMKzdCUcXgkyF3atHFsYzBtJqCQPbPkmV84Hb5KNL7e79o4ZCN
	RiAJOzs2/wYEQvU7nrp3DQ3GVOLxtigP7PST/mMkQ7G9zae5GS/v2K94boYoCj95ZgeYcfhOLHmUo
	eu0cDEIffHe44CqQ55T5uvH6SuvfDS5VJKAtQbfPMHhQQCAtymN54Jkyush2cZXIYrp8EGqfRhYX6
	lQn2UCIGaZ29IphHt7qUYASCf4/fZ30T7mYp1i8Xw7GINCqARohJu5mX0A7KYFVoibXHwPpg/A47H
	SnhH6jjmio4jnFyf8efA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKRnt-0000qk-G6; Wed, 07 Nov 2018 17:39:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKRnY-0000Hv-BG; Wed, 07 Nov 2018 17:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Subject:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Izl7FQIjX6vtgzV3Bh7GUeX8NbhWtWlS4nwo7NYT9mE=; b=n7Yo6UQ6RvpxhpMsIN2sMhf0ZZ
 muiq8pY5Qug8Ii8LXnvczvy9M19b+WxQPdlGifP+Ax6UqZSRG6ovCbEwTi9n8EWC5KoI1NJG2gnS0
 IG5xMOowr55CswHeaA2CVYeqDlspL23DTCMUyc70LVrwXuh6cA0pBQGRwumtishG6lE4sKaOjTR3w
 mWNiDNhr9RZ9bbd8AzSEJ2hQAYVFp9m67nJ01JiC1gVS6H+kpiofh3pmn0z0ggElm12daOhwIwxff
 JBuYqZP9VfiUYVF5NP3vZ/f2r0asUFFFHcx8VhqNpucqqyM9SgDZsZn6gsPHOi72DJ1wBxUIBBEqP
 t0/Gh7qw==;
Received: from ale.deltatee.com ([207.54.116.67])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKRnT-0003sv-Ms; Wed, 07 Nov 2018 17:39:22 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1gKRnB-0003U5-I0; Wed, 07 Nov 2018 10:39:02 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1gKRnA-0006HQ-Fv; Wed, 07 Nov 2018 10:39:00 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Date: Wed,  7 Nov 2018 10:38:58 -0700
Message-Id: <20181107173859.24096-2-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181107173859.24096-1-logang@deltatee.com>
References: <20181107173859.24096-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sh@vger.kernel.org,
 akpm@linux-foundation.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, arnd@arndb.de, logang@deltatee.com,
 catalin.marinas@arm.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 1/2] mm: Introduce common STRUCT_PAGE_MAX_SHIFT define
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_173920_508617_0486A22A 
X-CRM114-Status: GOOD (  19.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Stephen Bates <sbates@raithlin.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107173858.uQSLCuX8BvDF1Vy0UU7u2-dnlKjyoLt49lCapVisPNo@z>

This define is used by arm64 to calculate the size of the vmemmap
region. It is defined as the log2 of the upper bound on the size
of a struct page.

We move it into mm_types.h so it can be defined properly instead of
set and checked with a build bug. This also allows us to use the same
define for riscv.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/memory.h | 9 ---------
 arch/arm64/mm/init.c            | 8 --------
 include/asm-generic/fixmap.h    | 1 +
 include/linux/mm_types.h        | 5 +++++
 4 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index b96442960aea..f0a5c9531e8b 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -34,15 +34,6 @@
  */
 #define PCI_IO_SIZE		SZ_16M
 
-/*
- * Log2 of the upper bound of the size of a struct page. Used for sizing
- * the vmemmap region only, does not affect actual memory footprint.
- * We don't use sizeof(struct page) directly since taking its size here
- * requires its definition to be available at this point in the inclusion
- * chain, and it may not be a power of 2 in the first place.
- */
-#define STRUCT_PAGE_MAX_SHIFT	6
-
 /*
  * VMEMMAP_SIZE - allows the whole linear region to be covered by
  *                a struct page array
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9d9582cac6c4..1a3e411a1d08 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -612,14 +612,6 @@ void __init mem_init(void)
 	BUILD_BUG_ON(TASK_SIZE_32			> TASK_SIZE_64);
 #endif
 
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-	/*
-	 * Make sure we chose the upper bound of sizeof(struct page)
-	 * correctly when sizing the VMEMMAP array.
-	 */
-	BUILD_BUG_ON(sizeof(struct page) > (1 << STRUCT_PAGE_MAX_SHIFT));
-#endif
-
 	if (PAGE_SIZE >= 16384 && get_num_physpages() <= 128) {
 		extern int sysctl_overcommit_memory;
 		/*
diff --git a/include/asm-generic/fixmap.h b/include/asm-generic/fixmap.h
index 827e4d3bbc7a..8cc7b09c1bc7 100644
--- a/include/asm-generic/fixmap.h
+++ b/include/asm-generic/fixmap.h
@@ -16,6 +16,7 @@
 #define __ASM_GENERIC_FIXMAP_H
 
 #include <linux/bug.h>
+#include <linux/mm_types.h>
 
 #define __fix_to_virt(x)	(FIXADDR_TOP - ((x) << PAGE_SHIFT))
 #define __virt_to_fix(x)	((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_SHIFT)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 5ed8f6292a53..2c471a2c43fa 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -206,6 +206,11 @@ struct page {
 #endif
 } _struct_page_alignment;
 
+/*
+ * Used for sizing the vmemmap region on some architectures
+ */
+#define STRUCT_PAGE_MAX_SHIFT	(order_base_2(sizeof(struct page)))
+
 #define PAGE_FRAG_CACHE_MAX_SIZE	__ALIGN_MASK(32768, ~PAGE_MASK)
 #define PAGE_FRAG_CACHE_MAX_ORDER	get_order(PAGE_FRAG_CACHE_MAX_SIZE)
 
-- 
2.19.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
