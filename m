Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F77ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 10:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9gfw9fcreC5GsyAuLH4Gtl3/iH0ZCi6MYSIs6egKWMg=; b=MCqkvOFlacFPsl
	F84J30Jt2af6aLjizwdrlMKDjNcw03y0kuxvj8OD84FpeyZeOOy+KSvLLXTNjXbAL3DNFG1VypPbu
	YMZ8GfEu4dUtALQL1e/31o9FpmWmj19xFbn6BwIUbo2PhvkXSiTfpRM4M1udQ2XHxjdrmmpbfbrxa
	BqCS/4n3+LrK1svWa7ZMnQV8PpCpMO4vrTBDC2yBaietsgXaW/haXO+M5t9vsQoVs5T2kcQTyOyKd
	1NQceF5WcxRcfJOKtsjtiErUU/zBY1IJnT8I6A0WxHt7SMltk57pVZLiLV+SZJx4MwPkLkXbLms+I
	sJ9ShL8j8sDSaNN7pEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVVim-00CNft-5g; Tue, 06 Sep 2022 10:22:20 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVVih-00CNUL-AY
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 10:22:17 +0000
X-IronPort-AV: E=Sophos;i="5.93,293,1654527600"; 
   d="scan'208";a="133888032"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Sep 2022 19:22:09 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B847841BDC42;
	Tue,  6 Sep 2022 19:22:05 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <Conor.Dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/2] AX45MP: Add support to non-coherent DMA
Date: Tue,  6 Sep 2022 11:21:52 +0100
Message-Id: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_032215_561469_B8FB7849 
X-CRM114-Status: GOOD (  14.41  )
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

Hi All,

On the Andes AX45MP core, cache coherency is a specification option so it
may not be supported. In this case DMA will fail. To get around with this
issue this patch series  does the below:

Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
block that allows dynamic adjustment of memory attributes in the runtime.
It contains a configurable amount of PMA entries implemented as CSR
registers to control the attributes of memory locations in interest. PMA
regions are passed from the cpu core node which are configured as
non-cacheable and non-bufferable with the SBI call.

        ax45mp: cpu@0 {
                compatible = "andestech,ax45mp", "riscv";
                device_type = "cpu";
                ....
                pma-regions = <0x0 0x00000000 0x0 0x14000000>,
                              <0x0 0x20000000 0x0 0x10000000>,
                              <0x0 0x58000000 0x0 0x08000000>;
                ....
        };

We provide callbacks to synchronize specific content between memory and
cache. We allocate a global DMA coherent pool (which is marked as
non-cached using PMA) so that DMA memory allocations happens from this
pool and we implement the below callbacks:

- arch_sync_dma_for_device()
- arch_sync_dma_for_cpu()
- arch_dma_alloc()
- arch_dma_free()

Below are the configs that are enabled:

- DMA_GLOBAL_POOL
- ARCH_HAS_SYNC_DMA_FOR_CPU
- ARCH_HAS_SYNC_DMA_FOR_DEVICE

        l2cache: cache-controller@13400000 {
                compatible = "andestech,ax45mp-cache", "cache";
                cache-size = <0x40000>;
                cache-line-size = <64>;
                cache-sets = <1024>;
                cache-unified;
                reg = <0x0 0x13400000 0x0 0x100000>;
	};

Due to the above approach custom SBI calls have been implemented. The
above implementation is in preparation for adding support for Renesas
RZ/Five SoC which uses the AX45MP core. As with the above approach the
kernel image might not be generic so that it can be used on other
platforms, so sending it as an RFC (without DT binding patches).

OpenSBI implementation isn't upstreamed yet, public repo for access is
available at [0].

[0] https://github.com/renesas-rz/rz_opensbi/tree/work/OpenSBI-PMA

Cheers,
Prabhakar

Lad Prabhakar (2):
  riscv: vendors: andes: Add support to configure the PMA regions
  riscv: vendors: andes: Add support for non-cohernet dma

 arch/riscv/Kbuild                             |   2 +
 arch/riscv/include/asm/sbi.h                  |   1 +
 arch/riscv/vendors/Makefile                   |   3 +
 arch/riscv/vendors/andes/Makefile             |   4 +
 arch/riscv/vendors/andes/ax45mp.c             |  93 ++++++
 arch/riscv/vendors/andes/ax45mp_cache.c       | 296 ++++++++++++++++++
 arch/riscv/vendors/andes/ax45mp_nocache_dma.c |  65 ++++
 arch/riscv/vendors/andes/include/proc.h       |   9 +
 arch/riscv/vendors/andes/include/sbi.h        |  27 ++
 9 files changed, 500 insertions(+)
 create mode 100644 arch/riscv/vendors/Makefile
 create mode 100644 arch/riscv/vendors/andes/Makefile
 create mode 100644 arch/riscv/vendors/andes/ax45mp.c
 create mode 100644 arch/riscv/vendors/andes/ax45mp_cache.c
 create mode 100644 arch/riscv/vendors/andes/ax45mp_nocache_dma.c
 create mode 100644 arch/riscv/vendors/andes/include/proc.h
 create mode 100644 arch/riscv/vendors/andes/include/sbi.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
