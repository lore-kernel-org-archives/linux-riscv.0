Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44041C0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 05:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kPBTSAflbqRXCCRFd6CKDQM+Z1rMSw5qWmPsuUhNnDM=; b=qweQFEQf15TpLH
	hY1OGhFe5gu+wbbWj0Vaxk2n8DkC00XyqVajqXuw3NsklQ5PWOGWIYCav07KbuTgmdL1v20Y04ANR
	sRI/286qIqBWWYe4qV/wvPvJ9vD37IOJ1zzaaSUT+5EOocAXCJlSJUjQtjjnhu+hnfCS1QeJFeFQT
	6/exFTweMGFLeJBS4YcQpvxhEC6nclcDbnqR2bAed30AOolnKQ54lnlNkBtWAMuU5NEpT9KGMPbe7
	XroDu6cXDupq/B8D003bogbaP3C5xUxjdKmxg+VGkIrJqNhkHvSk4PEoj5Lx1U2D70Cr6P+myX3hU
	Ay8kuTADgcnGA2Vj6j+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRCN-006iYh-1Q;
	Thu, 03 Aug 2023 05:48:35 +0000
Received: from [134.134.136.24] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRCK-006iY9-2u
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 05:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691041712; x=1722577712;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fuHR5vlg0Pj/rQJGG+2yi4N34sEiicrfjR7PExpvW5w=;
  b=Ejm1PIR2E0SPuPvUynIMfk4/RjqcxQ8taAPSJUlfvO0OYj3tD+udGME1
   0hTP339yrMLig4z+kTVW+mxmR+4Lak+PhErDuKannU+JrWxag2tsYEFTD
   YVCHxoDCTWkNIhShsDPNQM44FRILd78+H69r3ju4hvslyZiRZ16zyUmEI
   H7qhmp5lpXGrSIEGNh5Mtqa/vWIm9VS/3xTgKQSoWLCuB+bvdgO6oP+cD
   QlsfAKrXFd3lDBgvbUH9zG59hcWfZ3MZGRQukda9y3nCopIcZELRgg9Cf
   RZh4jZT3P1Mh+ZK5XmEykvo4OyKkiCv6oan72W5naBQgGQM44UwQsAs4N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372510833"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="372510833"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 22:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="732629455"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="732629455"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by fmsmga007.fm.intel.com with ESMTP; 02 Aug 2023 22:48:25 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: ardb@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] efi/riscv: libstub: Fix comment about absolute relocation
Date: Thu,  3 Aug 2023 13:56:11 +0800
Message-Id: <20230803055611.2343011-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_224833_006380_0288DF63 
X-CRM114-Status: UNSURE (   9.07  )
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

We don't want absolute symbols references in the stub, so fix the double
negation in the comment.

Fixes: d7071743db31 ("RISC-V: Add EFI stub support.")
Cc: stable@vger.kernel.org
Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 drivers/firmware/efi/libstub/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index b0f8c495c10f..ed6e8ebd89b4 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -146,7 +146,7 @@ STUBCOPY_RELOC-$(CONFIG_ARM64)	:= R_AARCH64_ABS
 
 # For RISC-V, we don't need anything special other than arm64. Keep all the
 # symbols in .init section and make sure that no absolute symbols references
-# doesn't exist.
+# exist.
 STUBCOPY_FLAGS-$(CONFIG_RISCV)	+= --prefix-alloc-sections=.init \
 				   --prefix-symbols=__efistub_
 STUBCOPY_RELOC-$(CONFIG_RISCV)	:= R_RISCV_HI20
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
