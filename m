Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4821DCD1283
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Apr 2024 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzU2t3b3SNCV5OjwHCGoyNzG7ugKzPIeJLzF9jiDIME=; b=mfVVbjtR0kkaCu
	Z6DmSWhURcxftt0/NZUlAqMTIDQqREtYlCkfS2LlOd/ILbxtaOGb43SwY+JzLPolvGcvZ6tQUM8rN
	1UjxnPcauhqNDk3qtnOOnSrvgUcKslks/sETV9Dr6Q/lIQWEOKbJDZDrhIT1jPBojBFEZ+UwzS9kt
	6BGiZk0sci2VUSl0IGDPRIZOOzBlR1i+pvAKsyNSvlNImqL9O8kSLSzyr99WwT2BbPdxz6f6kDofc
	ziqTK3PBACdFzBdX2ddjKv2eJVq0aBInDhARebaUYZfote97dYRNbEumoOKtXUziPXAITLFMZCGij
	ZrqQgwg7w6dtRZePWSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBb2-000000075qO-0aS6;
	Mon, 01 Apr 2024 06:56:44 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrBaz-000000075py-0hXs
	for linux-riscv@lists.infradead.org;
	Mon, 01 Apr 2024 06:56:43 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-229b7ada9e8so1689313fac.0
        for <linux-riscv@lists.infradead.org>; Sun, 31 Mar 2024 23:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711954598; x=1712559398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k5QMc5A+3aApya8s9m/eSM60TrmnXCfV5wxTtT8TbHU=;
        b=NEwON2dTT3ASD/u3kUEDE/lKlSdV9uqlKIhjh3GVQk59Jytki1S0kjCrDdVagfirGd
         jlaHduZBR9rnaaCtK6S8LMNZ/D0nRTbVVOgxe5djb9/wQpfw7CvBn0YcmNWUJu1XTKkl
         dncQTBWU+7F1emb0k9KRUUGrXsj0EGesBoEIQr3p3mGuQa0Kfc+S+u8ITubRUkOaZAQ7
         VYjfz6S9p4vwiR1o4NgPPYETZtJVvngdM1XkdXY6QaOwvA53OJNpVPftT+R7Kj+E05mJ
         S84ywVz/f7+IfaB9YkOXk5bz8n4XWGXYPsBH6thesxZFosaZpqHPLdSV4/YxNjWEzZcV
         cUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711954598; x=1712559398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5QMc5A+3aApya8s9m/eSM60TrmnXCfV5wxTtT8TbHU=;
        b=ZNEVjHaqZE3uu16wVELQu3EiJlHPG8vkSkzyKfrfxuKIVhltaOaPzNr/q5qZKqsFof
         w3ijzqYo51BCJwcd++N4FKUOmAYBFQT9B794ckwuCSn7C102XZXW9RwrOHvT5IoAWNmb
         cWdvXSC2l1fEo7Ehhb7JFaa6iloXRemvHbjT0Tb2pCnRU+ulwt88za4gru6jdcizR+Pb
         u7wq17g8k2/YGm6nXGdn6TV4mup0czfljx0VB1lBbzzX3Plvs4u2BTbfcN4OxeaQ/Pqf
         p/RzCxoFXbpi18p19/OyeeELSs15+i4238uAkkNtasQ7PoeqJt4trqIt14/5Yijb25w/
         7Deg==
X-Forwarded-Encrypted: i=1; AJvYcCU8HH4kwGbHpgzny00oMCWZDq6Y9awCO/r+bY6SZ2kO/uRDD+U926NbO7gz5TBuMp/qmCNrb5yJkdXj8TU4Vf++ZtToBJCCJy6UqF7NDU1w
X-Gm-Message-State: AOJu0YxnHHo2a5fJru0GzwtSHYqHX+oVGAxxnI2GE4/DrQp7odEUacwn
	EWLkXiZ+hTmp9A9LIrZAPG88z0KecNQKFFho+VMy87hvIFEPDt+ThL8ZFd7nKjM=
X-Google-Smtp-Source: AGHT+IG8xxvNtnP4w16j8PGzc8Gm8jhbFwQdMjb0A7TOdZGH0K91xBxYft+WGV5HplTsEJ33lk1W0Q==
X-Received: by 2002:a05:6870:95a4:b0:22a:9d77:f654 with SMTP id k36-20020a05687095a400b0022a9d77f654mr10088415oao.31.1711954598213;
        Sun, 31 Mar 2024 23:56:38 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id hu20-20020a056871529400b00222b4f5a5e0sm2695353oac.18.2024.03.31.23.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 23:56:37 -0700 (PDT)
Date: Mon, 1 Apr 2024 12:26:21 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>, Jisheng Zhang <jszhang@kernel.org>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	James Morse <james.morse@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/6] ACPI: NUMA: Add handler for SRAT RINTC affinity
 structure
Message-ID: <ZgpalRJPbP1/8VBL@sunil-laptop>
References: <cover.1709780590.git.haibo1.xu@intel.com>
 <91a4bc39444c80ea960bbd070bea489d27628cb6.1709780590.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91a4bc39444c80ea960bbd070bea489d27628cb6.1709780590.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_235641_238263_D6A26A63 
X-CRM114-Status: GOOD (  18.50  )
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

On Thu, Mar 07, 2024 at 04:47:55PM +0800, Haibo Xu wrote:
> Add RINTC affinity structure handler during parsing SRAT table.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  drivers/acpi/numa/srat.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
> index 0214518fc582..1946431c0eef 100644
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
> +			  const unsigned long end)
> +{
> +	struct acpi_srat_rintc_affinity *rintc_affinity;
> +
> +	rintc_affinity = (struct acpi_srat_rintc_affinity *)header;
> +	acpi_table_print_srat_entry(&header->common);
> +
> +	/* let architecture-dependent part to do it */
> +	acpi_numa_rintc_affinity_init(rintc_affinity);
> +
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
LGTM. Thanks!

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
