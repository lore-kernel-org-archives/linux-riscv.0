Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792A0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 05:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D75206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 05:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YJvePeqB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iC0nRwdY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D75206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=KYjZ05BW+lawHrxu0CTkMdUM6aySxB3oIhsQTLAnibc=; b=YJvePeqBM0mB4XwJZ1f7W2CF3
	r/FPB4gqANkdI9Nbhy8vy5lzu4ZTmjYaQZHLc9CBHpiqpzHJcEdjUbxfjNQBrlghm4ItZ0FuJuXq9
	lx2N6vVY5TTf6hm4F3snVEixcBtbkU5wqc4LK0qnJfObQBXPNQU2nIxYRsaC0UXeesqVZt75Wg2Wq
	vkMVUMVX655NMijSRdlIBfWLAmf2oxrtvpBb9jIDiZfJuaOQloB2a8S/78yYBHxnfCgfXqwQ8FqKV
	L+IyAbgx0X4kdiqhDBqrosJz6sKQbFiife6SdFYrbl77FZsqndZTqdYqy87x7XnraC6mMrRK3x50j
	W3Mk3pWzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9NlM-0003my-C1; Thu, 28 Mar 2019 05:39:40 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9NlJ-0003mb-04
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 05:39:38 +0000
Received: by mail-pf1-x441.google.com with SMTP id i17so10835277pfo.6
 for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2019 22:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FVTIAp+AHigUlUaGp3ARcNFkfdWonWsh7STo70xb6HE=;
 b=iC0nRwdY2t02geyoPPs/ajI2+Nk5eq/9ZMIwzN0+7I3b3VUr/7mkhTG25WiaYS0S49
 cmhfN5W2v5DxP9c87WWQe6u72aJoANBU0aqWqlK6UR9wXk9Evnwfi554G6SAJBkbQDKS
 Wj+L2/wEp2NIf+zkPkuRaRYBe3KEvyyAYsHP1/ifQQp5OqUF1wmcujLmtbCmquFVE8QV
 P6Y2ExtJuUtFZN4JOKq5abWJa+PUUU+/3rx7GR6cvN1NINJvN8YHkYI2fqqBlaT1ZeiO
 0XRT4N86/vrhbKGz6QkmpXI/mhdi5DrRQK5JPyMWr0PD0w+JjoQoX/lhwm6vBFTbI+mA
 icAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FVTIAp+AHigUlUaGp3ARcNFkfdWonWsh7STo70xb6HE=;
 b=d3p6u8KDR5F+UAOYe31621w1l4rBTj6FVup5OmAudesbdF9DuAY9rHAomH8Y3IINio
 vy4TsrVDV0ETL5U7psGbXc8PMeTWGXynxma1nH+iNoQYlIuTru+g032S5aZv2saAP2pD
 RJjaLfHWpKlyjWs9D482aiFM5a9C7nUdChjUNchkJEuE9q53/dSaluIxkudQ7EWgOR3E
 08NvqV5CqVyzY32+ajXDd8wm0l+B/p7op5CpR4ihj+/c8JJWHW9FNXZ48YX+3qPUJ6ET
 ttvx80FgvYAysIO5bf4bs+X7e8yvJCuITEMOcZiq3oEpjbb0MhVT4HJlCZqzHoc2fuUO
 bj+Q==
X-Gm-Message-State: APjAAAUH8vGp5rsBby5fgBm7lJE1cVreofeLIwZGH3TXirCOxjX+NLqR
 5TgSyurrlR3PDCfYcqCRVzCTtg==
X-Google-Smtp-Source: APXvYqyQobf9dP5bsezx+HsyfGxTt7VmHvJUK2rbLtrIboK+3nr00nKQVLfGH/CBX0T/7jn4AnPWnw==
X-Received: by 2002:a63:4750:: with SMTP id w16mr38983883pgk.256.1553751575232; 
 Wed, 27 Mar 2019 22:39:35 -0700 (PDT)
Received: from localhost
 (2001-b011-7001-168c-9355-f21f-1416-8b19.dynamic-ip6.hinet.net.
 [2001:b011:7001:168c:9355:f21f:1416:8b19])
 by smtp.gmail.com with ESMTPSA id u10sm26809103pgr.2.2019.03.27.22.39.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Mar 2019 22:39:33 -0700 (PDT)
Date: Wed, 27 Mar 2019 22:39:33 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2019 21:04:20 PDT (-0700)
Subject: Re: [PATCH 3/7] RISC-V: Rework kernel's virtual address space mapping
In-Reply-To: <20190327213643.23789-4-logang@deltatee.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
Message-ID: <mhng-fca98e1a-ad61-40b6-abd8-60b0e752dcf2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_223937_077571_6A919D0C 
X-CRM114-Status: GOOD (  22.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: sorear2@gmail.com, aou@eecs.berkeley.edu, anup.patel@wdc.com,
 linux-kernel@vger.kernel.org, sbates@raithlin.com, antonynpavlov@gmail.com,
 linux-riscv@lists.infradead.org, logang@deltatee.com,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 27 Mar 2019 14:36:39 PDT (-0700), logang@deltatee.com wrote:
> The motivation for this is to support P2P transactions. P2P requires
> having struct pages for IO memory which means the linear mapping must
> be able to cover all of the IO regions. Unfortunately with Sv39 we are
> not able to cover all the IO regions available on existing hardware,
> but we can do better than what we currently do (which only cover's
> physical memory).
>
> To this end, we restructure the kernel's virtual address space region.
> We position the vmemmap at the beginning of the region (based on how
> many virtual address bits we have) and the VMALLOC region comes
> immediately after. The linear mapping then takes up the remaining space.
> PAGE_OFFSET will need to be within the linear mapping but may not be
> the start of the mapping seeing many machines don't have RAM at address
> zero and we may still want to access lower addresses through the
> linear mapping.
>
> With these changes, on a 64-bit system the virtual memory map (with
> sparsemem enabled) will be:
>
> 32-bit:
>
> 00000000 - 7fffffff   user space, different per mm (2G)
> 80000000 - 81ffffff   virtual memory map (32MB)
> 82000000 - bfffffff   vmalloc/ioremap space (1GB - 32MB)
> c0000000 - ffffffff   direct mapping of all phys. memory (1GB)
>
> 64-bit, Sv39:
>
> 0000000000000000 - 0000003fffffffff  user space, different per mm (256GB)
> hole caused by [38:63] sign extension
> ffffffc000000000 - ffffffc0ffffffff  virtual memory map (4GB)
> ffffffc100000000 - ffffffd0ffffffff  vmalloc/ioremap spac (64GB)
> ffffffd100000000 - ffffffffffffffff  linear mapping of phys. space (188GB)
>
> On the Sifive hardware this allows us to provide struct pages for
> the lower I/O TileLink address ranges, the 32-bit and 34-bit DRAM areas
> and 172GB of 240GB of the high I/O TileLink region. Once we progress to
> Sv48 we should be able to cover all the available memory regions..
>
> For the MAXPHYSMEM_2GB case, the physical memory must be in the highest
> 2GB of address space, so we cannot cover the any of the I/O regions
> that are higher than it but we do cover the lower I/O TileLink range.

IIRC there was another patch floating around to fix an issue with overlapping 
regions in the 32-bit port, did you also fix that issue?  It's somewhere in my 
email queue...

> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: "Stefan O'Rear" <sorear2@gmail.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/Kconfig               |  2 +-
>  arch/riscv/include/asm/page.h    |  2 --
>  arch/riscv/include/asm/pgtable.h | 27 ++++++++++++++++++---------
>  3 files changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 76fc340ae38e..d21e6a12e8b6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -71,7 +71,7 @@ config PAGE_OFFSET
>  	hex
>  	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
>  	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
> -	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> +	default 0xffffffd200000000 if 64BIT && MAXPHYSMEM_128GB
>
>  config ARCH_FLATMEM_ENABLE
>  	def_bool y
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 2a546a52f02a..fa0b8058a246 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -31,8 +31,6 @@
>   */
>  #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
>
> -#define KERN_VIRT_SIZE (-PAGE_OFFSET)
> -
>  #ifndef __ASSEMBLY__
>
>  #define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 5a9fea00ba09..2a5070540996 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -89,22 +89,31 @@ extern pgd_t swapper_pg_dir[];
>  #define __S110	PAGE_SHARED_EXEC
>  #define __S111	PAGE_SHARED_EXEC
>
> -#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> -#define VMALLOC_END      (PAGE_OFFSET - 1)
> -#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> +#define KERN_SPACE_START	(-1UL << (CONFIG_VA_BITS - 1))
>
>  /*
>   * Roughly size the vmemmap space to be large enough to fit enough
>   * struct pages to map half the virtual address space. Then
>   * position vmemmap directly below the VMALLOC region.
>   */
> -#define VMEMMAP_SHIFT \
> -	(CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> -#define VMEMMAP_SIZE	(1UL << VMEMMAP_SHIFT)
> -#define VMEMMAP_END	(VMALLOC_START - 1)
> -#define VMEMMAP_START	(VMALLOC_START - VMEMMAP_SIZE)
> -
> +#ifdef CONFIG_SPARSEMEM
> +#define VMEMMAP_SIZE	(UL(1) << (CONFIG_VA_BITS - PAGE_SHIFT - 1 + \
> +				   STRUCT_PAGE_MAX_SHIFT))
> +#define VMEMMAP_START	(KERN_SPACE_START)
> +#define VMEMMAP_END	(VMEMMAP_START + VMEMMAP_SIZE - 1)
>  #define vmemmap		((struct page *)VMEMMAP_START)
> +#else
> +#define VMEMMAP_END	KERN_SPACE_START
> +#endif
> +
> +#ifdef CONFIG_32BIT
> +#define VMALLOC_SIZE	((1UL << 30) - VMEMMAP_SIZE)
> +#else
> +#define VMALLOC_SIZE	(64UL << 30)
> +#endif
> +
> +#define VMALLOC_START	(VMEMMAP_END + 1)
> +#define VMALLOC_END	(VMALLOC_START + VMALLOC_SIZE - 1)
>
>  /*
>   * ZERO_PAGE is a global shared page that is always zero,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
