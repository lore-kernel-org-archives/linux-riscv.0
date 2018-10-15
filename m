Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740B1C04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E1DB2089D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFVPHy7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E1DB2089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szZ2NJsy6ZV/MAazqHQDC4WPqwKpwCA/1uJWDkGdKzw=; b=DFVPHy7WXnbrIp
	oOMKbrpb45e7riceziZRc4psIxpVhZSAVJUBS5SIiDZUgB9Peb2cMtIH9QbyAqst8aAafRBseAwdk
	oAMSStvYAj+NJtw739Vb3CwySlCq6Drb3PnbS5bDsKpaIBjFoOg/EuyQgfOIc5jXwO5MzzN59TF04
	UvM1mkcLlllhaJPL8sABif3/i4dzbJEzzeNE1uRfdgnEZotQdrd6PLOc4SG43tvQuQR6nIqGXIggd
	qi1z4VTObC+iHUZ/7dBx1c7NW6+uoGJ58gVmyjKqW7TZZgGl37RR7RdZgke/qFbIev7Z1smlo5cve
	l1tAcmUwPLmowsG/WE1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC7MY-0001cH-A0; Mon, 15 Oct 2018 18:13:06 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC77R-0008Il-B0; Mon, 15 Oct 2018 17:59:29 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1gC77C-0002II-7K; Mon, 15 Oct 2018 11:57:16 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1gC779-0002Ma-0e; Mon, 15 Oct 2018 11:57:11 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
Date: Mon, 15 Oct 2018 11:56:57 -0600
Message-Id: <20181015175702.9036-2-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181015175702.9036-1-logang@deltatee.com>
References: <20181015175702.9036-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, sbates@raithlin.com, palmer@sifive.com,
 aou@eecs.berkeley.edu, hch@lst.de, akpm@linux-foundation.org, arnd@arndb.de,
 logang@deltatee.com, catalin.marinas@arm.com, will.deacon@arm.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v2 1/6] mm: Introduce common STRUCT_PAGE_MAX_SHIFT define
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_105729_792708_F17B5BBF 
X-CRM114-Status: GOOD (  13.79  )
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
 Will Deacon <will.deacon@arm.com>, Stephen Bates <sbates@raithlin.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015175657.LRziJOXLz-U-EAwpWJC3SvAePw1I9v5yM2RGZnDg24Q@z>

This define is used by arm64 to calculate the size of the vmemmap
region. It is defined as the log2 of the upper bound on the size
of a struct page.

We move it into mm_types.h so it can be defined properly instead of
set and checked with a build bug. This also allows us to use the same
define for riscv.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
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
index 787e27964ab9..6a0b5c5a61af 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -615,14 +615,6 @@ void __init mem_init(void)
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
index 5ed8f6292a53..ec8c16d9396b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -206,6 +206,11 @@ struct page {
 #endif
 } _struct_page_alignment;
 
+/*
+ * Used for sizing the vmemmap region on some architectures
+ */
+#define STRUCT_PAGE_MAX_SHIFT	ilog2(roundup_pow_of_two(sizeof(struct page)))
+
 #define PAGE_FRAG_CACHE_MAX_SIZE	__ALIGN_MASK(32768, ~PAGE_MASK)
 #define PAGE_FRAG_CACHE_MAX_ORDER	get_order(PAGE_FRAG_CACHE_MAX_SIZE)
 
-- 
2.19.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
