Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9820C2B9F7
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 03:01:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F06161415
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 03:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F06161415
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=765PJ+MmsUeqSsFztQhRtsan2dVBsxhUpQEmx408grM=; b=pggIDRZKk/wr46
	WQMRW3lGKRcUm5va24nEATPbHvfiHccMF3joOgYBx56UdDAIMOs8EE5JsjICw4LBbQ5MxIx52/NEr
	ihdw3xshmEQmE9oTkeC4lqDmqxtSmmRoJuwFBpFpsVZ1k1yMrO2QZY4quaHzqAKtrsrHFAco8Zzol
	01UsS0CWPZpbs0a7Vqcz2QI3LOqd7+XLMMJzUdbj6vJsb+RcfEswK8Lw0/IE17T/EcBki9gz1Sjmi
	+YbTYjEARFTxSY7EagxUwKt3hna2HgKV71Ebd3VW55Dl6Yan7wFSeBbyi7vuyylAsFXThDtlSlXLh
	rrfqfLAXMpFgmfA9wwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llNJf-0032g5-42; Tue, 25 May 2021 03:01:11 +0000
Received: from [2601:1c0:6280:3f0::7376] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1llKgx-002UXF-4Y; Tue, 25 May 2021 00:13:03 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-mm@kvack.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Nanyong Sun <sunnanyong@huawei.com>
Subject: [PATCH -next] riscv: TRANSPARENT_HUGEPAGE: depends on MMU
Date: Mon, 24 May 2021 17:13:02 -0700
Message-Id: <20210525001302.27779-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

Fix a Kconfig warning and many build errors:

WARNING: unmet direct dependencies detected for COMPACTION
  Depends on [n]: MMU [=n]
  Selected by [y]:
  - TRANSPARENT_HUGEPAGE [=y] && HAVE_ARCH_TRANSPARENT_HUGEPAGE [=y]

and the subseqent thousands of build errors and warnings.

Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Nanyong Sun <sunnanyong@huawei.com>
---
I really think that mm/Kconfig should have "depends on MMU" for
TRANSPARENT_HUGEPAGE, but commit 15626062f4a9 from 2012
("thp, x86: introduce HAVE_ARCH_TRANSPARENT_HUGEPAGE") thought
differently. I.e., mm/Kconfig should be protecting all arches
against this Kconfig problem.

 arch/riscv/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210524.orig/arch/riscv/Kconfig
+++ linux-next-20210524/arch/riscv/Kconfig
@@ -106,7 +106,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select UACCESS_MEMCPY if !MMU
-	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
