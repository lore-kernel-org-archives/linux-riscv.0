Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26682C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqG0JZxRhc7KBACPB8JbQjqDyU7UM1HGOJzNzaffwfA=; b=W8MZwve5pAFzG+ZeLzCRtju9+o
	0oNOf5vH/kB4WyZCUqL0e83hV2wYWMl3HNe0FXM/dOZUMkEVlZlYUH/lKqAMCgOO5by45c8mr0GZB
	K3G6QkkyX+jKtACmEhZCuG9IxuHerF+gfBVN5+Fxs0UclsV+OZ+zWPo//rPWaKbfEfLU0c1Ujc4Cl
	6oJNEMxt2bRFDQdXrTAEGlhid/41IEnwjjj7ssTJCwXik+eCEtZBSAngMVmEH1b6iPstMnaLQyeT7
	gq3fQTpfRafFTNOdXaXWFf+jG26CRc/5jE+Efi1N3GcDIPpw20hHt6mTejSOooVuPykWKAKm5QZV9
	sUSlFWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZiz-0000000AI3e-3c0C;
	Tue, 02 Apr 2024 08:42:33 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZiw-0000000AI2E-2VMI
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 08:42:32 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ea838bf357so3820074b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 01:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712047349; x=1712652149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=afh5OaKuMfMLyjYIAfIBdXfS0bylET/+oqOyOLeuEas=;
        b=XZ3j+1F3fQlDtC6qubaa7BZnyAElTHGmh/WD9HrTMhMnhL5JVN3zICV3v9h2cibbMJ
         RSZYboMPgvDvOlODRxIU75/A3IWECYg/Z82T9EPCX1F9YarAmj+wBkWSVxlDmcRWsmJ2
         mwMOgg4iCvuOXCZoE2M6+pBIK/zE6afWV69pLYS5K9a/Ue446ElfIgYbGlE3Osv4DSud
         P6tqbYveCSsAEswA6AuIAIw2TJKiQxRHtsotDrjpvy3W2YDTifyf8+0SWnshm4P7u7vs
         w+xPAY+wAt/Oyz05TZxNobf5OP1x0Xr1jNmvOnPRJ+ZWZ578UWqAoLaUIJOvuiApNNpi
         zlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712047349; x=1712652149;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afh5OaKuMfMLyjYIAfIBdXfS0bylET/+oqOyOLeuEas=;
        b=f/WAvQipbHQlgKsQLK0ORZ2RTSzIfAU8pKKjPYz8sdftmg8aZ0nbfQZ92W6baS+V7K
         fas0b5Wfrm1EDIB907rtrbuhzIgqvIkjdBNgMTgqoQQ7BvHor+U90hU/VLu/1P48jcfG
         em5fSQtlJo63sJrRXVoBMcxdE4VEBLRrxQcTsAgYcJxSsiNKu7lwCXudoGRg3UPfqjkj
         wm5CO5HmfbE21mooUTngcAXsDJk68iFZTanN3o5cwCGvaVw6Fx/iTG73wpyZ+TMJ3LIO
         UWV1aCuFUTHpRUrICWJX1t977CrRIDg+r/2ZBN4LGDTNU/Eru9tOYRurzAPksPVBbujG
         NLfw==
X-Forwarded-Encrypted: i=1; AJvYcCWTO+MKyjH0RO0L+6idTXDc+P4R2WwCjkRvKJtOTB0+J6XAM3QbDOBkwtV3o8SvXDNzECv0ca02uJBKfI066PN+Vms+pH5jVcXEam/TdmY9
X-Gm-Message-State: AOJu0Yzdz5bZSrrqgjD7yntrVlhXDlDtaKC0XCrF4n9hy1OMkiplozrx
	N17dN9De/8s0CdhZVJWMx7L44t8KygvCVCjwcppoxNOzillo/TS8O9P7KFCcJ00=
X-Google-Smtp-Source: AGHT+IGIBpAHqLeUqYqY/I5AiG/85DRZ33edmSV9gedKZK5X9bTJZYi476/i9hbZ6V4Mt7L5BhnDsw==
X-Received: by 2002:a05:6a20:3241:b0:1a3:df1d:deba with SMTP id hm1-20020a056a20324100b001a3df1ddebamr8729596pzc.31.1712047348688;
        Tue, 02 Apr 2024 01:42:28 -0700 (PDT)
Received: from [172.16.0.34] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id e19-20020a63f553000000b005e485fbd455sm9184675pgk.45.2024.04.02.01.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 01:42:28 -0700 (PDT)
Message-ID: <f9bac0a6-5fbe-4928-b6c4-94f70c726cbe@rivosinc.com>
Date: Tue, 2 Apr 2024 01:42:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 15/15] KVM: riscv: selftests: Add a test for counter
 overflow
To: Andrew Jones <ajones@ventanamicro.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-16-atishp@rivosinc.com>
 <20240302-fb3a4d2c7918a24d10ee4a63@orel>
X-Mozilla-News-Host: news://nntp.lore.kernel.org
Content-Language: en-US
In-Reply-To: <20240302-fb3a4d2c7918a24d10ee4a63@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_014230_708211_6B59A7E2 
X-CRM114-Status: GOOD (  36.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/2/24 04:35, Andrew Jones wrote:
> On Wed, Feb 28, 2024 at 05:01:30PM -0800, Atish Patra wrote:
>> Add a test for verifying overflow interrupt. Currently, it relies on
>> overflow support on cycle/instret events. This test works for cycle/
>> instret events which support sampling via hpmcounters on the platform.
>> There are no ISA extensions to detect if a platform supports that. Thus,
> 
> Ouch. Are there discussions/proposals as to how we can do better with
> discoverability here? This type of thing sounds like the types of things
> that get new extension names defined for them as part of the profile spec
> work.
> 

There is a Perf events TG started (last month) which will work on 
standardzing perf events for RISC-V.

Perf tool can also rely on the json file to figure out if sampling 
support or not. But for kselftests we don't have any of these 
infrastructure.

>> this test will fail on platform with virtualization but doesn't
>> support overflow on these two events.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   tools/testing/selftests/kvm/riscv/sbi_pmu.c | 126 +++++++++++++++++++-
>>   1 file changed, 125 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu.c b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> index 8ea2a6db6610..c0264c636054 100644
>> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> @@ -8,6 +8,7 @@
>>    * Copyright (c) 2024, Rivos Inc.
>>    */
>>   
>> +#include "asm/csr.h"
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>> @@ -16,6 +17,7 @@
>>   #include "kvm_util.h"
>>   #include "test_util.h"
>>   #include "processor.h"
>> +#include "arch_timer.h"
>>   
>>   /* Maximum counters (firmware + hardware)*/
>>   #define RISCV_MAX_PMU_COUNTERS 64
>> @@ -26,6 +28,11 @@ union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
>>   static void *snapshot_gva;
>>   static vm_paddr_t snapshot_gpa;
>>   
>> +static int pmu_irq = IRQ_PMU_OVF;
>> +
>> +static int vcpu_shared_irq_count;
>> +static int counter_in_use;
>> +
>>   /* Cache the available counters in a bitmask */
>>   static unsigned long counter_mask_available;
>>   
>> @@ -69,7 +76,9 @@ unsigned long pmu_csr_read_num(int csr_num)
>>   #undef switchcase_csr_read
>>   }
>>   
>> -static inline void dummy_func_loop(int iter)
>> +static void stop_counter(unsigned long counter, unsigned long stop_flags);
>> +
>> +static inline void dummy_func_loop(uint64_t iter)
>>   {
>>   	int i = 0;
>>   
>> @@ -88,6 +97,26 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
>>   	regs->epc += 4;
>>   }
>>   
>> +static void guest_irq_handler(struct ex_regs *regs)
>> +{
>> +	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
>> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>> +	unsigned long overflown_mask;
>> +
>> +	/* Stop all counters first to avoid further interrupts */
>> +	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0, 1UL << counter_in_use,
>> +		  SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT, 0, 0, 0);
>> +
>> +	csr_clear(CSR_SIP, BIT(pmu_irq));
>> +
>> +	overflown_mask = READ_ONCE(snapshot_data->ctr_overflow_mask);
>> +	GUEST_ASSERT(overflown_mask & (1UL << counter_in_use));
>> +
>> +	/* Validate that we are in the correct irq handler */
>> +	GUEST_ASSERT_EQ(irq_num, pmu_irq);
> 
> Should probably do this irq handler assert first.
> 

Done.

>> +	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
>> +}
>> +
>>   static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
>>   				       unsigned long cflags,
>>   				       unsigned long event)
>> @@ -263,6 +292,32 @@ static void test_pmu_event_snapshot(unsigned long event)
>>   	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
>>   }
>>   
>> +static void test_pmu_event_overflow(unsigned long event)
>> +{
>> +	unsigned long counter;
>> +	unsigned long counter_value_post;
>> +	unsigned long counter_init_value = ULONG_MAX - 10000;
>> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>> +
>> +	counter = get_counter_index(0, counter_mask_available, 0, event);
>> +	counter_in_use = counter;
>> +
>> +	/* The counter value is updated w.r.t relative index of cbase passed to start/stop */
>> +	WRITE_ONCE(snapshot_data->ctr_values[0], counter_init_value);
>> +	start_counter(counter, SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT, 0);
>> +	dummy_func_loop(10000);
>> +	udelay(msecs_to_usecs(2000));
>> +	/* irq handler should have stopped the counter */
>> +
>> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[counter_in_use]);
>> +	/* The counter value after stopping should be less the init value due to overflow */
>> +	__GUEST_ASSERT(counter_value_post < counter_init_value,
>> +		       "counter_value_post %lx counter_init_value %lx for counter\n",
>> +		       counter_value_post, counter_init_value);
>> +
>> +	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
>> +}
>> +
>>   static void test_invalid_event(void)
>>   {
>>   	struct sbiret ret;
>> @@ -361,6 +416,43 @@ static void test_pmu_events_snaphost(int cpu)
>>   	GUEST_DONE();
>>   }
>>   
>> +static void test_pmu_events_overflow(int cpu)
> 
> no need for cpu
> 

Fixed.

>> +{
>> +	long out_val = 0;
>> +	bool probe;
>> +	int num_counters = 0;
>> +	unsigned long sbi_impl_version;
>> +
>> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
>> +	GUEST_ASSERT(probe && out_val == 1);
>> +
>> +	sbi_impl_version = get_host_sbi_impl_version();
>> +	if (sbi_impl_version >= sbi_mk_version(2, 0))
>> +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
> 
> Identical probe and version check as test_pmu_events_snaphost(). Can
> factor out.
> 

Done.

>> +
>> +	snapshot_set_shmem(snapshot_gpa, 0);
>> +	csr_set(CSR_IE, BIT(pmu_irq));
>> +	local_irq_enable();
>> +
>> +	/* Get the counter details */
>> +	num_counters = get_num_counters();
>> +	update_counter_info(num_counters);
>> +
>> +	/*
>> +	 * Qemu supports overflow for cycle/instruction.
>> +	 * This test may fail on any platform that do not support overflow for these two events.
>> +	 */
>> +	test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
>> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 1);
>> +
>> +	/* Renable the interrupt again for another event */
>> +	csr_set(CSR_IE, BIT(pmu_irq));
>> +	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
>> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
>> +
>> +	GUEST_DONE();
>> +}
>> +
>>   static void run_vcpu(struct kvm_vcpu *vcpu)
>>   {
>>   	struct ucall uc;
>> @@ -449,6 +541,35 @@ static void test_vm_events_snapshot_test(void *guest_code)
>>   	test_vm_destroy(vm);
>>   }
>>   
>> +static void test_vm_events_overflow(void *guest_code)
>> +{
>> +	struct kvm_vm *vm = NULL;
>> +	struct kvm_vcpu *vcpu = NULL;
> 
> nit: no need for NULL
> 
>> +
>> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
>> +	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(KVM_RISCV_SBI_EXT_PMU)),
>> +				   "SBI PMU not available, skipping test");
>> +
>> +	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSCOFPMF)),
>> +				   "Sscofpmf is not available, skipping overflow test");
>> +
>> +
>> +	test_vm_setup_snapshot_mem(vm, vcpu);
>> +	vm_init_vector_tables(vm);
>> +	vm_install_interrupt_handler(vm, guest_irq_handler);
>> +
>> +	vcpu_init_vector_tables(vcpu);
>> +	/* Initialize guest timer frequency. */
>> +	vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency), &timer_freq);
>> +	sync_global_to_guest(vm, timer_freq);
> 
> I just noticed that timer_freq is in arch_timer.h and isn't an extern...
> Fixing that is out of scope for this series though.
> 

Yeah. I can add a patch for that.
But declaring it as an extern requires the definitions to be in either 
common source file (i.e processor.c) or define it in each tests using 
timer_freq.

The first approach is bit odd with header file and definition residing 
two different source/header file.

Any preference ?

>> +
>> +	vcpu_args_set(vcpu, 1, 0);
> 
> no need for args
> 

Fixed.

>> +
>> +	run_vcpu(vcpu);
>> +
>> +	test_vm_destroy(vm);
>> +}
>> +
>>   int main(void)
>>   {
>>   	test_vm_basic_test(test_pmu_basic_sanity);
>> @@ -460,5 +581,8 @@ int main(void)
>>   	test_vm_events_snapshot_test(test_pmu_events_snaphost);
>>   	pr_info("SBI PMU event verification with snapshot test : PASS\n");
>>   
>> +	test_vm_events_overflow(test_pmu_events_overflow);
>> +	pr_info("SBI PMU event verification with overflow test : PASS\n");
>> +
>>   	return 0;
>>   }
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
