Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AD0C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZjcHKCL9kI72qUkzMq3mmdUJHhigGSfK8QnZzZWR5jg=; b=WLthVktlvTjoJT
	cnwKMpb6iq2RogT2/bmhsQOLvSYeezinQvVF2WidvzOY9VvVT6DjGes7QyGwkQRa2gQdkmYZA3X6y
	mqJlRn8SIhLmFTHnBKRAexOmUoWjtnXVpD5U30MRiBjxaeIng1W3+rVM7pnkXsvHPbhvUKYkh3Vu9
	8rlIApUvbtpYtkOEauAnNFPnGf9M+nPDor5A1gfzW0NtqE57MehSEfdtL811/OODMHfQC5ekTQIfN
	mSdYJvCy43f8sSQ0SRAbgUm0dJcy3146pQ/HiVmFugx5Ss5UJMNWcwbXL0yITxfQbziMTtoI85Dx5
	U0ROUcE/L0CYHk02RUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjLh-000000079kD-0Af4;
	Fri, 05 Apr 2024 13:11:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjLd-000000079hi-1ltd
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 13:11:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3416df43cabso1573475f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 06:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712322670; x=1712927470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIFYSL8LJt6foHdfxw10rN1acsJrRDe5PI5D+QNa+Qs=;
        b=PDUMsJWLROYPgieqzd/w9LTTPN+jeIb5sh2S+nVJVQ2Dl3ulfNP0wMTN59bGDs5yPX
         iNA/zEYWOPIsqz48rN4LJe41XSmQopub0LOIEJGGR7i+IueZxP5uSc/WzhAY8yv6cr2H
         K6WqDXMP35utLd0Cvs3LrsA+pmL2QVIvIBcgnakidvHb82GN5KligMuU+HxWJs/w8DXU
         DnR4elIsErhMmXNs9JPWe/nNMPPuT5OsAe+p1cauYBgaIveICBgavwUH15aB9SlTc1B7
         nhbNgbyU+AyakZFjX/zySsY5nC/JlR4uwrTbF+22eWiXm7lrggnC20aoBIBjlRvv8MNu
         HdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712322670; x=1712927470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIFYSL8LJt6foHdfxw10rN1acsJrRDe5PI5D+QNa+Qs=;
        b=RyejmiPq0jb3n71f1/cbzDaHDY/XKiPSXEoaFC7CQB7rHFjIS/MAa/PhL/dZNFI3RS
         4rjccmQUkhHryYLFf/9/aS3PPp/1PFexSlMReZtc5uqLXAtT80NoWDcmd8vAmktfaERX
         S4/8NRn1UmWV6TC7oYJQ69jjs2gCQ3Yrzw2S31ZsQkxU1e+ZCXkbZs8OXWl7LlZqh/5H
         TaD/KFUUR/uvDcEMG8g7ALWcIK55B/vfshjg5R3ye9NNGIYOnghwnAcja1xE0IdYpN4b
         Ekcx6R13lFcDLngLTRHiSPmBpUQz2zOikF/89+IfobB7Yr1yvqL1VjGnjFENY3vtDich
         BsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhYoJuXQajT227/eIqQMy3cc5tjLikm6HTNHydIUyfbgXv9RNkaQZdM5KJ3d9go/IYc2TyZHPCK8qgLdqPuRxkMh4qzYuHokuFUoTJlqZW
X-Gm-Message-State: AOJu0Yx+2GDgBZIdL8DSFzwuKunzeo42Pd7rxbZfCfu2Ds7XwId12rdS
	5JdIhGT4ebWaj3vGEfLys89AZVUMCKb+YvhSOwwXa5n5WHL2SuGEbZjRlM9uzFY=
X-Google-Smtp-Source: AGHT+IH6QOK2VOZDXQeYLcgWm2su03VMTaIdWBBWIhcwDxNyGR7vDIXVDmwGpRkaYjCW1TpcjR+oZw==
X-Received: by 2002:adf:8b94:0:b0:33e:69db:bf8a with SMTP id o20-20020adf8b94000000b0033e69dbbf8amr1024264wra.59.1712322669954;
        Fri, 05 Apr 2024 06:11:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r4-20020a5d6944000000b00343b09729easm1998572wrw.69.2024.04.05.06.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 06:11:09 -0700 (PDT)
Date: Fri, 5 Apr 2024 15:11:08 +0200
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
Subject: Re: [PATCH v5 21/22] KVM: riscv: selftests: Add a test for PMU
 snapshot functionality
Message-ID: <20240405-4e840120e8117c286cb593f9@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-22-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-22-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_061113_478697_AB28113B 
X-CRM114-Status: GOOD (  35.28  )
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

On Wed, Apr 03, 2024 at 01:04:50AM -0700, Atish Patra wrote:
> Verify PMU snapshot functionality by setting up the shared memory
> correctly and reading the counter values from the shared memory
> instead of the CSR.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../testing/selftests/kvm/include/riscv/sbi.h |  25 ++++
>  .../selftests/kvm/lib/riscv/processor.c       |  12 ++
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 127 ++++++++++++++++++
>  3 files changed, 164 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> index 6675ca673c77..8c98bd99d450 100644
> --- a/tools/testing/selftests/kvm/include/riscv/sbi.h
> +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> @@ -8,6 +8,12 @@
>  #ifndef SELFTEST_KVM_SBI_H
>  #define SELFTEST_KVM_SBI_H
>  
> +/* SBI spec version fields */
> +#define SBI_SPEC_VERSION_DEFAULT	0x1
> +#define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> +#define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> +#define SBI_SPEC_VERSION_MINOR_MASK	0xffffff
> +
>  /* SBI return error codes */
>  #define SBI_SUCCESS				 0
>  #define SBI_ERR_FAILURE				-1
> @@ -33,6 +39,9 @@ enum sbi_ext_id {
>  };
>  
>  enum sbi_ext_base_fid {
> +	SBI_EXT_BASE_GET_SPEC_VERSION = 0,
> +	SBI_EXT_BASE_GET_IMP_ID,
> +	SBI_EXT_BASE_GET_IMP_VERSION,
>  	SBI_EXT_BASE_PROBE_EXT = 3,
>  };
>  enum sbi_ext_pmu_fid {
> @@ -60,6 +69,12 @@ union sbi_pmu_ctr_info {
>  	};
>  };
>  
> +struct riscv_pmu_snapshot_data {
> +	u64 ctr_overflow_mask;
> +	u64 ctr_values[64];
> +	u64 reserved[447];
> +};
> +
>  struct sbiret {
>  	long error;
>  	long value;
> @@ -113,4 +128,14 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  
>  bool guest_sbi_probe_extension(int extid, long *out_val);
>  
> +/* Make SBI version */
> +static inline unsigned long sbi_mk_version(unsigned long major,
> +					    unsigned long minor)
> +{
> +	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
> +		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;

Should also also mask 'minor'. I see this matches what we have in the
kernel so we should fix it there too.

> +}
> +
> +unsigned long get_host_sbi_spec_version(void);
> +
>  #endif /* SELFTEST_KVM_SBI_H */
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index e8211f5d6863..ccb35573749c 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -502,3 +502,15 @@ bool guest_sbi_probe_extension(int extid, long *out_val)
>  
>  	return true;
>  }
> +
> +unsigned long get_host_sbi_spec_version(void)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0,
> +		       0, 0, 0, 0, 0);
> +
> +	GUEST_ASSERT(!ret.error);
> +
> +	return ret.value;
> +}
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 8e7c7a3172d8..7d195be5c3d9 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -19,6 +19,11 @@
>  #define RISCV_MAX_PMU_COUNTERS 64
>  union sbi_pmu_ctr_info ctrinfo_arr[RISCV_MAX_PMU_COUNTERS];
>  
> +/* Snapshot shared memory data */
> +#define PMU_SNAPSHOT_GPA_BASE		BIT(30)
> +static void *snapshot_gva;
> +static vm_paddr_t snapshot_gpa;
> +
>  /* Cache the available counters in a bitmask */
>  static unsigned long counter_mask_available;
>  
> @@ -178,6 +183,32 @@ static unsigned long read_counter(int idx, union sbi_pmu_ctr_info ctrinfo)
>  	return counter_val;
>  }
>  
> +static inline void verify_sbi_requirement_assert(void)
> +{
> +	long out_val = 0;
> +	bool probe;
> +
> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
> +	GUEST_ASSERT(probe && out_val == 1);
> +
> +	if (get_host_sbi_spec_version() < sbi_mk_version(2, 0))
> +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
> +}

It's a pity we can't check the SBI spec version that KVM is advertising
from KVM userspace. Normally we'd want to check something like this at
the start of the test with TEST_REQUIRE() before running a VCPU in order
to generate a skip exit.

(We probably should allow reading and even writing the SBI spec version
from the VMM in order to better support migration.)

> +
> +static void snapshot_set_shmem(vm_paddr_t gpa, unsigned long flags)
> +{
> +	unsigned long lo = (unsigned long)gpa;
> +#if __riscv_xlen == 32
> +	unsigned long hi = (unsigned long)(gpa >> 32);
> +#else
> +	unsigned long hi = gpa == -1 ? -1 : 0;
> +#endif
> +	struct sbiret ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
> +				      lo, hi, flags, 0, 0, 0);
> +
> +	GUEST_ASSERT(ret.value == 0 && ret.error == 0);
> +}
> +
>  static void test_pmu_event(unsigned long event)
>  {
>  	unsigned long counter;
> @@ -210,6 +241,41 @@ static void test_pmu_event(unsigned long event)
>  	stop_reset_counter(counter, 0);
>  }
>  
> +static void test_pmu_event_snapshot(unsigned long event)
> +{
> +	unsigned long counter;
> +	unsigned long counter_value_pre, counter_value_post;
> +	unsigned long counter_init_value = 100;
> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
> +
> +	counter = get_counter_index(0, counter_mask_available, 0, event);
> +	counter_value_pre = read_counter(counter, ctrinfo_arr[counter]);
> +
> +	/* Do not set the initial value */
> +	start_counter(counter, 0, 0);
> +	dummy_func_loop(10000);
> +	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
> +
> +	/* The counter value is updated w.r.t relative index of cbase */
> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
> +	__GUEST_ASSERT(counter_value_post > counter_value_pre,
> +		       "counter_value_post %lx counter_value_pre %lx\n",
> +		       counter_value_post, counter_value_pre);
> +
> +	/* Now set the initial value and compare */
> +	WRITE_ONCE(snapshot_data->ctr_values[0], counter_init_value);
> +	start_counter(counter, SBI_PMU_START_FLAG_INIT_SNAPSHOT, 0);
> +	dummy_func_loop(10000);
> +	stop_counter(counter, SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT);
> +
> +	counter_value_post = READ_ONCE(snapshot_data->ctr_values[0]);
> +	__GUEST_ASSERT(counter_value_post > counter_init_value,
> +		       "counter_value_post %lx counter_init_value %lx for counter\n",
> +		       counter_value_post, counter_init_value);
> +
> +	stop_reset_counter(counter, 0);
> +}
> +
>  static void test_invalid_event(void)
>  {
>  	struct sbiret ret;
> @@ -272,6 +338,34 @@ static void test_pmu_basic_sanity(void)
>  	GUEST_DONE();
>  }
>  
> +static void test_pmu_events_snaphost(void)
> +{
> +	int num_counters = 0;
> +	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
> +	int i;
> +
> +	/* Verify presence of SBI PMU and minimum requrired SBI version */
> +	verify_sbi_requirement_assert();
> +
> +	snapshot_set_shmem(snapshot_gpa, 0);
> +
> +	/* Get the counter details */
> +	num_counters = get_num_counters();
> +	update_counter_info(num_counters);
> +
> +	/* Validate shared memory access */
> +	GUEST_ASSERT_EQ(READ_ONCE(snapshot_data->ctr_overflow_mask), 0);
> +	for (i = 0; i < num_counters; i++) {
> +		if (counter_mask_available & (BIT(i)))
> +			GUEST_ASSERT_EQ(READ_ONCE(snapshot_data->ctr_values[i]), 0);
> +	}
> +	/* Only these two events are guranteed to be present */
> +	test_pmu_event_snapshot(SBI_PMU_HW_CPU_CYCLES);
> +	test_pmu_event_snapshot(SBI_PMU_HW_INSTRUCTIONS);
> +
> +	GUEST_DONE();
> +}
> +
>  static void run_vcpu(struct kvm_vcpu *vcpu)
>  {
>  	struct ucall uc;
> @@ -328,13 +422,46 @@ static void test_vm_events_test(void *guest_code)
>  	test_vm_destroy(vm);
>  }
>  
> +static void test_vm_setup_snapshot_mem(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> +{
> +	/* PMU Snapshot requires single page only */
> +	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, PMU_SNAPSHOT_GPA_BASE, 1, 1, 0);
> +	/* PMU_SNAPSHOT_GPA_BASE is identity mapped */
> +	virt_map(vm, PMU_SNAPSHOT_GPA_BASE, PMU_SNAPSHOT_GPA_BASE, 1);
> +
> +	snapshot_gva = (void *)(PMU_SNAPSHOT_GPA_BASE);
> +	snapshot_gpa = addr_gva2gpa(vcpu->vm, (vm_vaddr_t)snapshot_gva);
> +	sync_global_to_guest(vcpu->vm, snapshot_gva);
> +	sync_global_to_guest(vcpu->vm, snapshot_gpa);
> +}
> +
> +static void test_vm_events_snapshot_test(void *guest_code)
> +{
> +	struct kvm_vm *vm = NULL;
> +	struct kvm_vcpu *vcpu;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
> +				   "SBI PMU not available, skipping test");
> +
> +	test_vm_setup_snapshot_mem(vm, vcpu);
> +
> +	run_vcpu(vcpu);
> +
> +	test_vm_destroy(vm);
> +}
> +
>  int main(void)
>  {
> +	pr_info("SBI PMU basic test : starting\n");
>  	test_vm_basic_test(test_pmu_basic_sanity);
>  	pr_info("SBI PMU basic test : PASS\n");
>  
>  	test_vm_events_test(test_pmu_events);
>  	pr_info("SBI PMU event verification test : PASS\n");
>  
> +	test_vm_events_snapshot_test(test_pmu_events_snaphost);
> +	pr_info("SBI PMU event verification with snapshot test : PASS\n");
> +
>  	return 0;
>  }
> -- 
> 2.34.1
>

Since my comments are a bit out-of-scope for this patch,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
