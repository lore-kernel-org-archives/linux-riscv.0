Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99E9E71072
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NVsuyYGOSfXffkbsIKzSxpigkkUZJFRe/FwEbZuTcN0=; b=1yst++X1/Iy9n2
	qQC65w6BhtJ6Bas6Pt5GH9gMu5163KoGwIHM8Kg2LmHspk8NGPI6dtm9muziktZjf62pYwSbtKvWr
	U770xHIkQIBNDZgqNlw1q88B5L+BxYYa9OpehWIU5fm8C62A21yys8J7ilz4R+RE7gYRNM+G5BsF2
	iOuLjW8+2gZZmUjfdwTWOU7f0OGvydcvr7wpGPKiew419B8G2P+b/kuid1PsBithj+WpBpoaYYVi8
	VoFBqKrsGVkq3jSI2aEGi/9i/hIMKYaVfTh3C9k3jmTky661FaZOCWLmdxsZoMByqpCmoCTvhOqcZ
	zyowOoLyJ+AeMVauwytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKR5-006EDa-2y;
	Thu, 21 Sep 2023 14:13:43 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKR2-006EBy-0f
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 14:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695305620; x=1726841620;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zasYRfWXsYur9eNYrfG33BQQNdIZEYY/Xi5N1N8P2TU=;
  b=gHxf72l5LtRaL/2seiBZ1eT4bfZJBkFhorU08t1TerHErc7qomPl2G7M
   ryGtRAhaUXgcuDolMo94/2DsnMesFd8EotAA4PmGW/9uPJmcdsNAlObsY
   /KLBafFf1zkN9qWUyf30WcjIU/1n+B9VL8ZnU/fOA8n1poSzaPIkmA01R
   Xuko5wJo8nwWr3d8qUk1SNQ1ND3a3mcSvqO6B5MGIXrkZE5P4pF/37K/J
   8eAqgrTcMinE3J4T+1d/gi+N6sQ2mcr0b4e5LMnyPQed+GWUbtEobdeN/
   BMCT8eQzObjGmrQ2tnwUCPFMoZbELzkBnzllZwm5C5nBjEuLD7oJAhyL8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383282001"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="383282001"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 07:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="1077899614"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="1077899614"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2023 07:08:16 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] riscv/mm: Fix the comment for swap pte format
Date: Thu, 21 Sep 2023 22:16:52 +0800
Message-Id: <20230921141652.2657054-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_071340_473133_C590EC49 
X-CRM114-Status: GOOD (  10.09  )
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

Swap type takes bits 7-11 and swap offset should start from bit 12.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e05b5dc1f0cb..e94a2998e81e 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -812,7 +812,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
  *	bit            5:	_PAGE_PROT_NONE (zero)
  *	bit            6:	exclusive marker
  *	bits      7 to 11:	swap type
- *	bits 11 to XLEN-1:	swap offset
+ *	bits 12 to XLEN-1:	swap offset
  */
 #define __SWP_TYPE_SHIFT	7
 #define __SWP_TYPE_BITS		5
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
