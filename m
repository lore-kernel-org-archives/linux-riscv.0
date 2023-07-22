Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E0FEB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ybnxxUb4lVOHq9Vj8UoCofOGgXcai82jkJwyovUZ4C8=; b=kLFCV43KquAr4r
	LwLJ24YdV/jA5aq5NNTDnOmxmWwBUJyTQQ6P9Eio1fkS39HbVDA/48608db1wUCR9MUyYKV64usC7
	4FF86+zAM0O7oJj2m8+cw/VAZifGVxZIUAfog63SMkXgeaKBHpMLPvM/DQ7ocvni11ShvJCHCQhNx
	eRyMeV/JsgnyJB1+lpYDJ7vyQ1M1MiaAYkjzqalXfsZIiQsAQ/DTYPmapmNS4tErkmvNBG96/2o0A
	O5nBwzz+2AbfBPR0Alow+LKH+bLrwta+8ZCN80FnGzvG3ZAx6sZK+Cnl3+kZwxUaxuoX5xaPSV+O3
	6LYNvHpc5W2EoRVzIVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBt0-00Ghbn-1S;
	Sat, 22 Jul 2023 12:39:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNBsw-00Ghaw-3C
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 12:39:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-307d20548adso2086888f8f.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690029537; x=1690634337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIcbmkTWrDX+Xt/TeGVAtAWUbcdO9qSHs2vQ/hQkz24=;
        b=oNMMTqvReu3FlM4cY7VjMXRIDFVljKhFHKgnZsZXMmUbnZmy0NmZpngBD8NxM0U1KI
         /VT2jSQ2Nuggw8us79pz9ML+gplT+vhgZTDGtrVWMgK+OWNbRQRLhPCJlkARcwua8oDk
         s5qds2Q3gubIUSGrbjXph/jC1wCr2529VHrO4b29IH5Qlub4NOg1LF0IDfx/dB6/TWug
         j5i62gXKv0q3zvrnf00wU3VpUME0wK4z/d/GGuKEJcm9o1Zitjv8nrhGwwT4Lm6uAyp3
         PPQvEsNBGbORCuH8Pj5GlkIfb8CR/ozwHaKXgen9DkQnsL++0NlC/wQ3BkkmcdyPumpN
         1OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690029537; x=1690634337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIcbmkTWrDX+Xt/TeGVAtAWUbcdO9qSHs2vQ/hQkz24=;
        b=bBqMMJiRtvm7jaoLf+NOSzNYBewJsxqarUw5PePcjNnrZaV3ecb3kK7g92VnU40tgo
         /JLot11pkbcQr74RpyhuVXc0qF9SzIq89btLqnkr3Z4nrrwVYfKzbS4dM4oMC3Fs+aJd
         qinT27adT8PqhFXmZNmFuRSMnMguwMkSuYkMUr/IoQnYGQstXnR5eMGqQyqWcez9qMSu
         jmP7DPgiKUJchehwLb5qipVJEX0w9sbsJ720lcccOTr9Jz+8XvjI61Thzb5N8XgqAszp
         feHtXrJpmmiYwVMakcjEE4LuGkzdoNZL7gXUqy4F3gCPPRyQp/q/ovaZFLqlEXSgvBuf
         bAeg==
X-Gm-Message-State: ABy/qLaIqhkLGLsSsw0UvyQ1nuLhKD7frwU7h5zMs3DPyyYd5VG5dNG9
	tPpE+3LPhpP5sx+qLocKwD0zNw==
X-Google-Smtp-Source: APBJJlE3kySORHNjliNzyk1d7E4WKUQ/vw6BhiZyXSU1YW0ZRPEhMV+8g/ko07f1CDM0Jua0EmTMHQ==
X-Received: by 2002:adf:e307:0:b0:309:1532:8287 with SMTP id b7-20020adfe307000000b0030915328287mr2745943wrj.19.1690029537140;
        Sat, 22 Jul 2023 05:38:57 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b8-20020a5d5508000000b0030fb4b55c13sm6819378wrv.96.2023.07.22.05.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 05:38:56 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v6 0/5] riscv: Introduce KASLR
Date: Sat, 22 Jul 2023 14:38:45 +0200
Message-Id: <20230722123850.634544-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_053859_271223_B3230A9F 
X-CRM114-Status: GOOD (  15.29  )
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

Changes in v6:
  * Fix reintroduced build failures by compiling kaslr.c only for arm64
    and riscv, as suggested by Ard

Changes in v5:
  * Renamed efi-stub-kaslr.c into kaslr.c and fix commit log of patch 3,
    as suggested by Ard
  * Removed stubs since the kaslr functions were moved to their own file
    (and then does not trigger any build failure for architectures that do
    not call those functions since they are in their own compilation unit)

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
  arm64: libstub: Move KASLR handling functions to kaslr.c
  libstub: Fix compilation warning for rv32
  riscv: libstub: Implement KASLR by using generic functions

 arch/arm64/include/asm/efi.h              |   2 +
 arch/riscv/Kconfig                        |  19 +++
 arch/riscv/include/asm/efi.h              |   2 +
 arch/riscv/include/asm/page.h             |   3 +
 arch/riscv/kernel/image-vars.h            |   1 +
 arch/riscv/kernel/pi/Makefile             |   2 +-
 arch/riscv/kernel/pi/cmdline_early.c      |  13 ++
 arch/riscv/kernel/pi/fdt_early.c          |  30 ++++
 arch/riscv/kernel/setup.c                 |  25 ++++
 arch/riscv/mm/init.c                      |  36 ++++-
 drivers/firmware/efi/libstub/Makefile     |   4 +-
 drivers/firmware/efi/libstub/arm64-stub.c | 117 ++--------------
 drivers/firmware/efi/libstub/efistub.h    |   8 ++
 drivers/firmware/efi/libstub/kaslr.c      | 159 ++++++++++++++++++++++
 drivers/firmware/efi/libstub/riscv-stub.c |  33 ++---
 15 files changed, 328 insertions(+), 126 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/fdt_early.c
 create mode 100644 drivers/firmware/efi/libstub/kaslr.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
