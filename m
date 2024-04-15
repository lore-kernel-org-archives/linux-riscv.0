Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BC1C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RxlShAshSlPMGM7fGDK2l7Cy12HaAgJQHjLRcPU+Js=; b=bw1UXfnFn8Jrfl
	y+vP3IwgwfXro9atpJZ34t79kwmjgGcZrWYMTJe90RyvAqYyB8qejg9qQebYgcgYyakm8NlE0bqY/
	GnBndg/KmhJIFbRqoQw//InRcAii/oo1BAGdghJsezwFWLKRxlXx6QFBFAOOj44HeE4/ARk44M5cI
	+sxE0iomd5lop+kfxiKadi43BQwPkvMb4i3UIDazbdW9tKW7g58uOAdWUnR18eosPDh8jty3b8jKh
	XMc22T+J5dLWJr1g6KndS6M98T456tdZu2CrNqrX5/lah1oNTR3pdCyOARMBUqedntydtQPHxjqfK
	1khRBp1dIYklpAlauWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMdA-00000008Xph-2uPu;
	Mon, 15 Apr 2024 13:44:20 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMcn-00000008XY7-0aTA
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:43:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-418798199a2so2823005e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713188634; x=1713793434; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oBlw086cFKfVgD6m6+KXW8B1bVXOlMOqtJCrOvRcQ7k=;
        b=mHgAzBY2zGL/WQKiD8ness7wViLNnWw1CGOvycbcu/sNHJH2hwC9v9ig22sTTP/56A
         Jg/hD+uxK2e6yCfjNCiQLwTTGCn4CVKo9jjIsRjwonwruxFpbB72JLtcltNmktPnL4uQ
         cksywSyZMMOXc2pMq3EzCFkjBO+iq1T6Vps2T9EV8+zWDUq8N8S3P0Bds+n73B/eQSy2
         W5W23SE0Xy3y5e6metRvSIAHoRDuzmO+K6kxS2sWyxzHgXz5ihWJFmCOHH3S/5z0g3Cu
         cplVfR2mCHSYyBYQrBjY0RWDKQqhcwiOOjY2kXFKbbkMoNrUhUsLC0hZwykSDKrb5i87
         O1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713188634; x=1713793434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBlw086cFKfVgD6m6+KXW8B1bVXOlMOqtJCrOvRcQ7k=;
        b=M4ae/2tkMJyddoHdYEuz5Qa6dI/Rc1DTiI3cRBnNPM2+NhE6X+Z5tczYddM36AgDAu
         5nuDBwOyWfT40lJuHdp11jv2i7bYAYvZAERLDQ8OhLTspW4e/ci4TeGwCk5umZFSvgOr
         wSjfezehEyewczvBVoBlIr1hkQ3pfIVq7oS0q/RaA5zNDUgBVN76gFsr9oLcD4mlQRnQ
         +o1Svb70BhTPQ/bwdQgnAY9nvv+nmiXUXg0P+Gq/riCUnD9b89CAGonMzGNGsFNumxbj
         S/z/SPull+OpQ9BpsBdGnCgk62VZanWlUln1lZXkCc5ATDqEuQLpyIif+d2JPQ5eTZ9Y
         VnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx0Sys3m46S4TLCmaegJ8q5zxrvDJMGCRMgdy71VHvTT0XBGEUOyrSir4900oejCCDA/9ZI+6170i6WaF7NyDmzBsRBFLGUxwvYb906l8y
X-Gm-Message-State: AOJu0YzQ/ba2Po3aH3rlKx9aR7NrTcq4+bWQlx30WN0TTJEmZ78PPYUt
	8zNjH3Pm7+20eIw8DztUfLEjI9BPTcJyIx/stbGV8ituCUaZXGRXquYttm1rqM0=
X-Google-Smtp-Source: AGHT+IFSJX/JAylOq7lyfTWV1n1rGtpOd6txYa80kvU3cra08zVigOgalF/jjTxDvlEfsaeWSmIeIQ==
X-Received: by 2002:a05:600c:4ecb:b0:418:2d69:d978 with SMTP id g11-20020a05600c4ecb00b004182d69d978mr4057431wmq.10.1713188633673;
        Mon, 15 Apr 2024 06:43:53 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b004163ee3922csm19555595wms.38.2024.04.15.06.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:43:53 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:43:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 24/24] KVM: riscv: selftests: Add commandline option
 for SBI PMU test
Message-ID: <20240415-8b9ad5a7e968b1808e99e3da@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-25-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-25-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_064357_236703_CC58A6BD 
X-CRM114-Status: GOOD (  25.90  )
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

On Wed, Apr 10, 2024 at 05:07:52PM -0700, Atish Patra wrote:
> SBI PMU test comprises of multiple tests and user may want to run
> only a subset depending on the platform. The most common case would
> be to run all to validate all the tests. However, some platform may
> not support all events or all ISA extensions.
> 
> The commandline option allows user to disable particular test if they
> want to.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 77 ++++++++++++++++---
>  1 file changed, 68 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 0fd9b76ae838..57025b07a403 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -33,6 +33,16 @@ static unsigned long counter_mask_available;
>  
>  static bool illegal_handler_invoked;
>  
> +enum sbi_pmu_test_id {
> +	SBI_PMU_TEST_BASIC = 0,
> +	SBI_PMU_TEST_EVENTS,
> +	SBI_PMU_TEST_SNAPSHOT,
> +	SBI_PMU_TEST_OVERFLOW,
> +	SBI_PMU_TEST_MAX,
> +};
> +
> +static int disabled_test_id = SBI_PMU_TEST_MAX;

I think we should allow specifying '-d' multiple times in case a user
wants to disable more than one type of test. So we should set a bit
in this variable instead of assigning it. We could also flip it
around. If the user uses '-e' to enable test type then only type
will be run, but then we'd probably want to allow multiple '-e'
too so it doesn't gain anything.

> +
>  unsigned long pmu_csr_read_num(int csr_num)
>  {
>  #define switchcase_csr_read(__csr_num, __val)		{\
> @@ -608,19 +618,68 @@ static void test_vm_events_overflow(void *guest_code)
>  	test_vm_destroy(vm);
>  }
>  
> -int main(void)
> +static void test_print_help(char *name)
>  {
> -	test_vm_basic_test(test_pmu_basic_sanity);
> -	pr_info("SBI PMU basic test : PASS\n");
> +	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
> +	pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
> +	pr_info("\t-h: print this help screen\n");
> +}
>  
> -	test_vm_events_test(test_pmu_events);
> -	pr_info("SBI PMU event verification test : PASS\n");
> +static bool parse_args(int argc, char *argv[])
> +{
> +	int opt;
> +
> +	while ((opt = getopt(argc, argv, "hd:")) != -1) {
> +		switch (opt) {
> +		case 'd':
> +			if (!strncmp("basic", optarg, 5))
> +				disabled_test_id = SBI_PMU_TEST_BASIC;
> +			else if (!strncmp("events", optarg, 6))
> +				disabled_test_id = SBI_PMU_TEST_EVENTS;
> +			else if (!strncmp("snapshot", optarg, 8))
> +				disabled_test_id = SBI_PMU_TEST_SNAPSHOT;
> +			else if (!strncmp("overflow", optarg, 8))
> +				disabled_test_id = SBI_PMU_TEST_OVERFLOW;
> +			else
> +				goto done;
> +			break;
> +		break;

Extra 'break'

> +		case 'h':
> +		default:
> +			goto done;
> +		}
> +	}
>  
> -	test_vm_events_snapshot_test(test_pmu_events_snaphost);
> -	pr_info("SBI PMU event verification with snapshot test : PASS\n");
> +	return true;
> +done:
> +	test_print_help(argv[0]);
> +	return false;
> +}
>  
> -	test_vm_events_overflow(test_pmu_events_overflow);
> -	pr_info("SBI PMU event verification with overflow test : PASS\n");
> +int main(int argc, char *argv[])
> +{
> +	if (!parse_args(argc, argv))
> +		exit(KSFT_SKIP);
> +
> +	if (disabled_test_id != SBI_PMU_TEST_BASIC) {
> +		test_vm_basic_test(test_pmu_basic_sanity);
> +		pr_info("SBI PMU basic test : PASS\n");
> +	}
> +
> +	if (disabled_test_id != SBI_PMU_TEST_EVENTS) {
> +		test_vm_events_test(test_pmu_events);
> +		pr_info("SBI PMU event verification test : PASS\n");
> +	}
> +
> +	if (disabled_test_id != SBI_PMU_TEST_SNAPSHOT) {
> +		test_vm_events_snapshot_test(test_pmu_events_snaphost);
> +		pr_info("SBI PMU event verification with snapshot test : PASS\n");
> +	}
> +
> +	if (disabled_test_id != SBI_PMU_TEST_OVERFLOW) {
> +		test_vm_events_overflow(test_pmu_events_overflow);
> +		pr_info("SBI PMU event verification with overflow test : PASS\n");
> +	}
>  
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
