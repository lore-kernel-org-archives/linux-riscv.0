Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A70DC77B77
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 10:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=syRjG7ppSGolX8KM9iX39ghIg8w9yVOxVfEXjS11rZU=; b=EelRu1aYVHNNU0
	N7eVHdpbq1TccRzbMEmMyH+QWYjt7RhBYwis6H+mgUDL4NRu5zjuKVnfvLxIBueC3pK9ZjW/qIjEO
	+9032yU8FASTSRtL51mOlNObbs6CYhLfyoUXjeauMOBJBmTiE0xp3kkRUa5Qp3IB/hBIuxzqi48Mv
	sCx0sFmFJC1rxFnOx6+dQvcudVbcdG2BDb9wA1uXAvLdTMqn061wxSmBIyaw17SExYVdty0LIDUzs
	vupizkW3qvWmyWreJKNopq9j/Lynpe/Lg2yBkUm3h1Udi/g69uzMxWHfTxHqsqdjh/XQEvUxTwD+T
	Arq/dovqS4PZZD11J/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBg-00FkoG-0X;
	Mon, 17 Apr 2023 10:34:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBY-00Fkgb-1K
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:17 +0000
Received: by mail-ej1-x635.google.com with SMTP id u3so10805113ejj.12
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727649; x=1684319649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7B3MyM7qnunFnJDTwr8w5KFAJCcqJ6aWw8zTZMscgCI=;
        b=GLZ6krR67MORwa4reJrGjRJEwnFl/x/M+iNtYATTSsfFQjGDo5VFR+q3U9XaQ6KKlh
         aHIKMWUBMkTmzvMHcprLqVWNb2MfrLhtYNcqd4+lGqcSEUw0iBMUvS+0j2LccLHFMX50
         fv9sRWvGNyPBrqly6lBe2ZKcJmQK+4wnMPify+h/cB177A3btohBBKdPPXxGy/Wqu+dP
         QeCqg12vcT5Z8O7rojqsbMxtiAq0p04CnoDJwLPUg6Tuodd6kL4SZ1sZ6zT2oqeAB1Jq
         80/2yjOn+kwklimxWy97zYrm4MMYOMEygjGxswBiS36OsetvMZiV0bSA5SGNUwmoT+qW
         kpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727649; x=1684319649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B3MyM7qnunFnJDTwr8w5KFAJCcqJ6aWw8zTZMscgCI=;
        b=aaUo86yp9EguG3Whh7tNwDFC9Ujs/X1b8qBJ6+aIrrYw1lw/hm5rpa0F07y2TGG3tT
         0tIRVd13GR+EpbLzbfTAx8jki3RTaXC8M5RyxmzKE7mOFJ5IKIUC9YR8vPHGnWHqp9uN
         /oSCl1k29/e8IG9t7PtFmlSMs8ugds8jKx4AbnNpcYL/hlUTkzvJ4FvtRSJrNjUtg+rg
         /IdWwpT0qHjc3Ayc9yE3C+56hBHDHNfKjd9XYx2TDWvbPy9nzmrR9vvTA8A6h+KJU9qc
         DD4cUSkc9T3Sls/o7FC7AC0/i+hRRELy4DHDgQQKEXhQPGl4PVwxntaGNVECZF/Z+9bz
         z2wQ==
X-Gm-Message-State: AAQBX9dVOw7Zn1MtUHVLVjuH8xrMsN/98q9OS/0ITKTJAsqK7ZoqDj0u
	I4dVwOMMyxXw/XTCJdY5kXIVsw==
X-Google-Smtp-Source: AKy350aMrP99/hW7C40VRCLlAh+dhfBLiu4X20c6nxQzIR+/qYuQw5xgb9FKamPcFcvr9ajnIZknRQ==
X-Received: by 2002:a17:906:c355:b0:94f:b5c:a254 with SMTP id ci21-20020a170906c35500b0094f0b5ca254mr6153197ejb.49.1681727648853;
        Mon, 17 Apr 2023 03:34:08 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090681c500b0094f7092c231sm1568352ejx.6.2023.04.17.03.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:08 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 00/14] RISC-V: Add steal-time support
Date: Mon, 17 Apr 2023 12:33:48 +0200
Message-Id: <20230417103402.798596-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033412_476566_B44224D2 
X-CRM114-Status: GOOD (  11.65  )
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
extension proposal[1] provides a standard interface for guest VCPUs to
retrieve the amount of time "stolen".

This series has three parts:
 1) Patches 01-04 - Add paravirt support to RISC-V and implement
                    steal-time accounting support using the SBI STA
                    extension.
 2) Patches 05-10 - Implement SBI STA in KVM so KVM guests, such as
                    Linux guests which enable the paravirt steal-time
                    support, can be enlightened about stolen time.
 3) Patches 11-12 - Add support to the KVM selftests steal_time test
                    for RISC-V.

Note, while we can review and revise this series now, we'll keep the
RFC tag and refrain from merging it until the proposed SBI extension
has been ratified.

[1] https://lists.riscv.org/g/tech-prs/message/401

This patches are also available here
https://github.com/jones-drew/linux/commits/kvm/steal-time-rfc-v1

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
  RISC-V: KVM: Implement SBI STA extension
  RISC-V: KVM: Add support for SBI extension registers
  RISC-V: KVM: Add support for SBI STA registers
  KVM: selftests: riscv: Move sbi_ecall to processor.c
  KVM: selftests: riscv: Add guest_sbi_probe_extension
  KVM: selftests: riscv: Add RISCV_SBI_EXT_REG
  KVM: selftests: riscv: Add steal_time test support

 .../admin-guide/kernel-parameters.txt         |   6 +-
 arch/riscv/Kconfig                            |  19 ++
 arch/riscv/include/asm/kvm_host.h             |   9 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |   5 +
 arch/riscv/include/asm/paravirt.h             |  29 +++
 arch/riscv/include/asm/paravirt_api_clock.h   |   1 +
 arch/riscv/include/asm/sbi.h                  |  15 ++
 arch/riscv/include/uapi/asm/kvm.h             |  14 ++
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/paravirt.c                  | 127 +++++++++++
 arch/riscv/kernel/time.c                      |   3 +
 arch/riscv/kvm/Kconfig                        |   1 +
 arch/riscv/kvm/Makefile                       |   1 +
 arch/riscv/kvm/vcpu.c                         |  74 +++++++
 arch/riscv/kvm/vcpu_sbi.c                     |   4 +
 arch/riscv/kvm/vcpu_sbi_sta.c                 | 199 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |   3 +-
 .../selftests/kvm/include/riscv/processor.h   |  40 +++-
 .../selftests/kvm/lib/riscv/processor.c       |  45 ++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  26 ---
 tools/testing/selftests/kvm/steal_time.c      | 100 +++++++++
 21 files changed, 685 insertions(+), 37 deletions(-)
 create mode 100644 arch/riscv/include/asm/paravirt.h
 create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 create mode 100644 arch/riscv/kernel/paravirt.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_sta.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
