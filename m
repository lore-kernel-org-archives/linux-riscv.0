Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354C9C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QNFA1qf+mlpu5Uhvy0l6M5qIIUgwIAQF8jK6CBjuU/E=; b=h6DfvGF1lGniZb
	S7KcHChgNLS4G/BtDd7tC1zQfUCSLMOUnDif8YMLsobmbyoG6iU25Q0I8URupKMA/ns7gRj3JFr8X
	LsgN5QEG6mr8UOLYpTj6BbM5u8EBFaAi7wh2vBfWhQeSiTagfypXSDZZ4B3124UOxXL6lOsHwRdFa
	/5eSJsH6FaAa/MyAZZAFWINWvmVQtW7TlwmTJ3ajP1j0QsgYXZbPC+hhyPqz4JX6a0/3HGDpZm14c
	l85PkUdX+bKcGSyMw3zLlqQFd7Vj+Lm7o16RlNbhpY6NeRuYXKI+hK3UNXcVf70SV7yF6rv+iXaFy
	nz4eiKyj9P1rEm6Csl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzm-000LuK-38;
	Wed, 20 Dec 2023 16:00:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyza-000LiJ-0F
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so53978255e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088016; x=1703692816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdwtBlVh4a6VJznudagsfLt7Pfjqobs9eaykgvatq8c=;
        b=Ws6YvqZJkyBBvY4Cjilum/IUpOe/za7DTMZQ2NM+EeVVy6h2xibZkGUD3kx4J6NX5/
         xJZ4D4cvx21Uk7Y/1SIyuq4FvjNSdzbjVO5IQw0SvBCG7+/5gM847fsMtXsjoZb1Y4uQ
         MUwpX5z4YneNkGbzF+L6hVrkKc/CzX3oGN6qs+o+j/VdkCxLC13VHUxaoujHPN0BT474
         s5kUZmh2kn+axlNT9J6bVEm1B1jw3YWCj+cis1sPbIIDBmHe3uljTN2vVcgrU1PI39Ia
         NYhaLiKyigp/zvY97JFOEgxa479XKPcEGjPN9OUUOoqZ1U1dPhkI18St2Kvj3W/rpYs5
         49mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088016; x=1703692816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdwtBlVh4a6VJznudagsfLt7Pfjqobs9eaykgvatq8c=;
        b=C2eJPS4y5cuihTJRy9/s5teIDPiDWDNz7cfi6fJFf2YdC7TaZVcC7mHOV5iJNnE6+r
         /KTTuzlqJuu3TTLAiMyR7v6HwthQH3L+4TP/SGlxcbf+zu5w+sz9+8b6EJZZxHd6y7tw
         hZuzdU82QRUHb0QcB/H3XDeuWfTOtjW8lhtvUntYOsBFfXOKQZ5jUpbudYt+jGILmTy5
         yfIFq+tfO1Uk6AObLrdFWBgVgnbRm6Ptj9CmBWtg7IQ3+291T8FANwb0mjQO6SV74UyW
         bGGaFPCq8fKJfh6sP2sCOLfjLoM81ezkJ+jzJiwAgoTe8O5xPtTuoV2UEilTs5lP61rO
         5JIQ==
X-Gm-Message-State: AOJu0YzmfVZbin/mXu5o6kAYBKLgXiY4HkpAxiM8qVDHxoP8KeoNDF+s
	i6lDmJ6XQ7nDYNTOsIgScMSelQ==
X-Google-Smtp-Source: AGHT+IHd6SyiQhZpvX4TfWnzQTmYm4xiRdNZLQCuRk9AY73nABijgjzHeJnJeK5afQVncsLmvGAAUg==
X-Received: by 2002:a05:600c:19d4:b0:40b:45e2:1f56 with SMTP id u20-20020a05600c19d400b0040b45e21f56mr11508290wmq.39.1703088015723;
        Wed, 20 Dec 2023 08:00:15 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b0040c4c9c52a3sm7944624wmb.12.2023.12.20.08.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:15 -0800 (PST)
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
Subject: [PATCH v4 00/13] RISC-V: Add steal-time support
Date: Wed, 20 Dec 2023 17:00:13 +0100
Message-ID: <20231220160012.40184-15-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080018_126693_0BB471AF 
X-CRM114-Status: GOOD (  14.41  )
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
https://github.com/jones-drew/linux/commits/kvm/steal-time-v4

Changes since v3:
 - Use work "Computing" instead of "using" in pr_info [Atish]
 - Rename KVM_REG_RISCV_SBI to KVM_REG_RISCV_SBI_STATE [Atish, Anup]
 - Picked up r-b's from Atish and Anup

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
 arch/riscv/kvm/vcpu_onereg.c                  |  51 ++++-
 arch/riscv/kvm/vcpu_sbi.c                     |  67 ++++++
 arch/riscv/kvm/vcpu_sbi_sta.c                 | 208 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |   5 +-
 .../selftests/kvm/include/riscv/processor.h   |  22 ++
 .../selftests/kvm/lib/riscv/processor.c       |  45 ++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  26 ---
 .../selftests/kvm/riscv/get-reg-list.c        |  43 ++++
 tools/testing/selftests/kvm/steal_time.c      |  99 +++++++++
 23 files changed, 782 insertions(+), 35 deletions(-)
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
