Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA15C77B6E
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Apr 2023 16:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P4OhIVR50sMsgOOJFZ1K8NyPPdFWSlpKZu8c1Q4+lyk=; b=J+LlW2LKimUGN+
	1g3ME1/eYKnUvO48JCn/YoZORK692wplyGYyaa1FB1woliVzSRRHVDgBDKHtEmhUJXx6MKwNpotiL
	i58Av319yZCh/1SgklRH2lcO2SJTnXkZkx0AOzA2qaaCpTio06KhOMTBCHvl3fgvuU7cAP6nNRcHM
	Pa1OQ7UhNNyr9COV7vhtoj9p78v6745uzTjf9cCtlhy7ojfhfXHeADggSgUi3+rfhGLGibBnuJ0qL
	gT5z4yfvH53reOwCMmgdqphQYrSXIElO2scY3e5kksDG4BXrd5OG5LK/CXSXKKs4rGzEBlRcY5KAA
	F0MQ5+QAz/RlaECq6r2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plYIm-00DyDb-0l;
	Sun, 09 Apr 2023 16:54:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plYIj-00DyD7-1E
	for linux-riscv@lists.infradead.org;
	Sun, 09 Apr 2023 16:54:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CEF460C49;
	Sun,  9 Apr 2023 16:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3737C433D2;
	Sun,  9 Apr 2023 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681059238;
	bh=lU5PXzOuCtb0P141uL0AcENGJqwDqjBgVsAq1JQriIs=;
	h=From:To:Cc:Subject:Date:From;
	b=AJJPdc888e4sifAaYRQuou/jKpxT1oVxvHWSmPMUFNwwQK+VDIY0CQi3V2OiV/fSt
	 9HwhtPekYarT5vsVBcMljrrTJdLBo/5AoY8UugYGe4KsvQ0bf7yURTWeKa4qw5L8j3
	 PBwGOx5C40FAdMU5P/ExE7YH8rSEl0GSsWBhVcmMP7fgS2BWUGnHEAGfeUpaNMJ3gW
	 TIFMWlMxN8kZ836LAvcj/zJOYfArmxp0D4ApsIRpirnFKhR0n3S0KEOCBM+2dDx7jw
	 khBz17vCtVKED0IsplwH/elPb/HM+M1FIbW7vgVyH8BCb1jUeNXuox9j2YCyVho0LP
	 O9ZR573l5bU9Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: enable BUILDTIME_TABLE_SORT for !MMU
Date: Mon, 10 Apr 2023 00:43:06 +0800
Message-Id: <20230409164306.3801-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_095401_480610_90529D9D 
X-CRM114-Status: GOOD (  10.14  )
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

BUILDTIME_TABLE_SORT works for !MMU as well, so enable it.

Tested on QEMU and FPGA.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..212ea28e346b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -50,7 +50,7 @@ config RISCV
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
-	select BUILDTIME_TABLE_SORT if MMU
+	select BUILDTIME_TABLE_SORT
 	select CLINT_TIMER if !MMU
 	select CLONE_BACKWARDS
 	select COMMON_CLK
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
