Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E16CC67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 00:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJ1wkF73IgfKsrABhj4Ns+nqdqv5qU/HnDAgzSowJww=; b=Cy0u7NEIYTlMNE
	MbkJbzzWterWesiOc9e3K4w9qYbtFkbAzytmIryF6qXy2SqIpmks2OAf1MWCXGW6ZGgm1Szx+ikMS
	Dm8fpOdtV+OnNywZyB+6/7IdPrQSbBgZVrWokYAh29kmbvOMtwW4QpFnhkBiSwAN+Ipoka7hHpjDe
	4iDk6IAIxuBKMWshET1zSWQOpp+yRB1184QQGFoY2YbGwwnEaTzp4UddUnyKa47Ht5rcB+Jlc7WYi
	rEwhVd6y8s2BhwaFXE5m7te881/vf+j19871//ULzIZaXuLQW5Fp1DovgFt7rJMPnhwyHGkoCwLQ1
	GnnRvJyGbbiPv8EQnv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtzQT-0000000HHlA-3MS7;
	Tue, 09 Apr 2024 00:33:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtzQJ-0000000HHgn-0xrE
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 00:33:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e3f17c64daso14525525ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 17:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712622793; x=1713227593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/CJmT3YaooE8CB2QIvUgCnYPke09ytqabQq9mjiodg=;
        b=nvyWTVoG2rXk5pN9l/QF9BJm+JHcB5U4mDGhFpZ+zFXIVEQ1+SwDkqi1oWGHkt6pas
         jcxpf6LoalIUjGrQJiq5a5FTbYPASHV4dzO+Sp6JObwxRmS5uuB37HVDUrvy1obQ9vs6
         SX+/pRe3Z3EwRBdS/+2aKn78b/2CQBqMAeoQ6uH5BjXO7WOy4+EdwtnuGxoBBH6Gr23q
         Ak7s0vLMeDjzw64O6PGpfxMMRvxIf2MHOlec64Zg1uEM6GLgR8BZEsaTj2IRUWJ9n9e0
         LpYptbrPC8JpL/tHrpQ6OSa/fSYibs3em6/v14k/xAnTZBK70t5069an6uDIRssZju+o
         PYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712622793; x=1713227593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/CJmT3YaooE8CB2QIvUgCnYPke09ytqabQq9mjiodg=;
        b=YYsHB57doGAE7HH5wW8G6qzAuRGakw4wUNHW3wCjxNKR8JLnRKrZSxcTzwOgr+DPvr
         Ca8isUCI1MqcYFOi8fnVTANwSpfRaTTi0oUiOgxkaI+9GzB65NKPAwg02Imx+mUz1EZo
         0ePTm318EQUP6E1gzGo9SYBvX0FXsYhBpem1hf3Kq4i2XfQobynjoic6AXmSYA8QiKMs
         DeupkoFbkA7a/+2C6ksV6fopo7zYSG9W0CMyGpRLE8rB43oIIrkgP3ojk1pU6upmMX/G
         TSRkttn/i2meZTcjvo/l7et2PW0L8HIuzpFQdvoS+a/oRNEgx8eElV6NHCYlejroxaTT
         aXwg==
X-Forwarded-Encrypted: i=1; AJvYcCUdsUTFBUVStdlleykTWD1/+HeoFN3lYmcljX74jO/qNIzu9CJRNDdIP/zZpF+sPpchKkwBZ5oUIi6cepTu+2uneHMg7HvJS1hfKHjYbQbC
X-Gm-Message-State: AOJu0YyTwG/AYCzqD9TNPF1qBAf1oYP4B4iJJM+mQzR9/4VbZOwCVXGD
	1jHYJn+DXrUuhMHSfm7TA43rcDlWYzOqvpkoFGaYNHpdOJiaHOu64ZrqmIw59AY=
X-Google-Smtp-Source: AGHT+IEvUCM8edq+BJU6njmxP2S88uAHY8Y4uoAWuaqv8e2rJW7YxBXFjZFMDPCzo+f8OYSJfA0hYA==
X-Received: by 2002:a17:903:404b:b0:1e4:35b9:f150 with SMTP id n11-20020a170903404b00b001e435b9f150mr2977778pla.11.1712622792665;
        Mon, 08 Apr 2024 17:33:12 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::e8c1? ([2601:647:4180:9630::e8c1])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001e0e977f655sm7621722plx.159.2024.04.08.17.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 17:33:12 -0700 (PDT)
Message-ID: <a50d426c-a7c0-49d9-8bdf-d15ba53ba40f@rivosinc.com>
Date: Mon, 8 Apr 2024 17:33:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/22] RISC-V: KVM: Implement SBI PMU Snapshot feature
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
 <20240403080452.1007601-13-atishp@rivosinc.com>
 <20240405-1060c986299eaac3528c7d4f@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240405-1060c986299eaac3528c7d4f@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_173319_880887_82A443D1 
X-CRM114-Status: GOOD (  20.42  )
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

On 4/5/24 04:23, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:41AM -0700, Atish Patra wrote:
>> PMU Snapshot function allows to minimize the number of traps when the
>> guest access configures/access the hpmcounters. If the snapshot feature
>> is enabled, the hypervisor updates the shared memory with counter
>> data and state of overflown counters. The guest can just read the
>> shared memory instead of trap & emulate done by the hypervisor.
>>
>> This patch doesn't implement the counter overflow yet.
>>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   arch/riscv/include/asm/kvm_vcpu_pmu.h |   7 ++
>>   arch/riscv/kvm/vcpu_pmu.c             | 121 +++++++++++++++++++++++++-
>>   arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
>>   3 files changed, 130 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
>> index 395518a1664e..77a1fc4d203d 100644
>> --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
>> +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
>> @@ -50,6 +50,10 @@ struct kvm_pmu {
>>   	bool init_done;
>>   	/* Bit map of all the virtual counter used */
>>   	DECLARE_BITMAP(pmc_in_use, RISCV_KVM_MAX_COUNTERS);
>> +	/* The address of the counter snapshot area (guest physical address) */
>> +	gpa_t snapshot_addr;
>> +	/* The actual data of the snapshot */
>> +	struct riscv_pmu_snapshot_data *sdata;
>>   };
>>   
>>   #define vcpu_to_pmu(vcpu) (&(vcpu)->arch.pmu_context)
>> @@ -85,6 +89,9 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
>>   int kvm_riscv_vcpu_pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>>   				struct kvm_vcpu_sbi_return *retdata);
>>   void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
>> +int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
>> +				      unsigned long saddr_high, unsigned long flags,
>> +				      struct kvm_vcpu_sbi_return *retdata);
>>   void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
>>   void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
>>   
>> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
>> index 2d9929bbc2c8..f706c688b338 100644
>> --- a/arch/riscv/kvm/vcpu_pmu.c
>> +++ b/arch/riscv/kvm/vcpu_pmu.c
>> @@ -14,6 +14,7 @@
>>   #include <asm/csr.h>
>>   #include <asm/kvm_vcpu_sbi.h>
>>   #include <asm/kvm_vcpu_pmu.h>
>> +#include <asm/sbi.h>
>>   #include <linux/bitops.h>
>>   
>>   #define kvm_pmu_num_counters(pmu) ((pmu)->num_hw_ctrs + (pmu)->num_fw_ctrs)
>> @@ -311,6 +312,80 @@ int kvm_riscv_vcpu_pmu_read_hpm(struct kvm_vcpu *vcpu, unsigned int csr_num,
>>   	return ret;
>>   }
>>   
>> +static void kvm_pmu_clear_snapshot_area(struct kvm_vcpu *vcpu)
>> +{
>> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>> +	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
>> +
>> +	if (kvpmu->sdata) {
>> +		if (kvpmu->snapshot_addr != INVALID_GPA) {
>> +			memset(kvpmu->sdata, 0, snapshot_area_size);
>> +			kvm_vcpu_write_guest(vcpu, kvpmu->snapshot_addr,
>> +					     kvpmu->sdata, snapshot_area_size);
>> +		} else {
>> +			pr_warn("snapshot address invalid\n");
>> +		}
>> +		kfree(kvpmu->sdata);
>> +		kvpmu->sdata = NULL;
>> +	}
>> +	kvpmu->snapshot_addr = INVALID_GPA;
>> +}
>> +
>> +int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
>> +				      unsigned long saddr_high, unsigned long flags,
>> +				      struct kvm_vcpu_sbi_return *retdata)
>> +{
>> +	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
>> +	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
>> +	int sbiret = 0;
>> +	gpa_t saddr;
>> +	unsigned long hva;
>> +	bool writable;
>> +
>> +	if (!kvpmu || flags) {
>> +		sbiret = SBI_ERR_INVALID_PARAM;
>> +		goto out;
>> +	}
>> +
>> +	if (saddr_low == SBI_SHMEM_DISABLE && saddr_high == SBI_SHMEM_DISABLE) {
>> +		kvm_pmu_clear_snapshot_area(vcpu);
>> +		return 0;
>> +	}
>> +
>> +	saddr = saddr_low;
>> +
>> +	if (saddr_high != 0) {
>> +		if (IS_ENABLED(CONFIG_32BIT))
>> +			saddr |= ((gpa_t)saddr << 32);
> 
> saddr |= ((gpa_t)saddr_high << 32)
> 

Oops. Thanks for catching it. Fixed.


>> +		else
>> +			sbiret = SBI_ERR_INVALID_ADDRESS;
>> +		goto out;
>> +	}
>> +
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
