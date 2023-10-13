Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517F7CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=oD1ItOnRWerd67SYgeypKd4qrMruDT2I9rMmnSLtKrI=; b=YO+
	kCsh0uBj4k5SfR5tVGMmmspJT1er9WXJ6QwULyav6Yo1D3SPDlAxFlSPyxgp2mW9jCXorVMMboCL3
	moRkKs2zc1E1PxT+aVVbzDHVIBRmatuRzqiXbf5ygRRPQvzxX/E6eGdBRuKmt0Bxz+Jhx962b0UiZ
	N7soX9I2NNuywsWWT/4pvDGO0/ZwmfP3IRa1FV/gWtyqedFux1BGXxALai9ekVeFlVfG63qZq8/Jq
	mSfQoN2/El7dTOI006KEmsrO5X4nJcwUD5LVlodD9BAp/5V9XIV+X7RsKXpFJnJF7jMcE0ZPxPaEF
	/+SgPP6WyXo3vuNrctaIxwmo6qNDMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrIuY-003ZHL-0M;
	Fri, 13 Oct 2023 14:13:06 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrIuT-003ZGd-33
	for linux-riscv@lists.infradead.org;
	Fri, 13 Oct 2023 14:13:03 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6c62cb79b02so1309352a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Oct 2023 07:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697206379; x=1697811179; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPn+q1R7Bbm5yJSzoIgb0X5A43/F3P8E+NQ5peN1/Dg=;
        b=F+8s0fTkYNmGHg30ipl7+ta/ZSeAwxMlsTBPsHiZF+tf++X58F0aMnYRgFdYIUA+4i
         9PxcXS+gLXiLjsrr/ZUnSVKQu8PrIjQgQuZIM+8XwT52R3HCG8iQrGr6E1YY82e/s1JT
         4wtyF03FH2BBVel3U+I2Ee090O2KaVeLNJqP61iDgjRhxWeQex1zFqM2frMJncDHdOCE
         a2tnxrAuLp5VYcJgZ42iw3qpx2xx0opJqIMSXQ3HUWhF5uVbeV36MouNsVrnkjXJYdrZ
         Oyhv28NestMWcEhnRSP9+MD60NmdYl5HReWy9Y1GGippM7V+qnVN+JqnRCZfItl9vXgh
         CEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206379; x=1697811179;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPn+q1R7Bbm5yJSzoIgb0X5A43/F3P8E+NQ5peN1/Dg=;
        b=eOvfpQUF6eBeOyD203AqTGKHaq5127ybYT+3dJvVus2+AJarpFo0jdu6Zh1J5tW5BV
         SVNOFLaT5tCvckqtuuCm/iFHyBkvVACmTf01mPHHcfxkG/2lhC62p8uckqxQirUMqAXG
         DUSxq+bD0WwJTAGxB61MeWDXpq4mTloqj1a1o/5JkOH3cr5Ipj9Z94yRYF3c8VFoJYX9
         zjAJN/EFf4DRRd0C4IJBt9KblribjNHvM1SYsVwzgeP4Tihqj8fUtvftLYMP+/7qY0nm
         isV7s7LvBrTobAXtY5jIbjh2T41mmo4Gx7VugV5FGFWpU8mwDR0SrroRqHej7SIGMXKx
         gzwg==
X-Gm-Message-State: AOJu0YxMvP4pASazdpmur3iS51IwRpA5Nbb/9ILJo0gkH+9BWAx61zyl
	iBLybrk/PLhuKx+n7dZegXKfdIEiqcIn12Swrxc=
X-Google-Smtp-Source: AGHT+IGjaH5gAMnjJYZcDnnbZPWXOMd/g1sjCPPaHBL5Q0i2BJH7JwFx/KWpisY+rq1cjDVa8fyBlg==
X-Received: by 2002:a05:6830:6a0c:b0:6ca:c677:4568 with SMTP id cz12-20020a0568306a0c00b006cac6774568mr7947800otb.10.1697206379633;
        Fri, 13 Oct 2023 07:12:59 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id g20-20020a9d6b14000000b006b9b0a08fdasm669812otp.59.2023.10.13.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:12:59 -0700 (PDT)
Date: Fri, 13 Oct 2023 07:12:59 -0700 (PDT)
X-Google-Original-Date: Fri, 13 Oct 2023 07:12:50 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.6-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-429a0f54-5269-417c-af90-7edef235cd7d@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_071302_183940_31CE993F 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3268261087293463867=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3268261087293463867==
Content-Type: text/plain

The following changes since commit 8eb8fe67e2c84324398f5983c41b4f831d0705b3:

  riscv: errata: fix T-Head dcache.cva encoding (2023-09-12 13:58:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-rc6

for you to fetch changes up to 3fec323339a4a9801a54e8b282eb571965b67b23:

  drivers: perf: Fix panic in riscv SBI mmap support (2023-10-12 11:46:35 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.6-rc6

* A handful of build fixes.
* A fix to avoid mixing up user/kernel-mode breakpoints, which can
  manifest as a hang when mixing k/uprobes with other breakpoint
  sources.
* A fix to avoid double-allocting crash kernel memory.
* A fix for tracefs syscall name mangling, which was causing syscalls
  not to show up in tracefs.
* A fix to the perf driver to enable the hw events when selected, which
  can trigger a BUG on some userspace access patterns.

----------------------------------------------------------------
Sorry things were a bit slow for the last few weeks, I ended up getting COVID
at the Cauldron and thus have been a bit out of it.  So this is a bit big for
an rc6, but hopefully things are mostly back to normal for next week.

----------------------------------------------------------------
Alexandre Ghiti (3):
      riscv: kselftests: Fix mm build by removing testcases subdirectory
      riscv: Fix ftrace syscall handling which are now prefixed with __riscv_
      drivers: perf: Fix panic in riscv SBI mmap support

Andy Chiu (1):
      riscv: signal: fix sigaltstack frame size checking

Björn Töpel (1):
      riscv: Only consider swbp/ss handlers for correct privileged mode

Chen Jiahao (1):
      riscv: kdump: fix crashkernel reserving problem on RISC-V

Jiexun Wang (1):
      RISC-V: Fix wrong use of CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK

Lad Prabhakar (1):
      riscv: errata: andes: Makefile: Fix randconfig build issue

Song Shuai (1):
      riscv: Remove duplicate objcopy flag

 arch/riscv/Makefile                                |  1 -
 arch/riscv/errata/andes/Makefile                   |  4 ++++
 arch/riscv/include/asm/ftrace.h                    | 21 ++++++++++++++++
 arch/riscv/include/asm/kprobes.h                   | 11 ++++++++-
 arch/riscv/include/asm/uprobes.h                   | 13 +++++++++-
 arch/riscv/kernel/irq.c                            |  4 ++--
 arch/riscv/kernel/setup.c                          | 13 ----------
 arch/riscv/kernel/signal.c                         |  7 ------
 arch/riscv/kernel/traps.c                          | 28 ++++++++++++++--------
 drivers/perf/riscv_pmu.c                           |  3 ++-
 drivers/perf/riscv_pmu_sbi.c                       | 16 ++++++++-----
 tools/testing/selftests/riscv/mm/Makefile          |  6 ++---
 .../riscv/mm/{testcases => }/mmap_bottomup.c       |  2 +-
 .../riscv/mm/{testcases => }/mmap_default.c        |  2 +-
 .../selftests/riscv/mm/{testcases => }/mmap_test.h |  0
 .../selftests/riscv/mm/{testcases => }/run_mmap.sh |  0
 16 files changed, 84 insertions(+), 47 deletions(-)
 rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_bottomup.c (97%)
 rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_default.c (97%)
 rename tools/testing/selftests/riscv/mm/{testcases => }/mmap_test.h (100%)
 rename tools/testing/selftests/riscv/mm/{testcases => }/run_mmap.sh (100%)


--===============3268261087293463867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3268261087293463867==--
