Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EEBC2B9F7
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 22:50:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E5B613D2
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 22:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E5B613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rkd4fnu4Ir71pLWT0hTfGavLHs8EATI75s7IwFDavUM=; b=FdkHO8OSO/0iKG3PZp4IrlcPd
	OIWI3s4NKnS3C5uRyeh+nZYJGSwyHkauGYC8g761fWGzkfWvosCfqFvIQ0D2PM02uttPEbqRi6BFJ
	n1vj7J/X9u8gY41FVWLuaNbjczHWuCL+JHSPS9dRJHWptZ3JmdpZIh1+DJPmH3gCrG51do+II5M5T
	kQLHGjju9wuH+yRSmhMr+4xE1PBNGmAJvmSMhfF070CDu4Qwwk0DuUkG8cj/3Y4NMitLxqgBDY7S3
	H+sBpvwQ4rVXV96Nkg0rvjdje4zHLoYygUFuF3A8w0DxjzOXaPoZQE0hAjyIrJspxjG1DxLUd6ucH
	LdQcn3F5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llJOf-002D23-AD; Mon, 24 May 2021 22:50:05 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkxCV-000bZX-TE
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 23:08:06 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so10183430pjp.4
 for <linux-riscv@lists.infradead.org>; Sun, 23 May 2021 16:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bqwY39AFMBrbwig3rQXemXwwiBs2O/Q1J2TqYuZJo1c=;
 b=FNI3c7igaRKGetKvdNZNG48WO8UHmCkzZXZLs3HlffPB/AB+5NR/bbrL58u1itIpFN
 CBUCfOPbQgiOuWBWbbRtespgYed8HwgKT9+PrQpRNfpX/bU2vhvM/2r5NquaIhmlg/TM
 TvqUikX8wUOmBO54974kJUiXPgOXNz8JRXHweOj4nVYthlZD9bRPuQEHZFpL26y++M/R
 lnHhY+6o5+Sw+0qSym+0EwMceQkjDvbr8KI8lLILcz0cs6bCiaNZBcqtxWvb1CW36ZI1
 2wHoRrdd++ZCptGB28jHpsaiTQ4MdM8BZczJ1UMI2cLVqHUcgf7y0XmP5ony8xccsvga
 rapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bqwY39AFMBrbwig3rQXemXwwiBs2O/Q1J2TqYuZJo1c=;
 b=mPsluzLjk75xsYQF5lsIL3SmSNmJacKW2PPJi+0RIGvFH/bo9euZFtu0Y9yHtGdOiY
 qPSe3vJ/+/wosd2kqm9kKjVxuHT1CwG4+t9wM9NwKKcfKJfcBLjO2+AAk8B7shOYuJmw
 /GZ71a3zEFhkbJBX5W4T906UHZPmj3neIjL6RcDsVu9HsOU6HVeyQeO1Sm7lo7iMRRms
 ad36rwPbfHaMzF3PYb4b9lYdH2dtlGd8FWyqbbyJ1vUdVOFnhKmvARulCHUbRdE1j8aD
 sHm/Ho5te3guNgeRFcWeZZEwtpC+HRVXx0H2WYmP6prqJ2jac/TUnvLJOrzu9klBIWVQ
 HgmA==
X-Gm-Message-State: AOAM530uyA3XW+j4kzL2KvaU+TD1+ODFVjEWB0QLQURjD3VGyQe2erAV
 OW3MFt6aUdp3QseDG2CPCLG8ix7SxWEhrg==
X-Google-Smtp-Source: ABdhPJxP4JthaP/hcHChPlvNU+ynfvFfWo01KUzvv/Zj/mmrdzdKq5cp81Kkka9ZUV/O9plevNntkg==
X-Received: by 2002:a17:90a:590d:: with SMTP id
 k13mr22391629pji.68.1621811278357; 
 Sun, 23 May 2021 16:07:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id mv15sm8543882pjb.25.2021.05.23.16.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 16:07:57 -0700 (PDT)
Date: Sun, 23 May 2021 16:07:57 -0700 (PDT)
X-Google-Original-Date: Sun, 23 May 2021 15:53:48 PDT (-0700)
Subject: Re: [PATCH] riscv: Move setup_bootmem into paging_init
In-Reply-To: <20210510114222.42195-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, anshuman.khandual@arm.com,
 wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-3af958e9-72a7-4f6f-97cd-3b196d3400e2@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_160803_970785_CC8218DE 
X-CRM114-Status: GOOD (  16.91  )
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

On Mon, 10 May 2021 04:42:22 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> Make setup_bootmem() static.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 1 -
>  arch/riscv/kernel/setup.c        | 1 -
>  arch/riscv/mm/init.c             | 3 ++-
>  3 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9469f464e71a..2017794d0e64 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -533,7 +533,6 @@ extern uintptr_t _dtb_early_pa;
>  #define dtb_early_pa	_dtb_early_pa
>  #endif /* CONFIG_XIP_KERNEL */
>
> -void setup_bootmem(void);
>  void paging_init(void);
>  void misc_mem_init(void);
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 03901d3a8b02..4db4d0b5911f 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -276,7 +276,6 @@ void __init setup_arch(char **cmdline_p)
>  	parse_early_param();
>
>  	efi_init();
> -	setup_bootmem();
>  	paging_init();
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
>  	unflatten_and_copy_device_tree();
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4faf8bd157ea..136d0342b147 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -119,7 +119,7 @@ void __init mem_init(void)
>  	print_vm_layout();
>  }
>
> -void __init setup_bootmem(void)
> +static void __init setup_bootmem(void)
>  {
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>  	phys_addr_t vmlinux_start = __pa_symbol(&_start);
> @@ -866,6 +866,7 @@ RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
>
>  void __init paging_init(void)
>  {
> +	setup_bootmem();
>  	setup_vm_final();
>  	setup_zero_page();
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
