Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2F6C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 16:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h22o4bxgkbsPyoWkDP/HG/0Dr7c5NHzkjY3yoY/Vemk=; b=2vFUQjCci6UhG3
	17YEmJ4O9Yu5qfCGX3XRWkUxP3ttKUXReC28yQjOt+KrO7CPQBkz0RATjoNx2JTc0+rChe8REXsX8
	eGl7F7Tz5glgdQqbguVwd4yi+cO2Oovi594tri08XVkIi2+bAwLes7N6GM13KPO1TVjWrULwYam+D
	6XdVXgHOg4yhZxdYCv77wvLVWWGnelV5NlrksVKYC5OJi8h41lXl4MONJJZxk0IMCunYlTxrsNpls
	4HU+f4hatcNCYeIlQpKZceIMwL/vAJmGqNhMJkoDiySKEXEBRD9cTWN4wxUkaUf1bkXtbIIWQplV7
	Wls5ci0FqzGerOFlMi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbTC-0000000Fnh7-1F68;
	Tue, 18 Jun 2024 16:14:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbT9-0000000FnfH-1sT6
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 16:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C7B7CE12E3;
	Tue, 18 Jun 2024 16:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9321FC4AF1D;
	Tue, 18 Jun 2024 16:13:58 +0000 (UTC)
Date: Tue, 18 Jun 2024 12:13:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland
 <samuel.holland@sifive.com>, Matthew Bystrin <dev.mbstr@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 puranjay12@gmail.com
Subject: Re: [PATCH] riscv: stacktrace: fix usage of ftrace_graph_ret_addr()
Message-ID: <20240618121356.08f961eb@rorschach.local.home>
In-Reply-To: <20240618145820.62112-1-puranjay@kernel.org>
References: <20240618145820.62112-1-puranjay@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_091403_781047_CAF718A1 
X-CRM114-Status: GOOD (  21.08  )
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

On Tue, 18 Jun 2024 14:58:20 +0000
Puranjay Mohan <puranjay@kernel.org> wrote:

> ftrace_graph_ret_addr() takes an `idx` integer pointer that is used to
> optimize the stack unwinding. Pass it a valid pointer to utilize the
> optimizations that might be available in the future.
> 
> The commit is making riscv's usage of ftrace_graph_ret_addr() match
> x86_64.
> 
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Not only that, the updated code for ftrace_graph_ret_addr() will just
return the passed in return address if it is NULL. Basically, it will
not work without this.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve


> ---
>  arch/riscv/kernel/stacktrace.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 528ec7cc9a62..6cb7f9ca9d82 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -32,6 +32,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			     bool (*fn)(void *, unsigned long), void *arg)
>  {
>  	unsigned long fp, sp, pc;
> +	int graph_idx = 0;
>  	int level = 0;
>  
>  	if (regs) {
> @@ -68,7 +69,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			pc = regs->ra;
>  		} else {
>  			fp = frame->fp;
> -			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
> +			pc = ftrace_graph_ret_addr(current, &graph_idx, frame->ra,
>  						   &frame->ra);
>  			if (pc == (unsigned long)ret_from_exception) {
>  				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
