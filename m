Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BD2C7618A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 20:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9sTmf0zD2hwtvN4Ze9/F9VqhmobvdMRVa20uPhgpWU=; b=RVwUR+MHdu0AB/
	p2KtdqurzOjIbkhWQmTi/3RpJscd7dOYSQ7iATEJhBh/RM1y6BsyeIfE5EtYHnG77Vl/UwR/Kk4VO
	1TO5GsCJgmxH15qZQ+fjCP0ehFREjxDAQ6zp9qCQNBC7woO4z1cldKF3LErg8KoFgVf/o4P0Hvy9T
	laPkjyRe/qSqIaHbW/0TIYDX+esYXbDr/RBEfpN2WIE935KmBOHnIZa8Emxy5lpD2dlwJV+hc2yA/
	5Qp71QcPSfnOQuTkkz5SDYPWJPHrCLcvbqdfk2OuEegQJ1VMwMfRcUYT2JqytRCGeBqMFOBbyFjS3
	v3maMChpM6ADKQXjmdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pctxl-00HU0g-0a;
	Thu, 16 Mar 2023 20:12:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pctxh-00HTzo-2r;
	Thu, 16 Mar 2023 20:12:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D2CDEB82348;
	Thu, 16 Mar 2023 20:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10B9C433EF;
	Thu, 16 Mar 2023 20:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678997550;
	bh=aVKFhVYxDwxQfxrSuIzE8aVSFP2JSCdE26VT7FUCnes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRHXAN89HeDXuyyPlAdXiD6tB51zPZGWpAh8J9Ni4lm/ylqi3s8VZXQY6yrMVZ7sW
	 94YTfqrzPhIh6XTIJYZxn+K3cthdlvLqm1C+VXSdSpWt07zo0jBN+rl+KSGc13RTqT
	 0U072E3JMiG4u/5i5Tg2+Og9HnhtafWi5gBH31kY8XvBMZ2hRmqIuddUh1Q1nOPnia
	 PczKkteoP/fj0/qc3yIz3gzNCOg18RcB7SwZxFlgXYNWiumeu4/AiAqUGfpwbs/+Rc
	 +GGnxorVv7bd5gxBNLBycpc3aWr8L8s8tNv+KQxRUs8gFqY/YpwaTekGlVFEvXO3d9
	 Orclfio6PwZxQ==
Date: Thu, 16 Mar 2023 22:12:14 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 2/4] mm: Introduce memblock_isolate_memory
Message-ID: <ZBN4Hoo99DNd5wKx@kernel.org>
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
 <20230316131711.1284451-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230316131711.1284451-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_131234_256596_0138C064 
X-CRM114-Status: GOOD (  23.01  )
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

Hi Alexandre,

On Thu, Mar 16, 2023 at 02:17:09PM +0100, Alexandre Ghiti wrote:
> This function allows to split a region in memblock.memory and will be
> useful when setting up the linear mapping with STRICT_KERNEL_RWX: it
> allows to isolate the kernel text/rodata and then avoid to map those
> regions with a PUD/P4D/PGD.
 
Sorry I've missed it last time. The changelog is fine in the context of
this series, but if you look at it as a part of memblock changelog it
doesn't provide enough background on why memblock_isolate_memory() is
useful.

Can you please add more context so it would be self explanatory?

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Tested-by: Anup Patel <anup@brainfault.org>
> ---
>  include/linux/memblock.h |  1 +
>  mm/memblock.c            | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 50ad19662a32..2f7ef97c0da7 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -125,6 +125,7 @@ int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
>  int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
>  int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
>  int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
> +int memblock_isolate_memory(phys_addr_t base, phys_addr_t size);
>  
>  void memblock_free_all(void);
>  void memblock_free(void *ptr, size_t size);
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 25fd0626a9e7..e8c651a37012 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -805,6 +805,26 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>  	return 0;
>  }
>  
> +/**
> + * memblock_isolate_memory - isolate given range in memblock.memory
> + * @base: base of range to isolate
> + * @size: size of range to isolate
> + *
> + * Isolates the given range in memblock.memory so that it does not share any
> + * region with other ranges.
> + *
> + * Return:
> + * 0 on success, -errno on failure.
> + */
> +
> +int __init_memblock memblock_isolate_memory(phys_addr_t base, phys_addr_t size)
> +{
> +	int start_rgn, end_rgn;
> +
> +	return memblock_isolate_range(&memblock.memory, base, size,
> +				      &start_rgn, &end_rgn);
> +}
> +
>  static int __init_memblock memblock_remove_range(struct memblock_type *type,
>  					  phys_addr_t base, phys_addr_t size)
>  {
> -- 
> 2.37.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
