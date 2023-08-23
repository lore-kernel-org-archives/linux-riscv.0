Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991B3C3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wudecM3SJrhK99KigLzQ/yp0jmhg67OGo7Yi5Jd8P3c=; b=EkekwnO+pz23lL
	xUFfVIcKQhRelBx/t3rnbsjB2MxNB+pOOtqhO21Ne42XN6pKLFEjXjG9d8J8jM+D3ZrTO7DX3Qu0X
	lhXGF7UYYIluT1YDidlIsajp9m6OMSo+BY94x78otsSwC7949sh09Bdms8JZn31iCs8SSMjvGT+MM
	Xzhaj21n//4TqOowhVjMNihhndwGGIqGzD/9H5ad3zsrJvn0Aj5WCGA3sonTCtySK4jgF1ODJk/2E
	5/TGXLEEgrlmAVdsR15Yl4620nN2DddSjZkrJIygHo/ECODt1cmBqztvGfIdDDoSKHcKeLEoHUuT8
	pbKjKF7hCRjYNCj+LfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrc8-001DMb-11;
	Wed, 23 Aug 2023 17:25:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrc5-001DLY-0V
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 17:25:50 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bcf2de59cso765729266b.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Aug 2023 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1692811539; x=1693416339;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9doNwfaV+DyWn01odwS31ajPbHdtq1usdM6nQ5uPRwQ=;
        b=OX1aTrHg+kqEwcVYobN3fOSOfbip/pX1WWrfPAn77RO2holwjYNhvnSQMC+367jMGs
         gXaCoHRKUaJKBezBwM0cCnAKMcVyhTWaxe9BFTRqrVCrC0agodKLsmvPV7Z0aES56ZTc
         Zwj63HcDsh7+yScm8WnjXghiBDSY3QOfqbNSLL92GXy03p2XD+rhtomtp7fNXSYkBjjM
         x0FEjNRqSMFCM3U/mFPgiAlf4FEZvExB8GSYnVk6EcdKht5Xi+ZEJfg1b1kydTHqvRxE
         Hdpu1xCqFMZMgFX4P/oYLAfRQC2U2FZZfo9PxpKcjVQj4qvOtt5pEoCq8y1FBahP26fi
         7WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692811539; x=1693416339;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9doNwfaV+DyWn01odwS31ajPbHdtq1usdM6nQ5uPRwQ=;
        b=LL9qj3Ol2hpGj2ezf3u984i/g0IN572vvnE8YbdvrVqM3/rgP4Vhc7OdK+SohmWwoK
         lkaKBn0dSAGoZwCovlWAdPNNmNFaHwEkOTi0pgxA/YZoCrfCH9mDOi7broI2LiTIzs7Y
         I0O0O8xObtIgwppm3O/D0xL9Bx+PYdz4jPHM3mz1ykkpRZcPtAlyuRa3YE0BTtZsM7Ku
         w6aAy/ggCwum6SA5T0S7Ta1cEz+Couj+uKEiRojra72Yqr3VW+FLSeOSlkkldtW9b0wK
         LnnZ8baYwxJubTHXpbEayoQThCUi6lxFg/YRqX+bTDXWfY9HuYDL5eYVWQC19oikylqY
         uk4g==
X-Gm-Message-State: AOJu0Yy+th3gbLkpE2S8BWLY0bGk4bNo3AyVvbVJzJk8F1SWJGK/xOit
	EFNkQzhl0V22OjFzQWfVBruHJByoOiLjQYKgNjjUdQ==
X-Google-Smtp-Source: AGHT+IEoUO9OwvjFmBxfjHkKC3F/JNYN6dkjFqrxGPtXf7PN6LvuRceVFlsFxu9sHXQbbWzYd+7m0R73svUkbsXIDqs=
X-Received: by 2002:a17:907:1de6:b0:9a1:f21e:cdfd with SMTP id
 og38-20020a1709071de600b009a1f21ecdfdmr1066707ejc.34.1692811539344; Wed, 23
 Aug 2023 10:25:39 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Aug 2023 22:55:28 +0530
Message-ID: <CAAhSdy2XiFD1QC+v_UZ5G0TAhmT8uH48=UQdu6=bL=EPWy+2Kg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.6
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_102549_198936_BA484430 
X-CRM114-Status: UNSURE (   9.89  )
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

We have the following KVM RISC-V changes for 6.6:
1) Zba, Zbs, Zicntr, Zicsr, Zifencei, and Zihpm support for Guest/VM
2) Added ONE_REG interface for SATP mode
3) Added ONE_REG interface to enable/disable multiple ISA extensions
4) Improved error codes returned by ONE_REG interfaces
5) Added KVM_GET_REG_LIST ioctl() implementation for KVM RISC-V
6) Added get-reg-list selftest for KVM RISC-V

Please pull.

Regards,
Anup

The following changes since commit 52a93d39b17dc7eb98b6aa3edb93943248e03b2f:

  Linux 6.5-rc5 (2023-08-06 15:07:51 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.6-1

for you to fetch changes up to 477069398ed6e0498ee243e799cb6c68baf6ccb8:

  KVM: riscv: selftests: Add get-reg-list test (2023-08-09 12:15:27 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.6

- Zba, Zbs, Zicntr, Zicsr, Zifencei, and Zihpm support for Guest/VM
- Added ONE_REG interface for SATP mode
- Added ONE_REG interface to enable/disable multiple ISA extensions
- Improved error codes returned by ONE_REG interfaces
- Added KVM_GET_REG_LIST ioctl() implementation for KVM RISC-V
- Added get-reg-list selftest for KVM RISC-V

----------------------------------------------------------------
Andrew Jones (9):
      RISC-V: KVM: Improve vector save/restore errors
      RISC-V: KVM: Improve vector save/restore functions
      KVM: arm64: selftests: Replace str_with_index with strdup_printf
      KVM: arm64: selftests: Drop SVE cap check in print_reg
      KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
      KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
      KVM: arm64: selftests: Delete core_reg_fixup
      KVM: arm64: selftests: Split get-reg-list test code
      KVM: arm64: selftests: Finish generalizing get-reg-list

Anup Patel (5):
      RISC-V: KVM: Factor-out ONE_REG related code to its own source file
      RISC-V: KVM: Extend ONE_REG to enable/disable multiple ISA extensions
      RISC-V: KVM: Allow Zba and Zbs extensions for Guest/VM
      RISC-V: KVM: Allow Zicntr, Zicsr, Zifencei, and Zihpm for Guest/VM
      RISC-V: KVM: Sort ISA extensions alphabetically in ONE_REG interface

Daniel Henrique Barboza (10):
      RISC-V: KVM: provide UAPI for host SATP mode
      RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
      RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
      RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
      RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
      RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
      RISC-V: KVM: avoid EBUSY when writing same ISA val
      RISC-V: KVM: avoid EBUSY when writing the same machine ID val
      RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
      docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG

Haibo Xu (6):
      KVM: arm64: selftests: Move reject_set check logic to a function
      KVM: arm64: selftests: Move finalize_vcpu back to run_test
      KVM: selftests: Only do get/set tests on present blessed list
      KVM: selftests: Add skip_set facility to get_reg_list test
      KVM: riscv: Add KVM_GET_REG_LIST API support
      KVM: riscv: selftests: Add get-reg-list test

 Documentation/virt/kvm/api.rst                     |    4 +-
 arch/riscv/include/asm/csr.h                       |    2 +
 arch/riscv/include/asm/kvm_host.h                  |    9 +
 arch/riscv/include/asm/kvm_vcpu_vector.h           |    6 +-
 arch/riscv/include/uapi/asm/kvm.h                  |   16 +
 arch/riscv/kvm/Makefile                            |    1 +
 arch/riscv/kvm/aia.c                               |    4 +-
 arch/riscv/kvm/vcpu.c                              |  547 +---------
 arch/riscv/kvm/vcpu_fp.c                           |   12 +-
 arch/riscv/kvm/vcpu_onereg.c                       | 1051 ++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi.c                          |   16 +-
 arch/riscv/kvm/vcpu_timer.c                        |   11 +-
 arch/riscv/kvm/vcpu_vector.c                       |   72 +-
 tools/testing/selftests/kvm/Makefile               |   13 +-
 tools/testing/selftests/kvm/aarch64/get-reg-list.c |  554 ++---------
 tools/testing/selftests/kvm/get-reg-list.c         |  401 ++++++++
 .../testing/selftests/kvm/include/kvm_util_base.h  |   21 +
 .../selftests/kvm/include/riscv/processor.h        |    3 +
 tools/testing/selftests/kvm/include/test_util.h    |    2 +
 tools/testing/selftests/kvm/lib/test_util.c        |   15 +
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  872 ++++++++++++++++
 21 files changed, 2547 insertions(+), 1085 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_onereg.c
 create mode 100644 tools/testing/selftests/kvm/get-reg-list.c
 create mode 100644 tools/testing/selftests/kvm/riscv/get-reg-list.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
