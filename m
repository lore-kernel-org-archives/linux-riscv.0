Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA7BCCA48C
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QK47POVhvR3fQEdnKSr1qpACegb4z4KHFxzOeLIbRAA=; b=L7h3vbR/36f+pX
	s5wEQc3Bprq1RaneDc1/Tt8uiplgp18TF/4rxVAhCT3iE5bIh85hOwnQxBSIFcQ1YCW2DqDBj86fz
	mhqciPx55Ap8c+hPcGKKlrwG6kKRU/OLR7B6IxImGg1WP8vt5oNvlt10Nqr4hM4oorxvNOn9m5XlY
	4/KvHRX8ZsjZo1I9zkIRxzHoP85cERD9Bt9GCiBA3COqDfvdjHngEEkRL+RTFtc9StNo4T8WLgEBm
	3Kpu8rIKlRDHDu3S7UbcVdZ59Glv842DCVrwKwu0BGlW/MhqjKJ4Oz3IDVX8GWtDLEXzxffIEiuT3
	Mx9NigHwwJvvWKg7SNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0XA-00BeSH-9b; Fri, 22 Jul 2022 21:50:08 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0Wy-00BeIY-H3
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 21:49:59 +0000
Received: by mail-pj1-x102b.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so5279782pjf.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 14:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CKBAlUu6F1f72gxbqJqNkzmdfmg0eW3VcwrodrFMJSE=;
        b=mLATIobE3QXc7FfUUCgVQLEfCmFrpMZ6GG9uG8a648HLGlUq/fRMW7D9IeWzvGVJak
         yVwqGlUgGhwGkQuGIeZq62C5/vwA6JL3AX9oU0vn++3z4gJHP48Ig+3zIrTo2t5h0Ly0
         PWzcgka4r+5QdEtQ1QUV0n/3UhrkHnHGUyhrj36GuUCI8qmalde+zda1FGWQeru79Nhn
         eB3xFp/s2VffE2PnnHKo5JipBNAXgK+VtSnIUN91e5Tp5M6jQlbx++RmeZRTtvTTNpoU
         fX8p9z8Rg5PN9epjGWBTUl9dntEPAFkIAQuR+Z4wag60+ixl6nNPg+hn179P7CZqSEuW
         fpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CKBAlUu6F1f72gxbqJqNkzmdfmg0eW3VcwrodrFMJSE=;
        b=hLwzajslFeaIpUNMgzUi+rytJWZje1ijLHbDpvBWgfk9gZOfncc+hCjZAn9bzLSZ5t
         /fsmUPXbtc1NIxteKYURbK5SKfz0j2LPmssDiyZa3cAjIPz+FK0tfKutNVc3lrvhJv3+
         a61ZPGUwUbsCFXEuti74EtDIdpATetZ47gtBIRTf2kQGhH9vKjHKHlB3t7B+1l2z8e7B
         arl3CMvk6qU8Ns25NL7zcm4KSnHyXzBZRrnwKJVCj9u3eM4pyhdMSYRkAF30YM5OzwHS
         DiW1caiedyX0Q4ypWSOTAe0NtLUf/mQJZROLBuffOUyHXc3c8BVGWgPYOTNvmcvHq9+l
         CycA==
X-Gm-Message-State: AJIora8aHeiywmLv7t2cjhzjiwD0X26H0Z40oVYb6khg1mPcGkRqvVtZ
	7dy0mahI3YsF27b+49iMXis=
X-Google-Smtp-Source: AGRyM1s8ULJDRpoScEKM1GXhJVRCOVz9MUfNeZH/hFTgO9hmdkx0aULIZ3TJARZkHfVxC90HfRxKKw==
X-Received: by 2002:a17:902:b701:b0:16d:12a7:c2fa with SMTP id d1-20020a170902b70100b0016d12a7c2famr1807096pls.67.1658526593300;
        Fri, 22 Jul 2022 14:49:53 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id r143-20020a632b95000000b0040c9df2b060sm3821257pgr.30.2022.07.22.14.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 14:49:52 -0700 (PDT)
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
Subject: [PATCH v6 0/4] Cleanups for asm-generic/pci.h
Date: Sat, 23 Jul 2022 06:49:40 +0900
Message-Id: <20220722214944.831438-1-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_144956_639900_F7EB5208 
X-CRM114-Status: GOOD (  14.13  )
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

Since v5:
 - Remove include of linux/types.h in asm-generic/pci
 - Add Acked-by from Guo Ren on csky patch
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
 arch/arc/include/asm/dma.h             |  5 ----
 arch/arm/include/asm/dma.h             |  6 ----
 arch/arm/include/asm/pci.h             |  5 ----
 arch/arm64/include/asm/pci.h           | 18 ++----------
 arch/csky/include/asm/pci.h            | 23 ++-------------
 arch/ia64/include/asm/dma.h            |  2 --
 arch/ia64/include/asm/pci.h            |  6 ----
 arch/m68k/include/asm/dma.h            |  6 ----
 arch/m68k/include/asm/pci.h            |  2 --
 arch/microblaze/include/asm/dma.h      |  6 ----
 arch/mips/include/asm/dma.h            |  8 ------
 arch/mips/include/asm/pci.h            |  6 ----
 arch/parisc/include/asm/dma.h          |  6 ----
 arch/parisc/include/asm/pci.h          |  5 ----
 arch/powerpc/include/asm/dma.h         |  6 ----
 arch/powerpc/include/asm/pci.h         |  1 -
 arch/riscv/include/asm/pci.h           | 31 +++-----------------
 arch/s390/include/asm/dma.h            |  6 ----
 arch/s390/include/asm/pci.h            |  1 -
 arch/sh/include/asm/dma.h              |  6 ----
 arch/sh/include/asm/pci.h              |  6 ----
 arch/sparc/include/asm/dma.h           |  8 ------
 arch/sparc/include/asm/pci.h           |  9 ------
 arch/um/include/asm/pci.h              | 24 ++--------------
 arch/x86/include/asm/dma.h             |  8 ------
 arch/x86/include/asm/pci.h             |  3 --
 arch/xtensa/include/asm/dma.h          |  7 -----
 arch/xtensa/include/asm/pci.h          |  3 --
 drivers/comedi/drivers/comedi_isadma.c |  2 +-
 drivers/pci/pci.c                      |  2 ++
 drivers/pci/quirks.c                   |  4 ++-
 drivers/pnp/resource.c                 |  5 ++--
 include/asm-generic/pci.h              | 39 +++++++++++++++++---------
 include/linux/isa-dma.h                | 14 +++++++++
 sound/core/isadma.c                    |  2 +-
 37 files changed, 60 insertions(+), 246 deletions(-)
 create mode 100644 include/linux/isa-dma.h

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
