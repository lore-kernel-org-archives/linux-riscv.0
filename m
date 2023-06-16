Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1F5EB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 10:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9byv/PvEqKc5mwRcbG6G0wIlFccqfdqegMhMZlrP8E=; b=KORPwxXHGxQTg4
	PEjMJRYbCxRahGmnx0qbICOP7/MJnMOpdfYGkEZiNLR5DMfaS6vIz6Tn8C67Tr+pGmZuWXoAAjAeO
	xuvShwlGAOJtvjxF9OY3ZSPCwgtKFp4kyq/LljG+PghhXounKw8j8cW9pjxmPpGCGyKWstXUybzW0
	ySR0hI5h25o8MSyGODL073shzIdGaNAx0yr9I7w51B7d0TyhqE0j1h3jNiFCapdxx5OHkwRDII8p2
	+mb0Y21N1gIOymbdgru5MNauX+r0f5PWo0oR20kdw3mOv2U8kXYa+ncxNX1kH2LE8m3Wm6Nr3icFe
	tGp8pzsGJIP9RJdUKBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6g9-00022x-20;
	Fri, 16 Jun 2023 10:27:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6g7-00021c-26
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 10:27:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C5B26360D;
	Fri, 16 Jun 2023 10:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230DEC433C9;
	Fri, 16 Jun 2023 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911258;
	bh=/2eu/IzHEjIEziEOgpfNknSs8ILwYCCzdmfnALL8w/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TeE4lABO3LhB1axvrQrpi/kO/fLDnn1yXcR4b2o8GWkULyBgSq3uvYQmQ0c1hkLEg
	 D9ALZ1RB81v1XWPJvNz7V6WZ2yZqmY817ky1o4ozXT7AoEWHNmrM/ucFxxMAdNdzNh
	 dM2va06obvqGI4Yj5SYHNwlTV21w42hoA4W/hBPSONVCTlffGK1Vqtz6XVeZ7dTsQL
	 vTECMlGuvqCIxTOg8uy0+LKWG9qMXWvwbe9jLzBp6wOL68Ta15kYsoOBBWc5FH8DIf
	 Sroj1fkOUjdxA4JSLuMYeuF+ugHcVOSMuFr4K+d9EXFo7uDWNBGQ2jE0d2Tj10EvEL
	 S35nVmnOA41tw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Sasha Levin <sashal@kernel.org>,
	hca@linux.ibm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	masahiroy@kernel.org,
	svens@linux.ibm.com,
	nathan@kernel.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 08/16] s390/purgatory: disable branch profiling
Date: Fri, 16 Jun 2023 06:27:11 -0400
Message-Id: <20230616102721.673775-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102721.673775-1-sashal@kernel.org>
References: <20230616102721.673775-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_032739_726466_EDC0BA0D 
X-CRM114-Status: UNSURE (   7.69  )
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

From: Alexander Gordeev <agordeev@linux.ibm.com>

[ Upstream commit 03c5c83b70dca3729a3eb488e668e5044bd9a5ea ]

Avoid linker error for randomly generated config file that
has CONFIG_BRANCH_PROFILE_NONE enabled and make it similar
to riscv, x86 and also to commit 4bf3ec384edf ("s390: disable
branch profiling for vdso").

Reviewed-by: Vasily Gorbik <gor@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/s390/purgatory/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
index 360ada80d20c3..d22ec8acb13c5 100644
--- a/arch/s390/purgatory/Makefile
+++ b/arch/s390/purgatory/Makefile
@@ -26,6 +26,7 @@ KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
 KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
 KBUILD_CFLAGS += -c -MD -Os -m64 -msoft-float -fno-common
 KBUILD_CFLAGS += -fno-stack-protector
+KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 KBUILD_CFLAGS += $(CLANG_FLAGS)
 KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
 KBUILD_AFLAGS := $(filter-out -DCC_USING_EXPOLINE,$(KBUILD_AFLAGS))
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
