Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD4EEA3C59
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdIzOt8LfHpmDNgbFaKrQ/72qIPSLQmjFmQzM33zjDY=; b=rj4b0cCcnji+sU
	gYO1wQqE9KdC+nUXjZFmSYB8DvpsrG2MgXcRRFCXRDSJ4s/AnkliX00mkvPMXSDHR6HSHPlidxEWo
	norXBnAxXxxN3kneWd5m75JOJzcGDOkXA8Nx0jjvFb2NTK1rIjEg/4pxULi4nO0881+ZfknH4xDJW
	GW0LDT/wWXldy4AlS28Kh+u8yPfBfwLFDfYGxs2erhopOYxT082yr5Pt75csFajJex1IDpm+WNmhI
	4m12RJDMBpKZNpEuUT6wuk2KtPts6tENJAzKvp5Ros64vf8CFUFo5brKk3Azjq8MltNrvrgVO0x7W
	Fds7yxigIGs5sP6g8enA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnsV-0000000AJUo-2YgZ;
	Thu, 09 Apr 2026 11:48:55 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnsR-0000000AJU3-1Zo1
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 11:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775735322; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=aceztPpkMsU/CLciUL34G4AZrFbaV1ONeA90OERMBkA=;
	b=h15pPQz1kgiLvTnI2IAZ66IFtBZCeyl9s+9DAtLTyKQgN9kHDMhxjn++eb6lFh4boow9kadD+PKu+bifLbmZHAJyDySpJc8O94GVnSqUzf51vMaOeWiBf3ATCHr9H+Jla4VQ9krrzFA4mI3B5/Vv5SW4oa2x59cHTBS1UkL5H18=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0X0iIf1A_1775735311;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X0iIf1A_1775735311 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 09 Apr 2026 19:48:35 +0800
From: cp0613@linux.alibaba.com
To: pjw@kernel.org,
	alex@ghiti.fr,
	andybnac@gmail.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT
Date: Thu,  9 Apr 2026 19:47:36 +0800
Message-ID: <20260409114736.907-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_044852_163365_D8964798 
X-CRM114-Status: UNSURE (   6.41  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

RISC-V already satisfies all prerequisites for build-time mcount sorting:
the sorttable host tool handles EM_RISCV in its machine-type dispatch, and
the __mcount_loc section entries are stored as direct virtual addresses in
the final vmlinux binary, so no relocation processing is required during
the sort step.

Select HAVE_BUILDTIME_MCOUNT_SORT so that BUILDTIME_MCOUNT_SORT is
automatically enabled when DYNAMIC_FTRACE is configured.  This allows
sorttable to sort the __mcount_loc section at link time, making the
run-time ftrace initialisation path skip the software sort and reducing
kernel startup overhead.

Verified with CONFIG_FTRACE_SORT_STARTUP_TEST=y, which confirms that
the section produced by the build is already in ascending order:

  [    0.000000] ftrace section at ffffffff81015a60 sorted properly

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..6fe90591a274 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -151,6 +151,7 @@ config RISCV
 	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_BUILDTIME_MCOUNT_SORT
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
