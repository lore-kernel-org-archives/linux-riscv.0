Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E623C7619A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NniS/9TSacEbYTLaD3QxxheXKjFLCE6wwizzD5Hu7F0=; b=DX6Der+4UeV29B
	tW6PVIN59mab2udnB9uhrveRGsvuVt282z5VzjFg/bbZGOqC1MK4CzK2slI7ncXVtfT8B5LZmPPXU
	Bn1S7Z12cQWQlYCn/qbT189P+fU+QlVIvUrug/RK0GcWouDcyarmf37JOV96QwC1vMkPbJyMYCB/T
	0BMOe/xwZn4486xnwUTnQuDf0hVTv+Jd3cAqEnjchKcjXKVO52DNh0kGl9ODOGdkqoksx5YLjDNC3
	jC1+nHkZYlnR3kSKsiQ9utLzORZHARnUfdnOd5X3XnItELv11PP9JH5+IgCxxVSmbQBuhlU/Rrbdt
	yP0MLL+Ujpf6Zv9dSWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM0-002kSM-2A;
	Wed, 12 Apr 2023 11:09:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYLu-002kPZ-2e
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 11:09:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id gw13so6280524wmb.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 04:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681297763; x=1683889763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiY5HH5pvk7NfR3NaORSyudCIOkd+3EzmyX8mORwPrY=;
        b=qbXbQTAtHcQtR34PMT2Nny68+mNZ/uQF0AGiRCoPc9bS8vfdbkn8+n/pgOjolVQjTz
         4jJu2LtX2PyaoFctvlMcr2UAyfunREFRrDamfyN1OZyKdB5NgF0tovr4xGsNyGn+TQf9
         NP0TQmbhGIHXrDeXfLuYKOqNgrAC7yCgKgQXsJjXR+v29DEaN6fJiTLA4QTmSaF7HTtG
         cmdAyxbLdP4WfjADy2f940OnSQB+325L+t1K9moDIBKB8AmszoP2wAHav6zPFBVJ0ISz
         W6QuUNCSv4taWj07R7pOfkIkhWa7tQXks7r3xZM8WzpUwkLQR53dAaNmYdDW5b3bnrx6
         tnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681297763; x=1683889763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiY5HH5pvk7NfR3NaORSyudCIOkd+3EzmyX8mORwPrY=;
        b=5tbOIHWWCUz8xAflXXQF44tIKDmWkelJOdPwuCQOsGu0LGbYp3+G6SrY6dSPVzygP4
         qIuJSwC9+PVWvWmBi7q4QPWWzvt/+xb96jrc4hi3Oy7UQVYNZW96MmcLQnI1pKBwk1sF
         8+hTKiK4/himdLJw4B1iWLnCBLymZlylwa6f3JAp7aAZYtzhANiZ9SzksFQ+s4StBSI7
         345SV/RNeGAH761SSkJph4ehjqUN2oViAoPH/zI0poPVJhJlS6EDuaqepVuBESBCyA4D
         7Lzj9RN8MMyEbrPH3pPeH3Uui8OYLMShYAyjGD6fbQ0HJFdnKZtNzfJ6bYAQbSWXuXDP
         khuw==
X-Gm-Message-State: AAQBX9elkVvPxkQAv/daEiW+aHZEVolhONHy/esQEVvumzmDCZdtma/h
	M8pTg+UzKUFWWNksp6ouMEE=
X-Google-Smtp-Source: AKy350YuP+z449mIkJbweAUOy8jRVV2+WFeecu006up1YaMjTvr+X6aMFlTef6LYma/Vsvfk/JVNoA==
X-Received: by 2002:a1c:7410:0:b0:3ea:ed4d:38f6 with SMTP id p16-20020a1c7410000000b003eaed4d38f6mr11751696wmc.4.1681297763280;
        Wed, 12 Apr 2023 04:09:23 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:783d:9280:20c4:db22])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm16863582wru.116.2023.04.12.04.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 04:09:22 -0700 (PDT)
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
Subject: [PATCH v8 0/7] Add non-coherent DMA support for AX45MP
Date: Wed, 12 Apr 2023 12:08:53 +0100
Message-Id: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_040926_886472_0F93BA4A 
X-CRM114-Status: GOOD (  21.77  )
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
cache.

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

Lad Prabhakar (7):
  riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
  riscv: asm: vendorid_list: Add Andes Technology to the vendors list
  riscv: errata: Add Andes alternative ports
  dt-bindings: cache: andestech,ax45mp-cache: Add DT binding
    documentation for L2 cache controller
  cache: Add L2 cache management for Andes AX45MP RISC-V core
  riscv: errata: Hookup the Andes AX45MP non-coherent handling
  soc: renesas: Kconfig: Select the required configs for RZ/Five SoC

 .../cache/andestech,ax45mp-cache.yaml         |  81 +++++++
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig.errata                     |  21 ++
 arch/riscv/errata/Makefile                    |   1 +
 arch/riscv/errata/andes/Makefile              |   1 +
 arch/riscv/errata/andes/errata.c              | 104 ++++++++
 arch/riscv/include/asm/alternative-macros.h   |  51 +++-
 arch/riscv/include/asm/alternative.h          |   3 +
 arch/riscv/include/asm/cacheflush.h           |   9 +
 arch/riscv/include/asm/errata_list.h          |  38 ++-
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/alternative.c               |   5 +
 drivers/Kconfig                               |   2 +
 drivers/Makefile                              |   1 +
 drivers/cache/Kconfig                         |  10 +
 drivers/cache/Makefile                        |   3 +
 drivers/cache/ax45mp_cache.c                  | 222 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +
 18 files changed, 552 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c
 create mode 100644 drivers/cache/Kconfig
 create mode 100644 drivers/cache/Makefile
 create mode 100644 drivers/cache/ax45mp_cache.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
