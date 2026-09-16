Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9409FC88E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 08:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YqGVvelCOAYXPYzA2JD2qzasF1WCUWvs4RwFhrCEa3g=; b=R0gAv194Y17tdK
	iMtiuo2aD74RA9Od+pZ7ih7R8OWSPcIRnQ/aav6uY+J/zXi6ZFFBR8fAelbfXNfSLKq+DlJMRkylC
	06fMUeqKYEz2Nf2oCvpm4/aCW0rrQOCWNU8iGK24g2uAED1pWKL9oOR5Np77/uzSA1VbNY8l8Xxfj
	5seyYSX42FHQKGDj2UWyrEpJwwGJuXAw4qMbGlOURRpMbOJ2QsCydZGNFa6XlRv8RROo4t4J8bYBm
	nwvujJ8fG7LjLTn2600sP6oO5UGI5nnXhn6LywZd6+P4ck/blqBL4maF8PS657qwYoiYL4Z2GGVXl
	0UBldqS+zEac2eMxauSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6l9Y-00000008jG3-1YWE;
	Wed, 16 Sep 2026 08:38:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6l9U-00000008jFt-2EQG
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 08:38:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E44A942ACD;
	Wed, 16 Sep 2026 08:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0B71F000FF;
	Wed, 16 Sep 2026 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547879;
	bh=/ZVRl7Y1YIACUYiiu0izSYuEQsygi4uHz7Xju5KXuwQ=;
	h=From:To:Cc:Subject:Date;
	b=OkW4r6XnEuLZt8f+qeI1RNfMhekNjYfaGPS2go2IHp6Jcr8isnpn9NaVU9LLDPdrk
	 dT5YGgBBobi/ivVZGZzflNUSvVjluFaE6wrn+Vqw2+XrcamktGC8TDNt6uZpNR/dFL
	 Qjr//c12wbrEOBAw/2Qqp50mx3Lx7LVDnuaj86B41Pg1a6Z5lTnphItVJt9R4F94tX
	 LeIh8E4tlCTWvMlsiSDMIpzaY5ktJnpzWdcncZWNKbIc63DFr+U9wrifJKtJQj4ItU
	 BMMaIbcOx+jiwE+dGuk8w75FV6epimz9KCw8mgJWSc88Xin4v737WTNLqL4CM6FZbh
	 tfnzZeHJgEpsA==
From: Arnd Bergmann <arnd@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nam Cao <namcao@linutronix.de>,
	Jia Wang <wangjia@ultrarisc.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] riscv: limit sifive errata to CONFIG_64BIT
Date: Wed, 16 Sep 2026 10:37:21 +0200
Message-ID: <20260916083752.47310-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

There are two errata for this vendor, and they both individually depend on
CONFIG_64BIT already. However, an 32-bit allmodconfig produces this warning
from clang for a condition that can never be true.

arch/riscv/errata/sifive/errata.c:29:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
   29 |         if (arch_id != 0x8000000000000007 ||
      |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
arch/riscv/errata/sifive/errata.c:42:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
   42 |         if (arch_id != 0x8000000000000007 && arch_id != 0x1)
      |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/Kconfig.errata | 2 +-
 arch/riscv/Kconfig.socs   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..38ade0ea4e9c 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -46,7 +46,7 @@ config ERRATA_MIPS_P8700_PAUSE_OPCODE
 
 config ERRATA_SIFIVE
 	bool "SiFive errata"
-	depends on RISCV_ALTERNATIVE
+	depends on RISCV_ALTERNATIVE && 64BIT
 	help
 	  All SiFive errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all SiFive errata. Please say "Y"
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 429e07589306..cecbce0c4983 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -34,6 +34,7 @@ config ARCH_RENESAS
 config ARCH_SIFIVE
 	bool "SiFive SoCs"
 	select ERRATA_SIFIVE
+	depends on 64BIT
 	help
 	  This enables support for SiFive SoC platform hardware.
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
