Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF6ACD128A
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 23:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNalbHZ1jCknncB5e1IuFxmqbS1NUBmXXlvPvZPeffY=; b=lPDx2DpU8o+Ajg
	mXzQIZey2Nnvpof/M9xKin9mgam7qDM2IbLvttJdXwSzCn8BqCIYtAZN1GkrQa6I43E5x6A23ctjX
	+KVgyoR8Jg9cFlzcZbS9doCr0SumwdcvaonswKEm6hnnZZuD1HWbRaGOyHDvJIea6n027d51aijFE
	QFr1tzOsgNEzYckDRpvLhPF8tKiv4IvXHEIDAEOSuMB9EjMMUbw73AXw+ZAVPqVlPiMjD/gzBSxuA
	uu/RcxlKxhsk/NLjy0jpewcnJXH1CXoDWkPcY20i37vHhg2u4c2o0lgK5joWjSQ1brygfsp8ENuPq
	Sg/WzD+eblWqf9H2gQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLC4-00000004HwN-0lQv;
	Tue, 09 Apr 2024 23:48:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruLC0-00000004Hu9-3AG5
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 23:47:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e419d203bdso19161375ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2024 16:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712706475; x=1713311275; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgrB4N7HIT6g2jHcT1375/VgKhsjQsjM2O3SRfcZbZc=;
        b=s/tUor9YXjvuG8ytrWJAt+QRqvAD3KmOx8/lTnNTka6eh76WWskU700VRqjQPzVC6j
         kchE5Jm1J0k8veTwBQGFHvjAyHRT/ELVZ520l5mR7Ilnny59xnmvq8HmZXZHHnnpx4rK
         8ZwVxYZuRe5QHaAGhqB1l6EdrK8I7vnCfJJPo8kPN6iOYCcmZHVOPRnagPkgZ9X0Oo4K
         370wSiww1LXno8XgeKm70L5oU3B0gAbs1Bmdx75DkaRGEH/nXORBGdpS8GoYYyDoFv8k
         KZNXMwdCVnUTtkiOkq5ZK20B3CjLQDxcLncFsNuz98K/9PY39E13MdQ+CIOzkaRB/0Jw
         CCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712706475; x=1713311275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgrB4N7HIT6g2jHcT1375/VgKhsjQsjM2O3SRfcZbZc=;
        b=RtDkoQIYjlzpPPXN7Nnqg5Dmim+DfquFGf70ZTgLqO/NsV7ObMxKFNbDGy5QY9Jej+
         57GeNY6TFwjHaI/wnzEWgsGr9dfJPwQKiacg7ZDra0IqlWqIxbuznFz/KTyATtyCpJZ7
         BGb3SrjUfURUI/C6tbSdmeec19nnJsDlXCAAZf6efPgXr3x/Iz50ywhGKtf+8v2CrlNO
         KDv5J9CPV6ZAMNLwlABiW1Xi08X/jPAf+MwfeVfUB6FjFvP6NdJaiJjcPxLqCwThnXiK
         PzkMczpqqhCPMH1C1XRKVG7K/CLf0d1cRgZlxeJ+7BEFA+zoN+mgkc86FMofHlN/VAxa
         fFCw==
X-Forwarded-Encrypted: i=1; AJvYcCX43YRwHlPDXJKOTgW1QW2ttz7Kmfi/FJ8jsDroLnPLOJ24VSVr7teipV7GoPr/zImZ4tpxvjc0d96spIx5mra8GISPTUzmbasoNXQuA41f
X-Gm-Message-State: AOJu0YzIRs5rJzQhVLieHvXVCSYp4QxodlwXugZ6wfUPruOWVVj9jJlX
	yW+zsAI8fFi8gCWXXkAo4UCDV4aUsowWAwVV1jA+arKk73h5HGmrQGQFIePUUQ0=
X-Google-Smtp-Source: AGHT+IHk/q17IeOHQyGGUSgmO41DCPXIxbm368Sp4qp2GXcbAOCnlkTai/EEVXRYcJTcrtE51VHdfw==
X-Received: by 2002:a17:902:f611:b0:1e2:a7bf:5172 with SMTP id n17-20020a170902f61100b001e2a7bf5172mr1613615plg.52.1712706474847;
        Tue, 09 Apr 2024 16:47:54 -0700 (PDT)
Received: from [10.0.16.226] ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d11300b001e0501d3058sm9518174plw.63.2024.04.09.16.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 16:47:54 -0700 (PDT)
Message-ID: <4f3fa42e-eaf9-40bf-8906-6193ea21a575@rivosinc.com>
Date: Tue, 9 Apr 2024 16:47:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/22] KVM: riscv: selftests: Add a test for counter
 overflow
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Alexey Makhalov <amakhalov@vmware.com>,
 Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-23-atishp@rivosinc.com>
 <20240405-3a20fe10d65368651c2d23fa@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240405-3a20fe10d65368651c2d23fa@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_164756_994266_B3922547 
X-CRM114-Status: GOOD (  25.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/5/24 06:23, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:51AM -0700, Atish Patra wrote:
>> Add a test for verifying overflow interrupt. Currently, it relies on
>> overflow support on cycle/instret events. This test works for cycle/
>> instret events which support sampling via hpmcounters on the platform.
>> There are no ISA extensions to detect if a platform supports that. Thus,
>> this test will fail on platform with virtualization but doesn't
>> support overflow on these two events.
> 
> Maybe we should give the user a command line option to disable this test
> in case the platform they're testing doesn't support it but they want to
> run the rest of the tests without getting a FAIL.
> 

Sure. I will add that option.

>>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   .../selftests/kvm/riscv/sbi_pmu_test.c        | 114 ++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> index 7d195be5c3d9..451db956b885 100644
>> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> @@ -14,6 +14,7 @@
>>   #include "test_util.h"
>>   #include "processor.h"
>>   #include "sbi.h"
>> +#include "arch_timer.h"
>>   
>>   /* Maximum counters(firmware + hardware) */
>>   #define RISCV_MAX_PMU_COUNTERS 64
>> @@ -24,6 +25,9 @@ union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
>>   static void *snapshot_gva;
>>   static vm_paddr_t snapshot_gpa;
>>   
>> +static int vcpu_shared_irq_count;
>> +static int counter_in_use;
>> +
>>   /* Cache the available counters in a bitmask */
>>   static unsigned long counter_mask_available;
>>   
>> @@ -117,6 +121,31 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
>>   	regs->epc += 4;
>>   }
>>   
>> +static void guest_irq_handler(struct ex_regs *regs)
>> +{
>> +	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
>> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>> +	unsigned long overflown_mask;
>> +	unsigned long counter_val = 0;
>> +
>> +	/* Validate that we are in the correct irq handler */
>> +	GUEST_ASSERT_EQ(irq_num, IRQ_PMU_OVF);
>> +
>> +	/* Stop all counters first to avoid further interrupts */
>> +	stop_counter(counter_in_use, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
>> +
>> +	csr_clear(CSR_SIP, BIT(IRQ_PMU_OVF));
>> +
>> +	overflown_mask = READ_ONCE(snapshot_data->ctr_overflow_mask);
>> +	GUEST_ASSERT(overflown_mask & 0x01);
>> +
>> +	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
>> +
>> +	counter_val = READ_ONCE(snapshot_data->ctr_values[0]);
>> +	/* Now start the counter to mimick the real driver behavior */
>> +	start_counter(counter_in_use, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_val);
>> +}
>> +
>>   static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,
>>   				       unsigned long cflags,
>>   				       unsigned long event)
>> @@ -276,6 +305,33 @@ static void test_pmu_event_snapshot(unsigned long event)
>>   	stop_reset_counter(counter, 0);
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
>> +	start_counter(counter, SBI_PMU_START_FLAG_INIT_SNAPSHOT, 0);
>> +	dummy_func_loop(10000);
>> +	udelay(msecs_to_usecs(2000));
>> +	/* irq handler should have stopped the counter */
>> +	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
>> +
>> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
>> +	/* The counter value after stopping should be less the init value due to overflow */
>> +	__GUEST_ASSERT(counter_value_post < counter_init_value,
>> +		       "counter_value_post %lx counter_init_value %lx for counter\n",
>> +		       counter_value_post, counter_init_value);
>> +
>> +	stop_reset_counter(counter, 0);
>> +}
>> +
>>   static void test_invalid_event(void)
>>   {
>>   	struct sbiret ret;
>> @@ -366,6 +422,34 @@ static void test_pmu_events_snaphost(void)
>>   	GUEST_DONE();
>>   }
>>   
>> +static void test_pmu_events_overflow(void)
>> +{
>> +	int num_counters = 0;
>> +
>> +	/* Verify presence of SBI PMU and minimum requrired SBI version */
>> +	verify_sbi_requirement_assert();
>> +
>> +	snapshot_set_shmem(snapshot_gpa, 0);
>> +	csr_set(CSR_IE, BIT(IRQ_PMU_OVF));
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
>> +	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
>> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
>> +
>> +	GUEST_DONE();
>> +}
>> +
>>   static void run_vcpu(struct kvm_vcpu *vcpu)
>>   {
>>   	struct ucall uc;
>> @@ -451,6 +535,33 @@ static void test_vm_events_snapshot_test(void *guest_code)
>>   	test_vm_destroy(vm);
>>   }
>>   
>> +static void test_vm_events_overflow(void *guest_code)
>> +{
>> +	struct kvm_vm *vm = NULL;
>> +	struct kvm_vcpu *vcpu;
>> +
>> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
>> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
>> +				   "SBI PMU not available, skipping test");
>> +
>> +	__TEST_REQUIRE(__vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA_EXT_SSCOFPMF),
>> +				   "Sscofpmf is not available, skipping overflow test");
>> +
>> +
> 
> extra blank line here
> 

Fixed.

>> +	test_vm_setup_snapshot_mem(vm, vcpu);
>> +	vm_init_vector_tables(vm);
>> +	vm_install_interrupt_handler(vm, guest_irq_handler);
>> +
>> +	vcpu_init_vector_tables(vcpu);
>> +	/* Initialize guest timer frequency. */
>> +	vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency), &timer_freq);
>> +	sync_global_to_guest(vm, timer_freq);
>> +
>> +	run_vcpu(vcpu);
>> +
>> +	test_vm_destroy(vm);
>> +}
>> +
>>   int main(void)
>>   {
>>   	pr_info("SBI PMU basic test : starting\n");
>> @@ -463,5 +574,8 @@ int main(void)
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
> Other than the command line option idea,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
