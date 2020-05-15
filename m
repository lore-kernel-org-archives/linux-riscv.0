Return-Path: <SRS0=LZsr=65=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22123C433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 May 2020 14:41:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E905220671
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 May 2020 14:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DLBiHYnq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E905220671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nX/OxofzDc3fd8yYsXOf0skifLYVUPlkWiksPKDCM7I=; b=DLBiHYnqpdRebc
	P/0WjAh+wbjI+fA5nzF8YrA2/Acn4SferOOtXICK0OMaUbjzCkF0pDOkhRluSnV+msHs06voC5c68
	kcOCAVpxkDzGOY55y+j/pA0QYiMQb41zN0jwk/roQAEJsCpnVecCw1iaiawS3vylEkdRujmJav/kX
	cvk5J0BtkVgbs+jt0ZvtrqNitMCQVegsJpwGzwm2GSXG72RgDVEqxyvEGpEWzI6047a1Q43OGMt3c
	CltnBgjclSHYOtXQhzQeOi6DB6zowKaIYGObgdU3ufScF4BDBNtPXmkNWevT83h0e0SDAZ1hwRmo3
	DomA3vLuzcFur1z+OTEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZbWU-0002WX-1z; Fri, 15 May 2020 14:41:14 +0000
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSW-00041m-AW; Fri, 15 May 2020 14:37:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Subject: [PATCH 07/29] asm-generic: improve the flush_dcache_page stub
Date: Fri, 15 May 2020 16:36:24 +0200
Message-Id: <20200515143646.3857579-8-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

There is a magic ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE cpp symbol that
guards non-stub availability of flush_dcache_pagge.  Use that to
check if flush_dcache_pagg is implemented.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/cacheflush.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/cacheflush.h b/include/asm-generic/cacheflush.h
index bf9bb83e9fc8d..bbbb4d4ef6516 100644
--- a/include/asm-generic/cacheflush.h
+++ b/include/asm-generic/cacheflush.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_GENERIC_CACHEFLUSH_H
 #define _ASM_GENERIC_CACHEFLUSH_H
 
-#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
-
 /*
  * The cache doesn't need to be flushed when TLB entries change when
  * the cache is mapped to physical memory, not virtual memory
@@ -42,12 +40,14 @@ static inline void flush_cache_page(struct vm_area_struct *vma,
 }
 #endif
 
-#ifndef flush_dcache_page
+#ifndef ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE
 static inline void flush_dcache_page(struct page *page)
 {
 }
+#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
 #endif
 
+
 #ifndef flush_dcache_mmap_lock
 static inline void flush_dcache_mmap_lock(struct address_space *mapping)
 {
-- 
2.26.2


