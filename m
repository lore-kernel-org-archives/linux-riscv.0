Return-Path: <SRS0=wYeJ=CV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE33C433E2
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 10:45:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C992B2083E
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2020 10:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pjkGqcWL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxwNZ3DR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C992B2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/U4D1p5Jgq9JgQ669txpuJ5XShBWY+grUzTACKxiO3k=; b=pjkGqcWLd7Mih97UB/kTMYQKU
	llDSnubOA99Nc04BdQeTsIfBtzLbnsu1dCwmHXzpsBNy4kpZryuKMCl9TA/sNC4fjh2r4dzTgstZ8
	79/sZhrUap1f2E9rjglSwMtsmBfIZ+xYCOQuad9/koFl9eDHQEzc9SjDDwRPflh5KE8/3V/ICn+BO
	ncd5jlih+4qsrB81ArTy5ngUPeIqTqV1JvQTvXR/6b4mRaRSTFElbZqTNtRCLwt3WhwAGeOgRVj1/
	a7w1dkQKU3DTnGxVS/E08ITqWORZZOx56c5beZfZkwQcDuVtnXc+CRE66aLfDHD6ijutQ3zq/FJLc
	AM6e0/O8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kH31s-0003vX-W7; Sat, 12 Sep 2020 10:45:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kH31q-0003vA-UX
 for linux-riscv@lists.infradead.org; Sat, 12 Sep 2020 10:45:11 +0000
Received: from kernel.org (unknown [87.71.73.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E727421548;
 Sat, 12 Sep 2020 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599907509;
 bh=JlaG0VihU/kpNynKTFEbZN+fiVclrSFZQ7o5lYSLsCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MxwNZ3DR4pd+Et17gzUK/aZwG6cHSOwhCuo5WvAt83UKFrpsgCeTfsR3fzflwbVXS
 bvbjd9Xh5RzjmKMl8sjHJhCIuZtc/VlON3F/iJxiwNWoxovf9oBrzZeVM3M263wQQL
 J3d3mZE2F/hRn4VlAXoWKb4o7NCbh1xdTj57Dk3A=
Date: Sat, 12 Sep 2020 13:45:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] RISC-V: Consider sparse memory while removing unusable
 memory
Message-ID: <20200912104502.GF2142832@kernel.org>
References: <20200912002341.4869-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200912002341.4869-1-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_064511_058918_454DFB19 
X-CRM114-Status: GOOD (  22.14  )
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

Hello Atish,

On Fri, Sep 11, 2020 at 05:23:41PM -0700, Atish Patra wrote:
> Currently, any usable memory area beyond page_offset is removed by adding the
> memory sizes from each memblock. That may not work for sparse memory
> as memory regions can be very far apart resulting incorrect removal of some
> usable memory.

If I understand correctly, the memory with physical addresses larger
than (-PAGE_OFFSET) cannot be used. Since it was aready
memblock_add()'ed during device tree parsing, you need to remove it from
memblock.

For that you can use memblock_enforce_memory_limit(-PAGE_OFFSET).

> Just use the start of the first memory block and the end of the last memory
> block to compute the size of the total memory that can be used.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/init.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 787c75f751a5..188281fc2816 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -147,7 +147,6 @@ void __init setup_bootmem(void)
>  {
>  	struct memblock_region *reg;
>  	phys_addr_t mem_size = 0;
> -	phys_addr_t total_mem = 0;
>  	phys_addr_t mem_start, end = 0;
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>  	phys_addr_t vmlinux_start = __pa_symbol(&_start);
> @@ -155,18 +154,17 @@ void __init setup_bootmem(void)
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
>  	 * Remove memblock from the end of usable area to the
>  	 * end of region
>  	 */
> -	mem_size = min(total_mem, (phys_addr_t)-PAGE_OFFSET);
> +	mem_size = min(end - mem_start, (phys_addr_t)-PAGE_OFFSET);
>  	if (mem_start + mem_size < end)
>  		memblock_remove(mem_start + mem_size,
>  				end - mem_start - mem_size);
> -- 
> 2.24.0
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
