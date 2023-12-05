Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0E4C10F05
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vg9/IMYtuKqMmSuyCWe4ISEYRTe6E7g81Mu7b03puwA=; b=r+xoBydKtVbtZD
	1ZlcD4/CuFBGASnLMx8df76ZnDZ00Q+sNr5WBK6OizKQSZXC7h+yLn2JxmtApeOMzMfnzzt3H0dYy
	cQj0WCyTo2yYbAmDaIlMYaAgLCmE7jBXWja0SQwFUXpzsCEDqAX+/Bu+PPAaHmSeq8578vMZhciJa
	JcOSxh79hcO//xemzO8g8uvpJbGfKjVaxfcOjyl/Iz717CN8SnDqvVFYJ0SJhq+3uwFwU85/NUpKl
	bOtJBWU/6Ymlfjy2hzZLSpOi4pCkEouG17rmqKjf8LHQsDSJTIA5/DfyP8aor6hwzzhvFyDnkozZ5
	bBFT1HMK4YjNRSf0jKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtI-0086ij-0b;
	Tue, 05 Dec 2023 18:11:28 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtE-0086gv-2T
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:26 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c9fc0b84d0so37388031fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799881; x=1702404681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xd6mnNZNXMrACqsw59eZFOMt01rSUh441zyM1SI9n9U=;
        b=GJeQr/m4194Zcw4STliwnnJP9LE97zUBA7/qbpyclUWt2Sqnmt6+Kob9Pd7a6UDVKn
         cVQqRZM0qI1x8cH1QWYPE0Dz9ab7HLk5U9FP/qAtkITwtb9d8gfVcMjPlgNO4es06IB3
         lJQo0U4I1eyqcQKSriczADvJPm3E/UaUNSDVaBkvYe84dPdM1Q25MRTxNwr9BZV3KlLm
         Ad/hwbrWD7s/QszcZoiNzOqyKNcOwxBhLlCuaXSlqmQlhYuy3nHqeiKzWNyiJKM5IFeH
         hHjXNtCn48i8DuZhUr8ZmAtjEb4tnMia3tkxISR4W2zSsA0w+20/v7OoBf/D15ySW0Vo
         e5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799881; x=1702404681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xd6mnNZNXMrACqsw59eZFOMt01rSUh441zyM1SI9n9U=;
        b=RP9rrfgXGTrppt6hoWpvX3YyqW5KBano/neEqWT6sk8bnTPzw2J0zvC5xxU9P3oLAd
         N26L4LujkjFVD0RrftHS+VD7gvPezMLZJi/vZZ/QqghaPEuyfuffM6FaDUkPXoojlh/Z
         1QBybevDsLcZlTRclbJlnO0nl8uB5iSS2mSryaOtNOZNRY+87w9oa1GJCA+fYBX8Cs4H
         1JdXyrpFMzVrrQNvsriUGPCshQsge4jaPgz2V+gKmK9R73W9V3qB+xffEy+qnDca5kvy
         0HBiCMEpSzfeWrOtTadGJVM9FtC0TUH3MF8FGo75jY7mYJQFErg3ZDwU2+tO+llCtPFT
         MsHw==
X-Gm-Message-State: AOJu0YzXducYUE4Fc565wriC1xleGfUBK6obe4Kl2eU8zsUcFYrfY/bT
	GeMx0VTH26rO3i4eKyF1nYxYZlV3aKoC3ePEBDk=
X-Google-Smtp-Source: AGHT+IGsOdi3SYNPl10ZLJRZP3ymPfonq+AFt3Kng2XtRFYN1/x+m4gzmIQItJqp4WK64uK1pN49Vw==
X-Received: by 2002:a2e:9a94:0:b0:2ca:fa5:83f1 with SMTP id p20-20020a2e9a94000000b002ca0fa583f1mr1333052lji.20.1701799881071;
        Tue, 05 Dec 2023 10:11:21 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v19-20020a170906565300b00a19644675aasm6339368ejr.23.2023.12.05.10.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:20 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org
Subject: [PATCH v1 00/14] RISC-V: Add steal-time support
Date: Tue,  5 Dec 2023 19:11:20 +0100
Message-ID: <20231205181119.207204-16-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101124_804260_BFC1B36C 
X-CRM114-Status: GOOD (  13.01  )
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

One frequently touted benefit of virtualization is the ability to
consolidate machines, increasing resource utilization.  It may even be
desirable to overcommit, at the risk of one or more VCPUs having to wait.
Hypervisors which have interfaces for guests to retrieve the amount of
time each VCPU had to wait give observers within the guests ways to
account for less progress than would otherwise be expected. The SBI STA
extension[1] provides a standard interface for guest VCPUs to retrieve
the amount of time "stolen".

This series has three parts:
 1) Patches 01-04 - Add paravirt support to RISC-V and implement
                    steal-time accounting support using the SBI STA
                    extension.
 2) Patches 05-10 - Implement SBI STA in KVM so KVM guests, such as
                    Linux guests which enable the paravirt steal-time
                    support, can be enlightened about stolen time.
 3) Patches 11-14 - Add RISC-V support to the KVM selftests steal_time
                    test and the SBI extension regs in the get-reg-list
                    test.

These patches are based on the make SBI uapi consistent with the ISA
uapi KVM series, which is based on Anup's riscv_kvm_more_exts_v1 branch.
Based-on: 20231130183537.55203-8-ajones@ventanamicro.com

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-steal-time.adoc

This patches are also available here
https://github.com/jones-drew/linux/commits/kvm/steal-time-v1

Changes since RFC:
 - Rebased on v6.7-rc3 (plus the patches mentioned above)
 - Added defines for the -1's [Conor]
 - Added a comment to the steal read sequence [Conor]
 - Only do the steal read sequence for 32-bit and added READ_ONCE's
 - Check for SBI v2.0 implementation
 - Rename set_steal_time_shmem to steal_time_set_shmem
 - Add get-reg-list support and test with get-reg-list kselftest
 - A few other minor improvements
 - Picked up one r-b from Conor

Thanks,
drew


Andrew Jones (14):
  RISC-V: paravirt: Add skeleton for pv-time support
  RISC-V: Add SBI STA extension definitions
  RISC-V: paravirt: Implement steal-time support
  RISC-V: paravirt: Add kconfigs
  RISC-V: KVM: Add SBI STA extension skeleton
  RISC-V: KVM: Add steal-update vcpu request
  RISC-V: KVM: Add SBI STA info to vcpu_arch
  RISC-V: KVM: Add support for SBI extension registers
  RISC-V: KVM: Add support for SBI STA registers
  RISC-V: KVM: Implement SBI STA extension
  RISC-V: KVM: selftests: Move sbi_ecall to processor.c
  RISC-V: KVM: selftests: Add guest_sbi_probe_extension
  RISC-V: KVM: selftests: Add steal_time test support
  RISC-V: KVM: selftests: Add get-reg-list test for STA registers

 .../admin-guide/kernel-parameters.txt         |   6 +-
 arch/riscv/Kconfig                            |  19 ++
 arch/riscv/include/asm/kvm_host.h             |   9 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |   6 +
 arch/riscv/include/asm/paravirt.h             |  28 +++
 arch/riscv/include/asm/paravirt_api_clock.h   |   1 +
 arch/riscv/include/asm/sbi.h                  |  17 ++
 arch/riscv/include/uapi/asm/kvm.h             |  13 ++
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/paravirt.c                  | 138 ++++++++++++
 arch/riscv/kernel/time.c                      |   3 +
 arch/riscv/kvm/Kconfig                        |   1 +
 arch/riscv/kvm/Makefile                       |   1 +
 arch/riscv/kvm/vcpu.c                         |   7 +
 arch/riscv/kvm/vcpu_onereg.c                  | 105 +++++++++
 arch/riscv/kvm/vcpu_sbi.c                     |   4 +
 arch/riscv/kvm/vcpu_sbi_sta.c                 | 202 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |   5 +-
 .../selftests/kvm/include/riscv/processor.h   |  22 ++
 .../selftests/kvm/lib/riscv/processor.c       |  45 ++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  26 ---
 .../selftests/kvm/riscv/get-reg-list.c        |  43 ++++
 tools/testing/selftests/kvm/steal_time.c      |  99 +++++++++
 23 files changed, 770 insertions(+), 31 deletions(-)
 create mode 100644 arch/riscv/include/asm/paravirt.h
 create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 create mode 100644 arch/riscv/kernel/paravirt.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_sta.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
