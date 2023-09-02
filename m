Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84200C001DB
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CN0Ex32wmAdbHBKaG7K6fF62iUrXMisWWnkk0kdCehs=; b=YtyFNaml7MIWdv
	C/SpmethYtyuT+U0oArqdNhwhPb0Tz1+6KugywIcNrEHAqb5s2m/okDQ+qQyB03gqO8c45ql2k3Vm
	RL3K/9vbHeEYUZljSnUBdtDztr3uIYlNw20V9bngN2xYoQbdwxkb3P4PQVammhoeAe2TZGhWTenQw
	GLkTvkOkxMiRhWFHiP5G0wYtQcflP0sGk8Yn/euRMePTEfjq4Mheo2VOCAm5Dg155gagRwZ8rbUrt
	MVf6dv6vkknYIksxu1EEwAYNMDLDlfvXqlRRyyKz50ZEsSqIQ3u9rhrtk0h1aAj0M5+VVkrhuldKf
	Secr7GrO9FP8M6mubmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcQ5E-001R3n-1L;
	Sat, 02 Sep 2023 12:50:36 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcQ5A-001R2a-1t;
	Sat, 02 Sep 2023 12:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693659032; x=1725195032;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1yJ8TMy38aSsT7Y7ApKktxIaSJdCAx0h8LuoNfgnrN8=;
  b=WlpTPRP9xL1wp0Xe64PVNc3q8fSN/faYRFIYrsWZsUfio1S4fhjpdLzi
   8hUWLFiMUSw/5+6ah0+ow8ifak0/XqSDaVp4MI/truCeYEfJUDYDPssLN
   t3VYoQk18eZJdq6wzpAQy+msyDYJ7oA25CE6n3smszEUb8Q/W48HbAkdv
   w+AOSWfOdncPJeH2RaLnuj30enFy64TEzhmu9Vc+Z5RURm0D0lh8h9vwE
   CCtvn24lHruC/QfmGvMmO6cpUSxFIvsSYdVSAe/HxMT79CVZnnuzHQjT/
   mKzQwjQSttLSpsHy0d9WE4GDilXR6uVi+v1KHljZICkRLSrju0odVJKeW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="366599150"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="366599150"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 05:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="855021919"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="855021919"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 05:50:21 -0700
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
	Guo Ren <guoren@kernel.org>,
	wchen <waylingii@gmail.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Sean Christopherson <seanjc@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Aaron Lewis <aaronlewis@google.com>,
	David Matlack <dmatlack@google.com>,
	Mingwei Zhang <mizhang@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Lei Wang <lei4.wang@intel.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Peter Gonda <pgonda@google.com>,
	Thomas Huth <thuth@redhat.com>,
	Like Xu <likexu@tencent.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Michal Luczaj <mhal@rbox.co>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 0/8] RISCV: Add kvm Sstc timer selftest
Date: Sat,  2 Sep 2023 20:59:22 +0800
Message-Id: <cover.1693659382.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_055032_718671_D7D9886C 
X-CRM114-Status: GOOD (  13.07  )
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

The RISC-V arch_timer selftest is used to validate Sstc timer
functionality in a guest, which sets up periodic timer interrupts
and check the basic interrupt status upon its receipt.

This KVM selftest was ported from aarch64 arch_timer and tested
with Linux v6.5-rc5 on a Qemu riscv64 virt machine.

---
Changed since v1:
  * Rebase to kvm-riscv/riscv_kvm_next
  * Cherry-pick Sean's kselftest guest printf patch set
    https://lore.kernel.org/all/20230729003643.1053367-1-seanjc@google.com/
  * Copy the entire csr.h verbatim
  * Unified the function names for exception vector table setup
    void vm_init_vector_tables(struct kvm_vm *vm);
    void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
  * Format the handler.S asm file per Andrew's comments
  * Consolidate the timer test code for arm64 and riscv
    based on Andrew's and Sean's suggestion

Haibo Xu (8):
  KVM: selftests: Unify the codes for guest exception handling
  KVM: arm64: selftest: Split arch_timer test code
  tools: riscv: Add header file csr.h
  KVM: riscv: selftests: Switch to use macro from csr.h
  KVM: riscv: selftests: Add exception handling support
  KVM: riscv: selftests: Add guest helper to get vcpu id
  KVM: riscv: selftest: Change vcpu_has_ext to a common function
  KVM: riscv: selftests: Add sstc timer test

 tools/arch/riscv/include/asm/csr.h            | 521 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |  11 +-
 .../selftests/kvm/aarch64/arch_timer.c        | 292 +---------
 .../selftests/kvm/aarch64/debug-exceptions.c  |   4 +-
 .../selftests/kvm/aarch64/page_fault_test.c   |   4 +-
 .../testing/selftests/kvm/aarch64/vgic_irq.c  |   4 +-
 tools/testing/selftests/kvm/arch_timer.c      | 261 +++++++++
 .../selftests/kvm/include/aarch64/processor.h |  12 +-
 .../selftests/kvm/include/kvm_util_base.h     |   9 +
 .../selftests/kvm/include/riscv/arch_timer.h  |  80 +++
 .../selftests/kvm/include/riscv/processor.h   |  60 +-
 .../selftests/kvm/include/timer_test.h        |  58 ++
 .../selftests/kvm/include/x86_64/processor.h  |   5 -
 .../selftests/kvm/lib/aarch64/processor.c     |   6 +-
 .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++
 .../selftests/kvm/lib/riscv/processor.c       |  86 +++
 .../selftests/kvm/lib/x86_64/processor.c      |   4 +-
 .../testing/selftests/kvm/riscv/arch_timer.c  | 130 +++++
 .../selftests/kvm/riscv/get-reg-list.c        |  14 -
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
 38 files changed, 1376 insertions(+), 376 deletions(-)
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
