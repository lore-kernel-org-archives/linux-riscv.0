Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3360C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPHQQuxehNeidBrXAdUHdLbsSWuKbkpY2YcB5S51PiQ=; b=wNdMUp2g01V3Z5
	43qaZqdZTkZslCXYXsSqvf8NwtgSQK/NmplN3fCaw+u0MXrZuuaoIteHik7048mscDyKzoH3Zt/LY
	StgtmYZIhR8dcPTwzd/dZY6BPV6CMzi3keunAAIIUKSVGhWRFFcS6iwT7EFEZzaS6IUCcpxhMqp8T
	/2MnMfO4iFVh/tIW2hSppYaOOl7BkpDGxw1dCr57CzbAMCwdGweAfCdjRQS4lkbOj1xenTsxQlv6d
	Zf0qlyJSKaCuOIWB0ViSMjM/D47d8hmGcajZSYZ8UnjGGCfctE1gKts1ZZCDh3b19Bvk98muugirJ
	oim1uG1+baRF0pEERDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSx8-0000000AfIF-2uct;
	Fri, 07 Feb 2025 18:19:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSx7-0000000AfHP-0ErC
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Feb 2025 18:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/CHphRywyfKXY1w+bSATOxT7wdCR+rjwInOvuQLnRYI=; b=V7PTJSXBUuBbE/BkaKUXecDIZo
	c1gWKnAMtDKtmkjounylw7bkL7jH9LkiulQzEJ8X28LuVQbk1RWy3saOlskWrEJy5C9pT8xFB8Jjv
	DGyBDyLxfdh/PTJvvRgYigwi3cAdT3OgF9wRl3zjSFvT4c8Jb9Aya+ZTkkNsQmkYCf4SZyDt5aah3
	8L2YpcNhVWwKxJH2gFUsLbtJyJAl1fkixK0npWe1iMQNmEDafGzgFF6CWuMqr9jJsFQdN/ul4AejX
	AJNKPQIP5jaoJiBp64cykSgoDbZHgxShj9fMTaK6+ZGUHBMJ6kgVfw3VDtujybjZYByqRkkxB9DEf
	uVjZ+0rA==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSx4-0000000HHqJ-000J
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 18:19:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so977900f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 10:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738952379; x=1739557179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CHphRywyfKXY1w+bSATOxT7wdCR+rjwInOvuQLnRYI=;
        b=mGa1+PiZczLRsGHgOiZt41waHcGXiN02D/e3fF1gg/PB1Ixwbu62nOi+2Q3cAWyKPi
         uO9r4ZWW4R7k/FCugT0x01WTL94PEFSk+tRYuyJ4SpUyq9/kIovNbRtW/f+C0Pts5okn
         F2z5uO/AxiTGEMl/rpuQS4f5Nd3e+x7xiGfYw/xKnLX/QxdlgR/toG4q/HaCd1D35lXf
         iQYG12Yi8oNiqvefuvnBq1dE150c4p55g2CHphK6R2WIIHeM6GKjUxAZAcfJM2E37v5T
         +LiAzFpHc2qbPXAYbLC0NCJQ3cOAnwutjY0Fj+MDESmuJmheYl2tbqxk2pNeBbqnW06Z
         Tpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738952379; x=1739557179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CHphRywyfKXY1w+bSATOxT7wdCR+rjwInOvuQLnRYI=;
        b=jl+jwIvqWqPzSmVNACP+1z31IcAB8cJLatzwAtgBH9l12bwL03ilGnCvxE3vKPbEhP
         dKiSOsF6VwjjZG66F8qz/cUQiSsAs4YQYGfPqCqzrDnUzsy/RKk/QH1qHr+mwU/NZc6w
         uX6t1efRMG5OJTGfMRQDCSfkpqGq2W2eHWjZu96EF+CMhFzjCMO9UsDeVhQd6dmu0roC
         qntKDIMHwlikKrzKLCApdvjcsRb9JNL8OFa19jI1HPkGkIxBSd6HA2WAuwcwm7r0QFMg
         sNHRZiw2FKvCfoBUqlR41+uhAawLARHnnzcCdOwQMNDGNUrOQe5duRdxxwEarTOSalks
         5qxQ==
X-Gm-Message-State: AOJu0Yw6gbBX7Y44YzizM50gAy9RWJEUNEUWJZdzhagw0PcH8ZvEJP6l
	j7EdU6Jvu5+7LFgUUtxJW+YRZdzpTyw66zwUt1RMP4jEKqRNMLn8fpLwYtG+gn3yBAhYi4u7LIH
	a5wo=
X-Gm-Gg: ASbGnctC/8ogPkaDLZvVrd0Hcsu24mq58v7cE0f1zOB0SVHtYwXAfI6/s4vEYVi2O6s
	7B7z+Mdi0tRKa1h7+x+lljOPRjfYRI+PvjlM46FGb+q3XdtKiAynpk6ll3/qU3/4B5WB+3s5cO0
	szS+50MuhlHYVoDk6y/wGkEFmcblY6+8NukWEBDYTDwqeYRx86aAWkq3cPPUp6VT1UC1K0B+WR2
	AQj1dhmUIGupeF50FzpX+1xc6WMqJrYVsUjKW4Jfxl9yR8TYtFD+G4laonYNHoyVn3NZQn1Dncv
	2xiCiNHZ6LLrA2Axai34
X-Google-Smtp-Source: AGHT+IESpbzq9eU/T+PKbhe6gpMPCCz2c+/E7FjLPKy4iVsuXujczUZ3khyzCNdXzMJiSORJcLFpSQ==
X-Received: by 2002:a5d:6da4:0:b0:38d:d12a:4160 with SMTP id ffacd0b85a97d-38dd12a4874mr826092f8f.54.1738952379451;
        Fri, 07 Feb 2025 10:19:39 -0800 (PST)
Received: from localhost ([2a00:11b1:103b:18b0:943f:8e0:c299:6db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcdb54668sm1806478f8f.35.2025.02.07.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:19:39 -0800 (PST)
Date: Fri, 7 Feb 2025 19:19:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: cleger@rivosinc.com
Subject: Re: [PATCH 8/9] riscv: Implement check_unaligned_access_table
Message-ID: <20250207-ed32c2f6c418ba86ca82d455@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207181048.6045-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250207181048.6045-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_181942_137533_DF4866AE 
X-CRM114-Status: GOOD (  26.60  )
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


This is the same as the other 8/9 (for those of you that received it). For
whatever reason, the linux-riscv mailing list dropped the original 8/9,
though, so I've sent it again.

Thanks,
drew

On Fri, Feb 07, 2025 at 07:10:49PM +0100, Andrew Jones wrote:
> Define the table entry type and implement the table lookup to find
> unaligned access types by id registers which is used to skip probing.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 91 +++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index f8497097e79d..bd6db4c42daf 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -12,6 +12,7 @@
>  #include <linux/types.h>
>  #include <asm/cpufeature.h>
>  #include <asm/hwprobe.h>
> +#include <asm/sbi.h>
>  #include <asm/vector.h>
>  
>  #include "copy-unaligned.h"
> @@ -230,11 +231,89 @@ static int __init lock_and_set_unaligned_access_static_branch(void)
>  
>  arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
>  
> -static bool check_unaligned_access_table(void)
> +/*
> + * An unaligned_access_table_entry maps harts (or collections of harts) to
> + * unaligned access types. @level is used to determine whether @marchid and/or
> + * @mimpid should to be considered. All (level, mvendorid, marchid, mimpid)
> + * tuples formed from each table entry must be unique.
> + */
> +enum id_level {
> +	LEVEL_VENDOR,
> +	LEVEL_ARCH,
> +	LEVEL_IMP,
> +};
> +struct unaligned_access_table_entry {
> +	enum id_level level;
> +	u32 mvendorid;
> +	ulong marchid;
> +	ulong mimpid;
> +	long type;
> +};
> +
> +static struct unaligned_access_table_entry unaligned_access_table_entries[] = {
> +};
> +
> +/*
> + * Search unaligned_access_table_entries[] for the most specific match,
> + * i.e. if there are two entries, one with mvendorid = V and level = VENDOR
> + * and another with mvendorid = V, level = ARCH, and marchid = A, then
> + * a hart with {V,A,?} will match the latter while a hart with {V,!A,?}
> + * will match the former.
> + */
> +static bool __check_unaligned_access_table(int cpu, long *ptr, int nr_entries,
> +					   struct unaligned_access_table_entry table[])
>  {
> +	struct unaligned_access_table_entry *entry, *match = NULL;
> +	u32 mvendorid = riscv_cached_mvendorid(cpu);
> +	ulong marchid = riscv_cached_marchid(cpu);
> +	ulong mimpid = riscv_cached_mimpid(cpu);
> +	int i;
> +
> +	for (i = 0; i < nr_entries; ++i) {
> +		entry = &table[i];
> +
> +		switch (entry->level) {
> +		case LEVEL_VENDOR:
> +			if (!match && entry->mvendorid == mvendorid) {
> +				/* The match, unless we find an ARCH or IMP level match. */
> +				match = entry;
> +			}
> +			break;
> +		case LEVEL_ARCH:
> +			if (entry->mvendorid == mvendorid && entry->marchid == marchid) {
> +				/* The match, unless we find an IMP level match. */
> +				match = entry;
> +			}
> +			break;
> +		case LEVEL_IMP:
> +			if (entry->mvendorid == mvendorid && entry->marchid == marchid &&
> +			    entry->mimpid == mimpid) {
> +				match = entry;
> +				goto matched;
> +			}
> +			break;
> +		}
> +	}
> +
> +	if (match) {
> +matched:
> +		*ptr = match->type;
> +		return true;
> +	}
> +
>  	return false;
>  }
>  
> +static bool check_unaligned_access_table(void)
> +{
> +	int cpu = smp_processor_id();
> +	long *ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
> +
> +	return __check_unaligned_access_table(cpu, ptr,
> +					      ARRAY_SIZE(unaligned_access_table_entries),
> +					      unaligned_access_table_entries);
> +}
> +
>  static int riscv_online_cpu(unsigned int cpu)
>  {
>  	if (check_unaligned_access_table())
> @@ -380,9 +459,17 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
>  }
>  #endif
>  
> +static struct unaligned_access_table_entry vec_unaligned_access_table_entries[] = {
> +};
> +
>  static bool check_vector_unaligned_access_table(void)
>  {
> -	return false;
> +	int cpu = smp_processor_id();
> +	long *ptr = per_cpu_ptr(&vector_misaligned_access, cpu);
> +
> +	return __check_unaligned_access_table(cpu, ptr,
> +					      ARRAY_SIZE(vec_unaligned_access_table_entries),
> +					      vec_unaligned_access_table_entries);
>  }
>  
>  static int riscv_online_cpu_vec(unsigned int cpu)
> -- 
> 2.48.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
