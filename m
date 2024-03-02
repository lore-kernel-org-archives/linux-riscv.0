Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D4C5478C
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4kZLWDT9ytvUp/Pw3TsQPZhYc26nOJesGZC4iHVHoc=; b=VETFCZxWu/nH7e
	2HPg/zkIGjo4lhkEMnJM+ie8euQ7J7ks89xpgndQo2/HCg3zvXaYOvw3UZ9bFuYceZ6FwAC5R6LN4
	PglnOezH0r+WtoVLaIiu04T45OAwIC9vFuS6us0AAHDdZ8uNkFoMdevUzSw5KQxJTTDUvQtHG1Ne4
	mnefw7e9x4sx439pFGcr4Iofiy3rXY5p8zLkEc4M960UzMJ7CLeB4L+y2bHSbPdsLARvrKV9Q9SrW
	eYkuaMGf/3edhbmSB8tvWs3TcBHMjeHkWh8iyqvlznWIxEnHl7LbPJzNML5KVWgVFkF/HdBCB7/Ke
	cPa76KvWIxyJsIaFN5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgOak-00000003Wew-3arR;
	Sat, 02 Mar 2024 12:35:50 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgOah-00000003We2-2svJ
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 12:35:49 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-512e39226efso2830006e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 02 Mar 2024 04:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709382945; x=1709987745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fLmBNF7KnRHNjxFzW+xgQkBjw9RgIhEMQhm8dyjLxo0=;
        b=W8WHNdqrr0K/OXfHAiNklXcnhFxslviLzllwUuHyOHPW0/mM/s+rZyEPsZUwgBoW6b
         BACinOlRvWoAyQJjifj+AnIFi+slK3FL2jYP939ZvNcEBVQmy52YvIUvqd9oKelVbAzU
         Qf4wQyc1omps4f3EMD/jsi7SEHh1lHANV7Xq9BQ/9pqptwi7J7/LOBAm/1apf6kiU746
         WKHHuFOEe0scazQ05m/vS6iToJaAnBLTqBCX9+Do/R+cZh3MH30nLSL5jElBSgTsc+26
         K1cSZQLJDmqawRG5NLhek839DotXy2EW7PvpCMmfBHgSn+UQg9Bd9zhSSvEN3rQixD15
         c7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709382945; x=1709987745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLmBNF7KnRHNjxFzW+xgQkBjw9RgIhEMQhm8dyjLxo0=;
        b=DlyD3KhJrJNC+6bmpDS7pOvUl5AoGrz0GotM9jg2KQrooEGxLJfk+G68gSlMV3E5jA
         7K6wKFTRAeZgxmMwbFEfFrfpVVG3kY2u2rAJFYpcumoXBp4X0iLcYcn8bboW5e+b4rrX
         WDRTowwk8JFU9Nnndb31fKVXU6d/J5GMgW/fqL41A2eqyxmj4zTRRq++bmB1xRbcXfMG
         OFWAvRlE6bNF7+xEhlGq9O/7co+8b2aqfS25jaAcb8H/DhnOjX/+YRJZKpBPOix3Wq5H
         12d9ZjfAqoB4IN3LEYy8+8xzGqsFV3KYJ/ke2s7uqLsrBTXbBbN4bTwazoPYUn7GRwQe
         dTMg==
X-Forwarded-Encrypted: i=1; AJvYcCVVeONhik4M1mrsU1zVl+56DcvZL4+vgVZndQYuLYNkM/VqMYf9z1DPkCcyDRRvS6k3QWhYzE+Hw0pZL9fRVVs76Up+WylS2FKJeLmuL0EQ
X-Gm-Message-State: AOJu0YyotG0aggMdgWMfqk5n+Rjuk4qK9bK4W4kTulgeljh5pOfYVKCi
	6YAXHoByW77+8TEXTy+m91Ve2PJWUqRRuXS/NLYEgA0iiJZ912eTF9WYUOYm69M=
X-Google-Smtp-Source: AGHT+IF7kMvVlfm0QV38CtL+50al6rOjeAc9EACkMvLkxpLCDVBPYC3K3Y+nOEoZwdZtjbgrgiosrA==
X-Received: by 2002:a05:6512:473:b0:513:1e3c:38ec with SMTP id x19-20020a056512047300b005131e3c38ecmr2688559lfd.22.1709382945338;
        Sat, 02 Mar 2024 04:35:45 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g3-20020a056402180300b00566ea8e9f38sm1084255edy.40.2024.03.02.04.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 04:35:44 -0800 (PST)
Date: Sat, 2 Mar 2024 13:35:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 15/15] KVM: riscv: selftests: Add a test for counter
 overflow
Message-ID: <20240302-fb3a4d2c7918a24d10ee4a63@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-16-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240229010130.1380926-16-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_043547_773925_31F04E2D 
X-CRM114-Status: GOOD (  34.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024 at 05:01:30PM -0800, Atish Patra wrote:
> Add a test for verifying overflow interrupt. Currently, it relies on
> overflow support on cycle/instret events. This test works for cycle/
> instret events which support sampling via hpmcounters on the platform.
> There are no ISA extensions to detect if a platform supports that. Thus,

Ouch. Are there discussions/proposals as to how we can do better with
discoverability here? This type of thing sounds like the types of things
that get new extension names defined for them as part of the profile spec
work.

> this test will fail on platform with virtualization but doesn't
> support overflow on these two events.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu.c | 126 +++++++++++++++++++-
>  1 file changed, 125 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu.c b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
> index 8ea2a6db6610..c0264c636054 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
> @@ -8,6 +8,7 @@
>   * Copyright (c) 2024, Rivos Inc.
>   */
>  
> +#include "asm/csr.h"
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> @@ -16,6 +17,7 @@
>  #include "kvm_util.h"
>  #include "test_util.h"
>  #include "processor.h"
> +#include "arch_timer.h"
>  
>  /* Maximum counters (firmware + hardware)*/
>  #define RISCV_MAX_PMU_COUNTERS 64
> @@ -26,6 +28,11 @@ union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
>  static void *snapshot_gva;
>  static vm_paddr_t snapshot_gpa;
>  
> +static int pmu_irq = IRQ_PMU_OVF;
> +
> +static int vcpu_shared_irq_count;
> +static int counter_in_use;
> +
>  /* Cache the available counters in a bitmask */
>  static unsigned long counter_mask_available;
>  
> @@ -69,7 +76,9 @@ unsigned long pmu_csr_read_num(int csr_num)
>  #undef switchcase_csr_read
>  }
>  
> -static inline void dummy_func_loop(int iter)
> +static void stop_counter(unsigned long counter, unsigned long stop_flags);
> +
> +static inline void dummy_func_loop(uint64_t iter)
>  {
>  	int i = 0;
>  
> @@ -88,6 +97,26 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
>  	regs->epc += 4;
>  }
>  
> +static void guest_irq_handler(struct ex_regs *regs)
> +{
> +	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
> +	unsigned long overflown_mask;
> +
> +	/* Stop all counters first to avoid further interrupts */
> +	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0, 1UL << counter_in_use,
> +		  SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT, 0, 0, 0);
> +
> +	csr_clear(CSR_SIP, BIT(pmu_irq));
> +
> +	overflown_mask = READ_ONCE(snapshot_data->ctr_overflow_mask);
> +	GUEST_ASSERT(overflown_mask & (1UL << counter_in_use));
> +
> +	/* Validate that we are in the correct irq handler */
> +	GUEST_ASSERT_EQ(irq_num, pmu_irq);

Should probably do this irq handler assert first.

> +	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
> +}
> +
>  static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
>  				       unsigned long cflags,
>  				       unsigned long event)
> @@ -263,6 +292,32 @@ static void test_pmu_event_snapshot(unsigned long event)
>  	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
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
> +	start_counter(counter, SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT, 0);
> +	dummy_func_loop(10000);
> +	udelay(msecs_to_usecs(2000));
> +	/* irq handler should have stopped the counter */
> +
> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[counter_in_use]);
> +	/* The counter value after stopping should be less the init value due to overflow */
> +	__GUEST_ASSERT(counter_value_post < counter_init_value,
> +		       "counter_value_post %lx counter_init_value %lx for counter\n",
> +		       counter_value_post, counter_init_value);
> +
> +	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
> +}
> +
>  static void test_invalid_event(void)
>  {
>  	struct sbiret ret;
> @@ -361,6 +416,43 @@ static void test_pmu_events_snaphost(int cpu)
>  	GUEST_DONE();
>  }
>  
> +static void test_pmu_events_overflow(int cpu)

no need for cpu

> +{
> +	long out_val = 0;
> +	bool probe;
> +	int num_counters = 0;
> +	unsigned long sbi_impl_version;
> +
> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
> +	GUEST_ASSERT(probe && out_val == 1);
> +
> +	sbi_impl_version = get_host_sbi_impl_version();
> +	if (sbi_impl_version >= sbi_mk_version(2, 0))
> +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");

Identical probe and version check as test_pmu_events_snaphost(). Can
factor out.

> +
> +	snapshot_set_shmem(snapshot_gpa, 0);
> +	csr_set(CSR_IE, BIT(pmu_irq));
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
> +	/* Renable the interrupt again for another event */
> +	csr_set(CSR_IE, BIT(pmu_irq));
> +	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
> +
> +	GUEST_DONE();
> +}
> +
>  static void run_vcpu(struct kvm_vcpu *vcpu)
>  {
>  	struct ucall uc;
> @@ -449,6 +541,35 @@ static void test_vm_events_snapshot_test(void *guest_code)
>  	test_vm_destroy(vm);
>  }
>  
> +static void test_vm_events_overflow(void *guest_code)
> +{
> +	struct kvm_vm *vm = NULL;
> +	struct kvm_vcpu *vcpu = NULL;

nit: no need for NULL

> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(KVM_RISCV_SBI_EXT_PMU)),
> +				   "SBI PMU not available, skipping test");
> +
> +	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSCOFPMF)),
> +				   "Sscofpmf is not available, skipping overflow test");
> +
> +
> +	test_vm_setup_snapshot_mem(vm, vcpu);
> +	vm_init_vector_tables(vm);
> +	vm_install_interrupt_handler(vm, guest_irq_handler);
> +
> +	vcpu_init_vector_tables(vcpu);
> +	/* Initialize guest timer frequency. */
> +	vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency), &timer_freq);
> +	sync_global_to_guest(vm, timer_freq);

I just noticed that timer_freq is in arch_timer.h and isn't an extern...
Fixing that is out of scope for this series though.

> +
> +	vcpu_args_set(vcpu, 1, 0);

no need for args

> +
> +	run_vcpu(vcpu);
> +
> +	test_vm_destroy(vm);
> +}
> +
>  int main(void)
>  {
>  	test_vm_basic_test(test_pmu_basic_sanity);
> @@ -460,5 +581,8 @@ int main(void)
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

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
