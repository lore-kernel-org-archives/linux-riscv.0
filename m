Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A1DC77B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 05:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XpOwUIjG+EAOrjNi22YUYOnrpfEonvArMRDhG9Sb3eQ=; b=v24N2XaIKiiSu8mWSJdRwL/AZt
	AK88XljjQZHW49v/+ucAGLzklCDOWRFR7AxCpWAFgudxOzEJeEuvEXSXwvHyCOMYidhtmEOM0lJFy
	3sLAQMA8Y/V0TsAzOGxVODwoSluRpBWpDX3T740BbjvMthofmm9aPTiNYcW9D7Tmvar/75GoNjoHf
	y20Hwe54LEOcCCfSQJCm8tO9Gmgg/1bcQaOUKtNkuwex34hKK7X30JetliXTE/q4IrOd9+WEzY4GP
	2TyxWWgKwYxTO642HTpVrCCj9pfXF1X8qbfMnTNnJ1McerssW7z0o+UoRquhjuUFjxfb4PuFInjwn
	20EKU5RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptimx-000EEx-28;
	Tue, 02 May 2023 05:42:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptimw-000EE5-0c
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 05:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=+bpzhEAd3sIcSUG6Bko9hFuyyeeC29520LX/NWwAxrs=; b=ml2kqqbq4ZX9yJjhYzHK5HG6bP
	zihbjdfITr34jIP8g03Yh9efdpOuRurgs6DmkQcJRyULe/iyDnPxv78uJFvFAPn3/XLJU7P7MOv49
	axsRCf+uR24TXlS+5zmjOeThvW3Fx3EbnnDMfL/FNfdFhtn8dMCMQ47eQ2yzPX2qPAgne6iVSKMnV
	PGuFoKAWMRriiIXDN6oEBPXaXLbv6DLNeFUcXLzb5j6B9UKAXVcgNb8yPmy+AK9/EjelwRM9HJrA5
	cpmILMYFvrgbQY1z3LRAM683WsP+QtT8qsn01rdFxGGBQOS7FB9OEzCXKmHxGs0UsPyrJt+cw45rj
	xVC3ZSuQ==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptdj5-00F43s-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 00:18:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b70ca0a84so3693099b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682986717; x=1685578717;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bpzhEAd3sIcSUG6Bko9hFuyyeeC29520LX/NWwAxrs=;
        b=fokpsq4QP6LNVlndu8pmScu3CTVrenOc4/M9jhIEU6A3vEzWo/Ge1GoPVGieDKVS2q
         +rV2B2eLTF3CA94iTghv9ZMiarJkjKgqMGtsDJv9d4qriagoWA1nlyXTpUq4TGF7V1Zg
         DJv3LURlVwsA/yg99sUkn15e10A9TqYRSUSoG17ZzWuF224dqtaLIerP5pZVTdLRyDBr
         s7KZ3x93DOY256ZDlqP896Kti6M9K5so1bCwsBmhY3A49k5zrsTOilX2GFpYKQU9qDIW
         7OGd2LBvFdcpuc/8tzx0x3QE5oMlYKlAs8JTgnwDzLgF3NghGvdSnnBgsLjl0TDAa6yA
         Yc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682986717; x=1685578717;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bpzhEAd3sIcSUG6Bko9hFuyyeeC29520LX/NWwAxrs=;
        b=AbK/wxz4eeaUABnlT6w4NYAqM4k1EHKIy/dnW6P7Q4UQulmMn4Y65Hdy9m4pzcYITf
         uMHToNxPAZqanukiUZAwFqIPOV1HVKyosuEr53ohwKoct79cKQxZFWr/arMpZ5gGlTGw
         lCHJXmSM2LmvpjJRxH9Yc0kuBD5fEMZDzz+b4P8hATW3HtBxYlijEzQpKMG+c8NAYreI
         39+mVcmFPvNriKlh7hElRZxBNv36fLVaJjOh2dvIhBj+XOqYIX/lts5tJMKJkW2ruN3o
         Rqw+7WeBtIyvYbDjFxaUSQ2UBa054CrHeygxOVGYIHb8iF2Z2TkzMSNztoJRsSDTjxip
         x79g==
X-Gm-Message-State: AC+VfDzPVQl3sb0dqCLgXNyyh6p5UaW4PCZsASjMoPL0/uuy3V8h2V8l
	bqnsAQA9EXwbhkR6hj/KIl/6JA==
X-Google-Smtp-Source: ACHHUZ5DZfmkPpmD2UOszyKLyZ4QtDE+5TtD3j4JNOpqZz3UPgIQtFDU7GSVx3iOSuImOvqTO7gMcA==
X-Received: by 2002:a05:6a00:1301:b0:63d:3a21:b774 with SMTP id j1-20020a056a00130100b0063d3a21b774mr20662990pfu.27.1682986716904;
        Mon, 01 May 2023 17:18:36 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id x30-20020a056a000bde00b0063b806b111csm20319524pfu.169.2023.05.01.17.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 17:18:36 -0700 (PDT)
Date: Mon, 01 May 2023 17:18:36 -0700 (PDT)
X-Google-Original-Date: Mon, 01 May 2023 17:18:16 PDT (-0700)
Subject: Re: [PATCH v3] riscv: mm: execute local TLB flush after populating vmemmap
In-Reply-To: <20230417060618.639395-1-vincent.chen@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, vincent.chen@sifive.com, alexghiti@rivosinc.com, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-8488a1b0-fc27-4a74-b1d6-3b9975f8795f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_011842_324642_4AF71F4C 
X-CRM114-Status: GOOD (  24.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 16 Apr 2023 23:06:18 PDT (-0700), vincent.chen@sifive.com wrote:
> The spare_init() calls memmap_populate() many times to create VA to PA
> mapping for the VMEMMAP area, where all "struct page" are located once
> CONFIG_SPARSEMEM_VMEMMAP is defined. These "struct page" are later
> initialized in the zone_sizes_init() function. However, during this
> process, no sfence.vma instruction is executed for this VMEMMAP area.
> This omission may cause the hart to fail to perform page table walk
> because some data related to the address translation is invisible to the
> hart. To solve this issue, the local_flush_tlb_kernel_range() is called
> right after the spare_init() to execute a sfence.vma instruction for the
> VMEMMAP area, ensuring that all data related to the address translation
> is visible to the hart.
>
> Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/tlbflush.h | 7 +++++++
>  arch/riscv/mm/init.c              | 5 +++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index a09196f8de68..f9d3712bd93b 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -61,4 +61,11 @@ static inline void flush_tlb_kernel_range(unsigned long start,
>  	flush_tlb_all();
>  }
>
> +/* Flush a range of kernel pages without broadcasting */
> +static inline void local_flush_tlb_kernel_range(unsigned long start,
> +						unsigned long end)
> +{
> +	local_flush_tlb_all();

Why is this a global flush, istead of a range-based one?  We should 
probably make the same change for flush_tlb_kernel_range(), though 
that's not a fix.

> +}
> +
>  #endif /* _ASM_RISCV_TLBFLUSH_H */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0f14f4a8d179..bcf365cbbcc1 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1221,6 +1221,10 @@ void __init misc_mem_init(void)
>  	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
>  	arch_numa_init();
>  	sparse_init();
> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +	/* The entire VMEMMAP region has been populated. Flush TLB for this region */
> +	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
> +#endif
>  	zone_sizes_init();
>  	reserve_crashkernel();
>  	memblock_dump_all();
> @@ -1230,6 +1234,7 @@ void __init misc_mem_init(void)
>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  			       struct vmem_altmap *altmap)
>  {
> +	/* Defer the required TLB flush until the entire VMEMMAP region has been populated */
>  	return vmemmap_populate_basepages(start, end, node, NULL);
>  }
>  #endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
