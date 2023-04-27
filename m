Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE3BC77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iu0m1dbCS1SVMomA597IOASSup+J6V5nXy9B13HRZBU=; b=f1Q3JgsNksAOL2
	LkvUi6RzJi6U1TGDYNNgZBYc4ODfyeFsRU5P6VaTtbfJ0oGFaNxx+5cIhuJKrTEN/Msnoc9nB21bs
	AWHbM0tGGkKQTUaNC5SVfft4pxVEJPUjhj6uGunBwqo9P8jsRkiNocn4vOvwTtCVVoiGoageDwTN8
	BSvpvV7OFfCfEEzip7T7+pt3dxG2cvnsJEcqbVTrWmRpjkBatssEVzBii1aDZp6M1hKypfoP3uMCE
	WFaYnngAgAwA3nBJUxwefp1AJWDnrcbtmuc0KYjVVIZrrZPOWmDq3gq2X9CBuWcNKo2bkTKNYLI3F
	ofRSv1JkGCrxsXc3fWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps1R3-006c78-1u;
	Thu, 27 Apr 2023 13:13:21 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps1R0-006c6c-0P
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 13:13:20 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-504efe702d5so12575380a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 06:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682601195; x=1685193195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ymSyk174Q/aRoWNbYUHHG8erPdr3iK0BpQYJmy801k=;
        b=HIgpg5N7XJjzbxz+z7IgxgVQ5128JI4dtyixvRnwGndbaq5YVIPtJHd+DaOorca26k
         cr99XyR833joae9EIrXDFvGYDfgdx97lSuMToDnUqFhu9JA7SVMQJHER3oDi1Rp3QEOF
         mLPJ2w5t3aMH0JrLeMU3g1mTm+pQghwAf7n/nH6OPPuRRH8u1MJicYy4tnsZoD/6nenc
         EeThR0OHBw47zlfBPnB+cq15TJ0QLrtuGCvLMwLcZZYUg6DqV/RYw9pkk1E3rpyPuXst
         ayDxj8TjQBJExMKsUnsMDqZQTfzm6bZlQ6b/oOXxuNOUqTuU/9i+0PZUQfGkDAoFnKXE
         v4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682601195; x=1685193195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ymSyk174Q/aRoWNbYUHHG8erPdr3iK0BpQYJmy801k=;
        b=TlkRC5AzaIbBN/UyC2RyAEnIXCw/ja0ud2Ebnm+7Jak9kRB0mKUBaKQYlhghF4WPjX
         Y+/POPwis/na5zEvhewZ/fQfhwjS2uJ1NMyP3S/8YU2gyQRP1HeHAGknmPFvO1i2roAO
         5DZhE8SD+gSD68xyQvDu3szvFU0pb+3EJMqp3QRIFNgSktxOAyl3bogaQUNVsgFwVYhZ
         1jfAjEQF72fO1GbD7ClxfHzo3lnxYtNpYtDNvoBG6uNmuiv/fw3HmKi5mOcWpQd2q+sB
         F+TdY0IChxP0gjmwwa+7yR2aszhPGIelgN/ciM+HPoT6K44yVMhjNohBgSfQlg1s4x3+
         9Lcg==
X-Gm-Message-State: AC+VfDyxWeFHf3h8eC+y3hKSPSqAG0sU+a/H58/Fpl+LCzL6yifWKyVx
	3Vgv2r/83dgB8dQHhOw3QuC3kA==
X-Google-Smtp-Source: ACHHUZ4WhZAaEZw48L4mS8JWz5hV+DtJHTNQLlKB9/bS0XJh3GNfgim97pYJpFirPWLxY6K5pRGJaA==
X-Received: by 2002:a17:907:7da9:b0:94b:cd7c:59f4 with SMTP id oz41-20020a1709077da900b0094bcd7c59f4mr1742934ejc.16.1682601195517;
        Thu, 27 Apr 2023 06:13:15 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id t25-20020a17090616d900b009534603453dsm9503863ejd.131.2023.04.27.06.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 06:13:14 -0700 (PDT)
Date: Thu, 27 Apr 2023 15:13:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev, 
	corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	lenb@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	qianweili@huawei.com, wangzhou1@hisilicon.com, herbert@gondor.apana.org.au, 
	Marc Zyngier <maz@kernel.org>, luzmaximilian@gmail.com, hdegoede@redhat.com, 
	markgross@kernel.org, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
	rafael@kernel.org, davem@davemloft.net, rafael.j.wysocki@intel.com
Subject: Re: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <q7bug5j62ceniiif5joz5i73g7lbyebawbokcang4ctit4i634@e5bd6zqozbau>
References: <20230404182037.863533-9-sunilvl@ventanamicro.com>
 <mhng-fd6c3622-ce6c-4895-8dc9-7dbaa2ab14f4@palmer-ri-x1c9a>
 <ZEo+6rwM+c6DvlMM@sunil-laptop>
 <qqukqrc45zqyjh5bwpjpuiweogwtapuw7qqjjpubjwvteum6ig@esjfwqdivhpa>
 <ZEpUCD+eq/NL7LXJ@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZEpUCD+eq/NL7LXJ@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_061318_173435_85125ED0 
X-CRM114-Status: GOOD (  53.28  )
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

On Thu, Apr 27, 2023 at 04:22:56PM +0530, Sunil V L wrote:
> On Thu, Apr 27, 2023 at 12:25:42PM +0200, Andrew Jones wrote:
> > On Thu, Apr 27, 2023 at 02:52:50PM +0530, Sunil V L wrote:
> > > Hi Palmer,
> > > 
> > > On Wed, Apr 26, 2023 at 11:45:00AM -0700, Palmer Dabbelt wrote:
> > > > On Tue, 04 Apr 2023 11:20:22 PDT (-0700), sunilvl@ventanamicro.com wrote:
> > > > > RINTC structures in the MADT provide mapping between the hartid
> > > > > and the CPU. This is required many times even at run time like
> > > > > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > > > > the RINTC structures and provide a function to get the correct
> > > > > RINTC structure for a given cpu.
> > > > > 
> > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > > ---
> > > > >  arch/riscv/include/asm/acpi.h |  2 ++
> > > > >  arch/riscv/kernel/acpi.c      | 60 +++++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 62 insertions(+)
> > > > > 
> > > > > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > > > > index 9be52b6ffae1..1606dce8992e 100644
> > > > > --- a/arch/riscv/include/asm/acpi.h
> > > > > +++ b/arch/riscv/include/asm/acpi.h
> > > > > @@ -59,6 +59,8 @@ static inline bool acpi_has_cpu_in_madt(void)
> > > > > 
> > > > >  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > > > > 
> > > > > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > > > > +u32 get_acpi_id_for_cpu(int cpu);
> > > > >  #endif /* CONFIG_ACPI */
> > > > > 
> > > > >  #endif /*_ASM_ACPI_H*/
> > > > > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> > > > > index 81d448c41714..40ab55309c70 100644
> > > > > --- a/arch/riscv/kernel/acpi.c
> > > > > +++ b/arch/riscv/kernel/acpi.c
> > > > > @@ -24,6 +24,66 @@ EXPORT_SYMBOL(acpi_disabled);
> > > > >  int acpi_pci_disabled = 1;	/* skip ACPI PCI scan and IRQ initialization */
> > > > >  EXPORT_SYMBOL(acpi_pci_disabled);
> > > > > 
> > > > > +static struct acpi_madt_rintc cpu_madt_rintc[NR_CPUS];
> > > > > +
> > > > > +static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
> > > > > +{
> > > > > +	struct acpi_madt_rintc *rintc = (struct acpi_madt_rintc *)header;
> > > > > +	int cpuid;
> > > > > +
> > > > > +	if (!(rintc->flags & ACPI_MADT_ENABLED))
> > > > > +		return 0;
> > > > > +
> > > > > +	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
> > > > 
> > > > Unless I'm missing something, this races with CPUs coming online.  Maybe
> > > > that's a rare enough case we don't care, but I think we'd also just have
> > > > simpler logic if we fixed it...
> > > > 
> > > This depend only on cpuid_to_hartid_map filled up. I wish I could
> > > initialize this RINTC mapping in setup_smp() itself like ARM64. But in
> > > RISC-V, this file smpboot.c gets built only when CONFIG_SMP is enabled.
> > > Hence, we need to initialize this array outside of setup_smp().
> > > 
> > > I can update the code to initialize this from setup_arch() immediately
> > > after setup_smp() if ACPI is enabled. That should avoid the global
> > > variable check also. Let me know if you prefer this.
> > > 
> > > > > +	/*
> > > > > +	 * When CONFIG_SMP is disabled, mapping won't be created for
> > > > > +	 * all cpus.
> > > > > +	 * CPUs more than NR_CPUS, will be ignored.
> > > > > +	 */
> > > > > +	if (cpuid >= 0 && cpuid < NR_CPUS)
> > > > > +		cpu_madt_rintc[cpuid] = *rintc;
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static int acpi_init_rintc_array(void)
> > > > > +{
> > > > > +	if (acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0) > 0)
> > > > > +		return 0;
> > > > > +
> > > > > +	return -ENODEV;
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * Instead of parsing (and freeing) the ACPI table, cache
> > > > > + * the RINTC structures since they are frequently used
> > > > > + * like in  cpuinfo.
> > > > > + */
> > > > > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> > > > > +{
> > > > > +	static bool rintc_init_done;
> > > > 
> > > > ... basically just get rid of this global variable, and instead have a
> > > > 
> > > >    if (!&cpu_madt_rintc[cpu])
> > > >        ... parse ...
> > > >    return &cpu_madt_rintc[cpu];
> > > > 
> > > > that'd probably let us get rid of a handful of these helpers too, as now
> > > > it's just a call to the parsing bits.
> > > > 
> > > I am afraid this (!&cpu_madt_rintc[cpu]) check won't work since we are
> > > not caching the RINTC pointers but actual contents itself. So, the
> > > address is always valid. However, as per Drew's earlier feedback I am
> > > going to reduce one helper. I am planning to send the next version of
> > > this patch once 6.4 rc1 is available since the ACPICA patches are merged
> > > now.
> > > 
> > > > > +
> > > > > +	if (!rintc_init_done) {
> > > > > +		if (acpi_init_rintc_array()) {
> > > > > +			pr_err("No valid RINTC entries exist\n");
> > > > > +			return NULL;
> > > > > +		}
> > > > > +
> > > > > +		rintc_init_done = true;
> > > > > +	}
> > > > > +
> > > > > +	return &cpu_madt_rintc[cpu];
> > > > > +}
> > > > > +
> > > > > +u32 get_acpi_id_for_cpu(int cpu)
> > > > > +{
> > > > > +	struct acpi_madt_rintc *rintc = acpi_cpu_get_madt_rintc(cpu);
> > > > > +
> > > > > +	BUG_ON(!rintc);
> > > > 
> > > > We should have some better error reporting here.  It looks like all the
> > > > callerss of get_acpi_id_for_cpu() are tolerant of a nonsense ID being
> > > > returned, so maybe we just pr_warn() something users can understand and then
> > > > return -1 or something?
> > > > 
> > > 
> > > RINTC is mandatory for ACPI systems. Also, all 32bit values are valid
> > > for UID. So, there is no bogus value we can return. 
> > > 
> > > Actually, I just realized this check is redundant. It will never be NULL
> > > since it is a static array. So, we can just get rid of the BUG.
> > 
> > It can be NULL on the first call of acpi_cpu_get_madt_rintc(), which is
> > a good time to BUG if there's isn't an RINTC.
> > 
> Sorry, I mean if we change the initialization to get called from
> setup_arch, then we can get rid of this check along with global variable
> check, correct?

Sounds good to me, but now I think we're pushing the question of whether
to BUG or not on a missing RINTC to that new init function, because
otherwise we'll still end up in get_acpi_id_for_cpu() eventually with
or without a valid rintc from which we get the uid (and the uid has no
specified bogus value).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
