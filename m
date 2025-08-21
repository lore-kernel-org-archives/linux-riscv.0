Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0AACA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZeGyN032KenzyHXHQ5ozdP7KPahPBse7g5nXMpwLU0=; b=azFEmyEoSpUX8W
	HaJ1kxNzFnCxKzjyLvM1DZSKEQXsDej8Qgj30wSagdiuMgEUK4fPtlWBhLo22g/QmmEifOcFbZrdx
	jzaWXOUL9QDjOU0TG/aXyFTbfj9o4YLJcgqpPYFJMygEi8FcXBkEdLxjP3agle3L5zEfbMbwjKu6C
	ysj37E+KUOuUAdvKIAmzkddeKv2ksy/tTzZsOINpw2FfI8bb3cBP+JU8QNt5tlHo5wxrmIIt32d3j
	Yiq+jU7mfuEQWD6MDBPzfO/0XyjGQ1/DbjAr1oJXPanmxN67wdC82McuEv6gjD75bEInavNU9GFhc
	+E1EcbLD2Gi/thgSTKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upILI-00000001NUD-0mZM;
	Fri, 22 Aug 2025 03:21:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCdx-00000000dvc-1qVp
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 21:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4DB5A586F0;
	Thu, 21 Aug 2025 21:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5031C4CEEB;
	Thu, 21 Aug 2025 21:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810980;
	bh=biYkmUo8TAJXy73mLcX/CFarTLOLNQB3EGVWaVOUDFw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j3k96ishoifW0pQeOjVUoRbJPvZXyjS6WKwJSVBdIvp0TRdTESk5Zs8PswhmICClY
	 5EhhWALMJwWwKNcJcpgA3gdSr/69A+CU1UP80MPQkFrR0ZrqxqSgxJLplA3jLxsh7j
	 VDXCtxRpctonDqejZQMi7JVKG8xoB2TV05rjDM6uSQW56hnEUB6qrfyzv2p5anZA1H
	 UnpytY3hZCs6bG11fcNx8CYKIQwh+y1Sq1r8pKUsiCb+BIDvyq94Hz9Iz5dv6Zu6Oc
	 iJpvWBUDlb8frca/Pzt09TLis1okQ1lP8OSsN6lXZBooOAww9icI5V0wyO8g4kX9Bi
	 SYPZnNDXKvlnA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 14:15:46 -0700
Subject: [PATCH v2 09/12] riscv: Remove ld.lld version checks from many
 TOOLCHAIN_HAS configs
MIME-Version: 1.0
Message-Id: <20250821-bump-min-llvm-ver-15-v2-9-635f3294e5f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502; i=nathan@kernel.org;
 h=from:subject:message-id; bh=biYkmUo8TAJXy73mLcX/CFarTLOLNQB3EGVWaVOUDFw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLe5pfLeLL/fn86IuTL6Z8f/5Voja6RWfCFCelrJ9ZZ
 Qmb5smKdJSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJVJ9jZNjeMa3txeTJZgZa
 M9J4OfXun5xwfKfWyR3Pvoi2S22NS4plZDgrOPNHRpeL08IkyYbutBzzactYpb4Khm2xfGQdv9u
 QmxEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_141621_620844_EAA4A963 
X-CRM114-Status: GOOD (  11.03  )
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
has been bumped to 15.0.0, several ld.lld version checks become
tautological, as they are always true. Replace them with a simple
CONFIG_LD_IS_LLD check.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d482236e93f4..850ba4b4b534 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -620,7 +620,7 @@ config TOOLCHAIN_HAS_V
 	default y
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
-	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
+	depends on LD_IS_LLD || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_V
@@ -721,7 +721,7 @@ config TOOLCHAIN_HAS_ZBB
 	default y
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
-	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
@@ -736,7 +736,7 @@ config TOOLCHAIN_HAS_ZBA
 	default y
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
-	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBA
@@ -771,7 +771,7 @@ config TOOLCHAIN_HAS_ZBC
 	default y
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
-	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBC
@@ -794,7 +794,7 @@ config TOOLCHAIN_HAS_ZBKB
 	default y
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbkb)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
-	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBKB

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
