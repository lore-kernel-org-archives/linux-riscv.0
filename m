Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037AFC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wn5yweTQTzR8lL94PdH11hjNjbVQxMWRuvB7twKKFM4=; b=oDAQYhwudEtZem
	DKyhAlkMpSpKg4E/4BA27DKOCSQWKF9PrDOZjJdzneaC1tZNnAi73U+ULlkcfEZbMUoFWTZZTtQAb
	e74ZRLpI1LmWAsoGuX8QmFFcebgYHMxvmlYOO10Bgq5auwucS/P0EzRDrtSUPneky/hzjSadVC9sw
	x0vYcqglnzVjhFQXMLGc0FqKza8pDqAMb7JGu97yQg/uJG62oLS2teKW72vYX+lAD8wEmbKG4ZYUs
	uOO6SmJRpSuCC4n9mLDzETTu4fRSJwiDob7P7izs5ik4QB5Fi6VcIphRqQdpet8UQ5O22bAxtWH9G
	QmSiQrV1CBIymGrqQi+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewjr-00000005DpW-2hnN;
	Tue, 27 Feb 2024 12:39:15 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewjo-00000005Do4-2yLN
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 12:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709037553; x=1740573553;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WXMtQm657FAu5vA4c7tJQaFJh29ORtj1lqGV9ucikA8=;
  b=dwa3BUYr2H2gsS5mDf7MtAoB35uD8qCYRpoUnEXRUc7UQtbNPpAzOztS
   wrTM/YHOqSg6ERhN962Dq3K790L7x6iQ7+uurd2LtRdSKfgSpD+YkGMJb
   GJfJcIJ98SsAw1iYC0V7UOt1SNJBv/qYNCuVtOIVh/P8goUnFuA01GClf
   wuikrtg7GP+h7DMHJyW4KlErhRR8ccb6qSdM/ueCxmg/MH8Qrsz5MBHmg
   ifYer+MnThVfULp0Djdo0WIyQQeHpC68uqog8Vgy3rW3BCLfS/WByJfh5
   SL/nZXlJL61AJIlJLHA7DKQYeBVCn6plhiDaq90G5E/Ck75n2Zh+7aWNN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3240082"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3240082"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 04:39:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="38062783"
Received: from wufei-optiplex-7090.sh.intel.com ([10.239.158.51])
  by fmviesa001.fm.intel.com with ESMTP; 27 Feb 2024 04:39:07 -0800
From: Fei Wu <fei2.wu@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	jszhang@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Fei Wu <fei2.wu@intel.com>
Subject: [PATCH] riscv: Fix definition of _PAGE_NOCACHE_THEAD
Date: Tue, 27 Feb 2024 20:44:12 +0800
Message-Id: <20240227124412.2565716-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_043913_175384_C698B1D2 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

_PAGE_NOCACHE_THEAD is not used but the definition is wrong.

Signed-off-by: Fei Wu <fei2.wu@intel.com>
---
 arch/riscv/include/asm/pgtable-64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index b42017d76924..b99bd66107a6 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -136,7 +136,7 @@ enum napot_cont_order {
  * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
  */
 #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
-#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
+#define _PAGE_NOCACHE_THEAD	((1UL << 61) | (1UL << 60))
 #define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
 #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
