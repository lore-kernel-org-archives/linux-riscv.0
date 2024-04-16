Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A42C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 08:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXiBZCL3iCf1WBzAFk2kj6PskW32FXUIVUHDmISSfko=; b=ct7tWZIAE9/iTE
	GCmsxFLaRWD1WH5cL19nBxYzSNBSiCk6aay6bSwqSYiIwDTE11NfIjREHmdc5/u8FUeXiMt2DXp0j
	FArfoYXJJNwCQdKOk0/18kXjEERVdKLPmqImlzPvTPKABRzwuUVFxlPZ0BTAsOaUKCnUodeCwKZFV
	yIRbuIP9VyU3XAdB5g0LV79C0uoYx0IzPVGdHOWq1Ga4LIirCB8tdzJ/PWg7llxSsByvyQCG84MZc
	SdzcjqjSHzQghCWbA6RNYPNdIwe6hCgEzBRQjJHumK52alYSkUY/0u5hbq1+0eoSB+tpyGmyzB4Uw
	VlZmXtZr7hFq3RcjWfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweV5-0000000BV49-2cXr;
	Tue, 16 Apr 2024 08:49:11 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rweV2-0000000BV2r-3WTT
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 08:49:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2a54fb929c8so2664056a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713257347; x=1713862147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YB4OKZ5azyoBQVdDaeHRwpejD252N/Wm8xYNs68na58=;
        b=k0x7vrFAo1TDycFrgBHjV3WqxxO1Py5d4ovtUrgo5b5w+KDwxMqDA8v+CLP3LE1XYk
         61Mm8eM6Ex77tboOPNdXACM0jsin6/wG2yz5G/77Nh/0/GphaIMBmoKHEM29u/9uB1NW
         cF/7iWjVR7jSWe6t6dKdzPlVXcGja417RRkax9B45cZdYqD9dijNIA5AqMgximjsoSRf
         Q0wxAho/2j3Ks+nK5n6my0B3kfKqLiwQktwantdn1rsuF7lSC/uUuGr3Hcp8fLCbgMqK
         Yjqhx5MwNznMhxplthZ2rCV4ZAfrm6pqHw0oUiAppsFdfxWQVMCCn+0O7buD/xfGxdS+
         8V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713257347; x=1713862147;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YB4OKZ5azyoBQVdDaeHRwpejD252N/Wm8xYNs68na58=;
        b=XpTeoWDYZVMGPSoUfmDnUjZbUsx5Tu7+6EsfUaeFTq427l8oNLAO2vduooO54zatDH
         8kl+n+6+Hm9MzIwcUwPEKTI8NOGWG2RiTEROKO+nfw3UnfnAJTGqHGDALmKLN2kQgpqz
         iDMgKc3SfRNLZ2uXIVH7bSyy3xwGpYUWt0xkCZZvlD2olISY6U5vS/8/GaiVW3sYwAOx
         JjvJDY8oj9hu6Rgl3WfpjebF6QO0wZ35tln7GlczQ4iOGG+93/m7cOkzUmpPB/N+rJrl
         4yHBBnPh1Fp5ZuOaiC19k92NDcFJvM9jwPPaOJgUpFekS7PB5BWRPB/tdFWuXmHqvOb9
         XWfA==
X-Forwarded-Encrypted: i=1; AJvYcCVtg//QuqOchDuv13J1BFeaazhu+4+9ihPtTQ46e1MQuKeHRYDYyrgQJlj54//AfgynL5hXZMyruM0qvONEOsZBGMYL8JIT0548imhq9Cqs
X-Gm-Message-State: AOJu0YxEuugEvR3p36f/xi2GD/YVrOKlUdFA5nnJWd4HkM5GiCSPGZeQ
	uKr92tJNz8cIHlqvpluDUqz0ONphZf2ZwXY+KKwPWIYdavhGqUzEBp4uPz69Ld8=
X-Google-Smtp-Source: AGHT+IE5kvYAIrAzLyhCQG7YuKZN0xkJ8aTxnfQzZtfDgG4X+MG0/9j9aFOlv84kCs3vDDCZ3jMEMA==
X-Received: by 2002:a17:90a:ae12:b0:2a0:5f10:990c with SMTP id t18-20020a17090aae1200b002a05f10990cmr11367042pjq.10.1713257347059;
        Tue, 16 Apr 2024 01:49:07 -0700 (PDT)
Received: from [172.16.0.33] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm8721392pjs.6.2024.04.16.01.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 01:49:06 -0700 (PDT)
Message-ID: <be9a80a3-64f1-4848-94a4-031a3ea797ad@rivosinc.com>
Date: Tue, 16 Apr 2024 01:49:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 24/24] KVM: riscv: selftests: Add commandline option
 for SBI PMU test
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-25-atishp@rivosinc.com>
 <20240415-8b9ad5a7e968b1808e99e3da@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240415-8b9ad5a7e968b1808e99e3da@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_014908_892099_75DD27D0 
X-CRM114-Status: GOOD (  23.66  )
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

On 4/15/24 06:43, Andrew Jones wrote:
> On Wed, Apr 10, 2024 at 05:07:52PM -0700, Atish Patra wrote:
>> SBI PMU test comprises of multiple tests and user may want to run
>> only a subset depending on the platform. The most common case would
>> be to run all to validate all the tests. However, some platform may
>> not support all events or all ISA extensions.
>>
>> The commandline option allows user to disable particular test if they
>> want to.
>>
>> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   .../selftests/kvm/riscv/sbi_pmu_test.c        | 77 ++++++++++++++++---
>>   1 file changed, 68 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> index 0fd9b76ae838..57025b07a403 100644
>> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> @@ -33,6 +33,16 @@ static unsigned long counter_mask_available;
>>   
>>   static bool illegal_handler_invoked;
>>   
>> +enum sbi_pmu_test_id {
>> +	SBI_PMU_TEST_BASIC = 0,
>> +	SBI_PMU_TEST_EVENTS,
>> +	SBI_PMU_TEST_SNAPSHOT,
>> +	SBI_PMU_TEST_OVERFLOW,
>> +	SBI_PMU_TEST_MAX,
>> +};
>> +
>> +static int disabled_test_id = SBI_PMU_TEST_MAX;
> 
> I think we should allow specifying '-d' multiple times in case a user
> wants to disable more than one type of test. So we should set a bit
> in this variable instead of assigning it. We could also flip it
> around. If the user uses '-e' to enable test type then only type
> will be run, but then we'd probably want to allow multiple '-e'
> too so it doesn't gain anything.
> 

Sure. Added multiple disable option.

>> +
>>   unsigned long pmu_csr_read_num(int csr_num)
>>   {
>>   #define switchcase_csr_read(__csr_num, __val)		{\
>> @@ -608,19 +618,68 @@ static void test_vm_events_overflow(void *guest_code)
>>   	test_vm_destroy(vm);
>>   }
>>   
>> -int main(void)
>> +static void test_print_help(char *name)
>>   {
>> -	test_vm_basic_test(test_pmu_basic_sanity);
>> -	pr_info("SBI PMU basic test : PASS\n");
>> +	pr_info("Usage: %s [-h] [-d <test name>]\n", name);
>> +	pr_info("\t-d: Test to disable. Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
>> +	pr_info("\t-h: print this help screen\n");
>> +}
>>   
>> -	test_vm_events_test(test_pmu_events);
>> -	pr_info("SBI PMU event verification test : PASS\n");
>> +static bool parse_args(int argc, char *argv[])
>> +{
>> +	int opt;
>> +
>> +	while ((opt = getopt(argc, argv, "hd:")) != -1) {
>> +		switch (opt) {
>> +		case 'd':
>> +			if (!strncmp("basic", optarg, 5))
>> +				disabled_test_id = SBI_PMU_TEST_BASIC;
>> +			else if (!strncmp("events", optarg, 6))
>> +				disabled_test_id = SBI_PMU_TEST_EVENTS;
>> +			else if (!strncmp("snapshot", optarg, 8))
>> +				disabled_test_id = SBI_PMU_TEST_SNAPSHOT;
>> +			else if (!strncmp("overflow", optarg, 8))
>> +				disabled_test_id = SBI_PMU_TEST_OVERFLOW;
>> +			else
>> +				goto done;
>> +			break;
>> +		break;
> 
> Extra 'break'
> 

Fixed. Thanks for catching this.

>> +		case 'h':
>> +		default:
>> +			goto done;
>> +		}
>> +	}
>>   
>> -	test_vm_events_snapshot_test(test_pmu_events_snaphost);
>> -	pr_info("SBI PMU event verification with snapshot test : PASS\n");
>> +	return true;
>> +done:
>> +	test_print_help(argv[0]);
>> +	return false;
>> +}
>>   
>> -	test_vm_events_overflow(test_pmu_events_overflow);
>> -	pr_info("SBI PMU event verification with overflow test : PASS\n");
>> +int main(int argc, char *argv[])
>> +{
>> +	if (!parse_args(argc, argv))
>> +		exit(KSFT_SKIP);
>> +
>> +	if (disabled_test_id != SBI_PMU_TEST_BASIC) {
>> +		test_vm_basic_test(test_pmu_basic_sanity);
>> +		pr_info("SBI PMU basic test : PASS\n");
>> +	}
>> +
>> +	if (disabled_test_id != SBI_PMU_TEST_EVENTS) {
>> +		test_vm_events_test(test_pmu_events);
>> +		pr_info("SBI PMU event verification test : PASS\n");
>> +	}
>> +
>> +	if (disabled_test_id != SBI_PMU_TEST_SNAPSHOT) {
>> +		test_vm_events_snapshot_test(test_pmu_events_snaphost);
>> +		pr_info("SBI PMU event verification with snapshot test : PASS\n");
>> +	}
>> +
>> +	if (disabled_test_id != SBI_PMU_TEST_OVERFLOW) {
>> +		test_vm_events_overflow(test_pmu_events_overflow);
>> +		pr_info("SBI PMU event verification with overflow test : PASS\n");
>> +	}
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
