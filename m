Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2CFEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 20:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oeNVv9rV85lE5xDECEx+cxyX0nO//Kx74fd8lqXH7ek=; b=tyXbd2CPm0xTcK
	vJHpF7LV224nFOVAorJSyhqzYg6nILY05aGjeEQ2HyRtfq80t1lA7MUk/qiNFlPuNRN4BAEumcQFM
	qNtneg9tVBJariAPBwuMJy0R+X04f1hnutKjnvXi50+3nmZe8Tm8uYRv1DWTODGJ/BS37SI62scH/
	XkX2ie71d5LO9sFJ0Yor26/1+hfnvSnsdRdetrjm8ngky4r4ZQzBv2A0ymey6q5rHtrepUkv+iokb
	gMFpYH1X2Oc3PaeRt4nwu0aLPP2heEHWGB/u6JIhV9reLlJ9NbddxMkcjQ/Uz7eUUDmgfUBjWxgmg
	9he9ffOxHc7oGZ5aGCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeeB-000KT7-1c;
	Mon, 14 Aug 2023 20:58:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVee8-000KRy-1M
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 20:58:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so43012925e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 13:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692046717; x=1692651517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0A4A3WqLpjSmFP0W9YhFtOsFDHMwWhpbQHtyJDhofZQ=;
        b=K7CgABcOCoN88bhx5ZegXuyGVTnOsQ1l5DXIE7cqOJqaG9OebMw7Lpxm0gkJ0Dq40s
         nw7ioDMvmDXQQ8PibW5T1kQdxUPLVWyB+ktRH63FMzGeTGcDOXSbna6X0vH6554KEC+5
         KjARNDOFL9XVP30jMeqVMOGwa19UhWkZA8Jij8npyqG+1eL3Pj2vb67hmzJUHmEQj+MP
         Pnm8xLJDu8EHhspGsVjeyj+yTW6+pZwNPQ99nKyOTc4cZiIY/fuu0g0hDwtKVbyir7TX
         Py4/aQxOceJ0nUxq8bVGkO+nlV/RYZQMbq1NGEw0B0Kjq9QCQCJrzszs23z5iSVzhDPE
         d1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692046717; x=1692651517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0A4A3WqLpjSmFP0W9YhFtOsFDHMwWhpbQHtyJDhofZQ=;
        b=Wlf07x/UrdVZ9ptl1xwB4DwTTJ7txvM98NJUty3CjJ+Uie4nq8jVtQHt+WjTc/W6qY
         Fj0CkpfPuiwO6/3y2ykK8UtX1r49jF25icvT3DeT8XognCRBiSOryUw2TALHmv3RF2vN
         vCzoxA0flBrLBQ8KVBcIpdUU+ksB05GP+g6UlOha+nILD1wP/au1jyrWF2F9e/Nc6Ry9
         3ZxFR9gn6cVMYT2j9ITnTQ0A1PReQQOPfXrmxX9f0yDgoTCswA4I+tkxFLIcWrm9xWCM
         6e41Ji6DdoSjE+1fzkDQqs5fPfO8X89IHEchPJ+iIO9ZS0HJ+UCZo3eC0czlC/z4GsZu
         CqIQ==
X-Gm-Message-State: AOJu0Ywr3tKggQZDGiGErKcML4JyJK7uvM03uQY4FzqA5cX7PBV6YREb
	tXpdz+iGls7RwzwlqS5fHk4=
X-Google-Smtp-Source: AGHT+IE5mW1TReGZDvV5xY+VNTlXFWfRsj3NGnJl/RV4Rww2zHvRyKicT3U3leN6QxQAzTyATGEOfg==
X-Received: by 2002:a05:6000:511:b0:317:648c:3895 with SMTP id a17-20020a056000051100b00317648c3895mr7387352wrf.33.1692046717355;
        Mon, 14 Aug 2023 13:58:37 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:20e9:baea:a4f7:d880])
        by smtp.gmail.com with ESMTPSA id h5-20020adffa85000000b003197efd1e7bsm2161806wrr.114.2023.08.14.13.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:58:36 -0700 (PDT)
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
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 0/6] Add non-coherent DMA support for AX45MP
Date: Mon, 14 Aug 2023 21:57:13 +0100
Message-Id: <20230814205719.79647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_135840_462430_69C56BEB 
X-CRM114-Status: GOOD (  23.83  )
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
  https://patchwork.kernel.org/project/linux-riscv/cover/20230814202821.78120-1-prabhakar.mahadev-lad.rj@bp.renesas.com/.
  (Ive rebased Arnd's series on v6.5-rc-5)
- Patches applies on top of palmer/master (25aa0bebba72) +
  palmer/for-next (174e8ac0272d5) + palmer/fixes (7e3811521dc39)
- Ive pushed the complete tree here https://github.com/prabhakarlad/linux/tree/rzfive-cmo-v11

v10 -> v11
* Included RB/TB tags from Conor
* Fixed review comments pointed by Geert to rename cache callbacks
* Dropped preserving the cache lines in ax45mp_dma_cache_inv() callback

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
