Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7E5C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0b/vwqgKGjiktnwe1ff6uetgvmmZQInbgZzLikrzGJQ=; b=sKvP1uswIgIQUC
	VE7v4sPT/zTbkjmlecYISCNa0v9kPN+HQzIx4Ee13TebU4FEWiL8XY/lANixq3TpJirdJ9akjEL06
	N/doraAgWx2CmY9zrfLdcWVWqdfr7gaI0zlCw7JMsf5b1oiWvXdVS5dE8NbcJYgctT7wClxWNxha8
	jW2XULjfScpK0moYDOultLeeF4b5uxP5t8ow6GaeLr3xMXPAim5LCkrGVOVWbw6rVOyzEQrfnpBZw
	439dXJm00IXY5F4WUQYo3hbP0oqszqUhf7RhOiMWF5zxrffoScC33FHBJEcI6fIprKyC73T1zF4nY
	Tsz2Fnu51xq7bmaTrsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2alQ-00000008GkG-1Sva;
	Wed, 09 Apr 2025 19:07:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2alO-00000008Gje-32cb
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 19:07:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso293895e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 12:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744225625; x=1744830425; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDpH5Cg2hroK2o4IDN554HJ3Fr5FbZsmDQ5bD2HXl6Y=;
        b=U6+1E6ogVAGMeRwqqXQmxXW9fpV9WHNjK2+/YYDiBK67YWvEdzBXzbxOXiHBmB7aEU
         qUR7FhAdmRQYg74DWyBwm9vG82UIEd3/dVD+efB/yZFCw0+1gMdwPARl5K9VamvIJyT3
         hqmhQG75BrIhOp6uqIUEevbuwdAD7ayOoHTzEAI87pOjWVfBHON8I4z1owWCw2shxpuT
         r4Zr2OfhJdNRI10R2sakxt1A1S9pFuQX8qxvDM3ePcSej9FeBWn2tuT1S47Ftv4rKBFY
         VR7mRlV+d3Kf0QLEUd9kZHeFrRqtkcBvarxQBfm4YOcKLhZVZqM/Zfv3hi0JJfg9gg8v
         lTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225625; x=1744830425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDpH5Cg2hroK2o4IDN554HJ3Fr5FbZsmDQ5bD2HXl6Y=;
        b=FUfl42d1dZkvrn2qwbr07aZcFSZJsBnGpafjgtXmHgQ4ibPGNAyXML1EcyrFUvumD0
         Oc7vsWwuITtiDuNFQY1X5zr6Ih3v5kGuFqHqIIjIvdzUqxDU2vNqngUm7Q0qHk3eDkFh
         kNOKPDYVUto+PIovy8adlAh6YoHrwJOT5zpO0BJcRGy18BLmE690tivJnDChmteHUeol
         USjmTlxDVZNt4thL8oou3ni5bzUvNgwrdVwXXlVXdQn0xHTh2bLfzB5aQlr3TuJzPVnD
         nrjF6K6lnQohZxBCsrtMA1p1chhTeD6ijFZmTHkvolGbefattHUIBrVkp5H9Bkqu65FF
         SpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWccl6SFCZY4KRwhlKNFNxJarzFUrXwXMJGskVKoFYljELFbZyMRFngl0G5HBA8rHF/QmRITrfiaU4GkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzUP2gZ1ndqss+iwxnunETBYNYdNbQ52MibruAo23RZLirg9OA
	tq3n4CEKFMExk+f9Kj9+NAM2eT0YZJ0FJzcw8NDWSphzh+2hiSVhJXb7z5sF1Qg=
X-Gm-Gg: ASbGncupsO6+l/5PC1beK0Kn+WqDVdEe514SsY5/cfEpoUw+PBdd4EeDiJJ/mKQ5ABL
	rzExtadwCLYrrbKJFmVyhLjj32GOd7vGcuvYRzXSZNrOwct2fTSSV5xcOuSB0qCC9fyVv0k+xe+
	3uVGX9IBJuoDpfQVAaz0QPqPIbMjlE1suhmHGaZd2KUgFzBUeWMSO2WfmcFw9k8qNh4qHnEXsL8
	vb31v5IDeFdHEqA0EuF5A3O6DRX9tz5xtSHvUbknLmybWZ9HAIO97q3h5J5CQGiZ6MtOK9+2/59
	MtOtNKI4xETw1frP6vuBQjnkHiE5MKFiMr2Exgl3GeZWgkgQOsgRTz4ZA9hjIUGrwjbaJQ==
X-Google-Smtp-Source: AGHT+IGk1b2UhjU3Mst8QhR0QOkZwD6JG8okUMrRHSg9d1x+fnRHwWKeJm3fk035+4iF+CJXDmapXQ==
X-Received: by 2002:a5d:5847:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-39d87ac2fdamr3386517f8f.29.1744225624948;
        Wed, 09 Apr 2025 12:07:04 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm28928715e9.4.2025.04.09.12.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:07:04 -0700 (PDT)
Date: Wed, 9 Apr 2025 21:07:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: module: Optimize PLT/GOT entry counting
Message-ID: <20250409-aa536deeef59c7a2862d906f@orel>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
 <20250409171526.862481-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409171526.862481-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_120706_763877_5EE28A24 
X-CRM114-Status: GOOD (  33.27  )
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

On Wed, Apr 09, 2025 at 10:14:51AM -0700, Samuel Holland wrote:
> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
> inside module_frob_arch_sections(). This is because amdgpu.ko contains
> about 300000 relocations in its .rela.text section, and the algorithm in
> count_max_entries() takes quadratic time.
> 
> Apply two optimizations from the arm64 code, which together reduce the
> total execution time by 99.58%. First, sort the relocations so duplicate
> entries are adjacent. Second, reduce the number of relocations that must
> be sorted by filtering to only relocations that need PLT/GOT entries, as
> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
> optimizing PLT counting").
> 
> Unlike the arm64 code, here the filtering and sorting is done in a
> scratch buffer, because the HI20 relocation search optimization in
> apply_relocate_add() depends on the original order of the relocations.
> This allows accumulating PLT/GOT relocations across sections so sorting
> and counting is only done once per module.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v2:
>  - Include R_RISCV_PLT32 relocations when computing the PLT size
>  - Accumulate PLT/GOT relocations across relocation sections
> 
>  arch/riscv/kernel/module-sections.c | 81 +++++++++++++++++++++++------
>  1 file changed, 65 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> index 91d0b355ceef..75551ac6504c 100644
> --- a/arch/riscv/kernel/module-sections.c
> +++ b/arch/riscv/kernel/module-sections.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleloader.h>
> +#include <linux/sort.h>
>  
>  unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
>  {
> @@ -55,44 +56,70 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
>  	return (unsigned long)&plt[i];
>  }
>  
> -static int is_rela_equal(const Elf_Rela *x, const Elf_Rela *y)
> +#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
> +
> +static int cmp_rela(const void *a, const void *b)
>  {
> -	return x->r_info == y->r_info && x->r_addend == y->r_addend;
> +	const Elf_Rela *x = a, *y = b;
> +	int i;
> +
> +	/* sort by type, symbol index and addend */
> +	i = cmp_3way(x->r_info, y->r_info);
> +	if (i == 0)
> +		i = cmp_3way(x->r_addend, y->r_addend);
> +	return i;
>  }
>  
>  static bool duplicate_rela(const Elf_Rela *rela, int idx)
>  {
> -	int i;
> -	for (i = 0; i < idx; i++) {
> -		if (is_rela_equal(&rela[i], &rela[idx]))
> -			return true;
> -	}
> -	return false;
> +	/*
> +	 * Entries are sorted by type, symbol index and addend. That means
> +	 * that, if a duplicate entry exists, it must be in the preceding slot.
> +	 */
> +	return idx > 0 && cmp_rela(rela + idx, rela + idx - 1) == 0;
>  }
>  
> -static void count_max_entries(Elf_Rela *relas, int num,
> +static void count_max_entries(const Elf_Rela *relas, size_t num,
>  			      unsigned int *plts, unsigned int *gots)
>  {
> -	for (int i = 0; i < num; i++) {
> +	for (size_t i = 0; i < num; i++) {
> +		if (duplicate_rela(relas, i))
> +			continue;
> +
>  		switch (ELF_R_TYPE(relas[i].r_info)) {
>  		case R_RISCV_CALL_PLT:
>  		case R_RISCV_PLT32:
> -			if (!duplicate_rela(relas, i))
> -				(*plts)++;
> +			(*plts)++;
>  			break;
>  		case R_RISCV_GOT_HI20:
> -			if (!duplicate_rela(relas, i))
> -				(*gots)++;
> +			(*gots)++;
>  			break;
> +		default:
> +			unreachable();
>  		}
>  	}
>  }
>  
> +static bool rela_needs_plt_got_entry(const Elf_Rela *rela)
> +{
> +	switch (ELF_R_TYPE(rela->r_info)) {
> +	case R_RISCV_CALL_PLT:
> +	case R_RISCV_GOT_HI20:
> +	case R_RISCV_PLT32:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  			      char *secstrings, struct module *mod)
>  {
> +	size_t num_scratch_relas = 0;
>  	unsigned int num_plts = 0;
>  	unsigned int num_gots = 0;
> +	Elf_Rela *scratch = NULL;
> +	size_t scratch_size = 0;
>  	int i;
>  
>  	/*
> @@ -122,9 +149,10 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  
>  	/* Calculate the maxinum number of entries */
>  	for (i = 0; i < ehdr->e_shnum; i++) {
> +		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
>  		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
> -		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
>  		Elf_Shdr *dst_sec = sechdrs + sechdrs[i].sh_info;
> +		size_t scratch_size_needed;
>  
>  		if (sechdrs[i].sh_type != SHT_RELA)
>  			continue;
> @@ -133,7 +161,28 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
>  			continue;
>  
> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
> +		/*
> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
> +		 * close together, so sort a copy of the section to avoid interfering.
> +		 */
> +		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
> +		if (scratch_size_needed > scratch_size) {
> +			scratch_size = scratch_size_needed;

Maybe not worth it, but when i is less than ehdr->e_shnum - 1 (we still
have more sections to look at) we could use scratch_size_needed * 2, or
something, in order to hopefully reduce the number of times kvrealloc()
is called.

> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
> +			if (!scratch)
> +				return -ENOMEM;
> +		}
> +
> +		for (size_t j = 0; j < num_relas; j++)
> +			if (rela_needs_plt_got_entry(&relas[j]))
> +				scratch[num_scratch_relas++] = relas[j];
> +	}
> +
> +	if (scratch) {
> +		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
> +		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
> +		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
> +		kvfree(scratch);
>  	}
>  
>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
> -- 
> 2.47.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
