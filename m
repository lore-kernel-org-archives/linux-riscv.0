Return-Path: <SRS0=ka1a=6C=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E442C352BE
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 18 Apr 2020 00:30:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0842223C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 18 Apr 2020 00:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="chpNzyVb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="TJAxg6Nj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D0842223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0AfeFitryBiJJWIKCCwY7N0WlSHnDG6Y0BrOA9pYIjg=; b=chpNzyVbYwKeNu
	L9kpDZCno9j3+bgUXxMjQkmEpHVmoNs3p68XJyQGCyz0miN8obyCb3WNinsw/e6xXstfngqx+4Woy
	kmrgdzkdr1clJQTq1RcANRAhBHfEOgEQDLa4eYKmxL917J0m4aGzDoYmzyGa8QSQGrPmhs4wxxPh/
	EmyFP+B+8JGuLVuCmkfULm/Ng9m8OjTZIdzm10wyxvbp79QvaVmH2LTNGnDOtuxEOgZhMX592M1m8
	qlJDFeRk9jiWuIfwLcZYj1V9CK0mS67nqMi7Ntri8+qsRANZU6YeQQTPLbGbAbt8t/wq0sZbKaXsL
	/caf4qVPt85xB/VS9Tcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPbNa-0004SR-TA; Sat, 18 Apr 2020 00:30:42 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPbNY-0004Rn-3h
 for linux-riscv@lists.infradead.org; Sat, 18 Apr 2020 00:30:41 +0000
Received: by mail-pf1-x444.google.com with SMTP id k15so1848565pfh.6
 for <linux-riscv@lists.infradead.org>; Fri, 17 Apr 2020 17:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0AfeFitryBiJJWIKCCwY7N0WlSHnDG6Y0BrOA9pYIjg=;
 b=TJAxg6Nj7mvYe9W1fv1qsO7mUzp9flRqxmoqk6bQImYJehU7tMbjjTy3GYG7Ve8abr
 ZhQ+lm4D3jFNcbv8/DP4L8GEWXfMvR2rODm0wJtp9r+UXsaXAwrwIN9Cl33l9WJCSbCt
 NdY8K1h6whKlji5c2LAlvnwF3y+pMkt5FwHeW7vg+e4uPyQokPV3tPQKjjM7PeDGKVTc
 YDguumzHMQZlK00MzNp39F2pNMNuFRqo7VyIzwlChH6/nYHAqZt6itpF9vdwQAj9nCAB
 9sSBfMw3IH6UpronKtIWKd80yXcjPiEc9DlSS7camZjQWhmFra0AvLCCfjUHPgoefSbi
 YTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0AfeFitryBiJJWIKCCwY7N0WlSHnDG6Y0BrOA9pYIjg=;
 b=HK3YmtY/VyRJg8vrAM3C5F0JmkNXpsSzR/gRMa2lY89u5NeVFWlelrJXoxRcr4QLXn
 rrbdGaXLOKA2ErLObYiamnZctKe/Y89jjDkGV14EBzZxXaRSvY9gj9NvxFC9IOuCiqhb
 0+6RHcs3u1QR1bSxDQRHll7yZkNrU4sDhFNku9ahQZIs63ZWCMN+BoDVMaj94AaquS4v
 7mpMf3I7BeOb+6OrbhGbXXt4o5LQ8giCLqniyp9PfidgMqpmeX8hJ39l4HaZSycOTdHv
 ahJzMtL+/i8Wr1TroKjq+efVSqaW8jHUZjlCRma9D/UPQz+9syYGtqqivS5IFrWgY0I2
 E+dw==
X-Gm-Message-State: AGi0PuYgnYkxCXbeEgQv1sscWBApqMZxDcTdh2on303Wpfzlf8wVvrxE
 32YX7P5MLMtij1KiVsFbnI4cLw==
X-Google-Smtp-Source: APiQypKUElb866HEHEtPLanFvP/5xIzuLq3qC6Q5JBOUeVvdZeVNhGXGCLpmMGvSEMhaHzmc/riFIg==
X-Received: by 2002:aa7:9722:: with SMTP id k2mr5789777pfg.147.1587169839258; 
 Fri, 17 Apr 2020 17:30:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t103sm6764185pjb.46.2020.04.17.17.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 17:30:38 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:30:38 -0700 (PDT)
X-Google-Original-Date: Fri, 17 Apr 2020 17:30:37 PDT (-0700)
Subject: Re: [PATCH v5 9/9] riscv: add STRICT_KERNEL_RWX support
In-Reply-To: <100e739c5fd722a96fcc640c8ee0c82fe34fcb6a.1586332296.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-09f91ec8-5821-41ad-a743-3842ca10f9e2@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_173040_148007_51FF840E 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, mhiramat@kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 08 Apr 2020 00:57:04 PDT (-0700), zong.li@sifive.com wrote:
> The commit contains that make text section as non-writable, rodata
> section as read-only, and data section as non-executable.
>
> The init section should be changed to non-executable.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/Kconfig                  |  1 +
>  arch/riscv/include/asm/set_memory.h |  8 ++++++
>  arch/riscv/mm/init.c                | 44 +++++++++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1e1efc998baf..58b556167d59 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -61,6 +61,7 @@ config RISCV
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_SET_DIRECT_MAP
>  	select ARCH_HAS_SET_MEMORY
> +	select ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>  	select SPARSEMEM_STATIC if 32BIT
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 4c5bae7ca01c..c38df4771c09 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -22,6 +22,14 @@ static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>  #endif
>
> +#ifdef CONFIG_STRICT_KERNEL_RWX
> +void set_kernel_text_ro(void);
> +void set_kernel_text_rw(void);
> +#else
> +static inline void set_kernel_text_ro(void) { }
> +static inline void set_kernel_text_rw(void) { }
> +#endif
> +
>  int set_direct_map_invalid_noflush(struct page *page);
>  int set_direct_map_default_noflush(struct page *page);
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fab855963c73..b55be44ff9bd 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -12,6 +12,7 @@
>  #include <linux/sizes.h>
>  #include <linux/of_fdt.h>
>  #include <linux/libfdt.h>
> +#include <linux/set_memory.h>
>
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
> @@ -477,6 +478,17 @@ static void __init setup_vm_final(void)
>  	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
>  	local_flush_tlb_all();
>  }
> +
> +void free_initmem(void)
> +{
> +	unsigned long init_begin = (unsigned long)__init_begin;
> +	unsigned long init_end = (unsigned long)__init_end;
> +
> +	/* Make the region as non-execuatble. */
> +	set_memory_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
> +	free_initmem_default(POISON_FREE_INITMEM);
> +}
> +
>  #else
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  {
> @@ -488,6 +500,38 @@ static inline void setup_vm_final(void)
>  }
>  #endif /* CONFIG_MMU */
>
> +#ifdef CONFIG_STRICT_KERNEL_RWX
> +void set_kernel_text_rw(void)
> +{
> +	unsigned long text_start = (unsigned long)_text;
> +	unsigned long text_end = (unsigned long)_etext;
> +
> +	set_memory_rw(text_start, (text_end - text_start) >> PAGE_SHIFT);
> +}
> +
> +void set_kernel_text_ro(void)
> +{
> +	unsigned long text_start = (unsigned long)_text;
> +	unsigned long text_end = (unsigned long)_etext;
> +
> +	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
> +}
> +
> +void mark_rodata_ro(void)
> +{
> +	unsigned long text_start = (unsigned long)_text;
> +	unsigned long text_end = (unsigned long)_etext;
> +	unsigned long rodata_start = (unsigned long)__start_rodata;
> +	unsigned long data_start = (unsigned long)_data;
> +	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
> +
> +	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
> +	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> +	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> +	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
> +}
> +#endif
> +
>  void __init paging_init(void)
>  {
>  	setup_vm_final();

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

