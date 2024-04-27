Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBB7C19F53
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PwoSblNa+JaCAuOcxD+UtLxRJc9+PhWNYnDdWc8GqIQ=; b=YCV
	HrmkAI0iQFFyAMjvK+z44PtVkiqpdX+fuUlB8lkVzzJFkFmYZ7gUYOrCtkR92vLC8j11wiyU/fBp+
	r54740B0abQjgal3+8LeLhvMwVamIAk2fbcGAlKCq/TJ+1tg+jBZYhVPGSw39yPMFNaKtfMrhG9O/
	bsEUViBbO1nRyjssZBObRND0PhiyS8pR0q5uompD1/5Nqdvtm3wQWGXGA1wmteInb+SE1HRcqcs0Z
	IFR7F+cL0vYcV0EwU4hsYg9FDosH3l39DGDVOtdAn2plC+JMcB5l20+l7yySVBcQQVtoV/EyxdH5I
	pn2XQhuspBEslAAFH8jIG4VvAHrIBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0jU6-0000000FgmC-06k6;
	Sat, 27 Apr 2024 14:57:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0jU2-0000000FgkV-2eIh
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 14:57:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so2807421b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 07:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714229816; x=1714834616; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+kE8hkHGsVsGGS/xS7RahbuA7ku3TuLmh7h46vKCVg=;
        b=tTWN79k2TJnLjOrBVcZpXPAeIWpTRJdK86hiWb5OShpcV7E7EacdIDwgH9LBnKvJxy
         V7wFMkqRwrzpkpZQHQ/KlYFTgaFgqwD8qBqv9Lyk3CFvNNB0c07LvfF/YxP121Q8w2B7
         fc4i6aUirCVBhiST/c/+DSdN7udaj+D489B/3BDoXpucXmdi+d7l2QZkP8sXdivZl8Os
         B02Us/rWaDwcJLvrS3aqeEKEDicpEAJgPU6AjbChJMWn30LIDurLHdbobreNyRdvgwAr
         jbU8F5clJZv4gfb/FcGVIZCDq0K53RPr0maTnpnXR2gOwCQMDhEPPZ9N8z5Ip8mrNALL
         p9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714229816; x=1714834616;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+kE8hkHGsVsGGS/xS7RahbuA7ku3TuLmh7h46vKCVg=;
        b=eq/n7bpjYuYUjZwcjWo0ywSFnE8QGYFe8t9obUTWKpUpbqkur0UOhR7KMkeTXKPCMY
         T5+uqs9I8jqmMLJE2zWNfcyDHkrb+hN3gpsvZ5QhaQEAQkUJAHZf8r4OeFArPPRERuYe
         /3TOtT0LFdYLP4ZmUZ5EK7pShVRDmRHapFBe1P54EaxtslD5H7hd9Ve99bjMq0Kt/oi9
         KFDj/LgXZRQWtJQSrn/81FpsjjHMsGF5/AtMYJmvPmxwrLo25r+hj1k+a0AVDslztEOS
         PH8tp8VlcsgQNZ3A5QQglt7Zxr6QbFoc+1Ywf8oxiNRSdnGDaBkKmwd0TsvffVPr2c92
         b4xw==
X-Forwarded-Encrypted: i=1; AJvYcCUFw3yC6ub0dMwIBu8hEJkzleeF+UN4PEQ/40SklGX70jrv+G5W5c+PNWDUI16IMbzuUPiboDSDT2iWZaDUOLcAsVGWoHNPCMPJ4SaNhwC0
X-Gm-Message-State: AOJu0Yym1JvWzgzJKhEaepkHWT0CVLqzmrjV4C48L6Nj94GBPJT2ZbMx
	PC5IMjpJHeAIWD76Poux2kYvUlKaLYK20US2BtaKFjEpOrhoQirapkOZKV4QAcWZ53GvxywQ+T7
	Z
X-Google-Smtp-Source: AGHT+IHUyuQ5y6Tgjxg/K1ZD3Qr4sheNZDTKePMieGzn0RANAkQ44r2juHsrJbrehev1WQgcV4qbgg==
X-Received: by 2002:a05:6a00:114d:b0:6ed:1c7:8c5d with SMTP id b13-20020a056a00114d00b006ed01c78c5dmr7428855pfm.12.1714229815703;
        Sat, 27 Apr 2024 07:56:55 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id h17-20020aa79f51000000b006e71aec34a8sm16450224pfr.167.2024.04.27.07.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 07:56:54 -0700 (PDT)
Date: Sat, 27 Apr 2024 07:56:54 -0700 (PDT)
X-Google-Original-Date: Sat, 27 Apr 2024 07:56:42 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.9-rc6
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-2f5e2c44-3944-4a0e-9669-12967d8e6f15@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_075659_313294_8CB4AC37 
X-CRM114-Status: GOOD (  12.08  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0499152863632186973=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0499152863632186973==
Content-Type: text/plain

The following changes since commit d14fa1fcf69db9d070e75f1c4425211fa619dfc8:

  riscv: process: Fix kernel gp leakage (2024-04-04 12:35:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.9-rc6

for you to fetch changes up to 6beb6bc5a81e1433a1534e75173f67d42a6f225a:

  Merge patch series "RISC-V: Test th.sxstatus.MAEE bit before enabling MAEE" (2024-04-26 10:21:57 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.9-rc6

* A fix for TASK_SIZE on rv64/NOMMU, to reflect the lack of user/kernel
  separation.
* A fix to avoid loading rv64/NOMMU kernel past the start of RAM.
* A fix for RISCV_HWPROBE_EXT_ZVFHMIN on ilp32 to avoid signed integer
  overflow in the bitmask.
* The sud_test kselftest has been fixed to properly swizzle the syscall
  number into the return register, which are not the same on RISC-V.
* A fix for a build warning in the perf tools on rv32.
* A fix for the CBO selftests, to avoid non-constants leaking into the
  inline asm.
* A pair of fixes for T-Head PBMT errata probing, which has been renamed
  MAE by the vendor.

----------------------------------------------------------------
Sorry this is late, but I found an issue in one of the patches as I was looking
through yesterday and dropped it, so I wanted to make sure everything got a
chance to make it through linux-next.

No big deal if this doesn't make it to rc6, nothing is super critical.  They're
all fixes, though, so I figured it'd be better to just send this now rather
than waiting for next week.

----------------------------------------------------------------
Andrew Jones (1):
      RISC-V: selftests: cbo: Ensure asm operands match constraints, take 2

Ben Zong-You Xie (1):
      perf riscv: Fix the warning due to the incompatible type

Christoph Müllner (2):
      riscv: thead: Rename T-Head PBMT to MAE
      riscv: T-Head: Test availability bit before enabling MAE errata

Clément Léger (2):
      riscv: hwprobe: fix invalid sign extension for RISCV_HWPROBE_EXT_ZVFHMIN
      selftests: sud_test: return correct emulated syscall value on RISC-V

Palmer Dabbelt (2):
      Merge patch the fixes from "riscv: 64-bit NOMMU fixes and enhancements"
      Merge patch series "RISC-V: Test th.sxstatus.MAEE bit before enabling MAEE"

Samuel Holland (2):
      riscv: Fix TASK_SIZE on 64-bit NOMMU
      riscv: Fix loading 64-bit NOMMU kernels past the start of RAM

 arch/riscv/Kconfig.errata                          |  8 ++++----
 arch/riscv/errata/thead/errata.c                   | 24 ++++++++++++++--------
 arch/riscv/include/asm/errata_list.h               | 20 +++++++++---------
 arch/riscv/include/asm/page.h                      |  2 +-
 arch/riscv/include/asm/pgtable.h                   |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h              |  2 +-
 arch/riscv/mm/init.c                               |  2 +-
 tools/perf/arch/riscv/util/header.c                |  2 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c        |  2 +-
 tools/testing/selftests/riscv/hwprobe/hwprobe.h    | 10 +++++++++
 .../selftests/syscall_user_dispatch/sud_test.c     | 14 +++++++++++++
 11 files changed, 59 insertions(+), 29 deletions(-)


--===============0499152863632186973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0499152863632186973==--
