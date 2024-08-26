Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3268AC5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 19:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l12NARvxmYcuzgdrTvvMjEuw6cj/9ect+gLB7r4H02U=; b=fECcd42q/UBnAu
	PIKzqwsBh9+1WeOABHA9jy+GqTuBv/zkDrtlqPT2NnhF+9BhIytGcPmXirJIgnniNDJSzA2usNOUY
	6nzHJKCy90TI4e9IM4Tk1hQz+7+CXLyRJo8dN2kNIiypZ3f5lJjqsvpwSWPXCCcYIRKLHLPBHp2zg
	7RHWwBWv7YxP/f+1Ho0etCE1Aro+WuMhnp1sitYy6Nz8U0UigToLRubX71OirubRaUiLi818J3nzg
	3xr20S3zEMO3Vl5G9tE7+W8cjFXcdYEs5xcf6JiX+roftq0f0tVjs28c4vafZA66K6WWnx5iGhIJ0
	QX5Ue3qPpVVdTQi/FRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sieyr-00000008Qwx-2p6y;
	Mon, 26 Aug 2024 19:02:21 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siexw-00000008Qde-009n
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 19:01:26 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-778702b9f8fso3067840a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724698881; x=1725303681; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ol6yqovvKJzaojHYI1Lewa82yQkAODdCYXZVH3J2eVg=;
        b=F7KMcte9vCbEwYnYJP3f5RmRj8bgZ/Kgj4waZ0/xM7Tkp4ZRRIFIqzrBdOKk8MZ/cm
         GRzxU1jxQuuebvExBtET0h1+4sIgZKCQ3e/iZLNQ0+6dqVnpba5QeuVFZboo3/We9yIN
         JZpx5TTzFK9uK0xDg3aFjWYpanrbuEdHgavRbyeQPnMSRYV2Euu0ZygjoZJPl3Qyi337
         m8PppSLvj+zRa3zCgscBlALPHckp5WS313+d38VhNmQXMXv+bzP8GmU4vdln2fdHFye1
         pZDkh3BcJM3ZC0I0mgc9VtHy4CvgZY7H71jBe4vv9kxFTVFA1Q93zODBkL3iUmMx7mQW
         VOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724698881; x=1725303681;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol6yqovvKJzaojHYI1Lewa82yQkAODdCYXZVH3J2eVg=;
        b=qbdi1TqP7pLqtmcLYArKvRprIlU/uf3BLF7zNtwnPQWaNvavqVrmYsbht7JbKPGJwb
         dEeW/nNj6/XhtvP7LSx6hylc36K8tU/4+xAyuGHSnUHT+Z5QKyLLIpeg56cPe5JbL/jw
         mBERFZTkz5GPc33zKvMraP1UAWfYHhh+47rMB/Tsc0TU4CB/17pOViOujuI7oAna8Py/
         QMg8IF6dmXkhielHNj4Ti9SmTVsFCLAZVtFHpmqJWXEaI6g/f4DN6O+Mr6klb116nA7K
         kvl0ASFxu+oQHxHuYQXE8juh46cm96+7g9yCz7zp5lh4XyvOg421NB164YKaHtwxreJ3
         m+/g==
X-Forwarded-Encrypted: i=1; AJvYcCUbfpWKCQrGT3YoO0ioKrtobtqBZPme+HuFhf1DI24yt5mWziuSpdirX0W5NbQgqtmmuuxsLWxf5ngF6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxKlp6YKiVyGuJwCBaSN71AJAUHES0BuSuet08sgkCpgEVBYd8
	K+FYGnBDZbm2xOZNnq6/jJqri8z9WSXF6ayXe9lnxgPOwpOCBqmOLaWeKi2kLE6v7RQ4ci4thRU
	OYw==
X-Google-Smtp-Source: AGHT+IHZnh61FM4HqhByHwEIjBp8QvMtzNsr1hpE8ea79ucKwMYBDRFhHxUbxCt/VJQqsakjR3G9UZawpiQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:669a:0:b0:7b6:c922:4827 with SMTP id
 41be03b00d2f7-7d214d64ad2mr1255a12.1.1724698880494; Mon, 26 Aug 2024 12:01:20
 -0700 (PDT)
Date: Mon, 26 Aug 2024 12:01:13 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Message-ID: <20240826190116.145945-1-seanjc@google.com>
Subject: [PATCH 0/3] KVM: selftests: Fix unsupported $(ARCH) builds
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_120124_087219_FD40355D 
X-CRM114-Status: UNSURE (   8.56  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Play nice with treewrite builds of unsupported architectures, e.g. arm
(32-bit), as KVM selftests' Makefile doesn't do anything to ensure the
target architecture is actually one KVM selftests supports.

Patches 2-3 are opportunistic changes (since the above Makefile change
will generate conflicts) to switch to using $(ARCH) instead of the target
triple for arch specific directories, e.g. arm64 instead of aarch64,
mainly so as not to be different from the rest of the kernel.

Compile tested on all architectures.

My thinking for applying this is to send a v2 just before (or even during)
the 6.12 merge window and bribe Paolo into applying it directly, i.e. make
this series deal with any conflicts.

Sean Christopherson (3):
  KVM: selftests: Provide empty 'all' and 'clean' targets for
    unsupported ARCHs
  KVM: selftests: Use canonical $(ARCH) paths for KVM selftests
    directories
  KVM: selftests: Override ARCH for x86_64 instead of using ARCH_DIR

 MAINTAINERS                                   |  12 +-
 tools/testing/selftests/kvm/Makefile          | 333 +-----------------
 tools/testing/selftests/kvm/Makefile.kvm      | 315 +++++++++++++++++
 .../kvm/{aarch64 => arm64}/aarch32_id_regs.c  |   0
 .../kvm/{aarch64 => arm64}/arch_timer.c       |   0
 .../kvm/{aarch64 => arm64}/debug-exceptions.c |   0
 .../kvm/{aarch64 => arm64}/get-reg-list.c     |   0
 .../kvm/{aarch64 => arm64}/hypercalls.c       |   0
 .../kvm/{aarch64 => arm64}/page_fault_test.c  |   0
 .../kvm/{aarch64 => arm64}/psci_test.c        |   0
 .../kvm/{aarch64 => arm64}/set_id_regs.c      |   0
 .../kvm/{aarch64 => arm64}/smccc_filter.c     |   0
 .../{aarch64 => arm64}/vcpu_width_config.c    |   0
 .../kvm/{aarch64 => arm64}/vgic_init.c        |   0
 .../kvm/{aarch64 => arm64}/vgic_irq.c         |   0
 .../kvm/{aarch64 => arm64}/vgic_lpi_stress.c  |   0
 .../{aarch64 => arm64}/vpmu_counter_access.c  |   0
 .../selftests/kvm/dirty_log_perf_test.c       |   2 +-
 .../include/{aarch64 => arm64}/arch_timer.h   |   0
 .../kvm/include/{aarch64 => arm64}/delay.h    |   0
 .../kvm/include/{aarch64 => arm64}/gic.h      |   0
 .../kvm/include/{aarch64 => arm64}/gic_v3.h   |   0
 .../include/{aarch64 => arm64}/gic_v3_its.h   |   0
 .../{aarch64 => arm64}/kvm_util_arch.h        |   0
 .../include/{aarch64 => arm64}/processor.h    |   0
 .../kvm/include/{aarch64 => arm64}/spinlock.h |   0
 .../kvm/include/{aarch64 => arm64}/ucall.h    |   0
 .../kvm/include/{aarch64 => arm64}/vgic.h     |   0
 .../{s390x => s390}/diag318_test_handler.h    |   0
 .../include/{s390x => s390}/kvm_util_arch.h   |   0
 .../kvm/include/{s390x => s390}/processor.h   |   0
 .../kvm/include/{s390x => s390}/ucall.h       |   0
 .../kvm/include/{x86_64 => x86}/apic.h        |   0
 .../kvm/include/{x86_64 => x86}/evmcs.h       |   0
 .../kvm/include/{x86_64 => x86}/hyperv.h      |   0
 .../include/{x86_64 => x86}/kvm_util_arch.h   |   0
 .../kvm/include/{x86_64 => x86}/mce.h         |   0
 .../kvm/include/{x86_64 => x86}/pmu.h         |   0
 .../kvm/include/{x86_64 => x86}/processor.h   |   0
 .../kvm/include/{x86_64 => x86}/sev.h         |   0
 .../kvm/include/{x86_64 => x86}/svm.h         |   0
 .../kvm/include/{x86_64 => x86}/svm_util.h    |   0
 .../kvm/include/{x86_64 => x86}/ucall.h       |   0
 .../kvm/include/{x86_64 => x86}/vmx.h         |   0
 .../kvm/lib/{aarch64 => arm64}/gic.c          |   0
 .../kvm/lib/{aarch64 => arm64}/gic_private.h  |   0
 .../kvm/lib/{aarch64 => arm64}/gic_v3.c       |   0
 .../kvm/lib/{aarch64 => arm64}/gic_v3_its.c   |   0
 .../kvm/lib/{aarch64 => arm64}/handlers.S     |   0
 .../kvm/lib/{aarch64 => arm64}/processor.c    |   0
 .../kvm/lib/{aarch64 => arm64}/spinlock.c     |   0
 .../kvm/lib/{aarch64 => arm64}/ucall.c        |   0
 .../kvm/lib/{aarch64 => arm64}/vgic.c         |   0
 .../{s390x => s390}/diag318_test_handler.c    |   0
 .../kvm/lib/{s390x => s390}/processor.c       |   0
 .../selftests/kvm/lib/{s390x => s390}/ucall.c |   0
 .../selftests/kvm/lib/{x86_64 => x86}/apic.c  |   0
 .../kvm/lib/{x86_64 => x86}/handlers.S        |   0
 .../kvm/lib/{x86_64 => x86}/hyperv.c          |   0
 .../kvm/lib/{x86_64 => x86}/memstress.c       |   0
 .../selftests/kvm/lib/{x86_64 => x86}/pmu.c   |   0
 .../kvm/lib/{x86_64 => x86}/processor.c       |   0
 .../selftests/kvm/lib/{x86_64 => x86}/sev.c   |   0
 .../selftests/kvm/lib/{x86_64 => x86}/svm.c   |   0
 .../selftests/kvm/lib/{x86_64 => x86}/ucall.c |   0
 .../selftests/kvm/lib/{x86_64 => x86}/vmx.c   |   0
 .../selftests/kvm/{s390x => s390}/cmma_test.c |   0
 .../kvm/{s390x => s390}/debug_test.c          |   0
 .../selftests/kvm/{s390x => s390}/memop.c     |   0
 .../selftests/kvm/{s390x => s390}/resets.c    |   0
 .../{s390x => s390}/shared_zeropage_test.c    |   0
 .../kvm/{s390x => s390}/sync_regs_test.c      |   0
 .../selftests/kvm/{s390x => s390}/tprot.c     |   0
 .../selftests/kvm/{x86_64 => x86}/amx_test.c  |   0
 .../kvm/{x86_64 => x86}/apic_bus_clock_test.c |   0
 .../kvm/{x86_64 => x86}/cpuid_test.c          |   0
 .../kvm/{x86_64 => x86}/cr4_cpuid_sync_test.c |   0
 .../kvm/{x86_64 => x86}/debug_regs.c          |   0
 .../dirty_log_page_splitting_test.c           |   0
 .../exit_on_emulation_failure_test.c          |   0
 .../kvm/{x86_64 => x86}/fix_hypercall_test.c  |   0
 .../kvm/{x86_64 => x86}/flds_emulation.h      |   0
 .../{x86_64 => x86}/get_msr_index_features.c  |   0
 .../kvm/{x86_64 => x86}/hwcr_msr_test.c       |   0
 .../kvm/{x86_64 => x86}/hyperv_clock.c        |   0
 .../kvm/{x86_64 => x86}/hyperv_cpuid.c        |   0
 .../kvm/{x86_64 => x86}/hyperv_evmcs.c        |   0
 .../hyperv_extended_hypercalls.c              |   0
 .../kvm/{x86_64 => x86}/hyperv_features.c     |   0
 .../kvm/{x86_64 => x86}/hyperv_ipi.c          |   0
 .../kvm/{x86_64 => x86}/hyperv_svm_test.c     |   0
 .../kvm/{x86_64 => x86}/hyperv_tlb_flush.c    |   0
 .../kvm/{x86_64 => x86}/kvm_clock_test.c      |   0
 .../kvm/{x86_64 => x86}/kvm_pv_test.c         |   0
 .../kvm/{x86_64 => x86}/max_vcpuid_cap_test.c |   0
 .../kvm/{x86_64 => x86}/monitor_mwait_test.c  |   0
 .../{x86_64 => x86}/nested_exceptions_test.c  |   0
 .../kvm/{x86_64 => x86}/nx_huge_pages_test.c  |   0
 .../kvm/{x86_64 => x86}/nx_huge_pages_test.sh |   0
 .../kvm/{x86_64 => x86}/platform_info_test.c  |   0
 .../kvm/{x86_64 => x86}/pmu_counters_test.c   |   0
 .../{x86_64 => x86}/pmu_event_filter_test.c   |   0
 .../private_mem_conversions_test.c            |   0
 .../private_mem_kvm_exits_test.c              |   0
 .../{x86_64 => x86}/recalc_apic_map_test.c    |   0
 .../kvm/{x86_64 => x86}/set_boot_cpu_id.c     |   0
 .../kvm/{x86_64 => x86}/set_sregs_test.c      |   0
 .../kvm/{x86_64 => x86}/sev_init2_tests.c     |   0
 .../kvm/{x86_64 => x86}/sev_migrate_tests.c   |   0
 .../kvm/{x86_64 => x86}/sev_smoke_test.c      |   0
 .../smaller_maxphyaddr_emulation_test.c       |   0
 .../selftests/kvm/{x86_64 => x86}/smm_test.c  |   0
 .../kvm/{x86_64 => x86}/state_test.c          |   0
 .../kvm/{x86_64 => x86}/svm_int_ctl_test.c    |   0
 .../svm_nested_shutdown_test.c                |   0
 .../svm_nested_soft_inject_test.c             |   0
 .../kvm/{x86_64 => x86}/svm_vmcall_test.c     |   0
 .../kvm/{x86_64 => x86}/sync_regs_test.c      |   0
 .../{x86_64 => x86}/triple_fault_event_test.c |   0
 .../kvm/{x86_64 => x86}/tsc_msrs_test.c       |   0
 .../kvm/{x86_64 => x86}/tsc_scaling_sync.c    |   0
 .../kvm/{x86_64 => x86}/ucna_injection_test.c |   0
 .../kvm/{x86_64 => x86}/userspace_io_test.c   |   0
 .../{x86_64 => x86}/userspace_msr_exit_test.c |   0
 .../{x86_64 => x86}/vmx_apic_access_test.c    |   0
 .../vmx_close_while_nested_test.c             |   0
 .../kvm/{x86_64 => x86}/vmx_dirty_log_test.c  |   0
 .../vmx_exception_with_invalid_guest_state.c  |   0
 .../vmx_invalid_nested_guest_state.c          |   0
 .../kvm/{x86_64 => x86}/vmx_msrs_test.c       |   0
 .../vmx_nested_tsc_scaling_test.c             |   0
 .../kvm/{x86_64 => x86}/vmx_pmu_caps_test.c   |   0
 .../vmx_preemption_timer_test.c               |   0
 .../vmx_set_nested_state_test.c               |   0
 .../kvm/{x86_64 => x86}/vmx_tsc_adjust_test.c |   0
 .../kvm/{x86_64 => x86}/xapic_ipi_test.c      |   0
 .../kvm/{x86_64 => x86}/xapic_state_test.c    |   0
 .../kvm/{x86_64 => x86}/xcr0_cpuid_test.c     |   0
 .../kvm/{x86_64 => x86}/xen_shinfo_test.c     |   0
 .../kvm/{x86_64 => x86}/xen_vmcall_test.c     |   0
 .../kvm/{x86_64 => x86}/xss_msr_test.c        |   0
 141 files changed, 330 insertions(+), 332 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/Makefile.kvm
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/aarch32_id_regs.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/arch_timer.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/debug-exceptions.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/get-reg-list.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/hypercalls.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/page_fault_test.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/psci_test.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/set_id_regs.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/smccc_filter.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/vcpu_width_config.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/vgic_init.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/vgic_irq.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/vgic_lpi_stress.c (100%)
 rename tools/testing/selftests/kvm/{aarch64 => arm64}/vpmu_counter_access.c (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/arch_timer.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/delay.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/gic.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/gic_v3.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/gic_v3_its.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/kvm_util_arch.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/processor.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/spinlock.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/ucall.h (100%)
 rename tools/testing/selftests/kvm/include/{aarch64 => arm64}/vgic.h (100%)
 rename tools/testing/selftests/kvm/include/{s390x => s390}/diag318_test_handler.h (100%)
 rename tools/testing/selftests/kvm/include/{s390x => s390}/kvm_util_arch.h (100%)
 rename tools/testing/selftests/kvm/include/{s390x => s390}/processor.h (100%)
 rename tools/testing/selftests/kvm/include/{s390x => s390}/ucall.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/apic.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/evmcs.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/hyperv.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/kvm_util_arch.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/mce.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/pmu.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/processor.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/sev.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/svm.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/svm_util.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/ucall.h (100%)
 rename tools/testing/selftests/kvm/include/{x86_64 => x86}/vmx.h (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/gic.c (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/gic_private.h (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/gic_v3.c (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/gic_v3_its.c (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/handlers.S (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/processor.c (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/spinlock.c (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/ucall.c (100%)
 rename tools/testing/selftests/kvm/lib/{aarch64 => arm64}/vgic.c (100%)
 rename tools/testing/selftests/kvm/lib/{s390x => s390}/diag318_test_handler.c (100%)
 rename tools/testing/selftests/kvm/lib/{s390x => s390}/processor.c (100%)
 rename tools/testing/selftests/kvm/lib/{s390x => s390}/ucall.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/apic.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/handlers.S (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/hyperv.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/memstress.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/pmu.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/processor.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/sev.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/svm.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/ucall.c (100%)
 rename tools/testing/selftests/kvm/lib/{x86_64 => x86}/vmx.c (100%)
 rename tools/testing/selftests/kvm/{s390x => s390}/cmma_test.c (100%)
 rename tools/testing/selftests/kvm/{s390x => s390}/debug_test.c (100%)
 rename tools/testing/selftests/kvm/{s390x => s390}/memop.c (100%)
 rename tools/testing/selftests/kvm/{s390x => s390}/resets.c (100%)
 rename tools/testing/selftests/kvm/{s390x => s390}/shared_zeropage_test.c (100%)
 rename tools/testing/selftests/kvm/{s390x => s390}/sync_regs_test.c (100%)
 rename tools/testing/selftests/kvm/{s390x => s390}/tprot.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/amx_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/apic_bus_clock_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/cpuid_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/cr4_cpuid_sync_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/debug_regs.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/dirty_log_page_splitting_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/exit_on_emulation_failure_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/fix_hypercall_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/flds_emulation.h (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/get_msr_index_features.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hwcr_msr_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hyperv_clock.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hyperv_cpuid.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hyperv_evmcs.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hyperv_extended_hypercalls.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hyperv_features.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hyperv_ipi.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hyperv_svm_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/hyperv_tlb_flush.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/kvm_clock_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/kvm_pv_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/max_vcpuid_cap_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/monitor_mwait_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/nested_exceptions_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/nx_huge_pages_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/nx_huge_pages_test.sh (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/platform_info_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/pmu_counters_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/pmu_event_filter_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/private_mem_conversions_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/private_mem_kvm_exits_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/recalc_apic_map_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/set_boot_cpu_id.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/set_sregs_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/sev_init2_tests.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/sev_migrate_tests.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/sev_smoke_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/smaller_maxphyaddr_emulation_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/smm_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/state_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/svm_int_ctl_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/svm_nested_shutdown_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/svm_nested_soft_inject_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/svm_vmcall_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/sync_regs_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/triple_fault_event_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/tsc_msrs_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/tsc_scaling_sync.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/ucna_injection_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/userspace_io_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/userspace_msr_exit_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_apic_access_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_close_while_nested_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_dirty_log_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_exception_with_invalid_guest_state.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_invalid_nested_guest_state.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_msrs_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_nested_tsc_scaling_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_pmu_caps_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_preemption_timer_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_set_nested_state_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/vmx_tsc_adjust_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/xapic_ipi_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/xapic_state_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/xcr0_cpuid_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/xen_shinfo_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/xen_vmcall_test.c (100%)
 rename tools/testing/selftests/kvm/{x86_64 => x86}/xss_msr_test.c (100%)


base-commit: 15e1c3d65975524c5c792fcd59f7d89f00402261
-- 
2.46.0.295.g3b9ea8a38a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
