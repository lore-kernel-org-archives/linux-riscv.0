Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D66DC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 18:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/mlW2TzzYxSWogF8j3kaz3zlPD24whfSirA08QoWl4=; b=B3xWCxQy9Z0Y88
	XLH3oPjlkyEtRKYOGsge1BIIQip36iv8TMCk/M2EHAMv0EjTKDIubwAt19gEjZ5ZZVOrja4fNCkma
	3GrjYqmPD+Dj+6BkFvzngUgBFoUylZhyER0Mwu66+q3P3wO7GEZvUX+39qkwhQM0AEOrKKMdw4Hau
	idAgqW/OYc1iFsosLNc4aTIzN2qkLGZOjPAqCs5pFQmHqikGCIsfuY0MuZLDK2cqGmszlVdmgjoe4
	jJ5gpFESxTqVLiSAokko4brSOxlJp5mNRa6yYhu341VKF0hpZiIFiKooWfY75dBvzmMAiWBH51IAx
	bRQnYtus9TEWf690t/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9yu-0078gu-Jm; Fri, 03 Mar 2023 18:18:12 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9yr-0078gF-Ne
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 18:18:11 +0000
Received: by mail-pj1-x1034.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso6998829pjr.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 10:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677867486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=668IMkJ9VCN0OF++MP5t7Oo0nXOWw+hWogxo8w+yeOg=;
        b=B+fQyvUELFfrROPXXypnqqlZ7q4HthF2DYdEUF8AJmC4q/lXWSA71vfbKbevTqz/Xg
         0pYJNzLo0KssTzVsdDWr+pXFVwghw/dIqLXto6MzGATWDFjs73CQIDkbnAiv9bEIndx0
         Fu2yhOEvzD80FFCllVb02RkSz0CUUbfF7YhPXie6dIgXEe9a6WXCZ+18pTwcIjRFqHNw
         nA4LNIejj5OECwV/Zk8nYpbQeqYRiiqWDuuXSTP3uWQIom5l1RfJlCV1Xg59xEjb+3ek
         ilCqivi1Uj3RcXgpPP2PD73O49jjRREZ+P1YJHDhx0Jfg/OtU6f4c5pAwixdfDSfVXlW
         x4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677867486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=668IMkJ9VCN0OF++MP5t7Oo0nXOWw+hWogxo8w+yeOg=;
        b=zEplTUonpnk6j5YTsyKtscij9xoDkq8ecTSJCwUFzzv4JLzJlgzmwrRjTqt6COc2KJ
         mOlWc8Wu2KpYqwp4XCWD43Au6Ik+iJtop1IPYhfW5qKUiZZsWsXH3PcIGlgOoysGavY9
         qYcuaEj2Iav3bPizKOqBPs7SnE7Cterrj/IsAbSv+X+J2bBZZ9E/Wcxqn50MC3Lk+8us
         WZVHc9CxedOotqNJx+mQHSnDSUuyaH2bKA7w+b6+5m3AeQ945AKk8Y1RUq/q+TX/hrh1
         52BsEgSW3X9L9t5jsxBn9hlRvU1O3HE/FDx31ycnQ+U6kG/1V6pqkSDr2tb9zr31jLG2
         P4yw==
X-Gm-Message-State: AO0yUKVec6Pe0K3cTUOZzBZoaajXjdaEinzzTa3MWQ3j5SL1eBm0LG8j
	j74UhM/DBD/FuwcEpqCPMcKhsw==
X-Google-Smtp-Source: AK7set8OIhn2IJsNuwMRF4I+CfpWQ8X8Z8hSi4/JoVY3kI6gbMnm5DimL4tTlump/mgU2EV0usM82A==
X-Received: by 2002:a17:902:c1cd:b0:19e:32da:e458 with SMTP id c13-20020a170902c1cd00b0019e32dae458mr2030337plc.63.1677867486583;
        Fri, 03 Mar 2023 10:18:06 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id kl15-20020a170903074f00b0019945535973sm1820709plb.63.2023.03.03.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 10:18:06 -0800 (PST)
Date: Fri, 3 Mar 2023 23:47:57 +0530
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
Message-ID: <ZAI51YC6N/p6hXkU@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-12-sunilvl@ventanamicro.com>
 <20230303160556.lezccmwa7ymymxws@orel>
 <ZAI1PbEfo1Gyco1n@sunil-laptop>
 <20230303180452.qzzjdwpgvqqxdqz5@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303180452.qzzjdwpgvqqxdqz5@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_101809_810507_48A1693B 
X-CRM114-Status: GOOD (  29.24  )
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

On Fri, Mar 03, 2023 at 07:04:52PM +0100, Andrew Jones wrote:
> On Fri, Mar 03, 2023 at 11:28:21PM +0530, Sunil V L wrote:
> > On Fri, Mar 03, 2023 at 05:05:56PM +0100, Andrew Jones wrote:
> > > On Fri, Mar 03, 2023 at 07:06:38PM +0530, Sunil V L wrote:
> > > > RINTC structures in the MADT provide mapping between the hartid
> > > > and the CPU. This is required many times even at run time like
> > > > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > > > the RINTC structures and provide a function to get the correct
> > > > RINTC structure for a given cpu.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > > >  arch/riscv/include/asm/acpi.h |  9 ++++++
> > > >  arch/riscv/kernel/acpi.c      | 56 +++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 65 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > > > index 111a8ed10af1..8be16c1ef7da 100644
> > > > --- a/arch/riscv/include/asm/acpi.h
> > > > +++ b/arch/riscv/include/asm/acpi.h
> > > > @@ -61,6 +61,10 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > > >  
> > > >  int acpi_get_riscv_isa(struct acpi_table_header *table,
> > > >  		       unsigned int cpu, const char **isa);
> > > > +
> > > > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > > > +
> > > > +u32 get_acpi_id_for_cpu(int cpu);
> > > >  #else
> > > >  static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> > > >  				     unsigned int cpu, const char **isa)
> > > > @@ -68,6 +72,11 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> > > >  	return -EINVAL;
> > > >  }
> > > >  
> > > > +static inline u32 get_acpi_id_for_cpu(int cpu)
> > > > +{
> > > > +	return -1;
> > > > +}
> > > 
> > > Why do we need this stub? I wouldn't expect non-ACPI code to need an ACPI
> > > ID.
> > > 
> > > > +
> > > >  #endif /* CONFIG_ACPI */
> > > >  
> > > >  #endif /*_ASM_ACPI_H*/
> > > > diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> > > > index 81d448c41714..8b3d68d8225f 100644
> > > > --- a/arch/riscv/kernel/acpi.c
> > > > +++ b/arch/riscv/kernel/acpi.c
> > > > @@ -24,6 +24,62 @@ EXPORT_SYMBOL(acpi_disabled);
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
> > > 
> > > Why not cache the data even when its disabled? We also cache the flags so
> > > we can always check later too.
> > > 
> > Okay, doesn't harm.
> > 
On second thought, I would like to keep this check. The reason is, it
is indexed using logical cpuid and OS will not enumerate disabled CPUs.

> > > > +
> > > > +	cpuid = riscv_hartid_to_cpuid(rintc->hart_id);
> > > > +	if (cpuid >= 0 && cpuid < NR_CPUS)
> > > 
> > > What does it mean for the above check to fail? Bad ACPI tables?
> > > 
> > This can happen when SMP is disabled but platform has more CPUs.
> 
> Ah yes, NR_CPUS can be too small for the platform. Maybe a comment
> explaining that we ignore all additional cpus in the ACPI tables that
> we can't manage with the kernel's limits would be helpful here.
> 
Sure.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
