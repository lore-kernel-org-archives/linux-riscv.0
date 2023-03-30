Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93130C77B60
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uBXh3xyAWbZNUxQ00nTiOWdItANgjttw+WKMGjcpyF0=; b=e13/7kCaEK2Qeo
	eegIbXNzUCaWVaR3n4p/NAcwPVaJwfFiumVedPAy0dK5Rwae+E9s1r8EoApmiz9nwii/qkHHhhFfN
	N+eI1XOsN5YQLNc7qVxodfjN7D2nVRWF5FplkqaF+rVTJL1RnVVWQPqmyQJJwmOTYpmOA4zwHloPV
	uqahKQDKlIGmM/qW6nIjlpxjf/PZtp0/R5rl/vUPCzMKB36IVEegkm5cJefAtlKY8t8QA6IVGbJO2
	UFu61m0SfNYhDE5zngzHVVLXxfITyP/KlF7qiQxZWCg08pt2D8MBO1POkkXLHrWmlanZOkFgOM6Cd
	NdC52EmsT9//cu74jEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phz6c-0051u4-2G;
	Thu, 30 Mar 2023 20:42:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phz6Y-0051sG-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 20:42:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m2so20361001wrh.6
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 13:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680208959; x=1682800959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mLVXvmd/ake+Xx/RCE/Z3yw1k+fBfE6YW+jS/+4s/rA=;
        b=A677IHQnCSpDYoUmc2oQAZpf7LxvOPhbOHLHEldc+1h5UIvpfui6dd8y0t1E2dLwwb
         pHTwzcmF2eRLeKi3DGavVIyxwc7zqatBVYWn2nAD+WEJExCyzr/eRqHKlhmUapRHhHbW
         /atOByzSIT20kZeaPu8qcE+23W5U6FcZQF2IqUNogyPmNnmnf0bw0iwvm/6YbD38ZlYX
         kMQGIu0H2UfPaQEugN8Ep+VmuMp5loUqQRPGvlopWyKbZ4KnSDfGFnrYZgEPOrgX0YC9
         dZyB2O2+Ajr2+BCPohMqcuAL/crp+Ax2bF27bcz+KGJPEhzuEzSCDXLbUUlFbrG0RNHH
         xx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680208959; x=1682800959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLVXvmd/ake+Xx/RCE/Z3yw1k+fBfE6YW+jS/+4s/rA=;
        b=YdWDAooGHNGPe/rFO2lBIAkJt8PdNvK1ioJeUBog/qD/aKT0VGLc2qvsORxjXI6lin
         KfMaKgyxNxjP06/GRuB2sr1+QzmHTDtsUIeMrabjnnIoD/ReP5SjIi2ux0xD3WcuPkEu
         9yUAicpzOv4ndbmYsY+UBAgpGt8+NeCtV5USg23fWj/gPB0Lji9iJsWhA3gPYBY+f2Kk
         Pe4FPDY3pplUR90TDlrZYMoFVn8NJKgussfsgfNiMCJ1QKyKgTDm4ZnuMcxBUETqMexe
         M7lnF19yFrjX4UjPDjzc9wVW6ElCwWnvLOMrVo2VOd4pSX+C8F7brupElvw+/XYs2p2g
         EBaw==
X-Gm-Message-State: AAQBX9fLgEZRbxdTnjeRV0SZvyTA3VFTiv7+d48ih5VxIc/TvYooi8D0
	JFKCV8hGxZDRlxaJgdtFbIs=
X-Google-Smtp-Source: AKy350atj0/qVIft2PxTXv5JvNCE4maaiuaBH1jFtd89epq8N7n3BqQjjnzmctgdRblLKHh2W/ogmg==
X-Received: by 2002:adf:e345:0:b0:2cf:e436:f722 with SMTP id n5-20020adfe345000000b002cfe436f722mr17320337wrj.64.1680208959278;
        Thu, 30 Mar 2023 13:42:39 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:30f2:5b7:ab32:c3f])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4b0c000000b002cfed482e9asm297981wrq.61.2023.03.30.13.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 13:42:38 -0700 (PDT)
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
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 0/6] RISC-V non-coherent function pointer based CMO + non-coherent DMA support for AX45MP
Date: Thu, 30 Mar 2023 21:42:11 +0100
Message-Id: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_134242_547939_FF3D30DC 
X-CRM114-Status: GOOD (  22.03  )
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

non-coherent DMA support for AX45MP
====================================

On the Andes AX45MP core, cache coherency is a specification option so it
may not be supported. In this case DMA will fail. To get around with this
issue this patch series does the below:

1] Andes alternative ports is implemented as errata which checks if the IOCP
is missing and only then applies to CMO errata. One vendor specific SBI EXT
(ANDES_SBI_EXT_IOCP_SW_WORKAROUND) is implemented as part of errata.

Below are the configs which Andes port provides (and are selected by RZ/Five):
      - ERRATA_ANDES
      - ERRATA_ANDES_CMO

OpenSBI patch supporting ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI can be found here,
https://patchwork.ozlabs.org/project/opensbi/patch/20230317140357.14819-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

2] Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
block that allows dynamic adjustment of memory attributes in the runtime.
It contains a configurable amount of PMA entries implemented as CSR
registers to control the attributes of memory locations in interest.
OpenSBI configures the PMA regions as required and creates a reserve memory
node and propagates it to the higher boot stack.

Currently OpenSBI (upstream) configures the required PMA region and passes
this a shared DMA pool to Linux.

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
cache and register using riscv_noncoherent_register_cache_ops().

4] RZ/Five SoC selects the below configs
        - AX45MP_L2_CACHE
        - DMA_GLOBAL_POOL
        - ERRATA_ANDES
        - ERRATA_ANDES_CMO

----------x---------------------x--------------------x---------------x--------------

Note,
- This series requires testing on Cores with zicbom and T-Head SoCs
- Ive used GCC 12.2.0 for compilation
- Tested all the IP blocks on RZ/Five which use DMA
- Patch series is dependent on the series from Arnd,
  https://patchwork.kernel.org/project/linux-riscv/cover/20230327121317.4081816-1-arnd@kernel.org/
- Patches applies on top of palmer/for-next (d34a6b715a23)

v6 -> v7
* Reworked the code based on Arnd's work
* Fixed review comments pointed by Arnd
* Fixed review comments pointed by Conor

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

 .../cache/andestech,ax45mp-cache.yaml         |  81 +++++++
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig.errata                     |  21 ++
 arch/riscv/errata/Makefile                    |   1 +
 arch/riscv/errata/andes/Makefile              |   1 +
 arch/riscv/errata/andes/errata.c              |  71 ++++++
 arch/riscv/errata/thead/errata.c              |  76 ++++++
 arch/riscv/include/asm/alternative.h          |   3 +
 arch/riscv/include/asm/dma-noncoherent.h      |  73 ++++++
 arch/riscv/include/asm/errata_list.h          |  53 ----
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/alternative.c               |   5 +
 arch/riscv/kernel/setup.c                     |  49 +++-
 arch/riscv/mm/dma-noncoherent.c               |  25 +-
 arch/riscv/mm/pmem.c                          |   6 +-
 drivers/Kconfig                               |   2 +
 drivers/Makefile                              |   1 +
 drivers/cache/Kconfig                         |  10 +
 drivers/cache/Makefile                        |   3 +
 drivers/cache/ax45mp_cache.c                  | 229 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 21 files changed, 662 insertions(+), 61 deletions(-)
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
