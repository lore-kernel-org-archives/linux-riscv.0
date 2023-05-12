Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4FEC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QMYajFShqORZW/UcNNDzTLyHcTQStHnghl0QX2XctM=; b=UjQR6va14Uwid7
	FjCgWGJg/pihL6I17C+VRQdnoofYWxjJjKfXJPg0sx1Foi4Juggo957BMqshTSipY4vJdO7wqfLJL
	8KO54BC5zSIkzWYtFwzf8avPAJJZbhbM1ibyf//XVNxk8yc5MDslEgabhd/SBlWrNLwEEOX6FYtlL
	zJFlAIVn0pLCZG+adMIl2CvG/nG7KAbR6yzBtS//ckZaxPPzSKYrjsFSqGspbBwsAmDIYlley4EnS
	tUoKCLk2lGO9PdhS7p/cWysdoQ8fc/xLP0eJRM/2W4k1rMFpPEjCAcU3bbTAX+trgb7ZwkvtnGPs3
	bfWuPxJDYb9TwFG6l+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPdK-00BXQm-1h;
	Fri, 12 May 2023 10:04:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPdH-00BXPX-1u
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 10:04:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f475366522so20994955e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 03:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683885853; x=1686477853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5k2l5fKC/kAcO6QoAe/Scij0gEwxg3J4hvkX6WEYt8=;
        b=U2K+QCCYMTbMOx5nuEmPk09hhpXHEobF+GS8/+WIFKUFidLuqkmUBWH9ePJuvnK6GJ
         dwQz8aiGKzQVJ3XyzFjnMzJBKOauQuCnRn39RHR8K7Ltb/CRwoaU/TsklAz9X3Kd+nSB
         Fj2cPqU+1wYosaU3X84m/e90WCVTJdLGxxS+6HJ9fhHiIxP6JzP3vN4Wi66vhoZMR/z/
         SuhzFd9fT0oYeYHuATldvndvxDvgTWWmquYlQYCvK4HDHAVELmRMlzruUvyi0NfEFSQq
         QaoV1gwWqoRSEj/NzdKCP2WB9rPjg2ZDxDY5G5EVdRGTPEErO3+gTdo66KkauIyu44UN
         m8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683885853; x=1686477853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5k2l5fKC/kAcO6QoAe/Scij0gEwxg3J4hvkX6WEYt8=;
        b=k5vxsvOaTglO4+MtoA+91Xw1DLlwBIsi8PGqp7157EjWS3eg88hx3iUnZR9WQEWbPo
         NbEyQsQVEzmbx9n+oCXw36iGHin91haJgcPb3wssWrowcKNkXKCwyhzut42cK4pSQbAb
         ID319VZiKMG6g35vZGH4xEpr4XXZotXSQlRVn9IFntSr1W8hxW6ZBR4lO/gQODfy+KUY
         KjgLr0oLGMUSVT98GXIT9dz6FZ9HkVvZEzD3rqlYsWQn7Mkba2BjVkbBzOk1ZLriJOsB
         G6ojyRKVnGQNWEYOtB7Hxp1V/Abe5eRwA9Szu8bTmQRT61o1HDxXepiAD+dV+x5hy7hw
         583w==
X-Gm-Message-State: AC+VfDw063lpQ52S8/YDHlrRMxmutsgEqY2fXQlIHb7LP1DAJ7MEGKvj
	qh978b64Z0Ts+oynO7J9TPuWz1cqxM6LfbUuZrU=
X-Google-Smtp-Source: ACHHUZ5F076PlqDBrtf/9wR4IiLKB5VaY6yX5ljlXqZBjGFcqqkCbJjjy0MXLBc/NeTvJB3rgxVVSQ==
X-Received: by 2002:a1c:6a1a:0:b0:3f4:2365:e5ac with SMTP id f26-20020a1c6a1a000000b003f42365e5acmr12893140wmc.13.1683885853178;
        Fri, 12 May 2023 03:04:13 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm15262963wmq.33.2023.05.12.03.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 03:04:12 -0700 (PDT)
Date: Fri, 12 May 2023 12:04:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Amma Lee <lixiaoyun@binary-semi.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	xiezx@binary-semi.com
Subject: Re: [PATCH v2] riscv: optimize ELF relocation function in riscv
Message-ID: <20230512-a73001a0f4cfcf5f0e68d898@orel>
References: <1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1683881513-18730-1-git-send-email-lixiaoyun@binary-semi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_030415_633672_C6240BAF 
X-CRM114-Status: GOOD (  32.21  )
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

On Fri, May 12, 2023 at 04:51:53PM +0800, Amma Lee wrote:
> The patch can optimize the running times of "insmod" command by modify ELF
> relocation function.
> When install the riscv ELF driver which contains multiple
> symbol table items to be relocated, kernel takes a lot of time to
> execute the relocation. For example, we install a 3+MB driver need 180+s.
> We focus on the riscv kernel handle R_RISCV_HI20 and R_RISCV_LO12 type
> items relocation function and find that there are two for-loops in this
> function. If we modify the begin number in the second for-loops iteration,
> we could save significant time for installation. We install the 3+MB
> driver could just need 2s.
> 
> Signed-off-by: Amma Lee <lixiaoyun@binary-semi.com>
> Reviewed-by: Conor Dooley <conor@kernel.org>
> 
> ---
>  arch/riscv/kernel/module.c | 53 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 35 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 55507b0..1683c1d 100755
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -385,9 +385,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  
>  		if (type == R_RISCV_PCREL_LO12_I || type == R_RISCV_PCREL_LO12_S) {
>  			unsigned int j;
> -			/*Modify the j for-loops begin number from last iterates end value*/
> +
> +			/*

whitespace issue here

> +			* In the second for-loops, each traversal for j is
> +			* starts from 0 to the symbol table item index which
> +			* is detected. By the tool "readelf", we find that all
> +			* the symbol table items about R_RISCV_PCREL_HI20 type
> +			* are incrementally added in order. It means that we
> +			* could interate the j with the previous loop end
> +			* value(j_idx) as the begin number in the next loop;
> +			*/
>  			for (j = j_idx; j < sechdrs[relsec].sh_size / sizeof(*rel); j++) {
> -			/* Modify end */
>  				unsigned long hi20_loc =
>  					sechdrs[sechdrs[relsec].sh_info].sh_addr
>  					+ rel[j].r_offset;
> @@ -420,22 +428,30 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  					break;
>  				}
>  			}
> +
>  			if (j == sechdrs[relsec].sh_size / sizeof(*rel)) {
> -				if(j_idx == 0){
> +				if (j_idx == 0) {
>  					pr_err(
>  						"%s: Can not find HI20 relocation information\n",
>  						me->name);
>  					return -EINVAL;
>  				}
> -				
> -				
> -				for (j = 0; j < j_idx; j++){ 
> +
> +				/*

also here

> +				* If the last j-loop have been traversed to the
> +				* maximum value but never match the
> +				* corresponding symbol relocation item, the
> +				* j-loop will execute the second loop which
> +				* is begin from 0 to the prerious index (j_idx)

previous

> +				* unless the previous j_idx == 0;
> +				*/
> +				for (j = 0; j < j_idx; j++) {
>  					unsigned long hi20_loc =
>  						sechdrs[sechdrs[relsec].sh_info].sh_addr
>  						+ rel[j].r_offset;
>  					u32 hi20_type = ELF_RISCV_R_TYPE(rel[j].r_info);
> -				
> -				
> +
> +

While fixing this whitespace, we could remove the redundant blank line too.

>  					/* Find the corresponding HI20 relocation entry */
>  					if (hi20_loc == sym->st_value
>  						&& (hi20_type == R_RISCV_PCREL_HI20
> @@ -447,36 +463,37 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  						unsigned long hi20_sym_val =
>  							hi20_sym->st_value
>  							+ rel[j].r_addend;
> -					
> -				
> +
> +

also here

>  						/* Calculate lo12 */
>  						size_t offset = hi20_sym_val - hi20_loc;
> +						/* Calculate lo12 */

stray copy+pasted line?

>  						if (IS_ENABLED(CONFIG_MODULE_SECTIONS)
>  							&& hi20_type == R_RISCV_GOT_HI20) {
>  							offset = module_emit_got_entry(
>  								me, hi20_sym_val);
>  							offset = offset - hi20_loc;
> -				
> +

need to just remove this blank line

>  						}
>  						hi20 = (offset + 0x800) & 0xfffff000;
>  						lo12 = offset - hi20;
>  						v = lo12;
> -					
> +

same here

>  						break;
>  					}
>  				}
> -				
> -				if (j == j_idx)
> -				{
> +
> +				if (j == j_idx) {
>  					pr_err(
>  						"%s: Can not find HI20 relocation information\n",
>  						me->name);
>  					return -EINVAL;
>  				}
> -				
> -				
> +
> +

should just remove both the blank lines above

>  			}
> -			
> +
> +			/* Record the previous j-loop end index */
>  			j_idx = j;

Huh... what did I miss? I went through the whole patch but only see
formatting changes (and more opportunity for formatting changes).
Where's the actual change?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
