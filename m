Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978D2C71150
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g8Wxvi+A4l47s7GiGCoC9Ojy59sfY6ZOzwmgrvNEATk=; b=Bg7bPbP+dY2EX0
	qO14eYZTwfLFU1VKKCKFYwTwFJnm8A/dvfFdar6FjJKrXNBIEDgvR6O9f63rRGqoeKwnwv4mpm09i
	jW58SFw7AnLYz3OYHZ2ScAVFE7YCkPFFZ7T1MMEgqSVOyK+5O4NaRGvXMVubGJqsr+gmogmpN1fCD
	nDVbOWcLq5D5rJ66qE59KkL+BrPQnkvjIIVXJusBo8e6CTJ09QPkUTnHSPAIUl/eY1hH+OPT3hrvx
	dNJQgVtkNBCc0dJADRMCFQcSYsT5NkwcP9MPHE7X3gbYeipdZLB8bBG6IFmnLJ/cm/sP2o8EW4sCG
	NkIDAOr+va9rMNFI12Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzyw-009RCH-1M;
	Fri, 18 Aug 2023 13:57:42 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzyt-009RAA-1e
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 13:57:41 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe4cdb724cso9286195e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692367056; x=1692971856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8Bnj1GNwFsy7OYX77ehXKGpts2AqqtxqiJQIxBlhfA=;
        b=pMXWUZzchrGTekZbMcosKnrVo2lLGZmFdJtNw8i2N13tDQ02nxqHRHTdon6mCSuehY
         +aCl3zSmJTc1bjRveSP4T52X1e54dX9+dWK8J2BTqWxlk2Mw1ZdzXX7pTEZ4MtK1AGz4
         mdTko9NmOR7f2RU+vNKO3jB/bYViVyTdrM5Olm9MXgKre8Tv6TYa6rS+c7VA22C+N+KS
         3MKRFiGrPDvKxN1O3wSD5YJzFCMpYl2WPlegt/tARORKmHKwkIR+k5SljIytt7mm/g9S
         fsED051LzF3uhAeK0Yq5ullJb/HEzoJ/mJh085JvEknzn5DxIfqHSf+ntFv0xU2bE4wF
         V3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692367056; x=1692971856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8Bnj1GNwFsy7OYX77ehXKGpts2AqqtxqiJQIxBlhfA=;
        b=M+pSaUaY7DcOwnH0Lrjetmfd0Un5iKgedyG5aBg5vD0xVWtDL+bMG4D4TE9Qsh5Vhm
         L2l7faRO5nWFODTJWLDMI8siz8OtptCH864M+3+W6yQmbwFHA9D0kmTNcDIrbZPbSixG
         ShzvaK2gKQCBUX5iqBjRzATbIIBhyG9l8K4p0qXya2IZU0oqlaYxXEXSpqT3RoAgzrMX
         2yDQ5DoBBLUg6jmT76efayQfa/e0OkFUV1aYMBD/LRXlxgdsNBVcbdNR0HyH1jFmLpKA
         zoLT3iiIA+AX00NQloKuWCQRKC3FlGuz2dp3N0QZq1HyzbLI6UkA40c0PT1EG8vgu2Ce
         w/oA==
X-Gm-Message-State: AOJu0YwHf3mWj7Wvjs68rWUP8QTAENg5dT3zAa93shtd4anWyooD/xFx
	o99VaiGsrEvk+2IeS86sZmc=
X-Google-Smtp-Source: AGHT+IHi3dnW5YNYs75+jY+xmHjCcSgl8/J7z4WmC0KF8lOFQeDwqYduA4WSFRk6P7HVLT2N9RJUJg==
X-Received: by 2002:a5d:5402:0:b0:31a:e06f:2187 with SMTP id g2-20020a5d5402000000b0031ae06f2187mr1877708wrv.56.1692367055877;
        Fri, 18 Aug 2023 06:57:35 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:4b30:13e8:1d57:42fb])
        by smtp.gmail.com with ESMTPSA id s14-20020a05600c044e00b003fa96fe2bd9sm6444055wmb.22.2023.08.18.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:57:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v12 0/6] Add non-coherent DMA support for AX45MP
Date: Fri, 18 Aug 2023 14:57:17 +0100
Message-Id: <20230818135723.80612-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_065739_552128_9D03F224 
X-CRM114-Status: GOOD (  24.26  )
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

1] Andes alternative ports is implemented as errata which checks if the
IOCP is missing and only then applies to CMO errata. One vendor specific
SBI EXT (ANDES_SBI_EXT_IOCP_SW_WORKAROUND) is implemented as part of
errata.

Below are the configs which Andes port provides (and are selected by
RZ/Five):
      - ERRATA_ANDES
      - ERRATA_ANDES_CMO

OpenSBI patch supporting ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI is now
part v1.3 release.

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
cache.

4] RZ/Five SoC selects the below configs
        - AX45MP_L2_CACHE
        - DMA_GLOBAL_POOL
        - ERRATA_ANDES
        - ERRATA_ANDES_CMO

----------x---------------------x--------------------x---------------x----

Note,
- Ive used GCC 12.2.0 for compilation
- Tested all the IP blocks on RZ/Five which use DMA
- Patch series is dependent on the series from Arnd,
  https://patchwork.kernel.org/project/linux-renesas-soc/cover/20230816232336.164413-1-prabhakar.mahadev-lad.rj@bp.renesas.com/.
- Patches applies on top of palmer/master (25aa0bebba72) +
  palmer/for-next (174e8ac0272d5) + palmer/fixes (7e3811521dc39)
- Ive pushed the complete tree here https://github.com/prabhakarlad/linux/tree/rzfive-cmo-v12

v11 -> v12
* Renamed struct riscv_cache_ops -> struct riscv_nonstd_cache_ops

v10 -> v11
* Changed data type of size from unsigned long to size_t
* Reworded doc for struct riscv_cache_ops
* Marked ax45mp_cmo_ops as __initdata

v9 -> v10
* Included RB/TB tags from Conor
* Fixed review comments pointed by Geert to rename cache callbacks
* Dropped preserving the cache lines in ax45mp_dma_cache_inv() callback

v8 -> v9
* Dropped adding ALTERNATIVE_3
* Implemented function pointer support for nonstandard noncoherent systems
* Added a new config option CONFIG_RISCV_NONSTANDARD_CACHE_OPS
* Updated Andes errata code to drop patching the calls as we no more use
  ALTERNATIVE_X() macro.
* Updated Andes CMO code to use function pointer for doing cache management.

v7 -> v8
* Dropped using function pointers and switched to ALTERNATIVE_X()
* Added new patches (#1, #2)

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
  riscv: asm: vendorid_list: Add Andes Technology to the vendors list
  riscv: errata: Add Andes alternative ports
  riscv: mm: dma-noncoherent: nonstandard cache operations support
  dt-bindings: cache: andestech,ax45mp-cache: Add DT binding
    documentation for L2 cache controller
  cache: Add L2 cache management for Andes AX45MP RISC-V core
  soc: renesas: Kconfig: Select the required configs for RZ/Five SoC

 .../cache/andestech,ax45mp-cache.yaml         |  81 +++++++
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig                            |   7 +
 arch/riscv/Kconfig.errata                     |  21 ++
 arch/riscv/errata/Makefile                    |   1 +
 arch/riscv/errata/andes/Makefile              |   1 +
 arch/riscv/errata/andes/errata.c              |  66 ++++++
 arch/riscv/include/asm/alternative.h          |   3 +
 arch/riscv/include/asm/dma-noncoherent.h      |  28 +++
 arch/riscv/include/asm/errata_list.h          |   5 +
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/alternative.c               |   5 +
 arch/riscv/mm/dma-noncoherent.c               |  43 ++++
 arch/riscv/mm/pmem.c                          |  13 ++
 drivers/Kconfig                               |   2 +
 drivers/Makefile                              |   1 +
 drivers/cache/Kconfig                         |  11 +
 drivers/cache/Makefile                        |   3 +
 drivers/cache/ax45mp_cache.c                  | 213 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 20 files changed, 516 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c
 create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
 create mode 100644 drivers/cache/Kconfig
 create mode 100644 drivers/cache/Makefile
 create mode 100644 drivers/cache/ax45mp_cache.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
