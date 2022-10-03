Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2401BC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 22:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9tLv83qOv6l0pjXVkLqej4TKp4sI0jNyqFSdntOcLcM=; b=f7Dwi8GgUJkiJ+
	zgWgykkszxGAmZuImuomBcAaUiyCa7tEOcoS7aNifg6EjoXtkV+AIkzK55+UpyImJGyGSy4aKiokC
	g6/R1VTzplYBMHk5wkhOTR85VjzTqjfoznSLI3uo6YZ1VTnfAX2PZhIUgxXIsad937ulI+HffNlz6
	oCEc5q4WB1ahKnpNZdn7SqEc7H6tF1OLS4LraXbys1umFaiv3CHL6iNyD7aUNAcE1pOcdJhL/znQU
	1sjXPyebccGQCiXOZA77DLptcvLqqzH8Ym7DIJUmiW57zIwAtoCVDtS7ZsmEHV/AQsOFDDUakppdI
	iWpDCDN/eXrDmwITiBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofTzW-007vcm-GA; Mon, 03 Oct 2022 22:32:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofTzS-007vbv-N1
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 22:32:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so6582669wmb.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 15:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=0tMQzYjbaLsCweYjpM8n0zpd8PrCu0Lk7bNxjno/MYg=;
        b=YpfI3BvwLzUzZT8AxK4Fy83CrWDoIqpJvkmiMCUhYoNXFAMJILcu/6XrQGf6/IH/cN
         3OiBOdUgv7UBULMF1qoWVtKVa2gg7lCtGCT9nPtHNXll+QpN5NLx1smTWdNCy3oXWQDf
         nGE29uinV6ltUsnRKRFhhJilWuK5eFsb1978oaEz/YP92Y+Cy7GrEi+QVjgtupARRjN7
         DHYiQYP8y3q/1xVGZauGn7esikf03cSEpm8yC57qj1nfHqi/OwNTVhqB81WXOvsENYNN
         2SYfyAveTq1QpLyCNyyk3d7kAG1klLg9LRsyIVkes4OE27/pke2IqBn86Rk3kr5aa5/p
         lK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=0tMQzYjbaLsCweYjpM8n0zpd8PrCu0Lk7bNxjno/MYg=;
        b=3kgfFezl6peMjYZjFy+Hxz1DKq8E5GyJRAM051l2XplEWyOtWytKYTCykVM60AZfot
         024evrTBW0DFOlq2OPjJpOwJvHabbL5G1zZrKvoUZO4ZpsqbuM5ppw80DIx1SbD3+iR4
         tmYW3AbPDKIxZIRSiVWSlCRS2MWn2mkZpzAm9WN72qC7AGfsmHwKgTtvJHL+JT5rlO2V
         oSnaR/h8KzjvMI2JpqS6JG8B4XyuXKFzLMQzVXe7pvtWM5aWwEaQugEa+DHILLlcufXJ
         IICk/FyeKw7e5AMV1nm3Qt4LRaWcVpohzDrJO+BBZ8n1PBIsEU/07QWMTntVDC2GJMa7
         jF2w==
X-Gm-Message-State: ACrzQf0YsBUsfNmxxoEnsJJxsvePH9jCHjnCwQ9S703Hi49UCVUs0N3f
	MNd+DoQsYFxFH/df3EpdtIk=
X-Google-Smtp-Source: AMsMyM4NJ+peHG8KO0QpBjrEY85xQCl64YMPRI3dJ6cmcmu8BoQyKJV5tsNB2kw9Yp+MV3edWkc3FQ==
X-Received: by 2002:a05:600c:221a:b0:3b4:75b8:3f7f with SMTP id z26-20020a05600c221a00b003b475b83f7fmr7962580wml.175.1664836363255;
        Mon, 03 Oct 2022 15:32:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c8:2501:c701:34b9:36fa:3827:d20])
        by smtp.gmail.com with ESMTPSA id m64-20020a1ca343000000b003a6125562e1sm12884871wme.46.2022.10.03.15.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 15:32:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 0/2] AX45MP: Add support to non-coherent DMA
Date: Mon,  3 Oct 2022 23:32:20 +0100
Message-Id: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_153246_814251_3D117379 
X-CRM114-Status: GOOD (  19.70  )
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
non-cacheable and bufferable with the SBI call.

        l2cache: cache-controller@13400000 {
                ....
                pma-regions = <0x0 0x00000000 0x0 0x14000000>,
                              <0x0 0x20000000 0x0 0x10000000>,
                              <0x0 0x58000000 0x0 0x08000000>;
                ....
        };

2] We provide callbacks to synchronize specific content between memory and
cache.

        - arch_sync_dma_for_device()
        - arch_sync_dma_for_cpu()

Below are the configs that are enabled:

        - DMA_GLOBAL_POOL
        - RISCV_DMA_NONCOHERENT

Below is the L2 cache DT node:

        l2cache: cache-controller@13400000 {
                compatible = "andestech,ax45mp-cache", "cache";
                cache-size = <0x40000>;
                cache-line-size = <64>;
                cache-sets = <1024>;
                cache-unified;
                reg = <0x0 0x13400000 0x0 0x100000>;
                pma-regions = <0x0 0x00000000 0x0 0x10000000>,
                              <0x0 0x10000000 0x0 0x04000000>,
                              <0x0 0x20000000 0x0 0x10000000>,
                              <0x0 0x58000000 0x0 0x08000000>;
                interrupts = <SOC_PERIPHERAL_IRQ(476, IRQ_TYPE_LEVEL_HIGH)>;
        };

Due to the above approach custom SBI calls have been implemented. The
above implementation is in preparation for adding support for Renesas
RZ/Five SoC which uses the AX45MP core. As with the above approach the
kernel image might not be generic so that it can be used on other
platforms, so sending it as an RFC (without DT binding patches).

OpenSBI implementation isn't upstreamed yet, public repo for access is
available at [0].

[0] https://github.com/renesas-rz/rz_opensbi/tree/work/OpenSBI-PMA

RFC v1-> RFC v2
* Moved out the code from arc/riscv to drivers/soc/renesas
* Now handling the PMA setup as part of the L2 cache
* Now making use of dma-noncoherent.c instead SoC specific implementation.
* Dropped arch_dma_alloc() and arch_dma_free()
* Switched to RISCV_DMA_NONCOHERENT
* Included DT binding doc

RFC v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Sending this as an RFC as CONFIG_ERRATA_THEAD_CMO/CONFIG_ARCH_R9A07G043
is used for determining the CMO to call it would better if we could do
this runtime instead.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: soc: renesas: r9a07g043f-l2-cache: Add DT binding
    documentation for L2 cache controller
  soc: renesas: Add L2 cache management for RZ/Five SoC

 .../soc/renesas/r9a07g043f-l2-cache.yaml      |  82 ++++
 arch/riscv/include/asm/cacheflush.h           |   8 +
 arch/riscv/include/asm/errata_list.h          |   2 +
 arch/riscv/include/asm/sbi.h                  |   1 +
 arch/riscv/mm/dma-noncoherent.c               |  20 +
 drivers/soc/renesas/Makefile                  |   4 +
 drivers/soc/renesas/rzf/Makefile              |   3 +
 drivers/soc/renesas/rzf/ax45mp_cache.c        | 365 ++++++++++++++++++
 drivers/soc/renesas/rzf/rzf_sbi.h             |  27 ++
 9 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/r9a07g043f-l2-cache.yaml
 create mode 100644 drivers/soc/renesas/rzf/Makefile
 create mode 100644 drivers/soc/renesas/rzf/ax45mp_cache.c
 create mode 100644 drivers/soc/renesas/rzf/rzf_sbi.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
