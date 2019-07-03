Return-Path: <SRS0=iddv=VA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47044C06513
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2019 12:24:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2041E218A3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2019 12:24:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kz6Y4OJc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2041E218A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFr08bmbc5GW8cWhBLmJ9pSJ4/kZSCLsolNYk7Szs6o=; b=kz6Y4OJcHWIYii
	P/C0rtbsmXXmkXUVv2wL663AzcX9knzD6ryEWXs3ZLabUuV7gn6qVPGs21Mpcw1gac9+JQJLcWQfp
	WtseAERZtBn1U6SLYv54JTw532DApQF7twNJVNv704IY/mZNXGFCcZdhiho0a4lLgDzowKQXinR+S
	nunN4SbaQRw/6njvy1k6XL/Q0iRTcyUJEHK7A69YFWxiDfxKHVmNEoI+HuT/Oi7BGOxUj9nFr96KY
	fWFs/Ung2Ijniqatae/GSSWVs77HW7PP5FWAcoTjtSdsoULfaS7PV3O4lSriwSF7Co/l1N+WcttxM
	80EcxD3Vs6EYVOUBF2ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hieIw-0002Kt-TS; Wed, 03 Jul 2019 12:24:06 +0000
Received: from [12.46.110.2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hieIp-0002Fp-Lr; Wed, 03 Jul 2019 12:23:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/3] mm: fix the MAP_UNINITIALIZED flag
Date: Wed,  3 Jul 2019 05:23:57 -0700
Message-Id: <20190703122359.18200-2-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We can't expose UAPI symbols differently based on CONFIG_ symbols, as
userspace won't have them available.  Instead always define the flag,
but only respect it based on the config option.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/xtensa/include/uapi/asm/mman.h    | 6 +-----
 include/uapi/asm-generic/mman-common.h | 8 +++-----
 mm/nommu.c                             | 4 +++-
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/xtensa/include/uapi/asm/mman.h b/arch/xtensa/include/uapi/asm/mman.h
index be726062412b..ebbb48842190 100644
--- a/arch/xtensa/include/uapi/asm/mman.h
+++ b/arch/xtensa/include/uapi/asm/mman.h
@@ -56,12 +56,8 @@
 #define MAP_STACK	0x40000		/* give out an address that is best suited for process/thread stacks */
 #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
 #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
-#ifdef CONFIG_MMAP_ALLOW_UNINITIALIZED
-# define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
+#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
 					 * uninitialized */
-#else
-# define MAP_UNINITIALIZED 0x0		/* Don't support this flag */
-#endif
 
 /*
  * Flags for msync
diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
index abd238d0f7a4..cb556b430e71 100644
--- a/include/uapi/asm-generic/mman-common.h
+++ b/include/uapi/asm-generic/mman-common.h
@@ -19,15 +19,13 @@
 #define MAP_TYPE	0x0f		/* Mask for type of mapping */
 #define MAP_FIXED	0x10		/* Interpret addr exactly */
 #define MAP_ANONYMOUS	0x20		/* don't use a file */
-#ifdef CONFIG_MMAP_ALLOW_UNINITIALIZED
-# define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be uninitialized */
-#else
-# define MAP_UNINITIALIZED 0x0		/* Don't support this flag */
-#endif
 
 /* 0x0100 - 0x80000 flags are defined in asm-generic/mman.h */
 #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
 
+#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
+					 * uninitialized */
+
 /*
  * Flags for mlock
  */
diff --git a/mm/nommu.c b/mm/nommu.c
index d8c02fbe03b5..ec75a0dffd4f 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -1349,7 +1349,9 @@ unsigned long do_mmap(struct file *file,
 	add_nommu_region(region);
 
 	/* clear anonymous mappings that don't ask for uninitialized data */
-	if (!vma->vm_file && !(flags & MAP_UNINITIALIZED))
+	if (!vma->vm_file &&
+	    (!IS_ENABLED(CONFIG_MMAP_ALLOW_UNINITIALIZED) ||
+	     !(flags & MAP_UNINITIALIZED)))
 		memset((void *)region->vm_start, 0,
 		       region->vm_end - region->vm_start);
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
