Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A16C021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DH5WVh0HjED0v58Idu14UGa0f0+uNBftx+HxziT8hME=; b=kSiHA46lGUB9E3
	xAkWa7Z5mbem71ZBQjnrMleV5BgGO/cOq1B0Uq3BNFgiwq7ZLGMXGvHwvAFrUyi6BMYoejY3MB40S
	nwHmVFJn1vpMulKhZwBalYxEazATA8eY80s3Ns5905WZQruQxROafHT+Eo9AzN1Z84ziFe80FsNue
	hmLWIshtEAwLraM8CIkQS1lF2Kj8XZPpkuGRX7R8e6/FIUPuE1EnRV1M+VrMINrUExjOp7cwfpV6H
	O7FwICS6F++RGL1wcMbzo/lgFQ/rZNZ4guj6+5rDV7rU9enPY0NafiupnZ6/whUlZARkxhfYQ8VRU
	RkOCglkX/dfh2rMZ9Q2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYyG-00000006ef5-2Ccv;
	Thu, 27 Feb 2025 08:10:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYwd-00000006eNs-2t43
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 08:08:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so10783055e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740643713; x=1741248513; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXEKvsRH1IHGZjXRKII/sR3OF5jBOeQXuZKp+7GCCWk=;
        b=caxT5OIJdjNsYvkezZ0bcLCvBz6APIj/kI+ThWNhCPvnEFaEUgSuBcxE1ZDSLYUqAo
         UNmVApzvIJ9rL3e6ZWVd3c4/KCu7O1Pz8Zi5NYo92If2V/b4DqpS+8gj6IJtvAHEhttp
         FHfQ7RDiTsJyIGaYddI/rLibo3WaemEtg6ned3rM7PU6gc3WT55Kpg96EaQy7p6XIF0+
         ComQ4Sy6Vjx7ALuJAjBEYSq3apaWgKRBaFAZq6wBM/W7Vc+orQBnFNdTrMhBN0UArsER
         S1IL4tgrL+eG8/PC/2uKOEtSXOt6pxbXj19LXS2gMNQtduGf7ujcshCPUziLDeS5NKO1
         cKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740643713; x=1741248513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXEKvsRH1IHGZjXRKII/sR3OF5jBOeQXuZKp+7GCCWk=;
        b=ftuQsf0Gyhs2ZVbyuCkX6B7kmfV8qkoA+QOVMiCDXLLVlLiuX645h3sHeekElLNIlk
         JgOtuGXpqSDJ1127TzGbKMBHiIEGPlISFluTR65FskKWGPj0PmAV7d1DziMj7X1rpu2o
         Jyx1IeD2cV5l6wLgR+5F4jIEvkDdri6BAaRPWmqHKjRoVEOARiLBDyzQr7Topz8jCVk5
         jtkNsC5wkunTQiH1NhbCloZAl6XJUoxtztHsJlh7B7d2LxkyRoEPmFuEGD/8XZ5Y1BWH
         lMN72aof0UAe/dNHfVhDM2+oPXlOv1cUpccKd+ocGL3HWAL/W7w7aeNOmnKtUONpxA8S
         F/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWIuGQrDRK3Uvgg8C6t/9qFS3HdagSiY/Wg25bnCHhWFmV/2W/1FQLy0Sz8iD3buGJrMia5fPgaOrZubQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKpX/gYj2g9L8ResS3rB4cyrU9Qefw5HsEEhXTIyNlPl4KM1wo
	aGkqLEeyiIyad0jQ3mUBSzp+QE0lo8mOEUQysbiANt4cqe/3cDoZxftMSEseFOc=
X-Gm-Gg: ASbGnctMMwLO7kG3XTrz+Vph6YVOYl+zTBj38qDNQtZTAao3PPQJcudo7PA8JsPY76a
	M3GTCU1fpbCTpJP2masAvpXaLFeCorWnY8ydRPjoxNDJfHqwGIXsHddEJ0djXNCkOsogdC/B3lc
	PLk6CQGOu2stSsxFqpvEtYAAeXbOaTRYNxHFNPSsIyJTquRBCbWrrgt1VFZYopACNpkHr8v16TS
	l7OTrxU9tZ0lmbK2xg/rlerFk81Bdk8jdwJEioIJCegqWRDQ71XrbedhaKnQLhrQ1ugMcGp8LoX
	liXpNwgf+i4dRA==
X-Google-Smtp-Source: AGHT+IFfzFnOGuM3XpELAhnmFcvI3sNcf5fvXpL9iafVg+5GXrJpxNcbrV4SnJPTY8dCnZQ7wtZd1A==
X-Received: by 2002:a5d:5f93:0:b0:38b:f4e6:21aa with SMTP id ffacd0b85a97d-390e1648bd8mr1563072f8f.5.1740643713445;
        Thu, 27 Feb 2025 00:08:33 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::8cf0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm1198683f8f.44.2025.02.27.00.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:08:33 -0800 (PST)
Date: Thu, 27 Feb 2025 09:08:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/4] KVM: riscv: selftests: Change command line option
Message-ID: <20250227-eb9e3d8de1de2ff609ac8f64@orel>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
 <20250226-kvm_pmu_improve-v1-3-74c058c2bf6d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226-kvm_pmu_improve-v1-3-74c058c2bf6d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_000835_734255_2610CD33 
X-CRM114-Status: GOOD (  26.26  )
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

On Wed, Feb 26, 2025 at 12:25:05PM -0800, Atish Patra wrote:
> The PMU test commandline option takes an argument to disable a
> certain test. The initial assumption behind this was a common use case
> is just to run all the test most of the time. However, running a single
> test seems more useful instead. Especially, the overflow test has been
> helpful to validate PMU virtualizaiton interrupt changes.
> 
> Switching the command line option to run a single test instead
> of disabling a single test also allows to provide additional
> test specific arguments to the test. The default without any options
> remains unchanged which continues to run all the tests.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 40 +++++++++++++++---------
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 284bc80193bd..533b76d0de82 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -39,7 +39,11 @@ static bool illegal_handler_invoked;
>  #define SBI_PMU_TEST_SNAPSHOT	BIT(2)
>  #define SBI_PMU_TEST_OVERFLOW	BIT(3)
>  
> -static int disabled_tests;
> +struct test_args {
> +	int disabled_tests;
> +};
> +
> +static struct test_args targs;
>  
>  unsigned long pmu_csr_read_num(int csr_num)
>  {
> @@ -604,7 +608,11 @@ static void test_vm_events_overflow(void *guest_code)
>  	vcpu_init_vector_tables(vcpu);
>  	/* Initialize guest timer frequency. */
>  	timer_freq = vcpu_get_reg(vcpu, RISCV_TIMER_REG(frequency));
> +
> +	/* Export the shared variables to the guest */
>  	sync_global_to_guest(vm, timer_freq);
> +	sync_global_to_guest(vm, vcpu_shared_irq_count);
> +	sync_global_to_guest(vm, targs);
>  
>  	run_vcpu(vcpu);
>  
> @@ -613,28 +621,30 @@ static void test_vm_events_overflow(void *guest_code)
>  
>  static void test_print_help(char *name)
>  {
> -	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
> -	pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
> +	pr_info("Usage: %s [-h] [-t <test name>]\n", name);
> +	pr_info("\t-t: Test to run (default all). Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");

It's probably fine to drop '-d', since we don't make any claims about
support, but doing so does risk breaking some CI somewhere. If that
potential breakage is a concern, then we could keep '-d', since nothing
stops us from having both.

>  	pr_info("\t-h: print this help screen\n");
>  }
>  
>  static bool parse_args(int argc, char *argv[])
>  {
>  	int opt;
> -
> -	while ((opt = getopt(argc, argv, "hd:")) != -1) {
> +	int temp_disabled_tests = SBI_PMU_TEST_BASIC | SBI_PMU_TEST_EVENTS | SBI_PMU_TEST_SNAPSHOT |
> +				  SBI_PMU_TEST_OVERFLOW;
> +	while ((opt = getopt(argc, argv, "h:t:n:")) != -1) {

'-h' doesn't need an argument and '-n' should be introduced with the next
patch.

>  		switch (opt) {
> -		case 'd':
> +		case 't':
>  			if (!strncmp("basic", optarg, 5))
> -				disabled_tests |= SBI_PMU_TEST_BASIC;
> +				temp_disabled_tests &= ~SBI_PMU_TEST_BASIC;
>  			else if (!strncmp("events", optarg, 6))
> -				disabled_tests |= SBI_PMU_TEST_EVENTS;
> +				temp_disabled_tests &= ~SBI_PMU_TEST_EVENTS;
>  			else if (!strncmp("snapshot", optarg, 8))
> -				disabled_tests |= SBI_PMU_TEST_SNAPSHOT;
> +				temp_disabled_tests &= ~SBI_PMU_TEST_SNAPSHOT;
>  			else if (!strncmp("overflow", optarg, 8))
> -				disabled_tests |= SBI_PMU_TEST_OVERFLOW;
> +				temp_disabled_tests &= ~SBI_PMU_TEST_OVERFLOW;
>  			else
>  				goto done;
> +			targs.disabled_tests = temp_disabled_tests;
>  			break;
>  		case 'h':
>  		default:
> @@ -650,25 +660,27 @@ static bool parse_args(int argc, char *argv[])
>  
>  int main(int argc, char *argv[])
>  {
> +	targs.disabled_tests = 0;
> +
>  	if (!parse_args(argc, argv))
>  		exit(KSFT_SKIP);
>  
> -	if (!(disabled_tests & SBI_PMU_TEST_BASIC)) {
> +	if (!(targs.disabled_tests & SBI_PMU_TEST_BASIC)) {
>  		test_vm_basic_test(test_pmu_basic_sanity);
>  		pr_info("SBI PMU basic test : PASS\n");
>  	}
>  
> -	if (!(disabled_tests & SBI_PMU_TEST_EVENTS)) {
> +	if (!(targs.disabled_tests & SBI_PMU_TEST_EVENTS)) {
>  		test_vm_events_test(test_pmu_events);
>  		pr_info("SBI PMU event verification test : PASS\n");
>  	}
>  
> -	if (!(disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
> +	if (!(targs.disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
>  		test_vm_events_snapshot_test(test_pmu_events_snaphost);
>  		pr_info("SBI PMU event verification with snapshot test : PASS\n");
>  	}
>  
> -	if (!(disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
> +	if (!(targs.disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
>  		test_vm_events_overflow(test_pmu_events_overflow);
>  		pr_info("SBI PMU event verification with overflow test : PASS\n");
>  	}
> 
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
