Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A18C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPKztGjsWEwAcJ2H1F0Ro1lMHOOEyR4n+B8UNuoQHDA=; b=gQ7q/caDniJjhM
	9TnqRBaP//qZz6BcZueWD77JKIPodgt8u8WVewL/gk6nlQ/W3Xq9H4zJ2eB7Qku3lzS5U+0mV9q2l
	G1Yrxzjfa44cpN5GJA4ndzTXgCkXkt6MEZPBaeiQU3Z/OtEnHWlXjujFQLKXxK2IvFYFRop35kTCm
	q6Lz2eod3dtf00P35a4B53mz19WUFpdwPrA4TEU7QxM7hiVKFfE1bU4wj5q1hD+3iir4TzGf+uza4
	6ckz+HHNyThYePDu9uVPgW967J1nKMifeyH1JonnvTf7Hm5rWCa7/FX0lldE+iOElMI4piQaZGfWE
	t/3N/MjSIjTukJazxHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnR5-00GUFI-24;
	Thu, 16 Mar 2023 13:14:27 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnR1-00GUBD-0S;
	Thu, 16 Mar 2023 13:14:25 +0000
Received: from [172.23.196.229] (unknown [121.32.254.147])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 013F858083A;
	Thu, 16 Mar 2023 21:13:59 +0800 (CST)
Message-ID: <454b587e-6794-875d-b998-078af80fb195@sangfor.com.cn>
Date: Thu, 16 Mar 2023 21:13:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/2] function_graph: Support recording and printing the
 return value of function
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux@armlinux.org.uk,
 mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
 xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
 dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230315133911.958741-1-pengdonglin@sangfor.com.cn>
 <20230315133911.958741-2-pengdonglin@sangfor.com.cn>
 <20230315134911.GD2006103@hirez.programming.kicks-ass.net>
 <20230315101348.1234c7f5@gandalf.local.home>
 <20230315145757.GE2006103@hirez.programming.kicks-ass.net>
 <664f9fa1-da31-2be9-76d9-3eb08e08b7f9@sangfor.com.cn>
 <20230316213925.f958c648e25f723db86aa705@kernel.org>
Content-Language: en-US
From: Donglin Peng <pengdonglin@sangfor.com.cn>
In-Reply-To: <20230316213925.f958c648e25f723db86aa705@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSR9PVk5CSkxJQkNLTEkYSlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpJSlVISVVJTk9VSk9MWVdZFhoPEhUdFFlBWU9LSFVKSktPSEhVSktLVUtZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NEk6DSo6Ez0PKRhKNw0jIj4R
	IgEaCyJVSlVKTUxDQkxJT09KSE9IVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSklKVUhJVUlOT1VKT0xZV1kIAVlBTkhPTjcG
X-HM-Tid: 0a86ea8e515b2eb7kusn013f858083a
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_061423_414909_1540800C 
X-CRM114-Status: GOOD (  16.80  )
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

On 2023/3/16 20:39, Masami Hiramatsu (Google) wrote:
> On Thu, 16 Mar 2023 11:18:23 +0800
> Donglin Peng <pengdonglin@sangfor.com.cn> wrote:
> 
>> On 2023/3/15 22:57, Peter Zijlstra wrote:
>>> On Wed, Mar 15, 2023 at 10:13:48AM -0400, Steven Rostedt wrote:
>>>> On Wed, 15 Mar 2023 14:49:11 +0100
>>>> Peter Zijlstra <peterz@infradead.org> wrote:
>>>>
>>>>>> diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
>>>>>> index 1265ad519249..35ac9c58dc77 100644
>>>>>> --- a/arch/x86/kernel/ftrace_64.S
>>>>>> +++ b/arch/x86/kernel/ftrace_64.S
>>>>>> @@ -348,6 +348,10 @@ SYM_CODE_START(return_to_handler)
>>>>>>    	movq %rax, (%rsp)
>>>>>>    	movq %rdx, 8(%rsp)
>>>>>>    	movq %rbp, %rdi
>>>>>> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
>>>>>> +	/* Pass the function return value to ftrace_return_to_handler */
>>>>>> +	movq %rax, %rsi
>>>>>> +#endif
>>>>>>    
>>>>>>    	call ftrace_return_to_handler
>>>>>
>>>>> What about the case of double register return values (when the value
>>>>> is returned in the A,D pair) ?
>>>>
>>>> Is there anything that does that in 64 bit kernels?
>>>
>>> Note sure; but I have a patch series that introduces cmpxchg128 and
>>> friends. Most of the actual functions are __always_inline, but still,
>>> the moment a compiler decides to break out a subfunction on a u128
>>> boundary we're in luck.
>> I have reviewed the kretprobe implementation and noticed that $retval
>> only retrieves the value of pt_regs.ax, which is an unsigned long data
>> type. I wrote a demo and tested it on an x86 machine, and found that
>> $retval only shows the least significant 32 bits of retval.Therefore,I
>> think it can be consistent with kretprobe.
> 
> Yeah, because it doesn't support 128bit type (u128/long long).
> It is possible to support it, but I think we can just document this
> as a limitation for fgraph return value. It is just for quickly trace
> most of the return values.
> 
Yeah,I will add this limitation to the documents in v5.

> Thank you,
> 
>>
>> static noinline unsigned long long test_retval_func(void)
>> {
>> 	unsigned long long value = 0x1234567887654321;
>> 	return value;
>> }
>>
>> add a kretprobe event:
>> echo 'r:myretprobe test_retval_func $retval:x64' > kprobe_events
>>
>> the trace log:
>> myretprobe: (retval_open+0x1c/0x2c [test_retval] <- test_retval_func)
>> arg1=0x87654321
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
