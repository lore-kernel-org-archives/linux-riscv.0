Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F8AD35697
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8JQWzxcWUjdpSdTGLBHU37DI050A1yxtvhsjVaKPzg=; b=YLBx3xxTbEEsE4
	g+cpWHYndRxTulul9qP/vLGlTe7pVESo5xSNX7DfdFYBkj/HxDctOnZDzFpr5iw0Obj9lkFJFhVmL
	4Ie1aZDMrkL7OfIKFLUT6bJ/kL6Ex5gZxJKnY2qHb2jSeWmrOEf+9dukLbEiZGfTc/jqQ9rk9MgqV
	q+JPzLcQCMOHcg/ag+yQg2Pqqb1ZMP+mj7otw4PCxNqvd6gKX0fgx0oQvjBPPNpIvt2nb75F3xTgw
	9iMsVC/FYQh4o/EYCJe7/gRJ4w+JVwZxU9d9kEI2ZR9AakcDTB+PWosIMJYAm6OKqJ+7c2kcrDdZf
	ne++4JZkAfva5EjThDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1jW-0000000FkCq-3VeF;
	Wed, 28 Jan 2026 09:21:09 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1jU-0000000FkAo-0ehj
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 09:21:06 +0000
X-UUID: a7b5d806fc2a11f0b0f03b4cfa9209d1-20260128
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6ac908b7-1750-4ebf-a73a-631faeae6520,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:91d8eeff496e98c2da796a6a28df1cc2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a7b5d806fc2a11f0b0f03b4cfa9209d1-20260128
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1755012723; Wed, 28 Jan 2026 17:20:58 +0800
Message-ID: <56eb86c0-9b60-4f7f-8824-16f14a019e3c@kylinos.cn>
Date: Wed, 28 Jan 2026 17:20:55 +0800
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
 <dcdb82e8-691a-4cc1-88d5-755039ed0313@kylinos.cn>
 <aXiKelsJF-SiqnVS@smile.fi.intel.com>
 <0d0f0528-738b-402c-a05c-53e21000dc67@kylinos.cn>
 <aXnP_6wsyXcVGasN@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aXnP_6wsyXcVGasN@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_012104_535321_EE78449B 
X-CRM114-Status: GOOD (  20.19  )
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

On 2026/1/28 16:59, Andy Shevchenko wrote:
> On Wed, Jan 28, 2026 at 09:44:40AM +0800, Feng Jiang wrote:
>> On 2026/1/27 17:50, Andy Shevchenko wrote:
>>> On Tue, Jan 27, 2026 at 05:33:10PM +0800, Feng Jiang wrote:
>>>> On 2026/1/27 16:57, Andy Shevchenko wrote:
>>>>> On Tue, Jan 27, 2026 at 09:25:54AM +0800, Feng Jiang wrote:
> 
> ...
> 
>>>>>> +#define STRING_BENCH_BUF(test, buf_name, buf_size, func, ...)		\
>>>>>> +do {									\
>>>>>> +	size_t buf_size, _bn_i, _bn_iters, _bn_size = 0;		\
>>>>>> +	u64 _bn_t, _bn_mbps = 0, _bn_lat = 0;				\
>>>>>> +	char *buf_name, *_bn_buf;					\
>>>>>> +									\
>>>>>> +	_bn_buf = alloc_max_bench_buffer(test, bench_lens,		\
>>>>>> +			ARRAY_SIZE(bench_lens), &_bn_size);		\
>>>>>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, _bn_buf);			\
>>>>>> +									\
>>>>>> +	fill_random_string(_bn_buf, _bn_size);				\
>>>>>> +									\
>>>>>> +	for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {	\
>>>>>> +		buf_size = bench_lens[_bn_i];				\
>>>>>> +		buf_name = _bn_buf + _bn_size - buf_size - 1;		\
>>>>>> +		_bn_iters = STRING_BENCH_WORKLOAD / max(buf_size, 1U);	\
>>>>>> +									\
>>>>>> +		_bn_t = STRING_BENCH(_bn_iters, func, ##__VA_ARGS__);	\
>>>>>
>>>>>> +									\
>>>>>
>>>>> Remove unneeded blank line.
>>>>
>>>> Will fix.
>>>>
>>>>>> +		if (_bn_t > 0) {					\
>>>>>> +			_bn_mbps = (u64)(buf_size) * _bn_iters		\
>>>>>
>>>>> Why buf_size in the parentheses here and not anywhere else (above)?
>>>>
>>>> It was a bit inconsistent. I'll remove the unneeded parentheses for buf_size.
>>>>
>>>>> I assume it's just an external temporary variable? But why do we need to have
>>>>> it in the parameters to the macro?
>>>>
>>>> This is necessary because buf_size often needs to be passed as an argument
>>>> to the function under test. For instance, when benchmarking strnlen, the
>>>> caller must pass the current length as an argument:
>>>> STRING_BENCH_BUF(test, buf, len, strnlen, buf, len);
>>>
>>> Okay, and why is it needed in this macro? It get overridden immediately in
>>> the loop. Assuming that the array size of bench lengths is not zero, this
>>> has no visible use. Can you elaborate?
>>
>> Thank you for the explanation. I see the source of the confusion now.
>>
>> In v5, buf_name and buf_size were not intended to pass external variables into
>> the macro. Instead, they were naming placeholders for local variables declared
>> inside the macro's scope. This allows the caller to define the names used in
>> the variadic arguments.
>>
>> To resolve the logical inconsistency you pointed out, I'd like to propose two
>> options for v6. Which one would you prefer?
>>
>> Option 1: Internal Declaration (The "Self-Contained" approach)
>>
>> We declare and initialize the variables directly inside the loop. This keeps
>> the macro self-contained and the caller doesn't need to pre-declare anything.
>>
>> for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {
>>     size_t buf_size = bench_lens[_bn_i];
>>     char *buf_name = _bn_buf + _bn_size - buf_size - 1;
>>     ...
>> }
>>
>> Usage:
>>   STRING_BENCH_BUF(test, my_buf, my_len, strnlen, my_buf, my_len);
> 
> This option is better as long as the user doesn't need to know the (stale) data
> out of these parameters. And I think this is the case, so #1 is the winner.

Thanks for the feedback. I'll incorporate this change, along with the other
improvements we discussed, and send out v6 shortly.

>> Option 2: External Declaration (The list.h approach)
>>
>> The macro expects the caller to provide pre-declared variables, similar to
>> list_for_each_entry(). This removes all re-declarations inside the macro.
>>
>> for (_bn_i = 0; _bn_i < ARRAY_SIZE(bench_lens); _bn_i++) {
>>     buf_size = bench_lens[_bn_i];
>>     buf_name = _bn_buf + _bn_size - buf_size - 1;
>>     ...
>> }
>>
>> Usage:
>>   size_t my_len;
>>   char *my_buf;
>>   STRING_BENCH_BUF(test, my_buf, my_len, strnlen, my_buf, my_len);
>>
>> Please let me know which style fits the kernel's preference better, and
>> I will implement it in v6 along with your other suggestions.
>>
>> Thanks for the catch!
>>
>>>>>> +					* (NSEC_PER_SEC / MEGA);	\
>>>>>> Leave '*' on the previous line.
>>>>
>>>> Will fix.
>>>>
>>>>>> +			_bn_mbps = div64_u64(_bn_mbps, _bn_t);		\
>>>>>> +			_bn_lat = div64_u64(_bn_t, _bn_iters);		\
>>>>>> +		}							\
>>>>>> +		kunit_info(test, "len=%zu: %llu MB/s (%llu ns/call)\n",	\
>>>>>> +				buf_size, _bn_mbps, _bn_lat);		\
>>>>>> +	}								\
>>>>>> +} while (0)
> 

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
