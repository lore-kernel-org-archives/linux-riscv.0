Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DCEC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 09:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcvaPqIsc1Rtiei/x6Lz0J7FhTBgO6RP95AfkT/sVZ0=; b=axWaZDnuhlCF6U
	MTjvesQEnhdiUgaxebRrofQZzw77HqGNlFGaL+T1qgFp2y88NPNVn8YE4VooN4h8CFmQ9qRiHxZ6+
	e2dlmzhdU4/OpUJn2+2Mv7bK52v/EXwTzuzBCnd1xDj833q9rT/BAw2atBJ3V7mqSfesSJSJI8OWX
	9nwNuGXbbWCaS90XANlZOwk8vyDB/yb9ra8Qbrt+THPmcDAZ4QBkqNSGZe5+QqO48eNZjnDfwsSEC
	3B0LQRb4q+D9la6y24V69ipf1SYVNw1tYZ+/mD0rKWHiZtaC/2AnViEbTVCw2ouTr8Ug61mu6ha5G
	TDevbbZbIvhj3u4Q926w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzC3b-0000000GaUi-2j9W;
	Tue, 23 Apr 2024 09:03:19 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzC3U-0000000GaSn-4A11;
	Tue, 23 Apr 2024 09:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713862991;
	bh=ZhShH3/3rdnIjiL1nxztMfl3ZOxaEjovEywEq+0BN6o=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=JjjwOQ6isr691Bw4kJAkfAfT+SMmu4biuU/dRrtYswGHFCulY/PdgxGcX7HKyBifO
	 JpcFVgdz+L5UZ1seL02TMghlOJ1RnaqNfBt/0h9MoR3tlfaGB3kt3DkcmFSg3AdEmP
	 dQkGwNTYGvF3QOLGsV6kT0azFNIQ29hcFiVUfJ0xFl31fDTnQtLR22Ulu2RQErtIYP
	 tI72e/U7ymSlS91ObLPs7XjPbWXVpfdPN3lcG0UNk3sQ/+uMr7pfuO5mWdwUMg68lt
	 AwqhJDFzmDtKqkKk9QWP1rbSD8/vD+8MeVr0YM8EiwX4Ls5FgkZgrLRmMvxI2kem5J
	 Nmyrk4NP97tEQ==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C2BD83780016;
	Tue, 23 Apr 2024 09:03:01 +0000 (UTC)
Message-ID: <724a4797-18dc-4011-ba48-445c1cb6a976@collabora.com>
Date: Tue, 23 Apr 2024 14:03:29 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 samuel.holland@sifive.com, Conor Dooley <conor.dooley@microchip.com>,
 Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v8 24/24] KVM: riscv: selftests: Add commandline option
 for SBI PMU test
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
References: <20240420151741.962500-1-atishp@rivosinc.com>
 <20240420151741.962500-25-atishp@rivosinc.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240420151741.962500-25-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_020313_271432_125FC8EB 
X-CRM114-Status: GOOD (  19.67  )
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

On 4/20/24 8:17 PM, Atish Patra wrote:
> SBI PMU test comprises of multiple tests and user may want to run
> only a subset depending on the platform. The most common case would
> be to run all to validate all the tests. However, some platform may
> not support all events or all ISA extensions.
> 
> The commandline option allows user to disable any set of tests if
> they want to.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
LGTM

Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

> ---
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 73 ++++++++++++++++---
>  1 file changed, 64 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 0fd9b76ae838..69bb94e6b227 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -33,6 +33,13 @@ static unsigned long counter_mask_available;
>  
>  static bool illegal_handler_invoked;
>  
> +#define SBI_PMU_TEST_BASIC	BIT(0)
> +#define SBI_PMU_TEST_EVENTS	BIT(1)
> +#define SBI_PMU_TEST_SNAPSHOT	BIT(2)
> +#define SBI_PMU_TEST_OVERFLOW	BIT(3)
> +
> +static int disabled_tests;
> +
>  unsigned long pmu_csr_read_num(int csr_num)
>  {
>  #define switchcase_csr_read(__csr_num, __val)		{\
> @@ -608,19 +615,67 @@ static void test_vm_events_overflow(void *guest_code)
>  	test_vm_destroy(vm);
>  }
>  
> -int main(void)
> +static void test_print_help(char *name)
> +{
> +	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
A little weird that we have pr_info named helper to print logs when it is a
userspace application, not kernel code. I'll check it in the source who
added it to the KVM tests.

> +	pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
> +	pr_info("\t-h: print this help screen\n");
> +}
> +
> +static bool parse_args(int argc, char *argv[])
> +{
> +	int opt;
> +
> +	while ((opt = getopt(argc, argv, "hd:")) != -1) {
> +		switch (opt) {
> +		case 'd':
> +			if (!strncmp("basic", optarg, 5))
> +				disabled_tests |= SBI_PMU_TEST_BASIC;
> +			else if (!strncmp("events", optarg, 6))
> +				disabled_tests |= SBI_PMU_TEST_EVENTS;
> +			else if (!strncmp("snapshot", optarg, 8))
> +				disabled_tests |= SBI_PMU_TEST_SNAPSHOT;
> +			else if (!strncmp("overflow", optarg, 8))
> +				disabled_tests |= SBI_PMU_TEST_OVERFLOW;
> +			else
> +				goto done;
> +			break;
> +		case 'h':
> +		default:
> +			goto done;
> +		}
> +	}
> +
> +	return true;
> +done:
> +	test_print_help(argv[0]);
> +	return false;
> +}
> +
> +int main(int argc, char *argv[])
>  {
> -	test_vm_basic_test(test_pmu_basic_sanity);
> -	pr_info("SBI PMU basic test : PASS\n");
> +	if (!parse_args(argc, argv))
> +		exit(KSFT_SKIP);
> +
> +	if (!(disabled_tests & SBI_PMU_TEST_BASIC)) {
> +		test_vm_basic_test(test_pmu_basic_sanity);
> +		pr_info("SBI PMU basic test : PASS\n");
> +	}
>  
> -	test_vm_events_test(test_pmu_events);
> -	pr_info("SBI PMU event verification test : PASS\n");
> +	if (!(disabled_tests & SBI_PMU_TEST_EVENTS)) {
> +		test_vm_events_test(test_pmu_events);
> +		pr_info("SBI PMU event verification test : PASS\n");
> +	}
>  
> -	test_vm_events_snapshot_test(test_pmu_events_snaphost);
> -	pr_info("SBI PMU event verification with snapshot test : PASS\n");
> +	if (!(disabled_tests & SBI_PMU_TEST_SNAPSHOT)) {
> +		test_vm_events_snapshot_test(test_pmu_events_snaphost);
> +		pr_info("SBI PMU event verification with snapshot test : PASS\n");
> +	}
>  
> -	test_vm_events_overflow(test_pmu_events_overflow);
> -	pr_info("SBI PMU event verification with overflow test : PASS\n");
> +	if (!(disabled_tests & SBI_PMU_TEST_OVERFLOW)) {
> +		test_vm_events_overflow(test_pmu_events_overflow);
> +		pr_info("SBI PMU event verification with overflow test : PASS\n");
> +	}
>  
>  	return 0;
>  }

-- 
BR,
Muhammad Usama Anjum

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
