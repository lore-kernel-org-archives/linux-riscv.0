Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A06BC4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 15:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 549D76104F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 15:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 549D76104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iLfiW4gH0Al98TwIlUtBnN892eIcSDk5Ur96Xh3bBqc=; b=WvVKTunGcCBNF1
	OKpFF94MBIO6qqmtPvV8Tg/zV4pPv+bDulK3eugs3kInHh2fhX6FJEmnr1/SDp1KzWO+toIM7WySj
	kowdFrC3GoIL/aQUza87S9BbTlbV/6GZPmGuX3B2OWjGVlTwvdEQ00QtW6if8eTpawZC+Quwm3+T0
	9N/0+0yxX3ft58bGqN/22s9nlVTnR8TFS9QOG4dhE0WHCvZHSiws9uTg36dYWsTrk/uwHM2QGgS+g
	IFcjX21c2ZTe9oqH6hXGCVPIrHRuIPfxX/SRhHLeeoLrmigyjl0AAnZ6dUiORf+cVi9RPVdVb6kr1
	i8+xBrU+jjLecO1OExbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBesw-00A0Hv-Ks; Thu, 05 Aug 2021 15:02:14 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBest-00A0HJ-6K
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 15:02:12 +0000
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 175F13YC019006;
 Fri, 6 Aug 2021 00:01:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 175F13YC019006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1628175664;
 bh=/sZqN7YYOQzerHeaIfHq5IfDh5zbKuKicEifD7PVFaA=;
 h=From:To:Cc:Subject:Date:From;
 b=Mo8HJV5AZnRz+AkF+qbp1D58uzEhoM49ic5mWOQkKtLh0vL3XgjbowgqPGK6TKC1u
 f7Ka0M7a30Zx6D1BYXulS0eMz0dFqXqKN9IAz9Y7t8W0ZLwRQ0tVbpoOTErkQFZWY6
 mKr18UScOHZX9SYYZZKJP4dWAy30VUGeQR0cZE1bYMcse7amTAkiU23sMBXv4Y8ema
 +lWG7fPIizxEmc9JuPbv3pYaZFGIx0SLNWa7JIJeDFdP1Nt+yMSkYkceeV94FL/m0o
 W6tsiYI/ru59yDcEQ2cph1ycvHXgXjJgyDy8B5qH5pQwc8x5pbPNcbxnDbKPjey83s
 4CnAww2LtLUXA==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michal Marek <michal.lkml@markovi.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
Date: Fri,  6 Aug 2021 00:01:02 +0900
Message-Id: <20210805150102.131008-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_080211_625574_01E07B41 
X-CRM114-Status: GOOD (  13.50  )
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

LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
and it should be used only for that purpose.

LLVM_IAS is checked in some places to determine the assembler type,
but it is not precise.

 $ make CC=gcc LLVM_IAS=1

... will use the GNU assembler since LLVM_IAS=1 is effective only when
$(CC) is clang.

Of course, the combination of CC=gcc and LLVM_IAS=1 does not make
sense, but the build system can be more robust against such insane
input.

Commit ba64beb17493a ("kbuild: check the minimum assembler version in
Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
because Kconfig checks the version string from the assembler in use.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile            | 2 +-
 arch/riscv/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4ab151060931..8b56c9692c3c 100644
--- a/Makefile
+++ b/Makefile
@@ -844,7 +844,7 @@ else
 DEBUG_CFLAGS	+= -g
 endif
 
-ifneq ($(LLVM_IAS),1)
+ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
 endif
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index bc74afdbf31e..dcfbd2a87d41 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -41,7 +41,7 @@ endif
 ifeq ($(CONFIG_LD_IS_LLD),y)
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
-ifneq ($(LLVM_IAS),1)
+ifndef CONFIG_AS_IS_LLVM
 	KBUILD_CFLAGS += -Wa,-mno-relax
 	KBUILD_AFLAGS += -Wa,-mno-relax
 endif
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
