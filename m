Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CADEB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uaf/0QshtazfdR/m5NtN4cLPKdvGeBjDbrjoapYRn/A=; b=cDPRb18nTIj+/y
	s+10LI5ETIbUAv41sEOViBni260+m04iNDMurvNFA+bdclsVxbGjCJvzjquFj0K8iCF7mulO+KieA
	5L1jf8D969suKeiRbvxe0oj2LSy6s05FKBZrlQWkQiVmISa/URnalTUzJ58Bb4EkB+wZZLdFZbdl9
	Q/kub0wzghqJhj08gGQowLqI8dChR3dJaUP76+BcXdSEEmg6FuRku95NLNEZjfWYu35GPQQoa16d8
	r/+8Jkml2RuOFJQXwu7zWyWfI3Gs9kjTRN5dTjVEDeS7l0jyhlKSGQOMgNyPKx3mF3iYWenoIaPMC
	g1XTTJawuH8VDFCDyG1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCL43-000vLj-28;
	Thu, 22 Jun 2023 14:13:35 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCL40-000vJh-0i
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 14:13:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51bdc87feb1so2208328a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687443209; x=1690035209;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aQFOxP/qlNJ8W5hzFaJcpbihIuSxzcIRByRUct5kWzk=;
        b=20LM5jzrEzSqUNc1jEJer0iCv9FzPlX2xvy8IgY9C+XWT2+ShvQ7I7EY02qR+8l6xA
         9UOBdpTOwPKUoN/XIF7IFHeZxWC4RWhWhGTR8uJn5h+zX394ImVqAA3ySKNoAIciad6Z
         MwUBnqVoHhnjLDMFSCq8Z2rouhjl8LpVwW4IKLQYlT8Vfh12Pl+UOag0hTtetXuuU9sS
         4kewOYNeMoV05aI/apgRu+H/GebQ/ISBJ4jXQE3NZFpR1FX7gkGKhrsMAiLkbKY/B/qP
         L85ak/gw9yTkh1lqc7oXs7gaF4R+RnKBCfu9vmJuFfnrO8J5JbG67yWa/8F/uImqRFJA
         txKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443209; x=1690035209;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQFOxP/qlNJ8W5hzFaJcpbihIuSxzcIRByRUct5kWzk=;
        b=fTK4j2KGwOhKiIIXCaz/jyl4I6E1QSEQCyP4f+ejTUe/C6fqxj2Tq73SKE4OHKtQSZ
         +WZi+KT2sk1Eh6KZ4vWXynQWzSESz29cJkGwrGmpJiPkVL/FjvWYRE+DpG9UTSqvHPXD
         t9uW4g+QUWO/EXUVEe26O9A3eT+h39oRSjynSODWIiChMXTh5S6faP+SVm+FoLm3xgus
         Gp75quhkNYIyCTde3Qv6+mkFDb092wHv2zJWWhRdV7ArRU2PSZYv+6xvi8mgh0RRbBen
         WRzjBpiUHCNiFpfY8Cgg8tyvMJNrctQGQHCJmYM+jKSZTvE1NhGymUODZenPB66PN06I
         qBLg==
X-Gm-Message-State: AC+VfDw7u6jOMCdoya0BiXhKzz8Th5x9KCWNRrAJDyHvYjZBLf6eBSTy
	V1+Nnb8HoY78uJe1rckNH65GrAM/HNwwfAB2pxVniw==
X-Google-Smtp-Source: ACHHUZ7qaE0X8VXjp7N7KADuvhsxpRq8hc8/FAQKrIA6SOk+wqkQRIBrFhuGIYRkwq5+A/Sktq0T8tk3Cq8fl8mjvbY=
X-Received: by 2002:a50:fb91:0:b0:51b:cb7c:7f97 with SMTP id
 e17-20020a50fb91000000b0051bcb7c7f97mr5567517edq.29.1687443209328; Thu, 22
 Jun 2023 07:13:29 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Jun 2023 19:43:17 +0530
Message-ID: <CAAhSdy1iT=SbjSvv_7SDygSo0HhmgLjD-y+DU1_Q+6tnki7w+A@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 6.5
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_071332_449231_50DE77E8 
X-CRM114-Status: UNSURE (   9.78  )
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

We have the following KVM RISC-V changes for 6.5:
1) Redirect AMO load/store misaligned traps to KVM guest
2) Trap-n-emulate AIA in-kernel irqchip for KVM guest
3) Svnapot support for KVM Guest

Please pull.

Please note that there is a minor conflict with the RISC-V
tree in the arch/riscv/include/uapi/asm/kvm.h header due to
KVM vector virtualization going through the RISC-V tree.

Regards,
Anup

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.5-1

for you to fetch changes up to 07f225b5842420ae9c18cba17873fc71ed69c28e:

  RISC-V: KVM: Remove unneeded semicolon (2023-06-20 10:48:38 +0530)

----------------------------------------------------------------
KVM/riscv changes for 6.5

- Redirect AMO load/store misaligned traps to KVM guest
- Trap-n-emulate AIA in-kernel irqchip for KVM guest
- Svnapot support for KVM Guest

----------------------------------------------------------------
Andrew Jones (3):
      RISC-V: KVM: Rename dis_idx to ext_idx
      RISC-V: KVM: Convert extension_disabled[] to ext_status[]
      RISC-V: KVM: Probe for SBI extension status

Anup Patel (11):
      RISC-V: KVM: Implement guest external interrupt line management
      RISC-V: KVM: Add IMSIC related defines
      RISC-V: KVM: Add APLIC related defines
      RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
      RISC-V: KVM: Skeletal in-kernel AIA irqchip support
      RISC-V: KVM: Implement device interface for AIA irqchip
      RISC-V: KVM: Add in-kernel emulation of AIA APLIC
      RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip
      RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC
      RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip
      RISC-V: KVM: Allow Svnapot extension for Guest/VM

Ben Dooks (1):
      riscv: kvm: define vcpu_sbi_ext_pmu in header

Yang Li (1):
      RISC-V: KVM: Remove unneeded semicolon

Ye Xingchen (1):
      RISC-V: KVM: use bitmap_zero() API

wchen (1):
      RISC-V: KVM: Redirect AMO load/store misaligned traps to guest

 arch/riscv/include/asm/csr.h           |    2 +
 arch/riscv/include/asm/kvm_aia.h       |  107 +++-
 arch/riscv/include/asm/kvm_aia_aplic.h |   58 ++
 arch/riscv/include/asm/kvm_aia_imsic.h |   38 ++
 arch/riscv/include/asm/kvm_host.h      |    4 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h  |   11 +-
 arch/riscv/include/uapi/asm/kvm.h      |   73 +++
 arch/riscv/kvm/Kconfig                 |    4 +
 arch/riscv/kvm/Makefile                |    3 +
 arch/riscv/kvm/aia.c                   |  274 +++++++-
 arch/riscv/kvm/aia_aplic.c             |  619 ++++++++++++++++++
 arch/riscv/kvm/aia_device.c            |  673 ++++++++++++++++++++
 arch/riscv/kvm/aia_imsic.c             | 1084 ++++++++++++++++++++++++++++++++
 arch/riscv/kvm/main.c                  |    3 +-
 arch/riscv/kvm/tlb.c                   |    2 +-
 arch/riscv/kvm/vcpu.c                  |    4 +
 arch/riscv/kvm/vcpu_exit.c             |    2 +
 arch/riscv/kvm/vcpu_sbi.c              |   80 ++-
 arch/riscv/kvm/vm.c                    |  118 ++++
 include/uapi/linux/kvm.h               |    2 +
 20 files changed, 3100 insertions(+), 61 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
 create mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h
 create mode 100644 arch/riscv/kvm/aia_aplic.c
 create mode 100644 arch/riscv/kvm/aia_device.c
 create mode 100644 arch/riscv/kvm/aia_imsic.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
