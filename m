Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4F4CA0FF6
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 02:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oILtTulDF3xpTi/JI/uBJ0Nnond6N/k7W/G8owom644=; b=qj5rAQCdgtXBMX
	eznW37LeSSEveSPLA8z7+tsPd22X/cvKg13qBFgFsEsVE7TkZsX3rbJ894EDa7RToSkVTEm6Zg6sk
	N9Fhvy+iC/DMoH/WRpxDfongr2heKue/7br8ZSwSlB/KD3YGg9SBXC2/zElzQEmFZjgwB+WRL5TTn
	2/ecx7GQcdZIwRw1AcM55u9C9opQXgC+rNx6872juAb1iOQJCl7KtHdWJuDHAj6P9rdDPv85RoJsp
	373yRGdSjn8vTdu0aTB3YkEh1IZD/4P8BlI/jH+35LnuQkg3a1Hu+1d/DzcWUSMq/RR4jtX7K+Re0
	4HcaAiYtutGCojW6BJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcGBZ-000pBP-0t;
	Sat, 02 Sep 2023 02:16:29 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcGBX-000pAg-0G
	for linux-riscv@lists.infradead.org;
	Sat, 02 Sep 2023 02:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693620987; x=1725156987;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QQJudmV/d8S0VGYKMNHaf/x+fCWhFZ7iX/FdKSi9lNw=;
  b=JWFQgpeVxnsVQgOz5MteS/gd6v6G1A0iCpjYyyI+tKCFXLD1m19BkdVg
   YkUJze+MSWwed/fvTo+OuL9sUobKbTLnyiuu8zvLL+mMVcDfPVpPzFeJS
   hOmueg15V6/GG2Wr88JCZ/dAr8qLema0lTSLpX2vtS6T6cgnpsUA4k/bc
   TXPh/0SpGR4d6kEzqpI7QKtTScppBapytFEpgnf4fuBa/F3prPyn9TgTC
   uCbQWUzjGHpRRlIhiK4DaGJldOT/8i9FGaVOiXjIiDFd7Wp/g4oGfKJOM
   XB5G/pyqhHkgXLcfFZRi/r8RBEmqA4nQpZvU1KyweiGpiFijoKWhc5C+3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355839429"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="355839429"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 19:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863743767"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="863743767"
Received: from xiao-desktop.sh.intel.com ([10.239.46.158])
  by orsmga004.jf.intel.com with ESMTP; 01 Sep 2023 19:16:21 -0700
From: Xiao Wang <xiao.w.wang@intel.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: jszhang@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [PATCH] riscv: alternative: remove alternative boundary symbols in vdso
Date: Sat,  2 Sep 2023 10:25:10 +0800
Message-Id: <20230902022510.818602-1-xiao.w.wang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_191627_196784_24156C42 
X-CRM114-Status: UNSURE (   8.34  )
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

Instruction patching for vdso is based on elf header parsing to get the
beginning and ending of .alternative section, the __alt_start and __alt_end
symbols defined in vdso linker script are not used, so this patch removes
them.

Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 82ce64900f3d..d43fd7c7dd11 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -42,9 +42,7 @@ SECTIONS
 
 	. = ALIGN(4);
 	.alternative : {
-		__alt_start = .;
 		*(.alternative)
-		__alt_end = .;
 	}
 
 	.data		: {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
