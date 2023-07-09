Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC33C00528
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 15:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CeBefvC2uomfT2iS5QAg0lV+EvxvfkK7aiv72+I5b8Y=; b=bLJg9SUUHLxXPI
	8YQV10qZ2WWb0DFoJ5Sk+NB1f+6bpQmrmQ45KMQ2FTY+vW1xDsYAQFHifmdcA8AOGqagQiFnP3whf
	sLS/AWdZcH61wFaSwospWG0gHc4pETXiqVd6NmazpD4sXyUHrIkGbQUKisHA3cGr715zw2CJ8eIRo
	bjR5Msw8IKtDKOoQoN/AUdAiLVl7opFKfYgn+pKMUHEsUvNPIoFzj4s1AyK/fy6B7MmoLkFJ41hnk
	sGPMt2zoY++1cQwjMryyw7SxqqO6Lf7vrwm8aopX+FP54T/rTCOrIPbazuYO88FlfN0qe9BfYnNi5
	87hpG+XkAn3SACDsJIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIWYu-009MQB-2C;
	Sun, 09 Jul 2023 15:43:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIWYo-009MOe-2Z
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 15:42:57 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qIWYf-0002yG-Td; Sun, 09 Jul 2023 17:42:45 +0200
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
Subject: [PATCH v6 0/3] Implement GCM ghash using Zbc and Zbkb extensions
Date: Sun,  9 Jul 2023 17:42:40 +0200
Message-Id: <20230709154243.1582671-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_084254_853291_BF7BED5A 
X-CRM114-Status: GOOD (  13.35  )
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

This was originally part of my vector crypto series, but was part
of a separate openssl merge request implementing GCM ghash as using
non-vector extensions.

As that pull-request
    https://github.com/openssl/openssl/pull/20078
got merged recently into openssl, we could also check if this could
go into the kernel as well and provide a base for further accelerated
cryptographic support.

changes in v6:
- rebase on top of riscv/for-next
- rebase on top of Samuel Ortiz Arch-random series
  https://lore.kernel.org/r/20230709115549.2666557-1-sameo@rivosinc.com
  as it has the nicer Zbc + Zbkb integration for extensions and hwprobe
- update perl code with better licensing text (Eric)
  This was also merged into the original openSSL sources
- add SPDX license identifier (Eric)
- drop unneeded fallback element in the private struct (Herbert)

Changes in v5:
- rebased on top of 6.4-based riscv/next
- code from openssl is now dual-licensed under Apache + BSD
  see https://github.com/openssl/openssl/pull/20649
- separate init functions instead of creating them with macros (Nathan)

Changes in v4:
- rebase on top of riscv/for-next
- split out the scalar crypto implementation from the vector series
- refresh code from openSSL to match exactly
- Remove RFC label, as Zbc and Zbkb are ratified and
  the cryptographic code was merged into openSSL

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

Heiko Stuebner (3):
  RISC-V: expose Zbc as Kconfig option
  RISC-V: hook new crypto subdir into build-system
  RISC-V: crypto: add accelerated GCM GHASH implementation

 arch/riscv/Kbuild                      |   1 +
 arch/riscv/Kconfig                     |  23 ++
 arch/riscv/crypto/Kconfig              |  18 ++
 arch/riscv/crypto/Makefile             |  18 ++
 arch/riscv/crypto/ghash-riscv64-glue.c | 291 +++++++++++++++++
 arch/riscv/crypto/ghash-riscv64-zbc.pl | 430 +++++++++++++++++++++++++
 arch/riscv/crypto/riscv.pm             | 261 +++++++++++++++
 crypto/Kconfig                         |   3 +
 8 files changed, 1045 insertions(+)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile
 create mode 100644 arch/riscv/crypto/ghash-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zbc.pl
 create mode 100644 arch/riscv/crypto/riscv.pm

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
