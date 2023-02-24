Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65A7C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6RT23EjDTk6+wC8gxuDZQAyc5vMDZoQguFhIEtiAYo=; b=ecrGdhAtVtCUFK
	u8IPDNivreqjUMg3tFIJl1dttXSngk6mEUW74ieIn+/L1qgjRpybPQXDjHEXQfXBPmRhn9AsAKI8F
	+2RUagguQwFPEWpX8gwlo/v5oTcdIerc0UfG4pGZXcACnGx26s+H3B3i/il2PSt5FausaVviE1WVG
	aim9gUiyXaC9K71YSPbAwJmmZ22+6rzsd/y2OnRYum2qVuFtn+snq/DyF08xI5vNZQPtTXJeRw1br
	WY0s+EFETs6xnRlpN7jAphX3dQKuh6CxodUUyW9XyUB3ZOR+qTRdWchtOUBVEjNdEG/PLhdRTFYy0
	NT6FwUr8bNfxrgZcWlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbWk-003FgV-Er; Fri, 24 Feb 2023 17:06:34 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbWh-003FeI-Ar
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:06:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id r7so14459627wrz.6
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Am7UTsrrLl5LeWU1phk06r4aR+aojXRx8nt3c68UlzA=;
        b=T8uUCWgFONTHlUy4fcf1OtN163guOpfDSvC9cRpeQQm8mOTkqbWJjpPowNk66P8aNL
         ZiGxi3v5PAdjNAlneDE1HI89mAAkmRx//62ebbndeI1ULCrhcDnTJIq1Dxf8jbGhIeFR
         wSruzc2Rw5xjIC/KNVlZVMNlz1/0Ju35kRnQduhUV1+rBY2K6M757XELJ0aSi2wceClc
         0AS7Zi75IA+FQld6Nr6zpIOGrv4RrhAuWXBZGSBX6FtgENkABF7N4Iaj25rXyeGEivYK
         C8mU9beKrjf3rsbed9ZG/jfyBcRuoasDsbLpScBbm+nVwgXYCTuFMdNg0ulgPgGd+nxS
         aL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Am7UTsrrLl5LeWU1phk06r4aR+aojXRx8nt3c68UlzA=;
        b=Cj918n7UU8Iug1RX8Q8yvMa8QJBhdrRCoshdNY13iNqTrt/NCIvz1aZy8Pm1LtBPTl
         wpul4dmL5ZpEdIMwD9+gSJIWfQ1pZwpIu2bfofji6QYsaV2NVpa5j4F+xGEhpohoWCgX
         OLPHasyZlZIXflpQHhMKvE6qZMNN6xfL8iu7no8LEoQFDEDKqVnFNMkVJhKGELoLR3ro
         1xDCyy45mN8K3atEA52nKu1omFL3XjNjuD8odSudinwmP8unXyVAsiiGjp7dMrw+FCFh
         3+bTcS7HWiYkC3huacXESUKh07rWYuOkyb0UA80+yywzHXdkx6NTNJkBswFQked/jqtg
         NTJQ==
X-Gm-Message-State: AO0yUKWW2Fyj6n1POSlhzxUYxYTKsvkEFopz0y/50uuyB04pM+bKCEQh
	t4MX5WyNWR0WOVhpLBvlOR+x/g==
X-Google-Smtp-Source: AK7set88uoDBhcGuMYfhYqWOmL9+KmCBxlE31bBrR7wtdw0dI+ThATqK199/etDNQtfA8PwDynkLKA==
X-Received: by 2002:adf:f946:0:b0:2c5:617a:5023 with SMTP id q6-20020adff946000000b002c5617a5023mr14388379wrr.71.1677258384848;
        Fri, 24 Feb 2023 09:06:24 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x4-20020adfdd84000000b002c556a4f1casm13292847wrl.42.2023.02.24.09.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:06:24 -0800 (PST)
Date: Fri, 24 Feb 2023 18:06:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 10/21] RISC-V: smpboot: Add ACPI support in smp_setup()
Message-ID: <20230224170623.d6ubdmatqfromjjm@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-11-sunilvl@ventanamicro.com>
 <20230220170843.2zkrqcnqcwbruea6@orel>
 <Y/jqye85kKU8KfDU@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/jqye85kKU8KfDU@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090631_398268_2A478B3E 
X-CRM114-Status: GOOD (  37.73  )
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

On Fri, Feb 24, 2023 at 10:20:17PM +0530, Sunil V L wrote:
> On Mon, Feb 20, 2023 at 06:08:43PM +0100, Andrew Jones wrote:
> > On Thu, Feb 16, 2023 at 11:50:32PM +0530, Sunil V L wrote:
> > > Enable SMP boot on ACPI based platforms by using the RINTC
> > > structures in the MADT table.
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > >  arch/riscv/include/asm/acpi.h |  7 ++++
> > >  arch/riscv/kernel/smpboot.c   | 70 ++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 76 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > > index 7bc49f65c86b..3c3a8ac3b37a 100644
> > > --- a/arch/riscv/include/asm/acpi.h
> > > +++ b/arch/riscv/include/asm/acpi.h
> > > @@ -60,6 +60,13 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > >  
> > >  int acpi_get_riscv_isa(struct acpi_table_header *table,
> > >  		       unsigned int cpu, const char **isa);
> > > +
> > > +#ifdef CONFIG_ACPI_NUMA
> > > +int acpi_numa_get_nid(unsigned int cpu);
> > > +#else
> > > +static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> > > +#endif /* CONFIG_ACPI_NUMA */
> > 
> > The #ifdef stuff seems premature since we're not providing an
> > implementation for acpi_numa_get_nid() or selecting ACPI_NUMA, but OK.
> > 
> Yes, will remove it. We can add as part NUMA enablement.
> 
> > > +
> > >  #else
> > >  static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> > >  				     unsigned int cpu, const char **isa)
> > > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > > index 26214ddefaa4..77630f8ed12b 100644
> > > --- a/arch/riscv/kernel/smpboot.c
> > > +++ b/arch/riscv/kernel/smpboot.c
> > > @@ -8,6 +8,7 @@
> > >   * Copyright (C) 2017 SiFive
> > >   */
> > >  
> > > +#include <linux/acpi.h>
> > >  #include <linux/arch_topology.h>
> > >  #include <linux/module.h>
> > >  #include <linux/init.h>
> > > @@ -70,6 +71,70 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> > >  	}
> > >  }
> > >  
> > > +#ifdef CONFIG_ACPI
> > > +static unsigned int cpu_count = 1;
> > > +
> > > +static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const unsigned long end)
> > > +{
> > > +	unsigned long hart;
> > > +	bool found_boot_cpu = false;
> > 
> > I guess found_boot_cpu should be static?
> > 
> Good catch!. Thanks!
> 
> > > +	struct acpi_madt_rintc *processor = (struct acpi_madt_rintc *)header;
> > > +
> > > +	/*
> > > +	 * Each RINTC structure in MADT will have a flag. If ACPI_MADT_ENABLED
> > > +	 * bit in the flag is not enabled, it means OS should not try to enable
> > > +	 * the cpu to which RINTC belongs.
> > > +	 */
> > > +	if (!(processor->flags & ACPI_MADT_ENABLED))
> > > +		return 0;
> > > +
> > > +	hart = processor->hart_id;
> > > +	if (hart < 0)
> > > +		return 0;
> > 
> > A valid hart ID is anything up to INVALID_HARTID, right? Shouldn't we only
> > be checking for INVALID_HARTID here? And what does it mean to have an
> > invalid hart ID here? It's not an issue to error/warn about?
> > 
> Yes, will check for INVALID_HARTID (though I am not really sure how it
> can be invalid). Will add a warning.
> 
> > > +	if (hart == cpuid_to_hartid_map(0)) {
> > > +		BUG_ON(found_boot_cpu);
> > 
> > Do we really want to BUG due to bad, but potentially bootable ACPI tables?
> > I'd BUG for things that can only happen when we break the code, but broken
> > ACPI tables might be something we want to complain loudly about and then
> > attempt to limp along.
> > 
> Okay. I used same logic as in DT. It may be better to use BUG instead of
> debugging weird symptoms later, right?

Maybe? I guess it depends on how obvious the symptoms are, how much they
mess things up, and how easy it is to correct the ACPI tables. I'll leave
this one up to you :-)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
