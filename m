Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288C8C001B5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 18:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LW6AByAIdK4+2B2j2BLvaNMTDFXZGlk7M0wYRwcvNb8=; b=mDFFnLqegwspWl
	ipzb9F1FQkKztLbIsR/mTO5cpls2cTusLIFApoOYe8G2nNIG5j9Twrr4zK7B8CUEwGFUIJMpw+bBg
	7GG6bVdm4ahPzUewocx9tQEr7WqIkQ7nMlqYYCcKORdkhPV5EpmV74KbVgloFRLFzHV0oasPfc74O
	KwI21ySTumyBFjzy89oixSwiR2MgeA6PkGULwQ1185I2igRL7oQpalVSoE7rEEjkvs0HX04/qFHwD
	H/Klct0+4ve0amgNR4sx9AxoWRAHT6I51R7sbIouabx4cuK+0PQj7zc/JxmSbKC7rfE9RTIGfbsGb
	TnFN9SaL5C3YdC2VuAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyG1e-007x7c-2U;
	Wed, 01 Nov 2023 18:33:10 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyG1a-007x6w-2T
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 18:33:08 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-581ed744114so53678eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 11:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698863584; x=1699468384; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YlYNLy4VnSwlzJ5T98YglMe9qEBY6q8tyB3afSFZj/k=;
        b=RtuAO2OisXFeauTJjrtSW0eRAR8uMY3lWJVeCoYpYDdzWPrcZHEc/CoF6zW62IgCIU
         n9izBBCdo0cAoWP21lGxJOTggGZkqWxVHBLX3YgFLLFK1w3VO89W2idilYQyrGFpTV4v
         9sb/yM15Gnm6UXlSiV8eLSDnt9aPVGJqhpLRHefmlnwhMQi5ZQuJplbpKQc+7M5OTETL
         ZIvFmhnktSw2BImWii191DNmeXtBRG+1u8G0YThzK1bRkDYPNqRsNPYfSbixMmPrHBq8
         iA6ugYzevadn5/9o6Dws7dLrqt4m9RNnPkMBtVH0+HAHWm01Z1R7g9noguZ1QWh+67cn
         KEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698863584; x=1699468384;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlYNLy4VnSwlzJ5T98YglMe9qEBY6q8tyB3afSFZj/k=;
        b=FLZ4ja5b0n59zd15hRxZgMObOjX9rOMy2Ko7qJTatjx3Hb8PeosNKrYdXp8+4MbuNB
         4t7UpYUhFUmtBvLC+z2Myw9DomljHwPNIMH7iL0k5tsnR8V6AwCiaDOarG4YjtpEJala
         qhnToGx+wvDmyHBw2Z4ymQ+1Ddag1KLvLGjfEz2C/errEEZaBH7rQ21w8MUnlEFVjKAJ
         iBPo1WOuOI6msUn798gTXDzWOSiXNTOgQAJVs03+TN2Ya1oHmezQLO4dwBO1KlqELrCo
         yShiyAHUkYvp+Om0s/nqEfiPZESlzAvNiKzGniR9zM7PnrdVjNpDH757ECxhYGk6jyZP
         8tgg==
X-Gm-Message-State: AOJu0Yx7Ln2Y0udgMXKA/eYcvHhVPikm25KdtigIBnitJo5bPVzvX1E2
	hj10w1z/93QKwn02EAyUzqXIGw==
X-Google-Smtp-Source: AGHT+IEjD1wkkctBbU+7K5oihsH7H4HSTVQxge9RCOX/Hymo2C9jI2bYeaR39S7Le6kXF5cz9OqAFw==
X-Received: by 2002:a4a:c885:0:b0:587:2b9b:985a with SMTP id t5-20020a4ac885000000b005872b9b985amr5701208ooq.9.1698863584599;
        Wed, 01 Nov 2023 11:33:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id m14-20020a4aab8e000000b00581e090fd1fsm686331oon.8.2023.11.01.11.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 11:33:04 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v9 0/3] riscv: Add remaining module relocations and tests
Date: Wed, 01 Nov 2023 11:32:58 -0700
Message-Id: <20231101-module_relocations-v9-0-8dfa3483c400@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANqZQmUC/4XQwWrDMAwG4FcpPi/Dtmwp7mnvMcaobXk1tM1Iu
 rBR8u5zyhhhCHb8hfRJ6KYmHitPar+7qZHnOtXh0kJ42Kl0PFzeuKu5ZWW1BR10352H/HHi15F
 PQzpcW/fUFYTEGb2JmVQbfB+51M87+vzS8rFO12H8uu+YzVr94QxI3Gw63cUIuXdITAGexjoPU
 72kxzSc1SrO9lcxWqOo2KY48ojOQ+GcBAU2ipEVaMoBkUpGTYaDoLitQqLimhKAiucCBosWFL9
 VxDfPvim5MIPNLpck/QW3ShAVXG9xZJHRObBGUGijgBEVagoWRyZEdLGQoPT/K31TdIg+ktXJF
 P6jLMvyDSROhxShAgAA
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andreas Schwab <schwab@linux-m68k.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nelson Chu <nelson@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_113307_042902_E3AEF147 
X-CRM114-Status: GOOD (  16.24  )
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

A handful of module relocations were missing, this patch includes the
remaining ones. I also wrote some test cases to ensure that module
loading works properly. Some relocations cannot be supported in the
kernel, these include the ones that rely on thread local storage and
dynamic linking.

This patch also overhauls the implementation of ADD/SUB/SET/ULEB128
relocations to handle overflow. "Overflow" is different for ULEB128
since it is a variable-length encoding that the compiler can be expected
to generate enough space for. Instead of overflowing, ULEB128 will
expand into the next 8-bit segment of the location.

A psABI proposal [1] was merged that mandates that SET_ULEB128 and
SUB_ULEB128 are paired, however the discussion following the merging of
the pull request revealed that while the pull request was valid, it
would be better for linkers to properly handle this overflow. This patch
proactively implements this methodology for future compatibility.

This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
RISCV_MODULE_LINKING_KUNIT.

[1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/403

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v9:
- Use uintptr_t where applicable (Emil)
- Split up insn_rmw changes into correct patch (Emil)
- Make reloc_handlers const and simplify struct (Emil)
- Link to v8: https://lore.kernel.org/r/20231031-module_relocations-v8-0-09b5b720c1fe@rivosinc.com

Changes in v8:
- Fix up riscv_insn_rmw to work with big-endian systems (Andreas/Emil)
- Improve readability of bitops throughout module.c (Emil)
- Consolidate all relocation handler functions into a single struct so
  array doesn't need to be duplicated 3 times
- Use .space assember op instead of .rept
- Fix up name of uleb128 testcase
- Define prototypes of some new functions to conform to -Wmissing-prototypes
- Remove unused variable "first"
- Link to v7: https://lore.kernel.org/r/20231031-module_relocations-v7-0-6f4719b64bf7@rivosinc.com

Changes in v7:
- Overhaul ADD/SUB/SET/ULEB128 relocations
- Fix ULEB128 so it produces correct values when more than 1 byte is
  needed
- Link to v6: https://lore.kernel.org/r/20231019-module_relocations-v6-0-94726e644321@rivosinc.com

Changes in v6:
- Use (void *) instead of (u32 *) for handler type
- Constrain ULEB128 to be consecutive relocations
- Link to v5: https://lore.kernel.org/r/20231018-module_relocations-v5-0-dfee32d4dfc3@rivosinc.com

Changes in v5:
- Brought in patch by Emil and fixed it up to force little endian
- Fixed up issues with apply_r_riscv_32_pcrel_rela and
  apply_r_riscv_plt32_rela (Samuel)
- Added u8 cast in apply_r_riscv_sub6_rela (Andreas) 
- Link to v4: https://lore.kernel.org/r/20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com

Changes in v4:
- Complete removal of R_RISCV_RVC_LUI
- Fix bug in R_RISCV_SUB6 linking
- Only build ULEB128 tests if supported by toolchain
- Link to v3: https://lore.kernel.org/r/20231016-module_relocations-v3-0-a667fd6071e9@rivosinc.com

Changes in v3:
- Add prototypes to test_module_linking_main as recommended by intel
  zero day bot
- Improve efficiency of ULEB128 pair matching
- Link to v2: https://lore.kernel.org/r/20231006-module_relocations-v2-0-47566453fedc@rivosinc.com

Changes in v2:
- Added ULEB128 relocations
- Link to v1: https://lore.kernel.org/r/20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Add remaining module relocations
      riscv: Add tests for riscv module loading

Emil Renner Berthing (1):
      riscv: Avoid unaligned access when relocating modules

 arch/riscv/Kconfig.debug                           |   1 +
 arch/riscv/include/uapi/asm/elf.h                  |   5 +-
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/module.c                         | 603 +++++++++++++++++----
 arch/riscv/kernel/tests/Kconfig.debug              |  35 ++
 arch/riscv/kernel/tests/Makefile                   |   1 +
 arch/riscv/kernel/tests/module_test/Makefile       |  15 +
 .../tests/module_test/test_module_linking_main.c   |  88 +++
 arch/riscv/kernel/tests/module_test/test_set16.S   |  23 +
 arch/riscv/kernel/tests/module_test/test_set32.S   |  20 +
 arch/riscv/kernel/tests/module_test/test_set6.S    |  23 +
 arch/riscv/kernel/tests/module_test/test_set8.S    |  23 +
 arch/riscv/kernel/tests/module_test/test_sub16.S   |  20 +
 arch/riscv/kernel/tests/module_test/test_sub32.S   |  20 +
 arch/riscv/kernel/tests/module_test/test_sub6.S    |  20 +
 arch/riscv/kernel/tests/module_test/test_sub64.S   |  25 +
 arch/riscv/kernel/tests/module_test/test_sub8.S    |  20 +
 arch/riscv/kernel/tests/module_test/test_uleb128.S |  31 ++
 18 files changed, 869 insertions(+), 105 deletions(-)
---
base-commit: 3bcce01fcbcd868b8cf3a5632fde283e122d7213
change-id: 20230908-module_relocations-f63ced651bd7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
