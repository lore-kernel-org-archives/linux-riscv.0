Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA11C46CA2
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ATYvhOFdJVNELjtELYBsdJfQODvVw47GBVfIcO3MXKY=; b=oLb17dCPzLZyMJ
	qUDCA+iTUMW0sqOrYMBVRa8EohEn10EdvCMQ8wYN9SnhVBLgjFnMDLgUWdvxrBkBrnxHuXjSUMuEc
	vROYNdIGGrw5PODC4jeptgFQObSu+dtN1LNBmdscgBAczf6GAhk6uEg9p4kT05dayP7Zq9C9Ln2+c
	lBYiGsIg9/ur+ayQd/zzq0zgH4NBrbL4Dz+XG1gIz1kMQiR5FlhBYNo/EkXFbolPuhoVo0DoYPeqH
	36cD4Ys+11n9YxnTFppg6gwb7eQ3h/7fi4onulEDUDbonXOHhShqZtAu1SyCjFL2u/fi22QXETXvW
	Jtvuk1ITr5qxp33EEWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExw6-008Pwy-20;
	Sun, 17 Dec 2023 20:40:30 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExw2-008PvR-0i
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:29 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bce78f145so2431303e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845623; x=1703450423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7njOxEMPBbtgvDsh+tIioXyQhIK2DCbcZAifd8D4ls=;
        b=DixTJHHtUq2Yc23UjCRbxN6gN/gCkefsj6/X89omg51/OOAHlMvCvIZIRUXyKk+W9z
         PZkW6w0IWjl+w5Djqf3Qbp2TDTvDv03aYOLKun66Ycu0m/7WMx1U58j2hnzREpQMTEOE
         +qUEMnpLrVS5OrCm7FPtf7kzmixSpTc0ESHrICc/PU7k3/dbWefQlOPzx9xHvGdxZ1Ji
         sX920m5wP9C/iSL6aeDxE1hAcSbWe/C/KAHLJbJTya/ZHu0OPSXzrNJ5WGxrcpummoYt
         WJMhf4FmzJnF5Z9y2+Uo669QDGNPdFE01Q3MxP5YHWY90JlpNBm7f6iLdf/f4nQohxoc
         wwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845623; x=1703450423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7njOxEMPBbtgvDsh+tIioXyQhIK2DCbcZAifd8D4ls=;
        b=nNSfjfC01hVq2z54NQB1KUsVJAGUMk3yFZ2/5Z91UWgqFpokJuxJl6Rl11B3hbR5DT
         h9qV9zHihSzqrHX+Lc8DJ+Fpu1P2VN3ntI1KVe3NT3vOUjmkeAXlhLtI3Fca0d5NUN9p
         wjzL1SReMlr1kbPd0OnqPI4Q/WWUdlaN5mfJ3CRyF9uY81HOws1JdkUZCG5OlPkiIWDS
         qwOTeFhzeRb7sJEZ4GRw12wkLNVXJtt1oW6JzDGvcTX8zLe15xKEZvKvbRFvMrCf1DD8
         cj4WegS8Ved3hdSHoWMLky85JlUe0iKq73eFfL1aVH4VSRP7yrLaVLzJYhRd97FpCHe/
         6OHA==
X-Gm-Message-State: AOJu0YwXGFD8mnVuaRTJCIpbVI1OBOjSywXz+gKblazxMeWRlT0tnkdN
	8hfprLgT/hzzo55z4RniMoVuOg==
X-Google-Smtp-Source: AGHT+IHIqZ0UGnXDqm7/W1EgiPTD5LIezjEUrVBjl8lt3+XEzPjth1J2M3N9QlyYyzn/7M2gqwaV8Q==
X-Received: by 2002:a05:6512:3c89:b0:50d:1a16:63e with SMTP id h9-20020a0565123c8900b0050d1a16063emr4376298lfv.204.1702845622770;
        Sun, 17 Dec 2023 12:40:22 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id tk10-20020a170907c28a00b00a1cfa7e0d40sm13306123ejc.61.2023.12.17.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:22 -0800 (PST)
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
	guoren@kernel.org,
	conor.dooley@microchip.com
Subject: [PATCH v3 00/13] RISC-V: Add steal-time support
Date: Sun, 17 Dec 2023 21:40:20 +0100
Message-ID: <20231217204019.36492-15-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124026_311209_62FDD156 
X-CRM114-Status: GOOD (  14.22  )
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
 1) Patches 01-03 - Add paravirt support to RISC-V and implement
                    steal-time accounting support using the SBI STA
                    extension.
 2) Patches 04-09 - Implement SBI STA in KVM so KVM guests, such as
                    Linux guests which enable the paravirt steal-time
                    support, can be enlightened about stolen time.
 3) Patches 10-13 - Add RISC-V support to the KVM selftests steal_time
                    test and the SBI extension regs in the get-reg-list
                    test.

These patches are based on kvm-riscv/riscv_kvm_queue

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-steal-time.adoc

This patches are also available here
https://github.com/jones-drew/linux/commits/kvm/steal-time-v3

Changes since v2:
 - Always check sequence in case the SBI impl isn't writing steal
   atomically [Anup]
 - Create a reset function for sta and also reset last_steal [Anup]
 - Picked up Anup's r-b's

Changes since v1:
 - sbi_sta_steal_time_set_shmem() now maps SBI errors to linux errors [Conor]
 - Squashed v1 patch 4 into v1 patch 3 [Conor]
 - Moved kvm_riscv_vcpu_set/get_reg_sbi() to arch/riscv/kvm/vcpu_sbi.c
   which seems like a more appropriate file for them
 - Rebased on kvm-riscv/riscv_kvm_queue which has all the dependencies

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


Andrew Jones (13):
  RISC-V: paravirt: Add skeleton for pv-time support
  RISC-V: Add SBI STA extension definitions
  RISC-V: paravirt: Implement steal-time support
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
 arch/riscv/include/asm/kvm_host.h             |  10 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  10 +
 arch/riscv/include/asm/paravirt.h             |  28 +++
 arch/riscv/include/asm/paravirt_api_clock.h   |   1 +
 arch/riscv/include/asm/sbi.h                  |  17 ++
 arch/riscv/include/uapi/asm/kvm.h             |  13 ++
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/paravirt.c                  | 134 +++++++++++
 arch/riscv/kernel/time.c                      |   3 +
 arch/riscv/kvm/Kconfig                        |   1 +
 arch/riscv/kvm/Makefile                       |   1 +
 arch/riscv/kvm/vcpu.c                         |   7 +
 arch/riscv/kvm/vcpu_onereg.c                  |  50 ++++-
 arch/riscv/kvm/vcpu_sbi.c                     |  67 ++++++
 arch/riscv/kvm/vcpu_sbi_sta.c                 | 208 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |   5 +-
 .../selftests/kvm/include/riscv/processor.h   |  22 ++
 .../selftests/kvm/lib/riscv/processor.c       |  45 ++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  26 ---
 .../selftests/kvm/riscv/get-reg-list.c        |  43 ++++
 tools/testing/selftests/kvm/steal_time.c      |  99 +++++++++
 23 files changed, 781 insertions(+), 35 deletions(-)
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
