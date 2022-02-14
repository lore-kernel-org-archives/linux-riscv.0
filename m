Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA66AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yk5CMX+HT9+O2Vo7tu2MMS8a6OkVlFrk6v21gz+9my4=; b=zARlXtbmVot4Z7
	k1QIsA8ar97sm24p67BsCneA5WBQKRWAFdVkyW2p4Fn1vrJLk3KoFr8L7qSzLWkN4KIixYr19Xc+x
	WnUT7bUTcNtY8cCFllqnIb9j8oknY3ncEUNydLvOP5b/guqZ4dMlEpcmkn7gOXoAO1dxJv1dh3WAS
	ohTklQzAzaCiguaa0rfZJAIsjyN2uVQyg308fyuxwVG0wj0xPGJGLIItFaZWx9EVfi28PTO1MksUU
	od1e8/u5u5bTS//APdSjlKqrEk1LnA9bTnzesK1ihNtqAEAI14xK+PHARWjutbE7JdsNLA8lWX1Cx
	o1NLorHUaw1z27Nho6bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJX0V-00E2TU-8C; Mon, 14 Feb 2022 08:46:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWvQ-00E05k-77
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:41:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id z16so6135686pfh.3
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3PDuWpWatMEsaSvbNwsNqzkAPf6BcghIhJSFC8jSD30=;
 b=gzY3pqJhek5FzBlOdPIHTO6Zi2K/2OsE1k4GoPy0cxDgZ5eiMZT0IOILUlSj/aEB4B
 RjD+XDpKRlfGfkd/XwIm9iSe4Y+3nP7SOyYnzFkzxTVfZMbOltHxTQIQwcsjUxgvliuV
 RbJXxs85zzqTaHQWz1//TsTD6s0IGS66ul3McsyVMsXz87heLAK41x4z7Fg3uQQnq8gs
 jVm4hmClESlQUful+1F5d92AmYMkmuI1xGetK5qucl6SvgNaSvpmZ39gw9Fb73LQQZT/
 RccWidsx/F+CL0uIRPkA+2xst5I/kC1auwLVRK+xr2e8w3MCZvct39/rBc4n3iiEZo/U
 mw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3PDuWpWatMEsaSvbNwsNqzkAPf6BcghIhJSFC8jSD30=;
 b=PXdTSi79I01NwK6DPpKrF7ziTAhSKz8olEGhzT17h1nklWKB3FVrDyG1DOJjPiUAk4
 hPyG7m5SHQ+bMtu9o2Oo0zMy7GveWhBY0SXXSG6tFqIyaLe7Ru85m6nmi8PNRb7sP31n
 HeUTRnj7iRyi8a+tCAHJLfIh5p1dRIxCobnhJFqq4jBldIBOkmvIA8AHIxs1WGcrGnxz
 0hRSqUJNpdfDdzZ8S9EhnZljPXHMs8Jc42b4B5KGzCpcKk1ClXN4XEZQq8rsoNn9OQHe
 asTbQ/Vvjg78rNDwPH1dBqWclJh47AQFuiV+H6SOLsMk5dWl97FvqpHWnvRaqclB4hM5
 tG5A==
X-Gm-Message-State: AOAM530McgbVHbagjZVgE9AcIw0FRrP5ypqJUOyrJ+0kYFBZVdodzWrT
 mIDFg2Hs+Yi3gfXuwFyNYDOdWw==
X-Google-Smtp-Source: ABdhPJzmEmYGRRFkNZU0hWCXQ2YmoXneh7/sz9+wMy0j+UOb40vkZ+zxFyd9qfzrI5KxLYmYagM5Pg==
X-Received: by 2002:aa7:900d:: with SMTP id m13mr13355552pfo.14.1644828093877; 
 Mon, 14 Feb 2022 00:41:33 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.7.17])
 by smtp.gmail.com with ESMTPSA id 13sm22335469pfx.122.2022.02.14.00.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:41:33 -0800 (PST)
Date: Mon, 14 Feb 2022 14:11:24 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>
Cc: linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Anup Patel <apatel@ventanamicro.com>, stable@vger.kernel.org
Subject: Re: [PATCH] riscv/efi_stub: Fix get_boot_hartid_from_fdt() return
 value
Message-ID: <20220214084124.GA11866@sunil-ThinkPad-T490>
References: <20220128045004.4843-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128045004.4843-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_004136_317207_1286F877 
X-CRM114-Status: GOOD (  20.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Ard,
   Could you please take this patch? Heinrich and Atish have added RB
   tag. Let me know if I need to do anything.
Thanks
Sunil

On Fri, Jan 28, 2022 at 10:20:04AM +0530, Sunil V L wrote:
> The get_boot_hartid_from_fdt() function currently returns U32_MAX
> for failure case which is not correct because U32_MAX is a valid
> hartid value. This patch fixes the issue by returning error code.
> 
> Fixes: d7071743db31 ("RISC-V: Add EFI stub support.")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/firmware/efi/libstub/riscv-stub.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 380e4e251399..9c460843442f 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -25,7 +25,7 @@ typedef void __noreturn (*jump_kernel_func)(unsigned int, unsigned long);
>  
>  static u32 hartid;
>  
> -static u32 get_boot_hartid_from_fdt(void)
> +static int get_boot_hartid_from_fdt(void)
>  {
>  	const void *fdt;
>  	int chosen_node, len;
> @@ -33,23 +33,26 @@ static u32 get_boot_hartid_from_fdt(void)
>  
>  	fdt = get_efi_config_table(DEVICE_TREE_GUID);
>  	if (!fdt)
> -		return U32_MAX;
> +		return -EINVAL;
>  
>  	chosen_node = fdt_path_offset(fdt, "/chosen");
>  	if (chosen_node < 0)
> -		return U32_MAX;
> +		return -EINVAL;
>  
>  	prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
>  	if (!prop || len != sizeof(u32))
> -		return U32_MAX;
> +		return -EINVAL;
>  
> -	return fdt32_to_cpu(*prop);
> +	hartid = fdt32_to_cpu(*prop);
> +	return 0;
>  }
>  
>  efi_status_t check_platform_features(void)
>  {
> -	hartid = get_boot_hartid_from_fdt();
> -	if (hartid == U32_MAX) {
> +	int ret;
> +
> +	ret = get_boot_hartid_from_fdt();
> +	if (ret) {
>  		efi_err("/chosen/boot-hartid missing or invalid!\n");
>  		return EFI_UNSUPPORTED;
>  	}
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
