Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7D1C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 19:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n6pJ9ko95nsAX+9760Cn1zQyUzh8Fut8KvDLOwpCNuk=; b=qPG73Xi7EbTdB7
	cc71iy5iYB9SIx3X5utulxeBBNgzu1GU6yiANYwoAV+V1nTq4SUDzeW2HI//PJcbLK5kM3lOtHAac
	AWm3htVjnyTAcKHbxH+YP5n3/HjBvh+dw2apNAKF90w/wHdB1c8WK/oRVQwhb6/92/Zos18NTEOnE
	NGEiDt2m+n9S0GOtu4ErmQvexedAYicPXsj/nOqNH1jjRr0ExPem+R19wIm44bsp0H/Xkcga7X3Oa
	l0co2fYC5DauZPQgTG4SQuOubYvt+wJ1lrgvR+nsE4Akm6O9T83vu3tXZs/Tb/UU33gkAJSL/WUWx
	aJRlcNFc+oJ9T4FapSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2b24-00000008JOg-0Q3U;
	Wed, 09 Apr 2025 19:24:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2b21-00000008JNu-3Ahf
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 19:24:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso556805e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744226656; x=1744831456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8FxhE3NP9+CvB5k4cj29sIhuHMLfRzDVwZlEFBnlow=;
        b=otgyrJZKdw/gyOPNSDFUMMnekfEIBSW816Eh/skb5fzA+UTqRS0QYsKSfDLutTr/t5
         MO0E+Jl3PVfcFcLH61kdawRPfzqd6JAsN9LmjUCg9BhZnwDHYSZQb/pvskL/+HIeV94d
         ZktuqgjBholYQjKbz4UwQ8fj40BTskbClRnVlpmYfMyEy08im2XMP0c5r4Dklzqs0w3f
         pva31q35LcLAExijdwuIRbIFTFGd54j1YldcSo7SDazjGfYkwZ663KcE+unKSLAZPX72
         QqncC87HvWzlMg9wEAD+/eRg6/sxQhHcOS7MrcClOjOCXyVafFC2ItjzEOiVpjWd/w2e
         5NAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226656; x=1744831456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8FxhE3NP9+CvB5k4cj29sIhuHMLfRzDVwZlEFBnlow=;
        b=PEFDILgB5ohTwuAarw2It6sPqRGAyhiC2olMFxaagenGpDtrhD/Xilk+rxlhHPWubp
         nbR8ZCanWDk2jO94lmLSOuhWeHzVSXJvKqYywuDYGmHs52jQYqVkq0V3hglQ935FQYLG
         +4OLVDZyYT8W9RPFMYDdbhiKDIZ0iJHJYN85PBfgutJaWXIZh8BLyXnVjG3+oImiunIF
         c1i5epWmtlxOUTfCxB4XRM0bbJBwD0fJoejvbV3qaDTJSAgdLu5a4ddOvxQrdg0f25Ir
         rZsFFcnqdFzPtBOjNs6O7b2/rctLeWUUf+lGzH8D/LO9DdliOYKxJOLUQOxWBGGQRhdP
         RgSg==
X-Forwarded-Encrypted: i=1; AJvYcCVkXFE9Du/nHv8jSrCN/hYE1aiTtA1TR5OMgRFE9Su/GkHo2+TzzOW3wSUttATmjM2MTreITNIOzg//JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/+6KsHBH1yIG5cMjUTcYJXfF4lcOQJP3HNtY7rEXZ2K1Zork7
	ZFG5pXlguleam/xh5IOVe5YQcs4mNBaVzUUMjupZMlZH8mk7xOBvKI9OvrnTBGA=
X-Gm-Gg: ASbGncu3Pm/MAmKnpX8UTKK7bDwjpKGvWX2jN5TwKtvC9L9t/F0XbeUWQA+Hw7ENVBn
	349VnEGR6D1mh0Glqcz7XAFb4N4Hssd27Zs9EGulM/Ud8XfbvP+8vbSfdliRqX3tyyJtxyLsnDP
	NzJdpJJZNH57DtEuyH5+nISMXLzWQoKnu5n9Z+/0wczDGpu2eSllP2DS+Q5+3LxU0z+RE5L1yJ+
	NlLkAkdX8nI63N0CI+LJlc4jOw7IjPA2mV5CQBiaJoyrAc6te4ZSOfwerXOsCPQfNeRhFm29ww5
	icB/EeUMeVsUEfKGZAmuv+NdOl/S0jBycqDRBEYVJCk3OlEaIQ8kkSj629yXQNce5Ne3rw==
X-Google-Smtp-Source: AGHT+IFSZzhJ9866tYSp/eoyfPKaCAcmw7qQUIkxrlVQcA7QgprWbn2wLiKEhQi9YPH+OPNL4mZ+Sw==
X-Received: by 2002:a05:600c:1e17:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43f2c5d6fd9mr6034695e9.9.1744226655978;
        Wed, 09 Apr 2025 12:24:15 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075a65dsm30249435e9.31.2025.04.09.12.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:24:15 -0700 (PDT)
Date: Wed, 9 Apr 2025 21:24:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: module: Optimize PLT/GOT entry counting
Message-ID: <20250409-2341cb315aa65a258ecb268a@orel>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
 <20250409171526.862481-3-samuel.holland@sifive.com>
 <20250409-aa536deeef59c7a2862d906f@orel>
 <64d11a0f-dbae-41dd-a156-cda8a83a2fa4@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64d11a0f-dbae-41dd-a156-cda8a83a2fa4@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_122417_798678_66B78861 
X-CRM114-Status: GOOD (  41.19  )
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

On Wed, Apr 09, 2025 at 02:18:29PM -0500, Samuel Holland wrote:
> Hi Drew,
> 
> Thanks for the review again!
> 
> On 2025-04-09 2:07 PM, Andrew Jones wrote:
> > On Wed, Apr 09, 2025 at 10:14:51AM -0700, Samuel Holland wrote:
> >> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
> >> inside module_frob_arch_sections(). This is because amdgpu.ko contains
> >> about 300000 relocations in its .rela.text section, and the algorithm in
> >> count_max_entries() takes quadratic time.
> >>
> >> Apply two optimizations from the arm64 code, which together reduce the
> >> total execution time by 99.58%. First, sort the relocations so duplicate
> >> entries are adjacent. Second, reduce the number of relocations that must
> >> be sorted by filtering to only relocations that need PLT/GOT entries, as
> >> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
> >> optimizing PLT counting").
> >>
> >> Unlike the arm64 code, here the filtering and sorting is done in a
> >> scratch buffer, because the HI20 relocation search optimization in
> >> apply_relocate_add() depends on the original order of the relocations.
> >> This allows accumulating PLT/GOT relocations across sections so sorting
> >> and counting is only done once per module.
> >>
> >> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >> ---
> >>
> >> Changes in v2:
> >>  - Include R_RISCV_PLT32 relocations when computing the PLT size
> >>  - Accumulate PLT/GOT relocations across relocation sections
> >>
> >>  arch/riscv/kernel/module-sections.c | 81 +++++++++++++++++++++++------
> >>  1 file changed, 65 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> >> index 91d0b355ceef..75551ac6504c 100644
> >> --- a/arch/riscv/kernel/module-sections.c
> >> +++ b/arch/riscv/kernel/module-sections.c
> >> @@ -9,6 +9,7 @@
> >>  #include <linux/kernel.h>
> >>  #include <linux/module.h>
> >>  #include <linux/moduleloader.h>
> >> +#include <linux/sort.h>
> >>  
> >>  unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
> >>  {
> >> @@ -55,44 +56,70 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
> >>  	return (unsigned long)&plt[i];
> >>  }
> >>  
> >> -static int is_rela_equal(const Elf_Rela *x, const Elf_Rela *y)
> >> +#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
> >> +
> >> +static int cmp_rela(const void *a, const void *b)
> >>  {
> >> -	return x->r_info == y->r_info && x->r_addend == y->r_addend;
> >> +	const Elf_Rela *x = a, *y = b;
> >> +	int i;
> >> +
> >> +	/* sort by type, symbol index and addend */
> >> +	i = cmp_3way(x->r_info, y->r_info);
> >> +	if (i == 0)
> >> +		i = cmp_3way(x->r_addend, y->r_addend);
> >> +	return i;
> >>  }
> >>  
> >>  static bool duplicate_rela(const Elf_Rela *rela, int idx)
> >>  {
> >> -	int i;
> >> -	for (i = 0; i < idx; i++) {
> >> -		if (is_rela_equal(&rela[i], &rela[idx]))
> >> -			return true;
> >> -	}
> >> -	return false;
> >> +	/*
> >> +	 * Entries are sorted by type, symbol index and addend. That means
> >> +	 * that, if a duplicate entry exists, it must be in the preceding slot.
> >> +	 */
> >> +	return idx > 0 && cmp_rela(rela + idx, rela + idx - 1) == 0;
> >>  }
> >>  
> >> -static void count_max_entries(Elf_Rela *relas, int num,
> >> +static void count_max_entries(const Elf_Rela *relas, size_t num,
> >>  			      unsigned int *plts, unsigned int *gots)
> >>  {
> >> -	for (int i = 0; i < num; i++) {
> >> +	for (size_t i = 0; i < num; i++) {
> >> +		if (duplicate_rela(relas, i))
> >> +			continue;
> >> +
> >>  		switch (ELF_R_TYPE(relas[i].r_info)) {
> >>  		case R_RISCV_CALL_PLT:
> >>  		case R_RISCV_PLT32:
> >> -			if (!duplicate_rela(relas, i))
> >> -				(*plts)++;
> >> +			(*plts)++;
> >>  			break;
> >>  		case R_RISCV_GOT_HI20:
> >> -			if (!duplicate_rela(relas, i))
> >> -				(*gots)++;
> >> +			(*gots)++;
> >>  			break;
> >> +		default:
> >> +			unreachable();
> >>  		}
> >>  	}
> >>  }
> >>  
> >> +static bool rela_needs_plt_got_entry(const Elf_Rela *rela)
> >> +{
> >> +	switch (ELF_R_TYPE(rela->r_info)) {
> >> +	case R_RISCV_CALL_PLT:
> >> +	case R_RISCV_GOT_HI20:
> >> +	case R_RISCV_PLT32:
> >> +		return true;
> >> +	default:
> >> +		return false;
> >> +	}
> >> +}
> >> +
> >>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
> >>  			      char *secstrings, struct module *mod)
> >>  {
> >> +	size_t num_scratch_relas = 0;
> >>  	unsigned int num_plts = 0;
> >>  	unsigned int num_gots = 0;
> >> +	Elf_Rela *scratch = NULL;
> >> +	size_t scratch_size = 0;
> >>  	int i;
> >>  
> >>  	/*
> >> @@ -122,9 +149,10 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
> >>  
> >>  	/* Calculate the maxinum number of entries */
> >>  	for (i = 0; i < ehdr->e_shnum; i++) {
> >> +		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
> >>  		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
> >> -		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
> >>  		Elf_Shdr *dst_sec = sechdrs + sechdrs[i].sh_info;
> >> +		size_t scratch_size_needed;
> >>  
> >>  		if (sechdrs[i].sh_type != SHT_RELA)
> >>  			continue;
> >> @@ -133,7 +161,28 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
> >>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
> >>  			continue;
> >>  
> >> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
> >> +		/*
> >> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
> >> +		 * close together, so sort a copy of the section to avoid interfering.
> >> +		 */
> >> +		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
> >> +		if (scratch_size_needed > scratch_size) {
> >> +			scratch_size = scratch_size_needed;
> > 
> > Maybe not worth it, but when i is less than ehdr->e_shnum - 1 (we still
> > have more sections to look at) we could use scratch_size_needed * 2, or
> > something, in order to hopefully reduce the number of times kvrealloc()
> > is called.
> 
> I tried to keep the code as simple as possible, so I suppose it's not obvious
> what's going on here. The current code takes advantage of the fact that one of
> the relocation sections (.rela.text) is generally an order of magnitude or more
> larger than the others, is usually the first section processed, and much fewer
> than half of the relocations require a PLT/GOT entry. So in the common case:
> 
>   num_relas (.rela.text) > num_scratch_relas (all sections) + num_relas (any
> other section)
> 
> and there will only be one allocation, for .rela.text.

Sounds good.

Thanks,
drew

> 
> Regards,
> Samuel
> 
> >> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
> >> +			if (!scratch)
> >> +				return -ENOMEM;
> >> +		}
> >> +
> >> +		for (size_t j = 0; j < num_relas; j++)
> >> +			if (rela_needs_plt_got_entry(&relas[j]))
> >> +				scratch[num_scratch_relas++] = relas[j];
> >> +	}
> >> +
> >> +	if (scratch) {
> >> +		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
> >> +		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
> >> +		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
> >> +		kvfree(scratch);
> >>  	}
> >>  
> >>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
> >> -- 
> >> 2.47.0
> >>
> > 
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > Thanks,
> > drew
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
