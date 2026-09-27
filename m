Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67A9CA5FA4
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 22:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ASi+IKMgCr39P1cv0SGeAUcik/hd7SGvpp8o9jsJhyw=; b=pVtcbl1VVejAhR
	2e4HaoAKeJaw9wBUW58ZU92aNyCveVgWmgvslKEMq4dDhl1dwZS3ffe/MllgRhimHnG/jPMs0mCTl
	rFTu0uZY952nWenRv0jdnB964DiaExohBf9MzYWNep6DYOXRVs92I+NV+1XQQ2RrIFxjakioHAgKO
	uS7wRDyRPTMyiN420JQBsJqmJFVwQqtkTbz+6Eobg72ANxZbMHEJAuRpOkEXJqPxe6ff4fMnBgvZG
	KuVl3Sywo6O2n7esKDRLBpjHtv2QhjUyj9fnCcGc2ulwTIt0GsUlCu3ka/wwODqX7eFCQc7uJU5d1
	ngcruayDFcDTsVpFXECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxbt-0000000GwRL-2tix;
	Sun, 27 Sep 2026 22:44:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxbr-0000000GwQZ-3ZKI
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 22:44:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ECAD860052;
	Sun, 27 Sep 2026 22:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD561F000FF;
	Sun, 27 Sep 2026 22:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790549078;
	bh=s2N7GNIO6miAwE7X2Pn0iAVzatHtV0DEhOyH9Zjk3tw=;
	h=From:To:Cc:Subject:Date;
	b=Ig26Mr6NohGwvXMpKXVrLsCpSsSlrXYuCp1DXpKAE6iTZPF3Igmahkqp0X2s9bUcB
	 71ejAi0bNbGnQmVA7NrI84AMX+LtYUmIADBLrta10I6gxnx9eF5dbbAKUU7DhmaVQ1
	 1FZsQxuKreppydshCeduP4D7fV1A5YuE19UYd2ceZpjO+2uZz/VLZ3SvUd1TJHjNCY
	 7uYumAKzUBdQ/JUpeuz+LZ8Y+/irdvNhovQcLukQFAKtf5IUFSX8X3sl6UQ4rDyV21
	 mfkAviQSY8q4mkKyNwjRYQidu1Kl8i1jWQrEzUx9FDzTjGad3XmbIRQj7AnUGAr7Wk
	 /YhSj5uVEomBQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 00/20] Migrate x86 and RISC-V accelerated AES modes into library
Date: Sun, 27 Sep 2026 15:42:51 -0700
Message-ID: <20260927224418.109759-1-ebiggers@kernel.org>
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

This series applies to v7.3-rc4.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-x86-riscv-v2

Patch 1 was already applied to libcrypto-fixes, but is resent to make
this series applicable directly to v7.3-rc4 (ensuring that the Sashiko
review runs).  Patches 2-20 are targeting libcrypto-next for 7.4.

This series migrates the x86 and RISC-V accelerated implementations of
the AES modes ECB, CBC, CBC-CTS, CTR, XCTR, and XTS into lib/crypto/.

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

For various reasons, aesni-intel_asm.S (the x86-accelerated ECB, CBC,
CBC-CTS, CTR, and XTS code that doesn't use AVX or VAES) is replaced
with new functions written from scratch.  The other assembly functions
are kept but are modified slightly for integration into the library.

Changed in v2:
   - Fixed 32-bit x86 bisection hazards by making aesni-intel depend on
     CONFIG_64BIT earlier in the series.

   - Fixed handling of lengths over S32_MAX in RISC-V CTR code.

   - Restored selection of CRYPTO_SKCIPHER by CRYPTO_AES_NI_INTEL, since
     it is still needed.

   - Made the 32-bit x86 XTS code spill the tweaks to the stack rather
     than to the destination buffer.

   - Removed the no-longer-needed single block special case from the
     RISC-V CBC-CTS assembly code.

   - Made x86 CBC-CTS encryption and decryption share more code.

   - Reordered the function parameters in aes-xts-avx-x86_64.S and
     aes-ctr-avx-x86_64.S.

   - Other miscellaneous cleanups.

Eric Biggers (20):
  crypto: aes - Fix undesired override of some optimized AES modes
  lib/crypto: aes-xctr: Pass counter by value to aes_xctr_arch()
  lib/crypto: x86/aes: Clean up aes-aesni.S in preparation for AES modes
  lib/crypto: x86/aes-ecb: Add AES-NI optimization
  lib/crypto: x86/aes-cbc: Add AES-NI optimization
  lib/crypto: x86/aes-ctr: Add AES-NI optimization
  lib/crypto: x86/aes-xts: Add AES-NI optimization
  crypto: x86/aes - Drop superseded 32-bit build support
  crypto: x86/aes-ecb - Remove superseded ECB skcipher
  crypto: x86/aes-cbc - Remove superseded CBC skciphers
  crypto: x86/aes-ctr - Remove superseded CTR skcipher
  crypto: x86/aes-xts - Remove superseded XTS skcipher
  lib/crypto: x86/aes-ctr: Migrate AVX-optimized code into library
  lib/crypto: x86/aes-xts: Migrate AVX-optimized code into library
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
 arch/x86/crypto/Kconfig                       |   10 +-
 arch/x86/crypto/Makefile                      |   10 +-
 arch/x86/crypto/aesni-intel_asm.S             | 1338 -----------------
 arch/x86/crypto/aesni-intel_glue.c            |  792 +---------
 crypto/aes.c                                  |   53 +-
 lib/crypto/Makefile                           |   14 +
 lib/crypto/aes.c                              |    6 +-
 .../crypto => lib/crypto/riscv}/aes-macros.S  |   25 +-
 .../riscv}/aes-riscv64-zvkned-zvbb-zvkg.S     |   99 +-
 .../crypto/riscv}/aes-riscv64-zvkned-zvkb.S   |   23 +-
 lib/crypto/riscv/aes-riscv64-zvkned.S         |  305 +++-
 lib/crypto/riscv/aes.h                        |  244 ++-
 lib/crypto/x86/aes-aesni.S                    |  816 +++++++++-
 .../crypto/x86}/aes-ctr-avx-x86_64.S          |  103 +-
 .../crypto/x86}/aes-xts-avx-x86_64.S          |  179 +--
 lib/crypto/x86/aes.h                          |  381 ++++-
 20 files changed, 1852 insertions(+), 3443 deletions(-)
 delete mode 100644 arch/riscv/crypto/aes-riscv64-glue.c
 delete mode 100644 arch/riscv/crypto/aes-riscv64-zvkned.S
 delete mode 100644 arch/x86/crypto/aesni-intel_asm.S
 rename {arch/riscv/crypto => lib/crypto/riscv}/aes-macros.S (90%)
 rename {arch/riscv/crypto => lib/crypto/riscv}/aes-riscv64-zvkned-zvbb-zvkg.S (74%)
 rename {arch/riscv/crypto => lib/crypto/riscv}/aes-riscv64-zvkned-zvkb.S (93%)
 rename {arch/x86/crypto => lib/crypto/x86}/aes-ctr-avx-x86_64.S (88%)
 rename {arch/x86/crypto => lib/crypto/x86}/aes-xts-avx-x86_64.S (81%)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
