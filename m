Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9B3C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ANDIcJsbLEy99AHhyNir14jFENm8vAVcKAh8Vf+9Ro=; b=RCvrrLraODKIiC
	X+QYeMRwRUg2ut0erI7vQBzlTdU0STPVwCOTEeq8vCyyRrY7dXEFDv8wxrbDzrIYoiOJdnhJdBYI6
	YUbPHfFKvMgOLmLdTkQIJLv9kskyrZ602wAb/tSrYmd+w3QW/ULRVsly9/r7FxcZ3eyy7/YRQo3ph
	nSMgjB+25I1mzu7EhiZAmJdnULUXgLKApbvgOOJ4rYiqmS4d+zedmrq3I5F5Inc8tqU/u6QGiVj6D
	EY5431i6rWpPU9VceKXfsAczU3R08Cs+A05Ja1yj8+fwQVDGBwU9NHMyD6ssb5MrT11EocIHjTGcb
	jscjjMI3heGYR2nUVYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjA0t-00DxBW-11;
	Mon, 03 Apr 2023 02:33:43 +0000
Received: from mail-m118111.qiye.163.com ([115.236.118.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjA0o-00Dx9V-38;
	Mon, 03 Apr 2023 02:33:41 +0000
Received: from [10.128.10.193] (unknown [117.133.56.22])
	by mail-m118111.qiye.163.com (Hmail) with ESMTPA id 3C5025805A8;
	Mon,  3 Apr 2023 10:33:10 +0800 (CST)
Message-ID: <f4eabd56-2f91-05fc-b882-9dd8328f87ae@sangfor.com.cn>
Date: Mon, 3 Apr 2023 10:33:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10 8/8] selftests/ftrace: Add funcgraph-retval test case
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, linux@armlinux.org.uk, mark.rutland@arm.com,
 will@kernel.org, catalin.marinas@arm.com, rmk+kernel@armlinux.org.uk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org,
 bp@alien8.de, hpa@zytor.com, chenhuacai@kernel.org, zhangqing@loongson.cn,
 kernel@xen0n.name, mingo@redhat.com, peterz@infradead.org,
 xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
 dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
 <ba23c2429f1ef798946ce65e21c7a7a2bff0019e.1680265828.git.pengdonglin@sangfor.com.cn>
 <20230402070406.177f09cc34f9860baf3e6ec2@kernel.org>
Content-Language: en-US
From: Donglin Peng <pengdonglin@sangfor.com.cn>
In-Reply-To: <20230402070406.177f09cc34f9860baf3e6ec2@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTU9LVh8fS0pNTk5KGEhJGFUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKTFVKSEhVTk1VSUlZV1kWGg8SFR0UWUFZT0tIVUpKS0hKTFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PyI6Mhw*Fz0KEjo4Kig4OkMw
	UUsKFEtVSlVKTUNLT0NCSkJJS0hOVTMWGhIXVQseFRwfFBUcFxIVOwgaFRwdFAlVGBQWVRgVRVlX
	WRILWUFZSkpMVUpISFVOTVVJSVlXWQgBWUFNSktDNwY+
X-HM-Tid: 0a8744f6185f2eb7kusn3c5025805a8
X-HM-MType: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_193339_166659_3299C2B9 
X-CRM114-Status: GOOD (  18.48  )
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

On 2023/4/2 6:04, Masami Hiramatsu (Google) wrote:
> On Fri, 31 Mar 2023 05:47:44 -0700
> Donglin Peng <pengdonglin@sangfor.com.cn> wrote:
> 
>> Add a test case for the funcgraph-retval and funcgraph-retval-hex
>> trace options.
>>
>> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
>> ---
>> v10:
>>   - Fix issues in selftest
>>
>> v8:
>>   - Fix issues in selftest
>> ---
>>   .../ftrace/test.d/ftrace/fgraph-retval.tc     | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>   create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
>>
>> diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
>> new file mode 100644
>> index 000000000000..5819aa2dd6ad
>> --- /dev/null
>> +++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
>> @@ -0,0 +1,43 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0
>> +# description: ftrace - function graph print function return value
>> +# requires: options/funcgraph-retval options/funcgraph-retval-hex function_graph:tracer
>> +
>> +# Make sure that funcgraph-retval works
>> +
>> +fail() { # msg
>> +    echo $1
>> +    exit_fail
>> +}
>> +
>> +disable_tracing
>> +clear_trace
>> +
>> +read PID _ < /proc/self/stat
> 
> You can use "$$" for self pid.

Yeah, I will fix it.

> 
>> +[ -f set_ftrace_pid ] && echo ${PID} > set_ftrace_pid
>> +[ -f set_ftrace_filter ] && echo proc_reg_write > set_ftrace_filter
>> +[ -f set_graph_function ] && echo proc_reg_write > set_graph_function
> 
> You should set the required files for this test, so that the test result
> is always same. BTW, you need to set either 'set_ftrace_filter' or
> 'set_graph_function'.

Yes, but I discovered that set_ftrace_filter and set_graph_function rely 
on the CONFIG_DYNAMIC_FTRACE configuration, which means that these two 
files are not present when CONFIG_DYNAMIC_FTRACE is disabled, even if 
CONFIG_FUNCTION_GRAPH_RETVAL is enabled. Therefore, I think that these 
two trace files are not necessary for this test.

I will modify the above like this:

[ -f set_ftrace_pid ] && echo $$ > set_ftrace_pid
[ -f set_ftrace_filter ] && echo proc_reg_write > set_ftrace_filter

> 
>> +echo function_graph > current_tracer
>> +echo funcgraph-retval > trace_options
>> +
>> +set +e
>> +enable_tracing
>> +echo > /proc/interrupts
>> +disable_tracing
>> +set -e
>> +
>> +: "Test printing the error code in signed decimal format"
>> +echo nofuncgraph-retval-hex > trace_options
> 
> echo 0 > options/funcgraph-retval-hex
> 
> If you require 'options/funcgraph-retval-hex' file, you can use the
> file to set it or clear it.

Yeah.

> 
>> +count=`cat trace | grep 'proc_reg_write' | grep '= -5' | wc -l`
>> +if [ $count -eq 0 ]; then
>> +    fail "Return value can not be printed in signed decimal format"
>> +fi
>> +
>> +: "Test printing the error code in hexadecimal format"
>> +echo funcgraph-retval-hex > trace_options
> 
> Ditto.

Thanks.

> 
> Thanks,
> 
>> +count=`cat trace | grep 'proc_reg_write' | grep 'fffffffb' | wc -l`
>> +if [ $count -eq 0 ]; then
>> +    fail "Return value can not be printed in hexadecimal format"
>> +fi
>> +
>> +exit 0
>> -- 
>> 2.25.1
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
