Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731C8C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 19:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9Liny8eYOHI7UoX3t8Tqx0UdAgGhJBO+2lzk9sgn5s=; b=ANdasWCpYnolrh
	A7em5gAzvPfxYjdLDiTcUBFaF+CAgL03JUpTDew03+7WwaKMGe0ckiqP7I6SRpICOMX7bExnOFDfq
	MO2/th5+hDrCnhbYbk2L3y0xppFlD7PiPI0r7xWBCyJlW1ih+LRilas19Vuw43kqXc8Z6JDJEH8A1
	2hwWIy0Ks5nAME+HZIrvkxIgSfDxGoA0V1rDblHIdqhFYPzhVplyMKzCO+zU39y9z0A3Ow9Fa+Fm6
	86AjpdRwfikIQ/JFm8Ctd4WaqdsMifPNljALuuovgV8t9XDeHEzl8gZAkKNRbOQOin6LMOWCnglZl
	UteRBmIx3m1hfDU3jWEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2awU-00000008ILh-3l6L;
	Wed, 09 Apr 2025 19:18:34 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2awS-00000008ILL-1Cnk
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 19:18:33 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-86135ac9542so2395339f.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 12:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744226311; x=1744831111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFs2jcsC9hSq6N0o28lZcXuEAl76nY4kIVAVF5GbkWw=;
        b=nlK+mhQOWh6q8hzHC9K0CeUv5OU5dCxjWZp3FOBCYogGto2xkeXHAbbDzGu4UeOK/4
         81JjfZ2U7aaIe7m3SE5D2jzmxCu7oIkFeRYK3MEEx3e+YteqwLdbHXR7KZumE8yJcW6G
         7lIc096idaylwCCNvP/hldE9QvKHP93Vg97XuQOfjYdijuEpxUEmj4Uj5cLRyjOG+3wE
         qvszZ7Nxx2eggOUuIoqr+kzvYUD8MIp/Ggjm4m8FxboSXxmHwnnORA4agca3Kt2awBJe
         kgce7gyAG8kO4ZwEIDVSwBvnhzf5IfNJlRtQWJVFowpgMm9B5sperHPxW14iLHxrblhw
         P/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226311; x=1744831111;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFs2jcsC9hSq6N0o28lZcXuEAl76nY4kIVAVF5GbkWw=;
        b=eT1YWR8HIpmOxBOeKJ/OI1MctoUFoMlhDOgaVIV+9P8VFAc24kjrR/0w6r5Aml20OJ
         ta6UoKL9MozW8Pk9+guuXCvRBi9z2C1TmeTLz57ERrfdLLiaI3jqHdxYKxW4URS1ppaV
         WpaIuHFIvQT1iGhirxjvv21hTlhp7zX7DPriljyNDLYaWEJ69LuXsKWXj0v3gQvzneQr
         OMRi4Z0frCthnd7HJe8gfoiedSJtdo+DWZy/fujjeF8y4qV6+fgxWy+kO0eygoulGWsf
         7KQInNl7dFUApKaGqg2pk+mIHqrTCkBUMOQ4bG8O2FQi2PPV+fP/yL5Yio4cCtXbY7of
         hzAA==
X-Forwarded-Encrypted: i=1; AJvYcCV8216kAd4bRmg6f/d2rI7u6yVC9XSYrEoUdjQAsHLK5yM/ESi+JDwPhz24/Od8/d7V/0IRf4Ku4nsemA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkz2Pu+so+JcMryU+/sKTZDxOy0yTuH9IVfeQxd5c8pibcOCyW
	uIfXWjcpHIzlBIhrCxNnNI7UzvvGkF3GgzQh+VNXWRboq9S9P6Ma+Rcs9iTMr7k=
X-Gm-Gg: ASbGncuVoIKoXULswJG1TqduAclte+mmGeMotH6TXn1mjGaVZMztvyJUeVN5zuhWzDP
	z5KkXcF4051BaZdjwjN/1BNK9fBvdy3VK05WL9QeKzMDLYXSd7gjFxhVniS7zmOUIZ+jTqchSgZ
	G5x08OqqPNE75dtiq82KiP444sjC5zkuqEhnTLS0BmXwnxtG3+W9sq9vUwqIeRPQ7XHzPfhuBah
	WZxRJz2Z6AvrU8VeMP6ROny5yRzAHCHYE4d5RdaL/YZvLqyCwhpuL/wVoudL9TuSBbo1bWuuqyr
	o7ZDHY4+9/G11yYl9Ka4K+7EJMqbY1/3iCKgcitzC/TXAQ+1AIpxDpkEQQ==
X-Google-Smtp-Source: AGHT+IGYpxRkSx3E2EazAyHnEuRS9W8r8vN1zJ7kUcYvc6Jr3BvS4y68UVPW2fgdqphAGXRzj+AMFw==
X-Received: by 2002:a05:6602:3790:b0:85b:3c49:8812 with SMTP id ca18e2360f4ac-8616cd31002mr87252639f.8.1744226311315;
        Wed, 09 Apr 2025 12:18:31 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8616543a934sm31022139f.26.2025.04.09.12.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:18:30 -0700 (PDT)
Message-ID: <64d11a0f-dbae-41dd-a156-cda8a83a2fa4@sifive.com>
Date: Wed, 9 Apr 2025 14:18:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: module: Optimize PLT/GOT entry counting
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
References: <20250409171526.862481-1-samuel.holland@sifive.com>
 <20250409171526.862481-3-samuel.holland@sifive.com>
 <20250409-aa536deeef59c7a2862d906f@orel>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250409-aa536deeef59c7a2862d906f@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_121832_354753_66D7C871 
X-CRM114-Status: GOOD (  29.43  )
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

Hi Drew,

Thanks for the review again!

On 2025-04-09 2:07 PM, Andrew Jones wrote:
> On Wed, Apr 09, 2025 at 10:14:51AM -0700, Samuel Holland wrote:
>> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
>> inside module_frob_arch_sections(). This is because amdgpu.ko contains
>> about 300000 relocations in its .rela.text section, and the algorithm in
>> count_max_entries() takes quadratic time.
>>
>> Apply two optimizations from the arm64 code, which together reduce the
>> total execution time by 99.58%. First, sort the relocations so duplicate
>> entries are adjacent. Second, reduce the number of relocations that must
>> be sorted by filtering to only relocations that need PLT/GOT entries, as
>> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
>> optimizing PLT counting").
>>
>> Unlike the arm64 code, here the filtering and sorting is done in a
>> scratch buffer, because the HI20 relocation search optimization in
>> apply_relocate_add() depends on the original order of the relocations.
>> This allows accumulating PLT/GOT relocations across sections so sorting
>> and counting is only done once per module.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> Changes in v2:
>>  - Include R_RISCV_PLT32 relocations when computing the PLT size
>>  - Accumulate PLT/GOT relocations across relocation sections
>>
>>  arch/riscv/kernel/module-sections.c | 81 +++++++++++++++++++++++------
>>  1 file changed, 65 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
>> index 91d0b355ceef..75551ac6504c 100644
>> --- a/arch/riscv/kernel/module-sections.c
>> +++ b/arch/riscv/kernel/module-sections.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/moduleloader.h>
>> +#include <linux/sort.h>
>>  
>>  unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
>>  {
>> @@ -55,44 +56,70 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
>>  	return (unsigned long)&plt[i];
>>  }
>>  
>> -static int is_rela_equal(const Elf_Rela *x, const Elf_Rela *y)
>> +#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
>> +
>> +static int cmp_rela(const void *a, const void *b)
>>  {
>> -	return x->r_info == y->r_info && x->r_addend == y->r_addend;
>> +	const Elf_Rela *x = a, *y = b;
>> +	int i;
>> +
>> +	/* sort by type, symbol index and addend */
>> +	i = cmp_3way(x->r_info, y->r_info);
>> +	if (i == 0)
>> +		i = cmp_3way(x->r_addend, y->r_addend);
>> +	return i;
>>  }
>>  
>>  static bool duplicate_rela(const Elf_Rela *rela, int idx)
>>  {
>> -	int i;
>> -	for (i = 0; i < idx; i++) {
>> -		if (is_rela_equal(&rela[i], &rela[idx]))
>> -			return true;
>> -	}
>> -	return false;
>> +	/*
>> +	 * Entries are sorted by type, symbol index and addend. That means
>> +	 * that, if a duplicate entry exists, it must be in the preceding slot.
>> +	 */
>> +	return idx > 0 && cmp_rela(rela + idx, rela + idx - 1) == 0;
>>  }
>>  
>> -static void count_max_entries(Elf_Rela *relas, int num,
>> +static void count_max_entries(const Elf_Rela *relas, size_t num,
>>  			      unsigned int *plts, unsigned int *gots)
>>  {
>> -	for (int i = 0; i < num; i++) {
>> +	for (size_t i = 0; i < num; i++) {
>> +		if (duplicate_rela(relas, i))
>> +			continue;
>> +
>>  		switch (ELF_R_TYPE(relas[i].r_info)) {
>>  		case R_RISCV_CALL_PLT:
>>  		case R_RISCV_PLT32:
>> -			if (!duplicate_rela(relas, i))
>> -				(*plts)++;
>> +			(*plts)++;
>>  			break;
>>  		case R_RISCV_GOT_HI20:
>> -			if (!duplicate_rela(relas, i))
>> -				(*gots)++;
>> +			(*gots)++;
>>  			break;
>> +		default:
>> +			unreachable();
>>  		}
>>  	}
>>  }
>>  
>> +static bool rela_needs_plt_got_entry(const Elf_Rela *rela)
>> +{
>> +	switch (ELF_R_TYPE(rela->r_info)) {
>> +	case R_RISCV_CALL_PLT:
>> +	case R_RISCV_GOT_HI20:
>> +	case R_RISCV_PLT32:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  			      char *secstrings, struct module *mod)
>>  {
>> +	size_t num_scratch_relas = 0;
>>  	unsigned int num_plts = 0;
>>  	unsigned int num_gots = 0;
>> +	Elf_Rela *scratch = NULL;
>> +	size_t scratch_size = 0;
>>  	int i;
>>  
>>  	/*
>> @@ -122,9 +149,10 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  
>>  	/* Calculate the maxinum number of entries */
>>  	for (i = 0; i < ehdr->e_shnum; i++) {
>> +		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
>>  		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
>> -		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
>>  		Elf_Shdr *dst_sec = sechdrs + sechdrs[i].sh_info;
>> +		size_t scratch_size_needed;
>>  
>>  		if (sechdrs[i].sh_type != SHT_RELA)
>>  			continue;
>> @@ -133,7 +161,28 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
>>  			continue;
>>  
>> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
>> +		/*
>> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
>> +		 * close together, so sort a copy of the section to avoid interfering.
>> +		 */
>> +		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
>> +		if (scratch_size_needed > scratch_size) {
>> +			scratch_size = scratch_size_needed;
> 
> Maybe not worth it, but when i is less than ehdr->e_shnum - 1 (we still
> have more sections to look at) we could use scratch_size_needed * 2, or
> something, in order to hopefully reduce the number of times kvrealloc()
> is called.

I tried to keep the code as simple as possible, so I suppose it's not obvious
what's going on here. The current code takes advantage of the fact that one of
the relocation sections (.rela.text) is generally an order of magnitude or more
larger than the others, is usually the first section processed, and much fewer
than half of the relocations require a PLT/GOT entry. So in the common case:

  num_relas (.rela.text) > num_scratch_relas (all sections) + num_relas (any
other section)

and there will only be one allocation, for .rela.text.

Regards,
Samuel

>> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
>> +			if (!scratch)
>> +				return -ENOMEM;
>> +		}
>> +
>> +		for (size_t j = 0; j < num_relas; j++)
>> +			if (rela_needs_plt_got_entry(&relas[j]))
>> +				scratch[num_scratch_relas++] = relas[j];
>> +	}
>> +
>> +	if (scratch) {
>> +		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
>> +		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
>> +		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
>> +		kvfree(scratch);
>>  	}
>>  
>>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
>> -- 
>> 2.47.0
>>
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
