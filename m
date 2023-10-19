Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4296AC001DF
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 21:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HNhj/ZPdMX5u6ObksLpNTXyadIDLfsCbPzsd9vGJs9E=; b=vAqqigEWhLGGUC
	+42hpN9hyvsequt3kQ/Gy6MiWjI8I0XVAs2Vt13S/yP9rhAU6DJbLt4CO/Q6ncLy+SRLR1GBm4fWH
	CsuuH2F2ov0Yvy/pkifxxaXihFoGQej4piQ4gPMKXaqJPGPE81O6bZHvciCrPOKucR4INwnR7y2EF
	EWR73G6PlGi/uclTTYJUSX8g4AkQo5JroDpWAo9Jevk6zSsBF2mSXfJGPdO2R56aiTOVKbdCdir0A
	hF0T+tI/P0YuA+YJwIJppFEVGK7IVxc8kpV22zzJiCOlL0deIqITmuz4Nkeh4RLJKKTPdzsnOnkiD
	ztoQywbjzNUJRXYY8uOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtalp-000kxz-0p;
	Thu, 19 Oct 2023 21:41:33 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtall-000kwl-0f
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 21:41:31 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6cd1918afb2so121357a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 14:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697751687; x=1698356487; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PmU2FKsnzb5ZXX3tTX1X2BdGNJX62qrZ4JKEx6OuTU=;
        b=SWtYXuSJK+mIR94ltViI7Iq/7jKqjhwJ1cp8wilOhu1x9UR6tXPixi7Emv7B1xpiok
         h4wX+UHAIzuaRF3FuxCOWPTMOGl72TC/RllJ4PhhKjsjM8Zhct26RjiwK3DKRluwIam9
         q7XsXZJmc8hcS2e6z0scRFbpH1yQgfa65JSry2Q9laUnFuKGSUqD0athWBbhjOSlxqf+
         vSGrrlyVRC3XDFpDAHxE1OApNlKi1ETxegfjpMfo6QGK/CjJsFhukVfZMrAkCtjvtbKA
         vH9Jlo9iHpinL/Tgyag/qlGNfKnqckA0fWl1HIl9/skFhHyjCeWtGWTIIPFO/Um4o15m
         IcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697751687; x=1698356487;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PmU2FKsnzb5ZXX3tTX1X2BdGNJX62qrZ4JKEx6OuTU=;
        b=KnCcOIEK5Udh8Lqe8Wegy4Kc5CYpkp1n6FaedvYLqncVH0RuoDe98Ah+9ihzqIKKNL
         Sab6EpUT/KwUHD24e6qYiwbDoQ9ocyO/SOXWC6iIQuMBqqNAL9wzU6ud5MoDAav7clx7
         kiCm0zVC3pdYZ1W6Uzrf9lN+1FJM6qcbdc+boyK5SNmdmVNfvhqrzQqYw2YTFJX0Ps9G
         sTgeoYdNEgjAdyIL3rqtjKu1K9xd13KlPNOlAzM0WLUfJZojkVw310JSFhyGZvXE2CdX
         biY855vZHpW7lBIkdkDU6iJtIkIyAXjy+aa17O6baRQK0/Ep+0X8cFsJS0Vrq5LvORsj
         uYbQ==
X-Gm-Message-State: AOJu0YxaefTum6YIV72sxDKzG+Fk11OHhuo+G/kMRU1pn7FfvIFLjeoO
	saKBPJ74Mc4cuhi7gS7QIJz+NQ==
X-Google-Smtp-Source: AGHT+IGPG6w5SHcB8Fe6oTorM2i0pm9QlPdmNXgGhPxZK621WOn1cjYRCOOGGek68mhOHXfNeLdemw==
X-Received: by 2002:a05:6830:25d4:b0:6b8:f588:2c79 with SMTP id d20-20020a05683025d400b006b8f5882c79mr59079otu.1.1697751687063;
        Thu, 19 Oct 2023 14:41:27 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x19-20020a9d6293000000b006ce2c785ac7sm81812otk.8.2023.10.19.14.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:41:26 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 0/3] riscv: Add remaining module relocations and tests
Date: Thu, 19 Oct 2023 14:41:23 -0700
Message-Id: <20231019-module_relocations-v6-0-94726e644321@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIOiMWUC/23Q0WoDIRAF0F8JPneLOjpm+9T/KKHsOmMjJGvRR
 FrC/ntNKGUpPt5h5gzcmyicIxfxsruJzDWWmJYW8Gkn/HFaPniI1LLQUoMc5X44J7qe+D3zKfn
 p0rbLEBA8E1o1kxPt8DNziF8P9O3Q8jGWS8rfjx9V3ae/nIIeV9Ugh3kG2ht07EZ4zbGmEhf/7
 NNZ3MWq/xQlJXYV3RTjLKKxEJh8R4GNovoKNGVCdIFQOsVjRzFbxXUV05QRXLAcQGGQHcVulW7
 N1TaFAjNoMhT8/17Wdf0Bv9/ugM8BAAA=
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_144129_440664_51D85282 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Charlie Jenkins <charlie@rivosinc.com>, Andreas Schwab <schwab@linux-m68k.org>, Eric Biederman <ebiederm@xmission.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Emil Renner Berthing <kernel@esmil.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

A handful of module relocations were missing, this patch includes the
remaining ones. I also wrote some test cases to ensure that module
loading works properly. Some relocations cannot be supported in the
kernel, these include the ones that rely on thread local storage and
dynamic linking.

ULEB128 handling is a bit special because SET and SUB relocations must
happen together, and SET must happen before SUB. A psABI proposal [1]
mandates that the first SET_ULEB128 that appears before a SUB_ULEB128
is the associated SET_ULEB128.

This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
RISCV_MODULE_LINKING_KUNIT.

[1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/403

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
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
 arch/riscv/kernel/module.c                         | 368 +++++++++++++++------
 arch/riscv/kernel/tests/Kconfig.debug              |  35 ++
 arch/riscv/kernel/tests/Makefile                   |   1 +
 arch/riscv/kernel/tests/module_test/Makefile       |  15 +
 .../tests/module_test/test_module_linking_main.c   |  85 +++++
 arch/riscv/kernel/tests/module_test/test_set16.S   |  23 ++
 arch/riscv/kernel/tests/module_test/test_set32.S   |  20 ++
 arch/riscv/kernel/tests/module_test/test_set6.S    |  23 ++
 arch/riscv/kernel/tests/module_test/test_set8.S    |  23 ++
 arch/riscv/kernel/tests/module_test/test_sub16.S   |  22 ++
 arch/riscv/kernel/tests/module_test/test_sub32.S   |  22 ++
 arch/riscv/kernel/tests/module_test/test_sub6.S    |  22 ++
 arch/riscv/kernel/tests/module_test/test_sub64.S   |  27 ++
 arch/riscv/kernel/tests/module_test/test_sub8.S    |  22 ++
 arch/riscv/kernel/tests/module_test/test_uleb128.S |  20 ++
 18 files changed, 633 insertions(+), 102 deletions(-)
---
base-commit: 4d320c2d9a2b22f53523a1b012cda17a50220965
change-id: 20230908-module_relocations-f63ced651bd7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
