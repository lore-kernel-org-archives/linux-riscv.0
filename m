Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4B0C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 00:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WBIORa9rNgfTJFdTa72jkXSw5c39xDh5mB1WVyTjOw=; b=QF6RWIJlAHHs3x
	enBx3lnXdo0Gu48IDM3P5X16boVu6zR9rRr/ghhr3lVGKPE6rT8F4rFQZfef20oCIpcvY9TxYV4Qp
	9+nPC37dPiBsLqV2jBaBbsBEhK4uIFgomntupMFUSUEnLcZk1NvrwKjCSTaASGQmM183GTA+wrUO3
	426LUviQH0pJoloxS8Fq8oYjtXLNvxkENawzn/QBcFk27ZSSo1+2NtO3wHgqqN1awee1zdXqm4Mmv
	VR2TBcYtxiUoIbQRkrsZptLH8Ma+p65Gkz0o0RXZF4jWbAVgCTqKO7lLm4FiVN4MbsKAIhyQ8A/wU
	AsoNShHoqMtfQTVNbMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtzUb-0000000HIWm-2ygP;
	Tue, 09 Apr 2024 00:37:41 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtzUX-0000000HIPv-3Y8u
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 00:37:39 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso4202318b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 17:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712623042; x=1713227842; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Vx/fAicKDWjQK8Xf/GodtuH9rKioxrSCP+le6IWBVk=;
        b=Rlp3bfmFhJNhmxwe+XY1S5oWiaLtSzAZnpvkDdDYm01iZqYlHIDesgFPxMF7zNVa6t
         FEOeRgTQKzoBbz+FWl9oltKxe2LmeGq1+VZdyI9RI3z9j2o2t16tWoks7XsY4+TmcUew
         XAwStAviZcJIJy2Ao+biQzeOxHWxPq6kgJaObJyaR0ndWT6Xfy6QhMAYTTgUxbSXQHTS
         sGxJ63/G6ZyZOu3kRmIPEGPIZRps9UZ7/3exLmph52uXoMUzXyMtXeFNMmDT09aAMRKQ
         GIesVkcRHCvQxJO9xAXLnfasruKGPVr6hrX3lwWCyTL8R1YYktm4tD4LO5AZcjYh827M
         /NcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712623042; x=1713227842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vx/fAicKDWjQK8Xf/GodtuH9rKioxrSCP+le6IWBVk=;
        b=ewfOjontMwa2kFgnZJQzihOhetOkhM/z4PbUPhd92DtLxZ3gBbEdlg07GSqe9GnbXZ
         Yozv9NtLtbKjLtrZylPt+2y26Zzdm4zIs89za1WgQf3vkKzXv8SeU9+8ddj1eF9aI2SF
         DHD1XWXIBHh8pqDbPdGsrJNj49LFOvTlUMxUlJxz/ID3iSUU1niz1w7dv/tAINTMU2QH
         jIMCqkiOOIw6WZ8gIMHYuVcH7tjC5h6p9XrItmXzubDiPUfAp+3j6rxGhH0Mtp6xAKAt
         X7EP7F4HjocyaHFM8tV9m8DLe75eRG20hI/2hjrPzZlnRED75USuCMbyYjSo7NNWfBHZ
         sYqg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Ui6utLMHuxDk10Uw9DAz0o3QZZZ7t/icmAKMlgnPGdVDhDouLi+KAU7+cPc0sybJuHwAGqiqB3yE+vVUfgvpnihczKYkCt/DwB6P8KKA
X-Gm-Message-State: AOJu0YwCI/CY78FplsPrszsdzkyy1F00gu+qdDbu+25oo/qPK0o/Mgg4
	Dru9BhFfgk0uW72+3KHqVlEYgysqMUtz6ZZEluwjm3z8cy30UKNGDhvpyUvo4+A=
X-Google-Smtp-Source: AGHT+IHr0Zo6nHVaV/pKfVqhANW/8W9ESaRusAuX8dauWvgSDh5Rc7uN98R5kCiiSEnkLb0cWYp8TA==
X-Received: by 2002:a05:6a20:7355:b0:1a7:1e1c:3031 with SMTP id v21-20020a056a20735500b001a71e1c3031mr13412563pzc.36.1712623041952;
        Mon, 08 Apr 2024 17:37:21 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::e8c1? ([2601:647:4180:9630::e8c1])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902784700b001dd578121d4sm7786884pln.204.2024.04.08.17.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 17:37:21 -0700 (PDT)
Message-ID: <976411ab-6ddf-4b10-8e13-1575928415ce@rivosinc.com>
Date: Mon, 8 Apr 2024 17:37:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/22] KVM: riscv: selftests: Add SBI PMU selftest
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
 <20240403080452.1007601-21-atishp@rivosinc.com>
 <20240405-d1a4cb9a441a05a9d2f8b1c8@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240405-d1a4cb9a441a05a9d2f8b1c8@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_173737_973581_CBFEEC74 
X-CRM114-Status: GOOD (  18.87  )
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

On 4/5/24 05:50, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:49AM -0700, Atish Patra wrote:
> ...
>> +static void test_pmu_basic_sanity(void)
>> +{
>> +	long out_val = 0;
>> +	bool probe;
>> +	struct sbiret ret;
>> +	int num_counters = 0, i;
>> +	union sbi_pmu_ctr_info ctrinfo;
>> +
>> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
>> +	GUEST_ASSERT(probe && out_val == 1);
>> +
>> +	num_counters = get_num_counters();
>> +
>> +	for (i = 0; i < num_counters; i++) {
>> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i,
>> +				0, 0, 0, 0, 0);
>> +
>> +		/* There can be gaps in logical counter indicies*/
>> +		if (ret.error)
>> +			continue;
>> +		GUEST_ASSERT_NE(ret.value, 0);
>> +
>> +		ctrinfo.value = ret.value;
>> +
>> +		/**
>> +		 * Accesibillity check of hardware and read capability of firmware counters.
> 
> Accessibility
> 

Fixed it.

>> +		 * The spec doesn't mandate any initial value. No need to check any value.
>> +		 */
>> +		read_counter(i, ctrinfo);
>> +	}
>> +
>> +	GUEST_DONE();
>> +}
>> +
>> +static void run_vcpu(struct kvm_vcpu *vcpu)
>> +{
>> +	struct ucall uc;
>> +
>> +	vcpu_run(vcpu);
>> +	switch (get_ucall(vcpu, &uc)) {
>> +	case UCALL_ABORT:
>> +		REPORT_GUEST_ASSERT(uc);
>> +		break;
>> +	case UCALL_DONE:
>> +	case UCALL_SYNC:
>> +		break;
>> +	default:
>> +		TEST_FAIL("Unknown ucall %lu", uc.cmd);
>> +		break;
>> +	}
>> +}
>> +
>> +void test_vm_destroy(struct kvm_vm *vm)
>> +{
>> +	memset(ctrinfo_arr, 0, sizeof(union sbi_pmu_ctr_info) * RISCV_MAX_PMU_COUNTERS);
>> +	counter_mask_available = 0;
>> +	kvm_vm_free(vm);
>> +}
>> +
>> +static void test_vm_basic_test(void *guest_code)
>> +{
>> +	struct kvm_vm *vm;
>> +	struct kvm_vcpu *vcpu;
>> +
>> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
>> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
>> +				   "SBI PMU not available, skipping test");
>> +	vm_init_vector_tables(vm);
>> +	/* Illegal instruction handler is required to verify read access without configuration */
>> +	vm_install_exception_handler(vm, EXC_INST_ILLEGAL, guest_illegal_exception_handler);
> 
> I still don't see where the "verify" part is. The handler doesn't record
> that it had to handle anything.
> 

The objective of the test is to ensure that we get an illegal 
instruction without configuration. The presence of the registered 
exception handler is sufficient for that.

The verify part is that the test doesn't end up in a illegal instruction 
exception when you try to access a counter without configuring.

Let me know if you think we should more verbose comment to explain the 
scenario.


>> +
>> +	vcpu_init_vector_tables(vcpu);
>> +	run_vcpu(vcpu);
>> +
>> +	test_vm_destroy(vm);
>> +}
>> +
>> +static void test_vm_events_test(void *guest_code)
>> +{
>> +	struct kvm_vm *vm = NULL;
>> +	struct kvm_vcpu *vcpu = NULL;
>> +
>> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
>> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
>> +				   "SBI PMU not available, skipping test");
>> +	run_vcpu(vcpu);
>> +
>> +	test_vm_destroy(vm);
>> +}
>> +
>> +int main(void)
>> +{
>> +	test_vm_basic_test(test_pmu_basic_sanity);
>> +	pr_info("SBI PMU basic test : PASS\n");
>> +
>> +	test_vm_events_test(test_pmu_events);
>> +	pr_info("SBI PMU event verification test : PASS\n");
>> +
>> +	return 0;
>> +}
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
