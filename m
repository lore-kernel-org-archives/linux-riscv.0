Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50574C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+N6udP44d8Wm/CiD3XKiIiyaAwmFfOzfoshtaRnVOcQ=; b=CFbm4Hlebdkz9B
	zxr+lD8C5pmhEmcWKYCbYZOenvhg/Nkjh6vcoWm20bG/ZR2RzF9cmFZbCyWf0qBzzd01+PSiqHuF+
	0GZWa/7Cac5PsE+LiJSadx1Uw9Es3Wuv36jmSFt54nL9PSyWD8cw6cYolSvhkY8/8HSZEe8fy7kBZ
	fHbcIsUQzV8XJCTchygt0z3T5Qv8+awTRp1UFgn42GCqZbvwZYmkPAj6Cx8bmuuOZP6dt7Zi5eauB
	Rl1kBPmMV6oxO79Z5nTSKdFBgu7L74jsBUpOK6GcTNlM13kfAZAWhlXdtQuxbWZfi98wXyiu3w8fR
	JSJdJP4f7y1DPyd9C6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwqX-003GnW-8z; Mon, 09 Jan 2023 18:26:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEwig-003DQU-9Y
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 18:18:03 +0000
Received: from wf0783.dip.tu-dresden.de ([141.76.183.15] helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pEwib-0005hU-0q; Mon, 09 Jan 2023 19:17:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 0/5] Zbb string optimizations and call support in alternatives
Date: Mon,  9 Jan 2023 19:17:50 +0100
Message-Id: <20230109181755.2383085-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_101802_402523_4212D854 
X-CRM114-Status: GOOD (  19.27  )
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

This series still tries to allow optimized string functions for specific
extensions. The last approach of using an inline base function to hold
the alternative calls did cause some issues in a number of places

So instead of that we're now just using an alternative j at the beginning
of the generic function to jump to a separate place inside the function
itself.

This of course needs a fixup for "j" instructions in alternative blocks,
so that is provided here as well.

Technically patch4 got a review from Andrew, but that was still with
the inline approach, so I didn't bring it over to v4.


changes since v3:
- rebase on top of 6.2-rc1 + the applied alternative-call series
- add alternative fixup for jal instructions
- drop the inline functions and instead just jump

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

Heiko Stuebner (5):
  RISC-V: move some stray __RISCV_INSN_FUNCS definitions from kprobes
  RISC-V: add helpers for J-type immediate handling
  RISC-V: fix jal addresses in patched alternatives
  RISC-V: add infrastructure to allow different str* implementations
  RISC-V: add zbb support to string functions

 arch/riscv/Kconfig                       |  24 ++++
 arch/riscv/include/asm/errata_list.h     |   3 +-
 arch/riscv/include/asm/hwcap.h           |   1 +
 arch/riscv/include/asm/insn.h            |  36 ++++++
 arch/riscv/include/asm/string.h          |  12 ++
 arch/riscv/kernel/alternative.c          |  27 ++++
 arch/riscv/kernel/cpu.c                  |   1 +
 arch/riscv/kernel/cpufeature.c           |  18 +++
 arch/riscv/kernel/probes/simulate-insn.h |   3 -
 arch/riscv/kernel/riscv_ksyms.c          |   3 +
 arch/riscv/lib/Makefile                  |   3 +
 arch/riscv/lib/strcmp.S                  | 131 ++++++++++++++++++++
 arch/riscv/lib/strlen.S                  | 142 +++++++++++++++++++++
 arch/riscv/lib/strncmp.S                 | 151 +++++++++++++++++++++++
 arch/riscv/purgatory/Makefile            |  13 ++
 15 files changed, 564 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/lib/strcmp.S
 create mode 100644 arch/riscv/lib/strlen.S
 create mode 100644 arch/riscv/lib/strncmp.S

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
