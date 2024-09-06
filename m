Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650C1E6FE2F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h8r1hmocTvCYtwIDWIrAka1E8A+RyrzgY3fgxFraAuw=; b=WuM/dX0JNPgkuO
	gQk0JucnApOcRQr5yqmPVn8HRPYndMOd/L85mjDBDd8S+Ik61PA8gz24+Cp8gwyQyjHxsMvFJJO5R
	urPNzY6YXqNmx/TK3AZWR7DwahGzchqfX2pIU8Qw0bKPICUl295i5dbSHj9geZ6dkZGwJMM3eRru2
	sERGR8KRe3EDDOVW69LvDijYsHUo02fcHUPP7IaN8q5+ulUHhZoOT/LLoMmIVXWzCKvUMCCKktUzA
	SLl/HsMX3CslupK27AJvGVdG5VnxJ9iSEH526FJmuTGuugLvrqCEqK/XcJI0mRwmg8ywlB0p/L0AB
	CMVay6L2wTvrDlmLDmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smbpU-0000000Cy8h-40RC;
	Fri, 06 Sep 2024 16:29:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smbiG-0000000CwoK-241S
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 16:21:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc47abc040so20964945ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Sep 2024 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725639691; x=1726244491; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eYtctJfTJlMWL5l2Lu9nbkftuipcA6blBFQEhlLdB8=;
        b=dlNnhAkwjFInFkUhPI3zx6mhrh1PPasKvKtRLTzfGXlLlcc3eQDiqm4jkWkBHWnfG4
         L8pHI9ynU4N5UsfednE5jEqFKhJ1i/Mwh9+A9sRcVUFBE8/GATb9ZNZ3Xvd9+4x1efHW
         okQvSbXWHNqUEwzEIHnhYkNpZWGfCyvb02cGAX4/isEv9P12camv43H93t3zqt5H5js3
         CTzGbGZ7kIQuJorWaedNMU2pwXP9cX6fyaeOCoMum+D5SxYshNbN8QH+12E/IudXshvb
         16YqR1SxjCyrYmVqd83Gcq+XLr4l7NKoYksdCnJDhJ/EC4du/WA4mtBk4LDeKmJJrdLb
         eiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725639691; x=1726244491;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eYtctJfTJlMWL5l2Lu9nbkftuipcA6blBFQEhlLdB8=;
        b=YRzDy+Pf5auSDlmbGUmiIinlrWGf17xVsSrRiZQAR9Ggp4GaC/wjqPBnphSmvSovzJ
         7igxyfeTyY4kMyB4HO2IL/PfX2Dm+C5pFVR69Sxa/1XN2el/FajNIZbp+6CyOjC0jH/l
         ujeWjOZf9eW7FYWOjhmrnk4LluD6TTII0hqPW0hc1xua/qMle2EkzUAHEVq8H0FVpHLU
         JSEUzwqp3MN/Iy2LYtbIGNBQczPnuS9Scb6mg0s5/VPhtHwZRyQYrUFda4oMPPR3ptM8
         zy9TLbMBRdiycuY7EzljXWaia/tHRZyn5YS+aAt64q2P39zay6PkIDlMhBvEQVmJoHFF
         scEQ==
X-Gm-Message-State: AOJu0Yy6PfEJYKuIfue7ElZllhp5AxXED/5UEmoWoker885p/3CxEav5
	3PsEcn2kQG3cUfzoChWKQrX+ce8C3m7CdVLTcVZG4gULxyPv7gAOV1ZZtQoJYCA18SAIOAqPAt9
	r
X-Google-Smtp-Source: AGHT+IFrxyzqMcF2UeehBPT3CymEL6yHGMozxetkTEC0Q2e1Ixf8Bdnmqn+Nx69DjJsy2v2toYrq+A==
X-Received: by 2002:a17:902:e749:b0:206:aafb:4a91 with SMTP id d9443c01a7336-206aafb4aeamr114695635ad.50.1725639690771;
        Fri, 06 Sep 2024 09:21:30 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae9505b7sm44789525ad.89.2024.09.06.09.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 09:21:30 -0700 (PDT)
Date: Fri, 06 Sep 2024 09:21:30 -0700 (PDT)
X-Google-Original-Date: Fri, 06 Sep 2024 09:21:27 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.11-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-43509d97-4d3a-449f-b4d7-74f1041daefc@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_092132_742531_B04BBC0C 
X-CRM114-Status: GOOD (  12.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 32d5f7add080a936e28ab4142bfeea6b06999789:

  Merge patch series "RISC-V: hwprobe: Misaligned scalar perf fix and rename" (2024-08-15 13:12:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc7

for you to fetch changes up to 1ff95eb2bebda50c4c5406caaf201e0fcb24cc8f:

  riscv: Fix RISCV_ALTERNATIVE_EARLY (2024-09-03 07:57:55 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.11-rc7

* A revert for the mmap() change that ties the allocation range to the
  hint adress, as what we tried to do ended up regressing on other
  userspace workloads.
* A fix to avoid a kernel memory leak when emulating misaligned accesses
  from userspace.
* A Kconfig fix for toolchain vector detection, which now correctly
  detects vector support on toolchains where the V extension depends on
  the M extension.
* A fix to avoid failing the linear mapping bootmem bounds check on
  NOMMU systems.
* A fix for early alternatives on relocatable kernels.

----------------------------------------------------------------
That mmap() one is particuarly embarassing, as it didn't even fix the sv39
compatibility issue we set out to fix in the first place.  We'll have a better
fix for this, but I figured it would be best to get the revert out as it'll
need to be backported and it breaks real workloads.

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Do not restrict memory size because of linear mapping on nommu
      riscv: Fix RISCV_ALTERNATIVE_EARLY

Anton Blanchard (1):
      riscv: Fix toolchain vector detection

Charlie Jenkins (3):
      Revert "RISC-V: mm: Document mmap changes"
      riscv: selftests: Remove mmap hint address checks
      riscv: mm: Do not restrict mmap address based on hint

Palmer Dabbelt (1):
      Merge patch series "riscv: mm: Do not restrict mmap address based on hint"

Samuel Holland (1):
      riscv: misaligned: Restrict user access to kernel memory

 Documentation/arch/riscv/vm-layout.rst           | 16 ------
 arch/riscv/Kconfig                               |  4 +-
 arch/riscv/include/asm/processor.h               | 26 +--------
 arch/riscv/include/asm/sbi.h                     | 20 ++++++-
 arch/riscv/kernel/Makefile                       |  6 ++-
 arch/riscv/kernel/sbi.c                          | 63 ----------------------
 arch/riscv/kernel/sbi_ecall.c                    | 48 +++++++++++++++++
 arch/riscv/kernel/traps_misaligned.c             |  4 +-
 arch/riscv/mm/init.c                             |  2 +-
 tools/testing/selftests/riscv/mm/mmap_bottomup.c |  2 -
 tools/testing/selftests/riscv/mm/mmap_default.c  |  2 -
 tools/testing/selftests/riscv/mm/mmap_test.h     | 67 ------------------------
 12 files changed, 79 insertions(+), 181 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi_ecall.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
