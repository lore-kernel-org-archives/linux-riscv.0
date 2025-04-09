Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A83AC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRoTo+x2e+o5IOw8vJGKiWEwwtBcr/y5rtnVpePsGoE=; b=1M181wmB+ULx4w
	ghsql3sLMEDCj0iAmqEmkZ1XGEQrxXkmHQtpgaHHPoG1rDTP4qngxqV2ekBQACodPOAzKrmOo1jCP
	R0vvcF3QGY+JGH2qPv2r6L6vE+5aSpLljxiTii2f8dCMWIqCEn6sYBsNvdh+6U09WRqiT/E+tKZeQ
	nWvWACy25lW79XXLsqBQM6Rt9SPTrruwS3/uiB5wOakBMf7qLuzQkQMZuqEHsevywHA8optKMgPbC
	UF8d+oBCLtEdZPAEGbqyykY3y1Lkw3hk5JWOEnZCa+zwc5ACL360DZZGa6HRzx3uHphUeHV1Y4jlv
	ucs4ko3365Qi4HNKVagw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WZR-00000007UIh-0ETF;
	Wed, 09 Apr 2025 14:38:29 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VrF-00000007MEV-2lfU
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 13:52:50 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-85dac9728cdso104529739f.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744206768; x=1744811568; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5pHe1ifA0DjRS4425Ek+vcz8cFHb7AV6SGKAGlf8Hs=;
        b=bVJ7r2XclGyv0g1poLhHUvRa5fcqs+u5NuaGbDCC58o4QLjVYSuxK4BnaVvte1/gKs
         k9OkbeTVBl38TTtR5G5bz2ghU+GGAZSc0PTRfJhb9Kqk+dgY5zCzeNzVzWAOMiZoWmYB
         wespjz2VjmbXCC9llw6J4QXnug5Yk0rU6oza8mS1wIVKcdCbLXdTqMilrcojnv0u2UH7
         KPMQHcrqEtamIHThdbx7FhntS77qINoFyl323sNZRxmx0tIB07YDDD0ujp4oGhhKikXo
         Y4G8jygly64gCPh0ZJdpJpRiy/snTfb6xLBOIk0YeDWEnrGQkp1IMWbTjmUew8qCf2Kj
         3ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744206768; x=1744811568;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5pHe1ifA0DjRS4425Ek+vcz8cFHb7AV6SGKAGlf8Hs=;
        b=VUXBj5yRfR1WWPF5ZMmHmkpLbGxWSpjvnTGqeRcHT9FauB5nJL8AV5zCWUyy7p5HOG
         pO//C+m6soykt5Y9AIbxyaojUsulsLhS4cZIhXgawKRaoUwDrpTzJRKSDIiVlbOGcf+k
         IVZlFlOAtsCRq3fTitMPs4Y0uo4UieToMGR5s9KDQCiGXX/8ozfLnF6fjZdCc97mpvO8
         YD1TLzlJeOU4OS4cHryBVMsH+r8rz59OiYYh07oqhA/pDqjYFzABvvr5e9Rv0Gr3wyED
         8g3D2RF17DYMkKA3BFNr126p31HskXO9sZc4K9aWO2qWDZRFXA7Uc6caxQ0pPBmMiKHq
         G9qg==
X-Forwarded-Encrypted: i=1; AJvYcCVDNbVelWguMhUVRyrC64AB4VBJbtqWc4cD68K7+NyTI2NXv6kqa9S1uVSOnON5Bym0pM5c5FEF1Y99Rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDfHvtGLDPsRqQrApUmSigNZG/KdGuaw4/UH4o8aXljMjH7O+3
	55Ov3+JPxDzhFXw1nsgGYTHxeO7pEu3aHGPjWDcR3x9LjjTqp9JlsfITjp4gmqo=
X-Gm-Gg: ASbGnctHoBKoAqlpiODBIwHkqpkVxVwKIuzhqM8FFpzCSkBLhX3a8+kdDVMafzKSEqL
	sKzWKXDcgoGHbuShlIAXb6BmodzLFPo5djaFvKv3EYXeDu3wfS2iqGVHbEt8EWv9P9ks5ygtHqz
	GE6U8Hh/fyIoMNf7jCwx3k6TNxa+ErKmPA3D/Gb9kPXciquW9dO9Q6RpZyvVwhPeKCmaSRa7kx8
	da+oDKuKWOKmjuCeZ20hN2S1YpVF9XbVV/s8VW2Re8ni+CFeiFWRWkN11Y/2tx4YRNiEUYQAM/A
	XUOBM21HPV5AAHdEbPCzVnDobOoLji5neklkQHsNx2ybq5KeHzplUeX0Y9rGNMCM19i0
X-Google-Smtp-Source: AGHT+IFWMoiTCjfnnzOhOhySi4L+SxY0UNNFxZHU8GLNuh8bo1Scfv/bNOSgJ7kJVRu0Vb2WaqVVyQ==
X-Received: by 2002:a05:6602:4802:b0:85b:538e:1faf with SMTP id ca18e2360f4ac-861611cc84dmr338497739f.7.1744206768541;
        Wed, 09 Apr 2025 06:52:48 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d173c4sm248241173.36.2025.04.09.06.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 06:52:48 -0700 (PDT)
Message-ID: <cd48101d-cbb0-4fe0-88de-efda693e43e8@sifive.com>
Date: Wed, 9 Apr 2025 08:52:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: module: Optimize PLT/GOT entry counting
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 charlie@rivosinc.com
References: <20250409024519.454828-1-samuel.holland@sifive.com>
 <20250409-c5cdd1190c498e9b594cf7d7@orel>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250409-c5cdd1190c498e9b594cf7d7@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_065249_716587_8325F5B4 
X-CRM114-Status: GOOD (  28.52  )
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

On 2025-04-09 5:48 AM, Andrew Jones wrote:
> On Tue, Apr 08, 2025 at 07:45:16PM -0700, Samuel Holland wrote:
>> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
>> inside module_frob_arch_sections(). This is because amdgpu.ko contains
>> about 300000 relocations in its .rela.text section, and the algorithm in
>> count_max_entries() takes quadratic time.
>>
>> Apply two optimizations from the arm64 code, which together reduce the
>> total execution time by 99.57%. First, sort the relocations so duplicate
>> entries are adjacent. Second, reduce the number of relocations that must
>> be sorted by filtering to only relocations that need PLT/GOT entries, as
>> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
>> optimizing PLT counting").
>>
>> Unlike the arm64 code, here the filtering and sorting is done in a
>> scratch buffer, because the HI20 relocation search optimization in
>> apply_relocate_add() depends on the original order of the relocations.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  arch/riscv/kernel/module-sections.c | 66 +++++++++++++++++++++++++----
>>  1 file changed, 57 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
>> index e264e59e596e..91d4f0fbd0af 100644
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
>> @@ -55,19 +56,27 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
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
>>  static void count_max_entries(Elf_Rela *relas, int num,
>> @@ -87,11 +96,33 @@ static void count_max_entries(Elf_Rela *relas, int num,
>>  	}
>>  }
>>  
>> +static bool rela_needs_plt_got(const Elf_Rela *rela)
>> +{
>> +	unsigned int type = ELF_R_TYPE(rela->r_info);
>> +
>> +	return type == R_RISCV_CALL_PLT || type == R_RISCV_GOT_HI20;
> 
> I see these two are sufficient to support count_max_entries(), but Charlie
> also added support for R_RISCV_PLT32. I don't know enough about relocation
> types to know if we need to consider that one here and in
> count_max_entries(), so I'm just pointing it out in case it was
> overlooked.

Yes, R_RISCV_PLT32 should be included. Today if a module were to include a
R_RISCV_PLT32 relocation against a unique symbol, it would hit a BUG_ON in
module_emit_plt_entry() because there would be no space in the PLT. If there was
also a R_RISCV_CALL_PLT relocation against the same symbol, the code would
silently succeed.

Regards,
Samuel

>> +}
>> +
>> +/* Copy PLT and GOT relas to the scratch array. */
>> +static unsigned int partition_plt_got_relas(const Elf_Rela *relas, Elf_Rela *scratch,
>> +					    unsigned int num_rela)
>> +{
>> +	int j = 0;
>> +
>> +	for (int i = 0; i < num_rela; i++)
>> +		if (rela_needs_plt_got(&relas[i]))
>> +			scratch[j++] = relas[i];
>> +
>> +	return j;
>> +}
>> +
>>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  			      char *secstrings, struct module *mod)
>>  {
>>  	unsigned int num_plts = 0;
>>  	unsigned int num_gots = 0;
>> +	Elf_Rela *scratch = NULL;
>> +	size_t scratch_size = 0;
>>  	int i;
>>  
>>  	/*
>> @@ -132,9 +163,26 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
>>  			continue;
>>  
>> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
>> +		/*
>> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
>> +		 * close together, so sort a copy of the section to avoid interfering.
>> +		 */
>> +		if (sechdrs[i].sh_size > scratch_size) {
>> +			scratch_size = sechdrs[i].sh_size;
>> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
>> +			if (!scratch)
>> +				return -ENOMEM;
>> +		}
>> +
>> +		/* sort relocations requiring a PLT or GOT entry so duplicates are adjacent */
>> +		num_rela = partition_plt_got_relas(relas, scratch, num_rela);
>> +		sort(scratch, num_rela, sizeof(Elf_Rela), cmp_rela, NULL);
>> +		count_max_entries(scratch, num_rela, &num_plts, &num_gots);
>>  	}
>>  
>> +	if (scratch)
>> +		kvfree(scratch);
>> +
>>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
>>  	mod->arch.plt.shdr->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
>>  	mod->arch.plt.shdr->sh_addralign = L1_CACHE_BYTES;
>> -- 
>> 2.47.0
>>
> 
> Besides my question above,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
