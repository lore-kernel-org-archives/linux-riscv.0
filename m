Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56A2CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WY6VgjKbvUAjXe2FN5oOrI1hb8NJPvTydfPiQQbQb9Q=; b=STFt3us6hOkQjT
	h1SGDAv3E+ULx1ZP/zugeMGyDhE/RqMkUAv9dWtOAYT2xFaGS17ZvVcoGTUf5XDzZGMxYO/RWz096
	hp8EEUHAd5D7eOsqo2KwK6uSoHBzOaZR5sJIqRXcsK8oTm4XKtis3yRsqFqvV/rWm0g2mEWjKNfzh
	oKcFvlOnE8JjDrnz8erWf2f/z96g+7nPUL4JMSIX6Y+NO8ClusP6OMBC7pYE0w+Iymhm/YjZ8pg40
	vDjUz9Xk9O1Ewa62R3IWgw4pA8dieMrvoQt6iZNXs6k0lsdgIxJKxJK+V0nHlM46EnSnJyr+7UfKI
	M448Erc9H8yIlHjIkOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5fH-00000008XIC-35kY;
	Mon, 18 Aug 2025 19:37:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo53Y-00000008QkX-1NcI
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 18:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D09C15C634B;
	Mon, 18 Aug 2025 18:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF422C4CEEB;
	Mon, 18 Aug 2025 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543487;
	bh=yP6TXKyp3wFtCTQQgfaLfBJQK+omSBoiOGIP+6rEIXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QHGKFArCJTUAj/4j71Zdn+I2H0iuG6XcnHNbVD8uPB2wuew8n8jZ4GtrIQcgeMHsa
	 WrAP2Y00VCz+w41MZMeaBrob7KSqBbPFMTianNvx2Uz4B80oDEiBjuHtlU8MLboprP
	 Wa+9/yGozzTetrybFbSJW7OHpdbgexK0KCVqLsgDP+BriAixGFItHhDfK87pEJV8bE
	 rY+IE/zY1P8qTpVUzz//rqUlFxShQM2UV+T90kJWkI7MABqI/Ch3MWYn0sfO5DUmOH
	 FbYBdYpez+jZ7KixeqQPgToxbaD0ODm28Ibz8ICQYcOC/gBXy8+rCjKZU6DA3Fo8G+
	 CM/f4XOJ3VOwA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 Aug 2025 11:57:23 -0700
Subject: [PATCH 07/10] riscv: Remove version check for LTO_CLANG selects
MIME-Version: 1.0
Message-Id: <20250818-bump-min-llvm-ver-15-v1-7-c8b1d0f955e0@kernel.org>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=nathan@kernel.org;
 h=from:subject:message-id; bh=yP6TXKyp3wFtCTQQgfaLfBJQK+omSBoiOGIP+6rEIXo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmLyxfNO22xXGNVXHPY9RlTRJe0v4js3Jx5JD8meyJXb
 43krj3TO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE3BgZ/mnf7Je7FvVuwseN
 OdE122KiPvG3bxeczpydLuQszvQoqobhf7GiYGLfPo4zf5bczungvs9SzKjI/Lq9lOe5hlji4V9
 pHAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115808_412188_54F5040C 
X-CRM114-Status: GOOD (  11.51  )
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
