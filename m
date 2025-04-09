Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21E0C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqeoBLxfNjwn0iFLtCUL7PKK9s3nYqxEH+jYnr06GYM=; b=WKIBrhJnWycZp3
	xhLCuFJj9A0NX+9G3NXYqPcSN1XgQeHAQQJqoLjzoISWmxEhCgKbwxQFN2z3RoE5gYZXfgUffWbC7
	IPCRFsG0BqCa4Y44NH5i+RF34vbWzL+A8zu6LhIsKVVxXDJWtpvQszHRRYjV+IdDWriJJ+0CpTIFs
	O1lNSsCYqF7LwJyL/CMttqF6EdBgoxhmEVKn7FyKsZeEL/hOEgn+QP63a5O/eA9T/Cyes718ievnn
	Yp3F9hN3xq0HxR877Rj96jxE/Jh6DHz0o3HErXk8K1lVlr+aAunUOpZlCU+XuUvGg7NL+lC9uKfWc
	AzPWSVhTlRDDfCSQrxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Syu-00000006tU5-1BGn;
	Wed, 09 Apr 2025 10:48:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Syr-00000006tTF-33Lg
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 10:48:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3914a5def6bso3939469f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 03:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744195708; x=1744800508; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zB6DOhsNP54p+LWQrH/LyPAGXFe/doVAQelM4hY0fbY=;
        b=CQH3yORR0idnsD159akl4913Shbs2FkKDS8WUb4GCdoE9BLS1ewBzo444ghxkFup0V
         Wlg25DHxgHAXGcX+mtBtNU8WTHR0BQvRbHqSjdP0tAO6lCocEyXIF1RLSnv7dd+OGNTy
         j+sQpGarOVM73R0XCAPxC2L+NVdjX/3kcl5FK9oUOrAotHR7LpgjD88PEUeLPeZphlEt
         tCCH+5qntUKRJn/5cTaaT3uy+CAqK8jyoC0hkIojvWBY6mvwUkt/lBGrSIkf7MjEwRbE
         wZNLXLCTQs/kRgUAn1oTdT1PhJsEQbMHe90an7dHsYfjIN4eZp7pCM+5U/fsAZan9cCy
         IBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195708; x=1744800508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zB6DOhsNP54p+LWQrH/LyPAGXFe/doVAQelM4hY0fbY=;
        b=I9SauTdOSCTxfyi3vt5HIS9h69G3+dSWBzQ/kPc24yb7huBFIF2/r6YzwgXeNsJ/mu
         TWpiWyzO8O2Ry8ZfeD5d9RBSXaqC4JY9dA5BCBra/cr/Kngtim0lLxezBEABQTsogEIf
         b7lN4eF32YJzr15O2MI0wj2E0BWQ59rg4n0nv0fx9zunNyfDXd77NY7Z9bhRY3ujH5AV
         Iv282BMPWpW/qa61PZyaf5DmFFJnPBQN+x6SDbbUfvjx9RRnGzhNXC6wR8avXbXbcRU6
         id/eHtufZ1EujJw3o3iOw7Irp+iOSK0kC1Roi0n+XxvH9YT8hOl6fIl2cbblx5tW2aX+
         TIyA==
X-Forwarded-Encrypted: i=1; AJvYcCXD0OLxi1xb2Hm8NbXSHHEvqbECldnQUPXNbEKekS3Q28jzHhfFzC+RanToNfXSzvKbJ23xcEaJQ7L8GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIJog3iv2AczaadNFrRaR6cyDAQTpfVgxiXlv7VzvYrukA7186
	q4YyumshkS8GTRRePhK6AaoJNGBIljrw4GPuyttOzuchUtDjnDANNL4s+yTkcDWDnuPXZhJ3c+P
	5
X-Gm-Gg: ASbGncsZVRMagGXsfi1nlcCwAkwmi6KcQoPcFyBaYRuLuoil4ZEsax72FnHPFfgpY7n
	D82ia7NU7g30OORyX1Uf09mQejzYhtZtp59+WMcAG+ivUgeov1MitX/5J9rSpfeiAI0X1RwBy6g
	h9VuOKwwQwRiEFgkDqqt1ziiVT14wV84pdR9Wv664QTy8cb5Xnu0zUbjcLugeLfo9+9YRsiMAS1
	vG5ciSKQjnowI9A8lS1J/QUj9Pa9S+RM/8R1pDagURyHoe0d++tETl7Jlx+P6ZNlsEvGF22g/OO
	4od/0Xg9/O4bUCfjgHsURL5kH2wW
X-Google-Smtp-Source: AGHT+IGYvUOkSdoe9+ZVfiFebJdaAtnsamOW1nCOk2I6rvSJl8ZT6oEiqCQdu/VJ4IJELPU1LDC7wQ==
X-Received: by 2002:a05:6000:1849:b0:391:31f2:b998 with SMTP id ffacd0b85a97d-39d88522729mr1855776f8f.6.1744195707253;
        Wed, 09 Apr 2025 03:48:27 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0a80sm1289556f8f.68.2025.04.09.03.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:48:26 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:48:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, charlie@rivosinc.com
Subject: Re: [PATCH] riscv: module: Optimize PLT/GOT entry counting
Message-ID: <20250409-c5cdd1190c498e9b594cf7d7@orel>
References: <20250409024519.454828-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409024519.454828-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_034829_766425_D4D4F909 
X-CRM114-Status: GOOD (  32.73  )
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

On Tue, Apr 08, 2025 at 07:45:16PM -0700, Samuel Holland wrote:
> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
> inside module_frob_arch_sections(). This is because amdgpu.ko contains
> about 300000 relocations in its .rela.text section, and the algorithm in
> count_max_entries() takes quadratic time.
> 
> Apply two optimizations from the arm64 code, which together reduce the
> total execution time by 99.57%. First, sort the relocations so duplicate
> entries are adjacent. Second, reduce the number of relocations that must
> be sorted by filtering to only relocations that need PLT/GOT entries, as
> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
> optimizing PLT counting").
> 
> Unlike the arm64 code, here the filtering and sorting is done in a
> scratch buffer, because the HI20 relocation search optimization in
> apply_relocate_add() depends on the original order of the relocations.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kernel/module-sections.c | 66 +++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> index e264e59e596e..91d4f0fbd0af 100644
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
> @@ -55,19 +56,27 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
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
>  static void count_max_entries(Elf_Rela *relas, int num,
> @@ -87,11 +96,33 @@ static void count_max_entries(Elf_Rela *relas, int num,
>  	}
>  }
>  
> +static bool rela_needs_plt_got(const Elf_Rela *rela)
> +{
> +	unsigned int type = ELF_R_TYPE(rela->r_info);
> +
> +	return type == R_RISCV_CALL_PLT || type == R_RISCV_GOT_HI20;

I see these two are sufficient to support count_max_entries(), but Charlie
also added support for R_RISCV_PLT32. I don't know enough about relocation
types to know if we need to consider that one here and in
count_max_entries(), so I'm just pointing it out in case it was
overlooked.

> +}
> +
> +/* Copy PLT and GOT relas to the scratch array. */
> +static unsigned int partition_plt_got_relas(const Elf_Rela *relas, Elf_Rela *scratch,
> +					    unsigned int num_rela)
> +{
> +	int j = 0;
> +
> +	for (int i = 0; i < num_rela; i++)
> +		if (rela_needs_plt_got(&relas[i]))
> +			scratch[j++] = relas[i];
> +
> +	return j;
> +}
> +
>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  			      char *secstrings, struct module *mod)
>  {
>  	unsigned int num_plts = 0;
>  	unsigned int num_gots = 0;
> +	Elf_Rela *scratch = NULL;
> +	size_t scratch_size = 0;
>  	int i;
>  
>  	/*
> @@ -132,9 +163,26 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
>  			continue;
>  
> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
> +		/*
> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
> +		 * close together, so sort a copy of the section to avoid interfering.
> +		 */
> +		if (sechdrs[i].sh_size > scratch_size) {
> +			scratch_size = sechdrs[i].sh_size;
> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
> +			if (!scratch)
> +				return -ENOMEM;
> +		}
> +
> +		/* sort relocations requiring a PLT or GOT entry so duplicates are adjacent */
> +		num_rela = partition_plt_got_relas(relas, scratch, num_rela);
> +		sort(scratch, num_rela, sizeof(Elf_Rela), cmp_rela, NULL);
> +		count_max_entries(scratch, num_rela, &num_plts, &num_gots);
>  	}
>  
> +	if (scratch)
> +		kvfree(scratch);
> +
>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
>  	mod->arch.plt.shdr->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
>  	mod->arch.plt.shdr->sh_addralign = L1_CACHE_BYTES;
> -- 
> 2.47.0
>

Besides my question above,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
