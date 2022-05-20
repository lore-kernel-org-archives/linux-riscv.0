Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347E7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 04:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NOeGBXkt3ljFQ9hN1rHCDlZcfTDzk537QAmiU9FaKwM=; b=2GzcDsQoW0E7j3
	kXh6OWHE+xRy1eWIWI5OOkO5+92IfR7BlvRvWIlAlGf0LYY9iiLFwhXh6ZCqz4v6e5YubcAFfL9Sb
	LH1Qa4KyrASByd4rib0G8/B8V1kw2GRBSzwys4Sj6vK/R8JTOT+jiZRmjSBe6UP/o24QR27llKnBD
	zb96CJphOxKq4bQMX5EEfTB34jVyi8Blo3TRcE2mtvJMUwNd4lGa3uKRlTcsGZDvQvQNz64uHh+zL
	wpsKxbxDwZXbP0d/QPYV2tDZ9r+8Axdycn09SRomddMJGYvioTRvBw+6y0Y/5je8+4tcBHg5qFkDB
	Aw/kCBA89zWtdScRdJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nruWT-00AUNh-GO; Fri, 20 May 2022 04:45:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nruWP-00AUM9-Sk
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 04:45:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u27so9029383wru.8
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 21:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=plxhMmUf+EvrQhTteZUdGqmGsuCJiqfW555AYN0K1E0=;
 b=rHGeIWEiwBE+lSiR4XwwNpQnDwaCBZYNHDs8N6RWS/7S5MICOMEcgkGeRFHDCI6lxL
 44V/nfAUvhDw1LX3+6DWiWH9cGED7wKMjQIfN1bn3XnTRL65I5d3M6ekdZYwdZycu8ex
 c2FxE8futNYQbMqcJv57mK7n0xOyviklalXZN44ICgvtc0rQRcYHhV1nV4u3RuPd5m6f
 bnEV4AqGSpOucEwLBVI2QVlWzelZKCzWi3rkl+YTmlumPQ3IRpvrtkaq3DeSlllxPgWh
 Fn+YDaR7KEUpEtOV0HcsxgMcEo+7aoGYt1yZe/SR8XxUT2mNhzehF2db/feGmSJ7FBW+
 IxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=plxhMmUf+EvrQhTteZUdGqmGsuCJiqfW555AYN0K1E0=;
 b=hzFio0Wj6C941NFAORChsNRuzE1+ySlKAmi10Vboq3BL5V4mHe6xSL79/naWE2PY9k
 4ZCT/z+FIPpeKr6YP9u1NyDW1ENPCb37sBOEXL/uZVWa2HaJSc6jHRQNCYw+yHZs1fJq
 ynJbJS01g2fR8/YzOC400X9+ekGE5G00k3wKnDWVw3f7csrHrfQGrGl+L7RjzHzL6zsm
 6lPxbSO5hZWqWTymMt0Rn4sUlrRdHl6A00zXKtc87zWKslK3EpPhJ0QVYFWn3ccv29H3
 0NW6DmQZFTs6n8CalE06m518x2KTnli5cjaEqOWZAqGxdzAQ7hydarVdmeZIn9DfW9mw
 NTPw==
X-Gm-Message-State: AOAM531MuxLqoskITKFquYZb7Sbjzkf2S3Byrrb9E+j3aFLN7PSKQPug
 lhiK2qXTbjCAkEQQ0Z4VMtBGJS7qnLK8xS7/jYG1AQ==
X-Google-Smtp-Source: ABdhPJzy+GKWYDBgcDFKUOV5Waak21QZOZ8G+R+J87v2HPAdDTSuBDirrSw9Atr+eB+n9M5ag7h6sd+pwLb20DNuOm8=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr6655051wrz.690.1653021948566; Thu, 19
 May 2022 21:45:48 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 May 2022 10:15:36 +0530
Message-ID: <CAAhSdy0V3RziZOXe2UMfpAxmTYn1XpJJTQe5q2FdrmU_3zH+sQ@mail.gmail.com>
Subject: KVM/riscv changes for 5.19
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_214554_219365_9E699D0E 
X-CRM114-Status: UNSURE (   9.15  )
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
