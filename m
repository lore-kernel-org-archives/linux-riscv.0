Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33EAC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 13:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aDE4LQ3a5KbOpOifO8pDGeuU9rwpEJx4nxfiCxyXFfY=; b=dhfY7cLG1W7AN9
	TKRRtTC1Ld7LHk9YqOLzvXPzlXVjbxtNGu8+MFc8P6qv1fT7OPltYHmpZJjQIE30eYTZPdhQtV+B3
	/3/zpHpJummFatFLmjmLWiVZbuI33jEmaSeZGFLBJNB7T1kuEMBMOmxCz0IRcgQfIha+zwPtL1sa6
	wWSVEJB5rybC9WVQrES1MwmIzo9IjAXyRNjpQCUVU28wgEfE7GgLWkmlrhcMTKcy2bI1nvo28vmBt
	+1reIu9GxqviawMPVK7K+ozn3SbY7MOhx04XcFNBwHf7VF+5iRQVlOoimtXj0lwD057GViYgLGTfP
	RVVRXOHzkotyi6CV4/sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWer-007M07-3X; Thu, 21 Jul 2022 13:56:05 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWYY-007GTo-Bh
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 13:49:36 +0000
Received: by mail-pg1-x532.google.com with SMTP id r186so1749051pgr.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2gjE/mCYbbSP65o7jJNSxwg8UOz1UiDFn/ArXcu23xc=;
        b=N995SlDL+XA8tQSau6Drcjdn8T1+Hz/P48zIGTY9W17QgUh9S0MBlEDJbOuwgJFT7R
         fnchqm5FwLD3uVrTcBs9/Y1UlAdlbBnH+mmAqpI3afvRqQaGugksGJ0vnliGDevmxn+b
         tAj0vD1ZtP7NvPqArLpRkP03Ixi3j73dVRbnzhOSEdMctzRhEICpiAgnC9Tpj4LKaan4
         WP/mQRDHcS01Rsap9/3efaXcxYkZ5WlqvomoR+xjy5+EgYsxl78+VnSI6puSyM3N5Qas
         gdlo1mIEO+NArhkM1cNELUJ1QEn/BDipwoGjUbts/9PdKBcGQWaHgnGCZ8o54aubVMaq
         O7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2gjE/mCYbbSP65o7jJNSxwg8UOz1UiDFn/ArXcu23xc=;
        b=2CIB4bvv1L8YFDMooTOVt1807rMlHJueHMKHA40dnlPV3nwdyOF3D1/Vb6PWktYHAl
         DgXp7jFy2/K/Avje/FelJoNuMc6rX6t8MJZglOKoWi4MX2fhHF0E9YBUTDetRpdyRp+l
         5MwWL7fJSj/JG5wdkmOVjzwwyTPgG+mtdcwC6qHcOJQJecnNZEmSYZzMmZVDZCzljhXu
         rQtXcI70mCTxpRAt5TEsgeD6IOoJNmUQ8kMfcpKhrJZRd7+LNxIkDWSMu2UwSDXTIbAS
         JTFKrPEtPwriIwieicWnyBaZO2akaszXaQC6nYPWGPDNaHMdOtk69FLfLhInt/XWXRfM
         9CwQ==
X-Gm-Message-State: AJIora82pfnfTilPlmIpp9mVAqvAjMyaXfHiFg8ajIB2BhdBNYWpHOqQ
	yD+L/fasDbk54mVEzGtyGJo=
X-Google-Smtp-Source: AGRyM1ud/soERWZGCRSjwEjswDaxrjWDFBAuZBJKqFBmkOI2IW4jWgtr9Svq3y5sBoZWAFNSU2cGDA==
X-Received: by 2002:a63:4a62:0:b0:412:8c83:a36c with SMTP id j34-20020a634a62000000b004128c83a36cmr37950436pgl.404.1658411371669;
        Thu, 21 Jul 2022 06:49:31 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id n7-20020a056a00212700b0052ab0a73752sm1789615pfj.198.2022.07.21.06.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:49:31 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org
Subject: [PATCH v5 0/4] Cleanups for asm-generic/pci.h
Date: Thu, 21 Jul 2022 22:49:20 +0900
Message-Id: <20220721134924.596152-1-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_064934_484936_DF551236 
X-CRM114-Status: GOOD (  17.27  )
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

When reviewing the OpenRISC PCI support patch Arnd suggested that
we avoid copying arm64 and riscv asm/pci.h and moving that to be
the new asm-generic/pci.h.

This patch does that by first removing the old pci.h with the definition of
pci_get_legacy_ide_irq completely. We replace it with references to
ATA_PRIMARY_IRQ and ATA_SECONDARY_IRQ macros.

Next, we do further cleanups moving isa_dma_bridge_buggy to be only
x86_32 specific.  This avoids having to have it in dma.h or pci.h headers.

Next, we create the new pci.h definition.

Note, for the series, I am working on these fixups as part of adding PCI to
OpenRISC.  If the series is accepted I would like to merge via the OpenRISC tree
with the OpenRISC PCI support patches to avoid having to coordinate upstream
merges.

Since v4:
 - Move some pci_get_legacy_ide_irq and isa_dma_bridge_buggy cleanups
   into the correct patches.
 - Add csky ARCH_GENERIC_PCI_MMAP_RESOURCE definition patch, suggested by Arnd
Since v3:
 - We now completely remove pci_get_legacy_ide_irq and use libata.h macros.
 - Added a new patch to remove isa_dma_bridge_buggy in architectures
   other than x86_32.
Since v2:
 - Remove pci_get_legacy_ide_irq from m68k.
Since v1:
 - Remove definition of pci_get_legacy_ide_irq on architectures
   not using CONFIG_PNP, which eliminated most.
 - Add ifdef around PCIBIOS_MIN_MEM for consistency.

Stafford Horne (4):
  PCI: Remove pci_get_legacy_ide_irq and asm-generic/pci.h
  PCI: Move isa_dma_bridge_buggy out of dma.h
  csky: PCI: Define ARCH_GENERIC_PCI_MMAP_RESOURCE
  asm-generic: Add new pci.h and use it

 arch/alpha/include/asm/dma.h           |  9 ------
 arch/alpha/include/asm/pci.h           |  6 ----
 arch/arc/include/asm/dma.h             |  5 ---
 arch/arm/include/asm/dma.h             |  6 ----
 arch/arm/include/asm/pci.h             |  5 ---
 arch/arm64/include/asm/pci.h           | 18 ++---------
 arch/csky/include/asm/pci.h            | 23 ++------------
 arch/ia64/include/asm/dma.h            |  2 --
 arch/ia64/include/asm/pci.h            |  6 ----
 arch/m68k/include/asm/dma.h            |  6 ----
 arch/m68k/include/asm/pci.h            |  2 --
 arch/microblaze/include/asm/dma.h      |  6 ----
 arch/mips/include/asm/dma.h            |  8 -----
 arch/mips/include/asm/pci.h            |  6 ----
 arch/parisc/include/asm/dma.h          |  6 ----
 arch/parisc/include/asm/pci.h          |  5 ---
 arch/powerpc/include/asm/dma.h         |  6 ----
 arch/powerpc/include/asm/pci.h         |  1 -
 arch/riscv/include/asm/pci.h           | 31 +++----------------
 arch/s390/include/asm/dma.h            |  6 ----
 arch/s390/include/asm/pci.h            |  1 -
 arch/sh/include/asm/dma.h              |  6 ----
 arch/sh/include/asm/pci.h              |  6 ----
 arch/sparc/include/asm/dma.h           |  8 -----
 arch/sparc/include/asm/pci.h           |  9 ------
 arch/um/include/asm/pci.h              | 24 ++------------
 arch/x86/include/asm/dma.h             |  8 -----
 arch/x86/include/asm/pci.h             |  3 --
 arch/xtensa/include/asm/dma.h          |  7 -----
 arch/xtensa/include/asm/pci.h          |  3 --
 drivers/comedi/drivers/comedi_isadma.c |  2 +-
 drivers/pci/pci.c                      |  2 ++
 drivers/pci/quirks.c                   |  4 ++-
 drivers/pnp/resource.c                 |  5 +--
 include/asm-generic/pci.h              | 43 +++++++++++++++++---------
 include/linux/isa-dma.h                | 14 +++++++++
 sound/core/isadma.c                    |  2 +-
 37 files changed, 63 insertions(+), 247 deletions(-)
 create mode 100644 include/linux/isa-dma.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
