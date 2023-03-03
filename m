Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B90C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijsrwBXsesWjpFBBy4E0ghxvbPI2RJbr0AUJEEqeyGw=; b=dNvK45Yt4W7E7P
	HPZFBynHMkc4HWjbyPZxp7aqkTk9tTNj4+ai6WAv1HlgkcwUki8lrgXea8zJA8jO0mV4YLYjeAcga
	1pJZ5PmoUWRdz3pOoufz9ldk+WEIIXDc1Z5v10zlWE2TzF4hG4tMUMmAzFEUNtZWCVKe8M9Ht5VMY
	7wF357zPrYePKfm57v0NWjqFKVoBgBaY1dv6M3ChtujFcrW03nPMu3Reap83D/4z5VD9H0/ClR0W/
	aOwZYrOX+/a9xiKGpt14O9f4sEK7CJWePpsdJz65becVgqvEd7LCbrvMP/yVKvD4d6jeS4pOCGtJa
	wUU/hmBQ1JI0gBAT1pWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9ft-0076vv-VO; Fri, 03 Mar 2023 17:58:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9fq-0076vU-QO
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:58:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id v11so3521041plz.8
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677866310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Cg/YaccXt9BVimh0sJvQg45Ng1kPKLiUeFiukAx3mI=;
        b=fsZm0F5xJBvzGCmg2YA4aKJsrHqbZdqvaBPwcmU24A2rc34KTvBqcuOTYGhO0HEd+b
         PuFhsBFn2tMpj1csGjrXPuaOUy+ocHeTIXWeFLlwKpkEig6Xcs2aEt8uZnHDz+2KNXeA
         vbWUvJBn9yhXEdHeMFwpQs1ncStO+GddmsZl1A6r94my0byHWQFEMNsa8u+ajc/YGLM6
         BowCzWrkOk75+vXdWY2sGR0gLU4izSd+kG9M53B6H4fHVpTiWG/c/xkubVT3fMwnO9j4
         CQJUTivfbCeQz77T1dhHjg8jJeSiixDMke2GTE0bRkMoH/ZreIgQsHpud5vwSZgy33JW
         KEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677866310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Cg/YaccXt9BVimh0sJvQg45Ng1kPKLiUeFiukAx3mI=;
        b=o2nvoedVdpvHsowNd30HrggZfrusevrncUreCMWIc0L+ttsqRAjHbbH7fRxSnMQfRo
         irVkhAVJPulF224yQzov/KdWaGo4yGEBnTaqJoNpB/KysOSITtpJa2Zre5lOu85lMJMH
         +J0ol9kod1rzLKoSeodjAnD8S2hFBaPVqlQGfNC4hkNi5uyb+VKyHru27iiprn/lDTHM
         rrwOFAi864aaAX5fMdJ7AV/+tTq1wPo9dDR5Vyy/zWXZwiyBhRgGwSl3A3k2MtYoabem
         5GHSoiOl5TQzgG6/0VWSZJZx9bImcpJ9HEHgOq9moHYnIHmXOkjMLL02vtzr/T4ALngq
         7Uow==
X-Gm-Message-State: AO0yUKU66xPAcFtE3Ti9oLdZUKYkQPna4pvoLWiGFV8nSYtY6bi69B02
	GGfIy7lJdkYVHTq84AseFkKF+g==
X-Google-Smtp-Source: AK7set+Qy8Ubck7LjKovgkMCa8jJA63wlDYq9pBqNh624i74daJ2JrXhCOe699UXsZLxFFk2f4hWFw==
X-Received: by 2002:a17:902:ec91:b0:19b:2332:18cb with SMTP id x17-20020a170902ec9100b0019b233218cbmr2878889plg.1.1677866310101;
        Fri, 03 Mar 2023 09:58:30 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id kn13-20020a170903078d00b00189e7cb8b89sm1797207plb.127.2023.03.03.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 09:58:29 -0800 (PST)
Date: Fri, 3 Mar 2023 23:28:21 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 11/20] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <ZAI1PbEfo1Gyco1n@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-12-sunilvl@ventanamicro.com>
 <20230303160556.lezccmwa7ymymxws@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303160556.lezccmwa7ymymxws@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_095830_904629_C69BD77C 
X-CRM114-Status: GOOD (  28.79  )
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

On Fri, Mar 03, 2023 at 05:05:56PM +0100, Andrew Jones wrote:
> On Fri, Mar 03, 2023 at 07:06:38PM +0530, Sunil V L wrote:
> > RINTC structures in the MADT provide mapping between the hartid
> > and the CPU. This is required many times even at run time like
> > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > the RINTC structures and provide a function to get the correct
> > RINTC structure for a given cpu.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/include/asm/acpi.h |  9 ++++++
> >  arch/riscv/kernel/acpi.c      | 56 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 65 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > index 111a8ed10af1..8be16c1ef7da 100644
> > --- a/arch/riscv/include/asm/acpi.h
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -61,6 +61,10 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> >  
> >  int acpi_get_riscv_isa(struct acpi_table_header *table,
> >  		       unsigned int cpu, const char **isa);
> > +
> > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > +
> > +u32 get_acpi_id_for_cpu(int cpu);
> >  #else
> >  static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> >  				     unsigned int cpu, const char **isa)
> > @@ -68,6 +72,11 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> >  	return -EINVAL;
> >  }
> >  
> > +static inline u32 get_acpi_id_for_cpu(int cpu)
> > +{
> > +	return -1;
> > +}
> 
> Why do we need this stub? I wouldn't expect non-ACPI code to need an ACPI
> ID.
> 
> > +
> >  #endif /* CONFIG_ACPI */
> >  
> >  #endif /*_ASM_ACPI_H*/
> > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> > index 81d448c41714..8b3d68d8225f 100644
> > --- a/arch/riscv/kernel/acpi.c
> > +++ b/arch/riscv/kernel/acpi.c
> > @@ -24,6 +24,62 @@ EXPORT_SYMBOL(acpi_disabled);
> >  int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
> >  EXPORT_SYMBOL(acpi_pci_disabled);
> >  
> > +static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
> > +
> > +static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
> > +{
> > +	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
> > +	int cpuid;
> > +
> > +	if (!(rintc->flags & ACPI_MADT_ENABLED))
> > +		return 0;
> 
> Why not cache the data even when its disabled? We also cache the flags so
> we can always check later too.
> 
Okay, doesn't harm.

> > +
> > +	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
> > +	if (cpuid >= 0 && cpuid < NR_CPUS)
> 
> What does it mean for the above check to fail? Bad ACPI tables?
> 
This can happen when SMP is disabled but platform has more CPUs.

> > +		cpu_madt_rintc[cpuid] = *rintc;
> > +
> > +	return 0;
> > +}
> > +
> > +static int acpi_init_rintc_array(void)
> > +{
> > +	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
> > +		return 0;
> > +
> > +	return -ENODEV;
> > +}
> > +
> > +/*
> > + * Instead of parsing (and freeing) the ACPI table, cache
> > + * the RINTC structures since they are frequently used
> > + * like in  cpuinfo.
> > + */
> > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> > +{
> > +	static bool rintc_init_done;
> > +
> > +	if (!rintc_init_done) {
> > +		if (acpi_init_rintc_array()) {
> > +			pr_err("No valid RINTC entries exist\n");
> > +			return NULL;
> > +		}
> > +
> > +		rintc_init_done = true;
> > +	}
> > +
> > +	return &cpu_madt_rintc[cpu];
> > +}
> > +
> > +u32 get_acpi_id_for_cpu(int cpu)
> > +{
> > +	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
> > +
> > +	if (!rintc)
> > +		return -1;
> 
> Is -1 defined as an invalid ACPI ID? I'm wondering if we shouldn't just
> BUG in acpi_init_rintc_array() if we fail to initialize and then we can
> unconditionally return rintc->uid here.
>
Thanks!. Will update this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
