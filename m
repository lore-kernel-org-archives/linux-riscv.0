Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057BCC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:13:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD832083B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 05:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iit/ENBt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hJB8RXwg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="LVGPZfXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AD832083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WsPjsAzPcRUv3RmrFyoczbZ0WouVrA1ZOBlQ8TBg9OA=; b=iit/ENBtI7ayWDQ7vM0Q9mbFL
	LiS7hwvFZxepQUprEcsfbiKZYpr+wDCPYb/Z0i1D6rPtUWAtBtYsIdNao4vH55P/qIkANEbOrtvMn
	UvPEYNSK1L5Et727FgvT/YFTltlE36iMIGUS0atAJkzBtsonsLkhIbUIT62HHFKGGt2et//adm3QW
	yL5hH/RuxGGlKZSdRkNuyWtwSCDJKm9zQZGpf0HYSR6CtA32cd6oK84lCP/dYZEN04vg5KZ4cdEW4
	/uqocdDqtm1k+UqJqepgPU2LfH8hbK8+hweP2JuaPxYjSQWXdstVsAng8M0vpEYWk9rVyJUlxzRkO
	JtKSW48Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaXac-0008PZ-72; Thu, 05 Nov 2020 05:13:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW4a-000145-CF
 for linux-riscv@merlin.infradead.org; Thu, 05 Nov 2020 03:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=a0nZYDo+CB6TegF98IJWvC66Pi+L/HwyZcY9j3Daq1w=; b=hJB8RXwgoYeMBVR/DQ/9PR6C7A
 IdSs4WfTviT2/yO73gp8H0mbSCIiHfHu1VOG7WOw95UiNBOEOee5Lu8VfG4okuFSzuYyv3j3q3Bcr
 yrO4Xy/Ndrjv1xMU/GBSttQHrn3EZPA6p/dZMw97mQ4YA7yyzUDMGiu1VIMqstlrs11oqRMJeLnxs
 iT3XhycadtAN+01VoHApzSCYkD6xu5nQmLhy5E7boHgCvLs6o8wFspOd/ntaBz10+t+fCihns1J/J
 jJi8uvSUeFoaVujsvAj9Wyws9rJS6OW9o+l8TYA6OOtlPDE0xc9sfsORw+85nfncFOn7G6jAnOZ4a
 PwWFgeVA==;
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaSMg-0005xN-KQ
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 23:38:57 +0000
Received: by mail-io1-xd42.google.com with SMTP id o11so317063ioo.11
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 15:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0nZYDo+CB6TegF98IJWvC66Pi+L/HwyZcY9j3Daq1w=;
 b=LVGPZfXnEEe0PxuGVdeEhrmM549qsPkmNywLDOHuGXHLa9ITAjuP0e0LQcdiN2qINs
 8Wat9PYnLvO2P+CCIWwaewexubKRK04XKlsykS5EQ4lpNU4xFUvCJRp16Iaq0Uouh1/y
 bhL5ia+m/XYcqspf6hohb4I8QjY71vnEaUJ6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0nZYDo+CB6TegF98IJWvC66Pi+L/HwyZcY9j3Daq1w=;
 b=R5OZ8/VqugWKyCUxfXDT9vMokBigzhNTawzqkiW5Qm7f7wA/M6NviHmyJhxov5778d
 G05/xZgkqPOWM4e1NxeSfRqCkMvSyf8x0MoSmMcoEKygUAqc7MK3SsNLbSoXAIP7hjdj
 EPYH+4bQifX0EJrXouYiwgQ6xe9d7069ASH9/iYiPI7SVbWsNtPy2yK77Dw/IsytMOkm
 mRPRAvldcrHQ7r/GEOap9HHGxcxlwxXthA3slPtwTZ09K/Z7CWf0Flfp8N06zF7i4Ufa
 0Z/QK//AP8tZL4w1fRmGuJRp3BJgopEiUFXND33YUPbBDQ9ejibp+3pG59CK7g52sATJ
 UXrA==
X-Gm-Message-State: AOAM5317YXGdKe5HY8WfWOjNpMwP/ua6aLGacF6dNPHAwalvHpWdFpl3
 mtLA3E2PRCk0p8WKebp3tzsQMI9WGv4qfK6f+Rj1
X-Google-Smtp-Source: ABdhPJxxfSuP85Z67d1ZPevhNWGC7WnEj5kO3osENOwbpcPDMXVGob2vWq1q34QpbmRT0XgpjcRbLjzTYs+C8MLzlGc=
X-Received: by 2002:a05:6602:2d93:: with SMTP id
 k19mr312922iow.51.1604533068376; 
 Wed, 04 Nov 2020 15:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20201104063713.3039035-1-anup.patel@wdc.com>
In-Reply-To: <20201104063713.3039035-1-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 4 Nov 2020 15:37:37 -0800
Message-ID: <CAOnJCUL0-j+rvii65y67Vkp9Th1b_msz4P3eD4DR+qGn+yMdRQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Use non-PGD mappings for early DTB access
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_233854_862457_D7080983 
X-CRM114-Status: GOOD (  20.84  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 10:37 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Currently, we use PGD mappings for early DTB mapping in early_pgd
> but this breaks Linux kernel on SiFive Unleashed because on SiFive
> Unleashed PMP checks don't work correctly for PGD mappings.
>

Not sure why this is an issue with Unleashed only. Microchip Polarfire
SoC seems to work fine with early DTB pa as 0x88000000.
However, unleashed fails to boot if the DTB is loaded any address
below 0xC0000000 and it is mapped via PGD.

> To fix early DTB mappings on SiFive Unleashed, we use non-PGD
> mappings (i.e. PMD) for early DTB access.
>
> Fixes: 8f3a2b4a96dc ("RISC-V: Move DT mapping outof fixmap")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/mm/init.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ea933b789a88..0d13d0c36a7d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -297,6 +297,7 @@ pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>  #define NUM_EARLY_PMDS         (1UL + MAX_EARLY_MAPPING_SIZE / PGDIR_SIZE)
>  #endif
>  pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
> +pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>
>  static pmd_t *__init get_pmd_virt_early(phys_addr_t pa)
>  {
> @@ -494,6 +495,18 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>                                    load_pa + (va - PAGE_OFFSET),
>                                    map_size, PAGE_KERNEL_EXEC);
>
> +#ifndef __PAGETABLE_PMD_FOLDED
> +       /* Setup early PMD for DTB */
> +       create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> +                          (uintptr_t)early_dtb_pmd, PGDIR_SIZE, PAGE_TABLE);
> +       /* Create two consecutive PMD mappings for FDT early scan */
> +       pa = dtb_pa & ~(PMD_SIZE - 1);
> +       create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
> +                          pa, PMD_SIZE, PAGE_KERNEL);
> +       create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
> +                          pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
> +       dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
> +#else
>         /* Create two consecutive PGD mappings for FDT early scan */
>         pa = dtb_pa & ~(PGDIR_SIZE - 1);
>         create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> @@ -501,6 +514,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
>                            pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
>         dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
> +#endif
>         dtb_early_pa = dtb_pa;
>
>         /*
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

FWIW: Tested on Unleashed & Polarfire SoC.
Tested-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>

@palmer: Can you consider this patch in next rcX PR ?

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
