Return-Path: <SRS0=nRJq=62=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6ABC2D0FA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 May 2020 23:00:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33FFA20753
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 May 2020 23:00:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YBUBu6h1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="YV0IEXO5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33FFA20753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TxR+iMR41NNC8Tp0Yh5G0J9anaHo/y+mAo5OJ6FnE3w=; b=YBUBu6h1JUo0c1
	C6vU7eLLg89Ij5QcqCQYn3afuPe84qvn/TADLABT4+1p6k1LZ8DmZ75HV4zjPmtmHzedGpXlhmeVy
	Vcg6eFY+xxdnrDcjBSo0QOuYqxbS0wb9dKBmudH9oLNSoopkdPkxTie6geJYTBRf5utd+I4eAXmGB
	xCVlgQWOQlcNjBWN5XD0YfDuTlGx9KtMYBuDrYtFXGW9jCwJ/CRSNe/+f7a7cAQ+bmcIeqsn5jcFr
	9j9wLq3iOnvMS/xSdbCfPpe/pMSYrNcXVQp2MR1+U6oDowaF3UIw1EviDRaAMJAbd8nF0Z2Plz8w9
	F15lfHe3dVZH/2TGxxvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYdt3-0004i0-7T; Tue, 12 May 2020 23:00:33 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYdsz-0004eW-Jb
 for linux-riscv@lists.infradead.org; Tue, 12 May 2020 23:00:31 +0000
Received: by mail-pj1-x1044.google.com with SMTP id j13so119296pjm.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 May 2020 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TxR+iMR41NNC8Tp0Yh5G0J9anaHo/y+mAo5OJ6FnE3w=;
 b=YV0IEXO5IABYUMUtMWw6Y0a2xNZhYt4iDNMNdBJAdhkLz+DhDJrEb2/tely+kMRfBe
 elzT7mfwntttCi0+nBJzpxqW1RzbdA4k2z5m0sbPhXbgm86NhUGJ6ezv1UWvqUAF6AFb
 GwYEyZnEpPlXtS0AdB1oOMIXhoSzH1oQ3QYdKyFvf7rV9a0F5474HoxquQdEEcVsoVZk
 mkFDvy/LaDlTuj+uY+/sZnyRH+3w/Rut2ArIzwHPIrhPI856FrWtiOC99MOqCPnAlAt1
 y5de0EiQgDBn8VhocdW7T7X+feJnXd114pzMo7qEMcn1qfbF3zf4gbB8O6Pkx7p0q4QB
 ZmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TxR+iMR41NNC8Tp0Yh5G0J9anaHo/y+mAo5OJ6FnE3w=;
 b=aiV1nSVpt7pojZ2GElAHfnxDYoCkQiNkDaxOB40OBxM3W+FjmXj18XuG5ojqA1cMMd
 0+GhFapofCoxxnwN6W15NScIagmlUKo/PkwmFUpok1/sefUx266PoeTED0pEFfXwqY3b
 UGH2ubvXRKIh7i0srqwv8eLerW5ITT/ra0NhqY1n3In1FmLO0Kt8arBICEjX1Z7smS/y
 UhJftggaMYWnOSFVwdQ1JEy0uyQZdWns1mYAD4/kJI40Uu8mCUkXwIfhJopejzHpP2AZ
 EdBqgjSqQw8Rbjzwb9EL66tt5lxQhyucOttwB2FhvYIHQD/BhuMe/uWgBkhBIePEBwtK
 N1VA==
X-Gm-Message-State: AGi0Pua++RA4V0g6znNwpRW/5rr1K5B8BNU2DxqA0mQFP7UCLOz8vKZb
 ubWg5Yx5bITQinEfA4JiYiwlDg==
X-Google-Smtp-Source: APiQypKPbiNIuzOhnfWZK3aSuAimZ6kMvjtjoB3PUVWkLgrXCsrrvonJs2vHPqxiHQA1YoMJYuJ02Q==
X-Received: by 2002:a17:90a:2281:: with SMTP id
 s1mr31687737pjc.68.1589324428530; 
 Tue, 12 May 2020 16:00:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w143sm12602170pfc.165.2020.05.12.16.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 16:00:26 -0700 (PDT)
Date: Tue, 12 May 2020 16:00:26 -0700 (PDT)
X-Google-Original-Date: Tue, 12 May 2020 15:59:50 PDT (-0700)
Subject: Re: [PATCH 19/31] riscv: use asm-generic/cacheflush.h
In-Reply-To: <20200510075510.987823-20-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-8adbedbc-0f91-4291-9471-2df5eb7b802b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_160029_648275_487E1F41 
X-CRM114-Status: GOOD (  17.13  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, zippel@linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, jeyu@kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 monstr@monstr.eu, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 10 May 2020 00:54:58 PDT (-0700), Christoph Hellwig wrote:
> RISC-V needs almost no cache flushing routines of its own.  Rely on
> asm-generic/cacheflush.h for the defaults.
>
> Also remove the pointless __KERNEL__ ifdef while we're at it.
> ---
>  arch/riscv/include/asm/cacheflush.h | 62 ++---------------------------
>  1 file changed, 3 insertions(+), 59 deletions(-)
>
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index c8677c75f82cb..a167b4fbdf007 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -8,65 +8,6 @@
>
>  #include <linux/mm.h>
>
> -#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 0
> -
> -/*
> - * The cache doesn't need to be flushed when TLB entries change when
> - * the cache is mapped to physical memory, not virtual memory
> - */
> -static inline void flush_cache_all(void)
> -{
> -}
> -
> -static inline void flush_cache_mm(struct mm_struct *mm)
> -{
> -}
> -
> -static inline void flush_cache_dup_mm(struct mm_struct *mm)
> -{
> -}
> -
> -static inline void flush_cache_range(struct vm_area_struct *vma,
> -				     unsigned long start,
> -				     unsigned long end)
> -{
> -}
> -
> -static inline void flush_cache_page(struct vm_area_struct *vma,
> -				    unsigned long vmaddr,
> -				    unsigned long pfn)
> -{
> -}
> -
> -static inline void flush_dcache_mmap_lock(struct address_space *mapping)
> -{
> -}
> -
> -static inline void flush_dcache_mmap_unlock(struct address_space *mapping)
> -{
> -}
> -
> -static inline void flush_icache_page(struct vm_area_struct *vma,
> -				     struct page *page)
> -{
> -}
> -
> -static inline void flush_cache_vmap(unsigned long start, unsigned long end)
> -{
> -}
> -
> -static inline void flush_cache_vunmap(unsigned long start, unsigned long end)
> -{
> -}
> -
> -#define copy_to_user_page(vma, page, vaddr, dst, src, len) \
> -	do { \
> -		memcpy(dst, src, len); \
> -		flush_icache_user_range(vma, page, vaddr, len); \
> -	} while (0)
> -#define copy_from_user_page(vma, page, vaddr, dst, src, len) \
> -	memcpy(dst, src, len)
> -
>  static inline void local_flush_icache_all(void)
>  {
>  	asm volatile ("fence.i" ::: "memory");
> @@ -79,6 +20,7 @@ static inline void flush_dcache_page(struct page *page)
>  	if (test_bit(PG_dcache_clean, &page->flags))
>  		clear_bit(PG_dcache_clean, &page->flags);
>  }
> +#define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
>
>  /*
>   * RISC-V doesn't have an instruction to flush parts of the instruction cache,
> @@ -105,4 +47,6 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  #define SYS_RISCV_FLUSH_ICACHE_LOCAL 1UL
>  #define SYS_RISCV_FLUSH_ICACHE_ALL   (SYS_RISCV_FLUSH_ICACHE_LOCAL)
>
> +#include <asm-generic/cacheflush.h>
> +
>  #endif /* _ASM_RISCV_CACHEFLUSH_H */

Thanks!

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Were you trying to get these all in at once, or do you want me to take it into
my tree?

