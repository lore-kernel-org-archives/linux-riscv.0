Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215B3C0502C
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Aug 2022 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8m/MSYks9Sc4MxjcMNSA3a+KRa7KC2tw/kek+a0mcIw=; b=c/KsLv8EOgt+kp
	1epBbr/YEMDpcP5IxPEDvt0lbA9YSieKvk8i47tTGLgU0LZq2fEDhoWHLhY75JS0bLvzpv5osCWKc
	O6/g2RBF6HE+XynvEfP1JPKuHmTlPGVc6c3h5k9+N/z2h42XDTD0+pbFXZaEtudQ2VInA2BYEL5lt
	kLW9m2fSKgxP5l/OXVRkUiCTLCnh66rAMHWXkQUtBruWngU7iJXTPWdkrIy/pFd1hGVmW6UVPR/uM
	XVIrp9c9bQC/2bfka36KlkbjJNAAE0nrVpsWEyYRMRQ6rYklrMKc5KunoaWAIA8zDynrKYbmGMm7d
	gHPYvtTLYNr1sDQO3pqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRsj0-007Sg2-1w; Sat, 27 Aug 2022 10:07:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRsix-007Sdx-43
	for linux-riscv@lists.infradead.org; Sat, 27 Aug 2022 10:07:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A13BFB80EDB;
	Sat, 27 Aug 2022 10:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289F9C433C1;
	Sat, 27 Aug 2022 10:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661594847;
	bh=x4/mGVMacC5xRI5YrwqxL+YnyXrMhkteEEVlNDKVYpY=;
	h=From:To:Cc:Subject:Date:From;
	b=QOI9LDoNkrsYJpyEwmZKcrb7VofNKKRStmjAR1DER05HCs3v6ckfZNzg3q318UFuE
	 SKQBRURtBtyz4fCp/hOaAv+hyYUWNobgl0V2gMIzP6sfZXMavzq577wFVN469A1kSf
	 vyGS2T9vMoh5ackyGaxk5etTvY4H+X7nwSpX0n2wEnttG1TepJFiP8zoGW92Kltmx8
	 z7SUEQlGAVBuZQKioaIe17P7HNyJhlSCw3IxE95IDw/7/V+K74b/TGBPBC277LuW8j
	 fVAC6ODypiiZ3bQPKiCiWqNCGxeLRqtAWjKlDQUBkmDOgXIFawQv0AgkNCy0ZckHPX
	 fXak6rJbJvrqA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] riscv: enable THP_SWAP for RV64
Date: Sat, 27 Aug 2022 17:58:15 +0800
Message-Id: <20220827095815.698-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_030731_360062_FB2B23BB 
X-CRM114-Status: UNSURE (   8.18  )
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

I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
memory optimizations such as swap on zram are helpful. As is seen
in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
swapped out"), THP_SWAP can improve the swap throughput significantly.

Enable THP_SWAP for RV64, testing the micro-benchmark which is
introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
shows below numbers on the Lichee RV dock board:

thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)

Improved by 382%!

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
Since v1:
 - collect reviewed-by tag
 - make ARCH_WANTS_THP_SWAP rely on HAVE_ARCH_TRANSPARENT_HUGEPAGE
   instead

 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..79e52441e18b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -45,6 +45,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
 	select CLONE_BACKWARDS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
