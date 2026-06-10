Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD87CD8CB2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nnLum260c5fh1KyThFpmWD9NcBrP8obqgKa/St/1xqQ=; b=yhPPz1mdXpezq1
	usPuCz4Prfvn1T05sofH9EurpXwlCOphKNBcRotZoVlz8PGsI28dk50xpHzvSMHwg2Ktx0gyEU7cQ
	qZ5OMh/dDR3mxF05dXsKwD6A/gU+djorZBD1XtQVQHjUf61KRo/u/d5v6EFWzdheusq+DTtmDUu1W
	KUf4sb5XkiptuZ8KEUaWz/GlJD+5Gp5m/0tffXMqUuAtkN6xsFh4RjPc7lXMa/bur3TvaGcOHPXEU
	fwjjco4hZcA5jIYZuj55gQbObbJcdw76iWAXZPTlzueByO2gIE07a7Tavt3yVfWQ37WAHPeHOy5nS
	jD6xkS61QdlG3lSwGQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJNl-00000007oay-3T4q;
	Wed, 10 Jun 2026 13:54:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJNj-00000007oar-3sjh
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 13:54:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0848F600AB;
	Wed, 10 Jun 2026 13:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB13E1F00893;
	Wed, 10 Jun 2026 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781099650;
	bh=8QSHoW2zLX0oNe4UWCDvapCeq4OUxvmDv1wcVHhGoek=;
	h=Date:From:To:cc:Subject;
	b=Uan/sbO8x0C1+2lqsqaHN4aKSX1bf0PaJ2ZWRFkzGezd3XpLAxirWtDb0b29ggMyd
	 jQoFLKhqAgbIZvHpl7BN5/Pyy+yP7j0u1W/eaV1rQLXiEwFcXSqy+3CbNbACKWNzii
	 iXzW/GrnmGDkPr1dL9SLrid+10qzBkH8BHyhw7cgJJSgBmk0LBv84emFHKwmFJVAPB
	 m/9bVXTstBSdbOgk2nX70GEADz+VkW3uof2I72u30z63gYcppEsrOE9mNaXLDijowX
	 Im7aIPXn6ZOrIONY50M125XTPbZXq0NPIoRBGHgeES+E2bKL5QHEjeMY1CQ3TmUj5P
	 j8JqHkYZLuFHQ==
Date: Wed, 10 Jun 2026 07:54:04 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.1-rc8
Message-ID: <740336ea-a076-86e0-0fad-2264f0448da2@kernel.org>
MIME-Version: 1.0
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

Linus,

Please pull these fixes for late v7.1-rc.  The most important fix
is for a performance regression in the RISC-V-specific 
implementation of the checksumming code, related
to when RISC-V systems probe unaligned access performance during boot.  
There is another fix to return -EinVaL when invalid flags are
passed to the CFI landing pad control prctl(); no existing software should 
rely on the previously-incorrect behavior.  Finally there is a fix for a 
warning when dumping core, also CFI-related.   

thanks,

- Paul


The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linux-7.1-rc8

for you to fetch changes up to 15b4155138505669d3d43d7692459ee8ea2a86e7:

  riscv: cfi: reject unknown flags in PR_SET_CFI (2026-06-06 20:17:05 -0600)

----------------------------------------------------------------
RISC-V updates for v7.1-rc8

- Fix the implementation of the CFI branch landing pad control
  prctl()s to return -EINVAL if unknown control bits are set, rather
  than silently ignoring the request; and add a kselftest for this
  case

- Fix unaligned access performance testing to happen earlier in boot,
  which fixes a performance regression in the lib/checksum code

- Fix a binfmt_elf warning when dumping core (due to missing
  .core_note_name for CFI registers)

----------------------------------------------------------------
Andreas Schwab (1):
      riscv/ptrace: Use USER_REGSET_NOTE_TYPE for REGSET_CFI

Nam Cao (1):
      riscv: Fix fast_unaligned_access_speed_key not getting initialized

Richard Patel (1):
      riscv: cfi: reject unknown flags in PR_SET_CFI

 arch/riscv/include/asm/usercfi.h             |  1 +
 arch/riscv/kernel/ptrace.c                   |  2 +-
 arch/riscv/kernel/unaligned_access_speed.c   | 15 ++++-----------
 arch/riscv/kernel/usercfi.c                  |  3 +++
 tools/testing/selftests/riscv/cfi/cfitests.c |  6 ++++++
 5 files changed, 15 insertions(+), 12 deletions(-)

vmlinux size differences in bytes (from 5200f5f493f7):
text  data  bss   dec  hex  filename                             
 -12  +120    .  +108  +6c  vmlinux.defconfig.gcc-15             
  -8   +88    .   +80  +50  vmlinux.nosmp_defconfig.gcc-15       
 -20   +64    .   +44  +2c  vmlinux.rv32_defconfig.gcc-15        
 -20   +32    .   +12   +c  vmlinux.rv32_nosmp_defconfig.gcc-15  
 -40   +56    .   +16  +10  vmlinux.nommu_virt_defconfig.gcc-15  
 -20   +24    .    +4   +4  vmlinux.defconfig.clang-20           
  -8   +24    .   +16  +10  vmlinux.nosmp_defconfig.clang-20     
 -36   +64    .   +28  +1c  vmlinux.rv32_defconfig.clang-20      
  -8   +32    .   +24  +18  vmlinux.rv32_nosmp_defconfig.clang-20
 -28    -8    .   -36  -24  vmlinux.nommu_virt_defconfig.clang-20
 -28   +56    .   +28  +1c  vmlinux.defconfig.clang-17           
 -20   +88    .   +68  +44  vmlinux.nosmp_defconfig.clang-17     
 -24  +128    .  +104  +68  vmlinux.rv32_defconfig.clang-17      
 -20  +128    .  +108  +6c  vmlinux.rv32_nosmp_defconfig.clang-17
 -36   +56    .   +20  +14  vmlinux.nommu_virt_defconfig.clang-17
 -16   +56    .   +40  +28  vmlinux.defconfig.gcc-11             
 -24   +56    .   +32  +20  vmlinux.nosmp_defconfig.gcc-11       
 -20   +64    .   +44  +2c  vmlinux.rv32_defconfig.gcc-11        
 -24   +96    .   +72  +48  vmlinux.rv32_nosmp_defconfig.gcc-11  
 -44  +248    .  +204  +cc  vmlinux.nommu_virt_defconfig.gcc-11  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
