Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B800C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4jO3BAgyKM82tsXRXdR2yhwzzvS9Osvasb08RmX9o8Y=; b=GCuhnMBUmnhVlg
	I9MBdM5LMnmGCLqGwAq0jJ8gournE4tDq6pOZiX/UeZVZuBOSLk4oOZpB7672sAjDZWtQ7hqgzi7w
	Z8l2B6RSNKLI24Kw+2fzW+pXlpnVxDNNHyLOjLeYKgX8BWKfBBbmAY2/u1eQXo+tjiAqchdShTaJp
	meLCNWzZdS3NLEi4SYLSBX32ZGi2RXnORIRHq1NmM3Avg2a68hosKXE30slm+cvyiIcTYAHf6uPiu
	ByCUa8nfC9gR/ujXKCYB7wzkAtdRvCzGME5OmtZwlM9bKHkNLgyF/+DhuBnZ0YadWvPy6NFbhhgKt
	ygYtptsF/h6NgiR7K6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxvZ-003gI4-2T;
	Thu, 13 Jul 2023 15:08:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxvW-003gDW-0h
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 15:08:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbfcc6daa9so7505625e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 08:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689260883; x=1691852883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lni4UWIKw2Lp7DjCo96CHQnoSYyoodWrf2lKDIVVpbc=;
        b=sj9ClK4NUhpnKCFC64kQfjD96nMZznWfZOzxrC+tZLrM1q7eZdMEVU36AmLtzZWyqZ
         H6+I7eSk0aJUB1k7vSzG482QGgPU/0XqZFaIN+pg8qIPfc0O1ATxLn59uro47OIXQRHu
         smE7ZGMkgM7EbkVohrtbrq4EZ+Ifju7QRZHwhopYWfN+cWn043aolj9vwoY34rfHLYEF
         lEwlBxTl3XMuywyv08PZ++OJmunWTMSCfslBQkUgEUQ/6xLypwGlUgtlrmVPpgBPxkhy
         6gjUbcYX8FMl91FdywZ3e9ETsXxF4QmsXNK/VACDBO4j167+y0TEY6UnmS5zY7ljU8go
         lDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689260883; x=1691852883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lni4UWIKw2Lp7DjCo96CHQnoSYyoodWrf2lKDIVVpbc=;
        b=DpJmQyPPt8Q3pY1zBcywbtLmR+elzOsqe1rh//4ERMJQkRsyEmDGtAuaOhcy4BH/Sa
         vKkz6wRddEu2uVGHEyYoNfP626xe/jD82vUbleu38SWkLhP2wnkcsc+atcnkGDj+VPLh
         m/53n8fg6yicavNiwrJOC5vvsZH/Vhq5m/X1fmzn4nQUkyHpjdq8URb2b6C5nynx7KYf
         ukKVPYp9ajF7XqNa6+AgvSERRqMkhJyv5EvneZTDn8NyAtjNofUDOiELhcEgBvl2ePin
         FA8Vpd347GD+quS1iu8f6ZMxFs7sO1AtBYMvRyo/kZRBx/fWS9LNJDF72GpIDcXLwFNM
         qclw==
X-Gm-Message-State: ABy/qLaqFpnpNJQR4vjHlHOA2vuGbdj9BSvwAoa7Wj0eaH0aZdPVqvIb
	xypYC0LRCLJ2f+7cnaSN1tctbA==
X-Google-Smtp-Source: APBJJlFBxezJWxszuwCwiBNF3orxllOlCtInhGKmw3C6zySX0L1qcmDavDq6eTidrxiBhLiTKAAyiw==
X-Received: by 2002:a05:600c:11cf:b0:3fb:e4ce:cc65 with SMTP id b15-20020a05600c11cf00b003fbe4cecc65mr1638951wmi.25.1689260882792;
        Thu, 13 Jul 2023 08:08:02 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c26-20020a05600c0ada00b003fbcdba1a52sm18645597wmr.3.2023.07.13.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:08:02 -0700 (PDT)
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
Subject: [PATCH RESEND v4 0/5] riscv: Introduce KASLR
Date: Thu, 13 Jul 2023 17:07:55 +0200
Message-Id: <20230713150800.120821-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_080818_275073_CA0E4D55 
X-CRM114-Status: GOOD (  14.36  )
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

base-commit-tag: v6.5-rc1

Changes in v4:
  * Fix efi_get_kimg macro that returned nothing
  * Moved new kaslr functions into their own files to avoid zboot link
    failures, as suggested by Ard

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
 arch/riscv/mm/init.c                          |  36 +++-
 drivers/firmware/efi/libstub/Makefile         |   3 +-
 drivers/firmware/efi/libstub/arm64-stub.c     | 117 ++-----------
 drivers/firmware/efi/libstub/efi-stub-kaslr.c | 159 ++++++++++++++++++
 drivers/firmware/efi/libstub/efistub.h        |  18 ++
 drivers/firmware/efi/libstub/riscv-stub.c     |  33 ++--
 15 files changed, 342 insertions(+), 125 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/fdt_early.c
 create mode 100644 drivers/firmware/efi/libstub/efi-stub-kaslr.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
