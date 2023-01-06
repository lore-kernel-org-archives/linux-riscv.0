Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E87C54EBD
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 18:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DXO15zlVzI4HmgNCUPkddJdeCx9K78xqvchknvXPB9c=; b=OMWBA8M3k2yR7p
	Il0bZ2EVOnycrtOg+/11XbCqR1Ugiwo7Xj1UCgjj/mWKlI3TKZBIdOwqLBjuw4+yX9gNA6Wj0p1WS
	lEt5ARygBakZbPCEnM3n6K9ExwK71j9AWYFMgQoYJ5SZ0Cj3MZZHbOC+MVZCWzwA+q2Ze/oy5AY+i
	PZxqIufrIw/rmWtEFftDE4/5bZtS+cSGsEek94tfmta0bNe453O4MyE7ryVn3hiYFfosd+BBAJPvf
	SpbJC9WGmKuHJeq0QC0cnTqr9wA2A+9S6hqR1TI41sdjWwzTAiRNOWKTHDyD2z72qO846qeMNFjuk
	IYHyg5MMqO7fSfUYkaJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrt3-00EUcw-QQ; Fri, 06 Jan 2023 18:56:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDrsu-00EUa1-SD
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 18:56:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so1712042wms.4
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 10:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sUwYegRtAIb+OCTW5mqCGhd7voccHEpdVjTByrjOi8=;
        b=mvN0mjmHwx/VFu46rg+zvq7VV2GQiEAzy4dIgGeV0yIXxsZrUwYalmgLGt3hYA9c+K
         mICCY5cg/L9CRr1mMdCiPpsWIVAN13S6u2Cl/VL7fYIgCRxdq6HaBqXEqQd/j3Rk43ku
         MdnZE/bTw0vfeRKDrDz+1AXCRaHow8HjAjICsrs/UMyI4AM2mK4/KpSVybyepQtbfbVB
         n0fytKUNYyLxQhud+p3RURKhXkI3bzdSbteZPjnpodGBjtLpZP7H/kR8kh1fUaK4JYon
         GzHHSm7kHUqUKkpAL+G6reEebXt7y1p84rTANDi1WpYk2V+B1sXpXhFY9UuZxlm0Cv+b
         Hylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sUwYegRtAIb+OCTW5mqCGhd7voccHEpdVjTByrjOi8=;
        b=pOCQdyLZxjLdIX5VX2TQGvq0MZCl9knAf/YfZuWR4Q1NL1tPL9yW0ifx4XSrK9DuXV
         LnAxmszPGzlFXBlr6MInkImndOrE9zngSJpLPV1qOZ/prvNwxK+E0DsisFnGDV/9luHE
         rEVpXrTe55c6WNU7TqCdG5T3OWFkxNM3EMSYNqLlRyyqV49oK6qp41k2L35PlqsyIWjD
         rmum8+MJrLpp3dABNUMREUGhKJ8vpzTRIAd+Ub2YDD18eUR+YMVH4QF96XQhikXOF57T
         RUEwuoTQSL31JVS3I2XejYs3rxI4tpTHzrj2iKmbiPG1rb+FbIXhh5GKyvJN6H3KQf17
         RvLA==
X-Gm-Message-State: AFqh2kr6Isn1ufzK+vIIR+qMNTO/4qzbTdqGh0fA7GF8Avaixi5UejU6
	2m6QQHv32sT5h6OLbPPuCKc=
X-Google-Smtp-Source: AMrXdXuzXHmK258HUVix6YG0pfb9Dmn1BifmbLfB1D03lJT7QadJIixWYT9Yd+fUM8OQlMJid4SkkQ==
X-Received: by 2002:a05:600c:3d0e:b0:3d1:ee97:980 with SMTP id bh14-20020a05600c3d0e00b003d1ee970980mr49682190wmb.7.1673031365518;
        Fri, 06 Jan 2023 10:56:05 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:79e8:5b4e:615a:91cd])
        by smtp.gmail.com with ESMTPSA id d8-20020a05600c34c800b003c5571c27a1sm3162773wmq.32.2023.01.06.10.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:56:04 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 0/6] RISC-V non-coherent function pointer based cache management operations + non-coherent DMA support for AX45MP
Date: Fri,  6 Jan 2023 18:55:20 +0000
Message-Id: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_105608_968935_946F9B28 
X-CRM114-Status: GOOD (  24.20  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

RISC-V non-coherent function pointer based cache management operations
=======================================================================
As based on the previous discussion [0]. [1], It was suggested upon the below:
* Move out cache drivers from drivers/soc/folder
* Implement function pointers for CMO instead of ALTERNATIVE_x() macro
* Add cache drivers to drivers/cache folder

[0] https://lore.kernel.org/all/43aee000-5b89-4d94-98d2-b37b1a18a83e@app.fastmail.com/
[1] https://lore.kernel.org/linux-riscv/Y62nOqzyuUKqYDpq@spud/#R

This v6 version of the patch series add support to use function pointers for CMO
and switches the current CMO implementations for zicbom and T-HEAD to use function
pointers.

Note, with the above approach we might see some performance degradation due to additional
checks.

----------x---------------------x--------------------x---------------x--------------


non-coherent DMA support for AX45MP
====================================

On the Andes AX45MP core, cache coherency is a specification option so it
may not be supported. In this case DMA will fail. To get around with this
issue this patch series does the below:

1] Andes alternative ports is implemented as errata which checks if the IOCP
is missing and only then applies to CMO errata. One vendor specific SBI EXT
(RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND) is implemented as part of errata. If we could
access the DTB in errata I can get rid of this EXT ID from OpenSBI. Is there any
approach we can access the DTB in patch callback?

Below are the configs which Andes port provides (and are selected by RZ/Five):
      - ERRATA_ANDES
      - ERRATA_ANDES_CMO

2] Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
block that allows dynamic adjustment of memory attributes in the runtime.
It contains a configurable amount of PMA entries implemented as CSR
registers to control the attributes of memory locations in interest.
OpenSBI configures the PMA regions as required and creates a reserve memory
node and propagates it to the higher boot stack.

An RFC patch for OpenSBI is posted here:
https://patchwork.ozlabs.org/project/opensbi/patch/20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

    reserved-memory {
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;

        pma_resv0@58000000 {
            compatible = "shared-dma-pool";
            reg = <0x0 0x58000000 0x0 0x08000000>;
            no-map;
            linux,dma-default;
        };
    };

The above shared DMA pool gets appended to Linux DTB so the DMA memory
requests go through this region.

3] We provide callbacks to synchronize specific content between memory and
cache.

        - arch_sync_dma_for_device()
        - arch_sync_dma_for_cpu()

4] RZ/Five SoC selects the below configs
        - AX45MP_L2_CACHE
        - DMA_GLOBAL_POOL
        - ERRATA_ANDES
        - ERRATA_ANDES_CMO

OpenSBI implementation patches can be found here:
1] https://patchwork.ozlabs.org/project/opensbi/cover/20221210103011.7814-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
2]https://patchwork.ozlabs.org/project/opensbi/patch/20221212094421.14556-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
----------x---------------------x--------------------x---------------x--------------

Note,
- This series requires testing on Cores with zicbom and T-Head SoCs
- Ive used GCC 12.2.0 for compilation (tested with allmodconfig)
- Tested all the IP blocks on RZ/Five which use DMA

v5.1 -> v6
* Dropped use of ALTERNATIVE_x() macro
* Now switched to used function pointers for CMO
* Moved driver to drivers/cache folder

v5 -> v5.1
* https://patchwork.kernel.org/project/linux-riscv/list/?series=708610&state=%2A&archive=both

v4 -> v5
* Rebased ALTERNATIVE_3() macro on top of Andrew's patches
* Rebased the changes on top of Heiko's alternative call patches
* Dropped configuring the PMA from Linux
* Dropped configuring the L2 cache from Linux and dropped the binding for same
* Now using runtime patching mechanism instead of compile time config

RFC v3 -> v4
* Implemented ALTERNATIVE_3() macro 
* Now using runtime patching mechanism instead of compile time config
* Added Andes CMO as and errata
* Fixed comments pointed by Geert

RFC v2-> RFC v3
* Fixed review comments pointed by Conor
* Move DT binding into cache folder
* Fixed DT binding check issue
* Added andestech,ax45mp-cache.h header file
* Now passing the flags for the PMA setup as part of andestech,pma-regions
  property.
* Added andestech,inst/data-prefetch and andestech,tag/data-ram-ctl
  properties to configure the L2 cache.
* Registered the cache driver as platform driver

RFC v1-> RFC v2
* Moved out the code from arc/riscv to drivers/soc/renesas
* Now handling the PMA setup as part of the L2 cache
* Now making use of dma-noncoherent.c instead SoC specific implementation.
* Dropped arch_dma_alloc() and arch_dma_free()
* Switched to RISCV_DMA_NONCOHERENT
* Included DT binding doc

RFC v2: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
RFC v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (6):
  riscv: mm: dma-noncoherent: Switch using function pointers for cache
    management
  riscv: asm: vendorid_list: Add Andes Technology to the vendors list
  riscv: errata: Add Andes alternative ports
  dt-bindings: cache: r9a07g043f-l2-cache: Add DT binding documentation
    for L2 cache controller
  cache: Add L2 cache management for Andes AX45MP RISC-V core
  soc: renesas: Kconfig: Select the required configs for RZ/Five SoC

 .../cache/andestech,ax45mp-cache.yaml         |  81 +++++
 arch/riscv/Kconfig.erratas                    |  22 ++
 arch/riscv/errata/Makefile                    |   1 +
 arch/riscv/errata/andes/Makefile              |   1 +
 arch/riscv/errata/andes/errata.c              |  71 +++++
 arch/riscv/errata/thead/errata.c              |  71 +++++
 arch/riscv/include/asm/alternative.h          |   3 +
 arch/riscv/include/asm/dma-noncoherent.h      |  83 ++++++
 arch/riscv/include/asm/errata_list.h          |  53 ----
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/alternative.c               |   5 +
 arch/riscv/kernel/cpufeature.c                |   2 +
 arch/riscv/mm/dma-noncoherent.c               |  94 +++++-
 arch/riscv/mm/pmem.c                          |  18 +-
 drivers/Kconfig                               |   2 +
 drivers/Makefile                              |   1 +
 drivers/cache/Kconfig                         |  10 +
 drivers/cache/Makefile                        |   3 +
 drivers/cache/ax45mp_cache.c                  | 279 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 20 files changed, 744 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c
 create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
 create mode 100644 drivers/cache/Kconfig
 create mode 100644 drivers/cache/Makefile
 create mode 100644 drivers/cache/ax45mp_cache.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
