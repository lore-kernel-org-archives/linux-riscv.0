Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36EBC43218
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:26:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE3D20820
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 10:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gAR7o33S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AE3D20820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hXgmBd//q4qoxNQtZ8tAQfYFxJwOh6GLQL3uXok0Nc=; b=gAR7o33SQ3Zkna
	6g/6lpMCUVGKCdW3+CKErf2dnYYgYRFuRzmN0B6yGlYZgY1i63VEKPC/PxT1DDUBPlMb2RPcOwEHP
	ksMGawINqRmsl2YE9wBfEslxRc/FAY+PxQ068qhRTv156+p2YE8ZR0FlBAIEWbTiYGThg/CsbC2Tz
	1+aOcVzT8fPS862lpDmhv76IkpOpqcPwgtsqUH3kF8UD6FPVi8I4F96Ahi01Lkd9+eoUwYIG6URCk
	7S6H3DVAtlZCqKGROZ39ndceZhc9yJ+SBtuVGyLExwKvdPc125N+juapev2683Xn+ysQjiP+s6kGP
	s3q4QtlEt554lwZ+VDyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hadya-0004nh-Iw; Tue, 11 Jun 2019 10:26:00 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1hadsF-0003KL-LH
 for linux-riscv@lists.infradead.org; Tue, 11 Jun 2019 10:19:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8662337;
 Tue, 11 Jun 2019 03:19:26 -0700 (PDT)
Received: from [10.1.29.141] (e121487-lin.cambridge.arm.com [10.1.29.141])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC6DF3F557;
 Tue, 11 Jun 2019 03:21:07 -0700 (PDT)
Subject: Re: [PATCH 03/17] mm/nommu: fix the MAP_UNINITIALIZED flag
To: Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@sifive.com>
References: <20190610221621.10938-1-hch@lst.de>
 <20190610221621.10938-4-hch@lst.de>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <c902f38f-071d-cc83-801d-04d600f5ec12@arm.com>
Date: Tue, 11 Jun 2019 11:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190610221621.10938-4-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_031927_821604_15E49C6C 
X-CRM114-Status: GOOD (  18.52  )
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
Cc: linux-mm@kvack.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 uclinux-dev@uclinux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/10/19 11:16 PM, Christoph Hellwig wrote:
> We can't expose UAPI symbols differently based on CONFIG_ symbols, as
> userspace won't have them available.  Instead always define the flag,
> but only repsect it based on the config option.
           ^^^^^^^
           respect
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/xtensa/include/uapi/asm/mman.h    | 6 +-----
>  include/uapi/asm-generic/mman-common.h | 8 +++-----
>  mm/nommu.c                             | 4 +++-
>  3 files changed, 7 insertions(+), 11 deletions(-)

FWIW:

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

> 
> diff --git a/arch/xtensa/include/uapi/asm/mman.h b/arch/xtensa/include/uapi/asm/mman.h
> index be726062412b..ebbb48842190 100644
> --- a/arch/xtensa/include/uapi/asm/mman.h
> +++ b/arch/xtensa/include/uapi/asm/mman.h
> @@ -56,12 +56,8 @@
>  #define MAP_STACK	0x40000		/* give out an address that is best suited for process/thread stacks */
>  #define MAP_HUGETLB	0x80000		/* create a huge page mapping */
>  #define MAP_FIXED_NOREPLACE 0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
> -#ifdef CONFIG_MMAP_ALLOW_UNINITIALIZED
> -# define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
> +#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
>  					 * uninitialized */
> -#else
> -# define MAP_UNINITIALIZED 0x0		/* Don't support this flag */
> -#endif
>  
>  /*
>   * Flags for msync
> diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
> index abd238d0f7a4..cb556b430e71 100644
> --- a/include/uapi/asm-generic/mman-common.h
> +++ b/include/uapi/asm-generic/mman-common.h
> @@ -19,15 +19,13 @@
>  #define MAP_TYPE	0x0f		/* Mask for type of mapping */
>  #define MAP_FIXED	0x10		/* Interpret addr exactly */
>  #define MAP_ANONYMOUS	0x20		/* don't use a file */
> -#ifdef CONFIG_MMAP_ALLOW_UNINITIALIZED
> -# define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be uninitialized */
> -#else
> -# define MAP_UNINITIALIZED 0x0		/* Don't support this flag */
> -#endif
>  
>  /* 0x0100 - 0x80000 flags are defined in asm-generic/mman.h */
>  #define MAP_FIXED_NOREPLACE	0x100000	/* MAP_FIXED which doesn't unmap underlying mapping */
>  
> +#define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
> +					 * uninitialized */
> +
>  /*
>   * Flags for mlock
>   */
> diff --git a/mm/nommu.c b/mm/nommu.c
> index d8c02fbe03b5..ec75a0dffd4f 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -1349,7 +1349,9 @@ unsigned long do_mmap(struct file *file,
>  	add_nommu_region(region);
>  
>  	/* clear anonymous mappings that don't ask for uninitialized data */
> -	if (!vma->vm_file && !(flags & MAP_UNINITIALIZED))
> +	if (!vma->vm_file &&
> +	    (!IS_ENABLED(CONFIG_MMAP_ALLOW_UNINITIALIZED) ||
> +	     !(flags & MAP_UNINITIALIZED)))
>  		memset((void *)region->vm_start, 0,
>  		       region->vm_end - region->vm_start);
>  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
