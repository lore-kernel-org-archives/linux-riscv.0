Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18402C43217
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 13:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPCyd7JwHAFFM5jYg0C9PwjwgEMDCNH4NG2A5JrHXEc=; b=ITtH0ZagBALcaS
	cZN8RFNzNMoTjWAKxhmkr264bm40obbX18n7DkfQ72+BzmfiRUhxE3ZZtJUjpq7IstPH93V8/6OMj
	KPkrkd20MvZ/smuH96l7cMMKotYWI35JpogvY2okx8jKhZfBwL8Ko1L6OkDYY564keS9myBFP8h7f
	oKXN/CQ9vOaXhEOy9hAMP3UTdecthsb0z04EtYe8l+c6Exr0Ur6sLDsrplWjv5yzqHt3JFPoYblQ/
	WD1gDpLUb1bvHC8iQj0b4Rn7Pl6Xu9miVACT62BVGb0Jdkbn2V5f8ioYbu5GhXDG9BfoGx4Hx3L3f
	FTynQxXL9Mszeim1lWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngoLI-0043NA-OH; Tue, 19 Apr 2022 13:56:32 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngnbi-003j0q-CR; Tue, 19 Apr 2022 13:09:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92A48106F;
 Tue, 19 Apr 2022 06:09:22 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.75.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A73B3F766;
 Tue, 19 Apr 2022 06:09:19 -0700 (PDT)
Date: Tue, 19 Apr 2022 14:09:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: He Zhe <zhe.he@windriver.com>
Cc: catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 bp@alien8.de, dave.hansen@linux.intel.com, keescook@chromium.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 namhyung@kernel.org, benh@kernel.crashing.org, paulus@samba.org,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/8] stacktrace: Change callback prototype to pass
 more information
Message-ID: <Yl60euwfis+u92cA@FVFF77S0Q05N>
References: <20220418132217.1573072-1-zhe.he@windriver.com>
 <20220418132217.1573072-2-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418132217.1573072-2-zhe.he@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_060926_561694_A08C85F6 
X-CRM114-Status: GOOD (  23.59  )
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

On Mon, Apr 18, 2022 at 09:22:10PM +0800, He Zhe wrote:
> Currently stack_trace_consume_fn can only have pc of each frame of the
> stack. Copying-beyond-the-frame-detection also needs fp of current and
> previous frame. Other detection algorithm in the future may need more
> information of the frame.
> 
> We define a frame_info to include them all.
> 
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  include/linux/stacktrace.h |  9 ++++++++-
>  kernel/stacktrace.c        | 10 +++++-----
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/stacktrace.h b/include/linux/stacktrace.h
> index 97455880ac41..5a61bfafe6f0 100644
> --- a/include/linux/stacktrace.h
> +++ b/include/linux/stacktrace.h
> @@ -10,15 +10,22 @@ struct pt_regs;
>  
>  #ifdef CONFIG_ARCH_STACKWALK
>  
> +struct frame_info {
> +	unsigned long pc;
> +	unsigned long fp;
> +	unsigned long prev_fp;
> +};

I don't think this should be exposed through a generic interface; the `fp` and
`prev_fp` values are only meaningful with arch-specific knowledge, and they're
*very* easy to misuse (e.g. when transitioning from one stack to another).
There's also a bunch of other information one may or may not want, depending on
what you're trying to achieve.

I am happy to have an arch-specific internal unwinder where we can access this
information, and *maybe* it makes sense to have a generic API that passes some
opaque token, but I don't think we should make the structure generic.

Thanks,
Mark.

> +
>  /**
>   * stack_trace_consume_fn - Callback for arch_stack_walk()
>   * @cookie:	Caller supplied pointer handed back by arch_stack_walk()
>   * @addr:	The stack entry address to consume
> + * @fi:	The frame information to consume
>   *
>   * Return:	True, if the entry was consumed or skipped
>   *		False, if there is no space left to store
>   */
> -typedef bool (*stack_trace_consume_fn)(void *cookie, unsigned long addr);
> +typedef bool (*stack_trace_consume_fn)(void *cookie, struct frame_info *fi);
>  /**
>   * arch_stack_walk - Architecture specific function to walk the stack
>   * @consume_entry:	Callback which is invoked by the architecture code for
> diff --git a/kernel/stacktrace.c b/kernel/stacktrace.c
> index 9ed5ce989415..2d0a2812e92b 100644
> --- a/kernel/stacktrace.c
> +++ b/kernel/stacktrace.c
> @@ -79,7 +79,7 @@ struct stacktrace_cookie {
>  	unsigned int	len;
>  };
>  
> -static bool stack_trace_consume_entry(void *cookie, unsigned long addr)
> +static bool stack_trace_consume_entry(void *cookie, struct frame_info *fi)
>  {
>  	struct stacktrace_cookie *c = cookie;
>  
> @@ -90,15 +90,15 @@ static bool stack_trace_consume_entry(void *cookie, unsigned long addr)
>  		c->skip--;
>  		return true;
>  	}
> -	c->store[c->len++] = addr;
> +	c->store[c->len++] = fi->pc;
>  	return c->len < c->size;
>  }
>  
> -static bool stack_trace_consume_entry_nosched(void *cookie, unsigned long addr)
> +static bool stack_trace_consume_entry_nosched(void *cookie, struct frame_info *fi)
>  {
> -	if (in_sched_functions(addr))
> +	if (in_sched_functions(fi->pc))
>  		return true;
> -	return stack_trace_consume_entry(cookie, addr);
> +	return stack_trace_consume_entry(cookie, fi);
>  }
>  
>  /**
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
