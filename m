Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8C1C7618D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hM8D99yvl5QeV1FL1jvWB7bJ/kZojcClnkmTX8kz4L8=; b=nMlxY2t5WM981M
	QxKE+zWAnpzVdYERkR1tJ7EoEbxAN+/Z/Tu2OVhlrseWNDeOPgzP0S/h62xc/nHcptEyc9E9J+k5S
	BwbfUIgfhamqCdvi6snYwnqXiIffgecU0pJwFOtnwjTN5Q6+9zMosWQdXrOLTfkouPby94JfX/+/H
	ZNqwPPIVBhU+O/HaZeHoyvaH6erMjUiN/V39NB+SNMDHiJuJwIz15feN3aFtUNykVUC0GaT3cKSTp
	Kag94TxVA0YfSv+9/pC3ru3t9mJmDqwpqqdRQEh/GGlPrzr0sSYmRqIVsElclm4pEKq0YRHyyq+7N
	VoFvpWIUPKDhNfo0Ayrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnbp-007TG7-Cx; Mon, 13 Mar 2023 19:13:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbnbg-007TAt-VF
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 19:13:20 +0000
Received: from ip4d1634a9.dynamic.kabel-deutschland.de ([77.22.52.169] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pbnbT-00028k-MQ; Mon, 13 Mar 2023 20:13:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de
Subject: [PATCH RFC v3 00/16] RISC-V: support some cryptography accelerations
Date: Mon, 13 Mar 2023 20:12:46 +0100
Message-Id: <20230313191302.580787-1-heiko.stuebner@vrull.eu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_121317_036800_04915A26 
X-CRM114-Status: GOOD (  15.38  )
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

The base is v14 of the vector patchset but the first patches up to doing
the Zbc-based GCM GHash can also run without those. Of course the vector-
crypto extensions are also not ratified yet, hence the marking as RFC.


As v13 of the vector patchset dropped the patches for in-kernel usage of
vector instructions, I picked the ones from v12 over into this series
for now.

My basic goal was to not re-invent cryptographic code, so the heavy
lifting is done by those perl-asm scripts used in openssl and the perl
code used here-in stems from code that is targetted at openssl [0] and is
unmodified from there to limit needed review effort.


With a matching qemu (there are patches for vector-crypto flying around)
the in-kernel crypto-selftests (also the extended ones) are very happy
so far.


Things to do:
- use correct Co-developed-attribution for the code coming from
  openssl
- follow openSSL changes along until they get eventually merged

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


[0] both still open
https://github.com/openssl/openssl/pull/20078
https://github.com/openssl/openssl/pull/20149


Greentime Hu (2):
  riscv: Add support for kernel mode vector
  riscv: Add vector extension XOR implementation

Heiko Stuebner (14):
  RISC-V: add Zbc extension detection
  RISC-V: add Zbkb extension detection
  RISC-V: hook new crypto subdir into build-system
  RISC-V: crypto: add accelerated GCM GHASH implementation
  RISC-V: add helper function to read the vector VLEN
  RISC-V: add vector crypto extension detection
  RISC-V: crypto: update perl include with helpers for vector (crypto)
    instructions
  RISC-V: crypto: add Zvkb accelerated GCM GHASH implementation
  RISC-V: crypto: add Zvkg accelerated GCM GHASH implementation
  RISC-V: crypto: add a vector-crypto-accelerated SHA256 implementation
  RISC-V: crypto: add a vector-crypto-accelerated SHA512 implementation
  RISC-V: crypto: add Zvkned accelerated AES encryption implementation
  RISC-V: crypto: add Zvksed accelerated SM4 encryption implementation
  RISC-V: crypto: add Zvksh accelerated SM3 hash implementation

 arch/riscv/Kbuild                          |   1 +
 arch/riscv/Kconfig                         |  22 +
 arch/riscv/crypto/Kconfig                  |  82 +++
 arch/riscv/crypto/Makefile                 |  60 ++
 arch/riscv/crypto/aes-riscv-glue.c         | 169 ++++++
 arch/riscv/crypto/aes-riscv64-zvkned.pl    | 500 ++++++++++++++++
 arch/riscv/crypto/ghash-riscv64-glue.c     | 485 +++++++++++++++
 arch/riscv/crypto/ghash-riscv64-zbc.pl     | 400 +++++++++++++
 arch/riscv/crypto/ghash-riscv64-zvkb.pl    | 349 +++++++++++
 arch/riscv/crypto/ghash-riscv64-zvkg.pl    | 161 +++++
 arch/riscv/crypto/riscv.pm                 | 659 +++++++++++++++++++++
 arch/riscv/crypto/sha256-riscv64-glue.c    | 114 ++++
 arch/riscv/crypto/sha256-riscv64-zvknha.pl | 284 +++++++++
 arch/riscv/crypto/sha512-riscv64-glue.c    | 104 ++++
 arch/riscv/crypto/sha512-riscv64-zvknhb.pl | 347 +++++++++++
 arch/riscv/crypto/sm3-riscv64-glue.c       | 112 ++++
 arch/riscv/crypto/sm3-riscv64-zvksh.pl     | 195 ++++++
 arch/riscv/crypto/sm4-riscv64-glue.c       | 163 +++++
 arch/riscv/crypto/sm4-riscv64-zvksed.pl    | 270 +++++++++
 arch/riscv/include/asm/hwcap.h             |   9 +
 arch/riscv/include/asm/vector.h            |  25 +
 arch/riscv/include/asm/xor.h               |  82 +++
 arch/riscv/kernel/Makefile                 |   1 +
 arch/riscv/kernel/cpu.c                    |   9 +
 arch/riscv/kernel/cpufeature.c             |   9 +
 arch/riscv/kernel/kernel_mode_vector.c     | 132 +++++
 arch/riscv/lib/Makefile                    |   1 +
 arch/riscv/lib/xor.S                       |  81 +++
 crypto/Kconfig                             |   3 +
 29 files changed, 4829 insertions(+)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile
 create mode 100644 arch/riscv/crypto/aes-riscv-glue.c
 create mode 100644 arch/riscv/crypto/aes-riscv64-zvkned.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zbc.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkb.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkg.pl
 create mode 100644 arch/riscv/crypto/riscv.pm
 create mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha256-riscv64-zvknha.pl
 create mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha512-riscv64-zvknhb.pl
 create mode 100644 arch/riscv/crypto/sm3-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sm3-riscv64-zvksh.pl
 create mode 100644 arch/riscv/crypto/sm4-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sm4-riscv64-zvksed.pl
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
