Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14D1C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSdLB/BxCaZB7Vbt4yBylf/ZW221T5+ESO3Vc2ShCGI=; b=3J34Dh363neWak
	RFE1E0Fq4vInBDdXjXDBVcJyjuDbQM9jxd4EV8cPUy5Bm9ToF9AnPfnRAHczdBeRnJQY+7jAtR2WJ
	xkV/QhEh/frPP53b30LdquyhnCKamYXKZtNMRAWHOHfF6+9iqFISuYW7EtXtFBq2G1akcrykkT91T
	qUcTg0d7or2/u9kNXpVu3EQYds4x3Igh7iopdjZ55OmrCdvbV0IJMn4I6peCEn6+D5hrrufDM4bIA
	L2oUodIiKUjohm9+3kc5DUD9VLwkIYCh3er6iO5eYFWUYv3TRvAjq6p/wFAcaXRdtpC3chMpX1Zu7
	XgmV4bjqZEFO3jAz69Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u9w-008x3q-7F; Tue, 13 Dec 2022 01:32:40 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syu-00894z-OC
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:15 +0000
Received: by mail-pg1-x54a.google.com with SMTP id q63-20020a632a42000000b0045724b1dfb9so8546224pgq.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=iaggZY6D6UfFXqqTQeav5mkn69NNdHNCOFauIZUnoGM=;
        b=czhUe/RM1vX8uC3ixSupn81mlVxf2Ti23rxzwMQmgEMrXpHHtjLMqdVrkGTwwBD6/u
         jCkHjupPCQ8QI7uPi9QYeehzrvpk0pgW7ENARmJG0E+H98nz8hzcUkkFDNOrltUuRpl6
         PWQ07kMRSvcWyxmMGEAhMKe/Y3AbuOWf7REE0o7BoR2ePGqsOfLHv6t6CtSWzEw6V2UQ
         8ffChaMMLsSyYSqf++EMVfTePDxU8dVE5I5DIWaQn17NmTORPN8BZJjaDqATMLSn8nXo
         kOHsSwoOvSwnPxgC0U6NWgsNSglGMhUsvGKWl8UsOEFi1mrJQaWoypOzvt4LqNHWJV8d
         5+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaggZY6D6UfFXqqTQeav5mkn69NNdHNCOFauIZUnoGM=;
        b=en7dxXZvMbaTo7ngmcTg+IlLhX2pQ6YRDFHeAgskyf/v79NnpCb4tJ2ZNhdO7PPix3
         /Ty3Cyaj85PTcLWydZcV+HXqBcDrcAS8b+G3lGidTMjfcOdpFY0E7YOBD7MsQDEhBhpe
         oXxzKYOfkIu8fEGoyayk5FRETCGu6+oJOg5DuMgwVFfbUC+mesbOLr7kV4paxwQT8rWQ
         3nOFtYMK8VAkoP9fGo9+d0hnyzsuKLFsaNrNCGr8T5IPJ0qtpEAUcR+W6JSV4Zykr4Vr
         6RpA+KmAX22XAcsH2EgrGCSDewAez1d34qerEeo5zdjknDl815SZ2VaA6yzwbqVFqUFZ
         lGpw==
X-Gm-Message-State: ANoB5pmihE6HUeryp/EhhCm7rfjXhXMORk8WBEYF/xAaaz1PeJU07jy4
	04CFGmAKOy/e2qWw/2OV5bzfkUXgI5I=
X-Google-Smtp-Source: AA0mqf423P0K3F775j7XRU0bNQseuIHeq8Bl9zlGMEI+Slu8o9KGU81MdqivvnEry1U+9Xe7aVS/pd3oOHM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec92:b0:189:cdc8:725c with SMTP id
 x18-20020a170902ec9200b00189cdc8725cmr23371937plg.162.1670890623569; Mon, 12
 Dec 2022 16:17:03 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:43 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-5-seanjc@google.com>
Subject: [PATCH 04/14] KVM: selftests: Use pattern matching in .gitignore
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_161712_839553_14FD383A 
X-CRM114-Status: UNSURE (   7.40  )
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

Use pattern matching to exclude everything except .c, .h, .S, and .sh
files from Git.  Manually adding every test target has an absurd
maintenance cost, is comically error prone, and leads to bikeshedding
over whether or not the targets should be listed in alphabetical order.

Deliberately do not include the one-off assets, e.g. config, settings,
.gitignore itself, etc as Git doesn't ignore files that are already in
the repository.  Adding the one-off assets won't prevent mistakes where
developers forget to --force add files that don't match the "allowed".

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/.gitignore | 91 ++------------------------
 1 file changed, 6 insertions(+), 85 deletions(-)

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 6ce8c488d62e..6d9381d60172 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -1,86 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
-/aarch64/aarch32_id_regs
-/aarch64/arch_timer
-/aarch64/debug-exceptions
-/aarch64/get-reg-list
-/aarch64/hypercalls
-/aarch64/page_fault_test
-/aarch64/psci_test
-/aarch64/vcpu_width_config
-/aarch64/vgic_init
-/aarch64/vgic_irq
-/s390x/memop
-/s390x/resets
-/s390x/sync_regs_test
-/s390x/tprot
-/x86_64/amx_test
-/x86_64/cpuid_test
-/x86_64/cr4_cpuid_sync_test
-/x86_64/debug_regs
-/x86_64/exit_on_emulation_failure_test
-/x86_64/fix_hypercall_test
-/x86_64/get_msr_index_features
-/x86_64/kvm_clock_test
-/x86_64/kvm_pv_test
-/x86_64/hyperv_clock
-/x86_64/hyperv_cpuid
-/x86_64/hyperv_evmcs
-/x86_64/hyperv_features
-/x86_64/hyperv_ipi
-/x86_64/hyperv_svm_test
-/x86_64/hyperv_tlb_flush
-/x86_64/max_vcpuid_cap_test
-/x86_64/mmio_warning_test
-/x86_64/monitor_mwait_test
-/x86_64/nested_exceptions_test
-/x86_64/nx_huge_pages_test
-/x86_64/platform_info_test
-/x86_64/pmu_event_filter_test
-/x86_64/set_boot_cpu_id
-/x86_64/set_sregs_test
-/x86_64/sev_migrate_tests
-/x86_64/smaller_maxphyaddr_emulation_test
-/x86_64/smm_test
-/x86_64/state_test
-/x86_64/svm_vmcall_test
-/x86_64/svm_int_ctl_test
-/x86_64/svm_nested_soft_inject_test
-/x86_64/svm_nested_shutdown_test
-/x86_64/sync_regs_test
-/x86_64/tsc_msrs_test
-/x86_64/tsc_scaling_sync
-/x86_64/ucna_injection_test
-/x86_64/userspace_io_test
-/x86_64/userspace_msr_exit_test
-/x86_64/vmx_apic_access_test
-/x86_64/vmx_close_while_nested_test
-/x86_64/vmx_dirty_log_test
-/x86_64/vmx_exception_with_invalid_guest_state
-/x86_64/vmx_invalid_nested_guest_state
-/x86_64/vmx_msrs_test
-/x86_64/vmx_preemption_timer_test
-/x86_64/vmx_set_nested_state_test
-/x86_64/vmx_tsc_adjust_test
-/x86_64/vmx_nested_tsc_scaling_test
-/x86_64/xapic_ipi_test
-/x86_64/xapic_state_test
-/x86_64/xen_shinfo_test
-/x86_64/xen_vmcall_test
-/x86_64/xss_msr_test
-/x86_64/vmx_pmu_caps_test
-/x86_64/triple_fault_event_test
-/access_tracking_perf_test
-/demand_paging_test
-/dirty_log_test
-/dirty_log_perf_test
-/hardware_disable_test
-/kvm_create_max_vcpus
-/kvm_page_table_test
-/max_guest_memory_test
-/memslot_modification_stress_test
-/memslot_perf_test
-/rseq_test
-/set_memory_region_test
-/steal_time
-/kvm_binary_stats_test
-/system_counter_offset_test
+*
+!/**/
+!*.c
+!*.h
+!*.S
+!*.sh
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
