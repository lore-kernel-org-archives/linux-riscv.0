Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6758C64EC7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4xigzgVw8FjOIRRIXVekbyqOKjp2ANJ+/nYtHAhODU=; b=UZvGc7qwd/9B4Y
	UTFZmuyMxJNepP+Jgds5aW6898qKtxxwEswmVaMrvByocpAsOFavmpjGI+Y1YWMH92elLr3H6FxLb
	A+lVbUTsrD/g3RcUGUrO4jbtvvHPkkYrmRe0tiSbW0klz3HDbxyiBWyB6o1TmK8otSH3rrhvLIqnX
	hbIIzhG6pWs//AjvgC8btOMTdnOwjh62kK52Qvgy2R3qmzYYvmugU7PEG89lghd3XrNEH3rtdC+P5
	1AeOgdBZXWInOCr6+c3unxd8dsp0G1X+GWfoEqUZW31Wd/19MFln8Wl+4D4K5eF0VXkBCxeb1wEF5
	qVnv9JXQeYFNxXsJxqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRakI-00FCHa-MB; Mon, 13 Feb 2023 15:27:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRakF-00FCGP-5K
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 15:27:56 +0000
Received: by mail-pj1-x1034.google.com with SMTP id gd1so1483430pjb.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H64bCErxHeGPwaoRHUI0dfKS4AtwcUXkbh45HCez6bg=;
        b=SYvMjLr4yDh8WyGRc0k/LjOIHPYr1cPeLUKGMw9rxER/6OkNu6qD6ShC5hQmEy7g2v
         1sw6Sy81TOpdbyY5inbR4XBH9cTfvZQOD5mYDGeJ/RXi5thu+ZpgZNJmdI8wnq1EnPBJ
         B3DmXn9IFnE63hLT/KZs3UUri+rp6+QP3SPuSyH8ubhS1UIX4sLXaHZZSX7WPXwgtQRT
         o4twUj6POMJxSOxd/JgCI1a9KlJmO4d7R8s1o8a39Sfz8HWHnE4mbhG4Boi/UWFYXI7x
         mp/kb9tJxEc7FnTFCe3kkiKoG2xB2YYoYiA8Ei5DJUXuQoW3Na32syXgDNHM2EW6CwEj
         5VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H64bCErxHeGPwaoRHUI0dfKS4AtwcUXkbh45HCez6bg=;
        b=oZYvi0F3htcnDFO8mUlQYY69ZSYE5eDaJJ50TrM3Xbv9A4/w44jEqTkPyjdqNiNwlV
         QrZx4g0PDdLHcxg4zh1ftUmipeWKg1X+Z4PKx4ecHzc/U+hgHEsyikFXXnT5CiV5ght6
         /lHTBPBEOLp+f7KcOk5VbKjHn+uT+Gg32AkOm8tWIQDXYwMIPHWX4xMjZLDzYkn2hV6d
         VATm7tvD6eimBwAojJeIVAiTR7c3DELKk6dSzR8+jEgjHUSp2h9x0USFlBF5uvDWhKph
         yO1CVgQBuwvCO7+++wsPHDFR/aMG9aCBmZevi5ujXGToIKH4xXYFPloGPR3M/ijRnLf9
         GfgA==
X-Gm-Message-State: AO0yUKW712Y3peldR3cS6D27INjZnmMiKzqV2NRDpLOaBhsgw14ETcU2
	d/9TrLUkfQEKLckNUnvLnqVTRw==
X-Google-Smtp-Source: AK7set+Umi3K9fZWNzNGTrbdJhbBEdIzCaTYmeadC2jJa0vq3VZDuZB5gM/RzsQ/hG22EUBBztLQTw==
X-Received: by 2002:a17:903:11c3:b0:196:3ecd:c39a with SMTP id q3-20020a17090311c300b001963ecdc39amr28512081plh.43.1676302073657;
        Mon, 13 Feb 2023 07:27:53 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c24d00b0019aa7d89f06sm1482224plg.30.2023.02.13.07.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:27:53 -0800 (PST)
Date: Mon, 13 Feb 2023 20:57:44 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH 13/24] RISC-V: ACPI: smpboot: Add ACPI support in
 smp_setup()
Message-ID: <Y+pW8NWaOW1gom7d@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-14-sunilvl@ventanamicro.com>
 <Y+Qdxg8LBs5mbl4+@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+Qdxg8LBs5mbl4+@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_072755_225982_F4BF1963 
X-CRM114-Status: GOOD (  38.57  )
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

On Wed, Feb 08, 2023 at 10:10:14PM +0000, Conor Dooley wrote:
> On Mon, Jan 30, 2023 at 11:52:14PM +0530, Sunil V L wrote:
> > Add function to parse the RINTC structure in
> > the MADT table and create the required initializations to
> > enable SMP boot on ACPI based platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/acpi.h |  7 ++++
> >  arch/riscv/kernel/smpboot.c   | 73 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 79 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > index c5cb9f96d404..d1f1e53ec657 100644
> > --- a/arch/riscv/include/asm/acpi.h
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -58,6 +58,13 @@ static inline bool acpi_has_cpu_in_madt(void)
> >  }
> >  
> >  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > +
> > +#ifdef CONFIG_ACPI_NUMA
> > +int acpi_numa_get_nid(unsigned int cpu);
> > +#else
> > +static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
> > +#endif /* CONFIG_ACPI_NUMA */
> > +
> >  #endif
> >  
> >  #endif /*_ASM_ACPI_H*/
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index 26214ddefaa4..e48cf88d0bc1 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -8,6 +8,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/arch_topology.h>
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> > @@ -70,6 +71,73 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> >  	}
> >  }
> >  
> > +#ifdef CONFIG_ACPI
> > +static unsigned int cpu_count = 1;
> > +
> > +static int __init
> > +acpi_parse_rintc(union acpi_subtable_headers *header,
> > +			     const unsigned long end)
> 
> This all fits on one line. And also avoids the checkpatch complaint from
> what you have currently done...
> 
Okay.

> > +{
> > +	unsigned long hart;
> > +	bool found_boot_cpu = false;
> > +
> > +	struct acpi_madt_rintc *processor;
> > +
> > +	processor = (struct acpi_madt_rintc *)header;
> 
> Why not combine the above two lines?
> 
> > +	/* RINTC entry which has !ACPI_MADT_ENABLED is not enabled so skip */
> 
> This comment is a bit -ENOPARSE. Please reword it in a way that is
> understandable to mere mortals like myself.
>
Okay, let me try :-).
 
> > +	if (!(processor->flags & ACPI_MADT_ENABLED))
> > +		return 0;
> > +
> > +	hart = processor->hart_id;
> > +	if (hart < 0)
> > +		return 0;
> 
> Newline here please
> 
> > +	if (hart == cpuid_to_hartid_map(0)) {
> > +		BUG_ON(found_boot_cpu);
> > +		found_boot_cpu = 1;
> 
> This is a bool, why not assign a bool value to it so it looks more
> intentional? I know this is copied from the dt code, but that should
> really be on too IMO.
>
Okay.
 
> > +		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
> > +		return 0;
> > +	}
> 
> And a newline here too...
>
Okay. 
> > +	if (cpu_count >= NR_CPUS) {
> > +		pr_warn("Invalid cpuid [%d] for hartid [%lu]\n",
> > +			cpu_count, hart);
> > +		return 0;
> > +	}
> > +
> > +	cpuid_to_hartid_map(cpu_count) = hart;
> > +	early_map_cpu_to_node(cpu_count, acpi_numa_get_nid(cpu_count));
> > +	cpu_count++;
> 
> ...and also here please!
>
Okay.

> > +	return 0;
> > +}
> > +
> > +static void __init acpi_parse_and_init_cpus(void)
> > +{
> > +	int cpuid;
> > +
> > +	cpu_set_ops(0);
> 
> While I'm at it suggesting newline additions, adding them before
> comments would be great too.
>
Okay.
 
> > +	/*
> > +	 * do a walk of MADT to determine how many CPUs
> > +	 * we have including disabled CPUs, and get information
> > +	 * we need for SMP init.
> > +	 */
> > +	acpi_table_parse_madt(ACPI_MADT_TYPE_RINTC,
> > +				      acpi_parse_rintc, 0);
> > +
> > +	/*
> > +	 * NUMA - TODO
> > +	 */
> 
> TODO before merging, or TODO at some indeterminate point in the future?
>
Will remove this comment. We need to add NUMA after basic support is
done.
 
> Anyways, this is all nits & this largely seem to resemble the dt code,
> so with the nits fixed (and an s/ACPI: // in $subject):
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
