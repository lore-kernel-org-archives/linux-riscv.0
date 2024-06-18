Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87377C2BA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuxZFeem4B+ZtTIHTT3+DjJMYRcgC2Zy1+C5ZNfAZSw=; b=zIhC9NoS+GcX2D
	YMQenP5GCMGIKsGQEI4ft8Zg1LqUOmYcl5p9QYyYgyrG+HMkXvw3vte1OIiplZ80kqNvwTJGY9byy
	YEAOXSadl2W1km9A/sUon0bIZUTjoZPLeld3QA9zEMqo0tILYkPGV4z9biRnacIhM+X+VHdRfo9r7
	1oiuIvBC+nef85CyJl/z8j3VToCbL7qLvRDLyHbkUluUppAnkFMAl9tx5TTRS2aJ+CWe/myROZvt8
	s4E8chz8aIdTJtcfswxs++vMNOakngxlun/RNCJ/2ZPtxcL3osGGCBIZGR31mEu6ZLbbPZGRh5d4y
	TES1ZoYpMNlgbmBysYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVZ2-0000000EEXw-1FSP;
	Tue, 18 Jun 2024 09:55:44 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVYy-0000000EEWQ-2HPu
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 09:55:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB7FBE0006;
	Tue, 18 Jun 2024 09:55:32 +0000 (UTC)
Message-ID: <cb71a5e9-aafe-48af-9f16-baae407d467b@ghiti.fr>
Date: Tue, 18 Jun 2024 11:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] riscv: stacktrace: convert arch_stack_walk() to
 noinstr
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20240613-dev-andyc-dyn-ftrace-v4-v1-0-1a538e12c01e@sifive.com>
 <20240613-dev-andyc-dyn-ftrace-v4-v1-1-1a538e12c01e@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240613-dev-andyc-dyn-ftrace-v4-v1-1-1a538e12c01e@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_025540_762070_A1D1EE11 
X-CRM114-Status: GOOD (  16.42  )
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

Hi Andy,

On 13/06/2024 09:11, Andy Chiu wrote:
> arch_stack_walk() is called intensively in function_graph when the
> kernel is compiled with CONFIG_TRACE_IRQFLAGS. As a result, the kernel
> logs a lot of arch_stack_walk and its sub-functions into the ftrace
> buffer. However, these functions should not appear on the trace log
> because they are part of the ftrace itself. This patch references what
> arm64 does for the smae function. So it further prevent the re-enter
> kprobe issue, which is also possible on riscv.
>
> Related-to: commit 0fbcd8abf337 ("arm64: Prohibit instrumentation on arch_stack_walk()")
> Fixes: 680341382da5 ("riscv: add CALLER_ADDRx support")
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>   arch/riscv/kernel/stacktrace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 528ec7cc9a62..0d3f00eb0bae 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -156,7 +156,7 @@ unsigned long __get_wchan(struct task_struct *task)
>   	return pc;
>   }
>   
> -noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
> +noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>   		     struct task_struct *task, struct pt_regs *regs)
>   {
>   	walk_stackframe(task, regs, consume_entry, cookie);
>

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I'll try to make this go into -fixes, this is in my fixes branch at least.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
