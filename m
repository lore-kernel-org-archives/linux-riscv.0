Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E13C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IC3gnWAjdcqc6BWLOazUFafZV+pECH0LMFdlYijoyVU=; b=srpZbBBmVkzIyB
	0KimNfpqgof0OYACHrp9+lci2Bmehfl9kKCsniw7v0hOzk++ML3elNUE3z2l88Z0Sw9zi0rCGv9yJ
	8BeuSUxWooNXlbWKLpu70QFe3JFiLKRR8tdTcdsoO2/sS/YttnM9LY0LmWY1wI0QCpB3UQYuTPqmv
	8B8gGjNG8iYYxrDlSoj0HKEJUrJO2BXT36V5sbavsUg5XYzXzEdlhFhemvA4cTNgrgpKd2VnXg8RJ
	3FuQqThGBsgLzFI7KxRQDnJJ4VBNE3MhnbLDTw5irhpEx6blmSX6ckzx1+DM+9qJssgfoQyNF040K
	TrJAifJ0ThjsVqG4HMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peuMA-00FHOw-3A;
	Wed, 22 Mar 2023 09:02:06 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peuM6-00FHNg-0V;
	Wed, 22 Mar 2023 09:02:03 +0000
Received: from [10.128.10.193] (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 9E5CB5807BE;
	Wed, 22 Mar 2023 17:01:55 +0800 (CST)
Message-ID: <88c2c37b-c221-5c27-9663-7026084adf8d@sangfor.com.cn>
Date: Wed, 22 Mar 2023 17:01:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 1/2] function_graph: Support recording and printing the
 return value of function
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, dave.hansen@linux.intel.com,
 x86@kernel.org, mingo@redhat.com, xiehuan09@gmail.com,
 dinghui@sangfor.com.cn, huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
 <20230320131650.482594-2-pengdonglin@sangfor.com.cn>
 <ZBnqAYO7rdk4Qikq@shell.armlinux.org.uk>
From: Donglin Peng <pengdonglin@sangfor.com.cn>
In-Reply-To: <ZBnqAYO7rdk4Qikq@shell.armlinux.org.uk>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTx4eVkwdS0NOT04YGR0eTFUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS09ISFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PC46GSo*Kj0OKRRJLRI3QiE2
	NwNPFA9VSlVKTUxCT0xOTEpMS01MVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFPTU1DNwY+
X-HM-Tid: 0a87088db1662eb7kusn9e5cb5807be
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_020202_344744_DCEB5286 
X-CRM114-Status: GOOD (  14.23  )
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

On 2023/3/22 1:31, Russell King (Oracle) wrote:
> On Mon, Mar 20, 2023 at 06:16:49AM -0700, Donglin Peng wrote:
>> diff --git a/arch/arm/kernel/entry-ftrace.S b/arch/arm/kernel/entry-ftrace.S
>> index 3e7bcaca5e07..ba1986e27af8 100644
>> --- a/arch/arm/kernel/entry-ftrace.S
>> +++ b/arch/arm/kernel/entry-ftrace.S
>> @@ -258,7 +258,15 @@ ENDPROC(ftrace_graph_regs_caller)
>>   #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>>   ENTRY(return_to_handler)
>>   	stmdb	sp!, {r0-r3}
>> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
>> +	/*
>> +	 * Pass both the function return values in the register r0 and r1
>> +	 * to ftrace_return_to_handler
>> +	 */
>> +	add	r2, sp, #16		@ sp at exit of instrumented routine
>> +#else
>>   	add	r0, sp, #16		@ sp at exit of instrumented routine
>> +#endif
>>   	bl	ftrace_return_to_handler
> ...
>> -unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
>> +static unsigned long __ftrace_return_to_handler(unsigned long retval_1st,
>> +			unsigned long retval_2nd, unsigned long frame_pointer)
> ...
>> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
>> +unsigned long ftrace_return_to_handler(unsigned long retval_1st,
>> +			unsigned long retval_2nd, unsigned long frame_pointer)
>> +{
>> +	return __ftrace_return_to_handler(retval_1st, retval_2nd, frame_pointer);
>> +}
>> +#else
>> +unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
>> +{
>> +	return __ftrace_return_to_handler(0, 0, frame_pointer);
>> +}
>> +#endif
>> +
> 
> Hi,
> 
> To echo Mark's criticism, I also don't like this. I feel it would be
> better if ftrace_return_to_handler() always took the same arguments
> irrespective of the setting of CONFIG_FUNCTION_GRAPH_RETVAL.
> 
> On 32-bit ARM, we have to stack r0-r3 anyway to prevent the call to
> ftrace_return_to_handler() corrupting the return value, and these
> are the registers we need. So we might as well pass a pointer to
> these stacked registers. Whether that's acceptable on other
> architectures, I couldn't say.

Agree, I think we can introduce a new structure called pt_ret_regs for
each relevant architecture. The pt_ret_regs should only contain the
return registers and the frame pointer register, for arm, they are r0~r3
and r11.Then we can pass the pointer to the pt_ret_regs to 
ftrace_return_to_handler.

> 
> Thanks.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
