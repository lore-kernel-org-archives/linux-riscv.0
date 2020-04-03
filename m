Return-Path: <SRS0=G4ZZ=5T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C87C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 15:17:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11D420719
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2020 15:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KBgGSUEf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="IRQASTuS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D11D420719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=SPBXpgOWTzNV/A0U6IcPnBzzrDwIMgsQMzYHIlfsnLw=; b=KBgGSUEfZKkw8t
	Q9LdJfauWeb7J4QKTYXD/+JjbpwCKBLWIXQdm30g/xtb8sqliMPfNA0DWsuBdnOO2FpI96CsywVK/
	V5RQZM0UnaWcpBNMe92RD5vjB4TCtGkBitJyo83ZZNXYqyiygqjLF8d0Z2rlWBDUAUx2ArxBqxLuc
	HxlDLVbbKYBfoKuImKPeIM9rrafymfLTVNa+7EmN9BH9pNU4GkOgo2sIVyeCpxCa/oGE1C4jrbBiV
	xYqw4CmH7ASWwWOU/qm66m5Aacr5Fh6Z0BdDq3kuV351V2DburG/s+DveH0oYnuvBTorw00rnRQtj
	fG+0MVkQq9XOOQfi1YWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKO4D-0001dF-GN; Fri, 03 Apr 2020 15:17:09 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKO4A-0001ar-2n
 for linux-riscv@lists.infradead.org; Fri, 03 Apr 2020 15:17:07 +0000
Received: by mail-pg1-x542.google.com with SMTP id b1so3632524pgm.8
 for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2020 08:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SPBXpgOWTzNV/A0U6IcPnBzzrDwIMgsQMzYHIlfsnLw=;
 b=IRQASTuSmjWW6Y+BlyPZT7Uq9ZE4JpmSWIjUZp/1ge5VPQW+2/Ji372WrAe0piZ72m
 TR7/5b8bHGUbZCofmnrGjuSCQ5YQDTbSI/UY7Ine7lDTTK7QSwu/+P8smG9tqVjZjpvp
 i2OR6zI/8TfEfsJenUnc1M6/T4HhoT9nj1Q+GDymeQAAt8vha+8uMBdS2ohiYopZl+mm
 wxNvQNs6r3rLLnJfYpcP+9q0uSIc1YempGo+WzTDU8vY4bSv6QBm5xhCWGQlw5W2j5BT
 m/1hy7kxUVYbZA209biDi2Ign05gYIDqFxYpRUJu76z1Px9+1d7KF2mwEXuALfsHdWmh
 fDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SPBXpgOWTzNV/A0U6IcPnBzzrDwIMgsQMzYHIlfsnLw=;
 b=PqQnXyvqL7pA8BJyMa5VjsBBgJR+IWdanfB9bEEnl4XGQBWE11uSNyYQMbhC2rL4NP
 Fwexdx79ibP/F48rR0ouWJg2fKnpPpdykwihT+6HVjdPAVyBI9896s+Fgi/S3PyPLMrC
 7YrS7cCHPNCo9PghZQpVn42/IdApiJYGqjXsmod5h+73oznS1pX9/FEfOWvWPPqQFlAq
 whSNA+eHlT8hg9ARQkqNn5vq3TKzHSXQz1Ns3IsNBgmKepZr86VBSdaox0BEY24vqrDy
 kYkPpY3bxlnL1GJpmJdiwybFJvBk7vneu66DqMFSKYv0oRvcHgicAaGPWUztKURjDVa8
 qt2g==
X-Gm-Message-State: AGi0PuYuqLgYcMj3IRsa3wTcONQzfMxBQkZqdJ6oxhLMCCvjQ1ZUm/hm
 3+nFeaqF9KVmfr2SkDDtm2fD9g==
X-Google-Smtp-Source: APiQypLZ8H+EuQc4yT+15BG8sGk0hoQxKFyiLT89292JsUfDr+1SpCcKHVabsmr3b8PTT5NQB4HSxQ==
X-Received: by 2002:a62:1c08:: with SMTP id c8mr9294283pfc.80.1585927025235;
 Fri, 03 Apr 2020 08:17:05 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y9sm6217184pfo.135.2020.04.03.08.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 08:17:04 -0700 (PDT)
Date: Fri, 03 Apr 2020 08:17:04 -0700 (PDT)
X-Google-Original-Date: Fri, 03 Apr 2020 08:14:58 PDT (-0700)
Subject: Re: [RFC PATCH 2/7] riscv: Allow to dynamically define VA_BITS
In-Reply-To: <20200322110028.18279-3-alex@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-1f8477e3-7cb4-454f-b443-8cf032325385@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_081706_137265_6255032D 
X-CRM114-Status: GOOD (  16.38  )
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
Cc: alex@ghiti.fr, anup@brainfault.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 22 Mar 2020 04:00:23 PDT (-0700), alex@ghiti.fr wrote:
> With 4-level page table folding at runtime, we don't know at compile time
> the size of the virtual address space so we must set VA_BITS dynamically
> so that sparsemem reserves the right amount of memory for struct pages.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/Kconfig                 | 10 ----------
>  arch/riscv/include/asm/pgtable.h   | 10 +++++++++-
>  arch/riscv/include/asm/sparsemem.h |  2 +-
>  3 files changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f5f3d474504d..8e4b1cbcf2c2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -99,16 +99,6 @@ config ZONE_DMA32
>  	bool
>  	default y if 64BIT
>
> -config VA_BITS
> -	int
> -	default 32 if 32BIT
> -	default 39 if 64BIT
> -
> -config PA_BITS
> -	int
> -	default 34 if 32BIT
> -	default 56 if 64BIT
> -
>  config PAGE_OFFSET
>  	hex
>  	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 185ffe3723ec..dce401eed1d3 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -26,6 +26,14 @@
>  #endif /* CONFIG_64BIT */
>
>  #ifdef CONFIG_MMU
> +#ifdef CONFIG_64BIT
> +#define VA_BITS		39
> +#define PA_BITS		56
> +#else
> +#define VA_BITS		32
> +#define PA_BITS		34

We've moved to 32-bit physical addresses on rv32 in Linux.  The mismatch was
causing too many issues in generic code.

> +#endif
> +
>  /* Number of entries in the page global directory */
>  #define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
>  /* Number of entries in the page table */
> @@ -108,7 +116,7 @@ extern pgd_t swapper_pg_dir[];
>   * position vmemmap directly below the VMALLOC region.
>   */
>  #define VMEMMAP_SHIFT \
> -	(CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> +	(VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
>  #define VMEMMAP_SIZE	BIT(VMEMMAP_SHIFT)
>  #define VMEMMAP_END	(VMALLOC_START - 1)
>  #define VMEMMAP_START	(VMALLOC_START - VMEMMAP_SIZE)
> diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
> index 45a7018a8118..f08d72155bc8 100644
> --- a/arch/riscv/include/asm/sparsemem.h
> +++ b/arch/riscv/include/asm/sparsemem.h
> @@ -4,7 +4,7 @@
>  #define _ASM_RISCV_SPARSEMEM_H
>
>  #ifdef CONFIG_SPARSEMEM
> -#define MAX_PHYSMEM_BITS	CONFIG_PA_BITS
> +#define MAX_PHYSMEM_BITS	PA_BITS
>  #define SECTION_SIZE_BITS	27
>  #endif /* CONFIG_SPARSEMEM */

Aside from the 32-bit PA issue:

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

