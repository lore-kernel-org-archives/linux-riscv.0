Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF41C87FDA
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tteqV6O9hFjH7tXastyL5gDyXyabto9V1ZoZs3Cx/xA=; b=1fOXA+vLCf9Gw2
	V597HXtqfcheeGKJTjThtqi0ovG48uFBYFviriKiqgoKHg7vA55DJt9n7UiqiHNS6Nnm6WxYqmOIc
	zR72tkwBqjAn+hJvutTPI+67sSLpNSaWxbn6y3YYqoYfptdZqlUy9BSg1+gw24asF9Pow7OYJjQ74
	EW1ueiup1S2mZ9khWZRynn9g/9v/j554LYhbBxIZiUBVOdFzKr6lKVO0RUyEsJ25rermrnIoatN4T
	6j6tfdP+hjO9/BLHLpA72rzsFNlC0ER5uye3/vw8mRXdoPomK2N/+z9opdvlwGjTsA3m6u+1anPjh
	3OV4CsAF3rY2nvNek/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKP-0000000B0ol-21Ls;
	Mon, 04 Aug 2025 16:46:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIN-0000000Azx8-0REz
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3799560200;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE13C4CEE7;
	Mon,  4 Aug 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325857;
	bh=r2v62d4bVt9owj808SKHRzdSx9oLY8KjiUCy34x/12Y=;
	h=From:To:Cc:Subject:Date:From;
	b=qoDkY9It5/lqR9fbX6g8iGg/nmmtCv14BOgAwhkb5uNiClyFaMkiukY7Oc+J1MaKh
	 dZnz4X/S3ajFCt76duYJHDx0quVZH6oSu/c0vStSRzaSzbCcMKFV4L18ye0ZTJoXPN
	 i3oURUhH5BvGFLUiBhUMaVt9LAqwPNrH4pyC8RyKbvz3yMn0pqcXcQS+g91j40QHjM
	 lNQCmlS8pNR7LcsmFHjuc2AbEWdFGnRvWbhlC/VB8DAo2fUatOIF7DscYokL7FpXgy
	 l5z39sJCmL4o5lHPcQDJdF9jtn/jsrC9WDmDQnvKWCYKZ26XpAxSx9TjSBv7Ns52lt
	 j7UHemkdNe4Mg==
From: Kees Cook <kees@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 00/17] Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:43:56 -0700
Message-Id: <20250804163910.work.929-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619; i=kees@kernel.org; h=from:subject:message-id; bh=r2v62d4bVt9owj808SKHRzdSx9oLY8KjiUCy34x/12Y=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHofFXgjp7KzykhVPcF48Q+LLy7qNn3Wc38x5WLbt/ 44z4VPWdZSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEzERo7hf8kiKe0FSd8l7Cv7 We7uUrdPYDs+m0lg/c5Dkx57tW49XMrwT2vS53lTDZ/v/XEnZcFFsaM9CXKfOL49eCxys3TZx5i tytwA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Hi,

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute_const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Add KUnit tests for the family of functions and then add __attribute_const__
to all architecture implementations and wrappers.

-Kees

[1] https://github.com/KSPP/linux/issues/364

Kees Cook (17):
  KUnit: Introduce ffs()-family tests
  bitops: Add __attribute_const__ to generic ffs()-family
    implementations
  csky: Add __attribute_const__ to ffs()-family implementations
  x86: Add __attribute_const__ to ffs()-family implementations
  powerpc: Add __attribute_const__ to ffs()-family implementations
  sh: Add __attribute_const__ to ffs()-family implementations
  alpha: Add __attribute_const__ to ffs()-family implementations
  hexagon: Add __attribute_const__ to ffs()-family implementations
  riscv: Add __attribute_const__ to ffs()-family implementations
  openrisc: Add __attribute_const__ to ffs()-family implementations
  m68k: Add __attribute_const__ to ffs()-family implementations
  mips: Add __attribute_const__ to ffs()-family implementations
  parisc: Add __attribute_const__ to ffs()-family implementations
  s390: Add __attribute_const__ to ffs()-family implementations
  xtensa: Add __attribute_const__ to ffs()-family implementations
  sparc: Add __attribute_const__ to ffs()-family implementations
  KUnit: ffs: Validate all the __attribute_const__ annotations

 lib/Kconfig.debug                          |  14 +
 lib/tests/Makefile                         |   1 +
 arch/alpha/include/asm/bitops.h            |  14 +-
 arch/csky/include/asm/bitops.h             |   8 +-
 arch/hexagon/include/asm/bitops.h          |  10 +-
 arch/m68k/include/asm/bitops.h             |  14 +-
 arch/mips/include/asm/bitops.h             |   8 +-
 arch/openrisc/include/asm/bitops/__ffs.h   |   2 +-
 arch/openrisc/include/asm/bitops/__fls.h   |   2 +-
 arch/openrisc/include/asm/bitops/ffs.h     |   2 +-
 arch/openrisc/include/asm/bitops/fls.h     |   2 +-
 arch/parisc/include/asm/bitops.h           |   6 +-
 arch/powerpc/include/asm/bitops.h          |   4 +-
 arch/riscv/include/asm/bitops.h            |   6 +-
 arch/s390/include/asm/bitops.h             |  10 +-
 arch/sh/include/asm/bitops.h               |   4 +-
 arch/sparc/include/asm/bitops_64.h         |   8 +-
 arch/x86/include/asm/bitops.h              |  12 +-
 arch/xtensa/include/asm/bitops.h           |  10 +-
 include/asm-generic/bitops/__ffs.h         |   2 +-
 include/asm-generic/bitops/__fls.h         |   2 +-
 include/asm-generic/bitops/builtin-__ffs.h |   2 +-
 include/asm-generic/bitops/builtin-__fls.h |   2 +-
 include/asm-generic/bitops/builtin-fls.h   |   2 +-
 include/asm-generic/bitops/ffs.h           |   2 +-
 include/asm-generic/bitops/fls.h           |   2 +-
 include/asm-generic/bitops/fls64.h         |   4 +-
 include/linux/bitops.h                     |   2 +-
 lib/clz_ctz.c                              |   8 +-
 lib/tests/ffs_kunit.c                      | 566 +++++++++++++++++++++
 30 files changed, 656 insertions(+), 75 deletions(-)
 create mode 100644 lib/tests/ffs_kunit.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
