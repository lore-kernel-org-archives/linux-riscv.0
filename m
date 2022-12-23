Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8767BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 22:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WC3mSSIj26B9KweA9iah6eF34fjsnbbUbn+wH5FBQ4o=; b=3Dbpv6kHZUs1/P
	CYjjV8uuQOo+aUPygeyI3lPNK5YG4ZSGBb6o6pHDvcpGjWaM862pB4nCi2APwEd4afC84PK+zRvCI
	vLA+DIloFDqdPl1sz+96yoILuKGs3yr7GOyrK2CwoWtdQZ/9NXPQYoK6RJnQPyKkA6BUcVuBITOY8
	bXEBTuh4OfMMIktxTLGU1lyC0H7SAAJ981oTQPUB843FRSz19LnKl0wmKKIw1GqazTCmEgXA8lRpp
	BoUL2l2gaNEhI7m8BME7m7nDqKkNPjjySg9b6KwGzuHQXNDZmmfWYBJaa6//5p/4mtyWbpJ559tJO
	Kh/T+05KD+WNxZCCSsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qR9-00CiCq-Qk; Fri, 23 Dec 2022 22:22:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qR7-00Ci5Y-4n
	for linux-riscv@bombadil.infradead.org; Fri, 23 Dec 2022 22:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DICKDHVi/TxYEFILQWwnTmz8VYnUUO+dX6Qr5sFL5zM=; b=ilw6RSzSKAXFGYW0l2oTObMOV/
	T6S+7auH9APSDDy45ujyvgJDvnDFkyHU2iVlj3nfFnKw8BLGjZKOFSdJffKi1WMQ8w1crP9hiMFVB
	moUv0GCY6iO5E9DyrSZwrbZNi4zFGzGwRcJHx1AMJTcEQk+u1LeOPRqkMM9Pj2ZvEkfTDz7nnDqkR
	9QronvOY84CLhlObYCVcruTMTVTF7bgLnVomdPRZIjZpHvXWcudIKqQ7H5lKBI3PUmoilw5+vC5F2
	tuvKr6yxDgJtfDrswvtO1JOLx/IgxUG/qWj2GP7Egyn8EUIynAaArKBADeVA5sguIcUfeVGP/Kjv7
	w2yiJNyA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qIp-004osa-O4
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 22:14:13 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p8qIX-0002Hc-4s; Fri, 23 Dec 2022 23:13:49 +0100
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
Subject: [PATCH v5 00/12] Allow calls in alternatives
Date: Fri, 23 Dec 2022 23:13:20 +0100
Message-Id: <20221223221332.4127602-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_221407_919770_1EAB7F4A 
X-CRM114-Status: GOOD (  17.36  )
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


The series is based on

commit 51094a24b85e ("Merge tag 'hardening-v6.2-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux")

from Fri Dec 23 12:00:24 2022 -0800 right now, this is the most current commit
during the merge window and seems to include most or all riscv changes for
the 6.2 merge-window, so the series should apply cleanly once 6.2-rc1 is out.


changes since v4:
- while people reporting nits for v4 mentioned that it wouldn't be necessary
  to respin for each, the number of them the series received waranted a
  respin I think
- split riscv_insn_insert_utype_itype_imm parameters into separate
  utype + itype u32 pointer (Andrew)
- use u32 instead of unsigned int in riscv_instruction_at (Jess)
- rename instruction params in riscv_alternative_fix_auipc_jalr
  make their content obvious (Andrew)
- standardize on insn for instruction-related variables (Conor)
- make comment about ra register check more explicit (Conor)

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
 arch/riscv/include/asm/insn.h            | 340 +++++++++++++++++++++++
 arch/riscv/include/asm/parse_asm.h       | 219 ---------------
 arch/riscv/kernel/alternative.c          |  56 ++++
 arch/riscv/kernel/cpufeature.c           |   5 +-
 arch/riscv/kernel/kgdb.c                 |  63 ++---
 arch/riscv/kernel/probes/simulate-insn.c |  19 +-
 arch/riscv/kernel/probes/simulate-insn.h |  26 +-
 8 files changed, 436 insertions(+), 295 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn.h
 delete mode 100644 arch/riscv/include/asm/parse_asm.h

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
