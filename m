Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CF2C48BE0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 21:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A034613C6
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 21:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A034613C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eY4IxMfzKiOXSDFsRLIldMyV9M+PM1jqrvQEGEAnyyA=; b=GKzACqeOlF+Nvs1bc2UJdoZIA5
	4uGgZmPkkWIq1I+Kt9+NP0Yk7C1Pgv5ifhXTlGL+OoEtDoq5bP2H8N+lcPJpabuh7WNqmJqmO7Q9v
	cU6ciO94rcA1XnN/0RiNJ+JIMXOJjitmTFEbSoCWxO47ddTN0D+qgKvLBr2xNsBufGD0y6OHBY7nd
	Ilfkf7L8CCZanwsnN4e9hTaf/8V3MDN/HlrAI5UrTPWR8CCywvrNrC89x3yFFh0va1jLiCvVUnRCs
	xXHno3zPsaR7YnMaygZQnSe+3eykS36V5MvYZaN4Q1rX99oIbfnzcHXGzgkKE5GPSXoeRdHToZdJQ
	qE5nKTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lroYS-007BWI-0b; Fri, 11 Jun 2021 21:19:04 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lroYO-007BVB-Ck
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 21:19:02 +0000
Received: by mail-pg1-x52d.google.com with SMTP id l184so3441761pgd.8
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 14:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=oNHdkGnW4s/cwQAMvpIi4nzYrmN3D/e5k9vp4HEw1qM=;
 b=Q1CcwLQWdKawmczlf8DL2PuNz7wFoi8dNJHProcDQR69NLxLfxB1uZl9EpcKQo1K7Q
 jqjv/YISRHD7if+Sk2JYh9gfw55t5fPlqt9LH5FUXUGd/eBaze3p1lDU0WoBkcU7Dri0
 2y9wcOXOHc087Os0DzeyMFfmMdsqk890qc3SuL37DXyDfdAfRQtgXIdrOUoiUO+nUn7Q
 mqa26C4BImYN0vCShTMm46G8cPZB5obMjEO1T8eWWQ7F2noIoPalwnvbtmr6qnVDK44i
 OMbKF+B+XB8FMLFdPSEC1aM7UL9wMNimik0ElrdKYxKpTHwK8Vt6cwJUFPhBUNlvzvG2
 cYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=oNHdkGnW4s/cwQAMvpIi4nzYrmN3D/e5k9vp4HEw1qM=;
 b=ROARvkm1EAckleF/4wGamQqMS1dPe/E/q6XzrLM5S+ZkvbVYekIfoGlJde8q9f//8p
 D/cxJnAsWYauImVIY7BKNoZaJ+KMt6/wAq7r+6oCYSzLcUoS5PNS2viUQtrZ3+Pv27Mo
 FkQ1MFZO7ncqN7DY7MBxH0Antiq0PXO7+jK0ejMLnJVMZ21Ojb+plFxILp/ErkmBF936
 Yg0O5OepbCU0PQypxsUiwEc88fAyzSAY4/DqsmdDECVeJbbbmiI22tFtYaiH2LYGZ0SC
 KJBdNLejoXgQptmYT0+GoxWyKiTRokVd2cKR85d4YYaB70swsBjYKXzJmm9odtLio8UA
 fzrQ==
X-Gm-Message-State: AOAM531Q6TLZPkQrTSbUNwTCvlRb+3S0g4IkpNY9nC2KYKEgN8QGXkNT
 UFJ8uCyRkxzpiEoii2u2A9YeiIbc3bqcl44b
X-Google-Smtp-Source: ABdhPJzfNMQXqDTRiug79ZXHSQsWcCt3E0IdcKHfct3hbEu/fDDxxPmdwfX43OXCNC5+UB2GkGxUEg==
X-Received: by 2002:a62:ea03:0:b029:2e7:8445:243c with SMTP id
 t3-20020a62ea030000b02902e78445243cmr10138808pfh.54.1623446339089; 
 Fri, 11 Jun 2021 14:18:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 23sm5885074pjw.28.2021.06.11.14.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 14:18:58 -0700 (PDT)
Date: Fri, 11 Jun 2021 14:18:58 -0700 (PDT)
X-Google-Original-Date: Fri, 11 Jun 2021 14:18:51 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: Add mem kernel parameter support
In-Reply-To: <20210602085517.127481-2-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-979cc98c-d1b7-4710-92b5-3d041bd27ce7@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_141901_300701_5E045E2A 
X-CRM114-Status: GOOD (  25.41  )
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

On Wed, 02 Jun 2021 01:55:17 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> The memblock_enforce_memory_limit() could change the memblock
> range, so move the dram_end assignment after it in bootmem_init(),
> then support mem= cmdline.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/mm/init.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 17f2e1da2b3d..ce61510a08c0 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -127,19 +127,39 @@ void __init mem_init(void)
>  	print_vm_layout();
>  }
>
> +/*
> + * The default maximal physical memory size is -PAGE_OFFSET,
> + * limit the memory size via mem.
> + */
> +static phys_addr_t memory_limit = -PAGE_OFFSET;
> +
> +static int __init early_mem(char *p)
> +{
> +	u64 size;
> +
> +	if (!p)
> +		return 1;
> +
> +	size = memparse(p, &p) & PAGE_MASK;
> +	memory_limit = min_t(u64, size, memory_limit);
> +
> +	pr_notice("Memory limited to %lldMB\n", (u64)memory_limit >> 20);
> +
> +	return 0;
> +}
> +early_param("mem", early_mem);
> +
>  void __init setup_bootmem(void)
>  {
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>  	phys_addr_t vmlinux_start = __pa_symbol(&_start);
> -	phys_addr_t dram_end = memblock_end_of_DRAM();
>  	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
> +	phys_addr_t dram_end;
>
>  #ifdef CONFIG_XIP_KERNEL
>  	vmlinux_start = __pa_symbol(&_sdata);
>  #endif
> -
> -	/* The maximal physical memory size is -PAGE_OFFSET. */
> -	memblock_enforce_memory_limit(-PAGE_OFFSET);
> +	memblock_enforce_memory_limit(memory_limit);
>
>  	/*
>  	 * Reserve from the start of the kernel to the end of the kernel
> @@ -154,6 +174,7 @@ void __init setup_bootmem(void)
>  #endif
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>
> +	dram_end = memblock_end_of_DRAM();
>  	/*
>  	 * memblock allocator is not aware of the fact that last 4K bytes of
>  	 * the addressable memory can not be mapped because of IS_ERR_VALUE

I'm not sure why, but this patch won't apply.  I've applied it manually, 
it's on for-next (along with the #1).

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
