Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E33D36129
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 02:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eP2ipGbrFLTCM4uy3A04PkQXrwrrkLXHhhtByJKqSJ0=; b=lUX/E8YA4zYyP/
	ONqsBDi9JbSX/g2WZh+mZruRGW5Xbv7gMPuECApiJv50F0PyBu/iJpyLa6XY7cSmhs4N4AkEIKuJs
	hO1Q7HQJK/eQFV+ZfkztFX2l9C8vyWiGyEW9OczRhJQauUlCKTOtucYt7iDbkZn/X/8us2lahMCc/
	++IGBxO32bLBx8eKtH3BeY6hT5qaGlLnSC0JSHA6HXJju4rMXCJZqlujtfq6hAXX0Eqkkn+2cKqdN
	+0KIGTiA7/jpuDEVyEOJhKpi2B2ZlWCJ7jgrYs9KR+N+ASIp1O1ly0R4TvDC9BRvw5LCWmRwceF74
	caX2iidz3ywc/m1VzHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VaS-00000001Qks-319P;
	Wed, 06 Nov 2024 02:16:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VYm-00000001QLC-3OOx
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 02:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0C1FA41BD4;
	Wed,  6 Nov 2024 02:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7B9C4CECF;
	Wed,  6 Nov 2024 02:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730859255;
	bh=YXSyDlwK9Sog4/ATEus8Z8onq95/SaRQ4um+jmLNl80=;
	h=From:To:Cc:Subject:Date:From;
	b=raF+4XJNDCpHzgEp5rBYDcoGsP0u9HTlmYXCz9Za4dhz6/7DsZK1EU9vLQYr+/20Y
	 PXJWeR3zANutbA2n3/xPBqWbvvUBxPr4kahT2/JB3b2xcMFsc37EqCSzPaF8d+nig0
	 hVqls/dYiYNqnH040oVo6T+iHj8Lpg5/ucsy02UdsSOFwcdfwUCWPK1MNN3rMKkoWm
	 4hPwBINnyecqP9ZvaHPN118GSeWdpFoJeLmo9RXjra71DBTsEW1WyOpaqwEinsOoc1
	 vZw+MfztDSQRW2HFSDAaqE0p4n4jybm711Ir6ymoui6mzMyvJtnIEHCdl6nE367EWr
	 UkWDu2E1Q6HcA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alexghiti@rivosinc.com
Cc: Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: FAILED: Patch "riscv: vdso: Prevent the compiler from inserting calls to memset()" failed to apply to v4.19-stable tree
Date: Tue,  5 Nov 2024 21:14:12 -0500
Message-ID: <20241106021412.184114-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_181417_080588_C928DD53 
X-CRM114-Status: GOOD (  10.39  )
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

The patch below does not apply to the v4.19-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From bf40167d54d55d4b54d0103713d86a8638fb9290 Mon Sep 17 00:00:00 2001
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 16 Oct 2024 10:36:24 +0200
Subject: [PATCH] riscv: vdso: Prevent the compiler from inserting calls to
 memset()

The compiler is smart enough to insert a call to memset() in
riscv_vdso_get_cpus(), which generates a dynamic relocation.

So prevent this by using -fno-builtin option.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/r/20241016083625.136311-2-alexghiti@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 960feb1526caa..3f1c4b2d0b064 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -18,6 +18,7 @@ obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
 ccflags-y := -fno-stack-protector
 ccflags-y += -DDISABLE_BRANCH_PROFILING
+ccflags-y += -fno-builtin
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
-- 
2.43.0





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
