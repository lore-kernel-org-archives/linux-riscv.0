Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC32C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/yd/Rna1LW2DV3TtYZIyPTpB5hFgOAXIbd2TM88ouJU=; b=UCNrbJ2PCNyaxI
	PgHiFh0cGCJkgHCMg+r2HERGA5srFRZe7I9kelS6LktLgvzBfpqPfTEZCeELZ0zqpU2lwHl5Tt86f
	mZy7gpg7phV1YIyNGEwAA9onxcLobSG5tXDteEbko3PB1CitoJuEqcbdud5AMnHC/lgOLAEWVwX/V
	81nE2C7NPCAXG2zEtWyTcRR3lkL/RE+Ux8bSYK+2arCJJs/duIDOJTuJVeYLTWzOIFJ/mnw0EHQv8
	J6eGj0cOozUOkJgxe9Hvons2mZOpSdC9u7LtCgTeEHJXIUGVdQ77/ZMTsmILQ/L1xTmyoaQE83KCJ
	zpfG4lcJUH0sg2vNcfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAwug-00FZb8-Qf; Fri, 21 Jan 2022 16:37:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAwuZ-00FZXh-Pj
 for linux-riscv@bombadil.infradead.org; Fri, 21 Jan 2022 16:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=+2g4e/oGxt61A5WFVEd8ZCeSxn/INgLOvWGwduVAf2Q=; b=TxsQg+4SR5EyiNViTJq+mBlCm9
 tuhsgAcuIoHJZZ8v6bJ7TrHnx/2dNrwqJeze7D2NoC0S8E8t/UmT30RMda7mCShEaIsmoaO79GH/d
 w3wvEQJWJUFTPEGcjoNCuAQZRXbGNihjDomK9mr+hQ+2H7jBjVVmXNP4RF5Y0DSJ7dbqD3hiEQNch
 2kW+qHd4R70lB1V/EfOkXMWFf1SzJaU9BktFtpH5LFP2f1m2QW34b19nlw3p/cibhxjqoDsQIy4gc
 tXnkVxTKMdjivrUmZEbH873lSqe/CWqY1btV+Zpmm3jrUMT8GTIn9czVy9oWBSlrejsoCnBkyC+4I
 yUSrnbFA==;
Received: from gloria.sntech.de ([185.11.138.130])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAwuW-002bxg-B9
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 16:37:14 +0000
Received: from p508fcef5.dip0.t-ipconnect.de ([80.143.206.245]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nAwuE-0008GA-HL; Fri, 21 Jan 2022 17:36:54 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 00/14] riscv: support for svpbmt and D1 memory types
Date: Fri, 21 Jan 2022 17:36:04 +0100
Message-Id: <20220121163618.351934-1-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_163712_513786_8B0B99A2 
X-CRM114-Status: GOOD (  21.88  )
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

So this is my try at implementing svpbmt (and the diverging D1 memory
types using the alternatives framework).

This includes a number of changes to the alternatives mechanism itself.
The biggest one being the move to a more central location, as I expect
in the future, nearly every chip needing some sort of patching, be it
either for erratas or for optional features (svpbmt or others).

The dt-binding for svpbmt itself is of course not finished and is still
using the binding introduced in previous versions, as where to put
a svpbmt-property in the devicetree is still under dicussion.
Atish seems to be working on a framework for extensions [0],

The series also introduces support for the memory types of the D1
which are implemented differently to svpbmt. But when patching anyway
it's pretty clean to add the D1 variant via ALTERNATIVE_2 to the same
location.

The only slightly bigger difference is that the "normal" type is not 0
as with svpbmt, so kernel patches for this PMA type need to be applied
even before the MMU is brought up, so the series introduces a separate
stage for that.


In theory this series is 3 parts:
- sbi cache-flush / null-ptr
- alternatives improvements
- svpbmt+d1

So expecially patches from the first 2 areas could be applied when
deemed ready, I just thought to keep it together to show-case where
the end-goal is and not requiring jumping between different series.


The sbi cache-flush patch is based on Atish's sparse-hartid patch [1],
as it touches a similar area in mm/cacheflush.c


I picked the recipient list from the previous version, hopefully
I didn't forget anybody.


[0] https://lore.kernel.org/r/20211224211632.1698523-1-atishp@rivosinc.com
[1] https://lore.kernel.org/r/20220120090918.2646626-1-atishp@rivosinc.com


Heiko Stuebner (12):
  riscv: only use IPIs to handle cache-flushes on remote cpus
  riscv: integrate alternatives better into the main architecture
  riscv: allow different stages with alternatives
  riscv: implement module alternatives
  riscv: implement ALTERNATIVE_2 macro
  riscv: extend concatenated alternatives-lines to the same length
  riscv: prevent compressed instructions in alternatives
  riscv: move boot alternatives to a slightly earlier position
  riscv: Fix accessing pfn bits in PTEs for non-32bit variants
  riscv: add cpufeature handling via alternatives
  riscv: remove FIXMAP_PAGE_IO and fall back to its default value
  riscv: add memory-type errata for T-Head

Wei Fu (2):
  dt-bindings: riscv: add MMU Standard Extensions support for Svpbmt
  riscv: add RISC-V Svpbmt extension supports

 .../devicetree/bindings/riscv/cpus.yaml       |  10 ++
 arch/riscv/Kconfig.erratas                    |  29 ++--
 arch/riscv/Kconfig.socs                       |   1 -
 arch/riscv/Makefile                           |   2 +-
 arch/riscv/errata/Makefile                    |   2 +-
 arch/riscv/errata/sifive/errata.c             |  10 +-
 arch/riscv/errata/thead/Makefile              |   1 +
 arch/riscv/errata/thead/errata.c              |  85 +++++++++++
 arch/riscv/include/asm/alternative-macros.h   | 114 ++++++++-------
 arch/riscv/include/asm/alternative.h          |  16 ++-
 arch/riscv/include/asm/errata_list.h          |  52 +++++++
 arch/riscv/include/asm/fixmap.h               |   2 -
 arch/riscv/include/asm/pgtable-32.h           |  17 +++
 arch/riscv/include/asm/pgtable-64.h           |  79 +++++++++-
 arch/riscv/include/asm/pgtable-bits.h         |  10 --
 arch/riscv/include/asm/pgtable.h              |  53 +++++--
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/{errata => kernel}/alternative.c   |  47 +++++-
 arch/riscv/kernel/cpufeature.c                | 136 +++++++++++++++++-
 arch/riscv/kernel/head.S                      |   2 +
 arch/riscv/kernel/module.c                    |  29 ++++
 arch/riscv/kernel/smpboot.c                   |   4 -
 arch/riscv/kernel/traps.c                     |   2 +-
 arch/riscv/mm/cacheflush.c                    |   8 +-
 arch/riscv/mm/init.c                          |   2 +
 26 files changed, 599 insertions(+), 116 deletions(-)
 create mode 100644 arch/riscv/errata/thead/Makefile
 create mode 100644 arch/riscv/errata/thead/errata.c
 rename arch/riscv/{errata => kernel}/alternative.c (60%)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
