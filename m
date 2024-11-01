Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A45E6F063
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=n5dYnd1SzUd5eyt3jgNl+rmwJG+oUInl41dI8l7kKWw=; b=uN3
	Jk6G2UuLww1izoS/KBV2C+YcQKpZFy3+gyFLjM7E69ikKtXmscbuA/R791/GkRFwAK+YpZhg1peVS
	voev7EcV84uXPL932ZDqJ8Zlhgo8hgYQ35OwE3ieUv3RXwVvta987Z4PspWoLwhnVpQMmyT2qe1uf
	ZyRjnkoU1VZDm/yrpOXumjjh6WLSmDtYr/4cs/6AXXkT9OGsvR7h27tKFhyrV/OnwSNWgMrWbBpAH
	h6VcfiRomdLiRhBam7GqhNBm+etG+ZKZmpH9S0+tiQsu7j/PaYfo60x1dHk5vk88MPEy2ZNTWcToD
	BZIL0GpIHb4tithi3eCEq0wYWBD8jNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6t3m-00000007QB3-3rGd;
	Fri, 01 Nov 2024 14:55:34 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6t3i-00000007QAU-3tIk
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 14:55:33 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a4e30bffe3so7002175ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730472928; x=1731077728; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt4swa51EyBN4N5PTpyvNVZrsawgvt64yABO9gRAyRQ=;
        b=OYv/DaHeY5ZuCWbS+ce9EeyDvWcge2r1sZH2oxQlKMXQhSWImdgqHEu8tLTK8hYHKH
         0Lwrady8o0g/qbsE8hgKqv7e8KM315uRFiYvP6fOhRfCJGc5g4j4CJEMQ94EtAJUxES6
         rT0SJofbr15S+7yK6Dc/ngdIH+QgocP01L+mA3JM0H8EbkuU+e5Me5X2aP+1VfGGVB0j
         OJlJT9sTKWE4VwMmn/uur6oq7GyAvItXm1jXtxWX7UoUAfydntmfYp+pXorLotcQRS70
         3U7yeYyc/T1W+uTcV57f5ueoZDfYd1lWq2ictbw4TF1a8tbLIRRpjvF4AX+sYKV+lT8Y
         x5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730472928; x=1731077728;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bt4swa51EyBN4N5PTpyvNVZrsawgvt64yABO9gRAyRQ=;
        b=Ns5QCWZ6x7ae84CvoscATLNUnMrZiCLkH76okjTSyVU/nezcO1BN+dhfN7w0Z1LZeW
         VQFavcdO5DcCPlEKXM2HFPTT/0CqRNI8JtI8uoRgLPW6YKOdWZI8wZvWF6Nd5ibvXx6P
         C49gbr2g9pmaPox6qSdclqHqsAsFRXdm0o4gl52b6WYPTZXBafPf7oPmjdbp1p9MWxpX
         jTUOj63t/f+d8MIJhxEiWkZilowdS7QzsgZl03drvOHDid65WTSn0Z1giUdY+Dj2S5zX
         1cs5s0tpA/XWSuYRJAyNbxZxQcKvIA8fgrRHZF5k/N0HGTY3mySKjPCBmcRCB5HIhYjv
         U01A==
X-Gm-Message-State: AOJu0YwbZp0nsbADuZ0RV/9l+sZA/hZpt+ta6nLORPSW5Ew9d2P4mvAd
	z0v5ACQUmJpwm/sBjTCmxZRBoj4SYTnpEgtp5rrjjMcGeucE2FwWrvLpWLF0oGPZDkyxGNzUkIr
	n
X-Google-Smtp-Source: AGHT+IF6j94hRrP4ekrDIjKXWPXH4NsjnW7rLmSJyhM+Ymq1LEGaizXtUkSqACmK3j6DTgKj58BezA==
X-Received: by 2002:a92:3645:0:b0:3a5:e57c:58d4 with SMTP id e9e14a558f8ab-3a5e57c5987mr77149225ab.20.1730472928397;
        Fri, 01 Nov 2024 07:55:28 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45297636sm2550019a12.12.2024.11.01.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:55:27 -0700 (PDT)
Date: Fri, 01 Nov 2024 07:55:27 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Nov 2024 07:55:08 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.11-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-26039e8c-5759-4214-aaaa-765d5736b6a4@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_075531_259743_3B54BC34 
X-CRM114-Status: GOOD (  12.42  )
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
Content-Type: multipart/mixed; boundary="===============7614743097933767828=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7614743097933767828==
Content-Type: text/plain

The following changes since commit cfb10de18538e383dbc4f3ce7f477ce49287ff3d:

  riscv: Fix kernel stack size when KASAN is enabled (2024-10-01 13:08:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc6

for you to fetch changes up to 5f153a692bacc295f213e2c632ca557979fad7be:

  Merge commit 'bf40167d54d5' into fixes (2024-10-25 06:18:43 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.11-rc6

* A fix that avoids accessing the early boot ACPI tables via unsafe
  memory attributes, which can result in incorrect ACPI table data
  appearing.  This can cause all sorts of bad behavior.
* A fix to avoid compiler-insert library calls in the VDSO.
* GCC+Rust builds have been disabled, to avoid issues related to ISA
  string mismatched between the GCC and LLVM Rust implementations.
* The NX flag is now set in the EFI PE/COFF headers, which is necessary
  for some distro GRUB versions to boot images.
* A fix to avoid leaking DT node reference counts on ACPI systems during
  cache info parsing.
* CPU numbers are now printed as unsigned values during hotplug.
* A pair of build fixes for usused macros, which can trigger warnings on
  some configurations.

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: vdso: Prevent the compiler from inserting calls to memset()
      riscv: Do not use fortify in early code

Chunyan Zhang (2):
      riscv: Remove unused GENERATING_ASM_OFFSETS
      riscv: Remove duplicated GET_RM

Conor Dooley (1):
      RISC-V: disallow gcc + rust builds

Heinrich Schuchardt (1):
      riscv: efi: Set NX compat flag in PE/COFF header

Miquel Sabaté Solà (1):
      riscv: Prevent a bad reference count on CPU nodes

Palmer Dabbelt (1):
      Merge commit 'bf40167d54d5' into fixes

WangYuli (1):
      riscv: Use '%u' to format the output of 'cpu'

Yunhui Cui (1):
      RISC-V: ACPI: fix early_ioremap to early_memremap

 Documentation/rust/arch-support.rst  | 2 +-
 arch/riscv/Kconfig                   | 2 +-
 arch/riscv/errata/Makefile           | 6 ++++++
 arch/riscv/kernel/Makefile           | 5 +++++
 arch/riscv/kernel/acpi.c             | 4 ++--
 arch/riscv/kernel/asm-offsets.c      | 2 --
 arch/riscv/kernel/cacheinfo.c        | 7 +++++--
 arch/riscv/kernel/cpu-hotplug.c      | 2 +-
 arch/riscv/kernel/efi-header.S       | 2 +-
 arch/riscv/kernel/pi/Makefile        | 6 +++++-
 arch/riscv/kernel/traps_misaligned.c | 2 --
 arch/riscv/kernel/vdso/Makefile      | 1 +
 12 files changed, 28 insertions(+), 13 deletions(-)


--===============7614743097933767828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7614743097933767828==--
