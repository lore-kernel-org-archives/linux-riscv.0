Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A337C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 05:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1zRuvrPUETqFTys6n8aWjvqBnpaNGmqsvWlRw3GrESQ=; b=sOycy2ASv8JDLn
	XJ21pEHHtM8E3eHaEY5MO2/aV73Rh8ekKLAMD2ekgb9V8HJjlJBPPMKbs3XbaTZzEfBqeBXY0cYsR
	n7lDfk/XuQSDV9sBXv2R5LfxYBlKNwBWcwk06B0rt5pdSRGEIgabhHqMHFGX+KmcIUdrgFWetluyX
	ASx0nWaZM3+y8YIu5KZxHFI8DRS9aGgmpv4z0txMTTLg4raBvfoDlL/BMGrFgeQSpBGWNhZA+NEQg
	eckSiaJ+uz68TkX5biqNNJhqNT71Qz3GdaDBjszH32xLU9xK/JoUID7ZoOC5Zs57xQGKENwnjV2Y+
	HhnJtLn5R1MSz6BUXuzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phONO-00GfvR-0Z;
	Wed, 29 Mar 2023 05:29:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phONK-00Gftl-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 05:29:36 +0000
Received: by mail-wr1-x434.google.com with SMTP id r11so14358381wrr.12
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 22:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680067771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0nKREiU5apoP9AERkcSfoCMtcJ2QiDWhd7LmZsVvuQ=;
        b=b4oOAK2vzMWROSK9CPdsTAH7ZN/tAeYeBXukc0zQcNww3+rA3dyiqsmIVHemW0qdqU
         htlzmbuOyfGr47cqTYtjKgU/lrLCuCmryoyrryfOw1NndFn3ah41a23JgdrOz7/ZpbMn
         wZB6MIqbnTRX7TiHeFSUmFCBCGOF27cCnEGFMAMFNMxScIQmtYYLo33QKxJZywdRy6al
         /OdvqKoumD++Rv0OXKYfeYmVd6TdAd6C0nsRizMZl220EoVWin0FC93RTb8xzkWwJaSX
         bb3qtbnxZqJFG0W4wU/7bQl77eFG93/mOHevexnD+37DgCHFoD/enVEPwI58BfrRrGAI
         4ZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680067771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0nKREiU5apoP9AERkcSfoCMtcJ2QiDWhd7LmZsVvuQ=;
        b=tbKP6+KcabY/FaEwL8bMUa6foQsJkXL/dfuZY0zNc97TEQGk3S4+URAvJRxP23brpq
         +Dj/e8GXQSTjhgXn+trs7ngz+bRjrzt/AzcYiesiNSxkO8OULQlNtap/bvcdWKk7C1Hk
         N2BLrV7SD5VtrS6ZBlgEcXRK0xSPtoSU2VmRQXn1SmRXbDhYmhX+UYkpziXxI9zj3PRJ
         lhVq/P9pHua8wFyKkEckjx3694SykwxmLC/zMXS0eo+QHfMQjoo6iN6LU8c0mT7m3Ude
         9qPIEICK5YQ0pTJHNdAdM1mZst+CGHrjVJpg/ej4I5ZcmwN2gQq1XhRr+AOMHUonFiL8
         UmMQ==
X-Gm-Message-State: AAQBX9e6NO2Qknp/MJrD1SiK1UELuXX39goDOVMWat5+ULrWU1xbcX4U
	Fufx4n4tvxtotA5YekP9w/yZbw==
X-Google-Smtp-Source: AKy350bEq5NqVvP0FW42rtbPv8tMVOKg3WWaFwubyVFWEP6t3QqmPu/EBQ1qtrwUuEQVOE9V/NpKlg==
X-Received: by 2002:adf:fc8e:0:b0:2d9:16f9:aee3 with SMTP id g14-20020adffc8e000000b002d916f9aee3mr15858960wrr.14.1680067771579;
        Tue, 28 Mar 2023 22:29:31 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e9-20020adffc49000000b002be5bdbe40csm29201205wrs.27.2023.03.28.22.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 22:29:31 -0700 (PDT)
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
Subject: [PATCH v2 0/4] riscv: Introduce KASLR
Date: Wed, 29 Mar 2023 07:29:22 +0200
Message-Id: <20230329052926.69632-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_222934_854739_3420B4AD 
X-CRM114-Status: GOOD (  16.08  )
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

Note that the patch "riscv: Use PUD/P4D/PGD pages for the linear
mapping" is necessary to retrieve the memory below the physical kernel
address, so that the EFI stub does not have to try to relocate the kernel
as close as possible to the start of dram.

This patchset is rebased on top of:

riscv: Allow to downgrade paging mode from the command line
(https://patchwork.kernel.org/project/linux-riscv/list/?series=734849)
base-commit-tag: v6.3-rc1

Changes in v2:
  * Rebase on top of 6.3-rc1
  * Add a riscv cache sync after memcpying the kernel
  * Add kaslr_offset implementation for KCOV
  * Add forward declaration to quiet LLVM

Alexandre Ghiti (4):
  riscv: Introduce virtual kernel mapping KASLR
  riscv: Dump out kernel offset information on panic
  arm64: libstub: Move KASLR handling functions to efi-stub-helper.c
  riscv: libstub: Implement KASLR by using generic functions

 arch/riscv/Kconfig                            |  18 +++
 arch/riscv/include/asm/page.h                 |   3 +
 arch/riscv/kernel/image-vars.h                |   1 +
 arch/riscv/kernel/pi/Makefile                 |   2 +-
 arch/riscv/kernel/pi/cmdline_early.c          |  13 ++
 arch/riscv/kernel/pi/fdt_early.c              |  30 ++++
 arch/riscv/kernel/setup.c                     |  25 +++
 arch/riscv/mm/init.c                          |  36 ++++-
 drivers/firmware/efi/libstub/arm64-stub.c     | 111 +------------
 drivers/firmware/efi/libstub/arm64.c          |   5 +
 .../firmware/efi/libstub/efi-stub-helper.c    | 151 ++++++++++++++++++
 drivers/firmware/efi/libstub/efistub.h        |  10 ++
 drivers/firmware/efi/libstub/riscv-stub.c     |  28 ++--
 drivers/firmware/efi/libstub/riscv.c          |   5 +
 14 files changed, 315 insertions(+), 123 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/fdt_early.c

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
