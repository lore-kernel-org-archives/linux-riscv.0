Return-Path: <SRS0=O4lQ=XL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4E3C49ED7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 15:20:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDD3F206C2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 15:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzi3fgOr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="B0liChI3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDD3F206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4uIPjH1aFPGmxNTGd91Gr5PAnHOE8lbCHvZ1TZRpqHM=; b=tzi3fgOrKNNSng
	WEi961kEAO5VPz/KkXPWgd/EzUd9ekr+AYNiPuFBhXZ75qJ9NZ3oz8ic4yGc4noSUHoY/moiH0EXG
	CtpTrsoQnHWK5LBDyS/rzpHqR9T6ISxkATRIIRWNi2NbqOKRtF2dAwOLzxS3j2KluDAR/YcIIiXi4
	49PaYYTUxJF4SPoYJqgwaHNGOBJkdyku/e2aqAE7QWLFPYuEj/j6Bm91hP/mlLIgqwfv2cJVSYdLg
	vjgkUdMUya9xLQUxxSC8lds7NGZOY2x5ORTGSoey+1Lildqo2fLv5mJPNW2Dr/p9FUSzb3tPfmuns
	jIPqPtqs5C/EW7TCz6Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9snu-0006Ht-Qt; Mon, 16 Sep 2019 15:20:38 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9sns-0006HY-2M
 for linux-riscv@lists.infradead.org; Mon, 16 Sep 2019 15:20:37 +0000
Received: by mail-wm1-x342.google.com with SMTP id r17so272011wme.0
 for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2019 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=awtTXhQYInDaRNLRQOmqRN3PH/3AaVOJdo9EGYwStAM=;
 b=B0liChI3Ql+DmGCvZBfzmpDJj+Qihyzh98bjutCItonoa5oqLJw23XygfkfTsCx7JL
 sp89s6HevKYMWlSHSNemK+JIyDUP/nIcv31iVttcpHvyyrh+95UMwE2gXaK3mJKKoOlz
 otKxb0u/IkaDekX548JJe7ifokxY//baXBn7VBb6s8eFuKsY9BTfqH84D1NU6nJrK+r0
 4IkjTJU0N0mmtkXRnE5IvC42fI5sqhFNq5J0J8l7VjQFsJi+Nz/8M7RpziWZmclvhWWS
 zRz6FWnSbUgdketzRUIk9Bsw4P4O8aAJdqXVJ17AUVtuwmc+QmdeiSioNYIBXfvyC/HS
 PaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=awtTXhQYInDaRNLRQOmqRN3PH/3AaVOJdo9EGYwStAM=;
 b=bmn7sljXrLAUwRxpMha1FbhQeanBOz5ySLoNZITgCGJLcHlzeKl3yeFOXQJbZZcoNc
 FmBaPASEjWZGUPGt7uXo6dZPYodB2sLfyS1XzN/NoGrj9rKNXmxj8qt+Oi5mtBP9o7lT
 Wb+CsU1Ucl4SOkWcjIfxlAxUlTbC7MA1MgqaTODy2z8S1HMBtrimFKCgwzEPGTDcY0tX
 3KCjvAdoH9pYQ2Af2jXAlUYgfkCxlcNXCcPYNOk6dMFQy56R979zfZK7BM1VandgaDcX
 DWzFNrb3phG2PauMisW+5ZYxxm7oIGgtGK/eaGr7RPb5mzn5upyttlhCqHwrG8mJbdvw
 EBlA==
X-Gm-Message-State: APjAAAXfmUBXmForv28nbcWGzSHthytYaPc44OnZEqoXfekQGIl8fVHC
 WZ2ez1XIwMavNGhhicGjVPPVZA==
X-Google-Smtp-Source: APXvYqzv55te+vVQ6/L27I0bUkIIAv1ZlIHl8FtByVqPk+kpTCmGndZf6Ga2ciCjww9DelwyTmxImA==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr50330wmj.127.1568647234465;
 Mon, 16 Sep 2019 08:20:34 -0700 (PDT)
Received: from localhost ([195.200.173.126])
 by smtp.gmail.com with ESMTPSA id b194sm122836wmg.46.2019.09.16.08.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 08:20:33 -0700 (PDT)
Date: Mon, 16 Sep 2019 08:20:33 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: torvalds@linux-foundation.org
Subject: [GIT PULL] RISC-V updates for v5.4-rc1
Message-ID: <alpine.DEB.2.21.9999.1909160819190.11980@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_082036_174664_9295BF06 
X-CRM114-Status: GOOD (  13.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Linus,

The following changes since commit a256f2e329df0773022d28df2c3d206b9aaf1e61:

  RISC-V: Fix FIXMAP area corruption on RV32 systems (2019-08-28 15:30:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv/for-v5.4-rc1

for you to fetch changes up to 9ce06497c2722a0f9109e4cc3ce35b7a69617886:

  irqchip/sifive-plic: set max threshold for ignored handlers (2019-09-05 01:59:55 -0700)

----------------------------------------------------------------
RISC-V updates for v5.4-rc1

Add the following new features:

- Generic CPU topology description support for DT-based platforms,
  including ARM64, ARM and RISC-V.

- Sparsemem support

- Perf callchain support

- SiFive PLIC irqchip modifications, in preparation for M-mode Linux

and clean up the code base:

- Clean up chip-specific register (CSR) manipulation code, IPIs, TLB
  flushing, and the RISC-V CPU-local timer code

- Kbuild cleanup from one of the Kbuild maintainers

----------------------------------------------------------------
Atish Patra (4):
      dt-binding: cpu-topology: Move cpu-map to a common binding.
      cpu-topology: Move cpu topology code to common code.
      arm: Use common cpu_topology structure and functions.
      RISC-V: Parse cpu topology during boot.

Bin Meng (1):
      riscv: Using CSR numbers to access CSRs

Christoph Hellwig (7):
      riscv: refactor the IPI code
      riscv: cleanup send_ipi_mask
      riscv: optimize send_ipi_single
      riscv: cleanup riscv_cpuid_to_hartid_mask
      riscv: don't use the rdtime(h) pseudo-instructions
      riscv: move the TLB flush logic out of line
      irqchip/sifive-plic: set max threshold for ignored handlers

Logan Gunthorpe (1):
      RISC-V: Implement sparsemem

Mao Han (3):
      riscv: Add perf callchain support
      riscv: Add support for perf registers sampling
      riscv: Add support for libdw

Masahiro Yamada (1):
      riscv: add arch/riscv/Kbuild

Paul Walmsley (1):
      Merge tag 'common/for-v5.4-rc1/cpu-topology' into for-v5.4-rc1-branch

Sudeep Holla (3):
      Documentation: DT: arm: add support for sockets defining package boundaries
      base: arch_topology: update Kconfig help description
      MAINTAINERS: Add an entry for generic architecture topology

 .../{arm/topology.txt => cpu/cpu-topology.txt}     | 256 +++++++++++------
 MAINTAINERS                                        |   7 +
 arch/arm/include/asm/topology.h                    |  20 --
 arch/arm/kernel/topology.c                         |  60 +---
 arch/arm64/include/asm/topology.h                  |  23 --
 arch/arm64/kernel/topology.c                       | 303 +--------------------
 arch/riscv/Kbuild                                  |   3 +
 arch/riscv/Kconfig                                 |  24 ++
 arch/riscv/Makefile                                |   5 +-
 arch/riscv/include/asm/page.h                      |   2 +
 arch/riscv/include/asm/pgtable.h                   |  13 +
 arch/riscv/include/asm/smp.h                       |   6 -
 arch/riscv/include/asm/sparsemem.h                 |  11 +
 arch/riscv/include/asm/timex.h                     |  44 ++-
 arch/riscv/include/asm/tlbflush.h                  |  38 +--
 arch/riscv/include/uapi/asm/perf_regs.h            |  42 +++
 arch/riscv/kernel/Makefile                         |   4 +-
 arch/riscv/kernel/entry.S                          |   6 +-
 arch/riscv/kernel/fpu.S                            |   8 +-
 arch/riscv/kernel/head.S                           |   2 +-
 arch/riscv/kernel/perf_callchain.c                 |  94 +++++++
 arch/riscv/kernel/perf_regs.c                      |  44 +++
 arch/riscv/kernel/smp.c                            |  60 ++--
 arch/riscv/kernel/smpboot.c                        |   3 +
 arch/riscv/kernel/stacktrace.c                     |   4 +-
 arch/riscv/lib/uaccess.S                           |  12 +-
 arch/riscv/mm/Makefile                             |   3 +
 arch/riscv/mm/cacheflush.c                         |   1 -
 arch/riscv/mm/context.c                            |   7 +-
 arch/riscv/mm/init.c                               |  12 +-
 arch/riscv/mm/tlbflush.c                           |  35 +++
 drivers/base/Kconfig                               |   2 +-
 drivers/base/arch_topology.c                       | 298 ++++++++++++++++++++
 drivers/clocksource/timer-riscv.c                  |  17 +-
 drivers/irqchip/irq-sifive-plic.c                  |  12 +-
 include/linux/arch_topology.h                      |  26 ++
 include/linux/topology.h                           |   1 +
 tools/arch/riscv/include/uapi/asm/perf_regs.h      |  42 +++
 tools/perf/Makefile.config                         |   6 +-
 tools/perf/arch/riscv/Build                        |   1 +
 tools/perf/arch/riscv/Makefile                     |   4 +
 tools/perf/arch/riscv/include/perf_regs.h          |  96 +++++++
 tools/perf/arch/riscv/util/Build                   |   2 +
 tools/perf/arch/riscv/util/dwarf-regs.c            |  72 +++++
 tools/perf/arch/riscv/util/unwind-libdw.c          |  57 ++++
 45 files changed, 1176 insertions(+), 612 deletions(-)
 rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (66%)
 create mode 100644 arch/riscv/Kbuild
 create mode 100644 arch/riscv/include/asm/sparsemem.h
 create mode 100644 arch/riscv/include/uapi/asm/perf_regs.h
 create mode 100644 arch/riscv/kernel/perf_callchain.c
 create mode 100644 arch/riscv/kernel/perf_regs.c
 create mode 100644 arch/riscv/mm/tlbflush.c
 create mode 100644 tools/arch/riscv/include/uapi/asm/perf_regs.h
 create mode 100644 tools/perf/arch/riscv/Build
 create mode 100644 tools/perf/arch/riscv/Makefile
 create mode 100644 tools/perf/arch/riscv/include/perf_regs.h
 create mode 100644 tools/perf/arch/riscv/util/Build
 create mode 100644 tools/perf/arch/riscv/util/dwarf-regs.c
 create mode 100644 tools/perf/arch/riscv/util/unwind-libdw.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
