Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EDEC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 12:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7czR9NffLuED52CmMUq/x4sU/QyL67FavO3tV85fofQ=; b=Pck2DmdJ/dLw70
	LkblRgQXYVcG4nuNAruziowHaDFiMMS1J1ll6evQPcMy3T2JEQkTtuc20ZKj4b4FC9SC2wr1ufdH4
	JmPctrXrny1BOEC2d3FLuSDMVD9x2f9TwxcDnrkntQVF/EFVNFXOhc/f2aBfarqJR+rkgedycVC6U
	e0F9BpRDGF9AwtPbt/ja/TLd0SyGVQNDR5uw5LFYP32bMQrDz8kjsqnwIg4k27ZDM32EyCJxBwpv4
	SLrBy/p03kL2EMvy9vZX5pSnpQqeyWtqb3l8td0ZlIldRLddxWMmA/yChPea1iBSrYeNZn3tLyeRA
	Kdr9g8RQd6GZlFyC7rVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vrp-001egF-0b;
	Tue, 06 Jun 2023 12:32:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Vrm-001edd-1C
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 12:32:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6d7abe9a4so52741025e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686054766; x=1688646766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9VkYPmR4uwo3dQGo/xrqreqAL15LP1pmyYPpri/bVQI=;
        b=A/uKqwtEcKgcSPKr31oKfGQWzCDK+I5uwySB1amNGpoL/G+Ux4zhDv4E04xf3WVRFq
         S3iIfxO9PFeO56O3e5MIYfHsA2DkNv/h2mpJ8q7CverBninN0QglliYDjavjhaLO5oRg
         ZNIGSfjRLaJTQgVlSntipLaPFHWACUdYlBqRztLu4IemmeohNlFkUwVUXgVC1nb2AA4k
         iF9QKa6vzSO1S+ywsL4MbD83dwt1gV9WdnaILv3UHceuQbzhnrBhfIxqS2+pL5bEcoxZ
         EkoymbRON3DS498HuawQ6nGqW5lNlVpo7gKBu1bvy3YyTFGkRjDcMmmPf/gQ6P0B13tu
         Gy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054766; x=1688646766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VkYPmR4uwo3dQGo/xrqreqAL15LP1pmyYPpri/bVQI=;
        b=bC9YN8YYS7D7GxjZr3xBTu6o5wzH576m0Pg7ODF8HEnhcNzANaxgnXT/oeYvU4a2QP
         WNulAgrxTzJjKXqp0Shvs9N8RmXPkarKz+m1VhqEjPVidDF19jbuzr5cTE8/79jUOV7G
         OJzKY6rDanhh9WLRjev32wGALz8rGBcb3INyJ6rstLYjp43DQVDtWd9bL19idEMnTAi9
         ulGS4+Kb7uGDiB6iAyLDBN3tsKnKN3P2FPSuNGi2rWxTe0oPPpMV3TlU1gLCS9jB4qxy
         08IbqW+rLP848ikazECCVQOrO3p6bUepwakGtwR2jJrpXsaoP+csuO75Y6zTuJQoYX0K
         glgQ==
X-Gm-Message-State: AC+VfDzyPCPIdJ7aCpMSdKmrbb/9wcrBwXzPOyBpaDzqMYGTa8p0c8X+
	orGsgW8LJOvRmpdYLHJp9gm66g==
X-Google-Smtp-Source: ACHHUZ7QqLlFe/7LiprVf2Cv/Aho0tMb/8DFVwnFC5vQGWT2ZIdvz9X7gsH2OjgJ5MSVW8x5dpZadA==
X-Received: by 2002:a1c:4c15:0:b0:3f6:688:f658 with SMTP id z21-20020a1c4c15000000b003f60688f658mr1733922wmf.20.1686054766516;
        Tue, 06 Jun 2023 05:32:46 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003f7e6d7f71esm4761868wmc.36.2023.06.06.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 05:32:46 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 0/5] riscv: Introduce KASLR
Date: Tue,  6 Jun 2023 14:32:37 +0200
Message-Id: <20230606123242.20804-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_053250_409297_550436D9 
X-CRM114-Status: GOOD (  15.13  )
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

The following KASLR implementation allows to randomize the kernel mapping:

- virtually: we expect the bootloader to provide a seed in the device-tree
- physically: only implemented in the EFI stub, it relies on the firmware to
  provide a seed using EFI_RNG_PROTOCOL. arm64 has a similar implementation
  hence the patch 3 factorizes KASLR related functions for riscv to take
  advantage.

The new virtual kernel location is limited by the early page table that only
has one PUD and with the PMD alignment constraint, the kernel can only take
< 512 positions.

base-commit-tag: v6.4-rc2

Changes in v3:
  * Rebase on top of 6.4-rc2
  * Make RANDOMIZE_BASE depend on 64bit
  * Fix efi_icache_sync and efi_get_kimg_min_align which were undefined
    in x86 (and certainly other archs)
  * Add patch 4 to fix warning on rv32

Changes in v2:
  * Rebase on top of 6.3-rc1
  * Add a riscv cache sync after memcpying the kernel
  * Add kaslr_offset implementation for KCOV
  * Add forward declaration to quiet LLVM

Alexandre Ghiti (5):
  riscv: Introduce virtual kernel mapping KASLR
  riscv: Dump out kernel offset information on panic
  arm64: libstub: Move KASLR handling functions to efi-stub-helper.c
  libstub: Fix compilation warning for rv32
  riscv: libstub: Implement KASLR by using generic functions

 arch/arm64/include/asm/efi.h                  |   4 +
 arch/riscv/Kconfig                            |  19 +++
 arch/riscv/include/asm/efi.h                  |   4 +
 arch/riscv/include/asm/page.h                 |   3 +
 arch/riscv/kernel/image-vars.h                |   1 +
 arch/riscv/kernel/pi/Makefile                 |   2 +-
 arch/riscv/kernel/pi/cmdline_early.c          |  13 ++
 arch/riscv/kernel/pi/fdt_early.c              |  30 ++++
 arch/riscv/kernel/setup.c                     |  25 +++
 arch/riscv/mm/init.c                          |  36 ++++-
 drivers/firmware/efi/libstub/arm64-stub.c     | 112 +------------
 drivers/firmware/efi/libstub/arm64.c          |   5 +
 .../firmware/efi/libstub/efi-stub-helper.c    | 151 ++++++++++++++++++
 drivers/firmware/efi/libstub/efistub.h        |  18 +++
 drivers/firmware/efi/libstub/riscv-stub.c     |  28 ++--
 drivers/firmware/efi/libstub/riscv.c          |   5 +
 16 files changed, 332 insertions(+), 124 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/fdt_early.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
