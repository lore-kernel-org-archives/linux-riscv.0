Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A2C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 03:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fnmb7TkuJHe9fT+q1MoRP5qlcdTYvbKqUis+jvsL/S4=; b=piwhmqVmXlfYtZ
	c/LOPjYD69rgFLcms+sYE3MFTj8Z3l7Zz8a36vrAsMvTn7U2fayU3c0IOAwAlx435XL6+XkFoiuxi
	rwiF8nlPKDuVtl5TLiXxTiTGM0HD89IEoClSxOfJ0vXLDBSBohlMUR3HNVgrgPxl88fpx0ZE2AADY
	XKktEyRNANOlzsz0PeAx2g0p3ug/EXWp0v4tr1uqTbLcwuVzPINlZ60jwOdK1M12ab/SvjZukAxnU
	fVoQLLF4fxw0dbtFHOl/DDsfbpotk36qMcQFMtHhrfY0mUPgMs1hey/veEymwveEaeEaENt8Bpmr8
	/0a/Zb4WAxV2b4ujrh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neTHy-00GTnk-Gg; Wed, 13 Apr 2022 03:03:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neTHv-00GTlm-2F
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 03:03:24 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1neTHl-0006sN-VP; Wed, 13 Apr 2022 05:03:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v9 00/12] riscv: support for Svpbmt and D1 memory types
Date: Wed, 13 Apr 2022 05:02:55 +0200
Message-Id: <20220413030307.133807-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_200323_150200_8A89753B 
X-CRM114-Status: GOOD (  24.66  )
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

Svpbmt is an extension defining "Supervisor-mode: page-based memory types"
for things like non-cacheable pages or I/O memory pages.


So this is my 2nd try at implementing Svpbmt (and the diverging D1 memory
types) using the alternatives framework.

This includes a number of changes to the alternatives mechanism itself.
The biggest one being the move to a more central location, as I expect
in the future, nearly every chip needing some sort of patching, be it
either for erratas or for optional features (svpbmt or others).

Detection of the svpbmt functionality is done via Atish's isa extension
handling series [0] and thus does not need any dt-parsing of its own
anymore.

The series also introduces support for the memory types of the D1
which are implemented differently to svpbmt. But when patching anyway
it's pretty clean to add the D1 variant via ALTERNATIVE_2 to the same
location.

The only slightly bigger difference is that the "normal" type is not 0
as with svpbmt, so kernel patches for this PMA type need to be applied
even before the MMU is brought up, so the series introduces a separate
stage for that.


In theory this series is 2 parts:
- alternatives improvements
- svpbmt+d1

I picked the recipient list from the previous versions, hopefully
I didn't forget anybody.

I tested the series on:
- qemu-rv32 + buildroot rootfs
- qemu-rv64 + debian roots
- Allwinner D1-Nezha
- BeagleV - it at least reached the same point as without the series


changes in v9:
- rebase onto 5.18-rc1
- drop the sbi null-ptr patch
  While I still think this to be non-ideal as is, it isn't really
  necessary for svpbmt support anymore
- merge cpufeature + svpbmt patch, as otherwise some empty shells
  cause build warnings when a bisection stops between these two
  patches
- address review comments from Christoph Hellwig:
  - keep alternatives optional, they now get selected by its
    users (erratas and also the newly introduced svpbmt kconfig)
  - wrap long lines and keep things below 80 characters
  - restyle svpbmt + thead errata assembly
  - introduce a helper for the repeated calls to
    (val & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT

changes in v8:
- rebase onto 5.17-final + isa extension series
  We're halfway through the merge-window, so this series
  should be merge after that
- adapt to fix limiting alternatives to non-xip-kernels
- add .norelax option for alternatives
- fix unused cpu_apply_errata in thead errata
- don't use static globals to store cpu-manufacturer data
  as it makes machines hang if done too early

changes in v7:
- fix typo in patch1 (Atish)
- moved to Atish's isa-extension framework
- and therefore move regular boot-alternatives directly behind fill_hwcaps
- change T-Head errata Kconfig text (Atish)

changes in v6:
- rebase onto 5.17-rc1
- handle sbi null-ptr differently
- improve commit messages
- use riscv,mmu as property name

changes in v5:
- move to use alternatives for runtime-patching
- add D1 variant


[0] https://lore.kernel.org/r/20220222204811.2281949-2-atishp@rivosinc.com

Heiko Stuebner (12):
  riscv: integrate alternatives better into the main architecture
  riscv: allow different stages with alternatives
  riscv: implement module alternatives
  riscv: implement ALTERNATIVE_2 macro
  riscv: extend concatenated alternatives-lines to the same length
  riscv: prevent compressed instructions in alternatives
  riscv: move boot alternatives to after fill_hwcap
  riscv: Fix accessing pfn bits in PTEs for non-32bit variants
  riscv: add RISC-V Svpbmt extension support
  riscv: remove FIXMAP_PAGE_IO and fall back to its default value
  riscv: don't use global static vars to store alternative data
  riscv: add memory-type errata for T-Head

 arch/riscv/Kconfig                          |  22 ++++
 arch/riscv/Kconfig.erratas                  |  33 +++--
 arch/riscv/Kconfig.socs                     |   1 -
 arch/riscv/Makefile                         |   2 +-
 arch/riscv/errata/Makefile                  |   2 +-
 arch/riscv/errata/alternative.c             |  75 ------------
 arch/riscv/errata/sifive/errata.c           |  20 ++-
 arch/riscv/errata/thead/Makefile            |   1 +
 arch/riscv/errata/thead/errata.c            |  82 +++++++++++++
 arch/riscv/include/asm/alternative-macros.h | 129 +++++++++++++++-----
 arch/riscv/include/asm/alternative.h        |  25 +++-
 arch/riscv/include/asm/errata_list.h        |  59 +++++++++
 arch/riscv/include/asm/fixmap.h             |   2 -
 arch/riscv/include/asm/hwcap.h              |   1 +
 arch/riscv/include/asm/pgtable-32.h         |  17 +++
 arch/riscv/include/asm/pgtable-64.h         |  79 +++++++++++-
 arch/riscv/include/asm/pgtable-bits.h       |  10 --
 arch/riscv/include/asm/pgtable.h            |  55 +++++++--
 arch/riscv/include/asm/vendorid_list.h      |   1 +
 arch/riscv/kernel/Makefile                  |   1 +
 arch/riscv/kernel/alternative.c             | 104 ++++++++++++++++
 arch/riscv/kernel/cpu.c                     |   1 +
 arch/riscv/kernel/cpufeature.c              |  80 +++++++++++-
 arch/riscv/kernel/module.c                  |  29 +++++
 arch/riscv/kernel/setup.c                   |   2 +
 arch/riscv/kernel/smpboot.c                 |   4 -
 arch/riscv/kernel/traps.c                   |   2 +-
 arch/riscv/mm/init.c                        |   1 +
 28 files changed, 679 insertions(+), 161 deletions(-)
 delete mode 100644 arch/riscv/errata/alternative.c
 create mode 100644 arch/riscv/errata/thead/Makefile
 create mode 100644 arch/riscv/errata/thead/errata.c
 create mode 100644 arch/riscv/kernel/alternative.c

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
