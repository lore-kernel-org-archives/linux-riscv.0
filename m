Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193B7C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 15:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SgM0IeQDz+F2MP7aRdMLVs8LfVW6qUGhXI7MPG6CLhU=; b=p4imc9dvr3gk4K
	Q5LDCbJy9uUiYxdz0dVwYIsjr6G/kSiJK0ALf6sMI0gGa7lnZZiksSgexPUqlF5NyQcqVxnxfHyzC
	uILzh+hAAtfAns/23dqbB1RL/ORMxai/mqqOgZOAhdLC2QiV/6SsSrurmIlKwCH1niv05/lsm0bcn
	SgJTYB7YMiDbLMWn3gBF38VL6vvdhQjRKWq7hkA1X+2EoiC7Wo53IdWT6LNVq1Sd7QmZlg+sdr3GK
	/CG9hLJyLhF77gY3kChZRXjhOBKJukJ88lLMZTBZY7qS2EgIcjs60FZhT9ti7GXTdW1isIK3JAQBy
	POmKrk3fu8i1Lmb38b9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZuSg-00000009KTM-1WxW;
	Fri, 02 Aug 2024 15:44:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZuSa-00000009KRV-3UHj
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 15:44:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fd9e6189d5so67676115ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722613491; x=1723218291; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0U1KOccehzmg9c81F1T02tHdqMUqqEFdlWexUs39Wg=;
        b=iW+6NSpF1ZmWoDVGK1qM/na9KkB3qIId/okSAidmMTj6kDScBTJRWJ8N10rAUrsPKt
         lbg0K9RLhsOoNfs+v5JuL/QipRXsNBbvpyeUal9IepyPmbrocUfEuJe6yCn2SOHgTSdm
         xvd/ZUYsNTvI2s1iyXJQeeTjumckWIHwx2AkvOPUUyoEpxhMARf1q/CztqHGzEdfWNaJ
         jHVli4xEPBNjr0rSM9AEd8MNiBFcdsbsKSXS1eCbMJ6Wfk6d6AQm7/YaSW5jfjCJjerB
         dTOv9NoG8D/tgDBVvEsYUt/ORMcblCjE7+jHL3k8LgWcDzt2H5PmWbO3gsEXSnaXpOjq
         p0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722613491; x=1723218291;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0U1KOccehzmg9c81F1T02tHdqMUqqEFdlWexUs39Wg=;
        b=vS2JMI1tqjVZV1jh7TkCbCx8UgDWr9B3BTCltpiYfSVpERKsZlZ5oeMq9hyRMHSqin
         Sc+tXTtijAocn/IcAekzwo8BdeWoGKMhPgkbGPWKo1/8FULV5tDce1T1rsTODExwMJOS
         Fbvn34gvPy3XIHhq0f/A4lQIQFXIv0f6iOUT1l8iKpuOumBz6BF5oP/LAFnOXqK8USW6
         a01jemCTsN2yjxxJrhk/ZRsowBQPKCXnl6xra3Wa6fXRREBHOiEFt9G1XS5m17bSpPVo
         ZXKe4pK/ucQzl1Mk9RLuOEjx25d9+1vaiAvaBjFqIrcZOa7WY8fnjZ1MQVTvJVxHv3qO
         2IVw==
X-Gm-Message-State: AOJu0YzJKzX9JSBAhgBEF1qtsAfTaNGPI5+vNAhFRdFAmvGKp+AliMIk
	N171YBPNI9BDIV5WhE0NkQ0mvoh6m22apf+mhDEG0G3XL0KM2/JVx31vq2Zo6DIdFVqlSfJr3ue
	5
X-Google-Smtp-Source: AGHT+IFctPtOfBeOT+7DbRwz3VPOEeBuaua5STZcnvm6v4ibpnesppc5XHD7NFFzRv80ZWXrE5jXvw==
X-Received: by 2002:a17:902:ceca:b0:1ff:629e:221a with SMTP id d9443c01a7336-1ff629e24f2mr14018755ad.4.1722613490688;
        Fri, 02 Aug 2024 08:44:50 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f19d0csm18750255ad.2.2024.08.02.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:44:50 -0700 (PDT)
Date: Fri, 02 Aug 2024 08:44:50 -0700 (PDT)
X-Google-Original-Date: Fri, 02 Aug 2024 08:44:38 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.11-rc2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-43770bb1-d5ee-499f-8925-ade7d59c6f38@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_084452_899114_C35D74C9 
X-CRM114-Status: UNSURE (   9.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.11-rc2

for you to fetch changes up to 3b6564427aea83b7a35a15ca278291d50a1edcfc:

  riscv: Fix linear mapping checks for non-contiguous memory regions (2024-08-01 11:46:09 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.11-rc2

* A fix to avoid dropping some of the internal pseudo-extensions, which
  breaks *envcfg dependency parsing.
* The kernel entry address is now aligned in purgatory, which avoids a
  misaligned load that can lead to crash on systems that don't support
  misaligned accesses early in boot.
* The FW_SFENCE_VMA_RECEIVED perf event was duplicated in a handful of
  perf JSON configurations, one of them been updated to
  FW_SFENCE_VMA_ASID_SENT.
* The starfive cache driver is now restricted to 64-bit systems, as it
  isn't 32-bit clean.
* A fix for to avoid aliasing legacy-mode perf counters with software
  perf counters.
* VM_FAULT_SIGSEGV is now handled in the page fault code.
* A fix for stalls during CPU hotplug due to IPIs being disabled.
* A fix for memblock bounds checking.  This manifests as a crash on
  systems with discontinuous memory maps that have regions that don't
  fit in the linear map.

----------------------------------------------------------------
Daniel Maslowski (1):
      riscv/purgatory: align riscv_kernel_entry

Eric Lin (1):
      perf arch events: Fix duplicate RISC-V SBI firmware event name

Nick Hu (1):
      RISC-V: Enable the IPI before workqueue_online_cpu()

Palmer Dabbelt (1):
      cache: StarFive: Require a 64-bit system

Samuel Holland (1):
      riscv: cpufeature: Do not drop Linux-internal extensions

Shifrin Dmitry (1):
      perf: riscv: Fix selecting counters in legacy mode

Stuart Menefy (1):
      riscv: Fix linear mapping checks for non-contiguous memory regions

Zhe Qiao (1):
      riscv/mm: Add handling for VM_FAULT_SIGSEGV in mm_fault_error()

 arch/riscv/kernel/cpufeature.c                          | 14 ++++++--------
 arch/riscv/kernel/sbi-ipi.c                             |  2 +-
 arch/riscv/mm/fault.c                                   | 17 +++++++++--------
 arch/riscv/mm/init.c                                    | 15 +++++++++++----
 arch/riscv/purgatory/entry.S                            |  2 ++
 drivers/cache/Kconfig                                   |  1 +
 drivers/perf/riscv_pmu_sbi.c                            |  2 +-
 include/linux/cpuhotplug.h                              |  1 +
 .../perf/pmu-events/arch/riscv/andes/ax45/firmware.json |  2 +-
 .../perf/pmu-events/arch/riscv/riscv-sbi-firmware.json  |  2 +-
 .../perf/pmu-events/arch/riscv/sifive/u74/firmware.json |  2 +-
 .../arch/riscv/starfive/dubhe-80/firmware.json          |  2 +-
 .../arch/riscv/thead/c900-legacy/firmware.json          |  2 +-
 13 files changed, 37 insertions(+), 27 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
