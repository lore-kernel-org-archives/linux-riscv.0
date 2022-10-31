Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243F0ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxoZ0gAnidbDrbUVTH5vRJZ9ZitW9Zb1qxGr5vGYXsE=; b=MI8DKwBiaS32Cv
	xvNly8GGhNdoB0l5rDvZ8I6GIKzjhD4fqRAdZ0Yd2lngs4qr0DzLVJYbo2nuvPy06++NsZq1JsFNv
	LLGo8Tp5EUB3uz0oPzCeapjRMmgl+fAT++s0fCLDKplTA0XebfXiP/LBL/ikB2X8hMd7NZmLDXZgi
	rx4L3Mxl2HFshrCRU1zrdrHBcY1xq4cM5d8+ZcVbWXgSY8sEBofjwLJF9ak2nLOUtlHpaP7TvlSMv
	Y2EGdc4jxchMbQdANvxM6Z1jE3dfnzD6TyFGmNa5H3eflTTQpJnW7p00/8fTkFauaM24vuVQQ8L5m
	XW+epcxI62EDX+qNRAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaCd-00E8Ra-Lw; Mon, 31 Oct 2022 19:12:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opaCb-00E8Pp-5X
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 19:12:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BEBFFB819B0;
	Mon, 31 Oct 2022 19:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1926C433D6;
	Mon, 31 Oct 2022 19:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667243521;
	bh=yOLlW4b3WOWWf4x3j0sTzOFLrIjxCJoh5lRv8XuHQX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6+KBsQAKIWoX9OhQwvZEA8O7d6lcTQ0zQivckZkAi8YXxmX2M7GlEwhaTDEE2I8j
	 mWOEP5MV4yvJTHJFV048SCifQSLH2CWdqXWe0kZc3d64BaDL6lCURlM7LeIbtRzW1l
	 ztNodA+LNLKLQgJHoejf04w+uKENE1lwuraAFzTsA6fAd/jwBly88jQLnLWLDBmS5n
	 IXme8eckTS5ZsZ3XKteuztI5FMlqMGWlguzKemc2gPadwn1Xg88jiNUgLqzDxUs2AE
	 b20JNxI1MTcxxCsIK6sLwfHEgbANCV3j8kcy4Q4OiLXDk7tThS36o4V35PqABCN6y1
	 6J5O31R7jAz5Q==
Date: Mon, 31 Oct 2022 19:11:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] RISC-V: Do not issue remote fences until smp is available
Message-ID: <Y2Ad/FaLE5qM01gR@spud>
References: <20221028231929.347918-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028231929.347918-1-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_121205_388799_D3E24434 
X-CRM114-Status: GOOD (  18.34  )
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

On Fri, Oct 28, 2022 at 04:19:29PM -0700, Atish Patra wrote:
> It is useless to issue remote fences if there is a single core
> available. It becomes a bottleneck for sbi based rfences where
> we will be making those ECALLs for no reason. Early code patching
> because of static calls end up in this path.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Hey Atish,
This doesn't apply for me to either fixes or for-next. What branch does
it apply to?
Thanks,
Conor.

> ---
>  arch/riscv/mm/cacheflush.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f10cb47eac3a..7fafc8c26505 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -19,6 +19,10 @@ void flush_icache_all(void)
>  {
>  	local_flush_icache_all();
>  
> +	/* No need to issue remote fence if only 1 cpu is online */
> +	if (num_online_cpus() == 1)
> +		return;
> +
>  	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
>  		sbi_remote_fence_i(NULL);
>  	else
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
