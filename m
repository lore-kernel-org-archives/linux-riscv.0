Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74180C43464
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 08:17:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2395521481
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 08:17:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ByytgVl9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oq1HgnGL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2395521481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SnYGBkM+vJT934RoDGgB40Q0Ler4SI7b4S/mAvM2/kI=; b=ByytgVl9nk/cvLmyX/4nM7fdH
	OsbudKbk8Y4KertzXEGgDcQNihix6kte1wLHg82bb7YEdjH16Vqky198KHy3NxfV24Gx4sB5Dh20i
	kBbL2U6p/6qU9Hzrgomc7S2mKsZEN63Kp5GpEJlxf4HbvPLch01P/StMonW6J0IZFhZf5AfSOJvtT
	ZfCvBhQRghYNQlISAh4w7qnfmx0225jtq4XwI/mRXmq9bHgYocopWTUEj0uAubnC9jPo1eA/6jQ7C
	vkY3q+hC+1naFgeogbNO7MZw7TiYfAkxFPJTk8cjTx//XerfIYmwixiSc6QeDsFa1UB+kaQhj8KkG
	XWCTQCvgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJY3Z-0007zJ-Qy; Sat, 19 Sep 2020 08:17:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJY3W-0007yi-Fy
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 08:17:15 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2BD921481;
 Sat, 19 Sep 2020 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600503433;
 bh=T3vHD+t2wwh+JRDOjD6PywHEwj3QURdLWr2DXDdJ9Eg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oq1HgnGLpd/kJhUyal09FR8c6/MJma3nfq0mW9Sav1TAbwGIap2bn5F+ldxCKBWSH
 TgdlCVi+a7xtDsYOjH18OgegqpQCN7OObO/ttl6jzq6yGIwxT2PBTt2s0N8GH0v5zD
 TsDy9a6iTV3m8lbvthtBa4MM0gMNYi1AnleUGgH4=
Date: Sat, 19 Sep 2020 11:17:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v2] RISC-V: Remove any memblock representing unusable
 memory area
Message-ID: <20200919081706.GP2142832@kernel.org>
References: <20200917234055.2321977-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917234055.2321977-1-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_041714_606034_86DB0ED4 
X-CRM114-Status: GOOD (  22.98  )
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
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 04:40:55PM -0700, Atish Patra wrote:
> RISC-V limits the physical memory size by -PAGE_OFFSET. Any memory beyond
> that size from DRAM start is unusable. Just remove any memblock pointing
> to those memory region without worrying about computing the maximum size.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

With one nit below

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> Changes from v1->v2:
> Used memblock_enforce_memory_limit instead of memblock_remove without
> computing the maximum memory size.
> ---
>  arch/riscv/mm/init.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 787c75f751a5..ed6e83871112 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -146,8 +146,6 @@ static phys_addr_t dtb_early_pa __initdata;
>  void __init setup_bootmem(void)
>  {
>  	struct memblock_region *reg;
> -	phys_addr_t mem_size = 0;
> -	phys_addr_t total_mem = 0;
>  	phys_addr_t mem_start, end = 0;
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>  	phys_addr_t vmlinux_start = __pa_symbol(&_start);
> @@ -155,21 +153,18 @@ void __init setup_bootmem(void)
>  	/* Find the memory region containing the kernel */
>  	for_each_memblock(memory, reg) {
>  		end = reg->base + reg->size;
> -		if (!total_mem)
> +		if (!mem_start)
>  			mem_start = reg->base;
>  		if (reg->base <= vmlinux_start && vmlinux_end <= end)
>  			BUG_ON(reg->size == 0);
> -		total_mem = total_mem + reg->size;
>  	}
>  
>  	/*
> -	 * Remove memblock from the end of usable area to the
> -	 * end of region
> +	 * The maximum physical memory supported is -PAGE_OFFSET.

Maybe

	The maximal supported physical memory size is -PAGE_OFFSET


> +	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
> +	 * as it is unusable by kernel.
>  	 */
> -	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> -	if (mem_start + mem_size < end)
> -		memblock_remove(mem_start + mem_size,
> -				end - mem_start - mem_size);
> +	memblock_enforce_memory_limit(mem_start - PAGE_OFFSET);
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
