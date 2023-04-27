Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF41C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 09:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ce7MGMaJBJNp15oLM661rohs0forY1dMZAuKqxzmQaw=; b=lUeBWz2nVcpvq8
	H9Aops3CXJdMYdIdLuwb7EUG9XP5c1JReXjHARNxRGitjTZzB7AOCPv+LdPPl4WArKYCG94agqL6u
	eG1qPjNsQosUsTVFByLG6H51chcauOhbhL/c2dWyis3wwMqcQX4C1L7Vp0GMExbWV3A9P8D+9Hcl2
	/p1H5KG166BaIn59Z6IXK4XHYLmgxFCIai0V3SMMtfKERV+f3P+fnTzdxa/+CGE2zvURELPg4tJev
	0At5vKLtiTK/F2S5YciTfz8vl6aKdSLKeaC17ov3R3WsXak3Jh18IbRqqYxVkwYY5GyuOO614N48i
	J1LnHzbSP+qQxsh/B+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prxqG-005ycU-20;
	Thu, 27 Apr 2023 09:23:08 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prxqE-005yan-0B
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 09:23:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63f273b219eso4207167b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 02:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682587383; x=1685179383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4tmAtbJaHWfTAbFkdGyP1UUwCahMULqyPQK3zTjGzc=;
        b=K5jLEqhDbTkTtYuPE6+Ra/lfEGtBsFz6bD+QwskySxg855wiFn0qDjLEfswlGFfhfi
         tOdnFRv/n7SuEaT5szOXglGImaRKUHKwKldEAxzxH8OTFpP2ASczXusutBgYCAJ/IM9T
         qo/cclpS2UtxF+D7UaTNfNS7UgHAlWLwobc28ylRvM2rShK2glsBS8xQIVZbUdIkEdf3
         ZAokL+mH+OIn/pqvNLquuERSdwdpP2zLejahscptpuC6+PX+rVTUqyzeT4HuLEKlWgVz
         xzCrcMujA0CBmsmbswdLf0XRvh1srcH3cIpJyWqm2bh3PmIcbbDULRMbPmHyZGvksUDj
         UbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682587383; x=1685179383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4tmAtbJaHWfTAbFkdGyP1UUwCahMULqyPQK3zTjGzc=;
        b=PLJmtSEKcR45a3Q9oo+B2g7T7YzB3cBiShOTCMl9lBURXKxF/OsIeHRfFAjWtj2hYW
         iR4Ks0l3MENxyRSnT8lu3CY9KSIYlzLh3SE/PWDVknT1JChSNppGDSMoGN7KT21RUguC
         LXi84PXjzl/L9Ja8buKPvmRfqjlrDGH0KIt9gcgMu3dpYTbIUNE9OM0Tc/kHwYI0TgRX
         33xkY2CCKKsVyCOrVX2uPPi8FDnoORoChlnNDPdDo1DDONCwdXgdiUARw9FUP6pEcT8r
         1jxu5vqtPP+mSwQRKSef/3POrAApf5AIu/obRYCszz17XCF5d8tnvmiq7D4UxTrfEpjY
         hfgQ==
X-Gm-Message-State: AC+VfDygneuWNYa3ms7PSfb/JNFI34seXLZNgtaWZqWHqz6mhSvwcib0
	tKNimFlCmlZfjHRmD4zC5KYPRQ==
X-Google-Smtp-Source: ACHHUZ7RWci9fHcfj1Kz5md3jazQZh7oA/8a9iSA8EEYdE24w8faCyvnC3O4ecPFfRxC69G0cl789g==
X-Received: by 2002:a05:6a00:22ca:b0:63b:5c82:e21a with SMTP id f10-20020a056a0022ca00b0063b5c82e21amr1814185pfj.1.1682587382560;
        Thu, 27 Apr 2023 02:23:02 -0700 (PDT)
Received: from sunil-laptop ([2409:4071:6e90:4e5:b276:2557:8da6:6c7e])
        by smtp.gmail.com with ESMTPSA id i66-20020a62c145000000b0063d318699f9sm12712205pfg.48.2023.04.27.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 02:23:02 -0700 (PDT)
Date: Thu, 27 Apr 2023 14:52:50 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, corbet@lwn.net,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	lenb@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	qianweili@huawei.com, wangzhou1@hisilicon.com,
	herbert@gondor.apana.org.au, Marc Zyngier <maz@kernel.org>,
	luzmaximilian@gmail.com, hdegoede@redhat.com, markgross@kernel.org,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	rafael@kernel.org, davem@davemloft.net, rafael.j.wysocki@intel.com
Subject: Re: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <ZEo+6rwM+c6DvlMM@sunil-laptop>
References: <20230404182037.863533-9-sunilvl@ventanamicro.com>
 <mhng-fd6c3622-ce6c-4895-8dc9-7dbaa2ab14f4@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-fd6c3622-ce6c-4895-8dc9-7dbaa2ab14f4@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_022306_097979_533FCE91 
X-CRM114-Status: GOOD (  38.35  )
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

Hi Palmer,

On Wed, Apr 26, 2023 at 11:45:00AM -0700, Palmer Dabbelt wrote:
> On Tue, 04 Apr 2023 11:20:22 PDT (-0700), sunilvl@ventanamicro.com wrote:
> > RINTC structures in the MADT provide mapping between the hartid
> > and the CPU. This is required many times even at run time like
> > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > the RINTC structures and provide a function to get the correct
> > RINTC structure for a given cpu.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/include/asm/acpi.h |  2 ++
> >  arch/riscv/kernel/acpi.c      | 60 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 62 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > index 9be52b6ffae1..1606dce8992e 100644
> > --- a/arch/riscv/include/asm/acpi.h
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -59,6 +59,8 @@ static inline bool acpi_has_cpu_in_madt(void)
> > 
> >  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > 
> > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > +u32 get_acpi_id_for_cpu(int cpu);
> >  #endif /* CONFIG_ACPI */
> > 
> >  #endif /*_ASM_ACPI_H*/
> > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> > index 81d448c41714..40ab55309c70 100644
> > --- a/arch/riscv/kernel/acpi.c
> > +++ b/arch/riscv/kernel/acpi.c
> > @@ -24,6 +24,66 @@ EXPORT_SYMBOL(acpi_disabled);
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
> > +
> > +	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
> 
> Unless I'm missing something, this races with CPUs coming online.  Maybe
> that's a rare enough case we don't care, but I think we'd also just have
> simpler logic if we fixed it...
> 
This depend only on cpuid_to_hartid_map filled up. I wish I could
initialize this RINTC mapping in setup_smp() itself like ARM64. But in
RISC-V, this file smpboot.c gets built only when CONFIG_SMP is enabled.
Hence, we need to initialize this array outside of setup_smp().

I can update the code to initialize this from setup_arch() immediately
after setup_smp() if ACPI is enabled. That should avoid the global
variable check also. Let me know if you prefer this.

> > +	/*
> > +	 * When CONFIG_SMP is disabled, mapping won't be created for
> > +	 * all cpus.
> > +	 * CPUs more than NR_CPUS, will be ignored.
> > +	 */
> > +	if (cpuid >= 0 && cpuid < NR_CPUS)
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
> 
> ... basically just get rid of this global variable, and instead have a
> 
>    if (!&cpu_madt_rintc[cpu])
>        ... parse ...
>    return &cpu_madt_rintc[cpu];
> 
> that'd probably let us get rid of a handful of these helpers too, as now
> it's just a call to the parsing bits.
> 
I am afraid this (!&cpu_madt_rintc[cpu]) check won't work since we are
not caching the RINTC pointers but actual contents itself. So, the
address is always valid. However, as per Drew's earlier feedback I am
going to reduce one helper. I am planning to send the next version of
this patch once 6.4 rc1 is available since the ACPICA patches are merged
now.

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
> > +	BUG_ON(!rintc);
> 
> We should have some better error reporting here.  It looks like all the
> callerss of get_acpi_id_for_cpu() are tolerant of a nonsense ID being
> returned, so maybe we just pr_warn() something users can understand and then
> return -1 or something?
> 

RINTC is mandatory for ACPI systems. Also, all 32bit values are valid
for UID. So, there is no bogus value we can return. 

Actually, I just realized this check is redundant. It will never be NULL
since it is a static array. So, we can just get rid of the BUG.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
