Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50DCC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=osSc4MfTAqFsnHO++m41tXNhK3PVWYuz82/aH3NqOHI=; b=aMULwc2Xx95VpT
	OHDsC5RTiZV2sInu1dDxXCrb4KHrTf8tF0Lh9/nqyCm7iTCR+dt+vsuNesvB3ZeGQhb26xTJCrqxx
	AjXhaCjpjHa65w0EYH/m/RHQYmXbH4D8hqYRHbHf/xprhWuDMUEEM2FJLchyT32Xf2+vUE7Vkc0z2
	zKCbLIWxrhKm/orhhii0jWkcfvU08e8lVb9Ochm/H+jXoQ2IibOyJu6wNNRy0zfFdnA/nARoQdUES
	Ta2OXmLg9cUV70sLfIlbe7optw0zO8oJssSGX4gtVrH40A2Xyr8RccvcbgGRovh/51hwZUkM83rfM
	CvkDRiK3GopQicr9asyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvike-00CsEl-2Q;
	Wed, 25 Oct 2023 18:37:08 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvikY-00CsC9-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:37:03 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-578b4997decso90292a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698259015; x=1698863815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MeoxSvV9LV2U+gpMh6CC2wXStEN6WTZDI/w5L7HPlVc=;
        b=JHB93qDgCOxys9/urYs8fiQvGko8yo5Fz1+ocQOpVKyOX8nYmL0CRgJ5AI7RQfz2rk
         fJiKuAFem/cHDBhU5/ic5cKDOtFknHk/kaNmcyJtYrzonsRsq4h3vLxoQL1gZKlC3493
         l3pCADVPiQiVZZACgiRw37TjKFlDjoxzrCoEqa6mqCwfORIopdARbAgTETLnEGexfS6c
         JtI5v+Gi3YtgzSI1rLNw2Tq8O5A5dDK+lvkO0OjK5CGbPc8h4kqx3xGheiGnTNX62qqf
         Q3U9DWvvtFlchA76TxvplT5d8ZCtUj8NZkLZeYpROSzbAx67o1dQx3Hs/W87w2937wBT
         uYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698259015; x=1698863815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeoxSvV9LV2U+gpMh6CC2wXStEN6WTZDI/w5L7HPlVc=;
        b=TY1IJ8karU4UbUa/sYpnVwtqC6gdkLAKenZ0ThDtf2ZG5ddHHjaFmz7Voyf8fdX1ew
         vXpYvTxnsYEsLzDufR617JqagXiH/EcibWz0PZHdF+/VUMks2RcfbbSsyOLq+wJzNR+X
         faOp5802aQhV5WTmn7lhE5AsvLwFkWNxpSX+45uZPBEIiPmNPP9W4iUM18cfKjyOveac
         m1VhMnO76cLjbYirM5sGOm/1ijRo5k9Y3HX2T+KBvIhfQ5GpEf27zUqDJHdwQKhQynJS
         sk5vy7MWEbu99O8luKnLSh6FO+RGD5EyUmZ99pHjXOvLaGEQoT0uAqWRnaBYlAh2BxKP
         TpkQ==
X-Gm-Message-State: AOJu0YwbVC8S2B/dHjOcz+zynO0emuBrFgJc3pn/3VneKUh2x1SVZace
	+L490CI7BN0HP6gXbTEfCntjTg==
X-Google-Smtp-Source: AGHT+IFfd/y0Uqk6Sja7NmgNAKBqvxI3L0l/mRT4fBC9syHwD+hKKysPTBLuWSSVBYm0Fq+qEbn5ZA==
X-Received: by 2002:a17:90a:7066:b0:27d:4d98:6812 with SMTP id f93-20020a17090a706600b0027d4d986812mr16981848pjk.38.1698259015482;
        Wed, 25 Oct 2023 11:36:55 -0700 (PDT)
Received: from localhost.localdomain ([49.216.222.119])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090adb0300b00278f1512dd9sm212367pjv.32.2023.10.25.11.36.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Oct 2023 11:36:54 -0700 (PDT)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@kernel.org,
	bjorn@rivosinc.com,
	heiko@sntech.de,
	ebiggers@kernel.org,
	ardb@kernel.org,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH 00/12] RISC-V: provide some accelerated cryptography implementations using vector extensions
Date: Thu, 26 Oct 2023 02:36:32 +0800
Message-Id: <20231025183644.8735-1-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_113702_215153_BA450995 
X-CRM114-Status: GOOD (  13.27  )
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

This series provides cryptographic implementations using the vector crypto
extensions[1] including:
1. AES cipher
2. AES with CBC/CTR/ECB/XTS block modes
3. ChaCha20 stream cipher
4. GHASH for GCM
5. SHA-224/256 and SHA-384/512 hash
6. SM3 hash
7. SM4 cipher

This patch set is based on Heiko Stuebner's work at:
Link: https://lore.kernel.org/all/20230711153743.1970625-1-heiko@sntech.de/

The implementations reuse the perl-asm scripts from OpenSSL[2] with some
changes adapting for the kernel crypto framework.
The perl-asm scripts generate the opcodes into `.S` files instead of asm
mnemonics. The reason for using opcodes is because the assembler hasn't
supported the vector-crypto extensions yet.

All changes pass the kernel run-time crypto self tests and the extra tests
with vector-crypto-enabled qemu.
Link: https://lists.gnu.org/archive/html/qemu-devel/2023-10/msg08822.html

This series depend on:
1. kernel 6.6-rc7
Link: https://github.com/torvalds/linux/commit/05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
2. support kernel-mode vector
Link: https://lore.kernel.org/all/20230721112855.1006-1-andy.chiu@sifive.com/
3. vector crypto extensions detection
Link: https://lore.kernel.org/lkml/20231017131456.2053396-1-cleger@rivosinc.com/
4. fix the error message:
    alg: skcipher: skipping comparison tests for xts-aes-aesni because
    xts(ecb(aes-generic)) is unavailable
Link: https://lore.kernel.org/linux-crypto/20231009023116.266210-1-ebiggers@kernel.org/

Here is a branch on github applying with all dependent patches:
Link: https://github.com/JerryShih/linux/tree/dev/jerrys/vector-crypto-upstream

[1]
Link: https://github.com/riscv/riscv-crypto/blob/56ed7952d13eb5bdff92e2b522404668952f416d/doc/vector/riscv-crypto-spec-vector.adoc
[2]
Link: https://github.com/openssl/openssl/pull/21923

Heiko Stuebner (2):
  RISC-V: add helper function to read the vector VLEN
  RISC-V: hook new crypto subdir into build-system

Jerry Shih (10):
  RISC-V: crypto: add OpenSSL perl module for vector instructions
  RISC-V: crypto: add Zvkned accelerated AES implementation
  crypto: scatterwalk - Add scatterwalk_next() to get the next
    scatterlist in scatter_walk
  RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS implementations
  RISC-V: crypto: add Zvkg accelerated GCM GHASH implementation
  RISC-V: crypto: add Zvknha/b accelerated SHA224/256 implementations
  RISC-V: crypto: add Zvknhb accelerated SHA384/512 implementations
  RISC-V: crypto: add Zvksed accelerated SM4 implementation
  RISC-V: crypto: add Zvksh accelerated SM3 implementation
  RISC-V: crypto: add Zvkb accelerated ChaCha20 implementation

 arch/riscv/Kbuild                             |    1 +
 arch/riscv/crypto/Kconfig                     |  122 ++
 arch/riscv/crypto/Makefile                    |   68 +
 .../crypto/aes-riscv64-block-mode-glue.c      |  486 +++++++
 arch/riscv/crypto/aes-riscv64-glue.c          |  163 +++
 arch/riscv/crypto/aes-riscv64-glue.h          |   28 +
 .../crypto/aes-riscv64-zvbb-zvkg-zvkned.pl    |  944 +++++++++++++
 arch/riscv/crypto/aes-riscv64-zvkb-zvkned.pl  |  416 ++++++
 arch/riscv/crypto/aes-riscv64-zvkned.pl       | 1198 +++++++++++++++++
 arch/riscv/crypto/chacha-riscv64-glue.c       |  120 ++
 arch/riscv/crypto/chacha-riscv64-zvkb.pl      |  322 +++++
 arch/riscv/crypto/ghash-riscv64-glue.c        |  191 +++
 arch/riscv/crypto/ghash-riscv64-zvkg.pl       |  100 ++
 arch/riscv/crypto/riscv.pm                    |  828 ++++++++++++
 arch/riscv/crypto/sha256-riscv64-glue.c       |  140 ++
 .../sha256-riscv64-zvkb-zvknha_or_zvknhb.pl   |  318 +++++
 arch/riscv/crypto/sha512-riscv64-glue.c       |  133 ++
 .../crypto/sha512-riscv64-zvkb-zvknhb.pl      |  266 ++++
 arch/riscv/crypto/sm3-riscv64-glue.c          |  121 ++
 arch/riscv/crypto/sm3-riscv64-zvksh.pl        |  230 ++++
 arch/riscv/crypto/sm4-riscv64-glue.c          |  120 ++
 arch/riscv/crypto/sm4-riscv64-zvksed.pl       |  268 ++++
 arch/riscv/include/asm/vector.h               |   11 +
 crypto/Kconfig                                |    3 +
 include/crypto/scatterwalk.h                  |    9 +-
 25 files changed, 6604 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile
 create mode 100644 arch/riscv/crypto/aes-riscv64-block-mode-glue.c
 create mode 100644 arch/riscv/crypto/aes-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/aes-riscv64-glue.h
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvbb-zvkg-zvkned.pl
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkb-zvkned.pl
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned.pl
 create mode 100644 arch/riscv/crypto/chacha-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/chacha-riscv64-zvkb.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkg.pl
 create mode 100644 arch/riscv/crypto/riscv.pm
 create mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha256-riscv64-zvkb-zvknha_or_zvknhb.pl
 create mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha512-riscv64-zvkb-zvknhb.pl
 create mode 100644 arch/riscv/crypto/sm3-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sm3-riscv64-zvksh.pl
 create mode 100644 arch/riscv/crypto/sm4-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sm4-riscv64-zvksed.pl

--
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
