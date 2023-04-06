Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4466C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 03:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESti9Rnp3OvITEBvMhQXD17MeT5OdaD0UEjeTAr4i5I=; b=J8/NXC3uCGu9t7
	EE0HoMKpqCB/LJ0ANLK3p0Oa3IjMuTP7Q+FBAB8U+psHDU3LbXqgJkK5gJwaVO7exsvTs9xp+qCvP
	cGr+hpNE5t84OnJY9EnHL0tDMgH7d7Mj7rSANH9BsBYZ5qT3Rn3rGOnu9zOH+dbfWxBz+c7XHf2yE
	R7vgFWRKnHdL4cNVBH0sj9lu1I81/tm/oRRJ5a4aYW8U4SY7GgdgNfynPJviMUt3/10qRJ4pGXWGe
	qDoZpPZK9ugIM7RJe2GJ63rhKnoNuYaSKWptfno+f+HkmeUpq+MmS8LEhARtX1lBnjTlACOKWBT3V
	NYu3jzElay6X6Aw8od/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkGaE-006FPk-30;
	Thu, 06 Apr 2023 03:46:46 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkGaC-006FPI-2m
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 03:46:46 +0000
Received: by mail-oi1-x231.google.com with SMTP id w13so16816876oik.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 20:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680752803; x=1683344803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e2HC8P/hmf80QzMRLst56jAGHCnOy19Nb1SfXkyKnng=;
        b=OdCYn4+VByG1SRoySM17nK1AXgMbZVRXlJ5uIqR+tfwGuKggZw222F7duYA9Vb89YK
         27pnFjed1vkAWjIH3w9kqNNxzyvrRs3I40xpJc8gABvfqFbm84Ah6fCAVV+EpDcHKNEM
         T6LqevGxh7v6QeMq8lX+Fn0O2uSvDEMaPjduq6COs02ZgwWQq7TWFyzEWjpUoxp8g7/W
         HeDHWwDs5YlngSYn9Y4eEcJFWPL1d9LCI5B4h6ljv4T9xfXx5ZEmdJDMYKPLEVyc5Sh4
         e44ljucW2T/N/BZX5bfGqLHRrTCgxLP8TCM5oFflHLmQC3TPZL8Zpd5lDO1iSTWcWsjf
         DH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680752803; x=1683344803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2HC8P/hmf80QzMRLst56jAGHCnOy19Nb1SfXkyKnng=;
        b=OCQmmV6hJgQbJXU8wWXsYAE3I++Ga2b8o7b1a59q6vH8g4gksBcSBmo+pZjkAC5HeH
         T45gs5+wxtlRCm2HctbE4s62IkfuN1jt1Q+1y7gamt3++7jycgvAQr/2REylArGWiYW9
         deja85MVJ/tJ2rnxHkk5Pqti/W+4SzyeVLAjyTP4K1hXuztBFsljUYIA6NDVXwD4fLua
         Ehaj+XY2g8m73+8lpXBNLRUXQSIvrAgHS/ACqXaAO347qYrCvry4fx9lEWXQ1ICQQndy
         ohHEPRMIicRpTwW3zTGqeY+0JuvTMa6YSEB3Z0HJwN6vki31o3Dq2h4tnH8esiDvqdo+
         Q3IA==
X-Gm-Message-State: AAQBX9eyvQkjPbCBt6lJ7KoN9ziqmLyJBleRKfacCsAKSc6H9KZ2WRKb
	GUywKfHgW8j2SW0QiXYa9qr3CA==
X-Google-Smtp-Source: AKy350aAm5JE1r76kf6Lxl9p5V+N5sZaj6KFuUrSbX6DgQQJMad992E4+fIEGKxtn2iiwPmCcOOrnA==
X-Received: by 2002:aca:d17:0:b0:388:f4de:1ed7 with SMTP id 23-20020aca0d17000000b00388f4de1ed7mr3555483oin.1.1680752803481;
        Wed, 05 Apr 2023 20:46:43 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id en12-20020a056808394c00b003898ebb8be0sm215967oib.48.2023.04.05.20.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 20:46:43 -0700 (PDT)
Date: Thu, 6 Apr 2023 09:16:31 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V4 08/23] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <ZC5Al3swBGK1WP0g@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-9-sunilvl@ventanamicro.com>
 <h4wgl5pc4bptxsmlmf7ggohq2y2uwk6ecaoytyywbwhf2ubnzj@ojanwytq5lrk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <h4wgl5pc4bptxsmlmf7ggohq2y2uwk6ecaoytyywbwhf2ubnzj@ojanwytq5lrk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_204644_904448_A959A7F8 
X-CRM114-Status: GOOD (  27.72  )
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

On Wed, Apr 05, 2023 at 05:17:48PM +0200, Andrew Jones wrote:
> On Tue, Apr 04, 2023 at 11:50:22PM +0530, Sunil V L wrote:
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
> 
> As Conor pointed out, the errors could be propagated from
> acpi_table_parse_madt(), which could reduce this function to
> 
>  return acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC, acpi_parse_madt_rintc, 0);
> 
> where the '< 0' check would be in the caller below. That sounds good to
> me, but then I'd take that a step further and just drop this helper
> altogether.
> 
Thanks, Conor, Drew. I used similar to how others have used
acpi_table_parse_madt(). But your suggestion makes sense. Will remove
the wrapper function also.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
