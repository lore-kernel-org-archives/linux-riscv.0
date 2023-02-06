Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D97FC05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 22:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uwzEhhkhmOtXH/JlPKfhMp15RHh8HSyV5NUamZtXtb8=; b=p+aVi//vm07X2F
	lBDxNV443ivS0g0F+yGwlsh7/AyzA7T+qkZT3eJdF5Nxz4XdEPogLAhNSD66e+1PnupDiDXpHfnWH
	i/+yL0fr1Xef4/H1R/pR/iCgC3QlMMNW2gmL4jqZVuhOBWqcBEpr2WuTxNWfAeSJXNwRc3rvgsTIZ
	CRl8+CX5tFvFps1X0Hl3myWQ5ZjrtZ6WZ3FA645spb1TOPYDcSt/QLz5pE3jW1k9OM+W4X+NGsce7
	bfgFT71BtDTAn9h6z1ElzgIioFl659Qo8gA35u4boOvUSk+O489pA78CUMj0AAWC22Sp7vPIvChiM
	nlq3tH7lqOc4MVGE+OFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPAS7-00A7KB-J3; Mon, 06 Feb 2023 22:59:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPAS1-00A7Eq-4D
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 22:59:07 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pPARk-0002Mb-6m; Mon, 06 Feb 2023 23:58:48 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH RFC 00/12] RISC-V: support some cryptography accelerations
Date: Mon,  6 Feb 2023 23:58:34 +0100
Message-Id: <20230206225846.1381789-1-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_145905_194340_61BEEB27 
X-CRM114-Status: GOOD (  14.28  )
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

So this was my playground the last days.

The base is v13 of the vector patchset but the first patches up to doing
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
- The series still includes its own Zbb extension detection,
  I'll need to untangle my branches to adapt to the applied Zbb
  patchset [and address Andrews comments]
- use correct Co-developed-attribution for the code coming from
  openssl
- some more cryptographic algorithms (aes, sha512, sm3, sm4)


[0] both still open
https://github.com/openssl/openssl/pull/20078
https://github.com/openssl/openssl/pull/20149


Greentime Hu (2):
  riscv: Add support for kernel mode vector
  riscv: Add vector extension XOR implementation

Heiko Stuebner (10):
  RISC-V: add Zbb extension detection
  RISC-V: add Zbc extension detection
  RISC-V: add Zbkb extension detection
  RISC-V: hook new crypto subdir into build-system
  RISC-V: crypto: add accelerated GCM GHASH implementation
  RISC-V: add vector crypto extension detection
  RISC-V: crypto: update perl include with helpers for vector (crypto)
    instructions
  RISC-V: crypto: add Zvkb accelerated GCM GHASH implementation
  RISC-V: crypto: add Zvkg accelerated GCM GHASH implementation
  RISC-V: crypto: add a vector-crypto-accelerated SHA256 implementation

 arch/riscv/Kbuild                          |   1 +
 arch/riscv/Kconfig                         |  45 ++
 arch/riscv/crypto/Kconfig                  |  28 +
 arch/riscv/crypto/Makefile                 |  34 +
 arch/riscv/crypto/ghash-riscv64-glue.c     | 489 ++++++++++++++
 arch/riscv/crypto/ghash-riscv64-zbc.pl     | 400 ++++++++++++
 arch/riscv/crypto/ghash-riscv64-zvkb.pl    | 346 ++++++++++
 arch/riscv/crypto/ghash-riscv64-zvkg.pl    | 172 +++++
 arch/riscv/crypto/riscv.pm                 | 723 +++++++++++++++++++++
 arch/riscv/crypto/sha256-riscv64-glue.c    | 103 +++
 arch/riscv/crypto/sha256-riscv64-zvknha.pl | 502 ++++++++++++++
 arch/riscv/include/asm/hwcap.h             |   7 +
 arch/riscv/include/asm/vector.h            |  14 +
 arch/riscv/include/asm/xor.h               |  82 +++
 arch/riscv/kernel/Makefile                 |   1 +
 arch/riscv/kernel/cpu.c                    |   7 +
 arch/riscv/kernel/cpufeature.c             |   7 +
 arch/riscv/kernel/kernel_mode_vector.c     | 132 ++++
 arch/riscv/lib/Makefile                    |   1 +
 arch/riscv/lib/xor.S                       |  81 +++
 crypto/Kconfig                             |   3 +
 21 files changed, 3178 insertions(+)
 create mode 100644 arch/riscv/crypto/Kconfig
 create mode 100644 arch/riscv/crypto/Makefile
 create mode 100644 arch/riscv/crypto/ghash-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zbc.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkb.pl
 create mode 100644 arch/riscv/crypto/ghash-riscv64-zvkg.pl
 create mode 100644 arch/riscv/crypto/riscv.pm
 create mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
 create mode 100644 arch/riscv/crypto/sha256-riscv64-zvknha.pl
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
