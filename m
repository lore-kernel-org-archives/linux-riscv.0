Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B5AC4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 07:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5KE7DOT1k+moMAiRMKWMRExkJ88QSm6Tprc938+kHas=; b=W9Av6933TwosI+
	/pLHJ+LlhjCrnt2jh1Epsvaua2ShXsJtt6QlaNSPGpSacOZ4W/p49m04NPKekWznAQtunfhMcB9bi
	jW3rA0b3WmHHFAlrJ73R0GbXyAdQrQeQ+GoRbziJz3bPvukRBXS4xWIJwNtzr9wYcRkXvmLjCuo6P
	vlHJAyxcqsilqKOoPhHp8z+qLSaAl1tGtmSCCf9QwX0l7v+zXtKn4FGu804qSAq13StkR2Vn/jdDj
	rsHmPw2EMZk1p44IrD7ISTD8QjR/pohNSTgWhukK9OUSnnniDmxRH5sbVnchCDIvHAOhn2KKbiP6Q
	GPzxJCpE/ND84gfXEUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj7Z-004gbx-2C;
	Tue, 31 Oct 2023 07:25:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj7V-004gYt-0C
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 07:25:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc330e8f58so17822855ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698737098; x=1699341898; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vhAhMlUaphHl5V7P6XcsEBHb1Aahpw8dSDQur0cX8zw=;
        b=2RjDr/HAxhs5e7wd3c8Swj6K3eINGN+/VIktN7Fp+zioSsTSlk28ulHHxSiVrGcNc2
         1PysVDfJL+MAQ8p3fTXPaI702jJcX/mlU2UY1UnUpnn1R7SSwcr+wdMjdIm/uDsuZ2lJ
         XmDcvKHw4Tksm0alqSIPUzgaR0ryQlSqGM6O7uEBFnNOj9hXUseGcE0GqQ98iTRR9sZH
         X1r5tlfZGYyCk9N87c3QMldHc1c2uEfh4nbqRaLsOT0/39jfJkEKFJ3uJ8qFlrXOtQih
         zT4MMTRnnSuaouVuph8/stjWj0kXtNsMVXT61CK5zlX2Z3y25SK+xe06aP9y5kDyE35U
         YYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698737098; x=1699341898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhAhMlUaphHl5V7P6XcsEBHb1Aahpw8dSDQur0cX8zw=;
        b=Vtly53yAc+q67C5r0fzezwlQdBqKKMSduYvXK61lcB5P1G0jaJKnAa9oci6N7ds91m
         p5JzRc3J7gSY9erCS3N5J/JC2dlBXasTe3sunsCADh/cyGW+SICYSHJ9ue8vtChDnYoi
         9QFWe2/j87b6OSMc/iAZBiGyRtJByjbceWaAGebrSgCuWVX7ldOE6QnyChWkyks+4ro1
         e5S0c6zJ2TbelNmFc37RxvS1bZIxfHDdLVDaj9+R3fYpSp9jzivd0V+PMTSPbagsYXJj
         7WhqCHu0YHbZQdu9L/FVCHD3taeta0QB8SrssINFe0hc1OgvRWkK9WXtso3vn1SLXRpN
         b+Pw==
X-Gm-Message-State: AOJu0YxFQ+dvx5fu0vklLwyApUGFssa8g3x0A60oa1Wk1p9UuArUbR7I
	v02/yeXwTeAOyr1f8rnmqvxKWQ==
X-Google-Smtp-Source: AGHT+IGD/aZU9vUfXBx6ayFBL19n5/oM54mKqlA9X4PoucNNNDI8a+afCb9T5z81BufqYr+mzRHhMg==
X-Received: by 2002:a17:902:ce8e:b0:1cc:636f:f38a with SMTP id f14-20020a170902ce8e00b001cc636ff38amr1759360plg.57.1698737098025;
        Tue, 31 Oct 2023 00:24:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d90400b001c74876f018sm652575plz.18.2023.10.31.00.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 00:24:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 0/3] riscv: Add remaining module relocations and tests
Date: Tue, 31 Oct 2023 00:24:49 -0700
Message-Id: <20231031-module_relocations-v7-0-6f4719b64bf7@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMGrQGUC/23QwWoEIQwG4FdZPNeiRuPaU9+jlDKjsSvsjkW30
 rLMu9dZShmKxz8kX0JurFJJVNnT4cYKtVRTXnqwDwfmT9PyTjyFnpkSCoQTR37J4fNMb4XO2U/
 X3l15RPAU0Mg5WNYHPwrF9HVHX157PqV6zeX7vqPJrfrLSRhxTXLB5xnCUaMl6+C5pJZrWvyjz
 xe2iU39KVIIHCqqK9oaRG0gUvADBXaKHCvQlQnRxoDCSnIDRe8VO1R0VxzYaCiCxCgGitkrwzc
 305UQiUAFHaIf/QX3ihsquN2irUJCrUHJf8q6rj/THr9CFQIAAA==
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
X-CRM114-CacheID: sfid-20231031_002501_370985_FB14A3F2 
X-CRM114-Status: GOOD (  13.68  )
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
 arch/riscv/kernel/module.c                         | 685 ++++++++++++++++++---
 arch/riscv/kernel/tests/Kconfig.debug              |  35 ++
 arch/riscv/kernel/tests/Makefile                   |   1 +
 arch/riscv/kernel/tests/module_test/Makefile       |  15 +
 .../tests/module_test/test_module_linking_main.c   |  88 +++
 arch/riscv/kernel/tests/module_test/test_set16.S   |  23 +
 arch/riscv/kernel/tests/module_test/test_set32.S   |  20 +
 arch/riscv/kernel/tests/module_test/test_set6.S    |  23 +
 arch/riscv/kernel/tests/module_test/test_set8.S    |  23 +
 arch/riscv/kernel/tests/module_test/test_sub16.S   |  22 +
 arch/riscv/kernel/tests/module_test/test_sub32.S   |  22 +
 arch/riscv/kernel/tests/module_test/test_sub6.S    |  22 +
 arch/riscv/kernel/tests/module_test/test_sub64.S   |  27 +
 arch/riscv/kernel/tests/module_test/test_sub8.S    |  22 +
 arch/riscv/kernel/tests/module_test/test_uleb128.S |  31 +
 18 files changed, 963 insertions(+), 103 deletions(-)
---
base-commit: 3bcce01fcbcd868b8cf3a5632fde283e122d7213
change-id: 20230908-module_relocations-f63ced651bd7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
