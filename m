Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C54EC001E0
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 15:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aR9asUaV5n9se/tmg/peFuic697dhUE8HEUXZslzTG4=; b=U+J7y/BhCny2GE
	HUBAt1No5BFVzSNSsXD32SQZsFghFurzJhk8erUTdcnL5uc+aNRS8SA0857QIIP4TjlmH5u10Sj54
	5MZUlChsT/MLz+0DlXLDfo7M5shTSOv/6HicfR6+eMQsR2C/Yvx/U7Sw/S1QGP6T5n3GlnLY9Xhwj
	e2e8koBk6OmfJJ81j9VXoaRExGSlim1MaGsrA0sW5Y9VUaO7k/M9lsYabIlpxsjh9/xtZUKYXXzLW
	TPyj4ggg5FddXddBnhukQZT4LjhZl7cG3C2mZm8Z93ZjV8L+5JgSj0MEQ9FU5mMgjcmt3ACiVXtpP
	vpjJSpNRPTPQvSMXwcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFRA-00FGW3-32;
	Tue, 11 Jul 2023 15:38:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJFR3-00FGR7-38
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 15:37:57 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qJFQw-0000g0-J0; Tue, 11 Jul 2023 17:37:46 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: aou@eecs.berkeley.edu,
	heiko@sntech.de,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	ebiggers@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
Date: Tue, 11 Jul 2023 17:37:31 +0200
Message-Id: <20230711153743.1970625-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_083754_057154_0EA477F7 
X-CRM114-Status: GOOD (  15.26  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

This series provides cryptographic implementations using the vector
crypto extensions.

v13 of the vector patchset dropped the patches for in-kernel usage of
vector instructions, I picked the ones from v12 over into this series
for now.

My basic goal was to not re-invent cryptographic code, so the heavy
lifting is done by those perl-asm scripts used in openssl and the perl
code used here-in stems from code that is targetted at openssl [0] and is
unmodified from there to limit needed review effort.

With a matching qemu (there are patches for vector-crypto flying around)
the in-kernel crypto-selftests (also the extended ones) are very happy
so far.


changes in v4:
- split off from scalar crypto patches but base on top of them
- adapt to pending openssl code [0] using the now frozen vector crypto
  extensions - with all its changes
  [0] https://github.com/openssl/openssl/pull/20149

changes in v3:
- rebase on top of 6.3-rc2
- rebase on top of vector-v14 patchset
- add the missing Co-developed-by mentions to showcase
  the people that did the actual openSSL crypto code

changes in v2:
- rebased on 6.2 + zbb series, so don't include already
  applied changes anymore
- refresh code picked from openssl as that side matures
- more algorithms (SHA512, AES, SM3, SM4)

Greentime Hu (2):
  riscv: Add support for kernel mode vector
  riscv: Add vector extension XOR implementation

Heiko Stuebner (10):
  RISC-V: add helper function to read the vector VLEN
  RISC-V: add vector crypto extension detection
  RISC-V: crypto: update perl include with helpers for vector (crypto)
    instructions
  RISC-V: crypto: add Zvbb+Zvbc accelerated GCM GHASH implementation
  RISC-V: crypto: add Zvkg accelerated GCM GHASH implementation
  RISC-V: crypto: add a vector-crypto-accelerated SHA256 implementation
  RISC-V: crypto: add a vector-crypto-accelerated SHA512 implementation
  RISC-V: crypto: add Zvkned accelerated AES encryption implementation
  RISC-V: crypto: add Zvksed accelerated SM4 encryption implementation
  RISC-V: crypto: add Zvksh accelerated SM3 hash implementation

 arch/riscv/crypto/Kconfig                     |  68 ++-
 arch/riscv/crypto/Makefile                    |  44 +-
 arch/riscv/crypto/aes-riscv-glue.c            | 168 ++++++
 arch/riscv/crypto/aes-riscv64-zvkned.pl       | 530 ++++++++++++++++++
 arch/riscv/crypto/ghash-riscv64-glue.c        | 245 ++++++++
 arch/riscv/crypto/ghash-riscv64-zvbb-zvbc.pl  | 380 +++++++++++++
 arch/riscv/crypto/ghash-riscv64-zvkg.pl       | 168 ++++++
 arch/riscv/crypto/riscv.pm                    | 433 +++++++++++++-
 arch/riscv/crypto/sha256-riscv64-glue.c       | 115 ++++
 .../crypto/sha256-riscv64-zvbb-zvknha.pl      | 314 +++++++++++
 arch/riscv/crypto/sha512-riscv64-glue.c       | 106 ++++
 .../crypto/sha512-riscv64-zvbb-zvknhb.pl      | 377 +++++++++++++
 arch/riscv/crypto/sm3-riscv64-glue.c          | 112 ++++
 arch/riscv/crypto/sm3-riscv64-zvksh.pl        | 225 ++++++++
 arch/riscv/crypto/sm4-riscv64-glue.c          | 162 ++++++
 arch/riscv/crypto/sm4-riscv64-zvksed.pl       | 300 ++++++++++
 arch/riscv/include/asm/hwcap.h                |   9 +
 arch/riscv/include/asm/vector.h               |  28 +
 arch/riscv/include/asm/xor.h                  |  82 +++
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/cpu.c                       |   8 +
 arch/riscv/kernel/cpufeature.c                |  50 ++
 arch/riscv/kernel/kernel_mode_vector.c        | 132 +++++
 arch/riscv/lib/Makefile                       |   1 +
 arch/riscv/lib/xor.S                          |  81 +++
 25 files changed, 4136 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/crypto/aes-riscv-glue.c
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvbb-zvbc.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkg.pl
 create mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha256-riscv64-zvbb-zvknha.pl
 create mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha512-riscv64-zvbb-zvknhb.pl
 create mode 100644 arch/riscv/crypto/sm3-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sm3-riscv64-zvksh.pl
 create mode 100644 arch/riscv/crypto/sm4-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sm4-riscv64-zvksed.pl
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
