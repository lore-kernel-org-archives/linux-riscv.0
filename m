Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBC7EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4jO3BAgyKM82tsXRXdR2yhwzzvS9Osvasb08RmX9o8Y=; b=IF0KN/b3cAiqqa
	8NRFIs/g4jYrlX96hTa9U+24v7dlqYQpZL0OJuK5W4lJC4s0R4NoM7WGa6VrM7keWoFbAs6cFg0zG
	lxlHCBJcyq2om2DQp+xRMe3r39zWi/WdrWlrDPEWPCXc9LhEMfdcLvT4B+qP8idJSEZCUkzPQJdv5
	BblXXchiejn/wzt7SymOOHdtFAF3D6oGRGxkOwzB9fwsnATE/QiYwpP8kFE37zq7Ej9OXpyT03D6G
	SUkiYJKPJfw4Zswz/38JTTKMQ7O49hcwKhwIRfnEuR9XVvOFk4v/o+goISsel3nTfcJuGhTVsBjOI
	zOKyNzFLsrXDAE+OxppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwSh-003Qgd-0u;
	Thu, 13 Jul 2023 13:34:27 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJwSe-003QdA-17
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 13:34:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-993a37b79e2so119079266b.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689255244; x=1691847244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lni4UWIKw2Lp7DjCo96CHQnoSYyoodWrf2lKDIVVpbc=;
        b=BcfyuInp5jBxZzTvOSoWtOTxgq4kzMeUaI/Vi3ghXwRdt6V7XMYOeMvXYPrMT9YvpI
         wtpSuYNpSjbpK8KC8M+N8XpCKV1KC4XbB9FkTa4vZE6VbRQtGHzZjviZG43Lj9wCCpkZ
         J1HyRhUQU9dd9GeN50S3jHRYETSB8CavwaQuYkvTL4j+TXu9fqX0n6eoLpRFlrMWGcka
         3FkxTV6FIJDOzP8WqiFhgb6rguKq7veV5jLgnmAMOxaPMfeeTSbzQVlAy9jVNSBsfbiW
         bG3uLd7oErowpMqS69XE+Hd5ZYS+WcCsjr3P6wFlfFkg7s25zKhLVTg1RG5lf9VnjH5C
         S8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689255244; x=1691847244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lni4UWIKw2Lp7DjCo96CHQnoSYyoodWrf2lKDIVVpbc=;
        b=KFPnbaUCGWbP2sWscVdfm8XaiRzQQtTcKAiw4rlmJ1epSLqpu7sSzqx37Mh38uqohZ
         sRsVGYQm8iINrvTYmXjHkiaVmy/l3ntU3Lv1c5JmyCpxEB5BgpleQIWvGDKfI5Aoz1hj
         Zl7jE73Yz6s2g4C9pTfbYLBu4MXMz5ScTIAhKC+UiuxmYcTTj1gxnmHkDPd80RnaVocX
         wSAQxswKm00k27PBBMV0YBiLCfeYGRWHITtE9M8BZksUA4V59HXMbNUTJh9RUDsVeRhc
         C5Z1P1L2S/bzYj/5k53jdBEzRyaebFdsfB/kXTzDBhSF7lir8k7Ag+jJNSKEg7y8zLFm
         FPVA==
X-Gm-Message-State: ABy/qLbZft7jkZrvbhSMdSfXwPegXj+7NyqWjGTrWyDcHEKck7s7Gxpy
	OnikK7YoRqYebDKYGleRMG6yGw==
X-Google-Smtp-Source: APBJJlGvrRWNt/FFlKe8uKPn1T37JqQamvuvd1xh9hAZXGrxTN6z2+pvgee7FNyh0NbM/6xJ+VJhvQ==
X-Received: by 2002:a17:906:20a:b0:982:487c:7508 with SMTP id 10-20020a170906020a00b00982487c7508mr1634168ejd.38.1689255244554;
        Thu, 13 Jul 2023 06:34:04 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([93.23.19.53])
        by smtp.gmail.com with ESMTPSA id d15-20020a170906c20f00b00993017b64a8sm3982733ejz.224.2023.07.13.06.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 06:34:04 -0700 (PDT)
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
Subject: [PATCH v4 0/5] riscv: Introduce KASLR
Date: Thu, 13 Jul 2023 15:33:56 +0200
Message-Id: <20230713133401.116506-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_063424_382311_02DC2353 
X-CRM114-Status: GOOD (  14.46  )
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
