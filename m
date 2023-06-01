Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB884C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sW821C6/uWEfCVVfkA13a0D/OjYo1H93k+SZoEIyiY=; b=JCvAx5lzrBDs5z
	rWbdEb2O/F3+EWR1YxRHQr+/4IP8c2vp99rzSJTVcLeXR2X0p/7NAdJzJlZlPE5yybm0+i2AxIUZk
	AgLGRbcFtq5mB5ssMnJxwkzwugtWBKzpnyYJ5XaR9NUFLdyPyxEJC8q0RYrTTc92KAsNcb7fqsfU/
	2S0vClNNi0npO837a9GPdBp6fWOkqpguogJZyP65OlkkbHaCd0CmN5Hba/bhqF6OFFySvyu8XpBmX
	BWg8Of5C1+8TmbKWaSoIYjksiJRkpzcIUnVxMYEovgkVufP+DO39CqzSHz6zylx3TC+j5/xRCfW4Y
	RgwxxLHOfnWsOr3ZvPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4faA-0032Dl-0q;
	Thu, 01 Jun 2023 10:31:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fa7-0032AZ-17;
	Thu, 01 Jun 2023 10:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eO/OU9rxkp8hXKcShXmqMYIGO9NNy/sl1o++FVK8OV8=; b=j5qEB66OyejLhukROTeex8RZO2
	8KI1zzfHFM0FSLCqza9uhEVgX/c6zEyu5qHGxX7CJjO0P8cMHhiatrGDyBr1rwPhvt1GBzYI3w9hK
	7k0I9xbsAZWFem/1PDEo2VNDt00sI8oyAzzTxJA4uo4MvXyvrVy0amUmV0Fe6tnUgHehB/WpCQHa0
	E82Y4vUZviXiJKDYelnzUm/Nrm/arC8TppikUDhcTNAzuZOH6BUuoSoQ5fKrxoZnJc+dZbGtWiKRX
	XlzWY1ePr9L+jMWFfjfVYehLflBFoPhhFwj8zZHz6jYQh5Ua/7Uf898zVO4+XMxyKyYJVXo3IJNI+
	6+NetZlw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q4fa1-008HDp-EN; Thu, 01 Jun 2023 10:30:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3A54F30031F;
	Thu,  1 Jun 2023 12:30:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0D9D021484ABB; Thu,  1 Jun 2023 12:30:51 +0200 (CEST)
Date: Thu, 1 Jun 2023 12:30:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
Message-ID: <20230601103050.GT4253@hirez.programming.kicks-ass.net>
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-13-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601101257.530867-13-rppt@kernel.org>
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

On Thu, Jun 01, 2023 at 01:12:56PM +0300, Mike Rapoport wrote:

> +static void __init_or_module do_text_poke(void *addr, const void *opcode, size_t len)
> +{
> +	if (system_state < SYSTEM_RUNNING) {
> +		text_poke_early(addr, opcode, len);
> +	} else {
> +		mutex_lock(&text_mutex);
> +		text_poke(addr, opcode, len);
> +		mutex_unlock(&text_mutex);
> +	}
> +}

So I don't much like do_text_poke(); why?

> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index aa99536b824c..d50595f2c1a6 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -118,10 +118,13 @@ ftrace_modify_code_direct(unsigned long ip, const char *old_code,
>  		return ret;
>  
>  	/* replace the text with the new text */
> -	if (ftrace_poke_late)
> +	if (ftrace_poke_late) {
>  		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
> -	else
> -		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
> +	} else {
> +		mutex_lock(&text_mutex);
> +		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
> +		mutex_unlock(&text_mutex);
> +	}
>  	return 0;
>  }

And in the above case it's actively wrong for loosing the _queue()
thing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
