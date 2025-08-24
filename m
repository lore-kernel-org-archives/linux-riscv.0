Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75512CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 03:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ym3W2Lnrz1HmkwmcJLGgwoJlJ6y2geCPqSR8m6x3DrU=; b=PeN7attoKO/Cab
	XywAbN5Ki5AK+9vcBTfVbGLpr2g9xvXMWOWHSbjcdv9Rwuhs8u8ltlSY2uT6ibyqBus24My+vfcIt
	320a4efmenBsKl8A0qzjp5SsDDPOaMR3O//B0Iy1QsHzl0Q6zR0lhVO20XXK75t2CRfTBCnWTAMI6
	8ZMPl0MNOgOKLEV6efEdBMeMkdVO1lE7IdIvoE9iu+qsOt31ie5AFPi1H5BeAF/CEIVNBvwfGl9uW
	ynatdNU2koASLCCH+IiA6KHS2EFTrZ+qgtpbzs7qWM2nYpoS8RFdEDNQmA8vGVrBRGJUZSOH+c5X8
	0zrerRaS2jTyQaCYACFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq0zC-00000005eBL-2v51;
	Sun, 24 Aug 2025 03:01:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq0ws-00000005dnt-0Szk
	for linux-riscv@lists.infradead.org;
	Sun, 24 Aug 2025 02:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F07C60054;
	Sun, 24 Aug 2025 02:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BFAC4CEE7;
	Sun, 24 Aug 2025 02:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004350;
	bh=pZqQim94cizYcaJkKu9fvHKrK9ha05eO8lmqnnFk0ZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ZfTouxY7PXLhex9eJZTsF04yG7O4MGgb7juM6w1YIR2jv3cVLqTXiIYNy4S0NfmKt
	 js8n7Tk8Aqa3iPPf1TXq8wj3gkRIcFCKTMsconIIzB6RALIKnB5vNAdpBkHdnT7MFQ
	 DLzOp/EVB7sZTm/Bx3qKmr3ihNhgFL0V5N2bSIALJkn8Z8mXsNkdu36Fk3XBNBBRtU
	 Km1kiDe6HbnADOD0y7gET5LZEPa9lfiJ6FXgZdPatqh36BaI+KcqxI6x9fzYh/g9iK
	 hmzfTpTxO9Xa16lJxJFhP75rP96+AbKyH9X2ZdYq6G2i6uSLYZFlRrPb75UkcFYx/f
	 hOBfB6vYPReHQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Andy Polyakov <appro@cryptogams.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 0/3] Consolidate Poly1305 code and add RISC-V optimization
Date: Sat, 23 Aug 2025 22:57:33 -0400
Message-ID: <20250824025736.148576-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
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

This series is targeting libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git poly1305-v2

This series simplifies and optimizes the organization of the Poly1305
code by consolidating it into a single module.  This follows the example
of SHA-1, SHA-256, SHA-512, CRC32, etc.

Since the RISC-V Poly1305 patch has had a moving target, I also rebased
it on top of this series and included it as patch 3.

Changed in v2:
- Added missing 'FORCE' to the make rules for mips/poly1305-core.S
  and riscv/poly1305-core.S

Eric Biggers (2):
  lib/crypto: poly1305: Remove unused function
    poly1305_is_arch_optimized()
  lib/crypto: poly1305: Consolidate into single module

Zhihang Shao (1):
  lib/crypto: riscv/poly1305: Import OpenSSL/CRYPTOGAMS implementation

 crypto/Kconfig                                |   2 +
 include/crypto/internal/poly1305.h            |  16 +-
 include/crypto/poly1305.h                     |   9 -
 lib/crypto/Kconfig                            |  53 +-
 lib/crypto/Makefile                           |  71 +-
 lib/crypto/arm/Kconfig                        |   5 -
 lib/crypto/arm/Makefile                       |  18 -
 lib/crypto/arm/poly1305-armv4.pl              |   3 +-
 lib/crypto/arm/poly1305-glue.c                |  76 --
 lib/crypto/arm/poly1305.h                     |  53 ++
 lib/crypto/arm64/Kconfig                      |   6 -
 lib/crypto/arm64/Makefile                     |  13 -
 lib/crypto/arm64/poly1305-armv8.pl            |   3 +
 lib/crypto/arm64/poly1305-glue.c              |  74 --
 lib/crypto/arm64/poly1305.h                   |  50 ++
 lib/crypto/mips/Kconfig                       |   5 -
 lib/crypto/mips/Makefile                      |  14 -
 lib/crypto/mips/poly1305-glue.c               |  33 -
 lib/crypto/mips/poly1305-mips.pl              |   8 +-
 lib/crypto/mips/poly1305.h                    |  14 +
 lib/crypto/poly1305-generic.c                 |  25 -
 lib/crypto/poly1305.c                         |  81 +-
 lib/crypto/powerpc/Kconfig                    |   8 -
 lib/crypto/powerpc/Makefile                   |   3 -
 .../{poly1305-p10-glue.c => poly1305.h}       |  40 +-
 lib/crypto/riscv/poly1305-riscv.pl            | 847 ++++++++++++++++++
 lib/crypto/riscv/poly1305.h                   |  14 +
 lib/crypto/x86/Kconfig                        |   6 -
 lib/crypto/x86/Makefile                       |  10 -
 lib/crypto/x86/poly1305-x86_64-cryptogams.pl  |  33 +-
 .../x86/{poly1305_glue.c => poly1305.h}       |  47 +-
 31 files changed, 1174 insertions(+), 466 deletions(-)
 delete mode 100644 lib/crypto/arm/poly1305-glue.c
 create mode 100644 lib/crypto/arm/poly1305.h
 delete mode 100644 lib/crypto/arm64/poly1305-glue.c
 create mode 100644 lib/crypto/arm64/poly1305.h
 delete mode 100644 lib/crypto/mips/poly1305-glue.c
 create mode 100644 lib/crypto/mips/poly1305.h
 delete mode 100644 lib/crypto/poly1305-generic.c
 rename lib/crypto/powerpc/{poly1305-p10-glue.c => poly1305.h} (63%)
 create mode 100644 lib/crypto/riscv/poly1305-riscv.pl
 create mode 100644 lib/crypto/riscv/poly1305.h
 rename lib/crypto/x86/{poly1305_glue.c => poly1305.h} (83%)


base-commit: 07e1551bc8eb2e54ac1086492f1b475a6277c6b3
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
