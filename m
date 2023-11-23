Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAB3C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KD3I1XW9FpO92XQFfSpluJjpp7CBkoDLqUGCddvkdhE=; b=QuU0A1tmY80DTf
	9AjfJ1tZ2Vu9tPgLFIRVaKw6O3aDTzfgyJ0NoKd2mwUeh6DSywMTkLSgi5rFxRZ7eEonuH0TEKyDc
	9aqD5rtvpLDaTffVW6zdYoMJYFL9noHtSSZTWp6SzuBksUXz80FCwaDhcSL/EyTwcJJGI5cRa/Hw/
	8obfgVHsBinT63pUWMuDXcUnKrVkhqkE4mICLSx/V3YKr8OCB4WsjstCcC2/BNcspNEfw/5J6at5v
	Yeqni9p5E1+U+JlH8dAucsH8d14KcMcf0qTOpLX41Xn9XDCsC9X+29+pJsG9uRLGoxdM58qpbzute
	t8qQnhraZcHgS4LsD+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6An3-00528z-2k;
	Thu, 23 Nov 2023 14:34:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6An1-00528Q-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 14:34:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A192C62200;
	Thu, 23 Nov 2023 14:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28243C433C7;
	Thu, 23 Nov 2023 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700750086;
	bh=2IIUNX5jKc+M5fhmvdUI02XyPwbOQktGxlJKInijJuI=;
	h=From:To:Cc:Subject:Date:From;
	b=aQdNthO7a7rwwou48QT1q4YfT21UDqnVCR72Ffa/4PegDCV/DHufmlm8pB2rgHGcQ
	 irZcpvIsEfqSTOA8w4pLrfmwRT0XLq/LGbDuCAIPYpAFa/w2BSxxParN54rx0nvxza
	 D6rfqht0Ybzb0VVUIc0xi2ZlfaDgxMtJevufLHpl5n/EtZkLuvX6lXlWm2Ad+TUUqw
	 PXvMSs0H4Z6TJ3RFaRld/dVlG79CNCLwFWm7zNtEyI8PFJCGyO8dzKLe01YxhMEnnv
	 CwCnudU7SWBDfreKmWIX1X5aUIrJOiOeM9lTXnKyF6fNdEXdnBnMDjAq1qP4ynCr8D
	 DKdrUvQygdkYg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Select ARCH_WANTS_NO_INSTR
Date: Thu, 23 Nov 2023 22:22:23 +0800
Message-Id: <20231123142223.1787-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_063447_256747_F6BF1E5E 
X-CRM114-Status: UNSURE (   9.22  )
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

As said in the help of ARCH_WANTS_NO_INSTR entry in arch/Kconfig:
"An architecture should select this if the noinstr macro is being used on
functions to denote that the toolchain should avoid instrumenting such
functions and is required for correctness."

Select ARCH_WANTS_NO_INSTR for correctness.

PS: The reason we didn't find any issue so far is that the
CC_HAS_NO_PROFILE_FN_ATTR is true.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e4834fa76417..433ec617703e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -60,6 +60,7 @@ config RISCV
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
+	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
