Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97743C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGjKTUQ71nrEXB3P/jd7w8eX9vUYf9SEkH3hUiCck/0=; b=gPnwsrJB0e2g/x
	Pt2n3UpIMYAiISUnXlRFdU7Th7Mul8AkT1629KFspzyDVKl1eQyYYzkDpnEWTRjJEiJqam8HC0yXE
	or4hKa0pxfbbl2mm+idSH16nigeYABEidCcMzu+J77oO64aw2GGjnUuOuVB4xeOUFIoq+FfxByihs
	JoHEwa9kSQ/sN1bnbWjn+Z2eawmXBz8zGkHLz+hpUnZ5tRgSWRrXWbF5eWHS3q+sDNj2fSP+Vl8UX
	MFwaGq/Foc+lMswMFR4LgWWhBp9UGrHmCHzA1En7XDolBX9rDb4Ze8OmRxd7FL2uhIaihzY1FXgdr
	suk2wx2YqdzrPYlQ2RzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3eL-00GRBx-0Z;
	Thu, 27 Jul 2023 16:15:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP3eI-00GR8m-0E
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 16:15:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB43F61794;
	Thu, 27 Jul 2023 16:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C52C433C8;
	Thu, 27 Jul 2023 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690474532;
	bh=7KNn7rpXw7ac66DODCRLJOwlmnWa2JU1UYOfQjnlV6c=;
	h=From:To:Cc:Subject:Date:From;
	b=JG33lR5+0OHRlzULPn660n4AbtENQnusIBb+FTjjBqxVrOWH7c35Bk08uVaNc3KVc
	 Z8Qi9rPQ0umscUBd6XfeiBld9PKZuzbIO2l1zTAeL5XUiaBFeN+GBSRTbkzeATEnoB
	 8F31rPN4Rk9GThyd6folVj1EEbePHNorW52Ue1zc3hsULePJDA9WsUU4GSvLYO2BPr
	 g8cimU/O1qQqcAQkVYkCbxRKUQitC3PloPf+DEOnDq+YZm91ZOPO/y2eyhWiNdUXlt
	 oKf3M3fTC+T4Qu2EQXfzAATM154Tbcfmmz3dqCp0Qm+CDOeiQAYph0xrCHkz5WgtA+
	 1JXn599RHtEpQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: enable DEBUG_FORCE_FUNCTION_ALIGN_64B
Date: Fri, 28 Jul 2023 00:03:56 +0800
Message-Id: <20230727160356.3874-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_091534_190962_B39CF4E4 
X-CRM114-Status: GOOD (  13.34  )
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

Allow to force all function address 64B aligned as it is possible for
other architectures. This may be useful when verify if performance
bump is caused by function alignment changes.

Before commit 1bf18da62106 ("lib/Kconfig.debug: add ARCH dependency
for FUNCTION_ALIGN option"), riscv supports enabling the
DEBUG_FORCE_FUNCTION_ALIGN_64B option, but after that commit, each
arch needs to claim the support explicitly. I tried the config file in
[1] for both RV64 and RV32, I can't reproduce the build error as [1],
there is no reason for not allowing to enforce this function alignment.

Link: https://lore.kernel.org/lkml/202202271612.W32UJAj2-lkp@intel.com/ [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index fbc89baf7de6..39ffd218e960 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -502,7 +502,7 @@ config SECTION_MISMATCH_WARN_ONLY
 
 config DEBUG_FORCE_FUNCTION_ALIGN_64B
 	bool "Force all function address 64B aligned"
-	depends on EXPERT && (X86_64 || ARM64 || PPC32 || PPC64 || ARC || S390)
+	depends on EXPERT && (X86_64 || ARM64 || PPC32 || PPC64 || ARC || RISCV || S390)
 	select FUNCTION_ALIGNMENT_64B
 	help
 	  There are cases that a commit from one domain changes the function
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
