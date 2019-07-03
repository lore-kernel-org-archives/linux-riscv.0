Return-Path: <SRS0=iddv=VA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15844C06514
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2019 12:24:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3538218A5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2019 12:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iItr8e6y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3538218A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNkRToRXwq0KKbhpYxWta8peUZiGxV2kXb/Jc4ZzvfI=; b=iItr8e6yf1CCOt
	ydJH3YOnnizXoFwNwzs1dKfLKEsq+8Dkkp3r766UbWF09YdA9SQTROWXjfydTwJsd2QdnxDCsQxui
	dCfoLONC+RwGzYw0IJFvUyH4JhLIPB3xwQky0eayi/AkxTFRdFOmwgX+PvV8oKhILqq7IIMFJLImX
	g8AGt9dT5tE8wkojZe8H+5SO46CH+paaqQ0d3gLvZ4JgBLh07uFUpvtuwWbIDqpHdJOdEepc33uf+
	vA2mrTpBCp9up92l9168BUkt7xqfo2P4yTEKQKmTQuEBW2wYnnNLthjhMCFpL2Vp4hVy75xZVx2q6
	rXU1FkGXN2LmlDptpLTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hieIz-0002Ny-P5; Wed, 03 Jul 2019 12:24:09 +0000
Received: from [12.46.110.2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hieIq-0002G1-4b; Wed, 03 Jul 2019 12:24:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/3] mm: stub out all of swapops.h for !CONFIG_MMU
Date: Wed,  3 Jul 2019 05:23:59 -0700
Message-Id: <20190703122359.18200-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703122359.18200-1-hch@lst.de>
References: <20190703122359.18200-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The whole header file deals with swap entries and PTEs, none of which
can exist for nommu builds.  The current nommu ports have lots of
stubs to allow the inline functions in swapops.h to compile, but
as none of this functionality is actually used there is no point
in even providing it.  This way we don't have to provide the stubs
for the upcoming RISC-V nommu port, and can eventually remove it
from the existing ports.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/swapops.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 4d961668e5fc..b02922556846 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -6,6 +6,8 @@
 #include <linux/bug.h>
 #include <linux/mm_types.h>
 
+#ifdef CONFIG_MMU
+
 /*
  * swapcache pages are stored in the swapper_space radix tree.  We want to
  * get good packing density in that tree, so the index should be dense in
@@ -50,13 +52,11 @@ static inline pgoff_t swp_offset(swp_entry_t entry)
 	return entry.val & SWP_OFFSET_MASK;
 }
 
-#ifdef CONFIG_MMU
 /* check whether a pte points to a swap entry */
 static inline int is_swap_pte(pte_t pte)
 {
 	return !pte_none(pte) && !pte_present(pte);
 }
-#endif
 
 /*
  * Convert the arch-dependent pte representation of a swp_entry_t into an
@@ -375,4 +375,5 @@ static inline int non_swap_entry(swp_entry_t entry)
 }
 #endif
 
+#endif /* CONFIG_MMU */
 #endif /* _LINUX_SWAPOPS_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
