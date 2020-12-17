Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F5EC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:27:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40CA923884
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40CA923884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ftje0uOP1quzHiUA0i19/gsX3Uh8wZYq0WdX00/l2cM=; b=oTV1b/IUSZPp8cbJPy/MrDlgS
	UCdEnDZGYepNLNvEhkSJmz6zXtnSnfUc6pb333DEfRlEpaFbHSm6D8N8kP9HOVgmXuhU7TuVt9MQ+
	VXwvtHjZ5/zoiQRkJ6Knxf4V8TQi7PoM20PbIRZPWzoHMLbijuv87dU1gYnxdZiixKPQZt1Yomrz1
	vqqKAKCVeLwXV0OhydDY8ZgEGyZRBLLjWC7TSCr5qF7HtWudcON8pfilxNOg016wMN9EmzE0TOIGv
	OJPq6Z0nyob4T3UgmzJfcToOyL2tGe0Rci5trpfem+pVYEnF4NXS6md51SJAOO21xNGBU7pzttQCe
	dJ1u2KH9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpodD-0003XR-Py; Thu, 17 Dec 2020 08:27:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpodB-0003Wr-AK
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 08:27:26 +0000
Date: Thu, 17 Dec 2020 10:27:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608193642;
 bh=frpXPBgDVHFosWMul7jo1G7mud658hMgY0gDjD8FzmM=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=I+KHhrtBFQ9uN0v4rQDUWJEj9kiScJue0SpkR9fQkMH9UKQGlUABKYKefZtQ+bPjv
 3V5k70FQljpXOTht4ob7nI6+AV3BBE6XgBpe73zONGlsqUNtyww7a9gqPGsgoX9Tw7
 i2sYigy713Xw4EIQfA1Em1mwBHoXD3mAOQ8CfgB9soeWQgHE9mPQbe4wNzAGSm1q3c
 lr06/CQWkYksKnHiOfUZQhUJ87VdxY8WAg6A7w/AzrjdDUJJem8luZ+HP39EjE3u0f
 k32RgbCJz4SdDdXtFEHDmj0+krI96a+9D+wEVlOXoQqWnBEBbFxtnXtIwu41eJezH8
 /HlnIE7BBm1Tg==
From: Mike Rapoport <rppt@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] RISC-V: Fix usage of memblock_enforce_memory_limit
Message-ID: <20201217082714.GA366777@kernel.org>
References: <20201217074855.1948743-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217074855.1948743-1-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_032725_458362_43D4BBB5 
X-CRM114-Status: GOOD (  17.04  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bin Meng <bmeng.cn@gmail.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 11:48:55PM -0800, Atish Patra wrote:
> memblock_enforce_memory_limit accepts the maximum memory size not the last
> address. Fix the function invocation correctly.
> 
> Fixes: 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 8e577f14f120..e4133c20744c 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -174,7 +174,7 @@ void __init setup_bootmem(void)
>  	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
>  	 * as it is unusable by kernel.
>  	 */
> -	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
> +	memblock_enforce_memory_limit(-PAGE_OFFSET);
>  
>  	/* Reserve from the start of the kernel to the end of the kernel */
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
