Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C6AC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 23:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=60ffIktbazfChQPot1WaI3LVdV6rLQPG/Y+DOLUDHFU=; b=TeJDildNIE5uW5
	8oYJJIENL3iDsIgexe+JaH6XuPQFJRMbtOGVzCAFMVIpIJeRPFr3r4iotp1Hy4t79L8LgvnkACGRd
	bRUV1UY3FSK5UDGHKvma6hNaY7h99A1KijUkUEkTnNqU2rOEjzuzotPf4SXYiZ+tsrU3+sSpSXLtk
	cXEiq7R6C+Es5TV73LSQru6M8B/h9F9nP77Teqrl0VJjPWki1K5XNwxFXdObfnblh3/dYRB45uG+g
	8TywjKAhmjEem7WYodmP+loX6gpF3D4tkl2/+4E+MsU5jjD3hZbUurq5UNB/klK1KtRCeF88t6vhI
	fO0M+v2FK6wBgb1K6wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuUV-0000000G0jr-06ac;
	Thu, 14 Mar 2024 23:28:03 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTF-0000000Fzpq-31hS
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:26:52 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-60cc00203faso32677137b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458800; x=1711063600; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7s5Hb/mvTE7PCNAe2dunBDM+z2TyWomMuHISUh3bYw=;
        b=pQ8a+0EEgNhAQjdzU4mwGEaCIJq7urhPHMcTDgnPA3C+C/SCtplSSwujhBveLldC5C
         u5D6vXdsRz4ZEQCQVYClcPAB0emKUJ1BItFBSF8qjNO/37slGl00oVVuvcGj5FMws/Rw
         Y+0lYgu/k+QvRCBA/Xu6LKq11zuZ4mvPnzwjQfbpMoxhuMjiD4FBIiNWjYqoenCQbbYL
         iYbfN9PDMd7M6NRWM0BXyBoeWzYNuMmX3OYYbwjkLN3B6oZ0sVPJFgLtnyCg9OV4Dcqz
         Bm2EMGo8w5+3Fwfj0R6Zyv5xRkuPazeA6LDkfWexCLlFCYly2xW0R0/PUzZC7g9zZgkV
         vIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458800; x=1711063600;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7s5Hb/mvTE7PCNAe2dunBDM+z2TyWomMuHISUh3bYw=;
        b=fFEza2aQ6nrUJ9CXy+o5E5/L1kTQIvse2ckaQ3jqCW/a1cnjQa4ADdFmyuLhh8M82Z
         5k0dzEVOw6qIlFeTc+59dq8pBO175aOs0nIhbs82h1bhkglegfYffEqqdW6fWRoiZykQ
         v2ZiTnoqAqtkGVoFFcsS8MA/60auATCbXWLfZrGIhzBQlPsU30twKC/K/r4La/97Ye49
         40uUZ4ydAcKLrpsLGlZxVfW8saRPqc8eQ1+kH18J6Vollv6JR2Y1xPezpZMjYjB6LDaL
         kv6cg5nakNEqHIoCG2LuVQetUqNaSTS23kNUyCIrhORS6nStaMSdSyn7h4Bkiv/Fk18t
         X8yw==
X-Forwarded-Encrypted: i=1; AJvYcCXHaDaiZyeBAEAKG3oTBWpU7fWqOr2PVY3Qy6ZyJa1l9U6UojzwKdvROh/fGQrODWBqi6loAi2V5ic4ldp4bb27fwKwlNEqVisqH6FOsJCJ
X-Gm-Message-State: AOJu0YyJtOdL7CXEYMJ28tjygbMKLqbh+PucJtLcCtugORF/AfKhP4W9
	/IlRj0Vm94GfWcDW0rqofasKuLFzH9Md2eHoDJT5N5h/0fyY5Ny33P8FU2o2Y6NGHN4MqtMeGoU
	Zng==
X-Google-Smtp-Source: AGHT+IHgAdumMdpyEXTw01m4vqKLDoztLrdIMo9Notb2dmLotdpfdICdJ17nIIZegdAzzB6H1KgUKYmEItw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:f10f:0:b0:60d:47bf:235a with SMTP id
 h15-20020a81f10f000000b0060d47bf235amr173723ywm.5.1710458799770; Thu, 14 Mar
 2024 16:26:39 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:19 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-1-seanjc@google.com>
Subject: [PATCH 00/18] KVM: selftests: Clean up x86's DT initialization
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_162645_919277_E0A222AB 
X-CRM114-Status: GOOD (  10.62  )
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

The vast majority of this series is x86 specific, and aims to clean up the
core library's handling of descriptor tables and segments.  Currently, the
library (a) waits until vCPUs are created to allocate per-VM assets, and
(b) forces tests to opt-in to allocate the structures needed to handler
exceptions, which has result in some rather odd tests, and makes it
unnecessarily difficult to debug unexpected exceptions.

By the end of this series, the descriptor tables, segments, and exception
handlers are allocated and installed when non-barebones VMs are created.

Patch 1 is a selftests-tree-wide change to drop kvm_util_base.h.  The
existence of that file has baffled (and annoyed) me for quite a long time.
After rereading its initial changelog multiple times, I realized that the
_only_ reason it exists is so that files don't need to manually #include
ucall_common.h.

Patch 1 will obviously create conflicts all over the place, though with
the help of meld, I've found them all trivially easy to resolve.  If no
objects to the removal of kvm_util_base.h, I will try to bribe Paolo into
grabbing it early in the 6.10 cycle so that everyone can bring it into
the arch trees.

Ackerley Tng (1):
  KVM: selftests: Fix off-by-one initialization of GDT limit

Sean Christopherson (17):
  Revert "kvm: selftests: move base kvm_util.h declarations to
    kvm_util_base.h"
  KVM: sefltests: Add kvm_util_types.h to hold common types, e.g.
    vm_vaddr_t
  KVM: selftests: Move GDT, IDT, and TSS fields to x86's kvm_vm_arch
  KVM: selftests: Move platform_info_test's main assert into guest code
  KVM: selftests: Rework platform_info_test to actually verify #GP
  KVM: selftests: Explicitly clobber the IDT in the "delete memslot"
    testcase
  KVM: selftests: Move x86's descriptor table helpers "up" in
    processor.c
  KVM: selftests: Rename x86's vcpu_setup() to vcpu_init_sregs()
  KVM: selftests: Init IDT and exception handlers for all VMs/vCPUs on
    x86
  KVM: selftests: Map x86's exception_handlers at VM creation, not vCPU
    setup
  KVM: selftests: Allocate x86's GDT during VM creation
  KVM: selftests: Drop superfluous switch() on vm->mode in
    vcpu_init_sregs()
  KVM: selftests: Fold x86's descriptor tables helpers into
    vcpu_init_sregs()
  KVM: selftests: Allocate x86's TSS at VM creation
  KVM: selftests: Add macro for TSS selector, rename up code/data macros
  KVM: selftests: Init x86's segments during VM creation
  KVM: selftests: Drop @selector from segment helpers

 .../selftests/kvm/aarch64/arch_timer.c        |    1 +
 tools/testing/selftests/kvm/arch_timer.c      |    1 +
 .../selftests/kvm/demand_paging_test.c        |    1 +
 .../selftests/kvm/dirty_log_perf_test.c       |    1 +
 tools/testing/selftests/kvm/dirty_log_test.c  |    1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |    2 +-
 .../testing/selftests/kvm/guest_print_test.c  |    1 +
 .../selftests/kvm/include/aarch64/processor.h |    2 +
 .../selftests/kvm/include/aarch64/ucall.h     |    2 +-
 .../testing/selftests/kvm/include/kvm_util.h  | 1111 +++++++++++++++-
 .../selftests/kvm/include/kvm_util_base.h     | 1135 -----------------
 .../selftests/kvm/include/kvm_util_types.h    |   20 +
 .../selftests/kvm/include/s390x/ucall.h       |    2 +-
 .../kvm/include/x86_64/kvm_util_arch.h        |    6 +
 .../selftests/kvm/include/x86_64/processor.h  |    5 +-
 .../selftests/kvm/include/x86_64/ucall.h      |    2 +-
 .../selftests/kvm/kvm_page_table_test.c       |    1 +
 .../selftests/kvm/lib/aarch64/processor.c     |    2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |    1 +
 tools/testing/selftests/kvm/lib/memstress.c   |    1 +
 .../selftests/kvm/lib/riscv/processor.c       |    1 +
 .../testing/selftests/kvm/lib/ucall_common.c  |    5 +-
 .../selftests/kvm/lib/x86_64/processor.c      |  305 ++---
 .../testing/selftests/kvm/riscv/arch_timer.c  |    1 +
 tools/testing/selftests/kvm/rseq_test.c       |    1 +
 tools/testing/selftests/kvm/s390x/cmma_test.c |    1 +
 tools/testing/selftests/kvm/s390x/memop.c     |    1 +
 tools/testing/selftests/kvm/s390x/tprot.c     |    1 +
 .../selftests/kvm/set_memory_region_test.c    |   12 +
 tools/testing/selftests/kvm/steal_time.c      |    1 +
 tools/testing/selftests/kvm/x86_64/amx_test.c |    2 -
 .../x86_64/dirty_log_page_splitting_test.c    |    1 +
 .../x86_64/exit_on_emulation_failure_test.c   |    2 +-
 .../selftests/kvm/x86_64/fix_hypercall_test.c |    2 -
 .../selftests/kvm/x86_64/hyperv_evmcs.c       |    2 -
 .../selftests/kvm/x86_64/hyperv_features.c    |    6 -
 .../testing/selftests/kvm/x86_64/hyperv_ipi.c |    3 -
 .../selftests/kvm/x86_64/kvm_pv_test.c        |    3 -
 .../selftests/kvm/x86_64/monitor_mwait_test.c |    3 -
 .../selftests/kvm/x86_64/platform_info_test.c |   59 +-
 .../selftests/kvm/x86_64/pmu_counters_test.c  |    3 -
 .../kvm/x86_64/pmu_event_filter_test.c        |    6 -
 .../smaller_maxphyaddr_emulation_test.c       |    3 -
 .../selftests/kvm/x86_64/svm_int_ctl_test.c   |    3 -
 .../kvm/x86_64/svm_nested_shutdown_test.c     |    5 +-
 .../kvm/x86_64/svm_nested_soft_inject_test.c  |    5 +-
 .../kvm/x86_64/ucna_injection_test.c          |    5 -
 .../kvm/x86_64/userspace_msr_exit_test.c      |    3 -
 .../vmx_exception_with_invalid_guest_state.c  |    3 -
 .../selftests/kvm/x86_64/vmx_pmu_caps_test.c  |    3 -
 .../selftests/kvm/x86_64/xapic_ipi_test.c     |    2 -
 .../selftests/kvm/x86_64/xcr0_cpuid_test.c    |    3 -
 .../selftests/kvm/x86_64/xen_shinfo_test.c    |    2 -
 53 files changed, 1335 insertions(+), 1421 deletions(-)
 delete mode 100644 tools/testing/selftests/kvm/include/kvm_util_base.h
 create mode 100644 tools/testing/selftests/kvm/include/kvm_util_types.h


base-commit: e9a2bba476c8332ed547fce485c158d03b0b9659
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
