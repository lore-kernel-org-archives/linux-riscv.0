Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC272CA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 04:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxJv8gExwdqcHRKQWyqpOLXBC0AZi9C7T29rkDrQMtk=; b=UymOFL+dZeV2RZ
	xBqCRKQuOCkFJ+gy0KT3JsbSD4QCCD6q2hsaJ9hJVukd1AKRRSLJEHOYLsOR0C+q2GA3dSIlIxNtD
	dHYmEYXxdo7/HTACXi+gy47XtqFtzgklMFepfHt9OpUCs3QsDPcBo2aZ+bABq/KwQZ4eFGrx7AF7x
	bXDbKmgydOszBSdzBZvSRtsVfaoeK9Ya3ssPp7+sA2gcVwwUA90Xiq7zJPBfQ/WdvQWQz07+fiQVI
	e9060ORgQ5Tgtk7iBMe5Dlgl3iSXSYW9sOZjY8YTmnsZmGwXy9i8JwBN/9zWa1BKR5ckTVzF9Gx5/
	xkg6QEcAbcG6rsWPKhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJTb-00000001Vlh-3soW;
	Fri, 22 Aug 2025 04:34:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCdr-00000000dtv-27mW
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 21:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3A3DA586AF;
	Thu, 21 Aug 2025 21:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F479C4CEEB;
	Thu, 21 Aug 2025 21:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810974;
	bh=VYJ/3Og460FvKVmmzAjxmjg94FV8xklZJeBiFr5mKfo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YEcECcyYrBMrAwn6owMjROwcvn9APF9mq3vwMadEfmJU2ImyjMIUaRC9P7kvZhRss
	 aVHetJxVgwampwYPBB4FadtEnyBoG/bo1yYDOyQonjDpKMRDkIiz6fRzQzKNvJ65Ft
	 a+4kXZHE4FSoC0eOP+SdQmJhV+B6iGDSqbM/+qMqG3HipQalah7zqoL+M6rG4GJAVv
	 axkmZXBMpzLCbsR0Vlz3YK8hGXiPrnWCrh8mf1oOz3LwDZnvLNBWDSWleau14QT0PN
	 IhrYXIG8z2Ghko5jyzi4MSTT3JeHiX3FXWFEliLCsFEu4iBKx2Qnrw4eqYMqIxWKxz
	 pgxF3mEu1QR6A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 14:15:44 -0700
Subject: [PATCH v2 07/12] riscv: Remove version check for LTO_CLANG selects
MIME-Version: 1.0
Message-Id: <20250821-bump-min-llvm-ver-15-v2-7-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=nathan@kernel.org;
 h=from:subject:message-id; bh=VYJ/3Og460FvKVmmzAjxmjg94FV8xklZJeBiFr5mKfo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLe5r1vLOvWH+xsD/gzbyJ2c4hufDL21gxoWk/5C/Je
 ZgEnwvsKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABNZ/pnhf9aDa9W5X7cVbGQP
 nTt1j9XCB3rMC9OXPJH+/mFb3ay1cTwM/zRf34m8/Mjsdmd2SBHXLfPrMZeKupg2dz7012Wca/d
 iIxsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_141615_609673_7E80EB8F 
X-CRM114-Status: GOOD (  11.34  )
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

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 15.0.0, there is no need to check the LLD version
before selecting ARCH_SUPPORTS_LTO_CLANG{,_THIN} because it will always
be true.

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org

Small note, this will conflict with
https://lore.kernel.org/20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org/
but I think it is simple enough to deal with.
---
 arch/riscv/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4b233a0659e..1d53bf02d0fa 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -64,9 +64,8 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
-	# LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
-	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
-	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
+	select ARCH_SUPPORTS_LTO_CLANG
+	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
