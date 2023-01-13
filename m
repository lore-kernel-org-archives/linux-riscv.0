Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB29DC3DA78
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zKZMS4jLqxjaugMOIX+YSse0zHzDcudvWPm3t5EVGPE=; b=MJFUdrckDlucS8
	Ni9jdX1rzUm9jBuJrCcAvE8/Vw1nO3ZeqV3mxZ2z+LXq48UV5ZZlNtFobpom1EvjRWHsukB4kBZt1
	veijyQtjPJgS0gRPNjcj17qFy/Och+DP4XcbsaHoYl+TlxSANuW3R9FL6k9mDURNCY9DbnBtCLoEI
	v+AttHL4aFt+p0EfhNupjziboWdW5+0zA9wXP/Rvy7BGhYEEVpBrKnaGtJSECfpXsgPj0jVbI/FS5
	iIbbyiKVxU7Ck5F+OZYjbQRsbR/JOtl2RZWk4yKudAOR+HPhgiKzFTFjVp+OL2h2OOQ7bR9B6UUNE
	TsUsx0qlsHmgYiJvkpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRW3-004aYb-Vv; Fri, 13 Jan 2023 21:23:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRVy-004aVU-OE
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:23:08 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRVx-0003VT-4u; Fri, 13 Jan 2023 22:23:05 +0100
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
Subject: [PATCH v5 0/2] Zbb string optimizations
Date: Fri, 13 Jan 2023 22:22:59 +0100
Message-Id: <20230113212301.3534711-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132306_825202_5C4DF55E 
X-CRM114-Status: GOOD (  19.43  )
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

Dependencies:
- 6.2-rc1
- the series adding the call address fixes to alternatives (in Palmer's next)
  https://lore.kernel.org/r/20221223221332.4127602-1-heiko@sntech.de
- the patch adding the j address fix to alternatives
  https://lore.kernel.org/r/20230113212205.3534622-1-heiko@sntech.de
- Conor's isa extension reordering series
  https://lore.kernel.org/r/20221205144525.2148448-1-conor.dooley@microchip.com


changes since v4:
- split out the now shared alternatives j-address-fixup
- split out the somewhat unrelated isn-func move patch
- follow Andrew's great suggestions on making the assembly nicer
- put the Zbb extension into the correct place after Conor's reordering

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

Heiko Stuebner (2):
  RISC-V: add infrastructure to allow different str* implementations
  RISC-V: add zbb support to string functions

 arch/riscv/Kconfig                   |  24 +++++
 arch/riscv/include/asm/errata_list.h |   3 +-
 arch/riscv/include/asm/hwcap.h       |   1 +
 arch/riscv/include/asm/string.h      |  10 ++
 arch/riscv/kernel/cpu.c              |   1 +
 arch/riscv/kernel/cpufeature.c       |  18 ++++
 arch/riscv/kernel/riscv_ksyms.c      |   3 +
 arch/riscv/lib/Makefile              |   3 +
 arch/riscv/lib/strcmp.S              | 121 +++++++++++++++++++++++
 arch/riscv/lib/strlen.S              | 133 +++++++++++++++++++++++++
 arch/riscv/lib/strncmp.S             | 139 +++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile        |  13 +++
 12 files changed, 468 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/lib/strcmp.S
 create mode 100644 arch/riscv/lib/strlen.S
 create mode 100644 arch/riscv/lib/strncmp.S

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
