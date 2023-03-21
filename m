Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81C0C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQhdpaJFmc2lXLxpy6mJJipwBh8rLy+tEQKlIuFqwJE=; b=IisXpUlulKU7pc
	PWmh0DwOfpqpSexQ8pNltLqrcRKuSb6N0ysy3TDXNpxapGJ+I6pQfnv19kWb+Tg8R1SEPzAwm/yHi
	JxW4VY3Z5Bt3+b+lcGbA2FtVQPQ8DT0DqFckU4Tl0iKHI/TwKhy0E8XCjQf00AUQYALwdxqOannv7
	LVVwIxQMc7NuCVaQpZfFkY7kPo4j70FNnAT32RZ87EinpttWB/1I1TUUDwoOJ/pm3xOSeOWVH8s4i
	oCHv2gidc0W3NjKo4CZWnyCVU7iiXAUQmPJvydkCIbXhoBCIPt9hmIJh44cu77jpTD1u5mvbL3GSD
	+IOiXR6ab6Ar0cby9rYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peddx-00Crow-2A;
	Tue, 21 Mar 2023 15:11:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pedds-00Crme-2U;
	Tue, 21 Mar 2023 15:11:18 +0000
Message-ID: <ac95f1f7-2af3-1461-2ea2-3608d081de3f@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1679411470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlQ00hG8MhlBw3zA8EtNC/Bw+Cu0Ips6JNpdNr1g4M=;
	b=fVwfxng4IJTFZtsvF5yprFb/Wp0n9ZX+YVtvS6VP0JX/6/0Vbv7GVCeL51O7ZtxD8le2kK
	2Tvy1i/v6SNwo7OlIr0f9p2sENh4xSSCglMUubh8/o7+wEklup/srCZ9X/hjuYNd+x2d/c
	yWu2jxtyanfdUXDQPrhKakVWTRFix7dB57Ef73t7sPPC0hr3LBD0RXeKaYKomrVDK8Fpby
	gUZGXQw/uZ4mKgmMJVPVVBvq7y6C2x+BOyTFcD3P10v4iTCGLI2SiU4FFHBT9nOskH3hGT
	CheittC97+dYnkCxcBps8ffDush3p7q+UTCPTHNXeSUoo1/6QcVuctV0HbBo3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1679411470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlQ00hG8MhlBw3zA8EtNC/Bw+Cu0Ips6JNpdNr1g4M=;
	b=2x5XtpYX4NC5EfkxM7kkgkx3ui432bSQnPyGkedfMh7q0Y4F4gh0SO76UXyaMeULraCzYY
	KDfMxDpKcyF2Y+BA==
Date: Tue, 21 Mar 2023 16:11:07 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
 linux@armlinux.org.uk, mark.rutland@arm.com, will@kernel.org,
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
From: Florian Kauer <florian.kauer@linutronix.de>
Subject: Re: [PATCH v5 1/2] function_graph: Support recording and printing the
 return value of function
In-Reply-To: <20230321104413.43a81ffb@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_081116_954882_1E5C346E 
X-CRM114-Status: GOOD (  20.13  )
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

On 21.03.23 15:44, Steven Rostedt wrote:
> On Tue, 21 Mar 2023 15:09:40 +0100
> Florian Kauer <florian.kauer@linutronix.de> wrote:
> 
>> On 20.03.23 14:16, Donglin Peng wrote:
>>> When using the function_graph tracer to analyze system call failures,
>>> it can be time-consuming to analyze the trace logs and locate the kernel
>>> function that first returns an error. This change aims to simplify the
>>> process by recording the function return value to the 'retval' member of
>>> 'ftrace_graph_ent' and printing it when outputing the trace log.  
>>
>> I just came across your patch by pure luck and it helped me a lot
>> to trace down a problem I had, thanks!
>>
>> So you can have my
>> Tested-by: Florian Kauer <florian.kauer@linutronix.de>
>>  
>>> New trace options are introduced: funcgraph-retval and graph_retval_hex.  
>>
>> I would personally prefer to have the second option scoped better, so for example
>> "funcgraph-retval-hex".
> 
> That could be an ftrace option.

What do you mean? In the current implementation both funcgraph-retval and graph_retval_hex
are options for the function_graph tracer, but one is prefixed with "funcgraph-" as nearly
all other options for the function_graph tracer and one is not (and is even snake_case, while
the others are kebab-case). So it just looks inconsistent for me, but there might be a reason?

By the way: The documentation patch also references "function-retval" instead of
"funcgraph-retval" in the documentation of the graph_retval_hex option.

> Anyway, could you tell us your use case, and that could go into the change
> log of this patch as "one use case that this helped with".

Nothing spectacular. I just wanted to find out why ICMP port unreachable messages
sporadically lead to -111 (Connection Refused) for __sys_sendto() when IP_RECVERR is set
and the call never fails if IP_RECVERR is not set. (I am still unsure if this is
REALLY intended behavior, but at least it makes sense why this occurs when reading
the sources).

And with this patch, the -111 is directly popping up in the trace, but I do not think
that my missing knowledge about details of the kernel network stack
really qualifies as a good argument ;-)

Greetings,
Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
