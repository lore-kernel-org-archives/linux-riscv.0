Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A32C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 23:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bKbfyGZBXAuaxWWVvSj3Iy3iww5LjY1wXEf/Biy+1pg=; b=bxnHDCOOlSt92W
	CwRlWDNqoCjcnIUZuPS16v50QZPqN/WT9LiiQeZUWQe39KgHrqGg5muLPPVs6kcjJPRcSpRJ+O4LA
	WRyogFj8P9xX8nDilIXM1AzCCRd4P9txpMq8XnTUa3k3l/83l7fvxERL5Q1SUV0qTLCKu0UfHHjV4
	XILpfVUxwY7Qy8GAaVa3BDUKW8hOmHi4nq7PlDSa8JDYwYfW3n7gdf1bJhJUbPg/kkU2vR3qldpR+
	uDOSFKBEw4eXccoxjMEEm2FTEiaoPRMF3RRrGQTadlbhGPLs1SmbNB6iDmqokb/BIZImue+aLXmpo
	r7qSCypitLcrEk1DELDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9EFQ-00CiOV-IT; Wed, 06 Jul 2022 23:15:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9EFF-00CiIz-J8
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 23:15:48 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o9EFC-0002yn-Oq; Thu, 07 Jul 2022 01:15:42 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	samuel@sholland.org,
	atishp@atishpatra.org,
	anup@brainfault.org,
	mick@ics.forth.gr,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	drew@beagleboard.org,
	rdunlap@infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v7 0/4] riscv: implement Zicbom-based CMO instructions + the t-head variant
Date: Thu,  7 Jul 2022 01:15:32 +0200
Message-Id: <20220706231536.2041855-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_161545_726344_8EE5E43C 
X-CRM114-Status: GOOD (  22.09  )
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

This series is based on the alternatives changes done in my svpbmt series
and thus also depends on Atish's isa-extension parsing series.

It implements using the cache-management instructions from the  Zicbom-
extension to handle cache flush, etc actions on platforms needing them.

SoCs using cpu cores from T-Head like the Allwinne D1 implement a
different set of cache instructions. But while they are different,
instructions they provide the same functionality, so a variant can
easly hook into the existing alternatives mechanism on those.


An ongoing discussion is about the currently used pre-coded
instructions. Palmer's current thinking is that we should wait
until the relevant instructions have landed in binutils.

The main Zicbom instructions are in toolchains now and at least
Debian also carries a binutils snapshot with it, but the T-Head
variant still uses pre-coded instructions for now.

The series sits on top of my svpbmt fixup series, which
for example includes the conversion away from function pointers
for the check-functions.


It also uses my nops-series to shorten multiple nop statements:
https://lore.kernel.org/r/20220607143059.1054074-1-heiko@sntech.de


A new dma-noncoherent property was added for the devicetree-specification
and dt-schema in:
- https://www.spinics.net/lists/devicetree-spec/msg01053.html
- https://github.com/devicetree-org/dt-schema/pull/78

The dtschema-patch was already merged and patch1 in this series
got a reviewed-by from Rob, so I guess that new property should be
ok to use.

changes in v7:
- add recently received review-tags
- fix wrong rv32 mabi when testing for Zicbom in Kconfig

changes in v6:
- add recently received review-tags
- adapt non-coherent patch subject as suggested by Christoph Hellwig

changes in v5:
- beautify of_dma_is_coherent as suggested by Christoph Hellwig
- WARN_TAINT when ARCH_DMA_MINALIGN smaller than riscv,cbom-block-size
  (similar to how arm64 does this)
- add a function to track if non-coherent handling is available
- WARN_TAINT if a device is non-coherent but no non-coherent handling
- use clean instead of inval in arch_sync_dma_for_device:DMA_FROM_DEVICE
  hopefully I understood
    https://lore.kernel.org/linux-arm-kernel/20220610151228.4562-1-will@kernel.org/T/
  correctly in this

changes in v4:
- modify of_dma_is_coherent() also handle coherent system
  with maybe noncoherent devices
- move Zicbom to use real instructions
- split off the actual dma-noncoherent code from the Zicbom
  extension
- Don't assumes devices are non-coherent, instead default to
  coherent and require the non-coherent ones to be marked
- CPUFEATURE_ZICBOM instead of CPUFEATURE_CMO
- fix used cache addresses
- drop some unused headers from dma-noncoherent.c
- move unsigned long cast when calling ALT_CMO_OP
- remove unneeded memset-0
- define ARCH_DMA_MINALIGN
- use flush instead of inval in arch_sync_dma_for_cpu()
- depend on !XIP_KERNEL
- trim some line lengths
- improve Kconfig description

changes in v3:
- rebase onto 5.19-rc1 + svpbmt-fixup-series
- adapt wording for block-size binding
- include asm/cacheflush.h into dma-noncoherent to fix the
  no-prototype error clang seems to generate
- use __nops macro for readability
- add some received tags
- add a0 to the clobber list

changes in v2:
- cbom-block-size is hardware-specific and comes from firmware
- update Kconfig name to use the ISA extension name
- select the ALTERNATIVES symbol when enabled
- shorten the line lengths of the errata-assembly

Heiko Stuebner (4):
  of: also handle dma-noncoherent in of_dma_is_coherent()
  dt-bindings: riscv: document cbom-block-size
  riscv: Add support for non-coherent devices using zicbom extension
  riscv: implement cache-management errata for T-Head SoCs

 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 arch/riscv/Kconfig                            |  31 +++++
 arch/riscv/Kconfig.erratas                    |  11 ++
 arch/riscv/Makefile                           |   4 +
 arch/riscv/errata/thead/errata.c              |  20 ++++
 arch/riscv/include/asm/cache.h                |   4 +
 arch/riscv/include/asm/cacheflush.h           |  10 ++
 arch/riscv/include/asm/errata_list.h          |  59 ++++++++-
 arch/riscv/include/asm/hwcap.h                |   1 +
 arch/riscv/kernel/cpu.c                       |   1 +
 arch/riscv/kernel/cpufeature.c                |  24 ++++
 arch/riscv/kernel/setup.c                     |   2 +
 arch/riscv/mm/Makefile                        |   1 +
 arch/riscv/mm/dma-noncoherent.c               | 112 ++++++++++++++++++
 drivers/of/address.c                          |  17 +--
 15 files changed, 293 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/mm/dma-noncoherent.c

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
