Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73258EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mjevPTp2Ha+5IWMTaqtHUmtFyJRSxwNUdTQm6CKJBV4=; b=goFL20YjYMlkZI
	g80BC4qeUzPe4m7p8KqqnGIKjBka0mBEpf7ZefTEy1iduuzHEDTOYKzQ6xs5JibyjKwQe165p067b
	NTLgzJc93KwPC+Mm2OTTlhjbMqwYx3VkkgjEdAJ0kMvn9dtIuX80USQ+EtpLeyHfg0BE/WEvLPDzd
	kQCIvKeAPQ8utIP8sRVKSAPVvI1/w0I/Wv0L92zaDZLA29wY6VxEEKRDLGrOk3hdJjzhkLSzisdpE
	otJrx1V9uFHHXKid58c8hSE4wbR9Y5XJfJBLkz4x66A0e/YPOdabbejK99Nw2ULrsYEhCz6nIONhj
	/6KXFx1eausLqTSLdt4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMksl-00DEat-33;
	Fri, 21 Jul 2023 07:48:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMksi-00DEZ5-2X
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:48:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-314417861b9so1223526f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689925732; x=1690530532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJbdqgE6rPWGrAZXEIoITNtpmirnzN+6ReuxV7VdPDA=;
        b=ywqx+S8KXdN+x47WQ8bW/Vt7y1IB4iO5NYQjHEyDmpo1l+kaRgvYx62RP/ED+PUrvO
         C2kB4hWtz8WBrNtGPpydotxs2lswkc4rsr1xjSCBJgHSql+j2Jagt/mM9JNUA4iB1dfl
         0Ad8bjNTWVyk6hECaIycphKHCKbmxWegRQw0KrSQ8lfgcLAyYyOb9EHOG+x3TERl3yG+
         6NN8FfsSCvu87pzHhFDsSEuzHEzwbuRlbi9Seyoz9cgJCMSbEOpOsoY16oBFCkGlh3JB
         3Y+muD0TAVZnnIF57+SeO9A3hJb4xf2p7azfDADOxuDh4OS7Gr8a6JByym8URxj7i7Jd
         koxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689925732; x=1690530532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJbdqgE6rPWGrAZXEIoITNtpmirnzN+6ReuxV7VdPDA=;
        b=HTneKDIZJuk5cTdQadE6piCKmT9RABxYhQKZO5yCYHqacdsaRkL17L9i8DUA1DF2cf
         0fNbCoivxaZGcLKA8Pa35P4JRfldyKWgN1uL7R550rZ+OLBlsc6wsbfltmmQFEWFnhEa
         raRcB8jA8DTwJKRRuwPpojyBP+ZXmzI5UCP7ZoZYOBGvtZk6K9fnYcigBjmODHy0xWng
         NydUdQW8k2L4+AeK3lwg73Y0zPCLNChqXRskedyx01Qv4WdIhWpAD6h3GVQ1bVyoNHE4
         YZc3QnYAMOlkAEeIdqRHX/ECONieZsJDF8h+eZNcUbKHcJVt3L2D9/2K7mxQer0oNaPe
         2YVg==
X-Gm-Message-State: ABy/qLZZxBWlJAB+QR1IixPYGl6Xwo4vo1vCNkqA/o47Mmf1K8LR9s82
	p/98jfN2BlSL6xirfko8u0XXc3vnWICV0gDoOhc=
X-Google-Smtp-Source: APBJJlE3FlxkcRT8Ksq53OMvhBnx7QbuDFYS9BKGqdSdR+S1yqatJDbL5rDW6LmpyFmfglyjTESmlg==
X-Received: by 2002:adf:dccf:0:b0:313:fce9:c568 with SMTP id x15-20020adfdccf000000b00313fce9c568mr841802wrm.31.1689925732461;
        Fri, 21 Jul 2023 00:48:52 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a17-20020adffad1000000b003143cdc5949sm3457710wrs.9.2023.07.21.00.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:48:52 -0700 (PDT)
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
Subject: [PATCH v5 0/5] riscv: Introduce KASLR
Date: Fri, 21 Jul 2023 09:48:45 +0200
Message-Id: <20230721074850.310644-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_004856_834906_854E6A3F 
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
 drivers/firmware/efi/libstub/Makefile     |   3 +-
 drivers/firmware/efi/libstub/arm64-stub.c | 117 ++--------------
 drivers/firmware/efi/libstub/efistub.h    |   8 ++
 drivers/firmware/efi/libstub/kaslr.c      | 159 ++++++++++++++++++++++
 drivers/firmware/efi/libstub/riscv-stub.c |  33 ++---
 15 files changed, 328 insertions(+), 125 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/fdt_early.c
 create mode 100644 drivers/firmware/efi/libstub/kaslr.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
