Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E11C7EE43
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 21:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xfFA5XaYNutG4tqfhN0OXNPvjc2w0qNtNhP3OynImsg=; b=EoNm8+MBOH1SYb
	swjCnNN02scCyV7U4i3emDXJn85G0s3pCgQr+apwwqvieMK2xqJarEeePSNY+F7SMb/+4SuHJNnXH
	evZ5gPXgntZUtOrodlLwTaccGo3QQnrvcsjn/8YM5EMvohzTUntKIl4lLcwh/pyUsoY+px6+TQzl6
	1seyYLUy+tDTA5EmiZqgh+KrHXvzsKccmR3VlDAwfz+wCXjYq9O6vgDlh+3vpmiy3J0P5MMefVC4J
	t/1e6uSFYkdoEjAmC0n8oZbLZ6EvDuzErYJw8ed7Rwe0f/iJmR4PxHsW4JHbW/98jVDY9KzHUIQrT
	9MNw3sLeznmmUCbGwatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8oj6-005NS2-11;
	Mon, 12 Jun 2023 21:05:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8oik-005Mza-0H
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 21:05:05 +0000
Received: from i53875b22.versanet.de ([83.135.91.34] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q8oia-0005fR-KP; Mon, 12 Jun 2023 23:04:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: heiko@sntech.de,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v5 0/4] Implement GCM ghash using Zbc and Zbkb extensions
Date: Mon, 12 Jun 2023 23:04:38 +0200
Message-Id: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_140502_180121_8400E990 
X-CRM114-Status: GOOD (  12.55  )
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

Heiko Stuebner (4):
  RISC-V: add Zbc extension detection
  RISC-V: add Zbkb extension detection
  RISC-V: hook new crypto subdir into build-system
  RISC-V: crypto: add accelerated GCM GHASH implementation

 arch/riscv/Kbuild                      |   1 +
 arch/riscv/Kconfig                     |  22 ++
 arch/riscv/crypto/Kconfig              |  18 ++
 arch/riscv/crypto/Makefile             |  18 ++
 arch/riscv/crypto/ghash-riscv64-glue.c | 296 +++++++++++++++++
 arch/riscv/crypto/ghash-riscv64-zbc.pl | 427 +++++++++++++++++++++++++
 arch/riscv/crypto/riscv.pm             | 258 +++++++++++++++
 arch/riscv/include/asm/hwcap.h         |   2 +
 arch/riscv/kernel/cpu.c                |   2 +
 arch/riscv/kernel/cpufeature.c         |   2 +
 crypto/Kconfig                         |   3 +
 11 files changed, 1049 insertions(+)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile
 create mode 100644 arch/riscv/crypto/ghash-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zbc.pl
 create mode 100644 arch/riscv/crypto/riscv.pm

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
