Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C59ECD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uT1/Oeg0XamYYuIsNNI4fk141Ui0bfa0VLpRFI7TIIk=; b=lDRJ6XmerzJpcX
	Fq3GRdPrf/gQl3/B+r3RFlbzYGe4rh83CaTGl5GswB52r3sPGXBh0F4YNqcwkhWtIB6ByMbCtRWXb
	NqhG0tOQXOteP+UOVUfsNJtZuDBMVeei/Kr8tjL9J/JgtWz+YHLS4kwg2xl3QbdMim1g7cUo6viEa
	OtVzG9MtLjEeNMtVHp8PeuNrsRwOVkv4EOBNs5MvkBcBxqdtQrEHvMy606T9+vHgdvThtPxg5c97Y
	DsHfr3cSF5tCpNKqHZN7zW8TdLjqBwHg5hgu7Iu2Mw2alSDkjXY2N5BlS7gBS/waEUOY+9re5wWI4
	f2LGadVsSkVE7Ovk5A7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj1j-000000072gn-1D4p;
	Fri, 05 Apr 2024 12:50:39 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsj1f-000000072dh-0TQk
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:50:37 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so365845266b.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712321433; x=1712926233; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+KZChT2cdzkHkVrpBT1mwN6D5B3F3KpgiaxmMWQvAA=;
        b=od2njVNmmeFGAxMPUJvEALRT9cbC595kyMP5XzUWkkIYbvlxI2ceCz57cU3Xt/D5IR
         m4faCTxfwvNcLRutXZPeorAts0gFfazsAlxoPuM+KbJnDSVOC0yMAn6C0TqDSvd3AVe2
         /FuLcGQszXRNc3ZvwQUUSbgzu0TbLXGutt4rnfGTy9zIe6e99L944HGzDz5FPeyHN+Au
         437skFSokkKfTiGI6FhZSr/m73sdbQFa4dEm2RQ6drQGZ4vKg+fjeMdbTljr2iHMJD3J
         6yelsZFC1YZ82xx868yf78wJwmhu0a87Pibau+ZOR0NcYNr/sUyFSX/ZTAp5CUQ/gjw1
         nwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712321433; x=1712926233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+KZChT2cdzkHkVrpBT1mwN6D5B3F3KpgiaxmMWQvAA=;
        b=o1jR3aZ8hAF/QK6PJo/X02RJZjI/xnSKd2iA8VtTbGu55rLNi2pKR9Kji0dGGVcMg6
         t56xw+mJNZtQQJhGDmkTneTsJisC80S1QRqMWxoCnhZfClKE6gQWf4FxWFd5uFwpiTLO
         E5HR5xFINJlGSbwk370iFx92I34Jh0rVBkyoc27a37P/+eV+RF7iEOEHdrP18W90maum
         Il7IrqqhRM6ipYNJTUjm9kMRJ0yh3WbOksmAOec5Kfx6HBxovqpXt4lYPbyrGLLrSKKJ
         UTT3VK3A+dIOaouScT8iM2sjMDaFC6Buayzt82SQnVcH3Yj3Q1uN+ox1DfIE+LIWYzxQ
         I+ng==
X-Forwarded-Encrypted: i=1; AJvYcCUkUCjoljbdjB/kd7FEjR88RhTGAPLyP2M9z4JpxvzUQuCZhUX+61zJ3tHQOiKgqEiFHyDq+SS3aXO4MMDlxj7X6YaRw6D1h4Q53ulywPAC
X-Gm-Message-State: AOJu0YxUm9zf+ZYR4pKpII6loYEGi4JoR4BY4oExAgu5lff+Uj7nf7iP
	hd1LLEGtkr0qpxlZp8wemgMqW3QjYoOvx4CnTrPqEvrkDS/hxlRIkqKYoKUICDo=
X-Google-Smtp-Source: AGHT+IG6XKFR7iCnTYVsn72OcFsqQ/CO3Rz0ggpBtTVg/0txMW6+hBUP+NpuyuP8ULhm5Cq9UuLdpA==
X-Received: by 2002:a17:907:1711:b0:a51:8a0c:cf39 with SMTP id le17-20020a170907171100b00a518a0ccf39mr1906632ejc.20.1712321432731;
        Fri, 05 Apr 2024 05:50:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id jy5-20020a170907762500b00a466af74ef2sm806704ejc.2.2024.04.05.05.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:50:32 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:50:31 +0200
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
Message-ID: <20240405-d1a4cb9a441a05a9d2f8b1c8@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-21-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-21-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_055035_220063_36DA30B4 
X-CRM114-Status: GOOD (  16.70  )
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

On Wed, Apr 03, 2024 at 01:04:49AM -0700, Atish Patra wrote:
...
> +static void test_pmu_basic_sanity(void)
> +{
> +	long out_val = 0;
> +	bool probe;
> +	struct sbiret ret;
> +	int num_counters = 0, i;
> +	union sbi_pmu_ctr_info ctrinfo;
> +
> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
> +	GUEST_ASSERT(probe && out_val == 1);
> +
> +	num_counters = get_num_counters();
> +
> +	for (i = 0; i < num_counters; i++) {
> +		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i,
> +				0, 0, 0, 0, 0);
> +
> +		/* There can be gaps in logical counter indicies*/
> +		if (ret.error)
> +			continue;
> +		GUEST_ASSERT_NE(ret.value, 0);
> +
> +		ctrinfo.value = ret.value;
> +
> +		/**
> +		 * Accesibillity check of hardware and read capability of firmware counters.

Accessibility

> +		 * The spec doesn't mandate any initial value. No need to check any value.
> +		 */
> +		read_counter(i, ctrinfo);
> +	}
> +
> +	GUEST_DONE();
> +}
> +
> +static void run_vcpu(struct kvm_vcpu *vcpu)
> +{
> +	struct ucall uc;
> +
> +	vcpu_run(vcpu);
> +	switch (get_ucall(vcpu, &uc)) {
> +	case UCALL_ABORT:
> +		REPORT_GUEST_ASSERT(uc);
> +		break;
> +	case UCALL_DONE:
> +	case UCALL_SYNC:
> +		break;
> +	default:
> +		TEST_FAIL("Unknown ucall %lu", uc.cmd);
> +		break;
> +	}
> +}
> +
> +void test_vm_destroy(struct kvm_vm *vm)
> +{
> +	memset(ctrinfo_arr, 0, sizeof(union sbi_pmu_ctr_info) * RISCV_MAX_PMU_COUNTERS);
> +	counter_mask_available = 0;
> +	kvm_vm_free(vm);
> +}
> +
> +static void test_vm_basic_test(void *guest_code)
> +{
> +	struct kvm_vm *vm;
> +	struct kvm_vcpu *vcpu;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
> +				   "SBI PMU not available, skipping test");
> +	vm_init_vector_tables(vm);
> +	/* Illegal instruction handler is required to verify read access without configuration */
> +	vm_install_exception_handler(vm, EXC_INST_ILLEGAL, guest_illegal_exception_handler);

I still don't see where the "verify" part is. The handler doesn't record
that it had to handle anything.

> +
> +	vcpu_init_vector_tables(vcpu);
> +	run_vcpu(vcpu);
> +
> +	test_vm_destroy(vm);
> +}
> +
> +static void test_vm_events_test(void *guest_code)
> +{
> +	struct kvm_vm *vm = NULL;
> +	struct kvm_vcpu *vcpu = NULL;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +	__TEST_REQUIRE(__vcpu_has_sbi_ext(vcpu, KVM_RISCV_SBI_EXT_PMU),
> +				   "SBI PMU not available, skipping test");
> +	run_vcpu(vcpu);
> +
> +	test_vm_destroy(vm);
> +}
> +
> +int main(void)
> +{
> +	test_vm_basic_test(test_pmu_basic_sanity);
> +	pr_info("SBI PMU basic test : PASS\n");
> +
> +	test_vm_events_test(test_pmu_events);
> +	pr_info("SBI PMU event verification test : PASS\n");
> +
> +	return 0;
> +}
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
