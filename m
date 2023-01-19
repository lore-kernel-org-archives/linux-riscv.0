Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13739C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 16:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfuCjhc4NEegZ7yqc7DnqSj8Xiy9YAZcYlcT+r1X7dM=; b=fjoQTbpU0vZGqM
	TPnJwkPrszblqG+8CaYeIRq1itU8Q0dOs+k2i2SuoE9H8XzdNpZCKdaicGMUOFtvdliARnHeTgCgR
	Uh96fOZeZrVkiH2OdbGpLvDWbPy0Skg3BbJcwJqgA1A3/AiXHOBszactdjGnoqqGCkYK+R7Rzw/GE
	CNRG5xVajGLe4HA7aUWLDJ3634074wCCregPzmXPC9ax9jkRFMOtRDBpMgmzmgqGlKrLaC/C+lyHe
	YU+kAGpltXTO4ypsWAY/gsD8vkmFufieYW88cyGxkdSfmO1MSgsvGIrXxtL63b1fxvjLKbP0ZT7Jj
	GsRy8E/SNBmz+3RpXs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXPk-005q40-Pj; Thu, 19 Jan 2023 16:05:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXPG-005ppq-SW
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 16:04:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7DE6BB825D5;
	Thu, 19 Jan 2023 16:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31355C43398;
	Thu, 19 Jan 2023 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674144288;
	bh=Q3aUPyCmgVUYIBmI6uVtAlDrofg5WEVa3xPWnM7xs/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KOOU8bw3d6SuGu0wcCX7KDP4dmpC5+XBCZ2OljXy1baMW85lsj4+IqWljAFyoSWBl
	 ppX4QqkJxaSDD0HfCrhXdJhHdHNiJa2wGfyyV1QOju+OJf2+ZkEsMUd6PnsHRUvRif
	 pbfBKnuYGROfs91MqXhZAJeoqCFjbscAlGdNGsS0v9mUv9NxUg+tV1MdzdHfEpWLHT
	 zTv8VTs/c1/0c1jQl4JNc2fmMLxE/IWL1jJJRNdZbxYZ7AAcS9PCCA/DnSjQecu6E4
	 Sv8jnLCBxM8fMikux4xClrENpdNhnm0ZuSDTp0EqingpaCJSR2sQr7mOwAgsIQ3reB
	 IaPMMTaUwCudg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] riscv: select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL
Date: Thu, 19 Jan 2023 23:54:17 +0800
Message-Id: <20230119155417.2600-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119155417.2600-1-jszhang@kernel.org>
References: <20230119155417.2600-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_080451_115085_DFBB577D 
X-CRM114-Status: UNSURE (   9.61  )
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

Now, after that all the sections are explicitly described and
declared in vmlinux.lds.S, we can enable ld orphan warnings for
!XIP_KERNEL to prevent from missing any new sections in future.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..335e0c45cced 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -46,6 +46,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_WANT_LD_ORPHAN_WARN if !XIP_KERNEL
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
