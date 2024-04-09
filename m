Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E821BC67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPRS2T+hR6kV5CqOLf4ZHWl90ydOEAnwiH9w62au+9o=; b=HlgKwrNDS2xm83
	CyKkct0MWnIOaOnvMcA3I41o7w+4PjlwU5HHd+Jk4nFeuz4G6LMUF6zazh79VdH84b2+McFWLj0rx
	kBm8LVPJYbocywrUo9hAJgXEzOEgZzpa4HpUIBh2+cA6kzNLPJ9EhL4PGN3ZrwWyx5LBYUPbkteXD
	x986QBQXjAMTrS2b6qddFB5k8KY+u4KQ4Fj74PrUEp5kl9i7Wiv6uNCVViP8ULTIGzMsqdM1jiXRn
	YpcblXWe7CsUCaA23iZo6L2VOdczqd3BGhvJrA7pWBM0KWO+Zj7xhOHYJ+EemyRhBDpaI1Ev2Z6Bd
	5tpZ15qd0At1sqBPHOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6Qq-00000000rOv-08wc;
	Tue, 09 Apr 2024 08:02:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6QS-00000000rJ7-07EZ
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 08:02:13 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a44665605f3so599008566b.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2024 01:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712649710; x=1713254510; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCIVc0ToTPxKSHwFH39eeFiQ4Iaybjud05qpLdkE0so=;
        b=AWvDAvMoOqT6NMduAPAknr9clcdPZNuFT7cDfSnl/HK2YRQOzX7fi84WoUrTIzU6Q/
         hIXBeHG67rtWtJW9EzwVmMSC8TWIyHXblEGmddm6FqZfGVc42ekFs0k5fJQWbkJpjvJu
         L1tGxtZI0h2dNcMfkhOLP3rq3HBzM4HuAHyo2Mhvudywy5sfqTRmYCZhO6uZ+4E3M6wU
         AV3rcOIEh+AdNFpUfEykAxazC1Jhjbcvmebd5GLlFGkZDBLwZy5p8FWzrhSmj799ZvGP
         lwNdkKLBb+SxZyA8Dhwl369tWJIW4d63tdBJiS+Ax+v/FLx66uov8J3vbsaMtsfMQ3ms
         CUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712649710; x=1713254510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCIVc0ToTPxKSHwFH39eeFiQ4Iaybjud05qpLdkE0so=;
        b=RPulQTXUNqHLUFEPD/7S1MpIqB/Gn8YL9TSdwOlOcpTC5JAZyEu9ezOUtB+pEkVZNd
         lRuw9qiXWYebPsRNOm1kB6UzTgsOPucS+ev2tk4fNo44fCbOS/Ht2VqdnCaICNXHLoBx
         FMi5tm3DynpJDbAA7PdctjtNRmH8tzN9vijAj53Mz7V6ncjIHvKzg6+Tv87RZWoNsnQm
         PK75s13SnQ/Id2jfMLYtY4lXPvr7r8DmtKYNkLaX+IXumgcKdMSZWRIo3bQ2/sqGf/GN
         HA/824+UtK5DqmDXBC7Zjxu1/Jg2n7UUplCsMApwmXUttmGXQ3gyqcz6jOtRi1uTmVNl
         DeUw==
X-Forwarded-Encrypted: i=1; AJvYcCVHImRrGYyL/mjmk0BBm3j0IpW++MZ4RmSISoUFYPKHKd3kHiXLmS7/GLmbRiC1O3umflZy0irZLqqN6x/m7WbgsUsXTbvdGjzbp3l2UkBv
X-Gm-Message-State: AOJu0Yy/PSZBU9HdSRrG5DZ49tfL4X3xg1hlV1FmIP2Prg7eLQpyEiOa
	/BYvu8J61P0yfAeY7lrG2G5DH4rEtZg98k+7pbM90jtjydnfdSCGqGi17bhGE1XarklSoVFtqbu
	W
X-Google-Smtp-Source: AGHT+IG/T7uaqwe5y6oCGXamr2sprW/wjX+aVwR61ApsAhhRf7ZUfXSB3xs49ZIPwF/ZvGx/GUAiPw==
X-Received: by 2002:a17:906:c454:b0:a4d:f5e6:2e34 with SMTP id ck20-20020a170906c45400b00a4df5e62e34mr6793646ejb.19.1712649710207;
        Tue, 09 Apr 2024 01:01:50 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id xh13-20020a170906da8d00b00a51c0c0cb86sm3775778ejb.22.2024.04.09.01.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 01:01:49 -0700 (PDT)
Date: Tue, 9 Apr 2024 10:01:48 +0200
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
Subject: Re: [PATCH v5 20/22] KVM: riscv: selftests: Add SBI PMU selftest
Message-ID: <20240409-dd055c3d08e027cf2a5cb4dc@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-21-atishp@rivosinc.com>
 <20240405-d1a4cb9a441a05a9d2f8b1c8@orel>
 <976411ab-6ddf-4b10-8e13-1575928415ce@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <976411ab-6ddf-4b10-8e13-1575928415ce@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_010208_059506_3A3B8E2F 
X-CRM114-Status: GOOD (  30.00  )
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

On Mon, Apr 08, 2024 at 05:37:19PM -0700, Atish Patra wrote:
> On 4/5/24 05:50, Andrew Jones wrote:
> > On Wed, Apr 03, 2024 at 01:04:49AM -0700, Atish Patra wrote:
> > ...
> > > +static void test_pmu_basic_sanity(void)
> > > +{
> > > +	long out_val = 0;
> > > +	bool probe;
> > > +	struct sbiret ret;
> > > +	int num_counters = 0, i;
> > > +	union sbi_pmu_ctr_info ctrinfo;
> > > +
> > > +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
> > > +	GUEST_ASSERT(probe && out_val == 1);
> > > +
> > > +	num_counters = get_num_counters();
> > > +
> > > +	for (i = 0; i < num_counters; i++) {
> > > +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i,
> > > +				0, 0, 0, 0, 0);
> > > +
> > > +		/* There can be gaps in logical counter indicies*/
> > > +		if (ret.error)
> > > +			continue;
> > > +		GUEST_ASSERT_NE(ret.value, 0);
> > > +
> > > +		ctrinfo.value = ret.value;
> > > +
> > > +		/**
> > > +		 * Accesibillity check of hardware and read capability of firmware counters.
> > 
> > Accessibility
> > 
> 
> Fixed it.
> 
> > > +		 * The spec doesn't mandate any initial value. No need to check any value.
> > > +		 */
> > > +		read_counter(i, ctrinfo);
> > > +	}
> > > +
> > > +	GUEST_DONE();
> > > +}
> > > +
> > > +static void run_vcpu(struct kvm_vcpu *vcpu)
> > > +{
> > > +	struct ucall uc;
> > > +
> > > +	vcpu_run(vcpu);
> > > +	switch (get_ucall(vcpu, &uc)) {
> > > +	case UCALL_ABORT:
> > > +		REPORT_GUEST_ASSERT(uc);
> > > +		break;
> > > +	case UCALL_DONE:
> > > +	case UCALL_SYNC:
> > > +		break;
> > > +	default:
> > > +		TEST_FAIL("Unknown ucall %lu", uc.cmd);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +void test_vm_destroy(struct kvm_vm *vm)
> > > +{
> > > +	memset(ctrinfo_arr, 0, sizeof(union sbi_pmu_ctr_info) * RISCV_MAX_PMU_COUNTERS);
> > > +	counter_mask_available = 0;
> > > +	kvm_vm_free(vm);
> > > +}
> > > +
> > > +static void test_vm_basic_test(void *guest_code)
> > > +{
> > > +	struct kvm_vm *vm;
> > > +	struct kvm_vcpu *vcpu;
> > > +
> > > +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> > > +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
> > > +				   "SBI PMU not available, skipping test");
> > > +	vm_init_vector_tables(vm);
> > > +	/* Illegal instruction handler is required to verify read access without configuration */
> > > +	vm_install_exception_handler(vm, EXC_INST_ILLEGAL, guest_illegal_exception_handler);
> > 
> > I still don't see where the "verify" part is. The handler doesn't record
> > that it had to handle anything.
> > 
> 
> The objective of the test is to ensure that we get an illegal instruction
> without configuration.

This part I guessed.

> The presence of the registered exception handler is
> sufficient for that.

This part I disagree with. The handler may not be necessary and not run if
we don't get the ILL. Usually when I write tests like these I set a
boolean in the handler and check it after the instruction which should
have sent us there to make sure we did indeed go there.

> 
> The verify part is that the test doesn't end up in a illegal instruction
> exception when you try to access a counter without configuring.
> 
> Let me know if you think we should more verbose comment to explain the
> scenario.
> 

With a boolean the test code will be mostly self documenting, but a short
comment saying why we expect the boolean to be set would be good too.

Thanks,
drew

> 
> > > +
> > > +	vcpu_init_vector_tables(vcpu);
> > > +	run_vcpu(vcpu);
> > > +
> > > +	test_vm_destroy(vm);
> > > +}
> > > +
> > > +static void test_vm_events_test(void *guest_code)
> > > +{
> > > +	struct kvm_vm *vm = NULL;
> > > +	struct kvm_vcpu *vcpu = NULL;
> > > +
> > > +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> > > +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
> > > +				   "SBI PMU not available, skipping test");
> > > +	run_vcpu(vcpu);
> > > +
> > > +	test_vm_destroy(vm);
> > > +}
> > > +
> > > +int main(void)
> > > +{
> > > +	test_vm_basic_test(test_pmu_basic_sanity);
> > > +	pr_info("SBI PMU basic test : PASS\n");
> > > +
> > > +	test_vm_events_test(test_pmu_events);
> > > +	pr_info("SBI PMU event verification test : PASS\n");
> > > +
> > > +	return 0;
> > > +}
> > > -- 
> > > 2.34.1
> > > 
> > 
> > Thanks,
> > drew
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
