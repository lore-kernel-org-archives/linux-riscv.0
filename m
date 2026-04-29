Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1446EFF886F
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 03:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxbjTfQKnXIJmdUT+LCxiqCz5SGtC3sGpdFsdHr13dE=; b=rB49COXnxZBHJo
	P79Yn/+wc1NQwF7JewBWyhz60KLyLLERrJpz8yQbmWuif/wdoOQpL97FltXaLGoltFcYmiY7sMziZ
	wiTtaN7Ibt80t8/4hmio3Aeg2o+ZUkl2aQwCbxp0BdboGnrlYAe88evZcnVo/lDJPnXmIVMr1I6lw
	Rqs2WHtPVo9IZUtaclaTTBDl8z3sKOq5wfIqsBrSLxuZZqV4ExyGCa+B/29Mbi1c8UmOecdZoFcgq
	Vr41cbPGhl4evW2XVRo8S4dYYLvlP93GRtSrZx7Ily6nB7J2fi6JxDrPijtnzyAYUa5nfdaxGpFIA
	C44qiA9caqIfWIrMFv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvA9-00000002opT-1d5h;
	Wed, 29 Apr 2026 03:00:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvA7-00000002ooB-05Tf
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 03:00:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 757104174A;
	Wed, 29 Apr 2026 03:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB5CC2BCC4;
	Wed, 29 Apr 2026 03:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431630;
	bh=vzaqTQhYZh+xvOuS+0eBnjbB2FREkk6iH/xqM4TGa0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bsxnAek+AMbwi0N65LCy7M6WCqVTp1H47KxteLyooGCKrEkUx3kxhCRSYDmr+H1qG
	 lLBpl2juOFBqZJS0NZ2SwELArbPj3YkPUJkrGxH4vcJGW5WDgzP5Zns/cJ8sEnvkdn
	 cbgn7yyJ2+xp3ZLZqUVao6oWs/N69grhMAkzvWDgexR2rjl+5Kz0gja0+P9nR6dirt
	 Uonjfe6KaXmG0EBy9T85kbVicJ0FsVMrkpmZyIq+93cyWzYAUSPe6QtkplGvGsYqJo
	 yQ7qwMVoJona2c0H8COiE9EN+8KdErI6sVgueZT0FePYdhv9h6Z0eNSimnSoaDOyCg
	 8UnzEsM/F7V8A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:14 -0400
Subject: [PATCH 08/14] riscv: Remove tautological condition from selection
 of ARCH_SUPPORTS_CFI
MIME-Version: 1.0
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-8-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=nathan@kernel.org;
 h=from:subject:message-id; bh=vzaqTQhYZh+xvOuS+0eBnjbB2FREkk6iH/xqM4TGa0k=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4xceOsWfnF6scCyy4z3QLXIStO0d89vnI1/9El25
 qZ6nxP+HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiD9oYGZawJs126fvEfMFA
 bFfAz1IV/qMhjzfoXV77kyfpqfKOq9wMf+Wlb3vK6r+VmnfI4FX82ccPLVOcP24tPX+1+6kDb83
 WbhYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_200031_085801_8E2DCEE4 
X-CRM114-Status: UNSURE (   9.50  )
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

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the condition of the selection of
CONFIG_ARCH_SUPPORTS_CFI is always true, so it can be removed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: linux-hardening@vger.kernel.org
---
 arch/riscv/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d235396c4514..7ffbf6032b61 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -61,8 +61,7 @@ config RISCV
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	# clang >= 17: https://github.com/llvm/llvm-project/commit/62fa708ceb027713b386c7e0efda994f8bdc27e2
-	select ARCH_SUPPORTS_CFI if (!CC_IS_CLANG || CLANG_VERSION >= 170000)
+	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS if MMU

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
