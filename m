Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD67C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:06:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725CC6120F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725CC6120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=khyC3Dh4HOzZV7Icqw3n9GbufR9fvXdKwnuIXRoPhOM=; b=ONXvcgGGJOGad6
	wxgOoHBOp/ltGL4zF86HYPeC7ezOJJaRKL5S5LJaO/zAwQT345+OHseE6xNjNyUAQa1dpAXq5yB2C
	maBALwcvObLxiKsmajSmXRbmjzL+cZMThyEd4fZF+jK+v2E4qUKIuVBrlapsWfjdXfoAvu9LJ7ONh
	l7Fw45DhXjEhuPPWGAnqnJrj/NuMxBmvhfHXj0HEYSgUOeywyzSQJdiZSCB7eAxu1WEtNeO3NO1NZ
	WHvMtuBHpyGncLb5WUz3sXJW+K032q3Gj5Ffwnta38Zkw5qvne1gXvLwJnl2VjTZkUHJ6/FyY+LVm
	uSLw48cb+VSS44BbpOOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpoiR-0002Zd-Qh; Sun, 06 Jun 2021 09:05:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpoiL-0002Y6-5l
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 09:05:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5084A61422;
 Sun,  6 Jun 2021 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622970300;
 bh=WCq0jCKZFKVHZkUKk3gJmYAjMTZohhpA6kBYeDMWP54=;
 h=From:To:Cc:Subject:Date:From;
 b=oxm3u1RP/XRReqemGC1w532UhAYbNFeDtf/dUXCrcNLysVUcw4/kGCyTdx9vNl5TS
 r6hlzvO/e7yX0PDSFziN3hyZcemocYljnFsJP7aY75U+5QY16SyqN0TRAakBGTCQmN
 PQM1cFGkvmha5xMK1voUxdWPUHNPcNqiCJsAvuLLb0SSka+oLcnleqO/S/4lNlMoFk
 oAkyp08HeBmpT1lJreARal81zS5mUr89OQm7JCNabNHIoAxKVWRc52fFZMnIfrVAEZ
 G8Mr7Zk5CE5h5lVNkRb8WJQOtmVvTDTQDUjAEjuNcTRB/NuYG+/NPmJNRiZRhEdXiq
 OkMVD5ZRlFBhA==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH v2 00/11] riscv: Add DMA_COHERENT support for Allwinner D1
Date: Sun,  6 Jun 2021 09:03:55 +0000
Message-Id: <1622970249-50770-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_020501_278879_785BD37A 
X-CRM114-Status: GOOD (  14.59  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
vendors define the custom properties of memory regions in PTE.

This patchset helps SOC vendors to support their own custom interconnect
coherent solution with PTE attributes.

For example, allwinner D1[1] uses T-HEAD C906 as main processor, C906 has
two modes in MMU:
 - Compatible mode, the same as the definitions in spec.
 - Enhanced mode, add custom DMA_COHERENT attribute bits in PTE which
   not mentioned in spec.

Allwinner D1 needs the enhanced mode to support the DMA type device with
non-coherent interconnect in its SOC. C906 uses BITS(63 - 59) as custom
attribute bits in PTE.

The patchset contain 4 parts (asid, pgtable, cmo, soc) which have been
tested on D1:
 - asid: T-HEAD C906 of D1 contains full asid hw facilities which has no
   conflict with RISC-V spec, and hope these patches soon could be
   approved.
 - pgtable: Using a image-hdr to pass vendor specific information and
   setup custom PTE attributes in a global struct variable during boot
   stage. Also it needs define custom protection_map in linux/mm.
 - cmo: We need deal with dma_sync & icache_sync & __vdso_icache_sync.
   In this patchset, I just show you how T-HEAD C9xx work, and seems Atish
   is working for the DMA infrustructure, please let me know the idea.
 - soc: Add allwinner gmac driver & dts & Kconfig for sunxi test.

The patchset could work with linux-5.13-rc4, here is the steps for D1:
 - Download linux-5.13-rc4 and apply the patchset
 - make ARCH=riscv CROSS_COMPILE=riscv64-linux- defconfig
 - make ARCH=riscv CROSS_COMPILE=riscv64-linux- Image modules dtbs
 - mkimage -A riscv -O linux -T kernel -C none -a 0x00200000 -e 0x00200000 -n Linux -d arch/riscv/boot/Image uImage
 - Download newest opensbi [2], build with [3], and get fw_dynamic.bin
 - Copy uImage, fw_dynamic.bin, allwinner-d1-nezha-kit.dtb into boot
   partition of TF card.
 - Plugin the TF card and power on D1.

Link: https://linux-sunxi.org/D1 [1]
Link: https://github.com/riscv/opensbi branch:master [2]
Link: https://github.com/riscv/opensbi/blob/master/docs/platform/thead-c9xx.md [3]

Changes since v1:
 - Rebase on linux-5.13-rc4
 - Support defconfig for different PTE attributes
 - Support C906 icache_sync
 - Add Allwinner D1 dts & Kconfig & gmac for testing
 - Add asid optimization for D1 usage

Guo Ren (10):
  riscv: asid: Use global mappings for kernel pages
  riscv: asid: Add ASID-based tlbflushing methods
  riscv: asid: Optimize tlbflush coding convention
  riscv: pgtable: Fixup _PAGE_CHG_MASK usage
  riscv: pgtable: Add custom protection_map init
  riscv: pgtable: Add DMA_COHERENT with custom PTE attributes
  riscv: cmo: Add dma-noncoherency support
  riscv: cmo: Add vendor custom icache sync
  riscv: soc: Initial DTS for Allwinner D1 NeZha board
  riscv: soc: Add Allwinner SoC kconfig option

liush (1):
  riscv: soc: Allwinner D1 GMAC driver only for temp use

 arch/riscv/Kconfig                                 |    9 +
 arch/riscv/Kconfig.socs                            |   12 +
 arch/riscv/boot/dts/Makefile                       |    1 +
 arch/riscv/boot/dts/allwinner/Makefile             |    2 +
 .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  |   29 +
 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    |  100 +
 arch/riscv/configs/defconfig                       |    1 +
 arch/riscv/include/asm/cacheflush.h                |   48 +-
 arch/riscv/include/asm/mmu_context.h               |    2 +
 arch/riscv/include/asm/pgtable-64.h                |    8 +-
 arch/riscv/include/asm/pgtable-bits.h              |   20 +-
 arch/riscv/include/asm/pgtable.h                   |   44 +-
 arch/riscv/include/asm/sbi.h                       |   15 +
 arch/riscv/include/asm/soc.h                       |    1 +
 arch/riscv/include/asm/tlbflush.h                  |   22 +
 arch/riscv/include/asm/vendorid_list.h             |    1 +
 arch/riscv/kernel/sbi.c                            |   19 +
 arch/riscv/kernel/soc.c                            |   22 +
 arch/riscv/kernel/vdso/flush_icache.S              |   33 +-
 arch/riscv/mm/Makefile                             |    1 +
 arch/riscv/mm/cacheflush.c                         |    3 +-
 arch/riscv/mm/context.c                            |    2 +-
 arch/riscv/mm/dma-mapping.c                        |   53 +
 arch/riscv/mm/init.c                               |   26 +
 arch/riscv/mm/tlbflush.c                           |   57 +-
 drivers/net/ethernet/Kconfig                       |    1 +
 drivers/net/ethernet/Makefile                      |    1 +
 drivers/net/ethernet/allwinnertmp/Kconfig          |   17 +
 drivers/net/ethernet/allwinnertmp/Makefile         |    7 +
 drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c |  690 ++++++
 drivers/net/ethernet/allwinnertmp/sunxi-gmac.c     | 2240 ++++++++++++++++++++
 drivers/net/ethernet/allwinnertmp/sunxi-gmac.h     |  258 +++
 drivers/net/phy/realtek.c                          |    2 +-
 mm/mmap.c                                          |    4 +
 34 files changed, 3714 insertions(+), 37 deletions(-)
 create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
 create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
 create mode 100644 arch/riscv/mm/dma-mapping.c
 create mode 100644 drivers/net/ethernet/allwinnertmp/Kconfig
 create mode 100644 drivers/net/ethernet/allwinnertmp/Makefile
 create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c
 create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac.c
 create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac.h

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
