Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3703FD262B2
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 05:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAWsYsqwy4x/ZscxUWmEDr1BLJeFvO0kDV+HyHuCr3U=; b=F76CNlqHe26rSe
	kuVzKzyvsAz3MHyKqbrS4f1tRdVxRNXC+O79fXFXFZVsD2Q+jip2iPiniEHXB3rO0zcERz4stscHQ
	Hk8fYpDd8G7eA1Y6AyhWlaAX2V/l6sZZuYx0FuPMh3n+d3Bd9jAchxKYvTJ66YGwrFGpBSQnVM2xG
	7uJOFuUs2IPCB5RxoBUbElQXYUz8+lTh2Gjl/noL2LI7er+vzpMfqJrku+mBox9+jvCC5QEjaaaLK
	d3uXpyBa/+2wb97SlecYS8xE76x0lO0PaDnc1ctMX7fSiDwkfHVUOdbL3SBatss3lq8oFVNXyLF0q
	CpVRD9kvpbtQ5hL7RYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR22-00000004ueH-3tUh;
	Wed, 21 Jan 2026 05:45:30 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR1x-00000004ucX-2FdE
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 05:45:30 +0000
X-UUID: 5ab3987af68c11f0b0f03b4cfa9209d1-20260121
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:508bdded-23e2-47af-bd06-24a8046211d7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:0fab305e8081ca41f69ad0fa902d795b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5ab3987af68c11f0b0f03b4cfa9209d1-20260121
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1510422865; Wed, 21 Jan 2026 13:45:12 +0800
Message-ID: <e596e070-b3c1-4aae-8f7c-35f172f1fbbf@kylinos.cn>
Date: Wed, 21 Jan 2026 13:45:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] lib/string_kunit: add performance benchmarks for
 strlen
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, kees@kernel.org, andy@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 charlie@rivosinc.com, conor.dooley@microchip.com, ajones@ventanamicro.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Joel Stanley <joel@jms.id.au>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-5-jiangfeng@kylinos.cn>
 <aW8y6eC7ZGRYIWkn@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aW8y6eC7ZGRYIWkn@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_214525_921814_BFE0F1CB 
X-CRM114-Status: GOOD (  22.08  )
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

On 2026/1/20 15:46, Andy Shevchenko wrote:
> On Tue, Jan 20, 2026 at 02:58:48PM +0800, Feng Jiang wrote:
>> Introduce a benchmarking framework to the string_kunit test suite to
>> measure the execution efficiency of string functions.
>>
>> The implementation is inspired by crc_benchmark(), measuring throughput
>> (MB/s) and latency (ns/call) across a range of string lengths. It
>> includes a warm-up phase, disables preemption during measurement, and
>> uses a fixed seed for reproducible results.
>>
>> This allows for comparing different implementations (e.g., generic C vs.
>> architecture-optimized assembly) within the KUnit environment.
>>
>> Initially, provide benchmarks for strlen().
> 
> ...
> 
>> +#define STRING_BENCH_SEED	888
>> +#define STRING_BENCH_WORKLOAD	1000000UL
> 
> Can also be (1 * MEGA) from units.h.

Fixed.

> ...
> 
>> +static const size_t bench_lens[] = {
>> +	0, 1, 7, 8, 16, 31, 64, 127, 512, 1024, 3173, 4096
> 
> Leave trailing comma.

Fixed.

> ...
> 
>> +static void *alloc_max_bench_buffer(struct kunit *test,
>> +		const size_t *lens, size_t count, size_t *buf_len)
>> +{
>> +	void *buf;
>> +	size_t i, max_len = 0;
>> +
>> +	for (i = 0; i < count; i++) {
>> +		if (max_len < lens[i])
>> +			max_len = lens[i];
>> +	}
>> +
>> +	/* Add space for NUL terminator */
>> +	max_len += 1;
> 
>> +	buf = kunit_kzalloc(test, max_len, GFP_KERNEL);
>> +	if (buf && buf_len)
>> +		*buf_len = max_len;
>> +
>> +	return buf;
> 
> 	if (!buf)
> 		return NULL;
> 
> 	*buf_len ...
> 	return buf;
> 

Fixed.

> ...
> 
>> +static void fill_random_string(char *buf, size_t len)
>> +{
>> +	size_t i;
>> +	struct rnd_state state;
> 
> Reversed xmas tree ordering?

Fixed.

>> +	if (!buf || !len)
>> +		return;
>> +
>> +	/* Use a fixed seed to ensure deterministic benchmark results */
>> +	prandom_seed_state(&state, 888);
>> +	prandom_bytes_state(&state, buf, len);
>> +
>> +	/* Replace null bytes to avoid early string termination */
>> +	for (i = 0; i < len; i++) {
>> +		if (buf[i] == '\0')
>> +			buf[i] = 0x01;
>> +	}
>> +
>> +	buf[len - 1] = '\0';
>> +}
> 
> ...
> 
>> +#define STRING_BENCH(iters, func, ...)					\
> 
> Is this same / similar code to crc_benchmark()? Perhaps we need to have KUnit
> provided macro / environment to perform such tests... Have you talked to KUnit
> people about all this?
> 

I haven't reached out to the KUnit maintainers yet. This implementation is currently
a lightweight adaptation specifically for string benchmarks. However, I agree that
a generic KUnit benchmarking harness would be beneficial for the kernel. For now,
I'll refine this version based on your feedback.

>> +({									\
>> +	u64 __bn_t;							\
>> +	size_t __bn_i;							\
>> +	size_t __bn_iters = (iters);					\
>> +	size_t __bn_warm_iters = max_t(size_t, __bn_iters / 10, 50U);	\
> 
> Try to avoid max_t() as much as possible. Wouldn't max() suffice?
> 

Will do.

>> +	/* Volatile function pointer prevents dead code elimination */	\
>> +	typeof(func) (* volatile __func) = (func);			\
>> +									\
>> +	for (__bn_i = 0; __bn_i < __bn_warm_iters; __bn_i++)		\
>> +		(void)__func(__VA_ARGS__);				\
>> +									\
>> +	preempt_disable();						\
>> +	__bn_t = ktime_get_ns();					\
>> +	for (__bn_i = 0; __bn_i < __bn_iters; __bn_i++)			\
>> +		(void)__func(__VA_ARGS__);				\
>> +	__bn_t = ktime_get_ns() - __bn_t;				\
>> +	preempt_enable();						\
>> +	__bn_t;								\
>> +})
>> +
>> +/**
>> + * STRING_BENCH_BUF() - Benchmark harness for single-buffer functions.
>> + * @test: KUnit context.
>> + * @buf_name: Local char * variable name to be defined.
>> + * @buf_size: Local size_t variable name to be defined.
>> + * @func: Function to benchmark.
>> + * @...: Extra arguments for @func.
>> + *
>> + * Prepares a randomized, null-terminated buffer and iterates through lengths
>> + * in bench_lens, defining @buf_name and @buf_size in each loop.
>> + */
>> +#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
>> +do {									\
>> +	char *buf_name, *_bn_buf;					\
>> +	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
>> +	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
>> +									\
>> +	if (!IS_ENABLED(CONFIG_STRING_KUNIT_BENCH))			\
>> +		kunit_skip(test, "not enabled");			\
>> +									\
>> +	_bn_buf = alloc_max_bench_buffer(test, bench_lens,		\
>> +			ARRAY_SIZE(bench_lens), &_bn_size);		\
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, _bn_buf);			\
>> +									\
>> +	fill_random_string(_bn_buf, _bn_size);				\
> 
>> +	_bn_buf[_bn_size - 1] = '\0';					\
> 
> You have already this there in the function, no?
> 

Indeed, that's redundant. I'll remove it.

>> +	for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {	\
>> +		buf_size = bench_lens[_bn_i];				\
>> +		buf_name = _bn_buf + _bn_size - buf_size - 1;		\
>> +		_bn_iters = STRING_BENCH_WORKLOAD /			\
>> +				max_t(size_t, buf_size, 1U);		\
> 
> max()

Fixed.

>> +		_bn_t = STRING_BENCH(_bn_iters, func, ##__VA_ARGS__);	\
>> +									\
>> +		if (_bn_t > 0) {					\
>> +			_bn_mbps = (u64)(buf_size) * _bn_iters * 1000;	\
>> +			_bn_mbps = div64_u64(_bn_mbps, _bn_t);		\
>> +			_bn_lat = div64_u64(_bn_t, _bn_iters);		\
>> +		}							\
>> +		kunit_info(test, "len=%zu: %llu MB/s (%llu ns/call)\n",	\
>> +				buf_size, _bn_mbps, _bn_lat);		\
>> +	}								\
>> +} while (0)
> 

Thanks for the catch. I will incorporate all your suggestions into v4.

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
