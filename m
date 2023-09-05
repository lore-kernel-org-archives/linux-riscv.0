Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED16BC83F2C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIL7Z5uOQqs2kOPYZk4i4A08iGPdaIVEPgCAvDKc/iI=; b=jLDGiHJ+GqbtZx
	czooasnMwSR29jBrgM1NRrLtmtuZith3AU2waLZRaVTDdRI16Lclm+W1nvx+vPyh9h8ToJo5Mi764
	aCSMVuYhfW/0KxiG1uyo0CQY4bFQ+Tp/rpcm6sjP2NDlyc+Vidwl7W6wQh66FbgQmia5TXKTIaCvB
	Daph40SWeNri8Wyj+4+MaUY79KIwKlh0306KEBUzQsa+jPKmoUPapT17K4qP7RGHlU0i0M6aREWC2
	ZWhrMtYOojGBjuS4K6rUGF8w67jrVEHkIMWcZ/08DQ07adicTl796RQDAdcmbiCgI2MBWlf0Td/2w
	jVxXFCUUtSNAXfmZ6ABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTQ1-005pv3-0d;
	Tue, 05 Sep 2023 10:36:25 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTPx-005ptN-38
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 10:36:23 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-99bf3f59905so356032366b.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693910178; x=1694514978; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nfqw6iJ4ruL8BEmtuLRWIN/7uvJd+Y/QPLQc2ETsH8Q=;
        b=XZClE/KAiFg7pz2tuP7CWyFJy+BOMmstEItmxW8KVYMoQCiDaMz1dwHwUHlkzUL0r2
         BxHf/YWTLYtMkni1ZL7aYFGFkb6hEFLBqBL7oDZNHo0SRa2pPQt2gT2HFkTBA7kiC175
         XK0m0iBsHiqjq5/RXSXlJJBTEdUqJILokpiQ04TogFbBuk9mOU/FSp0TUoFNLOig8+ck
         YidfpmK7x8YdPmdWeumTqdNIZHjDie3JNFYCeurNNL+iYMcx9ID0YX3PytfllKVp7A2t
         L1pS/1Z1u1m5vAIuvvDgv62gyRGD250Fwe9/JZluywpY3Kk1XPAZLI/ntZJkfuX5Vrfc
         nsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693910178; x=1694514978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nfqw6iJ4ruL8BEmtuLRWIN/7uvJd+Y/QPLQc2ETsH8Q=;
        b=gQW8obEYSWWuf04ZeRMTMcexfcOGzpY1yzsxsKsUYBory1kBvp6BBr2E3KYbuekP0A
         BE+AW/7fe4avhrEwGb09Gf6IXNebPdHXwfkJpbeKhPVGxWDoLwSJaBzOjjXlA5t9gbsV
         wTls2n0b2ZFfOSQ4v3I7bJmUJpBGiGu5oz9zLr6y+h7LW6DOi3MI98Bo/xqA3lMNwuUL
         fqPaHDvAA93bLf4dWwEuUtJjus7Nm2IDSseoUw49MspyURzi2N2vz7FQfVp9mYJzcSH4
         DB1SlFwsh07wHME+vMu4yy0YsI6f5xsgrt18kMf+y98wig5gAGFA7ZWr1ntPnUjlNG0H
         TWZg==
X-Gm-Message-State: AOJu0YxSmdMapfgSexTjyiqixmMJ9+CF6X3rrV9r+8Url//kxE3S/OdB
	KBkGyx6p46S2w1BaBg/2iYHtQw==
X-Google-Smtp-Source: AGHT+IHkRyEbp0w5QIZbj1GlQvlGuscWTdMpQO8f95QsDXvDTy2lmlAWjOWJLe7UTlpwG3PDaD3ODQ==
X-Received: by 2002:a17:906:10db:b0:9a1:e395:2d10 with SMTP id v27-20020a17090610db00b009a1e3952d10mr9165785ejv.75.1693910178039;
        Tue, 05 Sep 2023 03:36:18 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906a40d00b0099bc0daf3d7sm7484299ejz.182.2023.09.05.03.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 03:36:17 -0700 (PDT)
Date: Tue, 5 Sep 2023 12:36:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	wchen <waylingii@gmail.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Aaron Lewis <aaronlewis@google.com>, David Matlack <dmatlack@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Ackerley Tng <ackerleytng@google.com>, Lei Wang <lei4.wang@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Peter Gonda <pgonda@google.com>, Thomas Huth <thuth@redhat.com>, 
	Like Xu <likexu@tencent.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
	David Woodhouse <dwmw@amazon.co.uk>, Michal Luczaj <mhal@rbox.co>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/8] RISCV: Add kvm Sstc timer selftest
Message-ID: <20230905-eb7998dbd945ed9dd12659ea@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1693659382.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_033622_013606_F19CB986 
X-CRM114-Status: GOOD (  17.04  )
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

Hi Haibo,

Some of your patch summaries say 'selftest' instead of 'selftests'. Please
correct those for the next version.

Thanks,
drew

On Sat, Sep 02, 2023 at 08:59:22PM +0800, Haibo Xu wrote:
> The RISC-V arch_timer selftest is used to validate Sstc timer
> functionality in a guest, which sets up periodic timer interrupts
> and check the basic interrupt status upon its receipt.
> 
> This KVM selftest was ported from aarch64 arch_timer and tested
> with Linux v6.5-rc5 on a Qemu riscv64 virt machine.
> 
> ---
> Changed since v1:
>   * Rebase to kvm-riscv/riscv_kvm_next
>   * Cherry-pick Sean's kselftest guest printf patch set
>     https://lore.kernel.org/all/20230729003643.1053367-1-seanjc@google.com/
>   * Copy the entire csr.h verbatim
>   * Unified the function names for exception vector table setup
>     void vm_init_vector_tables(struct kvm_vm *vm);
>     void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
>   * Format the handler.S asm file per Andrew's comments
>   * Consolidate the timer test code for arm64 and riscv
>     based on Andrew's and Sean's suggestion
> 
> Haibo Xu (8):
>   KVM: selftests: Unify the codes for guest exception handling
>   KVM: arm64: selftest: Split arch_timer test code
>   tools: riscv: Add header file csr.h
>   KVM: riscv: selftests: Switch to use macro from csr.h
>   KVM: riscv: selftests: Add exception handling support
>   KVM: riscv: selftests: Add guest helper to get vcpu id
>   KVM: riscv: selftest: Change vcpu_has_ext to a common function
>   KVM: riscv: selftests: Add sstc timer test
> 
>  tools/arch/riscv/include/asm/csr.h            | 521 ++++++++++++++++++
>  tools/testing/selftests/kvm/Makefile          |  11 +-
>  .../selftests/kvm/aarch64/arch_timer.c        | 292 +---------
>  .../selftests/kvm/aarch64/debug-exceptions.c  |   4 +-
>  .../selftests/kvm/aarch64/page_fault_test.c   |   4 +-
>  .../testing/selftests/kvm/aarch64/vgic_irq.c  |   4 +-
>  tools/testing/selftests/kvm/arch_timer.c      | 261 +++++++++
>  .../selftests/kvm/include/aarch64/processor.h |  12 +-
>  .../selftests/kvm/include/kvm_util_base.h     |   9 +
>  .../selftests/kvm/include/riscv/arch_timer.h  |  80 +++
>  .../selftests/kvm/include/riscv/processor.h   |  60 +-
>  .../selftests/kvm/include/timer_test.h        |  58 ++
>  .../selftests/kvm/include/x86_64/processor.h  |   5 -
>  .../selftests/kvm/lib/aarch64/processor.c     |   6 +-
>  .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++
>  .../selftests/kvm/lib/riscv/processor.c       |  86 +++
>  .../selftests/kvm/lib/x86_64/processor.c      |   4 +-
>  .../testing/selftests/kvm/riscv/arch_timer.c  | 130 +++++
>  .../selftests/kvm/riscv/get-reg-list.c        |  14 -
>  tools/testing/selftests/kvm/x86_64/amx_test.c |   4 +-
>  .../selftests/kvm/x86_64/fix_hypercall_test.c |   4 +-
>  .../selftests/kvm/x86_64/hyperv_evmcs.c       |   4 +-
>  .../selftests/kvm/x86_64/hyperv_features.c    |   8 +-
>  .../testing/selftests/kvm/x86_64/hyperv_ipi.c |   6 +-
>  .../selftests/kvm/x86_64/kvm_pv_test.c        |   4 +-
>  .../selftests/kvm/x86_64/monitor_mwait_test.c |   4 +-
>  .../kvm/x86_64/pmu_event_filter_test.c        |   8 +-
>  .../smaller_maxphyaddr_emulation_test.c       |   4 +-
>  .../selftests/kvm/x86_64/svm_int_ctl_test.c   |   4 +-
>  .../kvm/x86_64/svm_nested_shutdown_test.c     |   4 +-
>  .../kvm/x86_64/svm_nested_soft_inject_test.c  |   4 +-
>  .../kvm/x86_64/ucna_injection_test.c          |   8 +-
>  .../kvm/x86_64/userspace_msr_exit_test.c      |   4 +-
>  .../vmx_exception_with_invalid_guest_state.c  |   4 +-
>  .../selftests/kvm/x86_64/vmx_pmu_caps_test.c  |   4 +-
>  .../selftests/kvm/x86_64/xapic_ipi_test.c     |   4 +-
>  .../selftests/kvm/x86_64/xcr0_cpuid_test.c    |   4 +-
>  .../selftests/kvm/x86_64/xen_shinfo_test.c    |   4 +-
>  38 files changed, 1376 insertions(+), 376 deletions(-)
>  create mode 100644 tools/arch/riscv/include/asm/csr.h
>  create mode 100644 tools/testing/selftests/kvm/arch_timer.c
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
>  create mode 100644 tools/testing/selftests/kvm/include/timer_test.h
>  create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
>  create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
