Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BEEC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 04:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQxHxJQLfS+Livz5mWfJjdNmDkW1Smyl8cZhh65zt2M=; b=oxmdRjre3Nx3LZ
	XyrIjcZJZjwYLe92u8/CQ/wC+cDyDZ1OzfR48+9cavcBW7sLKjI5bR4g68DrSwCdSmpRW8wkRsEjc
	/oqsKBdRQumwrymtLR2aOj6Q00UrVtgEiXwMnPWw0XtosxCZGIwp1rVwUqQi7pg28YMChxJDbDIES
	ysCu6mfJ7jtfcAIAxD228g1Slx9PN8Zr48u6EAEG23RMvc2JonFLMIgc5lSrRuB7gyqnNvF3KwbZm
	QR98nNYJvRiTU40V5SqsPEwTeCHWDsVHdOAZL/HEo5HtMHsadmcv0ybTo2NLKPhrwNcRK1tF7iov6
	7Z6M1m+/MEEjKYJaOykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdkRd-005xB1-39;
	Sun, 19 Mar 2023 04:14:57 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdkRY-005x9f-1a;
	Sun, 19 Mar 2023 04:14:54 +0000
Received: from [192.168.2.16] (unknown [106.38.161.27])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id AFEDD5801B1;
	Sun, 19 Mar 2023 12:14:26 +0800 (CST)
Message-ID: <2147f6d6-24f8-7008-7b57-7a8509e79e0e@sangfor.com.cn>
Date: Sun, 19 Mar 2023 12:14:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Donglin Peng <pengdonglin@sangfor.com.cn>
Subject: Re: [PATCH v4 1/2] function_graph: Support recording and printing the
 return value of function
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, mhiramat@kernel.org,
 mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
 xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
 dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230315133911.958741-1-pengdonglin@sangfor.com.cn>
 <20230315133911.958741-2-pengdonglin@sangfor.com.cn>
 <ZBOkY8FkqgoBfzQ2@shell.armlinux.org.uk>
 <34781b74-8d3e-a7e6-9abe-e8d45d680eec@sangfor.com.cn>
 <20230318124028.4faf75d1@rorschach.local.home>
In-Reply-To: <20230318124028.4faf75d1@rorschach.local.home>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0sdVh5IGUIdQkxJS0JOT1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpLTVVIQ1VKTUpVSUxZV1kWGg8SFR0UWUFZT0tIVUpKS09ISFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6Ijo4Nj0IDxwqK0gtHBFO
	CzYwFCFVSlVKTUxCSkJCSU1MQ0hOVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSktNVUhDVUpNSlVJTFlXWQgBWUFPSkxLNwY+
X-HM-Tid: 0a86f8136a742eb7kusnafedd5801b1
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_211452_700130_91EF9805 
X-CRM114-Status: GOOD (  14.69  )
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

On 2023/3/19 0:40, Steven Rostedt wrote:
> On Fri, 17 Mar 2023 10:49:49 +0800
> Donglin Peng <pengdonglin@sangfor.com.cn> wrote:
> 
>>> So, really it depends what size of return value we want to report.
>>> Also, please bear in mind that where a function returns a 32-bit
>>> value, that will be in r0, and r1 will be whatever happened to be
>>> in it at function exit - there's no defined value for r1.
>>>    
>>
>> Thank you. I will document this as a limitation of fgraph return value.
>> It can just cover most cases at present and I think the r0 is enough.
> 
> One thing we could possibly do here is to use BTF or objtool to denote
> the return value of each function and use 2 bits of the ftrace
> rec->flags to state that it is:
> 
> 0 - void
> 1 - 1 word size return
> 2 - 2 word size return

Yeah, the BTF contains details of the function return type. However the
direct search cost is a bit high, we may parse it to fill the 
dyn_ftrace.flags.

> 
> I believe we can get access to the function's rec via the return call
> (or add that access) and pass both words to the return function, and
> then the return callback can use this lookup to determine what values
> are useful or not.

Yeah, we can obtain the function address via ret_stack in the function
ftrace_pop_return_trace, then pass the address to lookup_rec to
find the dyn_ftrace.

> 
> In any case, I would suggest passing both regs to the callback, and for
> now just ignore the second reg until we can come up with a way to
> differentiate each function.
> 

Yeah, I will modify it to pass two regs in v5.

> -- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
