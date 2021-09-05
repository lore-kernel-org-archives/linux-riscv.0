Return-Path: <SRS0=xDcn=N3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804F6C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Sep 2021 00:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E05560F5E
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Sep 2021 00:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E05560F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/7hBjXD9EuHRpdN1IZdAjKcYow1wuewPXM+bo+4gWjg=; b=oSi4+zCn8WwnVL
	bmPRF4wLAwm1d/vycfHr1Blkdy37krQ1v7X8RD7ysddN3VaotSctB258JOmGiHK6PB1jYnt/5EJ3a
	xLNEr0Hq43caZcttOMPU1q859TuEWN30ZDWdTn6jKjA2FvzG07afbZcBWnzeasc0NAMwgcZjb4FXs
	cxe1Vv3Kg+ksicVhLnOKRV94AS/1eC5YNkj6o3T9CJuBriqR4OtQ7+c/HP/mor/7wl4EcAhfFeeEb
	FwmVQqINj2Zjf7mDQvQPQ5FDd/CxWOWBc/4pgOdsBNSV7MAg7k2wVXklW6kIwTV+NGajt1nb/FcCH
	Gg6Vtd5wR3MO1MQvnf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMfpM-00Ex7i-4q; Sun, 05 Sep 2021 00:16:04 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMfpI-00Ex6e-P1
 for linux-riscv@lists.infradead.org; Sun, 05 Sep 2021 00:16:02 +0000
Received: by mail-qk1-x732.google.com with SMTP id m21so3124179qkm.13
 for <linux-riscv@lists.infradead.org>; Sat, 04 Sep 2021 17:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=B7vrOzHTc7yswPYkjLCgs5QJeJupsuPGF2q30Ah91fE=;
 b=lCrgJMk9nJK5b0g/FhOQkaToamxgpx9zp57NXTax9NDBYn0IEJgIdkeYg5mboezK2p
 p7dW5jwB0tw6/eJDDxiyLoz7a5KR3jJwfE1wfiHFOr9l0WF1O54XqO3d5Xn8KiK6G4Af
 9QZ7etsIu3IG/FqoWwSQA90PnlQWIhqmKxF4hR8dLgZ6aX7pW4Yy/VlcUfcNp6GpTB8s
 wbckXO1g3OQiAGt/wtPB28D6Zc21rybFVT4mDgXT8zOyukzp9XsPOcE5X2Mm5GyIiULg
 SY6z5sRUTrp082kE8sOy5zL4s5nnDuBNhYD1ubx2kdhvLasYanhOgsl/vR3IA4bYey8y
 kNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=B7vrOzHTc7yswPYkjLCgs5QJeJupsuPGF2q30Ah91fE=;
 b=LBJfvfqIMqYiHq78epRJWyAZD3tOJB2rB32sl+J10GrsbJgaeTeu6mrjyO9RnbThBL
 tCsFVSNurZY2hHXD/f2oLPGZIECOStvMZVuZamBnXgXQQxDdNj75x5IRpEifAUoPmjnq
 Ahx1hjyQRCQ52u7xARObxT0MHOA6RARa5lodFSvfUB1Vx9EnDMZzSdCpCePAACkbm8it
 hJRos3QnjhZLvhSrfpN8wNWhTwJU92QyEeGAw/RrtzS/b6HmoyuWXQsBm4kZmE0WbtiH
 B/WyO6WLK/bfqrcAe8t5gv/FduYIb7sfMXikY9X66Eet1/7gBxbQCDbcbM2ts+kQJwvt
 gxNQ==
X-Gm-Message-State: AOAM533oKpu+8OVPPMh6m9aIESG/ZC0ayJHEDKBQ+V7Zd+94pxmY1bQL
 fpTqFSwMyc6wG9xPDHx67oK8c4e38zeHdHUP
X-Google-Smtp-Source: ABdhPJxjhANGjcxkOv3IRKoqKO2Q3WJjSJ1xyrp8NOmE+CMw66PXIQrSy/cLrtNCpVjp6/ba3eortQ==
X-Received: by 2002:a37:6849:: with SMTP id d70mr5145477qkc.267.1630800958389; 
 Sat, 04 Sep 2021 17:15:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j18sm2850462qkl.12.2021.09.04.17.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 17:15:57 -0700 (PDT)
Date: Sat, 04 Sep 2021 17:15:57 -0700 (PDT)
X-Google-Original-Date: Sat, 04 Sep 2021 17:15:51 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.15 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e13c978a-0771-4577-9adc-3a4b807fbfc2@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_171600_931948_EC7CF790 
X-CRM114-Status: GOOD (  15.75  )
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

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.15-mw0

for you to fetch changes up to c24a19674258dcc968a198d8e0d4717c8f27700c:

  riscv: add support for hugepage migration (2021-08-26 22:01:22 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.15 Merge Window, Part 1

* Support for PC-relative instructions (auipc and branches) in kprobes.
* Support for forced IRQ threading.
* Support for the hlt/nohlt kernel command line options, via the generic
  idle loop.
* Support for showing the edge/level triggered behavior of interrupts in
  /proc/interrupts.
* A handful of cleanups to our address mapping mechanisms.
* Support for allocating gigantic hugepages via CMA.
* Support for the undefined behavior sanitizer.
* A handful of cleanups to the VDSO that allow the kernel to build with
  LLD.
* Support for hugepage migration.

----------------------------------------------------------------
There are a handful of patches that I'm still hoping to pick up for this merge
window, but I thoughti t would be best to get these out now rather than
waiting.

----------------------------------------------------------------
Alexandre Ghiti (6):
      riscv: Optimize kernel virtual address conversion macro
      riscv: Introduce va_kernel_pa_offset for 32-bit kernel
      riscv: Get rid of map_size parameter to create_kernel_page_table
      riscv: Use __maybe_unused instead of #ifdefs around variable declarations
      riscv: Simplify BUILTIN_DTB device tree mapping handling
      riscv: Move early fdt mapping creation in its own function

Chen Lifu (2):
      riscv: kprobes: implement the auipc instruction
      riscv: kprobes: implement the branch instructions

Chen Wandun (1):
      riscv: add support for hugepage migration

Drew Fustini (1):
      dt-bindings: riscv: add starfive jh7100 bindings

Jason Wang (1):
      riscv: use strscpy to replace strlcpy

Jisheng Zhang (2):
      riscv: Keep the riscv Kconfig selects sorted
      riscv: Enable Undefined Behavior Sanitizer UBSAN

Kefeng Wang (4):
      riscv: Allow forced irq threading
      riscv: Enable idle generic idle loop
      riscv: Enable GENERIC_IRQ_SHOW_LEVEL
      riscv: Support allocating gigantic hugepages using CMA

Kenneth Lee (1):
      riscv: fix the global name pfn_base confliction error

Palmer Dabbelt (1):
      RISC-V: Fix VDSO build for !MMU

Saleem Abdulrasool (1):
      riscv: explicitly use symbol offsets for VDSO

Tong Tiangen (1):
      riscv: Implement thread_struct whitelist for hardened usercopy

 .../devicetree/bindings/riscv/starfive.yaml        |  27 +++++
 arch/riscv/Kconfig                                 |  12 +-
 arch/riscv/Makefile                                |   6 +
 arch/riscv/include/asm/page.h                      |  21 +---
 arch/riscv/include/asm/processor.h                 |   8 ++
 arch/riscv/include/asm/vdso.h                      |  23 ++--
 arch/riscv/kernel/probes/decode-insn.c             |   5 +-
 arch/riscv/kernel/probes/simulate-insn.c           | 112 ++++++++++++++++++
 arch/riscv/kernel/setup.c                          |   2 +-
 arch/riscv/kernel/vdso/Makefile                    |  26 ++---
 arch/riscv/kernel/vdso/gen_vdso_offsets.sh         |   5 +
 arch/riscv/kernel/vdso/so2s.sh                     |   6 -
 arch/riscv/mm/init.c                               | 130 +++++++++------------
 13 files changed, 256 insertions(+), 127 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
 create mode 100755 arch/riscv/kernel/vdso/gen_vdso_offsets.sh
 delete mode 100755 arch/riscv/kernel/vdso/so2s.sh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
