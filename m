Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E95C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 04:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NOeGBXkt3ljFQ9hN1rHCDlZcfTDzk537QAmiU9FaKwM=; b=3Sc2q5kd532G3J
	qyozmtkWL3P82gCfpnWuXf84e3ywa0w5X/7dHgi+kQiA4YbnfJ60aornRFqI/h0SC7EbguWshxCLc
	Q7LE+4tABnCHmrIcc+MaYsHG6IqJxE0ffV3l5gH03IkhTIYjbDT7x+hgdV4c124CWOFKhDQzSlNgB
	2X1GFs5ASJNHSNhns9vq5nztTxce0jYNeYN1x1GarmCkIcaWulzxrWZiIlf0aCm0u2d+2TQKFPsPh
	JxEZMzf1oyvi4sgaBypqz41NiEShOr6R9OnmFHFhUckcbWIm9T97+kM7cQOPvSxZSNa6SNMToNBfD
	2eyPe3gmOlwNAM5ukIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nruZE-00AUcF-IO; Fri, 20 May 2022 04:48:48 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nruZB-00AUb9-RG
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 04:48:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id p189so3926772wmp.3
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 21:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=plxhMmUf+EvrQhTteZUdGqmGsuCJiqfW555AYN0K1E0=;
 b=unSzjMkf5QFwC8NcjB+EBDJVjpaXKKYE3Od5nIKx5fhHptk9QdmyI0NuFU0+ZSoPWp
 RWuOSGhmhKcQeMvvi78ODu1fTPrmQIBbRDJzOeE/2QnHP1XlL+sio0HQSIUBnuO5cUPP
 tNRO4kMrMtJEXWAQph71C2elgA+8YB+b9G9gBJgMdVDLWo64+bWFdZVWLUsceX25e+Uy
 0fxMBbAfxY6Dan7iMEecB45fedgB0f1DR66Lt1cDMaVJjTzjrrKMp6FgpCthh+2OREvA
 5dh1ZN4heEMR06j/hdVdtkcq+hJ2G0nMMLu1OfyaK1TewMptRT+AZNX/ntgbWyqmhD3j
 6rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=plxhMmUf+EvrQhTteZUdGqmGsuCJiqfW555AYN0K1E0=;
 b=Fnrse5ZnF84fLer+7BkqMg1mtlwqpMl9aS2ts2vbNl9LX0XUssV1ANXkBm1IO2653D
 LxVia5ZCNLuIKNrSItuOz7m7ueDvMLUz2SH58sNNuPgpRkjV8JC5mA5IBRczjMq+Wk9e
 XhSVe9EryBNn9RyrBw4VnprNzLMH7L6SZcFoN0KC2a46aYje5ogAWmjI8ZqEAhRpVwHK
 rG9QNRptl44EJPJ60afr1/QvfD1HdAQPVK0Us2sZjiU/0AVZBjsvcfHzg3Bp0h5lGWRC
 7X02T+dTw4XFQBtzk7i1beXH4VfVGk2DFZ/MYqc274KS/AK4OFuXuRgSYt/h9YgFSL+n
 ZWNA==
X-Gm-Message-State: AOAM532c65zJT6ZW84NMZUbqu6SfrI8+QRq9bTky0va3o0MNqT2eenGt
 /eiOMc8jyUiVRScFJJtrk6LnWBxa/SGQhpXDewcqUg==
X-Google-Smtp-Source: ABdhPJykE5sa+XllxwxbmsoQly/lZ3QV+g8Z2JdvJ5RxXL4OGzl2J0gatnl2iyCrwOqF/qmQRR67GWUuYMhnl+uhZ1U=
X-Received: by 2002:a05:600c:4fd5:b0:394:55ae:32c7 with SMTP id
 o21-20020a05600c4fd500b0039455ae32c7mr7105025wmq.73.1653022121217; Thu, 19
 May 2022 21:48:41 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 May 2022 10:18:29 +0530
Message-ID: <CAAhSdy1DUJa=5YxbV_u0B=NLaTJrW03PbLxegJ2oCWDeWqy=zw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 5.19
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_214845_925663_3B35B2C3 
X-CRM114-Status: UNSURE (   9.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paolo,

We have following KVM RISC-V changes for 5.19:
1) Added Sv57x4 support for G-stage page table
2) Added range based local HFENCE functions
3) Added remote HFENCE functions based on VCPU requests
4) Added ISA extension registers in ONE_REG interface
5) Updated KVM RISC-V maintainers entry to cover selftests support

I don't expect any other KVM RISC-V changes for 5.19.

Please pull.

Regards,
Anup

The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:

  Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.19-1

for you to fetch changes up to fed9b26b2501ea0ce41ae3a788bcc498440589c6:

  MAINTAINERS: Update KVM RISC-V entry to cover selftests support
(2022-05-20 09:09:23 +0530)

----------------------------------------------------------------
KVM/riscv changes for 5.19

- Added Sv57x4 support for G-stage page table
- Added range based local HFENCE functions
- Added remote HFENCE functions based on VCPU requests
- Added ISA extension registers in ONE_REG interface
- Updated KVM RISC-V maintainers entry to cover selftests support

----------------------------------------------------------------
Anup Patel (9):
      KVM: selftests: riscv: Improve unexpected guest trap handling
      RISC-V: KVM: Use G-stage name for hypervisor page table
      RISC-V: KVM: Add Sv57x4 mode support for G-stage
      RISC-V: KVM: Treat SBI HFENCE calls as NOPs
      RISC-V: KVM: Introduce range based local HFENCE functions
      RISC-V: KVM: Reduce KVM_MAX_VCPUS value
      RISC-V: KVM: Add remote HFENCE functions based on VCPU requests
      RISC-V: KVM: Cleanup stale TLB entries when host CPU changes
      MAINTAINERS: Update KVM RISC-V entry to cover selftests support

Atish Patra (1):
      RISC-V: KVM: Introduce ISA extension register

Jiapeng Chong (1):
      KVM: selftests: riscv: Remove unneeded semicolon

 MAINTAINERS                                        |   2 +
 arch/riscv/include/asm/csr.h                       |   1 +
 arch/riscv/include/asm/kvm_host.h                  | 124 +++++-
 arch/riscv/include/uapi/asm/kvm.h                  |  20 +
 arch/riscv/kvm/main.c                              |  11 +-
 arch/riscv/kvm/mmu.c                               | 264 ++++++------
 arch/riscv/kvm/tlb.S                               |  74 ----
 arch/riscv/kvm/tlb.c                               | 461 +++++++++++++++++++++
 arch/riscv/kvm/vcpu.c                              | 144 ++++++-
 arch/riscv/kvm/vcpu_exit.c                         |   6 +-
 arch/riscv/kvm/vcpu_sbi_replace.c                  |  40 +-
 arch/riscv/kvm/vcpu_sbi_v01.c                      |  35 +-
 arch/riscv/kvm/vm.c                                |   8 +-
 arch/riscv/kvm/vmid.c                              |  30 +-
 .../selftests/kvm/include/riscv/processor.h        |   8 +-
 tools/testing/selftests/kvm/lib/riscv/processor.c  |  11 +-
 tools/testing/selftests/kvm/lib/riscv/ucall.c      |  31 +-
 17 files changed, 965 insertions(+), 305 deletions(-)
 delete mode 100644 arch/riscv/kvm/tlb.S
 create mode 100644 arch/riscv/kvm/tlb.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
