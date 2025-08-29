Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D675CA0FF0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L0zGez2hSxiaVh2vSvuhm8XrzfcHJwfuOf8LMA3VpmU=; b=ZWIImlhffNzY6O
	pA139xQS+yQ0FWT98y4zlOiAYE4L61x837vlGkbazrXPdxfBEJe8v0xazmWAZ3nNZCDv5zmutoSIr
	2jUp4/Mkj+gRvAa50YBWzsnSc1Z2zGVaXqd4Ht6ccBQtLdURj9YSW9RIm63Pzbw1Ik2S6w277i7TP
	GLz/pwZdkUuqceppPa/WWS9GlcD8j5YuQP06Cd+sNNmQwUwGD2FDzzvPXcAsTnbM5w/GpoqrMtqY5
	sVUPUKr2sv8m4ZEEIEb8Xi9vsmuGq9kRzkCCVUj5EgLcPvmRwOBg/PZorhte45hmlHXRv8gg2MPXk
	cy6jtX2iTMhE3fdzaNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us5Ar-00000006oR3-2noa;
	Fri, 29 Aug 2025 19:54:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0zj-00000006BOU-01d5
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 15:26:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0011741A0E;
	Fri, 29 Aug 2025 15:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7B1C4CEF0;
	Fri, 29 Aug 2025 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756481185;
	bh=6X4sbRQB+FutSUt/G5PnchGHprmc2fud5kgFpMc+qdA=;
	h=From:To:Cc:Subject:Date:From;
	b=OTDHxJRdBTbuCPBTBoDfHVuT+Mxg7OYwG8bjswoan+ruOixFEQOihhqIaf8XGyW/8
	 f+lpedYRW0AD5rcKmO6LUF1rjVmK9e+qfy7QreRIaext4oT6kJQRBYiFBSmHqE0nq1
	 oM0nPJF4PNbAF22SvQrUz1cSr3J0K68oOAENbpYrAG79tuiu80bJU63vCJFI9byNs2
	 80h8fyl8zEGUMTuaeiArhhRMOHibhdge+OgVZ5GpaY731YVL9mgIvHcA5TZUZ7wHJC
	 ZWvBpVEXU0I61vDgStkoRGnXc0FltNhu9nnjlh0F4T7U80XaGJtfsH/ZMdOmuGVV2Y
	 2hbtTp4PbACPQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Andy Polyakov <appro@cryptogams.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 0/3] Consolidate Poly1305 code and add RISC-V optimization
Date: Fri, 29 Aug 2025 08:25:10 -0700
Message-ID: <20250829152513.92459-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_082627_088399_493F4E88 
X-CRM114-Status: GOOD (  10.97  )
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git poly1305-v3

This series simplifies and optimizes the organization of the Poly1305
code by consolidating it into a single module.  This follows the example
of SHA-1, SHA-256, SHA-512, CRC32, etc.

Since the RISC-V Poly1305 patch has had a moving target, I also rebased
it on top of this series and included it as patch 3.

Changed in v3:
- Added mips/poly1305-core.S and riscv/poly1305-core.S to 'targets'.
  This fixed a bug where the perlasm build step was always running.

Changed in v2:
- Added missing 'FORCE' to the make rules for mips/poly1305-core.S
  and riscv/poly1305-core.S.

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
 lib/crypto/Makefile                           |  73 +-
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
 31 files changed, 1176 insertions(+), 466 deletions(-)
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


base-commit: 5012bd2dc6ab0c4499923b3b6c6113def9b0c88b
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
