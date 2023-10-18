Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE51ACDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 05:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H49JQQv9GEQSjw5alkgQxvDRJysVD+DpYO2RnixbZaY=; b=rzZZNh6Oc9Nk1A
	6lk8eohtxBcuJpKsJIDo55QQQIp6gSlaavV23uG4c6ioQW+ikahfxOgMMFvfPLUPRMNw0ibLr5mSA
	8uXFlY+mbD4lTqPvweHX9oFerQS0LeGXMSd2h8+h/VDEqcfGUif5Tr5jDOyDlW5PuVTm8KlJezxT1
	39NFG5xobzUJ8wTTXBoIi+UPZ/QcZqdEK75bSE1kVRYsdc630bGkCv2sCvv3QyMzNculj9xTnDJbx
	VgNrCuhRMrFvTF6A49uXNSF5yyxgi7uyor12waQSja6grDoFWXfLSnADXAz1iyrnBTWq1zCwx2S92
	s55DLhZlhAOku/U4ikFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qszCL-00Dphq-1e;
	Wed, 18 Oct 2023 05:34:25 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qszCI-00Dpfc-18
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 05:34:24 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3b2b1ad7ee6so3020151b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 22:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697607259; x=1698212059; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcA19DI8JxNOsatUyRCutdloslAvaeKjMvE3flJ53dg=;
        b=mrgozA2qhhwfyq/09tvqKyIo9TmE22bU+sz+NWLcWhY4neL0c5wfbmoJ53gDNNkruY
         Af6TgeT9XfDZ7RghrNIBcKsMkxwg79OmiHaPLp6X8GVFPCLwy2PLKoloULE+I8WnPByh
         49mioQ+ztac6yDYw8iWbR7mR/QEvh11cLEWkku2yKq4cJhJMI8pKsGzi3ZMjUeZj5kIc
         R+FpWLLkFD+va65AKPIQxhI9a5R82jLzcgW/LbtjFlTt138xO9d4sweBHovr8yrTJgN4
         vTNqQVBz62nmqe0LjFjxLJoBdsl7ks5BMAXusyXKCtifbCOanDjESF13+OCCa+lQ84mJ
         jF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697607259; x=1698212059;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcA19DI8JxNOsatUyRCutdloslAvaeKjMvE3flJ53dg=;
        b=clSEYba9EXhmhGuvZkfmG5Mue1Xm+IsnUsOUzPPFxyfPOvNU3JX+RbpDQrnxYFQjwo
         yP94aGu7xVAXDlSaSlesdV1YWvgNpZUGymm9kfcNTdN7p8op+GR18pGPLmvPugTiSR0D
         AKHf3lGDzaiEBSoRTsYU8yZtCyKYXmzmA3sGekpx4504Z6m6o9Itf2T3kWlRsLXcK0tY
         BwEtU/E2/ph1lD52lm67Ga+5PXIUKw87GD95jrpGNjwRWadvzwHaLCHJRJe++cSuVDcA
         azQTZFg/PLWeNsy011+/Jt2nqMHkZqe2redGFYIk5af4FgH2jiLCzmh7YarcUJrvhUO3
         7Fgg==
X-Gm-Message-State: AOJu0Yw0gzQeua512O+WMD6OQyvEc16diFWf6j/snZauXD7Ko/gDOY8K
	GwD9sUP0RUwkZxBew+2BGyL9/Q==
X-Google-Smtp-Source: AGHT+IGK/wCHRdzqyE+f30dZhC8keLR9CdSNY1bxU9dNVzNKpnZmQTzobu7h+SvnIzAMMQwoVz2Syg==
X-Received: by 2002:a05:6808:8b:b0:3ae:156f:d325 with SMTP id s11-20020a056808008b00b003ae156fd325mr4197727oic.58.1697607258872;
        Tue, 17 Oct 2023 22:34:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z26-20020a54459a000000b003af60f06629sm527977oib.6.2023.10.17.22.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 22:34:18 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 0/2] riscv: Add remaining module relocations and tests
Date: Tue, 17 Oct 2023 22:34:15 -0700
Message-Id: <20231017-module_relocations-v4-0-937f5ef316f0@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFduL2UC/23N3QqCMBTA8VeRXbfYh55pV71HROh2zIG52GwU4
 rs3JSLCy//hnN+ZSEBvMZBDNhGP0QbrhhT5LiO6q4crUmtSE8GEZBUr6c2ZR48Xj73T9Zi2A21
 BajRQ8MYokg7vHlv7XNHTOXVnw+j8a/0R+TL9cFxucZFTRptGmjIHhaqSR2+jC3bQe+1uZBGj+
 CqcMdhURFJyVQDkhWzR6A1F/ih8W5FJqQFUa4ApjtWfMs/zGxPwXQpDAQAA
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_223422_623794_4506965C 
X-CRM114-Status: GOOD (  10.88  )
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

ULEB128 handling is a bit special because SET and SUB relocations must
happen together, and SET must happen before SUB. A psABI proposal [1]
mandates that the first SET_ULEB128 that appears before a SUB_ULEB128
is the associated SET_ULEB128.

This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
RISCV_MODULE_LINKING_KUNIT.

[1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/403

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
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

 arch/riscv/Kconfig.debug                           |   1 +
 arch/riscv/include/uapi/asm/elf.h                  |   5 +-
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/module.c                         | 207 ++++++++++++++++++---
 arch/riscv/kernel/tests/Kconfig.debug              |  35 ++++
 arch/riscv/kernel/tests/Makefile                   |   1 +
 arch/riscv/kernel/tests/module_test/Makefile       |  15 ++
 .../tests/module_test/test_module_linking_main.c   |  85 +++++++++
 arch/riscv/kernel/tests/module_test/test_set16.S   |  23 +++
 arch/riscv/kernel/tests/module_test/test_set32.S   |  20 ++
 arch/riscv/kernel/tests/module_test/test_set6.S    |  23 +++
 arch/riscv/kernel/tests/module_test/test_set8.S    |  23 +++
 arch/riscv/kernel/tests/module_test/test_sub16.S   |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub32.S   |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub6.S    |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub64.S   |  27 +++
 arch/riscv/kernel/tests/module_test/test_sub8.S    |  22 +++
 arch/riscv/kernel/tests/module_test/test_uleb128.S |  20 ++
 18 files changed, 548 insertions(+), 26 deletions(-)
---
base-commit: 4d320c2d9a2b22f53523a1b012cda17a50220965
change-id: 20230908-module_relocations-f63ced651bd7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
