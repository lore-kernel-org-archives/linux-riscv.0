Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7774C41513
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 21:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ShlBn+0W30zrki8uRbecMe6l7t1EZuomHWjk5Z/rshM=; b=ZRdQqf29hLRC97
	++DD8i9+/2xpgzJY0c3szJXNrAPlHn4wu38WyTWfCaFgi51lh7jJ6vL4sRJ0qhrGJ1qULCn7exp8H
	m6LgPBBQaUhJO7bZ6zAIo3cRANb7YkDl6o5t7mwsyYED7ewtrUdHB2lswvD/Na7qAyGl6fDt/Cf/h
	fskkbLHPvc7qCOhnMcrebSQVhl5M066ytXv3ojPGYLR0x1S4o8sUcJjSEzJERwjQ4FpB+0TlXhMlp
	OE3OubYzahiSuoUzo5pDiJnYdV/ol3V0e6Tv7VsWDYK64HdPAp/bPz9PGMlLOSf1c3ux35cJP5L6D
	SYiy/qZt5YrjJg7/iQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7M8w-00000002uxK-1eGC;
	Wed, 15 May 2024 21:26:34 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7M8r-00000002uvN-36z1
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 21:26:33 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6f449ea8e37so6328916b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715808388; x=1716413188; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XbT7INwutGKZuD03WNtDt+9MBwCLATnSj4l3KyTbIE=;
        b=S2hh2sv2b9AD+gQOJ6R8UeklYl3otkiF9Ar9jhaeC5K+3mHD4gFri5chHYfThbkLbu
         9Z+1QKNUIjIXRCwzRaYMogGLe4pmjrXm5KW5Ye41ndmDHHCOiNpSoIlGSsZQ0pChX0DG
         MmFHXo2Mtd3DMWRSwoKyGS7KlszsH1unIccmI6b56jgD0kAMdxP5tY7XaNL2j9YhnWxt
         sgP88BbtkkZy70IsfLaW9IaiUHeFFmVNEeaPDy5Nyv+oT/lo43SD8iPKPos5jj8O7G1K
         lE7ApvTtC/7NFPG4JRmxGU+sZT1clpv+tXVIIDM04Q5jeodimCWNu5fNY2UsBBRXe0By
         qJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715808388; x=1716413188;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XbT7INwutGKZuD03WNtDt+9MBwCLATnSj4l3KyTbIE=;
        b=Sm/iX/ftuzvY2AVsk+HqhaxuuMo65sp6aq3B6nJDyy2w8sPmNnOONmGsj7Eajo0aPT
         j97rZ0YJFCRnIsnnBlUEZ7PRI9/dBOtH8k9iGMUInWJqBZqXxI1Q0hACCmB+NSKyWOFY
         U5tYq2UnDct5h/fUEIdwCWgBBajzNN1oVBPall9yxdwHs8XCdtZsXvjmp5kHMs9orgo4
         ZD3sQKkTzyGV6/ossKqc49K64+/RC1tLg4XwKCd8WVa9KjIAKt8moxCuQs0Uz61OO1JJ
         fYoa9oW20y8t3fW0VyqD6sEOlLFh5JR5SOSXiBVPsZlVzSlFv8GTkyBWMbEkZwhdmoJY
         SZZQ==
X-Gm-Message-State: AOJu0Yw13o/ExbD0GVjBX/UhZ9H5z/TkWvzdl72V3OeFFi/eSRSDg19s
	1IcXW9bF4DEVe3SMnYlLJnDZIBfQ4dT3TgzFOn7XrBr4Xzu1HGOQ9vzRgU/z2xRlQi9Z40pQoid
	W
X-Google-Smtp-Source: AGHT+IHCAPxdikYmujdZmy8dZ7oFs1KG2bKARYuL/xs52ASQFKHNbJ9CgqCWeRa/YbLbE0ZSup5txQ==
X-Received: by 2002:a05:6a00:2e8f:b0:6f4:bbba:1155 with SMTP id d2e1a72fcca58-6f4e029a21emr27755612b3a.3.1715808388378;
        Wed, 15 May 2024 14:26:28 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2b30sm11970243b3a.146.2024.05.15.14.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 14:26:27 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/4] riscv: Separate vendor extensions from standard
 extensions
Date: Wed, 15 May 2024 14:26:12 -0700
Message-Id: <20240515-support_vendor_extensions-v1-0-b05dd5ea7d8d@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHUoRWYC/x3MQQqDMBBG4avIrA1MUoXSq5Qiof7qbJIwoyKId
 zft8i2+d5JBBUav5iTFLiY51fBtQ98lphlOxtoUOHTc+97ZVkrWddiRxqwDjhXph8zF+GQfGF1
 4MFVfFJMc//f7c103bFmr7msAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715808387; l=3345;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=KgtJDY4MmMjQZ2oDl1XlntkBINAq3AfwA6pN/nCVnCQ=;
 b=AxcTBgTejyl75LE7zsplxZGT/C+vsiy+w5Marj3ZYgRQqiAw+EW+/tLQzQtaZ5A3LuVAEm4gU
 A6nqJX4xQAIBW4XHMWfOS5R96bGTC14zKzpldrvZJ/sYSfMIvanIxKJ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_142630_855416_E3C636D8 
X-CRM114-Status: GOOD (  12.54  )
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

All extensions, both standard and vendor, live in one struct
"riscv_isa_ext". There is currently one vendor extension, xandespmu, but
it is likely that more vendor extensions will be added to the kernel in
the future. As more vendor extensions (and standard extensions) are
added, riscv_isa_ext will become more bloated with a mix of vendor and
standard extensions.

This also allows each vendor to be conditionally enabled through
Kconfig.

---
This has been split out from the previous series that contained the
addition of xtheadvector due to lack of reviews. The xtheadvector
support will be posted again separately from this.

The reviewed-bys on "riscv: Extend cpufeature.c to detect vendor extensions"
and "riscv: Introduce vendor variants of extension helpers" have been
dropped in this series. The majority of the code is the same in these
patches, but thead-specific code is swapped out with andes-specific
code. The changes are minimal, but I decided to drop the reviews in case
I inadvertently introduced issues.

The alternative patching code from "riscv: Introduce vendor variants of
extension helpers" has been migrated to "riscv: Extend cpufeature.c to
detect vendor extensions" such that the andes patching still works in
that patch.

I also fix a bug in this patch from the previous series that the Andes
extensions were not being properly enabled due to the manual alternative
patching not incrementing the id to be greater than
RISCV_VENDOR_EXT_ALTERNATIVES_BASE. 

To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Conor Dooley <conor.dooley@microchip.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Charlie Jenkins (4):
      riscv: Extend cpufeature.c to detect vendor extensions
      riscv: Add vendor extensions to /proc/cpuinfo
      riscv: Introduce vendor variants of extension helpers
      riscv: cpufeature: Extract common elements from extension checking

 arch/riscv/Kconfig                               |   2 +
 arch/riscv/Kconfig.vendor                        |  19 ++++
 arch/riscv/errata/andes/errata.c                 |   3 +
 arch/riscv/errata/sifive/errata.c                |   3 +
 arch/riscv/errata/thead/errata.c                 |   3 +
 arch/riscv/include/asm/cpufeature.h              |  96 ++++++++++------
 arch/riscv/include/asm/hwcap.h                   |   1 -
 arch/riscv/include/asm/vendor_extensions.h       | 103 +++++++++++++++++
 arch/riscv/include/asm/vendor_extensions/andes.h |  19 ++++
 arch/riscv/kernel/Makefile                       |   2 +
 arch/riscv/kernel/cpu.c                          |  35 +++++-
 arch/riscv/kernel/cpufeature.c                   | 135 +++++++++++++++++------
 arch/riscv/kernel/vendor_extensions.c            |  56 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile     |   3 +
 arch/riscv/kernel/vendor_extensions/andes.c      |  18 +++
 drivers/perf/riscv_pmu_sbi.c                     |  11 +-
 16 files changed, 435 insertions(+), 74 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240515-support_vendor_extensions-aa80120e4230
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
