Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41409CD5BCF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75fNY08gsnYl5Hc6abDgGaTeK0mbN8+YQNid+nypz5g=; b=CRcX/JE29v0aHO
	PAUPpCJtT75hW21D0XNDs67q6Spue26ALFarSITOGrJg0zJH3Y0Zx3PDMbbpsOp+EIOI8u1VWlr9R
	z9dwtREc+t9fhR1lZuKpmco9bWApa9/s3jIn+7M8zwR0ojIrD3thbziltPAk1MMFr3SVRho/f3ImD
	dEuRIkou8HWq7wqTWDuWNZy0GddzEicuhtHP3f7ww48YPxZEKZGHwOQbEo63vJZOr+x6bvbYW+t7O
	jCwneCUsO5+dGEhK/TflA044g6kNuoM1ak27sNjxV9ekcrKuwNbdJf6SnL3OopVUu+2623C4yTWHk
	FJAWEB8dr+VdjyYRUDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smF9W-000000094lV-0Buy;
	Thu, 05 Sep 2024 16:16:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smECl-00000008uM5-1Yol
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Sep 2024 15:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PUMH1kZYJJP1WZoaZ/pfkJhVznOI6rM1dIwukKEm4Cg=; b=X6wuliAJLHlFwW83yA570slPax
	b4T+e8cEG8B6CWNcsLrzznYIEZ8Fw2F46RyDEbPxLn9e0OCqUFtO9DvwxZ7C7DvxDJVtFQ5+YIi4c
	pzWlpR8VHJysmmh2DyfjPGwvPkRqe1H/02rh0gCqFBYk3XLKTgGTOY3qq07PicfG9fScdVawvz75k
	iPVJcQMwrXqt/L9h2lUw4CZ0Wmn5/hI3uzgRoui5buyzOA9RBEhcEg7DZsXfzS6ImwurarT5wP0kC
	rahYKjIZOsX+c7LOLzH7yjTm9QcNHIttUrg9KfsYlsl288HrtMdnyurt0yyiZLoiVkXbU++QqX+7b
	KWhnW2Kw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1smECh-00000000VnW-0zed
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 15:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D4D85C5D21;
	Thu,  5 Sep 2024 15:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B839C4CEC3;
	Thu,  5 Sep 2024 15:15:18 +0000 (UTC)
Date: Thu, 5 Sep 2024 11:16:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: Re: [PATCH 0/7] add function arguments to ftrace
Message-ID: <20240905111620.5211d9f8@gandalf.local.home>
In-Reply-To: <20240904065908.1009086-1-svens@linux.ibm.com>
References: <20240904065908.1009086-1-svens@linux.ibm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_161523_706559_66BD7B17 
X-CRM114-Status: GOOD (  19.60  )
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

On Wed,  4 Sep 2024 08:58:54 +0200
Sven Schnelle <svens@linux.ibm.com> wrote:

> These patches add support for printing function arguments in ftrace.
> 
> Example usage:
> 
> function tracer:
> 
> cd /sys/kernel/tracing/
> echo icmp_rcv >set_ftrace_filter
> echo function >current_tracer
> echo 1 >options/func-args
> ping -c 10 127.0.0.1
> [..]
> cat trace
> [..]
>             ping-1277    [030] ..s1.    39.120939: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    39.120946: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    40.179724: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    40.179730: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    41.219700: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    41.219706: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    42.259717: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    42.259725: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    43.299735: icmp_rcv(skb = 0xa0ecab00) <-ip_protocol_deliver_rcu
>             ping-1277    [030] ..s1.    43.299742: icmp_rcv(skb = 0xa0ecac00) <-ip_protocol_deliver_rcu
> 
> function graph:
> 
> cd /sys/kernel/tracing
> echo icmp_rcv >set_graph_function
> echo function_graph >current_tracer
> echo 1 >options/funcgraph-args
> 
> ping -c 1 127.0.0.1
> 
> cat trace
> 
>  30)               |  icmp_rcv(skb = 0xa0ecab00) {
>  30)               |    __skb_checksum_complete(skb = 0xa0ecab00) {
>  30)               |      skb_checksum(skb = 0xa0ecab00, offset = 0, len = 64, csum = 0) {
>  30)               |        __skb_checksum(skb = 0xa0ecab00, offset = 0, len = 64, csum = 0, ops = 0x232e0327a88) {
>  30)   0.418 us    |          csum_partial(buff = 0xa0d20924, len = 64, sum = 0)
>  30)   0.985 us    |        }
>  30)   1.463 us    |      }
>  30)   2.039 us    |    }
> [..]
> 

First I want to say THANK YOU!!!!

This has been on my TODO list for far too long. I never got the time to
work on it :-p

Anyway, this is something I definitely want added. But I'm going to guess
that there is going to be issues with it and I doubt it will be ready for
the next merge window. I'm currently focused on some other things and also
have to get ready for next weeks travels (I'll be in Prague for GNU Cauldron,
then Vienna for Plumbers and OSS EU, then to Paris for Kernel Recipes!).

But I most definitely want this in. Hopefully by 6.13. This may be
something I can review on the plane (if I get my slides done).

Again, thanks for doing this!

-- Steve

> 
> Sven Schnelle (7):
>   tracing: add ftrace_regs to function_graph_enter()
>   x86/tracing: pass ftrace_regs to function_graph_enter()
>   s390/tracing: pass ftrace_regs to function_graph_enter()
>   Add print_function_args()
>   tracing: add config option for print arguments in ftrace
>   tracing: add support for function argument to graph tracer
>   tracing: add arguments to function tracer
> 
>  arch/arm/kernel/ftrace.c             |  2 +-
>  arch/arm64/kernel/ftrace.c           |  2 +-
>  arch/csky/kernel/ftrace.c            |  2 +-
>  arch/loongarch/kernel/ftrace.c       |  2 +-
>  arch/loongarch/kernel/ftrace_dyn.c   |  2 +-
>  arch/microblaze/kernel/ftrace.c      |  2 +-
>  arch/mips/kernel/ftrace.c            |  2 +-
>  arch/parisc/kernel/ftrace.c          |  2 +-
>  arch/powerpc/kernel/trace/ftrace.c   |  2 +-
>  arch/riscv/kernel/ftrace.c           |  2 +-
>  arch/s390/kernel/entry.h             |  4 +-
>  arch/s390/kernel/ftrace.c            |  4 +-
>  arch/sh/kernel/ftrace.c              |  2 +-
>  arch/sparc/kernel/ftrace.c           |  2 +-
>  arch/x86/include/asm/ftrace.h        |  2 +-
>  arch/x86/kernel/ftrace.c             |  6 +-
>  include/linux/ftrace.h               |  4 +-
>  kernel/trace/Kconfig                 | 12 ++++
>  kernel/trace/fgraph.c                |  7 ++-
>  kernel/trace/trace.c                 |  8 ++-
>  kernel/trace/trace.h                 |  4 +-
>  kernel/trace/trace_entries.h         |  7 ++-
>  kernel/trace/trace_functions.c       | 46 ++++++++++++++--
>  kernel/trace/trace_functions_graph.c | 74 +++++++++++++------------
>  kernel/trace/trace_irqsoff.c         |  4 +-
>  kernel/trace/trace_output.c          | 82 +++++++++++++++++++++++++++-
>  kernel/trace/trace_output.h          |  9 +++
>  kernel/trace/trace_sched_wakeup.c    |  4 +-
>  28 files changed, 228 insertions(+), 73 deletions(-)
> 
> --
> 2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
