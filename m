Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D587CC76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 22:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ux4Yf5X8755O9GB2mbtM/GLLy0EaJjjcm/I2CGXjX9A=; b=P7YWFJB8zcTm4+
	9GCipvok9YLVjGXMEfgDPpjRLDav6iNRcFv9xKmXQYbctynIQScmAfKBcy67+KAyojXUBfXs9YigP
	VkwLd1bM4X4UpM8b/uCIxHV/yE3K/YFXalSqwqhl0GrBTnQAFK40gMiaIh6pOXNFknQLZs0YRZkoe
	v5zLu+v23VvTSxv9QccibIkgWfLzqCKo2TguQYib8OCKK6lcaRquhXi88Ux7BhOqGwymEOHrSZmWn
	nteIs6oVLwreGXCXU+ZXlTqGe0BxPrj+/xM/u8YT0blic7CR+dRsf7/rKG3N2cNyYdLV/biC6TJZd
	X0+fX1r/Dw5FqD9//fOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pijXQ-00BNXQ-03;
	Sat, 01 Apr 2023 22:17:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pijXG-00BNVa-2I;
	Sat, 01 Apr 2023 22:17:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC5BC60FF9;
	Sat,  1 Apr 2023 22:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6BCC433EF;
	Sat,  1 Apr 2023 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680387441;
	bh=aoDdZ34PoBNv5QUtFFFcg/3Z3R3lKI8oojzkBnrAy5s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QiFoaS/Rg1H+6UGrilF4GMPsbFrWRrcUHt3WvJmKBjGthkOwGXTzhcYTouJEFiIjk
	 6wYfCPmxXZ73ddq0dEPbZW/lBAuzvCNKoG1XGi/Sm+nfW1nvO82w8tW0ZGjNhNY84g
	 pDoucuW732ESD33YTpF+R8NTFcaBGnW0viIEK6wVXguxIPu0Yxeb3Nj2CaOmd3o+oo
	 7297BBaO9ULjQ/dSyFkO3InXYDbif8rmH6+PZ/Ln8+Q+b9SRpYTYOA+HopesyN0qjH
	 UBuEBu2DLEmWOrAiiVDNerzzEQmqIagENWX8v3NTzWHwhQw6jsicHjS1QqL12s3Sij
	 G9ee0SukSMhRQ==
Date: Sun, 2 Apr 2023 07:17:13 +0900
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
Subject: Re: [PATCH v10 2/8] tracing: Add documentation for funcgraph-retval
 and funcgraph-retval-hex
Message-Id: <20230402071713.4f278b65ba9bb67c72ab2fb5@kernel.org>
In-Reply-To: <a3dcdd61b3ac07eefabc1b11fc18e9fae23d8cbe.1680265828.git.pengdonglin@sangfor.com.cn>
References: <cover.1680265828.git.pengdonglin@sangfor.com.cn>
	<a3dcdd61b3ac07eefabc1b11fc18e9fae23d8cbe.1680265828.git.pengdonglin@sangfor.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_151723_108751_00126563 
X-CRM114-Status: GOOD (  36.81  )
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

On Fri, 31 Mar 2023 05:47:38 -0700
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> Add documentation for the two newly introduced options for the
> function_graph tracer. The funcgraph-retval option is used to
> control whether or not to display the return value, while the
> funcgraph-retval-hex option is used to control the display
> format of the return value.
> 
> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>

Looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you!

> ---
> v9:
>  - Update limitation description
> 
> v7:
>  - Rename trace option 'graph_retval_hex' to 'funcgraph-retval-hex'
>  - Update documentation description
> 
> v6:
>  - Modify the limitations for funcgraph-retval
>  - Optimize the English expression
> 
> v5:
>  - Describe the limitations of funcgraph-retval
> ---
>  Documentation/trace/ftrace.rst | 74 ++++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> index b927fb2b94dc..f572ae419219 100644
> --- a/Documentation/trace/ftrace.rst
> +++ b/Documentation/trace/ftrace.rst
> @@ -1328,6 +1328,19 @@ Options for function_graph tracer:
>  	only a closing curly bracket "}" is displayed for
>  	the return of a function.
>  
> +  funcgraph-retval
> +	When set, the return value of each traced function
> +	will be printed after an equal sign "=". By default
> +	this is off.
> +
> +  funcgraph-retval-hex
> +	When set, the return value will always be printed
> +	in hexadecimal format. If the option is not set and
> +	the return value is an error code, it will be printed
> +	in signed decimal format; otherwise it will also be
> +	printed in hexadecimal format. By default, this option
> +	is off.
> +
>    sleep-time
>  	When running function graph tracer, to include
>  	the time a task schedules out in its function.
> @@ -2673,6 +2686,67 @@ It is default disabled.
>      0)   1.757 us    |        } /* kmem_cache_free() */
>      0)   2.861 us    |      } /* putname() */
>  
> +The return value of each traced function can be displayed after
> +an equal sign "=". When encountering system call failures, it
> +can be verfy helpful to quickly locate the function that first
> +returns an error code.
> +
> +	- hide: echo nofuncgraph-retval > trace_options
> +	- show: echo funcgraph-retval > trace_options
> +
> +  Example with funcgraph-retval::
> +
> +    1)               |    cgroup_migrate() {
> +    1)   0.651 us    |      cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
> +    1)               |      cgroup_migrate_execute() {
> +    1)               |        cpu_cgroup_can_attach() {
> +    1)               |          cgroup_taskset_first() {
> +    1)   0.732 us    |            cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
> +    1)   1.232 us    |          } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
> +    1)   0.380 us    |          sched_rt_can_attach(); /* = 0x0 */
> +    1)   2.335 us    |        } /* cpu_cgroup_can_attach = -22 */
> +    1)   4.369 us    |      } /* cgroup_migrate_execute = -22 */
> +    1)   7.143 us    |    } /* cgroup_migrate = -22 */
> +
> +The above example shows that the function cpu_cgroup_can_attach
> +returned the error code -22 firstly, then we can read the code
> +of this function to get the root cause.
> +
> +When the option funcgraph-retval-hex is not set, the return value can
> +be displayed in a smart way. Specifically, if it is an error code,
> +it will be printed in signed decimal format, otherwise it will
> +printed in hexadecimal format.
> +
> +	- smart: echo nofuncgraph-retval-hex > trace_options
> +	- hexadecimal always: echo funcgraph-retval-hex > trace_options
> +
> +  Example with funcgraph-retval-hex::
> +
> +    1)               |      cgroup_migrate() {
> +    1)   0.651 us    |        cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
> +    1)               |        cgroup_migrate_execute() {
> +    1)               |          cpu_cgroup_can_attach() {
> +    1)               |            cgroup_taskset_first() {
> +    1)   0.732 us    |              cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
> +    1)   1.232 us    |            } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
> +    1)   0.380 us    |            sched_rt_can_attach(); /* = 0x0 */
> +    1)   2.335 us    |          } /* cpu_cgroup_can_attach = 0xffffffea */
> +    1)   4.369 us    |        } /* cgroup_migrate_execute = 0xffffffea */
> +    1)   7.143 us    |      } /* cgroup_migrate = 0xffffffea */
> +
> +At present, there are some limitations when using the funcgraph-retval
> +option, and these limitations will be eliminated in the future:
> +
> +- Even if the function return type is void, a return value will still
> +  be printed, and you can just ignore it.
> +
> +- Even if return values are stored in multiple registers, only the
> +  value contained in the first register will be recorded and printed.
> +  To illustrate, in the x86 architecture, eax and edx are used to store
> +  a 64-bit return value, with the lower 32 bits saved in eax and the
> +  upper 32 bits saved in edx. However, only the value stored in eax
> +  will be recorded and printed.
> +
>  You can put some comments on specific functions by using
>  trace_printk() For example, if you want to put a comment inside
>  the __might_sleep() function, you just have to include
> -- 
> 2.25.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
