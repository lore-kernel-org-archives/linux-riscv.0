Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEA5C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pT5Qc07uvsZaSRXWpRA+eDdAxC9ER6frSYnnfQk1Zz8=; b=lY9kcA1tErEd2H
	zNAu3dytc0CUbx2XtUTKb+Yt841uic0NR6fkzUsmAWJ2JKXx5wqhl5KtHzA8tNT+57kXnp42URDvl
	sCxcuoSv624GMFqNOJyQAKDzkc80AepR9G3DDyiMIJ/o46s26DCkSEprtS92g6AiDbCmBHtav0rGp
	6p1MyI83SGBj5/WNUuUkr7lgCvscWLH4rfa62wSM9F47m6PjLEsnLJI/HIv+2b900dp182MJouZAZ
	vRHvBzKCHOhnK8s5shcogS77FX8muyLuCsWOHrC6BiYMNHL66qBcEiY34gAW8KC5GRdSk+s4XrjuK
	wIcVE9CfNgSWNigEhsrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyd2-0000000DKtn-3m30;
	Fri, 16 Aug 2024 15:12:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seycO-0000000DKha-0uni
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 15:11:58 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70ea2f25bfaso1700927b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723821114; x=1724425914; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U51afq1GcqS7tRTdX3ZRrcbEDTDfhIP6UB/LI3wW288=;
        b=EKwaSyUPQjjo9BwB9cy6M8K0auxNV0cWpkSD6nt+vsTc/6IiLd9HMBrk3X222UCvMN
         78R4LSST186mBkZO6BYpOVph52AKIyGm0Uk3TM4VB9CR40423l7fjRt5HWCpc/gAShZU
         iwZU7tnNJcoOGFHUPPjFrjGBOAdqG9BOHkNXjlEZ1cfbVBmq8kgmouF5Zk+yPsCOfF/2
         IC1TBoTrwnKpHfxS5E+351vxeojXC8az/fdPf0T04/0Y956i1HRhXx66Q538wh/iGaOK
         +HHxyrZuk1FSI/orGJNlPm+1Jlu9Q6sXppV6RzZ4tcle6oaaQL5tHbsMxByX4mKw7SJI
         wsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723821114; x=1724425914;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U51afq1GcqS7tRTdX3ZRrcbEDTDfhIP6UB/LI3wW288=;
        b=UqyBXGmTjSR+Z5JUeJdQlIyn3QFFxDn6OAkW4lAjfDJUcCHM1cdPtjpc7K4RGod9Un
         Glves0dHayOXEvpWDRZOJdX4MV5KB2s7CEcFcJK/IPjoN/U2GgNX7a3nAwrF2Vsgw6wt
         dRZ5CvxLk5KXTAQqu0a1I56wfzvdvuYCM8cTSRV9Ir8PMmvBp/a0bHn4lUS+S/MxEOzG
         D280tRWWnCo0b5VljY+d5p+/D3dgmnioORn40sjsRDX0Xn+85/qkvDH3N1nBHhYB7lYr
         ZXpIzGtjeLJmPbo+TfV0zGfxoOZOJaJQ5ToXPIy+2OQvtJpwnirdFFH1D79kOCKcaKv/
         6KTA==
X-Gm-Message-State: AOJu0YwrGphRYsh2VP7hKP8Jwn7ulHAzISrFB7C4mirXcJOQeLuhQH9K
	wFAk9rA0VhCrOOurgk9p4upHumKScCTRlhiVB/b+iCNyGwRJ47H6WghP/5ztirbIHez7HGe/UMu
	FWUo=
X-Google-Smtp-Source: AGHT+IEy5yhZVIs6cM7owrtaBFt5rLmWtQZjJHxSSdpXthgYQ3WZ3aHXHDT3905Vpuvu9zWimg0ghA==
X-Received: by 2002:a05:6a20:9d91:b0:1c0:f2d9:a44a with SMTP id adf61e73a8af0-1c904f91ce9mr4384814637.22.1723821113945;
        Fri, 16 Aug 2024 08:11:53 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add6e46sm2823512b3a.17.2024.08.16.08.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:11:53 -0700 (PDT)
Date: Fri, 16 Aug 2024 08:11:53 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Aug 2024 08:11:48 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.11-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-24597fb0-2ef5-4a27-ac81-cd0aa42fdd56@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_081156_525483_78E42DB9 
X-CRM114-Status: GOOD (  11.70  )
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

The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc4

for you to fetch changes up to 32d5f7add080a936e28ab4142bfeea6b06999789:

  Merge patch series "RISC-V: hwprobe: Misaligned scalar perf fix and rename" (2024-08-15 13:12:21 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.11-rc4

* The text patching global icache flush has been reintroduced.
* A fix for the syscall entry code to correctly initialize a0, which
  manifests as a bug in strace.
* XIP kernels now map the entire kernel, which fixes boot under at least
  DEBUG_VIRTUAL=y.
* The acpi_early_node_map initializer now initializes all nodes.
* A fix for a OOB access in the Andes vendor extension probing code.
* A new key for scalar misaligned access performance in hwprobe, which
  correctly treat the values as an enum (as opposed to a bitmap).

----------------------------------------------------------------
That last patch set (for hwprobe) is sort of feature-smelling, but I think it's
sane to call it a fix -- it's kind of a grey area as to whether we even need a
new key, but we're playing it safe as hwprobe is such a compatibility-focused
interface.

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Re-introduce global icache flush in patch_text_XXX()
      riscv: Fix out-of-bounds when accessing Andes per hart vendor extension array

Celeste Liu (1):
      riscv: entry: always initialize regs->a0 to -ENOSYS

Evan Green (2):
      RISC-V: hwprobe: Add MISALIGNED_PERF key
      RISC-V: hwprobe: Add SCALAR to misaligned perf defines

Haibo Xu (1):
      RISC-V: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE

Nam Cao (1):
      riscv: change XIP's kernel_map.size to be size of the entire kernel

Palmer Dabbelt (1):
      Merge patch series "RISC-V: hwprobe: Misaligned scalar perf fix and rename"

 Documentation/arch/riscv/hwprobe.rst       | 36 ++++++++++++++++++------------
 arch/riscv/include/asm/hwprobe.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h      |  6 +++++
 arch/riscv/kernel/acpi_numa.c              |  2 +-
 arch/riscv/kernel/patch.c                  |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c            | 11 ++++-----
 arch/riscv/kernel/traps.c                  |  4 ++--
 arch/riscv/kernel/traps_misaligned.c       |  6 ++---
 arch/riscv/kernel/unaligned_access_speed.c | 12 +++++-----
 arch/riscv/kernel/vendor_extensions.c      |  2 +-
 arch/riscv/mm/init.c                       |  4 ++--
 11 files changed, 54 insertions(+), 35 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
