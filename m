Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40077CCA47B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 01:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hSDGYZHXdb7RoffaO0LjDJOvIMwapxE5OkbNDC5holA=; b=LgMxlbuoe+qzSwzXwQEA1si8Mr
	lZAYItaEeEhHZofu/WDr6hjNTPI6U9nULELrjvtDygppjspt8/A8K+WG690r2r/31cb/1L7BWI23L
	JTyBJwOCxACjatQtuVB3g+NZNIuDfdQLPZTVi6SutYhbvTgrxYIVuYn5cIaGpd411tPz3L4uWVx8O
	YXUcf8Sybvi5FrLxCM0lwwXMLrpAt3BVdWsn/YnliQHHWYcWpROGyZpghhUnXVhVuki3CALQFEkRY
	X6WRzzMIOU+qSelvawSEFaePzOaCPzFdNrVY/aUZvkwRCzIOTNu896XBHTaU9fojNU9eh3c40Ipad
	CMm+KTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwwD9-005KG9-Dy; Fri, 03 Jun 2022 01:34:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwwD5-005KEI-SP
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 01:34:45 +0000
Received: by mail-pf1-x42d.google.com with SMTP id g205so6096299pfb.11
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jun 2022 18:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Gm53BT7MDI0h04lUx/Z9qg/q0JdibF254ksd3FSQzS0=;
        b=RihMf5zvQKoxS3UikQN41JNEW5ejVZG1gzhMmEhfJ99jOAB1zQeWutzq5DZRWl/S5c
         Y98wCrxW2sf/LSckrraDaWgERlqSJ+HGWDLjrOP0iPb9cM3Mw3yjUS0U4BmRUEaL1KCz
         6yBPZxxjJQ26aCqySHaPGfyMHPsk1+Hm99Nn/iJa2tRVDtozwH9Jg4pNs5p3cczNKzPP
         xeopEMW6ozdmHNexHZyG9nA28ov7suqGNcC7cBeb+9L3so48G4J20Qq+MsZG+6gRNb2S
         VC0Sd94otPff43edaASoc86nDVQTcFjPLmCn816CQQ4VNY4zBvtCqFxmhFXf3TGy9TE1
         RTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Gm53BT7MDI0h04lUx/Z9qg/q0JdibF254ksd3FSQzS0=;
        b=qOQpJPZ0obqHOTqffNly7s34QYaz6+LuBPCrOuTZzQbxPt1VBakeuipXouATxji5zm
         jSNH+ieqyXh+6UlJ7vk9Rq4zHjI5HNkvB5YY1+rt+IPj2X5OEYkNdFb56sycCAl0M4ui
         oy5IZfONzlsohK+X7VODo4It9cAn0/vmTkz1IfrWCZ90OxaZtvCAEGpex+KtNErh6Top
         I3ICi+czyFOhXg78MNnhr936Ks8acq2YWynHSKqUE/ka4adIWOhvrQ3hBNrLnNesdhNf
         tz6Uz2ftKAK7CpAA5YNkREsQFOIUaI1PgKdjrtqpyg+E61AwcPo2FIos96zZbfFSWOQJ
         E2Vg==
X-Gm-Message-State: AOAM531SdkImymZgwKDOMWIuQSOCb58jXKD5G5eX8ZIunrVoXzstQNBJ
	4w59iEny+D4h791uTpG4qM2kUg==
X-Google-Smtp-Source: ABdhPJz0q60A75VG204nrUdMksgumztgNgvXrccsvB2/VYrODvIYn1XTipjVkGeblMZiDbgoYbphvQ==
X-Received: by 2002:a63:84c3:0:b0:3fc:8c46:2447 with SMTP id k186-20020a6384c3000000b003fc8c462447mr6554374pgd.285.1654220080533;
        Thu, 02 Jun 2022 18:34:40 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id k1-20020a17090a590100b001e33e264fd6sm3892645pji.40.2022.06.02.18.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 18:34:39 -0700 (PDT)
Date: Thu, 02 Jun 2022 18:34:39 -0700 (PDT)
X-Google-Original-Date: Thu, 02 Jun 2022 15:54:05 PDT (-0700)
Subject: Re: [PATCH v2] riscv: mm: init: make pt_ops_set_[early|late|fixmap] static
In-Reply-To: <20220516143204.2603-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, anup@brainfault.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-6828d6a5-d8c6-43f7-8145-311bdd5188d1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_183444_182154_8AA37E9C 
X-CRM114-Status: GOOD (  21.17  )
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

On Mon, 16 May 2022 07:32:04 PDT (-0700), jszhang@kernel.org wrote:
> These three functions are only used in init.c, so make them static.
> Fix W=1 warnings like below:
>
> arch/riscv/mm/init.c:721:13: warning: no previous prototype for function
> 'pt_ops_set_early' [-Wmissing-prototypes]
>    void __init pt_ops_set_early(void)
>                ^
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>
> since v1:
>  - collect Reviewed-by tag
>  - move out from the static key series as a separate patch
>
>  arch/riscv/mm/init.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 05ed641a1134..5f3f26dd9f21 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -849,7 +849,7 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
>   * MMU is not enabled, the page tables are allocated directly using
>   * early_pmd/pud/p4d and the address returned is the physical one.
>   */
> -void __init pt_ops_set_early(void)
> +static void __init pt_ops_set_early(void)
>  {
>  	pt_ops.alloc_pte = alloc_pte_early;
>  	pt_ops.get_pte_virt = get_pte_virt_early;
> @@ -871,7 +871,7 @@ void __init pt_ops_set_early(void)
>   * Note that this is called with MMU disabled, hence kernel_mapping_pa_to_va,
>   * but it will be used as described above.
>   */
> -void __init pt_ops_set_fixmap(void)
> +static void __init pt_ops_set_fixmap(void)
>  {
>  	pt_ops.alloc_pte = kernel_mapping_pa_to_va((uintptr_t)alloc_pte_fixmap);
>  	pt_ops.get_pte_virt = kernel_mapping_pa_to_va((uintptr_t)get_pte_virt_fixmap);
> @@ -889,7 +889,7 @@ void __init pt_ops_set_fixmap(void)
>   * MMU is enabled and page table setup is complete, so from now, we can use
>   * generic page allocation functions to setup page table.
>   */
> -void __init pt_ops_set_late(void)
> +static void __init pt_ops_set_late(void)
>  {
>  	pt_ops.alloc_pte = alloc_pte_late;
>  	pt_ops.get_pte_virt = get_pte_virt_late;

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
