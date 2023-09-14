Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E96EE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eFztBwEOnLrN2Q48qGQhvgmVrfyiUsvSCCmdUKph5zE=; b=4EZeD/rbPjnnxp
	v14GpeiLUA0jA7q3JX0UWbFbIfeJhu2IZ1UC8hJKXucEZONTLGdF4ppnjkjzQy23xTfvfT4eZWbEj
	SSXNvX05VwqqgQDmmnpqnBWZGiwoLZ4LP8d4DpNgFrJkOnwtgtNalCYsWsaHEjdR0kVmy4qNqrKQk
	tXWKPmzTAIXGhTig8b+fDivD8GkL1vVb4QljYJ/2M1Si7eO4FgJpOTicFsuFsKWodVBkZGLShgBQV
	+SAL3sJnqFw9Cn9Y5E4YpBPpVwgv1LnTCPoq6JaVSq9oo3gPjbyTDoGNYkvrh612uW+XhDUCrpO3m
	/RhoFbgIshqPDnK07Vxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgb9I-006zZH-15;
	Thu, 14 Sep 2023 01:28:04 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgb9E-006zXz-1Y;
	Thu, 14 Sep 2023 01:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694654880; x=1726190880;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ueE/011k9DiwV0Anf9SWAZccz4IuGXFEGSyhfc+Fk0k=;
  b=QSftS22Chh7qkxvaSMnOFRjc1oKA5veczlJMykIDRYMPpAle4sNTxy0E
   84CoMIFxPE2U6I6Iw87I7b68gbluyMP+UCr0jKYv1+n6+ErKLRS+xEEoH
   u3vKIlfU1Bt5wrhUTWamraT8te82iNTxvIf/vfBMBzANUKWPcVOZi9Kta
   /W3VFxLw7Smr1xYtadG3mL1JqHW4343PtcNMbtDvypdDNzrzV24IMJsNX
   EdtdtC0uwFbzbLn7AoscrRRq2+43Gw1Z+H2DOdS0ZRGoJgAdO7hPApfBP
   jON+ng54X5D63ixlfwqNem1bWbzeZGBduwkzk8PrXMIqv3vuzEVhzuWZX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377733960"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="377733960"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="694048860"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="694048860"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:27:48 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: 
Cc: xiaobo55x@gmail.com,
	haibo1.xu@intel.com,
	ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sean Christopherson <seanjc@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Like Xu <likexu@tencent.com>,
	Vipin Sharma <vipinsh@google.com>,
	David Matlack <dmatlack@google.com>,
	Thomas Huth <thuth@redhat.com>,
	Colton Lewis <coltonlewis@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v3 0/9] RISCV: Add kvm Sstc timer selftests
Date: Thu, 14 Sep 2023 09:36:54 +0800
Message-Id: <cover.1694421911.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_182800_530029_A0887E0A 
X-CRM114-Status: GOOD (  12.85  )
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

The RISC-V arch_timer selftests is used to validate Sstc timer
functionality in a guest, which sets up periodic timer interrupts
and check the basic interrupt status upon its receipt.

This KVM selftests was ported from aarch64 arch_timer and tested
with Linux v6.6-rc1 on a Qemu riscv64 virt machine.

---
Changed since v2:
  * Rebase to Linux 6.6-rc1
  * Add separate patch for kvm/Makefile improvement
  * Move aarch64 specific macros to aarch64/arch_timer.c
  * Add -DCONFIG_64BIT to kvm/Makefile CFLAGS to ensure
    only 64bit registers were available in csr.h
  * Avoid some #ifdef in kvm/arch_timer.c by setting some
    aarch64 specific variable to 0 on risc-v

Haibo Xu (9):
  KVM: selftests: Unify the codes for guest exception handling
  KVM: selftests: Unify the makefile rule for split targets
  KVM: arm64: selftests: Split arch_timer test code
  tools: riscv: Add header file csr.h
  KVM: riscv: selftests: Switch to use macro from csr.h
  KVM: riscv: selftests: Add exception handling support
  KVM: riscv: selftests: Add guest helper to get vcpu id
  KVM: riscv: selftests: Change vcpu_has_ext to a common function
  KVM: riscv: selftests: Add sstc timer test

 tools/arch/riscv/include/asm/csr.h            | 521 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |  14 +-
 .../selftests/kvm/aarch64/arch_timer.c        | 291 +---------
 .../selftests/kvm/aarch64/debug-exceptions.c  |   4 +-
 .../selftests/kvm/aarch64/page_fault_test.c   |   4 +-
 .../testing/selftests/kvm/aarch64/vgic_irq.c  |   4 +-
 tools/testing/selftests/kvm/arch_timer.c      | 250 +++++++++
 .../selftests/kvm/include/aarch64/processor.h |  12 +-
 .../selftests/kvm/include/kvm_util_base.h     |   9 +
 .../selftests/kvm/include/riscv/arch_timer.h  |  80 +++
 .../selftests/kvm/include/riscv/processor.h   |  63 ++-
 .../testing/selftests/kvm/include/test_util.h |   2 +
 .../selftests/kvm/include/timer_test.h        |  43 ++
 .../selftests/kvm/include/x86_64/processor.h  |   5 -
 .../selftests/kvm/lib/aarch64/processor.c     |   6 +-
 .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++
 .../selftests/kvm/lib/riscv/processor.c       |  86 +++
 .../selftests/kvm/lib/x86_64/processor.c      |   4 +-
 .../testing/selftests/kvm/riscv/arch_timer.c  | 107 ++++
 .../selftests/kvm/riscv/get-reg-list.c        |  16 +-
 tools/testing/selftests/kvm/x86_64/amx_test.c |   4 +-
 .../selftests/kvm/x86_64/fix_hypercall_test.c |   4 +-
 .../selftests/kvm/x86_64/hyperv_evmcs.c       |   4 +-
 .../selftests/kvm/x86_64/hyperv_features.c    |   8 +-
 .../testing/selftests/kvm/x86_64/hyperv_ipi.c |   6 +-
 .../selftests/kvm/x86_64/kvm_pv_test.c        |   4 +-
 .../selftests/kvm/x86_64/monitor_mwait_test.c |   4 +-
 .../kvm/x86_64/pmu_event_filter_test.c        |   8 +-
 .../smaller_maxphyaddr_emulation_test.c       |   4 +-
 .../selftests/kvm/x86_64/svm_int_ctl_test.c   |   4 +-
 .../kvm/x86_64/svm_nested_shutdown_test.c     |   4 +-
 .../kvm/x86_64/svm_nested_soft_inject_test.c  |   4 +-
 .../kvm/x86_64/ucna_injection_test.c          |   8 +-
 .../kvm/x86_64/userspace_msr_exit_test.c      |   4 +-
 .../vmx_exception_with_invalid_guest_state.c  |   4 +-
 .../selftests/kvm/x86_64/vmx_pmu_caps_test.c  |   4 +-
 .../selftests/kvm/x86_64/xapic_ipi_test.c     |   4 +-
 .../selftests/kvm/x86_64/xcr0_cpuid_test.c    |   4 +-
 .../selftests/kvm/x86_64/xen_shinfo_test.c    |   4 +-
 39 files changed, 1338 insertions(+), 374 deletions(-)
 create mode 100644 tools/arch/riscv/include/asm/csr.h
 create mode 100644 tools/testing/selftests/kvm/arch_timer.c
 create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
 create mode 100644 tools/testing/selftests/kvm/include/timer_test.h
 create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
 create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
