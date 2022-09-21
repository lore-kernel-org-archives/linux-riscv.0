Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A70C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ePTwznnZrj9Zk347dxs+517gGKtEUw4hJP3ntBBj6Ko=; b=UPeTTxiy07SDw9
	xqSo+yJRvTjoal/xTMI0As3HOK1A/PTS1zciMP96+rvjkgyxBvQPd58Cg6SOI9RZnceuPjnNKqYIW
	4JuClfBwIiibX3VV9lYIx2yZsnWANdOhR1Sbt6jWNHFKnMLw32t3iVD3bPs4pRzvxR9wfV+co6BGK
	tWo7h/qq1+TBhgzaK7+86wJCh1fIULH62WxZAocWwU0xNR5ah4/8zp+0RFLK+CbLuIV17XIzV04E8
	TZ+13+/F0vdWSugoZT1yCFY/j8SVQj0JJusOL5MNAm8vabPfaKs6QkqV5Wtl3Z9lW8rweeqgpXR6a
	O8qcY3R/tUoiepYeMKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2qk-00C1sE-Rm; Wed, 21 Sep 2022 16:45:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2qi-00C1rS-0P
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:45:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so1252927wmb.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=maY7kzPHhfOL6zo3BmzT6qOiBQ7Fki1aPrDYWudhkyM=;
        b=c+oKe5GQ0lFHDR/sMWCjRwxwLwpvGvSr57ny7NZfyENkJ9qshx0VaFnQ0mSLaOgxvC
         z+PpO1P5p7Hcug+QkyIvRHgQTO3txqBMkvY9EZpRjtrRFNpSevqH4bC3rku0NR09d+UQ
         fMRkIAbBMcZO4FN1N1ZYACGg5oudi4wdJNOt+Z9ndRVTn5V6fxqjCiiAsUwetYDkT1my
         PAuo1wpxb4qIYhvtGWrRoqsFu0xsfWX7i2gzMefN4KZ6uNMnHp/WUwUWNWLDE8DS9fs5
         tGrJMnAIav3GJ9MZ5a2/nuuU+Js7j2LUb3OQE3Gw8ul22nWXSGFAesxnYZZKItifRXxY
         SI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=maY7kzPHhfOL6zo3BmzT6qOiBQ7Fki1aPrDYWudhkyM=;
        b=7HGpbeCSwZUCm68RK7aBekAOPpYDjsiJU4kHpTPr8GTuWX8ISiH4H+FgDERskhyGAC
         YUF8Jz6IBYIs0f+mpNtQUy8UzNU8uwQi6evwN4yNV0pX/kF0dZxtG4Ncrtd5vQ2Hq3tJ
         EW57GHNai9MKYzFWHSnVPtugwnUkPR1+fBeG47FKspoC7m+G6og5jFv5wD77Jmv2mugR
         cojS4EPSlpg+CL2ubhVrIhSnzo5mtx5Wv/AYjSam/5nIUP25G+maqoUtgczzFYUPBAIS
         rpx+IYX7/FqV+9wPS9DcQFNhHp0ZdvUFjq1uc6CES56uG1Sw1X5XXXd+WlhB9ckRtp50
         X+1w==
X-Gm-Message-State: ACrzQf0a+2oDly7MFN3JReNCccDDtj0pulmBCNaj7x8hp6RA35c0c/DC
	6ko7FPhZgX7MBZIvfxhuUpkcgtxZtJFWho116QARxHeld4OrYQ==
X-Google-Smtp-Source: AMsMyM4OSLkMCJVnryNhB9HkkjYXVz+/9r6KK30K7OSK2bv+cFt1m1adqX8CavoMyh+AM2U2c7dUB7U5FcQVhuCAN5g=
X-Received: by 2002:a1c:4b05:0:b0:3b4:90c1:e249 with SMTP id
 y5-20020a1c4b05000000b003b490c1e249mr6673063wma.201.1663778720053; Wed, 21
 Sep 2022 09:45:20 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:44:43 -0700
Message-ID: <CAM2SziVKzk1zpEZJ4h1+pG90=V7d-bYLySxh2-ZCAHOzNy54yQ@mail.gmail.com>
Subject: [PATCH 00/17] Prctl to enable vector commands, previous vector
 patches rebased
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094524_297597_24561DC4 
X-CRM114-Status: GOOD (  12.83  )
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

This patch adds a prctl to enable, disable, or query whether vectors
are enabled or not.
This is to allow a process to "opt out" of the overhead incurred by
using vectors. Because this
is build on top of an existing set of patches to work with vectors,
they have been rebased to
Linux 6.0-rc1.


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
