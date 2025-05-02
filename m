Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C31C3ABB0
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoqSa4jX03H7bl/OrgZg4e09lWOKOWSD7aNP75HfkFI=; b=g0g5MiHSgGCWaD
	MVeqUDPeBz9O30p4YKGsVUO2MrlvVBi8knGRwAz2yA5S2NjEiZ1yWpCUN6Q2nC2GzOaA9GxOHIlzS
	FTJjgJm0FD64zRxoVCgEH+LoZlc+WGlSq8AUgbqY/WAJOBMuyOXIKQF8LGXdpXjFIP1wy9xoXT+lb
	Rt/OnCpZSkpMesTp2IcO9s3Q5vG5u1ZbakHHJdlCy/41PLHjufCM182QlweGEwrjruSHjQ6Yme/He
	KH3hhnan4Arhgmmj9tvEUOfjSS137mbX4DfdM75E6oEOKZJYFU2JcBe1hf8KdyS7h/OmEcumuXlxh
	C1TfYQATmHfpSKIoKl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmcR-00000001Ks0-3gp6;
	Fri, 02 May 2025 09:23:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmQi-00000001JBQ-0JED
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 09:11:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39ac9aea656so1820055f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746177094; x=1746781894; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gXzE2i4AryizPUU3DTFjJXcKE9ptqOcpT3iT/m3wd3E=;
        b=U/WXqpCRDuQnnyTaOi6s0XDG2cu86WKFr3c+EkKZ5J0Q+gUm+o690L4BLtV7vxPzAs
         JWeHmY1pH9yTZ/HJKJtbYzpvpAhA+L9IchY74B+6KC6fyuKgWpMdW+ZGYVol+9sVMNw+
         xLE3f/+2etxPKd1xrZTv0OKeP2cRlz9UbVBHhqFn94SHlek7SbvicdsIJ0PzyczQGJ4w
         VkibbBDW8R8Y1u6d66hld3fyDfayGarXwXA2Of3lDzpJacJXczF/8X5bDdGLoE4rxKPM
         olMlE9xoKW5VsnV+9MyDuPwSdaNx9HU6Ija3n3cXpvkOzlD2HQXbDJJAuNK/adZIQG/D
         2UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177094; x=1746781894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXzE2i4AryizPUU3DTFjJXcKE9ptqOcpT3iT/m3wd3E=;
        b=Kzwty+seKJcKe24+BOrOBSz/dRhtOlXY/AdbcKjQ4ee8t/xSRFMhsKJoUDwUdkQmWG
         8b1ToA/IVDfqisaxsiYTkIhGygUa3qWQtOknzTL+dK3BjfJm48R+mfnWTdls/dN3xgGi
         3SwoGGNXUkmv2ZWY+tfyCp78m7JzflMb1W/u3fo8KxzDGCmu9OJEIkQwjVCvshpd2oPP
         wr/38Qh6OS3DtFF5TPRH3oRxlpivd13ExKbGCUKWh8wHyd2eV1EZQ/BD97Bxkdm8O5/g
         rkwLQ0S1uEu830u18qaeJID3bc436EY744SMgrw/5TpeGpN5o6FERC1d8ZKmN9p1eyLI
         IGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9dn3SLAM0g++GUNcmPEowlIHDfj0GBF/tHoJSMvUkHaAkL9Zbv+JOONzNOXyTdCgvfITbiyeMNVt3ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ZRWT8koYIia6c1H0hbnOoA3J8AITrA/dnvwjSWknCpOHTujh
	hdr9bV1QCEhdWEDwf4SegXJWyH7w8ZG3Rx9emcjpKeHbBf5bQ1O8ZrYbgpawEvo=
X-Gm-Gg: ASbGnctn9xZGE3i88kzggUR4yritEwJmgfXCm8Sr4Wz0PniVNTu5N6fUyCViSIjcuyc
	dYKb7CSKWOKEt9QMrCjQLrziR0zxzfYP3PBZ06x4KT5B2Yf4ZDH8bwDk+trTDGUQDmBSaSKSir5
	bFR2a1EVrAmG+6OB0htpafiHA7Suu3EuWsAhhysqadlC+pq8wOwkHOcuqk3C2Ib3UZySFvoFobv
	sB5XQu2F4+NXqrLe9kQBeqA8LmBTROwf+AkObkJgozDMQ9jqsr465vr+C+YFCgDDTYf/S0WHAKs
	FUUg4dxtwbgeGqKrMOQzuUcG6Aeb
X-Google-Smtp-Source: AGHT+IFLO+lieH2l9o22zM4hNzgOdmLC5uRP/QbJfFqwQoBZocQ6E9yoE5Mi9r2iJeQIpusVXpuhtg==
X-Received: by 2002:a05:6000:2483:b0:3a0:90c3:dd90 with SMTP id ffacd0b85a97d-3a099ad325amr1464591f8f.11.1746177093768;
        Fri, 02 May 2025 02:11:33 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3b62sm1596223f8f.34.2025.05.02.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:11:33 -0700 (PDT)
Date: Fri, 2 May 2025 11:11:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
Message-ID: <20250502-4ce093460911542ad7c624e1@orel>
References: <20250501183304.2433192-1-dmatlack@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_021136_115927_D0C68792 
X-CRM114-Status: GOOD (  19.68  )
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

On Thu, May 01, 2025 at 11:32:54AM -0700, David Matlack wrote:
> This series renames types across all KVM selftests to more align with
> types used in the kernel:
> 
>   vm_vaddr_t -> gva_t
>   vm_paddr_t -> gpa_t
> 
>   uint64_t -> u64
>   uint32_t -> u32
>   uint16_t -> u16
>   uint8_t  -> u8
> 
>   int64_t -> s64
>   int32_t -> s32
>   int16_t -> s16
>   int8_t  -> s8
> 
> The goal of this series is to make the KVM selftests code more concise
> (the new type names are shorter) and more similar to the kernel, since
> selftests are developed by kernel developers.
> 
> I know broad changes like this series can be difficult to merge and also
> muddies up the git-blame history, so if there isn't appetite for this we
> can drop it. But if there is I would be happy to help with rebasing and
> resolving merge conflicts to get it in.

I don't have a strong preference on this. I'm used to the uint*t stuff
since I work on QEMU frequently, but the u* stuff is also fine by me.
I guess the biggest downside is the git-blame muddying, but,
[knock-on-wood] we don't typically have a lot of bisecting / bug fixing
to do.

Thanks,
drew

> 
> Most of the commits in this series are auto-generated with a single
> command (see commit messages), aside from whitespace fixes, so rebasing
> onto a different base isn't terrible.
> 
> David Matlack (10):
>   KVM: selftests: Use gva_t instead of vm_vaddr_t
>   KVM: selftests: Use gpa_t instead of vm_paddr_t
>   KVM: selftests: Use gpa_t for GPAs in Hyper-V selftests
>   KVM: selftests: Use u64 instead of uint64_t
>   KVM: selftests: Use s64 instead of int64_t
>   KVM: selftests: Use u32 instead of uint32_t
>   KVM: selftests: Use s32 instead of int32_t
>   KVM: selftests: Use u16 instead of uint16_t
>   KVM: selftests: Use s16 instead of int16_t
>   KVM: selftests: Use u8 instead of uint8_t
> 
>  .../selftests/kvm/access_tracking_perf_test.c |  40 +--
>  tools/testing/selftests/kvm/arch_timer.c      |   6 +-
>  .../selftests/kvm/arm64/aarch32_id_regs.c     |  14 +-
>  .../testing/selftests/kvm/arm64/arch_timer.c  |   8 +-
>  .../kvm/arm64/arch_timer_edge_cases.c         | 159 +++++----
>  .../selftests/kvm/arm64/debug-exceptions.c    |  73 ++--
>  .../testing/selftests/kvm/arm64/hypercalls.c  |  24 +-
>  .../testing/selftests/kvm/arm64/no-vgic-v3.c  |   6 +-
>  .../selftests/kvm/arm64/page_fault_test.c     |  82 ++---
>  tools/testing/selftests/kvm/arm64/psci_test.c |  26 +-
>  .../testing/selftests/kvm/arm64/set_id_regs.c |  58 ++--
>  .../selftests/kvm/arm64/smccc_filter.c        |  10 +-
>  tools/testing/selftests/kvm/arm64/vgic_init.c |  56 ++--
>  tools/testing/selftests/kvm/arm64/vgic_irq.c  | 116 +++----
>  .../selftests/kvm/arm64/vgic_lpi_stress.c     |  20 +-
>  .../selftests/kvm/arm64/vpmu_counter_access.c |  62 ++--
>  .../testing/selftests/kvm/coalesced_io_test.c |  38 +--
>  .../selftests/kvm/demand_paging_test.c        |  10 +-
>  .../selftests/kvm/dirty_log_perf_test.c       |  14 +-
>  tools/testing/selftests/kvm/dirty_log_test.c  |  82 ++---
>  tools/testing/selftests/kvm/get-reg-list.c    |   2 +-
>  .../testing/selftests/kvm/guest_memfd_test.c  |   2 +-
>  .../testing/selftests/kvm/guest_print_test.c  |  22 +-
>  .../selftests/kvm/hardware_disable_test.c     |   6 +-
>  .../selftests/kvm/include/arm64/arch_timer.h  |  30 +-
>  .../selftests/kvm/include/arm64/delay.h       |   4 +-
>  .../testing/selftests/kvm/include/arm64/gic.h |   8 +-
>  .../selftests/kvm/include/arm64/gic_v3_its.h  |   8 +-
>  .../selftests/kvm/include/arm64/processor.h   |  20 +-
>  .../selftests/kvm/include/arm64/ucall.h       |   4 +-
>  .../selftests/kvm/include/arm64/vgic.h        |  20 +-
>  .../testing/selftests/kvm/include/kvm_util.h  | 311 +++++++++---------
>  .../selftests/kvm/include/kvm_util_types.h    |   4 +-
>  .../testing/selftests/kvm/include/memstress.h |  30 +-
>  .../selftests/kvm/include/riscv/arch_timer.h  |  22 +-
>  .../selftests/kvm/include/riscv/processor.h   |   9 +-
>  .../selftests/kvm/include/riscv/ucall.h       |   4 +-
>  .../kvm/include/s390/diag318_test_handler.h   |   2 +-
>  .../selftests/kvm/include/s390/facility.h     |   4 +-
>  .../selftests/kvm/include/s390/ucall.h        |   4 +-
>  .../testing/selftests/kvm/include/sparsebit.h |   6 +-
>  .../testing/selftests/kvm/include/test_util.h |  40 +--
>  .../selftests/kvm/include/timer_test.h        |  18 +-
>  .../selftests/kvm/include/ucall_common.h      |  22 +-
>  .../selftests/kvm/include/userfaultfd_util.h  |   6 +-
>  .../testing/selftests/kvm/include/x86/apic.h  |  22 +-
>  .../testing/selftests/kvm/include/x86/evmcs.h |  22 +-
>  .../selftests/kvm/include/x86/hyperv.h        |  28 +-
>  .../selftests/kvm/include/x86/kvm_util_arch.h |  12 +-
>  tools/testing/selftests/kvm/include/x86/pmu.h |   6 +-
>  .../selftests/kvm/include/x86/processor.h     | 272 ++++++++-------
>  tools/testing/selftests/kvm/include/x86/sev.h |  14 +-
>  .../selftests/kvm/include/x86/svm_util.h      |  10 +-
>  .../testing/selftests/kvm/include/x86/ucall.h |   2 +-
>  tools/testing/selftests/kvm/include/x86/vmx.h |  80 ++---
>  .../selftests/kvm/kvm_page_table_test.c       |  54 +--
>  tools/testing/selftests/kvm/lib/arm64/gic.c   |   6 +-
>  .../selftests/kvm/lib/arm64/gic_private.h     |  24 +-
>  .../testing/selftests/kvm/lib/arm64/gic_v3.c  |  84 ++---
>  .../selftests/kvm/lib/arm64/gic_v3_its.c      |  12 +-
>  .../selftests/kvm/lib/arm64/processor.c       | 126 +++----
>  tools/testing/selftests/kvm/lib/arm64/ucall.c |  12 +-
>  tools/testing/selftests/kvm/lib/arm64/vgic.c  |  38 +--
>  tools/testing/selftests/kvm/lib/elf.c         |   8 +-
>  tools/testing/selftests/kvm/lib/guest_modes.c |   2 +-
>  .../testing/selftests/kvm/lib/guest_sprintf.c |  18 +-
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 222 +++++++------
>  tools/testing/selftests/kvm/lib/memstress.c   |  38 +--
>  .../selftests/kvm/lib/riscv/processor.c       |  56 ++--
>  .../kvm/lib/s390/diag318_test_handler.c       |  12 +-
>  .../testing/selftests/kvm/lib/s390/facility.c |   2 +-
>  .../selftests/kvm/lib/s390/processor.c        |  42 +--
>  tools/testing/selftests/kvm/lib/sparsebit.c   |  18 +-
>  tools/testing/selftests/kvm/lib/test_util.c   |  30 +-
>  .../testing/selftests/kvm/lib/ucall_common.c  |  30 +-
>  .../selftests/kvm/lib/userfaultfd_util.c      |  14 +-
>  tools/testing/selftests/kvm/lib/x86/apic.c    |   2 +-
>  tools/testing/selftests/kvm/lib/x86/hyperv.c  |  14 +-
>  .../testing/selftests/kvm/lib/x86/memstress.c |  10 +-
>  tools/testing/selftests/kvm/lib/x86/pmu.c     |   4 +-
>  .../testing/selftests/kvm/lib/x86/processor.c | 178 +++++-----
>  tools/testing/selftests/kvm/lib/x86/sev.c     |  14 +-
>  tools/testing/selftests/kvm/lib/x86/svm.c     |  16 +-
>  tools/testing/selftests/kvm/lib/x86/ucall.c   |   4 +-
>  tools/testing/selftests/kvm/lib/x86/vmx.c     | 108 +++---
>  .../kvm/memslot_modification_stress_test.c    |  10 +-
>  .../testing/selftests/kvm/memslot_perf_test.c | 164 ++++-----
>  tools/testing/selftests/kvm/mmu_stress_test.c |  28 +-
>  .../selftests/kvm/pre_fault_memory_test.c     |  12 +-
>  .../testing/selftests/kvm/riscv/arch_timer.c  |   8 +-
>  .../testing/selftests/kvm/riscv/ebreak_test.c |   6 +-
>  .../selftests/kvm/riscv/get-reg-list.c        |   2 +-
>  .../selftests/kvm/riscv/sbi_pmu_test.c        |   8 +-
>  tools/testing/selftests/kvm/s390/debug_test.c |   8 +-
>  tools/testing/selftests/kvm/s390/memop.c      |  94 +++---
>  tools/testing/selftests/kvm/s390/resets.c     |   6 +-
>  .../selftests/kvm/s390/shared_zeropage_test.c |   2 +-
>  tools/testing/selftests/kvm/s390/tprot.c      |  24 +-
>  .../selftests/kvm/s390/ucontrol_test.c        |   2 +-
>  .../selftests/kvm/set_memory_region_test.c    |  40 +--
>  tools/testing/selftests/kvm/steal_time.c      |  52 +--
>  .../kvm/system_counter_offset_test.c          |  12 +-
>  tools/testing/selftests/kvm/x86/amx_test.c    |  14 +-
>  .../selftests/kvm/x86/apic_bus_clock_test.c   |  24 +-
>  tools/testing/selftests/kvm/x86/cpuid_test.c  |   6 +-
>  tools/testing/selftests/kvm/x86/debug_regs.c  |   4 +-
>  .../kvm/x86/dirty_log_page_splitting_test.c   |  16 +-
>  .../selftests/kvm/x86/feature_msrs_test.c     |  12 +-
>  .../selftests/kvm/x86/fix_hypercall_test.c    |  20 +-
>  .../selftests/kvm/x86/flds_emulation.h        |   6 +-
>  .../testing/selftests/kvm/x86/hwcr_msr_test.c |  10 +-
>  .../testing/selftests/kvm/x86/hyperv_clock.c  |   6 +-
>  .../testing/selftests/kvm/x86/hyperv_evmcs.c  |  10 +-
>  .../kvm/x86/hyperv_extended_hypercalls.c      |  20 +-
>  .../selftests/kvm/x86/hyperv_features.c       |  26 +-
>  tools/testing/selftests/kvm/x86/hyperv_ipi.c  |  12 +-
>  .../selftests/kvm/x86/hyperv_svm_test.c       |  10 +-
>  .../selftests/kvm/x86/hyperv_tlb_flush.c      |  36 +-
>  .../selftests/kvm/x86/kvm_clock_test.c        |  14 +-
>  tools/testing/selftests/kvm/x86/kvm_pv_test.c |  10 +-
>  .../selftests/kvm/x86/monitor_mwait_test.c    |   2 +-
>  .../selftests/kvm/x86/nested_emulation_test.c |  20 +-
>  .../kvm/x86/nested_exceptions_test.c          |   6 +-
>  .../selftests/kvm/x86/nx_huge_pages_test.c    |  18 +-
>  .../selftests/kvm/x86/platform_info_test.c    |   6 +-
>  .../selftests/kvm/x86/pmu_counters_test.c     | 108 +++---
>  .../selftests/kvm/x86/pmu_event_filter_test.c | 102 +++---
>  .../kvm/x86/private_mem_conversions_test.c    |  78 ++---
>  .../kvm/x86/private_mem_kvm_exits_test.c      |  14 +-
>  .../selftests/kvm/x86/set_boot_cpu_id.c       |   6 +-
>  .../selftests/kvm/x86/set_sregs_test.c        |   6 +-
>  .../selftests/kvm/x86/sev_init2_tests.c       |   6 +-
>  .../selftests/kvm/x86/sev_smoke_test.c        |  14 +-
>  .../x86/smaller_maxphyaddr_emulation_test.c   |  10 +-
>  tools/testing/selftests/kvm/x86/smm_test.c    |   8 +-
>  tools/testing/selftests/kvm/x86/state_test.c  |  14 +-
>  .../selftests/kvm/x86/svm_int_ctl_test.c      |   2 +-
>  .../kvm/x86/svm_nested_shutdown_test.c        |   2 +-
>  .../kvm/x86/svm_nested_soft_inject_test.c     |  10 +-
>  .../selftests/kvm/x86/svm_vmcall_test.c       |   2 +-
>  .../selftests/kvm/x86/sync_regs_test.c        |   2 +-
>  .../kvm/x86/triple_fault_event_test.c         |   4 +-
>  .../testing/selftests/kvm/x86/tsc_msrs_test.c |   2 +-
>  .../selftests/kvm/x86/tsc_scaling_sync.c      |   4 +-
>  .../selftests/kvm/x86/ucna_injection_test.c   |  45 +--
>  .../selftests/kvm/x86/userspace_io_test.c     |   4 +-
>  .../kvm/x86/userspace_msr_exit_test.c         |  58 ++--
>  .../selftests/kvm/x86/vmx_apic_access_test.c  |   4 +-
>  .../kvm/x86/vmx_close_while_nested_test.c     |   2 +-
>  .../selftests/kvm/x86/vmx_dirty_log_test.c    |   4 +-
>  .../kvm/x86/vmx_invalid_nested_guest_state.c  |   2 +-
>  .../testing/selftests/kvm/x86/vmx_msrs_test.c |  22 +-
>  .../kvm/x86/vmx_nested_tsc_scaling_test.c     |  26 +-
>  .../selftests/kvm/x86/vmx_pmu_caps_test.c     |  12 +-
>  .../kvm/x86/vmx_preemption_timer_test.c       |   2 +-
>  .../selftests/kvm/x86/vmx_tsc_adjust_test.c   |  12 +-
>  .../selftests/kvm/x86/xapic_ipi_test.c        |  58 ++--
>  .../selftests/kvm/x86/xapic_state_test.c      |  20 +-
>  .../selftests/kvm/x86/xcr0_cpuid_test.c       |   8 +-
>  .../selftests/kvm/x86/xen_shinfo_test.c       |  22 +-
>  .../testing/selftests/kvm/x86/xss_msr_test.c  |   2 +-
>  161 files changed, 2323 insertions(+), 2338 deletions(-)
> 
> 
> base-commit: 45eb29140e68ffe8e93a5471006858a018480a45
> prerequisite-patch-id: 3bae97c9e1093148763235f47a84fa040b512d04
> -- 
> 2.49.0.906.g1f30a19c02-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
