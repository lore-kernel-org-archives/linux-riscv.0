Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF25CD1292
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rz3WOsFg5Elz8xdc47leDIrA5q+jnxcuG16iR83GrGo=; b=X9gtbqBC8e7cDsnZ9yAJfe8RmF
	Au2qbnlP214DVu3Z+ulfzeYOHwp3d/4Laj/1opviPtckHeCn5Y2vFv65lVInIHbmzLiowC1aWRs9h
	CUXXrAlYo/Rr19mpB1MNRj8MIyaZWC4RgaFfReFRvc3kXI3biZ3XzCo1BSC0tAp3pYsVjnrxDu7WT
	r+NCdbaJV95ZN9glyPuyJ89E/z1S4nnvSgpTtIm2t7cxoXAza+wW69wY9P12zIgQoV0IUZlEw0Dss
	OWdwIIjZl2Gmn7LTycJVHekD2Ag3RKKc99akBpS1YL2kBSm3KDJ3MWHv0Mt9AxYQdstwVvufEbtZY
	as9wJ0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZca-0000000AGly-0vqT;
	Tue, 02 Apr 2024 08:35:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZcQ-0000000AGgY-1H22
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 08:35:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1df01161b39so42109255ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712046944; x=1712651744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U9I3ViMCVQQmA95RIL74JmEU0HHNY7AEhopAQbLxjjE=;
        b=HTRTMr3vcLjzkwKEHSIIesjV47h31xSJ1ajyqCvzfPNjY3OOqvlD/PKunHOvwMsmOU
         jL82nu6/VuJKZ2m+IgFFL5vrf3IbvlNx2IoUWxJh3KOfz6RqJZQ0wgjOTcKlNVul9EBS
         NykWFRS7hzv8O/JeeH+UbvnV+5xpehBxY3ASb3hLhh8Ye8ZroYkTpdW520rSgoZUEhmZ
         +wshGjWr5vcgPqPAnJ1c/1haeFNv85lu2/S+ubO28xLXnZKYGYQouOPsY45g+ciS8U1q
         KgoCMjJY2yh8GJBQSjRNV3vluGDAPn3dejEZ0RoISmlZmdFjdqlm6oZtDWbUL3f0i0ov
         IwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712046944; x=1712651744;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9I3ViMCVQQmA95RIL74JmEU0HHNY7AEhopAQbLxjjE=;
        b=h3/oSW3kluGawwDRAI/kXpA1zfvH9UhDDdOp1FtLnA0ZOhbXQ2VaAsmErLbcfXNirQ
         M9/PTl5oMLVC4p2zH2UfH7t24EGO7zqn586Ngi+tX+RZASS1jweLeewubn5p2uRxTm2W
         ISXoWGUNOkGJuvojIXpavXBN6q0iMK3l7BjO020YesQnv5ToPEorcXzdf8RauiwHlkyM
         DoeYyzgTwk3aHIHcr1TmMP1F+9lny6S80g5+nH8xRgZNNSwvOFWdWiSKNBijsA+rH6gQ
         RZLjU0EBXQyl4qTY4Oj+9yUAWmCi7ZRTgqXZ9HGxUP3b1Lakpe37zcqT+av9rKwSh0AA
         LwjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe5yjaj9g5F7uT4fVMKnVBzwMnpHYA8ogMOgmAkLO+8whhEojBHxc17aQ/8nH4APzUSweBiruYeNag6tE9jCakh/39UGif5xWxqdF21SNo
X-Gm-Message-State: AOJu0YzDNggj+SusTwgT1MPB+fSQBA7xfW7tWToy0YX1EhlKS9qgjSLL
	/SEoqy7fA+YuHtfMuodCD8x09eOr46WKsXfs94xKcamKP3wm700eAHk+0bfjCcU=
X-Google-Smtp-Source: AGHT+IGe1XkocMgJ1dm8gyIq2o7FA+erzzD6WFH3daVHOqykemROiq7RdgPPjoalMaMmG5SuY6dJYg==
X-Received: by 2002:a17:902:c94f:b0:1e0:a784:f965 with SMTP id i15-20020a170902c94f00b001e0a784f965mr14438896pla.65.1712046944135;
        Tue, 02 Apr 2024 01:35:44 -0700 (PDT)
Received: from [172.16.0.34] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id s2-20020a170902b18200b001ddb505d50asm10442894plr.244.2024.04.02.01.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 01:35:43 -0700 (PDT)
Message-ID: <fa3baf15-98a0-4805-9a40-9d2b8fbcbbd7@rivosinc.com>
Date: Tue, 2 Apr 2024 01:35:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 14/15] KVM: riscv: selftests: Add a test for PMU
 snapshot functionality
To: Andrew Jones <ajones@ventanamicro.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-15-atishp@rivosinc.com>
 <20240302-188985ea03041de3e8910916@orel>
X-Mozilla-News-Host: news://nntp.lore.kernel.org
Content-Language: en-US
In-Reply-To: <20240302-188985ea03041de3e8910916@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_013546_557707_FCBC4E9B 
X-CRM114-Status: GOOD (  38.49  )
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

On 3/2/24 04:13, Andrew Jones wrote:
> On Wed, Feb 28, 2024 at 05:01:29PM -0800, Atish Patra wrote:
>> Verify PMU snapshot functionality by setting up the shared memory
>> correctly and reading the counter values from the shared memory
>> instead of the CSR.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   .../selftests/kvm/include/riscv/processor.h   |  25 ++++
>>   .../selftests/kvm/lib/riscv/processor.c       |  12 ++
>>   tools/testing/selftests/kvm/riscv/sbi_pmu.c   | 124 ++++++++++++++++++
>>   3 files changed, 161 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
>> index a49a39c8e8d4..e114d039e87b 100644
>> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
>> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
>> @@ -173,6 +173,7 @@ enum sbi_ext_id {
>>   };
>>   
>>   enum sbi_ext_base_fid {
>> +	SBI_EXT_BASE_GET_IMP_VERSION = 2,
>>   	SBI_EXT_BASE_PROBE_EXT = 3,
>>   };
>>   
>> @@ -201,6 +202,12 @@ union sbi_pmu_ctr_info {
>>   	};
>>   };
>>   
>> +struct riscv_pmu_snapshot_data {
>> +	u64 ctr_overflow_mask;
>> +	u64 ctr_values[64];
>> +	u64 reserved[447];
>> +};
>> +
>>   struct sbiret {
>>   	long error;
>>   	long value;
>> @@ -247,6 +254,14 @@ enum sbi_pmu_ctr_type {
>>   #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>>   #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
>>   
>> +#define SBI_STA_SHMEM_DISABLE		-1
> 
> unrelated change
> 

Dropped it.

>> +
>> +/* SBI spec version fields */
>> +#define SBI_SPEC_VERSION_DEFAULT	0x1
>> +#define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>> +#define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
>> +#define SBI_SPEC_VERSION_MINOR_MASK	0xffffff
>> +
>>   struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>>   			unsigned long arg1, unsigned long arg2,
>>   			unsigned long arg3, unsigned long arg4,
>> @@ -254,6 +269,16 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>>   
>>   bool guest_sbi_probe_extension(int extid, long *out_val);
>>   
>> +/* Make SBI version */
>> +static inline unsigned long sbi_mk_version(unsigned long major,
>> +					    unsigned long minor)
>> +{
>> +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
>> +		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
>> +}
> 
> We should probably just synch sbi.h into tools, since we need plenty
> from it.
> 

As of now I have created sbi.h and moved all the definitions there. 
There is a still lot of difference between sbi.h. Do we really want to 
bring everything in ? Should we adopt kvmtool like policy to sync sbi.h
or just do it as new test cases need sbi.h?

I can send another version with syncing sbi.h if you still think that's 
better.


>> +
>> +unsigned long get_host_sbi_impl_version(void);
>> +
>>   static inline void local_irq_enable(void)
>>   {
>>   	csr_set(CSR_SSTATUS, SR_SIE);
>> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
>> index ec66d331a127..b0162d923e38 100644
>> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
>> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
>> @@ -499,3 +499,15 @@ bool guest_sbi_probe_extension(int extid, long *out_val)
>>   
>>   	return true;
>>   }
>> +
>> +unsigned long get_host_sbi_impl_version(void)
>> +{
>> +	struct sbiret ret;
>> +
>> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_VERSION, 0,
>> +		       0, 0, 0, 0, 0);
>> +
>> +	GUEST_ASSERT(!ret.error);
>> +
>> +	return ret.value;
>> +}
>> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu.c b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> index fc1fc5eea99e..8ea2a6db6610 100644
>> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu.c
>> @@ -21,6 +21,11 @@
>>   #define RISCV_MAX_PMU_COUNTERS 64
>>   union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
>>   
>> +/* Snapshot shared memory data */
>> +#define PMU_SNAPSHOT_GPA_BASE		(1 << 30)
>> +static void *snapshot_gva;
>> +static vm_paddr_t snapshot_gpa;
>> +
>>   /* Cache the available counters in a bitmask */
>>   static unsigned long counter_mask_available;
>>   
>> @@ -173,6 +178,20 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>>   			       counter, ret.error);
>>   }
>>   
>> +static void snapshot_set_shmem(vm_paddr_t gpa, unsigned long flags)
>> +{
>> +	unsigned long lo = (unsigned long)gpa;
>> +#if __riscv_xlen == 32
>> +	unsigned long hi = (unsigned long)(gpa >> 32);
>> +#else
>> +	unsigned long hi = gpa == -1 ? -1 : 0;
>> +#endif
>> +	struct sbiret ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
>> +				      lo, hi, flags, 0, 0, 0);
>> +
>> +	GUEST_ASSERT(ret.value == 0 && ret.error == 0);
>> +}
>> +
>>   static void test_pmu_event(unsigned long event)
>>   {
>>   	unsigned long counter;
>> @@ -207,6 +226,43 @@ static void test_pmu_event(unsigned long event)
>>   	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
>>   }
>>   
>> +static void test_pmu_event_snapshot(unsigned long event)
>> +{
>> +	unsigned long counter;
>> +	unsigned long counter_value_pre, counter_value_post;
>> +	unsigned long counter_init_value = 100;
>> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>> +
>> +	counter = get_counter_index(0, counter_mask_available, 0, event);
>> +	counter_value_pre = read_counter(counter, ctrinfo_arr[counter]);
>> +
>> +	/* Do not set the initial value */
>> +	start_counter(counter, 0, 0);
>> +	dummy_func_loop(10000);
>> +
>> +	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
>> +
>> +	/* The counter value is updated w.r.t relative index of cbase */
>> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
>> +	__GUEST_ASSERT(counter_value_post > counter_value_pre,
>> +		       "counter_value_post %lx counter_value_pre %lx\n",
>> +		       counter_value_post, counter_value_pre);
>> +
>> +	/* Now set the initial value and compare */
>> +	WRITE_ONCE(snapshot_data->ctr_values[0], counter_init_value);
>> +	start_counter(counter, SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT, 0);
>> +	dummy_func_loop(10000);
>> +
>> +	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
>> +
>> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
>> +	__GUEST_ASSERT(counter_value_post > counter_init_value,
>> +		       "counter_value_post %lx counter_init_value %lx for counter\n",
>> +		       counter_value_post, counter_init_value);
>> +
>> +	stop_counter(counter, SBI_PMU_STOP_FLAG_RESET);
> 
> This function is almost identical to test_pmu_event(). If we change one,
> we'll likely have to change the other. We should have a single function
> which can be used by both tests. We can do that by passing a function
> pointer for the read which is different for non-snapshot and snapshot.
> 

There are more difference than just read function. Stop/start takes 
snapshot specific flag. We also have to update the counter in the shared 
memory. If we combine the two functions to a single one, we will end up 
with bunch of if else condition which I don't like.

I am okay modifying it if you feel strongly about it though.

>> +}
>> +
>>   static void test_invalid_event(void)
>>   {
>>   	struct sbiret ret;
>> @@ -270,6 +326,41 @@ static void test_pmu_basic_sanity(int cpu)
>>   	GUEST_DONE();
>>   }
>>   
>> +static void test_pmu_events_snaphost(int cpu)
> 
> unnecessary cpu parameter
> 

Removed.

>> +{
>> +	long out_val = 0;
>> +	bool probe;
>> +	int num_counters = 0;
>> +	unsigned long sbi_impl_version;
>> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
>> +	int i;
>> +
>> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
>> +	GUEST_ASSERT(probe && out_val == 1);
>> +
>> +	sbi_impl_version = get_host_sbi_impl_version();
>> +	if (sbi_impl_version >= sbi_mk_version(2, 0))
>> +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
>> +
>> +	snapshot_set_shmem(snapshot_gpa, 0);
>> +
>> +	/* Get the counter details */
>> +	num_counters = get_num_counters();
>> +	update_counter_info(num_counters);
>> +
>> +	/* Validate shared memory access */
>> +	GUEST_ASSERT_EQ(READ_ONCE(snapshot_data->ctr_overflow_mask), 0);
>> +	for (i = 0; i < num_counters; i++) {
>> +		if (counter_mask_available & (1UL << i))
> 
> BIT()
> 

Done.

>> +			GUEST_ASSERT_EQ(READ_ONCE(snapshot_data->ctr_values[i]), 0);
>> +	}
>> +	/* Only these two events are guranteed to be present */
>> +	test_pmu_event_snapshot(SBI_PMU_HW_CPU_CYCLES);
>> +	test_pmu_event_snapshot(SBI_PMU_HW_INSTRUCTIONS);
>> +
>> +	GUEST_DONE();
>> +}
>> +
>>   static void run_vcpu(struct kvm_vcpu *vcpu)
>>   {
>>   	struct ucall uc;
>> @@ -328,6 +419,36 @@ static void test_vm_events_test(void *guest_code)
>>   	test_vm_destroy(vm);
>>   }
>>   
>> +static void test_vm_setup_snapshot_mem(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>> +{
>> +	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, PMU_SNAPSHOT_GPA_BASE, 1, 1, 0);
>> +	/* PMU Snapshot requires single page only */
> 
> This comment should go above the memory region add
> 
>> +	virt_map(vm, PMU_SNAPSHOT_GPA_BASE, PMU_SNAPSHOT_GPA_BASE, 1);
>> +
>> +	/* PMU_SNAPSHOT_GPA_BASE is identity mapped */
> 
> This comment should go above the virt_map
> 

Fixed.

>> +	snapshot_gva = (void *)(PMU_SNAPSHOT_GPA_BASE);
>> +	snapshot_gpa = addr_gva2gpa(vcpu->vm, (vm_vaddr_t)snapshot_gva);
>> +	sync_global_to_guest(vcpu->vm, snapshot_gva);
>> +	sync_global_to_guest(vcpu->vm, snapshot_gpa);
>> +}
>> +
>> +static void test_vm_events_snapshot_test(void *guest_code)
>> +{
>> +	struct kvm_vm *vm = NULL;
>> +	struct kvm_vcpu *vcpu = NULL;
> 
> nit: no need to set to NULL
> 
>> +
>> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
>> +	__TEST_REQUIRE(__vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_SBI_EXT_PMU)),
> 
> RISCV_SBI_EXT_REG
> 

Updated to use the new helper functions as suggested in the earlier patch.

>> +				   "SBI PMU not available, skipping test");
>> +
>> +	test_vm_setup_snapshot_mem(vm, vcpu);
>> +
>> +	vcpu_args_set(vcpu, 1, 0);
> 
> no need to set args
> 

Fixed.

>> +	run_vcpu(vcpu);
>> +
>> +	test_vm_destroy(vm);
>> +}
>> +
>>   int main(void)
>>   {
>>   	test_vm_basic_test(test_pmu_basic_sanity);
>> @@ -336,5 +457,8 @@ int main(void)
>>   	test_vm_events_test(test_pmu_events);
>>   	pr_info("SBI PMU event verification test : PASS\n");
>>   
>> +	test_vm_events_snapshot_test(test_pmu_events_snaphost);
>> +	pr_info("SBI PMU event verification with snapshot test : PASS\n");
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
