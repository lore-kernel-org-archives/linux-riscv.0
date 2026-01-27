Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1BCD13C1B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 09:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aR9si8vzVM0nXwAhgLDqf++Pm26isE9PNdCq+jHgTl8=; b=IErdbtIODcoRQH
	9RkqJCcb7gXSduvRuTezy4UNFkg35Au15poyu1QXJF+r6qLj+EeMaNIta3Te+Rmr2OMDgef6D4Rll
	Ij4Pf1sQGCEpPciLQfocgIN5czcxefW4CcEpM9x7GrpWoBIRty/UWSAMz/wlok8KdyQxp7/cC8kTw
	ReM66IVZNK7PTVSswseJf7X+/tcQDH5n1EI6BuWrlxylwhIw7j6Qp5SOXTF36wdFAkY6QIfBk8ExT
	MTx07ecCrl+ErkdB1MGR8JYoXJGpe65f2lmSY1lgA/omuaF2A07vuGOysulzJOAmQdsjAFd6GJRzY
	0r74mmb0wmtJqfaPDfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfSC-0000000DwlA-1Dlc;
	Tue, 27 Jan 2026 09:33:44 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfS7-0000000Dwgo-3jkT
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 09:33:43 +0000
X-UUID: 33ae895cfb6311f0b0f03b4cfa9209d1-20260127
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:924c3915-d02c-422d-b550-1d91469ae95f,IP:0,UR
	L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:2
X-CID-META: VersionHash:a9d874c,CLOUDID:e6e4b4dd21fa9035a4a80c4860a47fc1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:4|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 33ae895cfb6311f0b0f03b4cfa9209d1-20260127
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 704281077; Tue, 27 Jan 2026 17:33:13 +0800
Message-ID: <dcdb82e8-691a-4cc1-88d5-755039ed0313@kylinos.cn>
Date: Tue, 27 Jan 2026 17:33:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] lib/string_kunit: add performance benchmark for
 strlen()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, kees@kernel.org, andy@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, sohil.mehta@intel.com,
 charlie@rivosinc.com, conor.dooley@microchip.com, samuel.holland@sifive.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260127012558.40025-1-jiangfeng@kylinos.cn>
 <20260127012558.40025-5-jiangfeng@kylinos.cn>
 <aXh93EVRSOrQQS6l@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aXh93EVRSOrQQS6l@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013341_785698_9C74F1DA 
X-CRM114-Status: GOOD (  20.17  )
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

On 2026/1/27 16:57, Andy Shevchenko wrote:
> On Tue, Jan 27, 2026 at 09:25:54AM +0800, Feng Jiang wrote:
>> Introduce a benchmarking framework to the string_kunit test suite to
>> measure the execution efficiency of string functions.
>>
>> The implementation is inspired by crc_benchmark(), measuring throughput
>> (MB/s) and latency (ns/call) across a range of string lengths. It
>> includes a warm-up phase, disables preemption during measurement, and
>> uses a fixed seed for reproducible results.
>>
>> This framework allows for comparing different implementations (e.g.,
>> generic C vs. architecture-optimized assembly) within the KUnit
>> environment.
> 
> Acked-by: Andy Shevchenko <andy@kernel.org>
> A few nit-picks below.
> 

Thanks for the Acked-by and the detailed review.

> ...
> 
>> +static void *alloc_max_bench_buffer(struct kunit *test,
>> +		const size_t *lens, size_t count, size_t *buf_len)
>> +{
>> +	size_t max_len = 0;
>> +	void *buf;
>> +
>> +	for (size_t i = 0; i < count; i++)
>> +		max_len = max(lens[i], max_len);
> 
> You also need minmax.h.

Will add.

> ...
> 
>> +#define STRING_BENCH(iters, func, ...)					\
>> +({									\
>> +	/* Volatile function pointer prevents dead code elimination */	\
>> +	typeof(func) (* volatile __func) = (func);			\
>> +	size_t __bn_iters = (iters);					\
>> +	size_t __bn_warm_iters;						\
>> +	u64 __bn_t;							\
> 
> 
> Perhaps a short comment here
> 
> 	/* Use 10% of the given iterations (maximum 50) to warm up */

Will add this comment.

>> +	__bn_warm_iters = max(__bn_iters / 10, 50U);			\
>> +									\
>> +	for (size_t __bn_i = 0; __bn_i < __bn_warm_iters; __bn_i++)	\
>> +		(void)__func(__VA_ARGS__);				\
>> +									\
>> +	preempt_disable();						\
>> +	__bn_t = ktime_get_ns();					\
>> +	for (size_t __bn_i = 0; __bn_i < __bn_iters; __bn_i++)		\
>> +		(void)__func(__VA_ARGS__);				\
>> +	__bn_t = ktime_get_ns() - __bn_t;				\
>> +	preempt_enable();						\
>> +	__bn_t;								\
>> +})
> 
> ...
> 
>> +#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
>> +do {									\
>> +	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
>> +	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
>> +	char *buf_name, *_bn_buf;					\
>> +									\
>> +	_bn_buf = alloc_max_bench_buffer(test, bench_lens,		\
>> +			ARRAY_SIZE(bench_lens), &_bn_size);		\
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, _bn_buf);			\
>> +									\
>> +	fill_random_string(_bn_buf, _bn_size);				\
>> +									\
>> +	for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {	\
>> +		buf_size = bench_lens[_bn_i];				\
>> +		buf_name = _bn_buf + _bn_size - buf_size - 1;		\
>> +		_bn_iters = STRING_BENCH_WORKLOAD / max(buf_size, 1U);	\
>> +									\
>> +		_bn_t = STRING_BENCH(_bn_iters, func, ##__VA_ARGS__);	\
> 
>> +									\
> 
> Remove unneeded blank line.

Will fix.

>> +		if (_bn_t > 0) {					\
>> +			_bn_mbps = (u64)(buf_size) * _bn_iters		\
> 
> Why buf_size in the parentheses here and not anywhere else (above)?

It was a bit inconsistent. I'll remove the unneeded parentheses for buf_size.

> I assume it's just an external temporary variable? But why do we need to have
> it in the parameters to the macro?

This is necessary because buf_size often needs to be passed as an argument
to the function under test. For instance, when benchmarking strnlen, the
caller must pass the current length as an argument:
STRING_BENCH_BUF(test, buf, len, strnlen, buf, len);

>> +					* (NSEC_PER_SEC / MEGA);	\
> > Leave '*' on the previous line.

Will fix.

>> +			_bn_mbps = div64_u64(_bn_mbps, _bn_t);		\
>> +			_bn_lat = div64_u64(_bn_t, _bn_iters);		\
>> +		}							\
>> +		kunit_info(test, "len=%zu: %llu MB/s (%llu ns/call)\n",	\
>> +				buf_size, _bn_mbps, _bn_lat);		\
>> +	}								\
>> +} while (0)
> 

Thank you again for your patience and for helping me improve the quality of
this patch.

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
