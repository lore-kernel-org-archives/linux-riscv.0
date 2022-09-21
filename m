Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EABDC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v27QrMpOusijG8LiFfsMqCx31WfwVw+0mJXyh/R9KUg=; b=ELlWxJP4/+wz7y
	HQMDLdqNUHm8TBn+QfxGiY619pUfqFu7IdvyiZnExks05SzApBjhAvxx+M2HzC/AtF3fG9dLlJI5V
	FivWZUKTDBXEtmXVPyN1Pb+c67k59OF4vvelTC2tXdq1F8qfysF6fSL+I1NpJSSM6IjAxmFGakhE9
	B36kETgOL6WoNi5MOw4/A2eWnHiWXO4lmBBBr2G0ammkbvfpNKqmpFSiD0YYiqDPRAAQ3OLuEdpO5
	yIsp3+HfTpvrpSe8Ok3TdNsBXE29XmWPHf+eHrRpGv+xcF0gSC6KBqFCgaj03h8ohshDJYQVIzbYy
	/vYWNLVM2Z0k9xGWh2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6qh-00CdXH-GI; Wed, 21 Sep 2022 21:01:39 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gH-00CUSp-Dj
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:46:54 +0000
Received: by mail-pj1-x102f.google.com with SMTP id q3so7538811pjg.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=J9b9l3yY2m8G7A07w4tzSkwufsM0I3mO38JP9h/2N5I=;
        b=qT3rG4+UY6ZHueV4pwdtaLQ5y5MOqL1qfXgYw6Fdk748lJ5EwZIT7elmx6WouvRTKs
         dAajgCe7AXjYlc63ZN1THzdNvS6oQK1U44m9RRm5IifyAlOahrgDNZCH/MJ3fSoWSykO
         coPsK7sLIYG4JI26CDvX6hln0m2PzBx5OR3rgc5epoC9ELrxwLQvlt20rKsk/5eOTM2m
         AP7fv01CnFTto6+d6moX3VQi5zESmFecDC4YfdXL8r/EKrdyOaroy5t2JNllsnOnF6FV
         oA5MNMwMom0ls65rNq/DwoGCDqLDTTwPjqyy57Q7J7AbbNJW5azvv/Ev7jCZZNqRqPjo
         hf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=J9b9l3yY2m8G7A07w4tzSkwufsM0I3mO38JP9h/2N5I=;
        b=n+t/kMu13V4BzcLarSQ5fZoY2r2tKpceh30sJ1L2tqPsBwaBCAg9ygeOacE2ccG8rM
         nJVbwBqkUYnNk9P2nrwtqp7UwuPkTDEaNnohxT37E3TbpGuyup2BzllEts+xmDwNJcFg
         /GwhygaoSfhbBj0UazICN9dn7BBXElijCI3EH7ACxJGOLr8MUdVMRXhxZEyoD0q9siFp
         UNLcLMEqU0RW3nn027RO9mjmz1Y7ZgeCWCPUHsP+vKcc5ry4u5UZLQhJeFJOuNyiaGUv
         Shmx6dTZ2kEFrQ7ep+VFkuBSoJzegIC2UH66nAaCaIKToqcD/akP8T3Yd1Mtc08KlQ2E
         rUyQ==
X-Gm-Message-State: ACrzQf2scgw9EgyUThe/Xb/UojAqVZPex+QTCjBHdIwz+5rueXVyKnwy
	G1c5SwDg9TfrLtN4uXMticlD/NiapmNOAg==
X-Google-Smtp-Source: AMsMyM5Q1ud1GqAUFfaSMp8EZvAG6pOyphxNIZ+JSc9R4ZHjsLnnuEYQeXL0g0hwMz3XO54QzCnxTg==
X-Received: by 2002:a17:90b:1d8c:b0:202:c689:fa33 with SMTP id pf12-20020a17090b1d8c00b00202c689fa33mr11379236pjb.58.1663789602169;
        Wed, 21 Sep 2022 12:46:42 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:41 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Chris Stillson <stillson@rivosinc.com>
Subject: [PATCH 00/17] Prctl to enable vector commands, previous vector patches rebased
Date: Wed, 21 Sep 2022 12:46:12 -0700
Message-Id: <20220921194629.1480202-1-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124649_484368_9B89E7EF 
X-CRM114-Status: GOOD (  13.55  )
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

This patch adds a prctl to enable, disable, or query whether vectors are enabled or not.  This is to allow a process to "opt out" of the overhead incurred by using vectors. Because this is build on top of an existing set of patches to work with vectors, they have been rebased to Linux 6.0-rc1.  


Chris Stillson (1):
  riscv: prctl to enable vector commands

Greentime Hu (9):
  riscv: Add new csr defines related to vector extension
  riscv: Add has_vector/riscv_vsize to save vector features.
  riscv: Add vector struct and assembler definitions
  riscv: Add task switch support for vector
  riscv: Add ptrace vector support
  riscv: Add sigcontext save/restore for vector
  riscv: Add support for kernel mode vector
  riscv: Add vector extension XOR implementation
  riscv: Fix a kernel panic issue if $s2 is set to a specific value
    before entering Linux

Guo Ren (4):
  riscv: Rename __switch_to_aux -> fpu
  riscv: Extending cpufeature.c to detect V-extension
  riscv: Add vector feature to compile
  riscv: Reset vector register

Vincent Chen (3):
  riscv: signal: Report signal frame size to userspace via auxv
  riscv: Add V extension to KVM ISA allow list
  riscv: KVM: Add vector lazy save/restore support

 arch/riscv/Kconfig                       |  15 +-
 arch/riscv/Makefile                      |   1 +
 arch/riscv/configs/defconfig             |   6 +
 arch/riscv/include/asm/csr.h             |  16 ++-
 arch/riscv/include/asm/elf.h             |  47 +++---
 arch/riscv/include/asm/hwcap.h           |   1 +
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  65 +++++++++
 arch/riscv/include/asm/processor.h       |   9 ++
 arch/riscv/include/asm/switch_to.h       |  83 ++++++++++-
 arch/riscv/include/asm/vector.h          |  17 +++
 arch/riscv/include/asm/xor.h             |  82 +++++++++++
 arch/riscv/include/uapi/asm/auxvec.h     |   1 +
 arch/riscv/include/uapi/asm/hwcap.h      |   1 +
 arch/riscv/include/uapi/asm/kvm.h        |   7 +
 arch/riscv/include/uapi/asm/ptrace.h     |  23 +++
 arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
 arch/riscv/kernel/Makefile               |   2 +
 arch/riscv/kernel/asm-offsets.c          |  15 ++
 arch/riscv/kernel/cpufeature.c           |  21 +++
 arch/riscv/kernel/entry.S                |   6 +-
 arch/riscv/kernel/head.S                 |  37 ++++-
 arch/riscv/kernel/kernel_mode_vector.c   | 132 +++++++++++++++++
 arch/riscv/kernel/process.c              |  61 ++++++++
 arch/riscv/kernel/ptrace.c               |  71 ++++++++++
 arch/riscv/kernel/riscv_ksyms.c          |   6 +
 arch/riscv/kernel/signal.c               | 173 ++++++++++++++++++++++-
 arch/riscv/kernel/vector.S               | 102 +++++++++++++
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  32 +++++
 arch/riscv/kvm/vcpu_switch.S             |  69 +++++++++
 arch/riscv/kvm/vcpu_vector.c             | 173 +++++++++++++++++++++++
 arch/riscv/lib/Makefile                  |   1 +
 arch/riscv/lib/xor.S                     |  81 +++++++++++
 include/uapi/linux/elf.h                 |   1 +
 include/uapi/linux/prctl.h               |   6 +
 kernel/sys.c                             |   7 +
 37 files changed, 1355 insertions(+), 42 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/include/asm/vector.h
 create mode 100644 arch/riscv/include/asm/xor.h
 create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
 create mode 100644 arch/riscv/kernel/vector.S
 create mode 100644 arch/riscv/kvm/vcpu_vector.c
 create mode 100644 arch/riscv/lib/xor.S

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
