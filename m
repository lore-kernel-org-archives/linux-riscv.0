Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBB2C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 05:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0J5G1zjREjMT25+krHs+uW8lPxTqBnC9XuUW894pibg=; b=OiWyND951nf+FS
	aiCYgg6fIbjkX5PX5+JSwCsHG6CJ6tSMEbdltL505bY0fbDsziurETbcXe6xJm9CrZaRKkJtUAuRw
	XqDDgSvUt+ZSGIxheeMXuwERslgpu5cMcgIDQTFOmdCw41JRZNod4FlZxMGBnRXe61/58NAzC+EbA
	sqJv0BmHgEolL9+u5gLC4BIUKS8xbchW+GYvylXL/JmFkmb4FuETHv6Bpl7nYIPj9wA0/hoBC+8u7
	PJjxRFSuhzmaOft3cnNLuRfP7WPsYUquIGkY5hNHTui/DDdhjHW8y3RqNbih3JtZmi01HRhNYZen0
	rNJxVBtul8/w+K3UJSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peqbI-00Ecw9-0t;
	Wed, 22 Mar 2023 05:01:28 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peqbC-00Ecuc-1x;
	Wed, 22 Mar 2023 05:01:24 +0000
Received: from [10.128.10.193] (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 9A1045802E1;
	Wed, 22 Mar 2023 13:01:09 +0800 (CST)
Message-ID: <463601ac-da5f-1616-e531-2bbc3a22fc43@sangfor.com.cn>
Date: Wed, 22 Mar 2023 13:01:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 1/2] function_graph: Support recording and printing the
 return value of function
Content-Language: en-US
To: Florian Kauer <florian.kauer@linutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>, mhiramat@kernel.org
Cc: linux@armlinux.org.uk, mark.rutland@arm.com, will@kernel.org,
 catalin.marinas@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org,
 mingo@redhat.com, xiehuan09@gmail.com, dinghui@sangfor.com.cn,
 huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
 <20230320131650.482594-2-pengdonglin@sangfor.com.cn>
 <2eeef5a3-cbe7-7a01-489a-87c5ac00adf7@linutronix.de>
 <20230321104413.43a81ffb@gandalf.local.home>
 <ac95f1f7-2af3-1461-2ea2-3608d081de3f@linutronix.de>
From: Donglin Peng <pengdonglin@sangfor.com.cn>
In-Reply-To: <ac95f1f7-2af3-1461-2ea2-3608d081de3f@linutronix.de>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxhOVk4fQ0xKSk9DTR4fQ1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS09ISFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogw6CCo4Ez0ONRUMIQgdIRZW
	ExMKFAhVSlVKTUxCT01KSUxLQ05IVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFOSkhCNwY+
X-HM-Tid: 0a8707b143a22eb7kusn9a1045802e1
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_220122_879324_3537EFFD 
X-CRM114-Status: GOOD (  23.57  )
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

On 2023/3/21 23:11, Florian Kauer wrote:
> On 21.03.23 15:44, Steven Rostedt wrote:
>> On Tue, 21 Mar 2023 15:09:40 +0100
>> Florian Kauer <florian.kauer@linutronix.de> wrote:
>>
>>> On 20.03.23 14:16, Donglin Peng wrote:
>>>> When using the function_graph tracer to analyze system call failures,
>>>> it can be time-consuming to analyze the trace logs and locate the kernel
>>>> function that first returns an error. This change aims to simplify the
>>>> process by recording the function return value to the 'retval' member of
>>>> 'ftrace_graph_ent' and printing it when outputing the trace log.
>>>
>>> I just came across your patch by pure luck and it helped me a lot
>>> to trace down a problem I had, thanks!
>>>
>>> So you can have my
>>> Tested-by: Florian Kauer <florian.kauer@linutronix.de>
>>>   
>>>> New trace options are introduced: funcgraph-retval and graph_retval_hex.
>>>
>>> I would personally prefer to have the second option scoped better, so for example
>>> "funcgraph-retval-hex".
>>
>> That could be an ftrace option.
> 
> What do you mean? In the current implementation both funcgraph-retval and graph_retval_hex
> are options for the function_graph tracer, but one is prefixed with "funcgraph-" as nearly
> all other options for the function_graph tracer and one is not (and is even snake_case, while
> the others are kebab-case). So it just looks inconsistent for me, but there might be a reason?

Agree, I also think "funcgraph-retval-hex" may look better.

Hi Hiramatsu, what do you think?

> 
> By the way: The documentation patch also references "function-retval" instead of
> "funcgraph-retval" in the documentation of the graph_retval_hex option.

Thanks, it has been removed in v6.

> 
>> Anyway, could you tell us your use case, and that could go into the change
>> log of this patch as "one use case that this helped with".
> 
> Nothing spectacular. I just wanted to find out why ICMP port unreachable messages
> sporadically lead to -111 (Connection Refused) for __sys_sendto() when IP_RECVERR is set
> and the call never fails if IP_RECVERR is not set. (I am still unsure if this is
> REALLY intended behavior, but at least it makes sense why this occurs when reading
> the sources).
> 
> And with this patch, the -111 is directly popping up in the trace, but I do not think
> that my missing knowledge about details of the kernel network stack
> really qualifies as a good argument ;-)
> 
> Greetings,
> Florian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
