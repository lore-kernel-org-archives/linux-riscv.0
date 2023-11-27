Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C64DC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 07:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1XLPC3nH5ATKBjeORbXW9KgHHe0tpd4HYKpG0lu86BU=; b=2pqe22IoVMj8bx
	+VuBr+53kxFKLhFtazzC3up4ZThne2C5dNp4XvhMJeWDcfhVVCSkfmRYt7e+IQ3A6hB+B7j2CyoRj
	+VHpKVSLsP1y0EKa5+Z4kMphANHZlc8jc4ggq9FReW1iykxaPkKi4wZoJDbUFjEmqX0snIGdlZywu
	LBjaC2nmFHjvaF8UNLK3kfwoAhFe6KgEug2w2xylL5J5RHbYphe1SbPvjmJqnl90Vea/b9vknukqo
	+lJmkIJ3cgtKaoJBdeADH0YvLtDi6fA4F9lu3l8tRfnrkxl6WtITWKejca7T4Kupesa5UiWEN5M82
	u5PQeAAuJpxyz8byHavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ViB-001eo3-2H;
	Mon, 27 Nov 2023 07:07:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Vi7-001emL-2N
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 07:07:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2851a2b30a2so2538377a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701068833; x=1701673633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0gSkc9h7Dt01uGTWB4LCFdNicZR7jg2IspiMbYPhPs=;
        b=LsbiCC6/Siq191yeEDK6OXqJCDmgNWoPd/HUuQF/EZKF4kR4tz2tDxjcwRL0eQw01X
         R+YPrQfKLVsTwQwstHJS/wy0zxmkihpJ/gH2SPXuxXs+Fhdp+fjTU2kDEiwhJ2j75WB7
         JSK93icUqfKG614sOWrAADYQAANqBlpdOIl/7MKOoHeg8OXnsijrFoURwaBlL6BIDba7
         EBgtrrDQRBFUjPbfu1KbnYPFe9jUK/gfqFaJbvdMKTKsf9hDnqGGaVpaGOvfdPlguUK1
         RB59BtyfAdjDoLK28GNw8LVENFUcihZ9U+tnNFnXQeHECcmvy4Zh31+LDsGKFnWkMw9q
         DaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701068833; x=1701673633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0gSkc9h7Dt01uGTWB4LCFdNicZR7jg2IspiMbYPhPs=;
        b=Vm0bsuJglnfkvZ4i9zHJlHabODoUI0bVLTBiXzMdkSeCOv7jTHHSsY21Nb3eH/LNF/
         eUJmwaz3FRR/Mt+VK1jrLNS4ltwpDnYcKbmhmiaO4t4XzRbV3ebuKcbMMFvJzWfL4EnN
         w23OnxkwWSCJwKnTTRuok6qf/FVB3RmlLSXK0C68c6f/JP9hbjAlV/uaBFf5K4jeL/GV
         G5Wk7PJKsdTqM7EBhVVTCDL5180+kw5ZSPkAq3ds9qLniJuLIKnKsiKEW/5jKfEu+a2c
         nABZBOqinK5Ln4wQs/RTc3h1ulbBecJQ0UH7P2L7mg2D4bXrXshwMpP1kHbSUZRUWzdf
         FLBg==
X-Gm-Message-State: AOJu0Yz/SQsyZEMcSLaK1rhJSKXbv6khpkuuJwFc9Lf4hpLWbO50au8q
	lYWuQHK2ySdRYPrj5L8Umn0zOg==
X-Google-Smtp-Source: AGHT+IEfe6FjAY/b3i+5RpV4TYqK3Omg/1PqoyhXli/ctCcwdTs4Sv4A93+zLYj5Jd499/7PyEN7uw==
X-Received: by 2002:a17:90b:4a03:b0:280:8544:42fb with SMTP id kk3-20020a17090b4a0300b00280854442fbmr9692227pjb.17.1701068833493;
        Sun, 26 Nov 2023 23:07:13 -0800 (PST)
Received: from localhost.localdomain ([101.10.45.230])
        by smtp.gmail.com with ESMTPSA id jh15-20020a170903328f00b001cfcd3a764esm1340134plb.77.2023.11.26.23.07.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 23:07:12 -0800 (PST)
From: Jerry Shih <jerry.shih@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	conor.dooley@microchip.com,
	ebiggers@kernel.org,
	ardb@kernel.org
Cc: heiko@sntech.de,
	phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v2 00/13] RISC-V: provide some accelerated cryptography implementations using vector extensions
Date: Mon, 27 Nov 2023 15:06:50 +0800
Message-Id: <20231127070703.1697-1-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_230715_837990_77B6E5EC 
X-CRM114-Status: GOOD (  15.41  )
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
mnemonics. The reason for using opcodes is because that we don't want to
re-implement all crypto functions from OpenSSL. We will try to replace
perl-asm with asm mnemonics in the future. It needs lots of extensions
checking for toolchains. We already have RVV 1.0 in kernel, so we will
replace the RVV opcodes with asm mnemonics at first.

All changes pass the kernel run-time crypto self tests and the extra tests
with vector-crypto-enabled qemu.
Link: https://lists.gnu.org/archive/html/qemu-devel/2023-11/msg00281.html

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
Link: https://github.com/JerryShih/linux/tree/dev/jerrys/vector-crypto-upstream-v2

[1]
Link: https://github.com/riscv/riscv-crypto/blob/56ed7952d13eb5bdff92e2b522404668952f416d/doc/vector/riscv-crypto-spec-vector.adoc
[2]
Link: https://github.com/openssl/openssl/pull/21923

Updated patches (on current order): 4, 7, 8, 9, 10, 11, 12, 13
New patch: 6,
Unchanged patch: 1, 2, 3, 5
Deleted patch: -

Changelog v2:
 - Do not turn on the RISC-V accelerated crypto kconfig options by
   default.
 - Assume RISC-V vector extension could support unaligned access in
   kernel.
 - Turn to use simd skcipher interface for AES-CBC/CTR/ECB/XTS and
   Chacha20.
 - Rename crypto file and driver names to make the most important
   extension at first place.

Heiko Stuebner (2):
  RISC-V: add helper function to read the vector VLEN
  RISC-V: hook new crypto subdir into build-system

Jerry Shih (11):
  RISC-V: crypto: add OpenSSL perl module for vector instructions
  RISC-V: crypto: add Zvkned accelerated AES implementation
  crypto: simd - Update `walksize` in simd skcipher
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
 arch/riscv/crypto/Kconfig                     |  110 ++
 arch/riscv/crypto/Makefile                    |   68 +
 .../crypto/aes-riscv64-block-mode-glue.c      |  514 +++++++
 arch/riscv/crypto/aes-riscv64-glue.c          |  151 ++
 arch/riscv/crypto/aes-riscv64-glue.h          |   18 +
 .../crypto/aes-riscv64-zvkned-zvbb-zvkg.pl    |  949 ++++++++++++
 arch/riscv/crypto/aes-riscv64-zvkned-zvkb.pl  |  415 +++++
 arch/riscv/crypto/aes-riscv64-zvkned.pl       | 1339 +++++++++++++++++
 arch/riscv/crypto/chacha-riscv64-glue.c       |  122 ++
 arch/riscv/crypto/chacha-riscv64-zvkb.pl      |  321 ++++
 arch/riscv/crypto/ghash-riscv64-glue.c        |  175 +++
 arch/riscv/crypto/ghash-riscv64-zvkg.pl       |  100 ++
 arch/riscv/crypto/riscv.pm                    |  828 ++++++++++
 arch/riscv/crypto/sha256-riscv64-glue.c       |  145 ++
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.pl   |  318 ++++
 arch/riscv/crypto/sha512-riscv64-glue.c       |  139 ++
 .../crypto/sha512-riscv64-zvknhb-zvkb.pl      |  266 ++++
 arch/riscv/crypto/sm3-riscv64-glue.c          |  124 ++
 arch/riscv/crypto/sm3-riscv64-zvksh.pl        |  230 +++
 arch/riscv/crypto/sm4-riscv64-glue.c          |  121 ++
 arch/riscv/crypto/sm4-riscv64-zvksed.pl       |  268 ++++
 arch/riscv/include/asm/vector.h               |   11 +
 crypto/Kconfig                                |    3 +
 crypto/cryptd.c                               |    1 +
 crypto/simd.c                                 |    1 +
 include/crypto/scatterwalk.h                  |    9 +-
 27 files changed, 6745 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile
 create mode 100644 arch/riscv/crypto/aes-riscv64-block-mode-glue.c
 create mode 100644 arch/riscv/crypto/aes-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/aes-riscv64-glue.h
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned-zvbb-zvkg.pl
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned-zvkb.pl
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned.pl
 create mode 100644 arch/riscv/crypto/chacha-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/chacha-riscv64-zvkb.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkg.pl
 create mode 100644 arch/riscv/crypto/riscv.pm
 create mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.pl
 create mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.pl
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
