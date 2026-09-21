Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1838C982DA
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 05:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wt7nEmlK7GWSj2rSvVen5DYunyzxy3o22bYxAY2cErU=; b=W9vy0NJaz8bfYE
	PYQoGIGW/QMao8DW4rmtqSeE6T3Kx2CYBYkjp+ijTm9K248W0mzCu1pcAE5p3PI8pFhVtOqANeZw3
	bnbN1xarKtE8nqJmGYaiVUpqvXKuvJyriQM4fNSRgcMWGMGhDPmfZttbzTFtK4M9SyDxDJhq0W0T0
	7GgYAbiIdYv+0Qof9D5exXVyJ/ZJqOB6MDPENvRY5MNQAAGf5kNrsb3CzxwkTBf4ZhvdqlLwHL/n0
	/b/8VP6pXAKhGm3yBSs5Ge4z9LsgYnsuwteSaoEIHe83wqH2vV7QWSGCE3Sp+20z+SA+Igc6f+pep
	r7Qe3/q5rf2jHWXz+qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNq-00000000tEm-1nrY;
	Mon, 21 Sep 2026 05:16:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNo-00000000tDs-2CKD
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 05:16:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B3D840AB3;
	Mon, 21 Sep 2026 05:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2319E1F000FF;
	Mon, 21 Sep 2026 05:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789967763;
	bh=qA1Ngc5R1c/XW8ryKGj2jFVjIRydVBq4U46bwGQ8ckw=;
	h=From:To:Cc:Subject:Date;
	b=SzHFdbW5HhOKhEH0gK7x4kemk2gUkrJzUQibnxaxO3vR04CVAhvkLwkhskDsL2tep
	 4TJu77VCIkbRexn3pWixdiZPuP4hOngzzwCPAqvSVRhFxfqnO/SojTI9yYrfAkRgGY
	 mTtA2K86p6HAonE/z7Dv0ba5RfqYOgxPMs3kIvjJYX5iUOU9KWFoUiiDjMk9lashYD
	 CoXgRsOCF1GlcSiZtBgVeTvR9LGFY86q+TfLOKwCfpn3qh40r9RbRUHXJN0QtcUxqJ
	 Lm3A+EDD9nWEzhdyuGIGsZbKN1ylnjmly1p2Y7YVQBo4MjQyR3vCnW3/wkFojQ2FDq
	 9Ir89ZxwUXDEw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 00/20] Migrate x86 and RISC-V accelerated AES modes into library
Date: Sun, 20 Sep 2026 22:08:46 -0700
Message-ID: <20260921050910.296144-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
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

This series applies to v7.3-rc3.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-x86-riscv-v1

Patch 1 is intended to be taken through libcrypto-fixes for 7.3.
Patches 2-20 are intended to be taken through libcrypto-next for 7.4.

This series migrates the x86 and RISC-V accelerated implementations of
the AES modes ECB, CBC, CTS, CTR, XCTR, and XTS into lib/crypto/.

This makes the corresponding library APIs be properly accelerated on
these architectures, while still accelerating crypto_skcipher as well
(via the library-based code in crypto/aes.c).

It removes a lot of redundant glue code, since crypto API boilerplate no
longer needs to be duplicated per-architecture.

Finally, it fixes the longstanding issue where these optimizations were
disabled by default.

In the case of RISC-V, this series handles all remaining AES code in
arch/riscv/crypto/.  In the case of x86, AES-GCM is still left in
arch/x86/crypto/ for now; it will be handled later.  Other architectures
will be handled later as well.

For various reasons, aesni-intel_asm.S (i.e. the x86-accelerated ECB,
CBC, CTS, CTR, and XTS code that doesn't use AVX or VAES) is replaced
with new functions written from scratch.  The other assembly functions
are kept but are modified slightly for integration into the library.

Eric Biggers (20):
  crypto: aes - Fix undesired override of some optimized AES modes
  lib/crypto: aes-xctr: Pass counter by value to aes_xctr_arch()
  lib/crypto: x86/aes: Clean up aes-aesni.S in preparation for AES modes
  lib/crypto: x86/aes-ecb: Add AES-NI optimization
  lib/crypto: x86/aes-cbc: Add AES-NI optimization
  lib/crypto: x86/aes-ctr: Add AES-NI optimization
  lib/crypto: x86/aes-xts: Add AES-NI optimization
  crypto: x86/aes-ecb - Remove superseded ECB skcipher
  crypto: x86/aes-cbc - Remove superseded CBC skciphers
  crypto: x86/aes-ctr - Remove superseded CTR skcipher
  crypto: x86/aes-xts - Remove superseded XTS skcipher
  lib/crypto: x86/aes-ctr: Migrate AVX-optimized code into library
  lib/crypto: x86/aes-xts: Migrate AVX-optimized code into library
  crypto: x86/aes - Drop superseded 32-bit build support
  lib/crypto: riscv/aes: Copy aes-macros.S to library
  lib/crypto: riscv/aes: Pass key struct to assembly code
  lib/crypto: riscv/aes-ecb: Migrate optimized code into library
  lib/crypto: riscv/aes-cbc: Migrate optimized code into library
  lib/crypto: riscv/aes-ctr: Migrate optimized code into library
  lib/crypto: riscv/aes-xts: Migrate optimized code into library

 arch/riscv/crypto/Kconfig                     |   15 -
 arch/riscv/crypto/Makefile                    |    4 -
 arch/riscv/crypto/aes-riscv64-glue.c          |  566 -------
 arch/riscv/crypto/aes-riscv64-zvkned.S        |  312 ----
 arch/x86/crypto/Kconfig                       |   11 +-
 arch/x86/crypto/Makefile                      |    8 +-
 arch/x86/crypto/aesni-intel_asm.S             | 1338 -----------------
 arch/x86/crypto/aesni-intel_glue.c            |  789 +---------
 crypto/aes.c                                  |   53 +-
 lib/crypto/Makefile                           |   14 +
 lib/crypto/aes.c                              |    6 +-
 .../crypto => lib/crypto/riscv}/aes-macros.S  |   25 +-
 .../riscv}/aes-riscv64-zvkned-zvbb-zvkg.S     |   96 +-
 .../crypto/riscv}/aes-riscv64-zvkned-zvkb.S   |   23 +-
 lib/crypto/riscv/aes-riscv64-zvkned.S         |  311 +++-
 lib/crypto/riscv/aes.h                        |  235 ++-
 lib/crypto/x86/aes-aesni.S                    |  823 +++++++++-
 .../crypto/x86}/aes-ctr-avx-x86_64.S          |   75 +-
 .../crypto/x86}/aes-xts-avx-x86_64.S          |  172 +--
 lib/crypto/x86/aes.h                          |  371 ++++-
 20 files changed, 1824 insertions(+), 3423 deletions(-)
 delete mode 100644 arch/riscv/crypto/aes-riscv64-glue.c
 delete mode 100644 arch/riscv/crypto/aes-riscv64-zvkned.S
 delete mode 100644 arch/x86/crypto/aesni-intel_asm.S
 rename {arch/riscv/crypto => lib/crypto/riscv}/aes-macros.S (90%)
 rename {arch/riscv/crypto => lib/crypto/riscv}/aes-riscv64-zvkned-zvbb-zvkg.S (75%)
 rename {arch/riscv/crypto => lib/crypto/riscv}/aes-riscv64-zvkned-zvkb.S (93%)
 rename {arch/x86/crypto => lib/crypto/x86}/aes-ctr-avx-x86_64.S (92%)
 rename {arch/x86/crypto => lib/crypto/x86}/aes-xts-avx-x86_64.S (81%)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
