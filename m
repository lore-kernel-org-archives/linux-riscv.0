Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E11C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 04:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjyCZscwDasuUL9SzgBgovsjZ4Z79kkAzkN79l8SdK8=; b=JPsRUclX+X+ZAe
	Q3hPJXWOZmogFT5pADTjqwE88yvsqeGZHbWmwFYqi/t+0dNnTDGH0ibAtkEAs1cnKV74AjKUVA8PV
	bVeNGY9tAmSncChxcy4KrM6MqqRBNHhY4CuRgywEOaBAN+iz+iRk5bB+ckVtPB8HTdk9Mh+Sf5qhH
	9EMA9faZaVb0MVrdXAgmbwSIaEcqtctd3R2KIpJGRiRz7QYqPenAdVv34JKqU2IOLW9LK2PwU6yhz
	7oscg7izH+w85HCD8mR1kqu9XfCsdoEwEdXpgvcNR+bRlfGroYC91Q+VB0PLOW2JUOA6IJOD5HZwf
	N3p2iv1t5f6RItF0/l9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhMdD-0000000BsoQ-16Kg;
	Tue, 05 Mar 2024 04:42:23 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhMd7-0000000Bsmx-2OGH
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 04:42:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e622b46f45so1388761b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 20:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709613730; x=1710218530; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yF4EwQqzBVk7XgdJQilAun1918XSEfc6vUXCeQtX3Tw=;
        b=SRFxMO6pRt+s0ixUiq5rBHD6rhR6K5ZkArSVH+5EyTvEmks1dhqZX4mH8xEP7c/gcr
         b2nEzYq62E/8GYFFyAXJo131ZX46xfExrCyBWMXRVQ6kHQgR2nUSdpuPbOSwrcB+wfp0
         i7B0n61Hz5G27LZ87NTk6w4q6hoM6S9KeRHgrO79V1Wieyjgs8Ag3mQGc6TL14td5dFu
         i33jTXzrfEqwtQ1yfObVXnvybMnXcu8zYdR1XG8v4eLuzUvaaaNH9FpOt4KK8ntG7bp1
         0qk8jg4V3n2CD7DOaFNxjHX+zV+0gej2vI+G3TxUoYpsdiCWH5Fgx55QpC36CimQ74kx
         nHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709613730; x=1710218530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF4EwQqzBVk7XgdJQilAun1918XSEfc6vUXCeQtX3Tw=;
        b=oPOmf26v9u5ND0Ez4njLybKU6jnHw1BPNBBC4qm98RjJHNY9N1eBZRKymN/rdvocsp
         i907yzJ7ZD5PFrzZVmNOeZK00CmglgCNapTUPW1oTW5rWyPxRD1XwTGcf4OZ7gQqBmP9
         Obb+Xdf+C7co96zBQF8b1cs8TBNJMjSYeVcwhPx29Zxeg1uGEVPu/UpRU1qA/Pn2noJu
         LmOcnT/u6r/zicjGOKvBhw6HKwqaJ5/CtOV0jdIJhj7z/VBRGLiW8U3QyHEZgjKe+qi5
         F1dx2/TpG1hzehktlvXX0kGfoDMzfCCCykk1G5ttLMdkvxZlKaEca0Z1tamQklgNVW3P
         q2VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/xK8c1XRs4g8hFXYcy6GM/V4QMzvfQFDd9fE626TXUQxhUo/yU/V5JKMrxjDN3euIkbUHZe7C4RwxBoRz4860XUgwGsMEkIIN3ZJQvn1B
X-Gm-Message-State: AOJu0YxgkS2IoVrMX3bGHXoBwTBxF+AMyAzKjhdqocR15bWT7QNqS4Ea
	gQqtz2S6djthi/fVyfvWIinHIaBwqDiDMHQvWVkYHp6s7Z3aVNM7mA4TryEGo3M=
X-Google-Smtp-Source: AGHT+IHFeTjXThPCXKLo9RHXN66EbeSFne7ZcgdAIqKXetKAR8c1ZOC18G/a37FUmZWnIib779ErWA==
X-Received: by 2002:aa7:8714:0:b0:6e6:136b:cfc with SMTP id b20-20020aa78714000000b006e6136b0cfcmr4986620pfo.4.1709613730220;
        Mon, 04 Mar 2024 20:42:10 -0800 (PST)
Received: from sunil-laptop ([106.51.184.12])
        by smtp.gmail.com with ESMTPSA id x19-20020a63f713000000b005dbf22d6e1asm8416760pgh.56.2024.03.04.20.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 20:42:09 -0800 (PST)
Date: Tue, 5 Mar 2024 10:11:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>, Baoquan He <bhe@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	James Morse <james.morse@arm.com>, Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 2/4] ACPI: NUMA: Add handler for SRAT RINTC affinity
 structure
Message-ID: <ZeailF+UYf/+4NQq@sunil-laptop>
References: <cover.1706603678.git.haibo1.xu@intel.com>
 <a1e20de53156f50385c7609507982f08866e859b.1706603678.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1e20de53156f50385c7609507982f08866e859b.1706603678.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_204217_698782_EF195887 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Haibo,

On Wed, Jan 31, 2024 at 10:31:59AM +0800, Haibo Xu wrote:
> Add RINTC affinity structure handler during parsing SRAT table.
> The ARCH specific implementation will be added in next patch.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  drivers/acpi/numa/srat.c | 32 +++++++++++++++++++++++++++++++-
>  include/linux/acpi.h     |  3 +++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
> index 0214518fc582..503abcf6125d 100644
> --- a/drivers/acpi/numa/srat.c
> +++ b/drivers/acpi/numa/srat.c
> @@ -165,6 +165,19 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
>  		}
>  	}
>  	break;
> +
> +	case ACPI_SRAT_TYPE_RINTC_AFFINITY:
> +		{
> +			struct acpi_srat_rintc_affinity *p =
> +			    (struct acpi_srat_rintc_affinity *)header;
> +			pr_debug("SRAT Processor (acpi id[0x%04x]) in proximity domain %d %s\n",
> +				 p->acpi_processor_uid,
> +				 p->proximity_domain,
> +				 (p->flags & ACPI_SRAT_RINTC_ENABLED) ?
> +				 "enabled" : "disabled");
> +		}
> +		break;
> +
>  	default:
>  		pr_warn("Found unsupported SRAT entry (type = 0x%x)\n",
>  			header->type);
> @@ -448,6 +461,21 @@ acpi_parse_gi_affinity(union acpi_subtable_headers *header,
>  }
>  #endif /* defined(CONFIG_X86) || defined (CONFIG_ARM64) */
>  
> +static int __init
> +acpi_parse_rintc_affinity(union acpi_subtable_headers *header,
> +			 const unsigned long end)
Alignment doesn't look right. Could you please run checkpatch on all
the patches?

> +{
> +	struct acpi_srat_rintc_affinity *rintc_affinity;
> +
> +	rintc_affinity = (struct acpi_srat_rintc_affinity *)header;
> +	acpi_table_print_srat_entry(&header->common);
> +
> +	/* let architecture-dependent part to do it */
> +	acpi_numa_rintc_affinity_init(rintc_affinity);
> +
Is it required to have this commit first prior to architecture
functionality? I am wondering whether it is logically better to
implement the function first and then consume in next commit?

> +	return 0;
> +}
> +
>  static int __initdata parsed_numa_memblks;
>  
>  static int __init
> @@ -501,7 +529,7 @@ int __init acpi_numa_init(void)
>  
>  	/* SRAT: System Resource Affinity Table */
>  	if (!acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat)) {
> -		struct acpi_subtable_proc srat_proc[4];
> +		struct acpi_subtable_proc srat_proc[5];
>  
>  		memset(srat_proc, 0, sizeof(srat_proc));
>  		srat_proc[0].id = ACPI_SRAT_TYPE_CPU_AFFINITY;
> @@ -512,6 +540,8 @@ int __init acpi_numa_init(void)
>  		srat_proc[2].handler = acpi_parse_gicc_affinity;
>  		srat_proc[3].id = ACPI_SRAT_TYPE_GENERIC_AFFINITY;
>  		srat_proc[3].handler = acpi_parse_gi_affinity;
> +		srat_proc[4].id = ACPI_SRAT_TYPE_RINTC_AFFINITY;
> +		srat_proc[4].handler = acpi_parse_rintc_affinity;
>  
>  		acpi_table_parse_entries_array(ACPI_SIG_SRAT,
>  					sizeof(struct acpi_table_srat),
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index b7165e52b3c6..a65273db55c6 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -269,6 +269,9 @@ acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa) { }
>  
>  int acpi_numa_memory_affinity_init (struct acpi_srat_mem_affinity *ma);
>  
> +static inline void
> +acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa) { }
> +
I think this can be fit in single like as we can have upto 100
characters.

>  #ifndef PHYS_CPUID_INVALID
>  typedef u32 phys_cpuid_t;
>  #define PHYS_CPUID_INVALID (phys_cpuid_t)(-1)
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
