Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84096EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GcbHyQbMfWnMPBHiO0UCTn4ycQrq0+QupGR3zlxVnh8=; b=vP3
	CzR45tt570yvil0vVHHF/tpErSv8S4gvNifMT0pus+uVaRNQEC2vy3MYUn4kx1U0sUt/PmXDLQMoR
	FyvmuByXvupuW2tZanro/awrOYNDIOCX98ver2UMCwjS/m9Mw0zlFjwvBcZ21WazebkAlD04uslgQ
	FQRXQzZHEyCC53dkw1w5VPvWmnQ5o64PLCqDYqWCJOf6WQSY9tsWcMRzNhcB2zpyaQGmS9MC+x/3g
	3O8tsO09D/CGcttHHke8mfC+fr8fS62kDXlH911wCv9cEWR66eTN2BxEFuuGnRjZgk0vZnSL+MHwD
	A3e93bMwhIp+WxfjILSgC/n8lj7Lhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnjs-005675-05;
	Fri, 07 Jul 2023 15:51:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnjo-00566E-1Y
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 15:51:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b8c81e36c0so9727135ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688745074; x=1691337074;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23cqmaEm1+rrwu4ItjV07c6c0kx8Bev4W0iEP8t8VCI=;
        b=U10ZQQZsDLQHXCqxVXq6yUQsji0YGHTfX2ZCsMxoVeh48lPWeUbidTGBNGS5mLBnZM
         P8XoZ8iExj7zEgD0S4gJ6qC9Jh7CrjjgLa9jQyS3Ud3ywSt7pSprhqrue1PYsxDah8rD
         nCdpomZDXWTJw8aj5BR2l2ufxGSYdCIKVYe0ILFVgNpZszjXevgxmKk6UfnzkfoTnPRQ
         vBcFynlRh1tNP13Ys+8Xu6tBZG2AL2c6iFDJXnJdqeICS20ivKmU4DI6RWDr+yWeIdDR
         Hsx6ydU0HIlF4PPwXaUhgMdRz08/SE2TnHKEzZEvjznxV7f0l1aEFgNUrz9F/CDV0Bll
         5E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688745074; x=1691337074;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23cqmaEm1+rrwu4ItjV07c6c0kx8Bev4W0iEP8t8VCI=;
        b=WYWIZRbBw6jYKdeHl8yLeM4Pp0MAWnBTyISfeIJ49zEMLfwOx7BC9ryYsU3EOpM5bC
         u/Ru9f24zJLNj5XkjrGVEOi9iabGJAfkSZIVidd6zPx2S94f5BTKwqzl07Qdki5FYIzt
         rzhl0suzYc0LP5baRxDhm6jMMoCLFEUfAWIa0G3h6CNreJapbSdRizSAfq49xzHrRP4H
         N8l30boNcAe9tcmdPD+DySXiyfefPXXRVxi/ERxRPWnWJSAIUY2ejlveNtAgc+KnEbbQ
         6XdwzJGLMbFK+JjP9RHdAiG0ofbVnTidf5/JVDN5Yc3FkxjAcjlJNeuCx7WOSTeQXcD3
         V3Gw==
X-Gm-Message-State: ABy/qLbFv2tmAHtLeGg3Bnk0yNj69amOQ7sBjbSqnPhAHAaazGTfgTJ3
	p7d42s0DTmOYLseW37/rT+GzGT09CU58HIu9NjE=
X-Google-Smtp-Source: APBJJlE3eojbqcmQROaqORyMFmvhpy4Zwg4fksxax5v7BA6ga0UBhHagU0OKgJqGLKZAwZtC3fMNGA==
X-Received: by 2002:a17:902:e5c1:b0:1b6:4bbd:c3a3 with SMTP id u1-20020a170902e5c100b001b64bbdc3a3mr4836177plf.52.1688745074445;
        Fri, 07 Jul 2023 08:51:14 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902694600b001b53d3d8f3dsm3415493plt.299.2023.07.07.08.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:51:13 -0700 (PDT)
Date: Fri, 07 Jul 2023 08:51:13 -0700 (PDT)
X-Google-Original-Date: Fri, 07 Jul 2023 08:51:06 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.5 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-4bd23a4e-dd7c-4f62-90c8-804c137c2621@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_085116_744610_6F94A25E 
X-CRM114-Status: GOOD (  14.81  )
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
Content-Type: multipart/mixed; boundary="===============5119210779909306105=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5119210779909306105==
Content-Type: text/plain

merged tag 'riscv-for-linus-6.5-mw1'
The following changes since commit 533925cb760431cb496a8c965cfd765a1a21d37e:

  Merge tag 'riscv-for-linus-6.5-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-06-30 09:37:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-mw2

for you to fetch changes up to e8605e8fdf42642048b7e59141deaf8e4cf06d71:

  Merge patch series "riscv: some CMO alternative related clean up" (2023-07-06 10:32:38 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.5 Merge Window, Part 2

* A bunch of fixes/cleanups from the first part of the merge window,
  mostly related to ACPI and vector as those were large.
* Some documentation improvements, mostly related to the new code.
* The "riscv,isa" DT key is deprecated.
* Support for link-time dead code elimination.
* Support for minor fault registration in userfaultd.
* A handful of cleanups around CMO alternatives.

----------------------------------------------------------------
The batch from yesterday morning didn't make it to linux-next, I just screwed
up and forgot to move them off staging in time.  They're all fairly small and
still pass my tests, but I don't really like to skip linux-next so I figured
I'd say something.

Aside from that, things look fairly sane for what was a pretty large merge
window.  There's one outstanding bug related to mapping symbols that manifests
in some randconfigs, there's a fix out already [1].  That's not a merge window
regression though, so I think it's safe to proceed.  There's also a handful of
the normal merge window all{yes,mod}config issues, they have fixes on the lists
as well.

1: https://lore.kernel.org/all/437ac153-620c-2012-7ce3-66442b505972@infradead.org/

----------------------------------------------------------------
Andy Chiu (3):
      riscv: vector: only enable interrupts in the first-use trap
      riscv: vector: clear V-reg in the first-use trap
      selftests: Test RISC-V Vector's first-use handler

Ben Dooks (1):
      riscv: vdso: include vdso/vsyscall.h for vdso_data

Björn Töpel (1):
      riscv: Discard vector state on syscalls

Conor Dooley (2):
      RISC-V: drop error print from riscv_hartid_to_cpuid()
      dt-bindings: riscv: deprecate riscv,isa

Jisheng Zhang (6):
      riscv: move options to keep entries sorted
      riscv: vmlinux-xip.lds.S: remove .alternative section
      vmlinux.lds.h: use correct .init.data.* section name
      riscv: errata: thead: only set cbom size & noncoherent during boot
      riscv: mm: mark CBO relate initialization funcs as __init
      riscv: mm: mark noncoherent_supported as __ro_after_init

John Hubbard (1):
      mm: riscv: fix an unsafe pte read in huge_pte_alloc()

Marc Zyngier (1):
      risc-v: Fix order of IPI enablement vs RCU startup

Nick Desaulniers (1):
      riscv: disable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for LLD

Palmer Dabbelt (5):
      RISC-V: Document that V registers are clobbered on syscalls
      RISC-V: Fix up some vector state related build failures
      Merge patch series "riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION"
      RISC-V: Document the ISA string parsing rules for ACPI
      Merge patch series "riscv: some CMO alternative related clean up"

Samuel Holland (1):
      riscv: Select HAVE_ARCH_USERFAULTFD_MINOR

Song Shuai (1):
      riscv: Enable ARCH_SUSPEND_POSSIBLE for s2idle

Woody Zhang (1):
      riscv: move memblock_allow_resize() after linear mapping is ready

Zhangjin Wu (1):
      riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION

 Documentation/devicetree/bindings/riscv/cpus.yaml  |  43 ++--
 .../devicetree/bindings/riscv/extensions.yaml      | 250 +++++++++++++++++++++
 Documentation/riscv/acpi.rst                       |  10 +
 Documentation/riscv/index.rst                      |   1 +
 Documentation/riscv/vector.rst                     |   8 +
 arch/riscv/Kconfig                                 |  18 +-
 arch/riscv/errata/thead/errata.c                   |   7 +-
 arch/riscv/include/asm/vector.h                    |  34 +++
 arch/riscv/include/uapi/asm/sigcontext.h           |   4 +
 arch/riscv/kernel/smp.c                            |   1 -
 arch/riscv/kernel/smpboot.c                        |   5 +-
 arch/riscv/kernel/traps.c                          |  10 +-
 arch/riscv/kernel/vdso.c                           |   1 +
 arch/riscv/kernel/vector.c                         |   1 +
 arch/riscv/kernel/vmlinux-xip.lds.S                |   6 -
 arch/riscv/kernel/vmlinux.lds.S                    |   6 +-
 arch/riscv/mm/cacheflush.c                         |   8 +-
 arch/riscv/mm/dma-noncoherent.c                    |   2 +-
 arch/riscv/mm/hugetlbpage.c                        |   6 +-
 arch/riscv/mm/init.c                               |   4 +-
 include/asm-generic/vmlinux.lds.h                  |   2 +-
 tools/testing/selftests/riscv/vector/.gitignore    |   1 +
 tools/testing/selftests/riscv/vector/Makefile      |   6 +-
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 ++++++
 24 files changed, 449 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/extensions.yaml
 create mode 100644 Documentation/riscv/acpi.rst
 create mode 100644 tools/testing/selftests/riscv/vector/v_initval_nolibc.c


--===============5119210779909306105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5119210779909306105==--
