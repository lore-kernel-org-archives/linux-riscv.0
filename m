Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A8CEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6Es2Bz9XzIxeyjbLpTHTR6QuPY/9rR/CDgOGXKdMIY=; b=i4HIrefgqp/hkw
	J6fGv0UTKEchfDic+RuZUdn8vl3G9TBDCKEFT7mjc1CU74m47ze35idDWTj9aCquG6sSILXEtoaJR
	Lqyt1JO/9gKbDFIEoo9gBMDwM9mhEMNK/t7bxXIDLlV9dOlwMDjta46aoP9CI2O05LpiE2oYBf/p3
	iMYv8miiBtwKkTtQ68lJ7JBR2Zb7TFrEB6p71rPld7cpYEHqFn7nqzVwj+HEdZdKPIO23Gs/2hJUu
	A806CYPDv4MwI5Alb6KFODpDbo+5AUfIS/sNRxTODDMFwtlKl7bJ9Wq1QUONQYowhI869HQw5rnrf
	44E3jWOvOroKzW2ZqO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9joP-00EOwY-1P;
	Thu, 15 Jun 2023 10:02:41 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9joL-00EOut-2B;
	Thu, 15 Jun 2023 10:02:39 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA24FFF805;
	Thu, 15 Jun 2023 10:02:28 +0000 (UTC)
Message-ID: <35dc3141-ac83-791c-7439-1c1f25ca95e8@ghiti.fr>
Date: Thu, 15 Jun 2023 12:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 10/10] perf: tests: Adapt mmap-basic.c for riscv
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-11-alexghiti@rivosinc.com>
 <20230531-31bd9ddeaca8cb338f81ed14@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230531-31bd9ddeaca8cb338f81ed14@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_030237_862183_80930BF5 
X-CRM114-Status: GOOD (  15.92  )
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


On 31/05/2023 17:15, Andrew Jones wrote:
> On Fri, May 12, 2023 at 10:53:21AM +0200, Alexandre Ghiti wrote:
>> riscv now supports mmaping hardware counters to userspace so adapt the test
>> to run on this architecture.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   tools/perf/tests/mmap-basic.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
>> index e68ca6229756..f5075ca774f8 100644
>> --- a/tools/perf/tests/mmap-basic.c
>> +++ b/tools/perf/tests/mmap-basic.c
>> @@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
>>   			 "permissions"),
>>   	TEST_CASE_REASON("User space counter reading of instructions",
>>   			 mmap_user_read_instr,
>> -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
>> +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
>>   			 "permissions"
>>   #else
>>   			 "unsupported"
>> @@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
>>   		),
>>   	TEST_CASE_REASON("User space counter reading of cycles",
>>   			 mmap_user_read_cycles,
>> -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
>> +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
>>   			 "permissions"
>>   #else
>>   			 "unsupported"
>> -- 
>> 2.37.2
>>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


Thanks for your review Andrew, as usual, always helpful.

And sorry for the delay!

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
