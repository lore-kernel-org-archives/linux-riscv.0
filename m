Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB7EC6FD1D
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okwNh3h6+2b57EVuxz7V3+aKweQIVR9yDjQ2QLGpZF0=; b=sbQUUnXOad2kSI
	4ERW1ej7LYz/1b5XJo1zMKLocP+1eYu/WhKJNcdGdEuyQiN7pWs3CQUdQYAo67E2h61hnSBIf57fZ
	C1O8zojQip3gQMiQcMlH4+XID/fdpZaZ43vOa1nIHm3J/uKHq5zSCKIlu0pv20SzjiYej3lK3alyx
	xIYR90jtdIZ+ZpMr7OnEaCwYv6lR9sgvlBNFDxkGiky887Xss9d9m8ZRyITyhPYglt+YMakXg7C4K
	5cirgMB7BLQxgYLwuUQlSQutWiwD1clHP+1rFYDhvgz+TkSVR+jeCvWMz0ci1sE9R22YY1QYyFEuR
	83lcxbWx5hk5ckfOxZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pijKf-00BMqE-28;
	Sat, 01 Apr 2023 22:04:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pijKa-00BMop-0o;
	Sat, 01 Apr 2023 22:04:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68FCE60A47;
	Sat,  1 Apr 2023 22:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90AB5C433EF;
	Sat,  1 Apr 2023 22:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680386653;
	bh=CLqLBHeDg33hin5CXQIorMaJsFgSptjcHpMkJE5afS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uWR7Dec1ppg9NOxS2uvSf3ASZ3Az+Zc8atwKZAtBua7kumMcc+zPBU642v1S3lt/s
	 5yzwq9ZMPJSjw1PvgdLLEEDqvXwR94gaGBn7IMGZVU6DEkiIL432czlu/pEUzg6UEN
	 mFyIuEJCqmRulgoTPayIg3P5nR1CwXopgBaKGvku8peL6K3aisounVrfxeAvP1fhDG
	 ct9BTYPMW5s4P3ov78EmtLgQgkYqa2Mut3QPjRoXhZsrmDATx+FhP/oYbu9CMabPzp
	 Tnslc5ZJ3p18LyW3KfEELqS8AScZfiQPzJ635WolKcn0AAT/0tmyHsejrUdVk5ZbZJ
	 XCGcQ/w4bEzdA==
Date: Sun, 2 Apr 2023 07:04:06 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
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
Subject: Re: [PATCH v10 8/8] selftests/ftrace: Add funcgraph-retval test
 case
Message-Id: <20230402070406.177f09cc34f9860baf3e6ec2@kernel.org>
In-Reply-To: <ba23c2429f1ef798946ce65e21c7a7a2bff0019e.1680265828.git.pengdonglin@sangfor.com.cn>
References: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
	<ba23c2429f1ef798946ce65e21c7a7a2bff0019e.1680265828.git.pengdonglin@sangfor.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_150416_397248_44394381 
X-CRM114-Status: GOOD (  20.16  )
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

On Fri, 31 Mar 2023 05:47:44 -0700
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> Add a test case for the funcgraph-retval and funcgraph-retval-hex
> trace options.
> 
> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
> ---
> v10:
>  - Fix issues in selftest
> 
> v8:
>  - Fix issues in selftest
> ---
>  .../ftrace/test.d/ftrace/fgraph-retval.tc     | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
> new file mode 100644
> index 000000000000..5819aa2dd6ad
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
> @@ -0,0 +1,43 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# description: ftrace - function graph print function return value
> +# requires: options/funcgraph-retval options/funcgraph-retval-hex function_graph:tracer
> +
> +# Make sure that funcgraph-retval works
> +
> +fail() { # msg
> +    echo $1
> +    exit_fail
> +}
> +
> +disable_tracing
> +clear_trace
> +
> +read PID _ < /proc/self/stat

You can use "$$" for self pid.

> +[ -f set_ftrace_pid ] && echo ${PID} > set_ftrace_pid
> +[ -f set_ftrace_filter ] && echo proc_reg_write > set_ftrace_filter
> +[ -f set_graph_function ] && echo proc_reg_write > set_graph_function

You should set the required files for this test, so that the test result
is always same. BTW, you need to set either 'set_ftrace_filter' or
'set_graph_function'.

> +echo function_graph > current_tracer
> +echo funcgraph-retval > trace_options
> +
> +set +e
> +enable_tracing
> +echo > /proc/interrupts
> +disable_tracing
> +set -e
> +
> +: "Test printing the error code in signed decimal format"
> +echo nofuncgraph-retval-hex > trace_options

echo 0 > options/funcgraph-retval-hex

If you require 'options/funcgraph-retval-hex' file, you can use the
file to set it or clear it.

> +count=`cat trace | grep 'proc_reg_write' | grep '= -5' | wc -l`
> +if [ $count -eq 0 ]; then
> +    fail "Return value can not be printed in signed decimal format"
> +fi
> +
> +: "Test printing the error code in hexadecimal format"
> +echo funcgraph-retval-hex > trace_options

Ditto.

Thanks,

> +count=`cat trace | grep 'proc_reg_write' | grep 'fffffffb' | wc -l`
> +if [ $count -eq 0 ]; then
> +    fail "Return value can not be printed in hexadecimal format"
> +fi
> +
> +exit 0
> -- 
> 2.25.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
