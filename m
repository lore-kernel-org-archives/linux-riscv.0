Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5BFC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 03:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4q/D1PZjHGkmdZo4Yu6ZexzxXgagQsAFSBgbCvkhng=; b=cvLeQdlQTXseEl
	LoO3YcQWXYiSgreyy+LM/9om7Urkw0iEsDBBNAc/OzhonQt74VBtGB4ychWNHkAqjEM7UsVj5sbir
	z5UgqrSq8wfRiDBuv4VEzbpkFe5JZWoE1Zg2B0s9VBrZx0lrBp1STg3scaP29YUiS1W7Q9DUtlWLF
	hYUm2oYg4ecNK906ulTT7hGYCNWqI+IZ+TKMBcy6HnNIAHJfjIctDEcoeGYqmgvg10WUV5iB8t+nF
	aI41y7peZz1KR556ZqFEnZbgbOmO+L1MIpnPclZvUqIgOaiAaifCb7CBI4IeiPZoSvTxA1xLEXKqy
	r3Ztwrkgkpo8YHE2mJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr9ls-0007oE-0V;
	Tue, 25 Apr 2023 03:55:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr9ln-0007mY-0m;
	Tue, 25 Apr 2023 03:55:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B57C62045;
	Tue, 25 Apr 2023 03:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB284C433EF;
	Tue, 25 Apr 2023 03:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682394909;
	bh=uVme7c/++qsefUV47B4cdTguxdMoQe4SjR4FK0ZWBuE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bhJgaQg0jONknwAgfyUZsJd86mofpx1fv6cGEYRensyGZ+mdutXYDxFJcXvnEprz/
	 5YyfplT28AC/idDSHd2E0GuZ1TDCm64l/nt/0luZ9Dwz3T7tbjj7udX/wOc3dPS6dy
	 GbgaTyMSN1YVKyHp9tOYKdro0VPpwjPnsepNwSwabfrDHbYL/2w8kc2HC6r22NMSJl
	 h6XfSvQdYVcka76l7JiVyOgkKzR1kEvBTzmmY6ualZL3nDu/wdIeFU0yq/i9i0+9ts
	 lX57+vBOZXjP3iewDcAmNOs48zGMobA1Em4xGAzl9iIA58CodQbXhxJ/s0Av06E/iw
	 Ok8Q/bY7tRZkQ==
Date: Tue, 25 Apr 2023 12:55:02 +0900
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
Subject: Re: [PATCH v11 8/8] selftests/ftrace: Add funcgraph-retval test
 case
Message-Id: <20230425125502.074e098a6ecf8fc3a9f19dd0@kernel.org>
In-Reply-To: <9fedbd25e63f012cade5dad13be21225fec2fb5d.1680954589.git.pengdonglin@sangfor.com.cn>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
	<9fedbd25e63f012cade5dad13be21225fec2fb5d.1680954589.git.pengdonglin@sangfor.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_205511_376245_3587F6DF 
X-CRM114-Status: GOOD (  20.64  )
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

On Sat,  8 Apr 2023 05:42:22 -0700
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> Add a test case for the funcgraph-retval and funcgraph-retval-hex
> trace options.
> 

This looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you!

> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>
> ---
> v11:
>  - Fix selftest issues
> 
> v10:
>  - Fix issues in selftest
> 
> v8:
>  - Fix issues in selftest
> ---
>  .../ftrace/test.d/ftrace/fgraph-retval.tc     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
> 
> diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
> new file mode 100644
> index 000000000000..e34c0bdef3ed
> --- /dev/null
> +++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-retval.tc
> @@ -0,0 +1,44 @@
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
> +# get self PID, can not use $$, because it is PPID
> +read PID _ < /proc/self/stat
> +
> +[ -f set_ftrace_filter ] && echo proc_reg_write > set_ftrace_filter
> +[ -f set_ftrace_pid ] && echo ${PID} > set_ftrace_pid
> +echo function_graph > current_tracer
> +echo 1 > options/funcgraph-retval
> +
> +set +e
> +enable_tracing
> +echo > /proc/interrupts
> +disable_tracing
> +set -e
> +
> +: "Test printing the error code in signed decimal format"
> +echo 0 > options/funcgraph-retval-hex
> +count=`cat trace | grep 'proc_reg_write' | grep '= -5' | wc -l`
> +if [ $count -eq 0 ]; then
> +    fail "Return value can not be printed in signed decimal format"
> +fi
> +
> +: "Test printing the error code in hexadecimal format"
> +echo 1 > options/funcgraph-retval-hex
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
