Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D4EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 17:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=11lvOa5Auz4zhuBuFiEVLcNjPb2vvyqt6SIt04MQDd0=; b=MK2IpgE3XVpfjJ
	F90YUnRi++9v/PSTvsyRpGYF11CzvCa1iSRYYRKptRL/5iSdhUy5rSQ2jdTiuj+exqEnuhKh1NltE
	EFqsM49mrdjNRD4xBMo93xYWzIwERW7R5EkPaqa0sQB1wXxzAk9RgHdw2T0omsLHk57MtRUSSCpLK
	NebQTZnONuw+Bi8W65Jl/axrPsjO2m/jtLc2N9GZdB/TB1P/NQhsdxXTWIO4WWXup4469cR5kSrBI
	NnaemTLy9RJcUwVjJidI2xxuxbg9zCZcbNPM7TfDkfTElCgwZpNFzTaJXKF9I533g3sQs1/010WAh
	xBEyYhOq9D7DXYips63Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFvx-00AQjA-2U; Thu, 24 Nov 2022 17:22:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyFvt-00AQfR-96
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 17:22:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so1719287wms.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 09:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KQqb78n0KQHdh6j5CzLXBS3iilkCOthEsqvfHBARtHU=;
        b=dZE1hK4yYG3r2wjJffeNeKGMAzRkLww+0Qw7dDXwzrZg9tNUnsUb9o8MHmiKxmLnYq
         mvWw1TZElTekNJ629YC9llcJRBl5zOVKvtLRhdz4rcXbjUfs+EaYUXIW48l3CgcmlG8u
         dpulCqtQZ2YGNh8gnAnqUJRY336cJbkYrZUJy8NmvhZL59BXCR3AJYvMXfa7gjlQjtAr
         ocT74/G+I/Sof5640+yg5LQktDoXLC16SV62BwuY3x8KrAUfihBoAl9BJOUImNyy5MVT
         sR8ZIis2pkJ/qKsWuCiFS6XaF7vvKVngeN5lUyA6k8siKFkuesZu9IWf+axML+UwecqN
         J3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQqb78n0KQHdh6j5CzLXBS3iilkCOthEsqvfHBARtHU=;
        b=luvq+0BoN8aWyrwsnrhvZXO+dKG/aOxnUJFr77VDlvugv5Dyb94p5C3KQ/Pc/Mk4Nq
         1V1/3CpZUGtUa442qMJKHV7WgjEKbEH1aFcPQvpGMLN156Kqh9oTmtUqQZydSTIF5VwR
         6R+bRho72geRDdj6VmiPZZzqvzbW+jnxeuWPXGZih+6FA+CpZQy0uc6epNw6RT50CDoh
         L+0/zgC8IYjQPUbb1nKbAQDrX3tRky1vQqaBbIM3rQm7rh5Bm+zK36tBbrh/xFb74fQC
         Cbp628jTq0Sbqz7kuEH7NIto9w8eMRa3j9jnbpayC9QJshM7yPoZmFafznME/JjSpwyV
         kwdw==
X-Gm-Message-State: ANoB5plJuSH1EclrUA9fqUExTYJH3sY2qXmuIgccN/jDegBrOwgT5oUm
	pWlCkDwA3Y5r04gkylTtiOM=
X-Google-Smtp-Source: AA0mqf4JBpebIZfairvkOiGu/YW1aGgIcGkSW1lHcvmZK3KI/7zELwhKGfonW8TToVYJox5SedAoIg==
X-Received: by 2002:a05:600c:6886:b0:3cf:ca45:3b19 with SMTP id fn6-20020a05600c688600b003cfca453b19mr14481564wmb.179.1669310558058;
        Thu, 24 Nov 2022 09:22:38 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:89ee:3f5d:1c99:35d8])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003c64c186206sm2698086wmn.16.2022.11.24.09.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 09:22:37 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/7] AX45MP: Add support to non-coherent DMA
Date: Thu, 24 Nov 2022 17:22:00 +0000
Message-Id: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_092241_351606_C2AF21D7 
X-CRM114-Status: GOOD (  20.18  )
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

On the Andes AX45MP core, cache coherency is a specification option so it
may not be supported. In this case DMA will fail. To get around with this
issue this patch series does the below:

1] Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
block that allows dynamic adjustment of memory attributes in the runtime.
It contains a configurable amount of PMA entries implemented as CSR
registers to control the attributes of memory locations in interest. PMA
regions are passed from the l2 node which are configured as
non-cacheable + bufferable with the SBI call.

        l2cache: cache-controller@13400000 {
                ....
                andestech,pma-regions = <0x58000000 0x08000000
                                         (AX45MP_PMACFG_ETYP_NAPOT |
                                          AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
                ....
        };

2] We provide callbacks to synchronize specific content between memory and
cache.

        - arch_sync_dma_for_device()
        - arch_sync_dma_for_cpu()

Below are the configs that are enabled:

        - DMA_GLOBAL_POOL
        - RISCV_DMA_NONCOHERENT

3] We reserve the shared DMA pool, so the DMA memory requests go through
   this pool:

        reserved-memory {
                #address-cells = <2>;
                #size-cells = <2>;
                ranges;

                reserved: linux,cma@58000000 {
                        compatible = "shared-dma-pool";
                        no-map;
                        linux,dma-default;
                        reg = <0x0 0x58000000 0x0 0x08000000>;
                };
        };


Below is the L2 cache DT node:

        l2cache: cache-controller@13400000 {
                compatible = "andestech,ax45mp-cache", "cache";
                cache-size = <0x40000>;
                cache-line-size = <64>;
                cache-sets = <1024>;
                cache-unified;
                reg = <0x0 0x13400000 0x0 0x100000>;
                andestech,pma-regions = <0x0 0x58000000 0x0 0x08000000 0x0
                                         (AX45MP_PMACFG_ETYP_NAPOT |
                                          AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF)>;
                interrupts = <SOC_PERIPHERAL_IRQ(476, IRQ_TYPE_LEVEL_HIGH)>;
        };

Due to the above approach custom SBI calls have been implemented. The
above implementation is in preparation for adding support for Renesas
RZ/Five SoC which uses the AX45MP core. As with the above approach the
kernel image might not be generic so that it can be used on other
platforms.

OpenSBI implementation isn't upstreamed yet, public repo for access is
available at [0].

[0] https://github.com/renesas-rz/rz_opensbi/tree/work/OpenSBI-PMA

Note,
- This series requires testing on Cores with zibcom and T-Head SoCs
- Ive used GCC 9.4.0 for compilation
- Tested all the IP blocks on RZ/Five which use DMA

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

Lad Prabhakar (7):
  riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
  riscv: asm: vendorid_list: Add Andes Technology to the vendors list
  riscv: errata: Add Andes alternative ports
  riscv: errata: andes: Fix auipc-jalr addresses in patched alternatives
  riscv: mm: dma-noncoherent: Pass direction and operation to
    ALT_CMO_OP()
  dt-bindings: cache: r9a07g043f-l2-cache: Add DT binding documentation
    for L2 cache controller
  soc: renesas: Add L2 cache management for RZ/Five SoC

 .../cache/andestech,ax45mp-cache.yaml         |  93 ++++
 arch/riscv/Kconfig.erratas                    |  22 +
 arch/riscv/errata/Makefile                    |   1 +
 arch/riscv/errata/andes/Makefile              |   1 +
 arch/riscv/errata/andes/errata.c              | 139 ++++++
 arch/riscv/include/asm/alternative-macros.h   |  94 ++++
 arch/riscv/include/asm/alternative.h          |   3 +
 arch/riscv/include/asm/cacheflush.h           |  12 +
 arch/riscv/include/asm/errata_list.h          |  45 +-
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/alternative.c               |   5 +
 arch/riscv/mm/dma-noncoherent.c               |  15 +-
 drivers/soc/renesas/Kconfig                   |   7 +
 drivers/soc/renesas/Makefile                  |   2 +
 drivers/soc/renesas/rzfive/Kconfig            |   6 +
 drivers/soc/renesas/rzfive/Makefile           |   3 +
 drivers/soc/renesas/rzfive/ax45mp_cache.c     | 415 ++++++++++++++++++
 drivers/soc/renesas/rzfive/ax45mp_sbi.h       |  29 ++
 .../cache/andestech,ax45mp-cache.h            |  38 ++
 19 files changed, 918 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c
 create mode 100644 drivers/soc/renesas/rzfive/Kconfig
 create mode 100644 drivers/soc/renesas/rzfive/Makefile
 create mode 100644 drivers/soc/renesas/rzfive/ax45mp_cache.c
 create mode 100644 drivers/soc/renesas/rzfive/ax45mp_sbi.h
 create mode 100644 include/dt-bindings/cache/andestech,ax45mp-cache.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
