Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9120CC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ucf2NC6VxRkg0H1O7bjNRt7MrE17sXpRQTPmNnF6+VM=; b=hhfiNcZE/taX2k
	ZDfNGmDL6STyAqbycHfZt5NJAIBAdmwa5AfN3DEEpk2NO9vkGxbZu+aN51dc/f0ABkuKqRLq4s6RD
	DtebjLebPdPozc1DxQPuQDWXZwN+zWKyC36EG98vNf/1JGGFAQKb4luoq7bZjnNqdn3+UcwpBOLmG
	Jp5JRRyTl8JIfi/jPAwp803ZNiRF1ZGZpg6qYyiZgty/wh9uhHP9ZO6Mzxw6uN+yb28zpG0IRhICc
	U7Xi5VMyk5H47xCOZmCId/WKxYQxGQmnb1sw1ifceppoBMGhxBDSN0HYogXel42RrswjM8gmAC2+F
	JvGruOwSuhpJGvGTCigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1przFS-006M0z-0I;
	Thu, 27 Apr 2023 10:53:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1przFO-006Lyy-3D
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 10:53:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1a677dffb37so68818895ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 03:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682592788; x=1685184788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vN+c2Qf4794DCgKpy3WnnLz2Hf4Y/kCK2nKA6t4aJUs=;
        b=Fq5Ja2YjyFvbVzNkdRiOIU5dlfycDSYVioZvk+L7H7AgWijMtB/kB96IOGAOFxPrE4
         oQGNX8J0MA1/nC95u5IyBJMk9QmijbGEfRiCYizQ3ea1Acuwm1zYd74SIpKqirGWGkfq
         8casA1AX90wIpZ/zdy07q5LENZXYIJ7g9E+PfMzsYIALX1O4+Mm1BLMw+1H53x//4Fts
         HBazw0aLjJsNSgmE823JSce3QCziQ6qSdfLZno1tIGXymhyHurV4n7tngxs+hhTdUNyk
         3yNcr7U9gGnrtYrIIvtCaal0YRSVLNK18r/x32Eah5R3TImRRf58L0xFzhe4JZbhN3Tj
         NjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682592788; x=1685184788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vN+c2Qf4794DCgKpy3WnnLz2Hf4Y/kCK2nKA6t4aJUs=;
        b=VWyUQ2ijYobqJj/6Zh3+biYHsWs5ZXV+zpyCne+BZMlR5k4ZVIpfygHA0R4HpBDW2x
         h86yfYksgRBkuVxymLESNm+xnwvyeTnFUrDUE4iK6SBFrQH+XpPCRCoGYvSXbal2nBbY
         n1021Mt10l1MTyKpMUb8dt1mJxm8E6AvKfeGyYhdInhseLLXbL8rbP26M+S/bvANIuwe
         GAdtCdG2lN9PJIZ7+GsAD8J7xo2a07cb28ayppk+jG/72XEneZcjuwJTwBjdPfq9sAA/
         2DtEYoSDrSw8+Cwzspa8/XzOeZbY8G7lqgpvTmC6gvXAZqVdepcBb/34Dy1mHhBam7wU
         sMag==
X-Gm-Message-State: AC+VfDyUirV1pe4ErZlLS5h0TxABz7SCe7o/F8CkFlhAikpwgtdaoy6n
	4Abh0Tr1tvLAaOZpRnQWMrypCw==
X-Google-Smtp-Source: ACHHUZ5Jzdp1eS7rVCK4Ej1cP6cs+H6Q3XVG6YUmDVngHvBko039xuXWBrl8vFGWWjaw6+WmvV4gzA==
X-Received: by 2002:a17:902:e742:b0:1a6:5fdf:6555 with SMTP id p2-20020a170902e74200b001a65fdf6555mr1091261plf.50.1682592788006;
        Thu, 27 Apr 2023 03:53:08 -0700 (PDT)
Received: from sunil-laptop ([2409:4071:6e90:4e5:b276:2557:8da6:6c7e])
        by smtp.gmail.com with ESMTPSA id d1-20020a170903230100b001a9ac65ca7csm1393157plh.309.2023.04.27.03.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 03:53:07 -0700 (PDT)
Date: Thu, 27 Apr 2023 16:22:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev,
	corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, lenb@kernel.org, daniel.lezcano@linaro.org,
	tglx@linutronix.de, qianweili@huawei.com, wangzhou1@hisilicon.com,
	herbert@gondor.apana.org.au, Marc Zyngier <maz@kernel.org>,
	luzmaximilian@gmail.com, hdegoede@redhat.com, markgross@kernel.org,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	rafael@kernel.org, davem@davemloft.net, rafael.j.wysocki@intel.com
Subject: Re: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <ZEpUCD+eq/NL7LXJ@sunil-laptop>
References: <20230404182037.863533-9-sunilvl@ventanamicro.com>
 <mhng-fd6c3622-ce6c-4895-8dc9-7dbaa2ab14f4@palmer-ri-x1c9a>
 <ZEo+6rwM+c6DvlMM@sunil-laptop>
 <qqukqrc45zqyjh5bwpjpuiweogwtapuw7qqjjpubjwvteum6ig@esjfwqdivhpa>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <qqukqrc45zqyjh5bwpjpuiweogwtapuw7qqjjpubjwvteum6ig@esjfwqdivhpa>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_035311_034382_D41359C1 
X-CRM114-Status: GOOD (  50.46  )
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

On Thu, Apr 27, 2023 at 12:25:42PM +0200, Andrew Jones wrote:
> On Thu, Apr 27, 2023 at 02:52:50PM +0530, Sunil V L wrote:
> > Hi Palmer,
> > 
> > On Wed, Apr 26, 2023 at 11:45:00AM -0700, Palmer Dabbelt wrote:
> > > On Tue, 04 Apr 2023 11:20:22 PDT (-0700), sunilvl@ventanamicro.com wrote:
> > > > RINTC structures in the MADT provide mapping between the hartid
> > > > and the CPU. This is required many times even at run time like
> > > > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > > > the RINTC structures and provide a function to get the correct
> > > > RINTC structure for a given cpu.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > > >  arch/riscv/include/asm/acpi.h |  2 ++
> > > >  arch/riscv/kernel/acpi.c      | 60 +++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 62 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > > > index 9be52b6ffae1..1606dce8992e 100644
> > > > --- a/arch/riscv/include/asm/acpi.h
> > > > +++ b/arch/riscv/include/asm/acpi.h
> > > > @@ -59,6 +59,8 @@ static inline bool acpi_has_cpu_in_madt(void)
> > > > 
> > > >  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > > > 
> > > > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > > > +u32 get_acpi_id_for_cpu(int cpu);
> > > >  #endif /* CONFIG_ACPI */
> > > > 
> > > >  #endif /*_ASM_ACPI_H*/
> > > > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> > > > index 81d448c41714..40ab55309c70 100644
> > > > --- a/arch/riscv/kernel/acpi.c
> > > > +++ b/arch/riscv/kernel/acpi.c
> > > > @@ -24,6 +24,66 @@ EXPORT_SYMBOL(acpi_disabled);
> > > >  int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
> > > >  EXPORT_SYMBOL(acpi_pci_disabled);
> > > > 
> > > > +static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
> > > > +
> > > > +static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
> > > > +{
> > > > +	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
> > > > +	int cpuid;
> > > > +
> > > > +	if (!(rintc->flags & ACPI_MADT_ENABLED))
> > > > +		return 0;
> > > > +
> > > > +	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
> > > 
> > > Unless I'm missing something, this races with CPUs coming online.  Maybe
> > > that's a rare enough case we don't care, but I think we'd also just have
> > > simpler logic if we fixed it...
> > > 
> > This depend only on cpuid_to_hartid_map filled up. I wish I could
> > initialize this RINTC mapping in setup_smp() itself like ARM64. But in
> > RISC-V, this file smpboot.c gets built only when CONFIG_SMP is enabled.
> > Hence, we need to initialize this array outside of setup_smp().
> > 
> > I can update the code to initialize this from setup_arch() immediately
> > after setup_smp() if ACPI is enabled. That should avoid the global
> > variable check also. Let me know if you prefer this.
> > 
> > > > +	/*
> > > > +	 * When CONFIG_SMP is disabled, mapping won't be created for
> > > > +	 * all cpus.
> > > > +	 * CPUs more than NR_CPUS, will be ignored.
> > > > +	 */
> > > > +	if (cpuid >= 0 && cpuid < NR_CPUS)
> > > > +		cpu_madt_rintc[cpuid] = *rintc;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int acpi_init_rintc_array(void)
> > > > +{
> > > > +	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
> > > > +		return 0;
> > > > +
> > > > +	return -ENODEV;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Instead of parsing (and freeing) the ACPI table, cache
> > > > + * the RINTC structures since they are frequently used
> > > > + * like in  cpuinfo.
> > > > + */
> > > > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> > > > +{
> > > > +	static bool rintc_init_done;
> > > 
> > > ... basically just get rid of this global variable, and instead have a
> > > 
> > >    if (!&cpu_madt_rintc[cpu])
> > >        ... parse ...
> > >    return &cpu_madt_rintc[cpu];
> > > 
> > > that'd probably let us get rid of a handful of these helpers too, as now
> > > it's just a call to the parsing bits.
> > > 
> > I am afraid this (!&cpu_madt_rintc[cpu]) check won't work since we are
> > not caching the RINTC pointers but actual contents itself. So, the
> > address is always valid. However, as per Drew's earlier feedback I am
> > going to reduce one helper. I am planning to send the next version of
> > this patch once 6.4 rc1 is available since the ACPICA patches are merged
> > now.
> > 
> > > > +
> > > > +	if (!rintc_init_done) {
> > > > +		if (acpi_init_rintc_array()) {
> > > > +			pr_err("No valid RINTC entries exist\n");
> > > > +			return NULL;
> > > > +		}
> > > > +
> > > > +		rintc_init_done = true;
> > > > +	}
> > > > +
> > > > +	return &cpu_madt_rintc[cpu];
> > > > +}
> > > > +
> > > > +u32 get_acpi_id_for_cpu(int cpu)
> > > > +{
> > > > +	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
> > > > +
> > > > +	BUG_ON(!rintc);
> > > 
> > > We should have some better error reporting here.  It looks like all the
> > > callerss of get_acpi_id_for_cpu() are tolerant of a nonsense ID being
> > > returned, so maybe we just pr_warn() something users can understand and then
> > > return -1 or something?
> > > 
> > 
> > RINTC is mandatory for ACPI systems. Also, all 32bit values are valid
> > for UID. So, there is no bogus value we can return. 
> > 
> > Actually, I just realized this check is redundant. It will never be NULL
> > since it is a static array. So, we can just get rid of the BUG.
> 
> It can be NULL on the first call of acpi_cpu_get_madt_rintc(), which is
> a good time to BUG if there's isn't an RINTC.
> 
Sorry, I mean if we change the initialization to get called from
setup_arch, then we can get rid of this check along with global variable
check, correct?

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
