Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12D2C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qTV/z3geHV612limm7BoCxwxrON/EHJV4oAA0xAbj0s=; b=kSxAOsPSpXhmGS
	93fTZJ/cNUROY4WABIJJfDDIdAVDpKYP1pjzgI25uaO3L0P9tk/DiNCP4H9wMEnCad/uxW+MXRSI4
	cRD5wMK7f94oJWbGvWpIxT7owidHSJo6W0Ns3U+9M6CVQ8IvVwJEMeApUYanSMpXplV/iLaL8efsU
	LsWrGaMoDH+i1J3TWEhZXC6G5nIIHvoGJWyhuQ/HPsLF/3Sc3/rC3R+9kPfZHmYhOYKvTISVKjgos
	LGwewI7d/z84WY2innT1WZxF5alkV4916COsRlRn9ck5xqaV9sb1Jpyq/YieFsNMVHR6JE5SYaiZf
	HLBpLP6MY5PT+7HVVcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLe-0011X1-3p; Mon, 28 Nov 2022 10:26:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLX-0011Ss-Ax
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 10:26:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozbLR-0004Xi-Vh; Mon, 28 Nov 2022 11:26:38 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 0/13] Zbb string optimizations and call support in alternatives
Date: Mon, 28 Nov 2022 11:26:19 +0100
Message-Id: <20221128102632.435174-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_022643_426004_C0BF2380 
X-CRM114-Status: GOOD (  19.90  )
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

The Zbb extension can be used to make string functions run a lot
faster.

To allow There are essentially two problems to solve:
- making it possible for str* functions to replace what they do
  in a performant way

  This is done by inlining the core functions and then
  using alternatives to call the actual variant.

  This of course will need a more intelligent selection mechanism
  down the road when more variants may exist using different
  available extensions.

- actually allowing calls in alternatives
  Function calls use auipc + jalr to reach those 32bit relative
  addresses but when they're compiled the offset will be wrong
  as alternatives live in a different section. So when the patch
  gets applied the address will point to the wrong location.

  So similar to arm64 the target addresses need to be updated.

  This is probably also helpful for other things needing more
  complex code in alternatives.


In my half-scientific test-case of running the functions in question
on a 95 character string in a loop of 10000 iterations, the Zbb
variants shave off around 2/3 of the original runtime.


For v2 I got into some sort of cleanup spree for the general instruction
parsing that already existed. A number of places do their own
instruction parsing and I tried consolidating some of them.

Noteable, the kvm parts still do, but I had to stop somewhere :-)


changes since v1:
- a number of generalizations/cleanups for instruction parsing
- use accessor function to access instructions (Emil)
- actually patch the correct location when having more than one
  instruction in an alternative block
- string function cleanups (comments etc) (Conor)
- move zbb extension above s* extensions in cpu.c lists

changes since rfc:
- make Zbb code actually work
- drop some unneeded patches
- a lot of cleanups

Heiko Stuebner (13):
  RISC-V: add prefix to all constants/macros in parse_asm.h
  RISC-V: detach funct-values from their offset
  RISC-V: add ebreak instructions to definitions
  RISC-V: Move riscv_insn_is_* macros into a common header
  RISC-V: rename parse_asm.h to insn.h
  RISC-V: kprobes: use central defined funct3 constants
  RISC-V: add auipc elements to parse_asm header
  RISC-V: add U-type imm parsing to parse_asm header
  RISC-V: add rd reg parsing to parse_asm header
  RISC-V: fix auipc-jalr addresses in patched alternatives
  efi/riscv: libstub: mark when compiling libstub
  RISC-V: add infrastructure to allow different str* implementations
  RISC-V: add zbb support to string functions

 arch/riscv/Kconfig                       |  23 ++
 arch/riscv/include/asm/alternative.h     |   3 +
 arch/riscv/include/asm/errata_list.h     |   3 +-
 arch/riscv/include/asm/hwcap.h           |   1 +
 arch/riscv/include/asm/insn.h            | 292 +++++++++++++++++++++++
 arch/riscv/include/asm/parse_asm.h       | 219 -----------------
 arch/riscv/include/asm/string.h          |  83 +++++++
 arch/riscv/kernel/alternative.c          |  72 ++++++
 arch/riscv/kernel/cpu.c                  |   1 +
 arch/riscv/kernel/cpufeature.c           |  29 ++-
 arch/riscv/kernel/image-vars.h           |   6 +-
 arch/riscv/kernel/kgdb.c                 |  63 ++---
 arch/riscv/kernel/probes/simulate-insn.c |  19 +-
 arch/riscv/kernel/probes/simulate-insn.h |  26 +-
 arch/riscv/lib/Makefile                  |   6 +
 arch/riscv/lib/strcmp.S                  |  38 +++
 arch/riscv/lib/strcmp_zbb.S              |  96 ++++++++
 arch/riscv/lib/strlen.S                  |  29 +++
 arch/riscv/lib/strlen_zbb.S              | 115 +++++++++
 arch/riscv/lib/strncmp.S                 |  41 ++++
 arch/riscv/lib/strncmp_zbb.S             | 112 +++++++++
 drivers/firmware/efi/libstub/Makefile    |   2 +-
 22 files changed, 978 insertions(+), 301 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn.h
 delete mode 100644 arch/riscv/include/asm/parse_asm.h
 create mode 100644 arch/riscv/lib/strcmp.S
 create mode 100644 arch/riscv/lib/strcmp_zbb.S
 create mode 100644 arch/riscv/lib/strlen.S
 create mode 100644 arch/riscv/lib/strlen_zbb.S
 create mode 100644 arch/riscv/lib/strncmp.S
 create mode 100644 arch/riscv/lib/strncmp_zbb.S

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
