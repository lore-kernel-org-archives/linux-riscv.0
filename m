Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE23C02198
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Feb 2025 23:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zkzUGP0tKlLP0KedFAgZWHLUcW+Oupl0aK/7LYmspDc=; b=JXn4H4Y7ZlTv36
	fQy+145fboIfRASzxT3/bJLW/7OXeHKoQ5Opwf1ZS7Ss8HVdP9fgPgytnFdKiiS0vvELspM+rMiG0
	7DcRN3M7+ITupYXplSImT6jOM90KRNcOJZRIb4XTjNLmOGDaDAZC1niMU1u1t3qh/nbD8vKHZewSc
	wuVkIxumAMnG+sGScVaRumPPEzoD+XAvHXXXwhqCsIFUX1Ksb7RSun+ksspD60OPcbHldE87Afnt2
	Lm9OF4/pYGHnadAqJNpZoQgrgXxkHzAWwF77Z8Kgx/m/GzZft4bATqDNPidijIiIK/2RWxKAXoRXv
	bQxb3V/JLwEO7jKo50lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjncq-00000002kLF-3kYx;
	Sun, 16 Feb 2025 23:00:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjncn-00000002kIz-2c9y
	for linux-riscv@lists.infradead.org;
	Sun, 16 Feb 2025 23:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 959645C5819;
	Sun, 16 Feb 2025 22:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65928C4CEDD;
	Sun, 16 Feb 2025 23:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739746831;
	bh=2d6ZtWkWQ357DtEP1dRgzHJghjeMoRX2Npj7Yv4hSGE=;
	h=From:To:Cc:Subject:Date:From;
	b=QohltwnVNTwOz7KDrIKCLR37vW5W4nrOzm7uF7UIuCKk1SlnGDxR0Z/2pl3ag4fm9
	 SY5blg5pleNqD+N3p2pu3d2nWtMCvQEihDPmiyWmHwgRO9vEgBKe4d4reZuZDyZyGM
	 EkAiu18j4zY5bfptlaaAhja8S/IeQ07X6uZkD7vLBiMDXyDkd6NOZt/OGAAwacjEc0
	 4aBn2i/12jAC6TPGTJSeL3H2ZM6tUyGWGmHLbNgTpyCHhPXIJS2kXgdmG398QvYsP0
	 qlPhWtPFLB4P5gZuswb7PN1rWTQJva2HMrcvWrvNKMzN0R40VYUBZz2ydGC8sPGoYe
	 mc9HLIccc8gyA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/4] RISC-V CRC optimizations
Date: Sun, 16 Feb 2025 14:55:26 -0800
Message-ID: <20250216225530.306980-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_150033_751718_8BE37440 
X-CRM114-Status: GOOD (  11.43  )
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

This patchset is a replacement for
"[PATCH v4] riscv: Optimize crct10dif with Zbc extension"
(https://lore.kernel.org/r/20250211071101.181652-1-zhihang.shao.iscas@gmail.com/).
It adopts the approach that I'm taking for x86 where code is shared
among CRC variants.  It replaces the existing Zbc optimized CRC32
functions, then adds Zbc optimized CRC-T10DIF and CRC64 functions.

This new code should be significantly faster than the current Zbc
optimized CRC32 code and the previously proposed CRC-T10DIF code.  It
uses "folding" instead of just Barrett reduction, and it also implements
Barrett reduction more efficiently.

This applies to crc-next at
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next.
It depends on other patches that are queued there for 6.15, so I plan to
take it through there if there are no objections.

Tested with crc_kunit in QEMU (set CONFIG_CRC_KUNIT_TEST=y and
CONFIG_CRC_BENCHMARK=y), both 32-bit and 64-bit.  I don't have real Zbc
capable hardware to benchmark this on, but the new code should work very
well; similar optimizations work very well on other architectures.

Eric Biggers (4):
  riscv/crc: add "template" for Zbc optimized CRC functions
  riscv/crc32: reimplement the CRC32 functions using new template
  riscv/crc-t10dif: add Zbc optimized CRC-T10DIF function
  riscv/crc64: add Zbc optimized CRC64 functions

 arch/riscv/Kconfig                  |   2 +
 arch/riscv/lib/Makefile             |   5 +
 arch/riscv/lib/crc-clmul-consts.h   | 122 +++++++++++
 arch/riscv/lib/crc-clmul-template.h | 265 ++++++++++++++++++++++++
 arch/riscv/lib/crc-clmul.h          |  23 +++
 arch/riscv/lib/crc-t10dif.c         |  24 +++
 arch/riscv/lib/crc16_msb.c          |  18 ++
 arch/riscv/lib/crc32-riscv.c        | 310 ----------------------------
 arch/riscv/lib/crc32.c              |  53 +++++
 arch/riscv/lib/crc32_lsb.c          |  18 ++
 arch/riscv/lib/crc32_msb.c          |  18 ++
 arch/riscv/lib/crc64.c              |  34 +++
 arch/riscv/lib/crc64_lsb.c          |  18 ++
 arch/riscv/lib/crc64_msb.c          |  18 ++
 scripts/gen-crc-consts.py           |  55 ++++-
 15 files changed, 672 insertions(+), 311 deletions(-)
 create mode 100644 arch/riscv/lib/crc-clmul-consts.h
 create mode 100644 arch/riscv/lib/crc-clmul-template.h
 create mode 100644 arch/riscv/lib/crc-clmul.h
 create mode 100644 arch/riscv/lib/crc-t10dif.c
 create mode 100644 arch/riscv/lib/crc16_msb.c
 delete mode 100644 arch/riscv/lib/crc32-riscv.c
 create mode 100644 arch/riscv/lib/crc32.c
 create mode 100644 arch/riscv/lib/crc32_lsb.c
 create mode 100644 arch/riscv/lib/crc32_msb.c
 create mode 100644 arch/riscv/lib/crc64.c
 create mode 100644 arch/riscv/lib/crc64_lsb.c
 create mode 100644 arch/riscv/lib/crc64_msb.c


base-commit: cf1ea3a7c1f63cba7d1dd313ee3accde0c0c8988
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
