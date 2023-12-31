Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D71C47073
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q2EbauVmke6g08VPWaddlbkvXpaQWi9gYv3QLXfHRaU=; b=fdCVYhnytTIPf9
	mMVjYrfdrd4gdLbMjBCTWTMWPIB0rjdVVV5v6pn3LO06+XO/Gj6Ws8E1Qc++DsYXRk38DkGamHkfK
	cszHJEkwf6bins9r7A8RH8F/49uIaE4pNNeXirgHNDLeANc8RWrvRTGSkHPzqXhC0PNhLKWdAs5cW
	ykcDAms/Dxltd8IZc/n9I5H9vFHaIbuL1S6xPPPX4C3inHl5CbWE/q9/gWw+eBCXJ1zWJukYnvTbG
	x595m968P2a3eNHPaCbZa/WG7PtwpnrCANs2HDd4rFfz5uxwJ1EhyXWHH2hdUOkgapsl145aKrNuK
	/khxRw66p3x9HUQVqcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJxjK-004mP1-2n;
	Sun, 31 Dec 2023 15:27:58 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJxjH-004mOJ-22
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 15:27:57 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-35fb0dcec7aso38020855ab.3
        for <linux-riscv@lists.infradead.org>; Sun, 31 Dec 2023 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704036473; x=1704641273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9j/PDsQCKNxJvXhPSwnRjZEPWOEDy7gzBo8k7L9PKtc=;
        b=j99nN5uaqEQ4vCH0oknysh2rTglVI5viAFoGvL4eFxL1QB9GRBuDMR6Slxme7bQK8N
         igNCb4GpHQ5CUGivWwmfXtMvGF5co2i8C5qPxt23zT3vwyUbNCKEnfo8GG2DcoLC8lJD
         +QfE/nJdDNKQuFcL3TrI1Ya9qfF/rz5qdd3GHvMjFD3t4wJvzuGuGCKCAejwTwB7eP1D
         yVUuoXU8N1UKC8KohvA96tAsZ4GwhlNo1oubgALowV4wlo6OjErl39APvTtvwSD48zu1
         +DcApXur6t2Knv7nir0nvrRtG8Doo62zKIb9p3BVAfl9dcYmJG4odxFLmEo9u75kcrcV
         j+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704036473; x=1704641273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9j/PDsQCKNxJvXhPSwnRjZEPWOEDy7gzBo8k7L9PKtc=;
        b=GQ3/rGVBqGo1cydcGc8J/txQ+r1SRwogfrc1TIH2u7i0K6fvBaxh+r5SO+eOE2+cq/
         26Aui5l5FFISn2a+Po55UdCidD4wl9wQNQLn2/4bRGRYHWtry3+zzrYDybkn04V68fh9
         f0z7sFgptu4xAonMQzeAlsOO1udgCWEibWB8oyJBGEy35+2k7Tn+iDNTFZQymCg9YXk0
         4f72E+YFlxEDvrGDtwx3eW068YC1vDr1OSa3ipu+FnhbPQnunTzGmfmwVjIKI1+VrVsW
         wNXkuHxSUKQJUAWyiY10tRWDZx1FKuUyeeuu85MIcnBIphQesR2zM2UNTU9buwZjS+xa
         MWwQ==
X-Gm-Message-State: AOJu0YziHZYYo837t1noO1CLnmzynHcrDSJNNxEWvyeCcxKD+2IQ5jhK
	vUHCrO7yCx1zMxxh4I5b1AfYqtn4r0VFDA==
X-Google-Smtp-Source: AGHT+IG8+YjoIiWGe/fJn9ezufjBAu+c+cQL9Jt2yHbbsR6y5VuXGEf72rzp1+nF0qsl5amU3ifDiA==
X-Received: by 2002:a05:6e02:214b:b0:360:29f:b7a6 with SMTP id d11-20020a056e02214b00b00360029fb7a6mr14781805ilv.18.1704036473641;
        Sun, 31 Dec 2023 07:27:53 -0800 (PST)
Received: from localhost.localdomain ([49.216.222.63])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001cc3c521affsm18624430plf.300.2023.12.31.07.27.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Dec 2023 07:27:52 -0800 (PST)
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
Subject: [PATCH v4 00/11] RISC-V: provide some accelerated cryptography implementations using vector extensions
Date: Sun, 31 Dec 2023 23:27:32 +0800
Message-Id: <20231231152743.6304-1-jerry.shih@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_072755_692069_690CC2D3 
X-CRM114-Status: GOOD (  13.06  )
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
The perl-asm scripts generate the RISC-V RVV 1.0 and the vector crypto 1.0
instructions into `.S` files.

All changes pass the kernel run-time crypto self tests and the extra tests
with vector-crypto-enabled qemu.
Link: https://lists.gnu.org/archive/html/qemu-devel/2023-11/msg00281.html

This series depend on:
1. kernel riscv/for-next(6.7-rc1)
Link: https://github.com/linux-riscv/linux-riscv/commit/f352a28cc2fb4ee8d08c6a6362c9a861fcc84236
2. support kernel-mode vector
Link: https://lore.kernel.org/all/20231229143627.22898-1-andy.chiu@sifive.com/

Here is a branch on github applying with all dependent patches:
Link: https://github.com/JerryShih/linux/tree/dev/jerrys/vector-crypto-upstream-v4

And here is the previous v3 link:
Link: https://lore.kernel.org/all/20231205092801.1335-1-jerry.shih@sifive.com/

[1]
Link: https://github.com/riscv/riscv-crypto/blob/56ed7952d13eb5bdff92e2b522404668952f416d/doc/vector/riscv-crypto-spec-vector.adoc
[2]
Link: https://github.com/openssl/openssl/pull/21923

Updated patches (on current order): 4, 5, 6, 7, 8, 9, 10, 11
New patch: 3
Unchanged patch: 1, 2
Deleted patch: 3, 5 in v3

Changelog v4:
 - Check the assembler capability for using the vector crypto asm
   mnemonics.
 - Use asm mnemonics for the instructions in vector crypto 1.0 extension.
 - Revert the usage of simd skcipher interface for AES-CBC/CTR/ECB/XTS and
   Chacha20.

Changelog v3:
 - Use asm mnemonics for the instructions in RVV 1.0 extension.
 - Use `SYM_TYPED_FUNC_START` for indirect-call asm symbols.
 - Update aes xts_crypt() implementation.
 - Update crypto function names with the prefix/suffix of `riscv64` or the
   specific extensions to avoid the collision with functions in `crypto/`
   or `lib/crypto/`.

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

Jerry Shih (9):
  RISC-V: add TOOLCHAIN_HAS_VECTOR_CRYPTO in kconfig
  RISC-V: crypto: add Zvkned accelerated AES implementation
  RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS implementations
  RISC-V: crypto: add Zvkg accelerated GCM GHASH implementation
  RISC-V: crypto: add Zvknha/b accelerated SHA224/256 implementations
  RISC-V: crypto: add Zvknhb accelerated SHA384/512 implementations
  RISC-V: crypto: add Zvksed accelerated SM4 implementation
  RISC-V: crypto: add Zvksh accelerated SM3 implementation
  RISC-V: crypto: add Zvkb accelerated ChaCha20 implementation

 arch/riscv/Kbuild                             |    1 +
 arch/riscv/Kconfig                            |    8 +
 arch/riscv/crypto/Kconfig                     |  110 ++
 arch/riscv/crypto/Makefile                    |   68 +
 .../crypto/aes-riscv64-block-mode-glue.c      |  459 +++++++
 arch/riscv/crypto/aes-riscv64-glue.c          |  137 ++
 arch/riscv/crypto/aes-riscv64-glue.h          |   18 +
 .../crypto/aes-riscv64-zvkned-zvbb-zvkg.pl    |  949 +++++++++++++
 arch/riscv/crypto/aes-riscv64-zvkned-zvkb.pl  |  415 ++++++
 arch/riscv/crypto/aes-riscv64-zvkned.pl       | 1199 +++++++++++++++++
 arch/riscv/crypto/chacha-riscv64-glue.c       |  109 ++
 arch/riscv/crypto/chacha-riscv64-zvkb.pl      |  321 +++++
 arch/riscv/crypto/ghash-riscv64-glue.c        |  175 +++
 arch/riscv/crypto/ghash-riscv64-zvkg.pl       |  100 ++
 arch/riscv/crypto/sha256-riscv64-glue.c       |  145 ++
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.pl   |  317 +++++
 arch/riscv/crypto/sha512-riscv64-glue.c       |  139 ++
 .../crypto/sha512-riscv64-zvknhb-zvkb.pl      |  265 ++++
 arch/riscv/crypto/sm3-riscv64-glue.c          |  124 ++
 arch/riscv/crypto/sm3-riscv64-zvksh.pl        |  227 ++++
 arch/riscv/crypto/sm4-riscv64-glue.c          |  121 ++
 arch/riscv/crypto/sm4-riscv64-zvksed.pl       |  268 ++++
 arch/riscv/include/asm/vector.h               |   11 +
 crypto/Kconfig                                |    3 +
 24 files changed, 5689 insertions(+)
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
