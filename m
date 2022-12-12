Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D6EC2D0CB
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ql306FtdfYKae6TDEAphX87d5zh0Qyp23VJULdqHTow=; b=VQEMdtcpgu0X44
	+TlT4NIvUhvSsNrrDsuPPAbAfKU3FcST5pc3HVFomsZeZxeykUfhoMaBz3G0530p5bp3A2aUgup/f
	uJjCLUgP84E+eIL9QkjcCoJa9FDiqW4sts/g56MkwifrGrmF2WgPSx8/WHwAj/2FaU9OKyzHVD8dA
	2Om5ubZuoS7bpkXx8dFO+Mp43UWqaVR0IihfFk8CZ4eUo8JPHFhiQzNJbqTVmFBuzPcVSGrgmwplm
	qEBwx9r2ShEQ3eSgUj5YTYoOvHBIMVWkqELkpusjM7cAvujLTO8OFwrzXtjdzWEFWfnOKqke5tY9l
	agmB5hkFBw9wupJJgMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPE-00ExIY-0D; Mon, 12 Dec 2022 11:55:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hPB-00Ex98-1V
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 11:55:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso4915820wmo.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 03:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y2ETDY9kzpY5Fe4txiNeWBSSB7VK4LZqJFu+sI6h0Y=;
        b=gH70gzNKB033u3DNcf3ld6m0ZiprKou8HSdTDvCU/JiGyxFca4JszxlB/f8f4lLRBW
         RQIwl/76kQd/rmS31fLm8s1xOeuidDqBtVdvC0/UgqoI5fTaWHZg1LsCQHXCOHhtGMR1
         RoXTMgEr8ynKXwjr7XZUTrbZTCqAaVw+jfcJ2jul2Awriu4oB+IAUYi9shqju8tKfTPF
         spCmAsT4EbelV0aajBfWNRQQ+V1Qh0q1r+VYLK93JA/mRKgUgBOUI6Q9QQIb5/TGQ2oK
         7+R4RC/Gav/Xhk37MJirl6pQf08yZEbnYf3XICat7eQxHdGOlmAs8H0FaNSkETbuDMZo
         7CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Y2ETDY9kzpY5Fe4txiNeWBSSB7VK4LZqJFu+sI6h0Y=;
        b=R4uiTpekWpIgaOEtxjFDQ5VWFj3dwK60aK7u2EKayVmOGaIZPJHJ7f48TLWgrLLzfL
         qZ49qAPMHTYD4yEW8/uj5iR1kp89zdxFxWgljXidTXpiy0QT0VN2rXpzYVgqC6rXAS+9
         q6LR9+PALVibwUmY2+ECAxbZ3vS3G4Py4AVAouLEYRK8KjrzjoXTLB8ZeRu4diMlnVtJ
         /S/wiwWVDDjWxVtKG052tY0Wx5YD5YiimkaJ7WSHm5boLI5BOUtrriBXR5XWumb/iYRk
         HIWHsvQCyHffFkTaJ9RxQkoneRMOAaT3coj0hKR7VVr4fZpMAjJlYRUGWlEPvcEBMghB
         wxgw==
X-Gm-Message-State: ANoB5pmiU2ZsP6LVwlNCGay6zmXWp81QWP1UikGo0QR6cG7EBifDlwG3
	ehzsAOd8Gz6/lfIEKopwJ7w=
X-Google-Smtp-Source: AA0mqf4z6LGIMgMOwSo+HXWPSSjbbH379O4giBDXbmd430wDE24OXOwqIQtSUbCkKitytybI+04Fcw==
X-Received: by 2002:a05:600c:601c:b0:3cf:fc0b:3359 with SMTP id az28-20020a05600c601c00b003cffc0b3359mr12361319wmb.0.1670846129561;
        Mon, 12 Dec 2022 03:55:29 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:1484:ef11:b25c:4612])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b4cba4ef71sm9793820wmq.41.2022.12.12.03.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 03:55:28 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/6] AX45MP: Add support to non-coherent DMA
Date: Mon, 12 Dec 2022 11:54:59 +0000
Message-Id: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_035533_138138_616CD5C2 
X-CRM114-Status: GOOD (  20.50  )
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

Note,
- This series requires testing on Cores with zibcom and T-Head SoCs
- Ive used GCC 12.2.0 for compilation (tested with allmodconfig)
- Tested all the IP blocks on RZ/Five which use DMA
- Series is dependant on https://patchwork.kernel.org/project/linux-riscv/cover/20221207180821.2479987-1-heiko@sntech.de/

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
  riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
  riscv: asm: vendorid_list: Add Andes Technology to the vendors list
  riscv: errata: Add Andes alternative ports
  riscv: mm: dma-noncoherent: Pass direction and operation to
    ALT_CMO_OP()
  dt-bindings: cache: r9a07g043f-l2-cache: Add DT binding documentation
    for L2 cache controller
  soc: renesas: Add L2 cache management for RZ/Five SoC

 .../cache/andestech,ax45mp-cache.yaml         |  81 ++++++
 arch/riscv/Kconfig.erratas                    |  22 ++
 arch/riscv/errata/Makefile                    |   1 +
 arch/riscv/errata/andes/Makefile              |   1 +
 arch/riscv/errata/andes/errata.c              |  93 +++++++
 arch/riscv/include/asm/alternative-macros.h   |  46 +++-
 arch/riscv/include/asm/alternative.h          |   3 +
 arch/riscv/include/asm/cacheflush.h           |  12 +
 arch/riscv/include/asm/errata_list.h          |  41 ++-
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/alternative.c               |   5 +
 arch/riscv/mm/dma-noncoherent.c               |  15 +-
 drivers/soc/renesas/Kconfig                   |   6 +
 drivers/soc/renesas/Makefile                  |   2 +
 drivers/soc/renesas/rzfive/Kconfig            |   6 +
 drivers/soc/renesas/rzfive/Makefile           |   3 +
 drivers/soc/renesas/rzfive/ax45mp_cache.c     | 256 ++++++++++++++++++
 17 files changed, 576 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c
 create mode 100644 drivers/soc/renesas/rzfive/Kconfig
 create mode 100644 drivers/soc/renesas/rzfive/Makefile
 create mode 100644 drivers/soc/renesas/rzfive/ax45mp_cache.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
