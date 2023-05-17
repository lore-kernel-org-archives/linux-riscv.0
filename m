Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8D7C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJn+TZZbWZh/IYhm3uXijptSLqdCLtXJQWYjMYkv2kM=; b=c8bdVQcnjYuFXZ
	379ymiV2YIJ5KllpPoP8XQzlnedmPKnnrIOqErnWSTvOG76K21yJjpuzDvcANc186jtoMJhLEdLpl
	nkuLKhhKFflYAyJOm2+TU42zo/vVU6CQLSa4mHRZeMI9y0iNpyYCSW3Gtmhat8RLUMkOGuRRfEb/M
	E0ujYhoO/fagHgd3udUlAe9hnL2xS6lCUFQ9ETdKn6h4O9KZOVx/QRMkG/VUAnixm7Emn6z8tA1Hi
	7uy/SzXHPE3QVItZIj4b8ngtCGaKDxjJqZO9wpEzHZqKqJZH7uTzSFlwSdC8HHqezgBcBYXCel949
	p1XP6ggwZWnemdvs7u0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFp0-009iNx-0p;
	Wed, 17 May 2023 11:59:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFox-009iMb-0y
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 11:59:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE75D64614;
	Wed, 17 May 2023 11:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8FEC4339B;
	Wed, 17 May 2023 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684324794;
	bh=+KJCyW8UcBpWC8n/rNnAChXGAO9waLTlJQG8Dp7ZVa0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A3wxgK//Fl+HRbw82WER6yeLjIrBy7NjkG7nKzaC9v+P1fj78NXLtyfTUYg6p8RW3
	 bcAK0NdVb6cmJkcuG45bfXlMqsGuVB3TLoZ9orpTFPY1byepkeSx7xQjtgNU8zrKKD
	 wTdJxIXAMwBx6Iy/a0uF9S1BYxfeG0GyYWMfIWmHRxsQhRcHkH1v9LzjA+kNLKpqv7
	 e8r084YNf5nre8CudRHdqPB1LnJmYIUgarQqld+w/Od+y+7vBvaKV14OCnreYJC/FG
	 6y/C9GMB3OgNGppJUtg0r4xA4tjwSUsps1xz2PWr2TMPKYhtqmtc7D/8CKGwlHTkOb
	 B2qnlglxsW41Q==
Date: Wed, 17 May 2023 20:59:47 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ze Gao <zegao2021@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexei Starovoitov
 <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo
 Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 x86@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Jiri
 Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, Ze Gao
 <zegao@tencent.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/4] rethook: use preempt_{disable, enable}_notrace
 in rethook_trampoline_handler
Message-Id: <20230517205947.c1710ed175519b59f56e09b1@kernel.org>
In-Reply-To: <20230517034510.15639-2-zegao@tencent.com>
References: <20230517034510.15639-1-zegao@tencent.com>
	<20230517034510.15639-2-zegao@tencent.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_045955_421504_E84BDAEF 
X-CRM114-Status: GOOD (  19.63  )
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

Hi Ze Gao,

On Wed, 17 May 2023 11:45:06 +0800
Ze Gao <zegao2021@gmail.com> wrote:

> This patch replaces preempt_{disable, enable} with its corresponding
> notrace version in rethook_trampoline_handler so no worries about stack
> recursion or overflow introduced by preempt_count_{add, sub} under
> fprobe + rethook context.
> 
> Fixes: 54ecbe6f1ed5 ("rethook: Add a generic return hook")
> Signed-off-by: Ze Gao <zegao@tencent.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/linux-trace-kernel/20230516071830.8190-2-zegao@tencent.com

Note that you don't need to add Link tag of the previous version for each patch.
I'll add it when I pick it :)

Thank you,

> ---
>  kernel/trace/rethook.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
> index 32c3dfdb4d6a..60f6cb2b486b 100644
> --- a/kernel/trace/rethook.c
> +++ b/kernel/trace/rethook.c
> @@ -288,7 +288,7 @@ unsigned long rethook_trampoline_handler(struct pt_regs *regs,
>  	 * These loops must be protected from rethook_free_rcu() because those
>  	 * are accessing 'rhn->rethook'.
>  	 */
> -	preempt_disable();
> +	preempt_disable_notrace();
>  
>  	/*
>  	 * Run the handler on the shadow stack. Do not unlink the list here because
> @@ -321,7 +321,7 @@ unsigned long rethook_trampoline_handler(struct pt_regs *regs,
>  		first = first->next;
>  		rethook_recycle(rhn);
>  	}
> -	preempt_enable();
> +	preempt_enable_notrace();
>  
>  	return correct_ret_addr;
>  }
> -- 
> 2.40.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
