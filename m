Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B123C63706
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RQqPQRDeSOM6GNB8l0RKPk8DzGfkdfAU7At4HMyDBVY=; b=ehykTdEITSOBrg
	S3r+oNnt1Gte6KN+WaXUJzrBpE2CEGoY65GkSGduUg5zMBEa3t/BgoJKufO+WwFLbg8RewgT6xezy
	zFp3gHf5x4b441DZEmREmtLhh7xIR+vAcIoIkoYuev7vgf0ecW48lUl+Bpt73u73orfLUMUvn/AmY
	irJ+7V7estPJ+GGPQI9ljdZAk89nh/lKJb62HeiuJ7+8Xtkq+tZpDxdcQVjEvqYBD4hHPIeG2WzeF
	rIzjbaxeT1/lIQmxPdBvLrloQxQVkIw8pCb3finOf0QI8RNQIrdMbn9BGaOObjfeix/yfH9Lt5Bq6
	JJ9GPfddOKis6LLQ2NYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yqU-0080Np-Be; Wed, 07 Dec 2022 18:08:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yqJ-007zy0-W7
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 18:08:31 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2yqF-0004lz-Is; Wed, 07 Dec 2022 19:08:23 +0100
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
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 00/12] Allow calls in alternatives
Date: Wed,  7 Dec 2022 19:08:09 +0100
Message-Id: <20221207180821.2479987-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_100828_169558_8368514F 
X-CRM114-Status: GOOD (  20.84  )
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

This series is split out of my work on optimizing string functions
and provides the basics to:

- actually allowing calls in alternatives
  Function calls use auipc + jalr to reach those 32bit relative
  addresses but when they're compiled the offset will be wrong
  as alternatives live in a different section. So when the patch
  gets applied the address will point to the wrong location.

  So similar to arm64 the target addresses need to be updated.

  This is probably also helpful for other things needing more
  complex code in alternatives.


For v2 I got into some sort of cleanup spree for the general instruction
parsing that already existed. A number of places do their own
instruction parsing and I tried consolidating some of them.

Noteable, the kvm parts still do, but I had to stop somewhere :-)

The series is based on v6.1-rc7 right now.

changes since v3:
- separate allowing calls in alternatives from string work
- move the immediate handling for auipc+jalr into the insn.h header
  This allows other parts of the kernel to reuse this, instead of
  duplicating the code in a number or areas
- adjust the riscv_alternative_fix_auipc_jalr function to be called
  from a central _fix_offsets function, so that other offsets can
  get fixed from the same loop in the future (jal, etc)

  I've removed Conor's Reviewed-by: from that last patch, as it
  changed so much since v3.

changes since v2:
- add patch fixing the c.jalr funct4 value
- reword some commit messages
- fix position of auipc addition patch (earlier)
- fix compile errors from patch-reordering gone wrong
  (worked at the end of v2, but compiling individual patches
   caused issues) - patches are now tested individually
- limit Zbb variants for GNU as for now
  (LLVM support for .option arch is still under review)
- prevent str-functions from getting optimized to builtin-variants

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

Heiko Stuebner (12):
  RISC-V: fix funct4 definition for c.jalr in parse_asm.h
  RISC-V: add prefix to all constants/macros in parse_asm.h
  RISC-V: detach funct-values from their offset
  RISC-V: add ebreak instructions to definitions
  RISC-V: add auipc elements to parse_asm header
  RISC-V: Move riscv_insn_is_* macros into a common header
  RISC-V: rename parse_asm.h to insn.h
  RISC-V: kprobes: use central defined funct3 constants
  RISC-V: add U-type imm parsing to insn.h header
  RISC-V: add rd reg parsing to insn.h header
  RISC-V: add helpers for handling immediates in U-type and I-type pairs
  RISC-V: fix auipc-jalr addresses in patched alternatives

 arch/riscv/include/asm/alternative.h     |   3 +
 arch/riscv/include/asm/insn.h            | 339 +++++++++++++++++++++++
 arch/riscv/include/asm/parse_asm.h       | 219 ---------------
 arch/riscv/kernel/alternative.c          |  56 ++++
 arch/riscv/kernel/cpufeature.c           |   5 +-
 arch/riscv/kernel/kgdb.c                 |  63 ++---
 arch/riscv/kernel/probes/simulate-insn.c |  19 +-
 arch/riscv/kernel/probes/simulate-insn.h |  26 +-
 8 files changed, 435 insertions(+), 295 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn.h
 delete mode 100644 arch/riscv/include/asm/parse_asm.h

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
