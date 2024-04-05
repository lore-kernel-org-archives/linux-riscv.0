Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C006C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 14:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+j5GTiZa3TTfnpTk6NJI5zWJPiBFyj1bGW8YKyTBZjo=; b=niQPfoHyPXr2eN
	IpQgi1XS41ejZ/mrmYyRMtrIBDvlpOMLmBm/jOwtY0nK/ITSyonmxNO+pZnPhn1DvU5aXZmWdPJgY
	r7FADNXuhPnfa8PQAPaGyCa4kFXlb9+rag3ESa7Hz98q6U+awolbBcmKDkLTVYGSMgB8+9Jlddw1Z
	sXiZj/cWqFFn5pxipcLITEN/AvHczF3A/hGYSG3o39Gag0EihzxgkiltBDes61tcMXAc+zhNA2s+m
	tCtyWraQaHa56J1KxeYJVLw6GN7OjNsTFXIopsU1CI/FLfgu19VwfARU3qJ5z/uS7QOWpM+cRQPCi
	Nti+f1oTws1aGTPATLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskei-00000007Uf5-0Ntv;
	Fri, 05 Apr 2024 14:35:00 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjXU-00000007CXb-3Y2A
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 13:23:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a51a8749478so59387466b.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712323402; x=1712928202; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WAlEwvrkVW7t1ChXhk39Ejj3ZEPYPMlfWsiWP+NJhlQ=;
        b=NKpo3yUe5SZGQdFLjmCn592xBfd5FzM6EQHMW/UIJ/8Fd9IX6FE/zQPBQnXV0a2s7a
         d5C/kAYfKgby8QQ9GMKCczo1gO5IrlpCz0CsPa9Tza5IU43+ZADxeA0KGXEjbcdT/ExF
         NDilGPufRTXX6mZ+US3gYgwv+KoqSm8TN1HSxUrr7OQ7exthI46G6wC+ymWpbGzdjVwY
         cR7uMMERJWR7ArEJRQ1JJos3Cj/z/5xkVmabfIiNpB2Fc2S8ALmYeN4xSZvDJhH0/pXV
         GMexeqnSDBCKQs59ZhTM6ozYQNr+YXfYaWWDNxf7dsT3x63ZT+2P9whMvxThDyHKpv7b
         WTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712323402; x=1712928202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAlEwvrkVW7t1ChXhk39Ejj3ZEPYPMlfWsiWP+NJhlQ=;
        b=Q/1+z3OejKkhsPtDmNU+d+8CuzfVzvKR2/lBh2T9L4VFDnr4B5iP3TWidnynqBaD14
         Paq0X1zrvw3aQBx8JO8Z6ZrOyVYVovJeBEKT9mqcLRuIJt+wmsPmfZUUQNwJSTCY73XS
         1JSjtUShU7O9tgy11/Gidv0vGRwFOeFMRiM8EX11aThyTLDsVEkU3Nah11HYibulLu/W
         Z931QKOjbMypNBuXI1VdDwJL6fTu+T+bZwJxW33+8Ug4ciBSJ7A/3UC1ITohWmim6WX3
         Y+2zDHRthaxb2OikJQsks+l6FnhuWUDTbJSpksxWoLgsWqAda8snQehd1jeVlYKITq3a
         x1zw==
X-Forwarded-Encrypted: i=1; AJvYcCXb3vS4JYpf0Iga6if13pQO51GZKYgPJmHAOLStX0PqCZ9pc9PiDbWtuOjRpuz4sFlyzCmMj+5GqN5mwvqkK+zZXtFNlTXkb2RWyA4Fgt9k
X-Gm-Message-State: AOJu0Yy6clfhESaQkUwNA5leENkxynlnChs1l2sITjeDRisM8bcYoEXY
	EFQpLahv00WwuETJYMV8z6+QVrnqN/5DxxVmv+F8EQzvEqOBi80FOeAUVRM9zYw=
X-Google-Smtp-Source: AGHT+IFT5fpj+iBK8UO32k7xz0OaaW2bIAmv7JHzJqwxSEHIQcNC0uhhtNFgJzf9NkGng4ZOEcQb2w==
X-Received: by 2002:a17:906:4a81:b0:a4a:3663:2f51 with SMTP id x1-20020a1709064a8100b00a4a36632f51mr1265585eju.2.1712323402070;
        Fri, 05 Apr 2024 06:23:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id dr2-20020a170907720200b00a4ea1fbb323sm822066ejc.98.2024.04.05.06.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 06:23:21 -0700 (PDT)
Date: Fri, 5 Apr 2024 15:23:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <amakhalov@vmware.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 22/22] KVM: riscv: selftests: Add a test for counter
 overflow
Message-ID: <20240405-3a20fe10d65368651c2d23fa@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-23-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-23-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_062329_061826_90EAAED2 
X-CRM114-Status: GOOD (  29.16  )
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

On Wed, Apr 03, 2024 at 01:04:51AM -0700, Atish Patra wrote:
> Add a test for verifying overflow interrupt. Currently, it relies on
> overflow support on cycle/instret events. This test works for cycle/
> instret events which support sampling via hpmcounters on the platform.
> There are no ISA extensions to detect if a platform supports that. Thus,
> this test will fail on platform with virtualization but doesn't
> support overflow on these two events.

Maybe we should give the user a command line option to disable this test
in case the platform they're testing doesn't support it but they want to
run the rest of the tests without getting a FAIL.

> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 7d195be5c3d9..451db956b885 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -14,6 +14,7 @@
>  #include "test_util.h"
>  #include "processor.h"
>  #include "sbi.h"
> +#include "arch_timer.h"
>  
>  /* Maximum counters(firmware + hardware) */
>  #define RISCV_MAX_PMU_COUNTERS 64
> @@ -24,6 +25,9 @@ union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
>  static void *snapshot_gva;
>  static vm_paddr_t snapshot_gpa;
>  
> +static int vcpu_shared_irq_count;
> +static int counter_in_use;
> +
>  /* Cache the available counters in a bitmask */
>  static unsigned long counter_mask_available;
>  
> @@ -117,6 +121,31 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
>  	regs->epc += 4;
>  }
>  
> +static void guest_irq_handler(struct ex_regs *regs)
> +{
> +	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
> +	unsigned long overflown_mask;
> +	unsigned long counter_val = 0;
> +
> +	/* Validate that we are in the correct irq handler */
> +	GUEST_ASSERT_EQ(irq_num, IRQ_PMU_OVF);
> +
> +	/* Stop all counters first to avoid further interrupts */
> +	stop_counter(counter_in_use, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
> +
> +	csr_clear(CSR_SIP, BIT(IRQ_PMU_OVF));
> +
> +	overflown_mask = READ_ONCE(snapshot_data->ctr_overflow_mask);
> +	GUEST_ASSERT(overflown_mask & 0x01);
> +
> +	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
> +
> +	counter_val = READ_ONCE(snapshot_data->ctr_values[0]);
> +	/* Now start the counter to mimick the real driver behavior */
> +	start_counter(counter_in_use, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_val);
> +}
> +
>  static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
>  				       unsigned long cflags,
>  				       unsigned long event)
> @@ -276,6 +305,33 @@ static void test_pmu_event_snapshot(unsigned long event)
>  	stop_reset_counter(counter, 0);
>  }
>  
> +static void test_pmu_event_overflow(unsigned long event)
> +{
> +	unsigned long counter;
> +	unsigned long counter_value_post;
> +	unsigned long counter_init_value = ULONG_MAX - 10000;
> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
> +
> +	counter = get_counter_index(0, counter_mask_available, 0, event);
> +	counter_in_use = counter;
> +
> +	/* The counter value is updated w.r.t relative index of cbase passed to start/stop */
> +	WRITE_ONCE(snapshot_data->ctr_values[0], counter_init_value);
> +	start_counter(counter, SBI_PMU_START_FLAG_INIT_SNAPSHOT, 0);
> +	dummy_func_loop(10000);
> +	udelay(msecs_to_usecs(2000));
> +	/* irq handler should have stopped the counter */
> +	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
> +
> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
> +	/* The counter value after stopping should be less the init value due to overflow */
> +	__GUEST_ASSERT(counter_value_post < counter_init_value,
> +		       "counter_value_post %lx counter_init_value %lx for counter\n",
> +		       counter_value_post, counter_init_value);
> +
> +	stop_reset_counter(counter, 0);
> +}
> +
>  static void test_invalid_event(void)
>  {
>  	struct sbiret ret;
> @@ -366,6 +422,34 @@ static void test_pmu_events_snaphost(void)
>  	GUEST_DONE();
>  }
>  
> +static void test_pmu_events_overflow(void)
> +{
> +	int num_counters = 0;
> +
> +	/* Verify presence of SBI PMU and minimum requrired SBI version */
> +	verify_sbi_requirement_assert();
> +
> +	snapshot_set_shmem(snapshot_gpa, 0);
> +	csr_set(CSR_IE, BIT(IRQ_PMU_OVF));
> +	local_irq_enable();
> +
> +	/* Get the counter details */
> +	num_counters = get_num_counters();
> +	update_counter_info(num_counters);
> +
> +	/*
> +	 * Qemu supports overflow for cycle/instruction.
> +	 * This test may fail on any platform that do not support overflow for these two events.
> +	 */
> +	test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 1);
> +
> +	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
> +
> +	GUEST_DONE();
> +}
> +
>  static void run_vcpu(struct kvm_vcpu *vcpu)
>  {
>  	struct ucall uc;
> @@ -451,6 +535,33 @@ static void test_vm_events_snapshot_test(void *guest_code)
>  	test_vm_destroy(vm);
>  }
>  
> +static void test_vm_events_overflow(void *guest_code)
> +{
> +	struct kvm_vm *vm = NULL;
> +	struct kvm_vcpu *vcpu;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
> +				   "SBI PMU not available, skipping test");
> +
> +	__TEST_REQUIRE(__vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA_EXT_SSCOFPMF),
> +				   "Sscofpmf is not available, skipping overflow test");
> +
> +

extra blank line here

> +	test_vm_setup_snapshot_mem(vm, vcpu);
> +	vm_init_vector_tables(vm);
> +	vm_install_interrupt_handler(vm, guest_irq_handler);
> +
> +	vcpu_init_vector_tables(vcpu);
> +	/* Initialize guest timer frequency. */
> +	vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency), &timer_freq);
> +	sync_global_to_guest(vm, timer_freq);
> +
> +	run_vcpu(vcpu);
> +
> +	test_vm_destroy(vm);
> +}
> +
>  int main(void)
>  {
>  	pr_info("SBI PMU basic test : starting\n");
> @@ -463,5 +574,8 @@ int main(void)
>  	test_vm_events_snapshot_test(test_pmu_events_snaphost);
>  	pr_info("SBI PMU event verification with snapshot test : PASS\n");
>  
> +	test_vm_events_overflow(test_pmu_events_overflow);
> +	pr_info("SBI PMU event verification with overflow test : PASS\n");
> +
>  	return 0;
>  }
> -- 
> 2.34.1
>

Other than the command line option idea,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
