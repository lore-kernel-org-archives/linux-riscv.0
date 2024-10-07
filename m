Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D0FCFB424
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 00:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXxzFGhaRHqJdV04Yyw/+Gv5nPWRqkLTqMWIejH6vKc=; b=4dJKRTG015q4oe
	wse/yHzMzb8rvRV96YVWQO8tneQG43Q8Km4r3i8yAtRA6hzZ3M3WRVHmx3C8wMk/+7Fwhgh5agrmy
	ueESDm9vcYgrL8BMFn/MACxdyX3SBoq/wm0EzSmXgQxV8NwEJKGJSMmmsZTMV7XlrV1fLmcTcflt1
	0Nv44J/EwyHwYNlbISoZzS9zRNAnwVw/pyTFudSl38ObFGCw3npPvLWTVp8UaWIE/UPNHGhGWIGpk
	+IscRE2C3GcnWOygT8oeVmNym9CgjZTfUoGxzHqvRdURKd138+G0YYBYmwfk0jJJNTHLE5FSa+AbU
	ol8DvYY+74EJGQS71Qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxbmR-00000000ppC-2lP4;
	Mon, 07 Oct 2024 00:39:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxbmO-00000000poC-3NN3
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 00:39:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71df1fe11c1so1074304b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2024 17:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728261555; x=1728866355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3uXCASsRqzWjb2Kpf3PXTREN4vfbVwBRJV25WvPZa1s=;
        b=JOthYQX9zhKxVsA2Xol21RC1i9giG48FvZR/OnCFd2O1mRRN3JEROaSt2F4Gv8Owj3
         NyASqrWyQHKj9EnM8GmthygjHPT7I+w49Da+iUYVYKC/ETQW+101yWh2GlWex9xoaLdy
         0bl4FS/ThArRe9gvuquL8SHxfRYg5aOXgJsSAz0dhJ8SbuTp57n1lfVkq+eZkw/UJzWP
         BSlEO6F+S517lPyUn5M9dopN5y1nknxtSCecSEsLiMPKttkE2HfiGm3WvInDdFUV8mVX
         ibACZsf1pm9ElYggreuiVqaN2BbmhmQBchA62M1pqWqW+Wckn1GohTDFH5PKyN4E2bEA
         LyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728261555; x=1728866355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uXCASsRqzWjb2Kpf3PXTREN4vfbVwBRJV25WvPZa1s=;
        b=tdPUzl38nWvu6ZXcvRD4AnBVFTOrjNvZHo7b+HTAg/wRq+KRp8bZdCk1XeyyIAHdBz
         XR5J5JsCMLHEmDMlJyYrQlNtZbUL6SAX9OVfFoNUMiv5/DPyv2PrNehA2SZ2CcArkgHH
         TkKHl9IdetE9lW40tl6VE+/m3uEu2rnUuyqHs8sMzvWk7HvyOyMScDxdgkTcEZ3ADPHa
         vySzUYi+dYFedIEkKVp+FJpyVnWczafq/6Gr6//iGmZr+UXOfNqs7TRvF8OwEgeALFAe
         yTBNy0sVNWsqFjehcUMeemhhm4g1nA3hfNxORcE332RhqPxRU2VL51McIHPxUkIC0XlI
         g79w==
X-Forwarded-Encrypted: i=1; AJvYcCUP4WFCgXLZa5cDdOSPj69vkJ4myaOCMwOZBOc+qY+z6fBmbc1YFnGk2j00K7v8barY6H4lyY8ucec0TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyiWw3Wo/JE7S5cdX1ygW+O89bxjzIILekFu6cQkWChovULzHU
	pEbC9jrhiv1yve9XPPa+MoB1mWHFoBnwUSQ59DG+9+FhXGXy9str
X-Google-Smtp-Source: AGHT+IH2IpLXsDe8zQHUYo3XulPP7+4/6XzH/QWIllC9nYhuRzOru6FuIuX06gO4kzYy6vb2/t4syA==
X-Received: by 2002:a05:6a00:3e1b:b0:71d:fb29:9edc with SMTP id d2e1a72fcca58-71dfb29a2acmr7540926b3a.3.1728261555211;
        Sun, 06 Oct 2024 17:39:15 -0700 (PDT)
Received: from inochi.infowork ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccf01dsm3301354b3a.70.2024.10.06.17.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 17:39:14 -0700 (PDT)
Date: Mon, 7 Oct 2024 08:38:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Guo Ren <guoren@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
Message-ID: <krieplgqalbjs7o5ylv5t6x77csuoknnhyc2pzdga4tu4mu73w@vjux46t3ijxr>
References: <20241004080557.2262872-1-inochiama@gmail.com>
 <20241004080557.2262872-3-inochiama@gmail.com>
 <87jzelui28.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jzelui28.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_173916_873844_78C3533B 
X-CRM114-Status: GOOD (  31.09  )
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

On Sun, Oct 06, 2024 at 09:50:39PM +0200, Thomas Gleixner wrote:
> On Fri, Oct 04 2024 at 16:05, Inochi Amaoto wrote:
> 
> > +#define pr_fmt(fmt) "thead-c900-aclint-sswi: " fmt
> > +#include <linux/acpi.h>
> 
> What is this header used for?
> 

This is copy-pasted error, I wiil remove it.

> > +static void thead_aclint_sswi_ipi_clear(void)
> > +{
> > +	unsigned int cpu = smp_processor_id();
> > +	struct aclint_sswi_cpu_config *config = per_cpu_ptr(&sswi_cpus, cpu);
> 
> That's an unnecessary indirection.
> 
>        *config = __this_cpu_ptr(&sswi_cpus);
> 
> is what you want here.

Thanks.

> 
> > +	writel_relaxed(0x0, config->reg + config->offset);
> > +}
> 
> ...
> 
> > +static int aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
> > +				 void __iomem *reg)
> 
> Please avoid line breaks and use up to 100 characters per line.
> 
> > +{
> > +	struct of_phandle_args parent;
> > +	unsigned long hartid;
> > +	u32 contexts, i;
> > +	int rc, cpu;
> > +	struct aclint_sswi_cpu_config *config;
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations
> 
> > +
> > +	contexts = of_irq_count(to_of_node(fwnode));
> > +	if (WARN_ON(!(contexts))) {
> 
> That WARN_ON() is pointless. The call chain is known and the pr_err() is
> sufficient.
> 
> > +		pr_err("%pfwP: no ACLINT SSWI context available\n", fwnode);
> > +		return -EINVAL;
> > +	}
> > +
> > +	for (i = 0; i < contexts; i++) {
> > +		rc = of_irq_parse_one(to_of_node(fwnode), i, &parent);
> > +		if (rc)
> > +			return rc;
> > +
> > +		rc = riscv_of_parent_hartid(parent.np, &hartid);
> > +		if (rc)
> > +			return rc;
> > +
> > +		if (parent.args[0] != RV_IRQ_SOFT)
> > +			return -ENOTSUPP;
> > +
> > +		cpu = riscv_hartid_to_cpuid(hartid);
> > +		config = per_cpu_ptr(&sswi_cpus, cpu);
> > +
> > +		config->offset = i * ACLINT_xSWI_REGISTER_SIZE;
> > +		config->reg = reg;
> 
> Why do you need config->reg and config->offset? All call sites access
> the register via:
> 
>     config->reg + config->offset
> 
> So you can spare the exercise of adding the offset in the hotpath by
> adding it at setup time, no?

Thanks, I only consider supporting multiple device, but forgot that it
can be computed earily.

> 
> 
> > +	}
> > +
> > +	pr_info("%pfwP: register %u CPU\n", fwnode, contexts);
> 
>   ...CPU%s\n", fwnode, contexts, str_plural(contexts));
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
> > +{
> > +	void __iomem *reg;
> > +	struct irq_domain *domain;
> > +	int virq, rc;
> 
> See above.
> 
> > +	if (!is_of_node(fwnode))
> > +		return -EINVAL;
> > +
> > +	reg = of_iomap(to_of_node(fwnode), 0);
> > +	if (!reg)
> > +		return -ENOMEM;
> > +
> > +	/* Parse SSWI setting */
> > +	rc = aclint_sswi_parse_irq(fwnode, reg);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	/* If mulitple SSWI devices are present, do not register irq again */
> > +	if (sswi_ipi_virq)
> > +		return 0;
> > +
> > +	/* Find and create irq domain */
> 
> Which domain is created here?
> 

It will create an IPI domain. I will update the comment.

> > +	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
> > +	if (!domain) {
> > +		pr_err("%pfwP: Failed to find INTC domain\n", fwnode);
> > +		return -ENOENT;
> > +	}
> > +
> > +	sswi_ipi_virq = irq_create_mapping(domain, RV_IRQ_SOFT);
> > +	if (!sswi_ipi_virq) {
> > +		pr_err("unable to create ACLINT SSWI IRQ mapping\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	/* Register SSWI irq and handler */
> > +	virq = ipi_mux_create(BITS_PER_BYTE, thead_aclint_sswi_ipi_send);
> > +	if (virq <= 0) {
> > +		pr_err("unable to create muxed IPIs\n");
> > +		irq_dispose_mapping(sswi_ipi_virq);
> > +		return virq < 0 ? virq : -ENOMEM;
> > +	}
> > +
> > +	irq_set_chained_handler(sswi_ipi_virq, thead_aclint_sswi_ipi_handle);
> > +
> > +	cpuhp_setup_state(CPUHP_AP_IRQ_THEAD_ACLINT_SSWI_STARTING,
> > +			  "irqchip/thead-aclint-sswi:starting",
> > +			  aclint_sswi_ipi_starting_cpu, NULL);
> 
> The startup callback enables the per CPU interrupt. When a CPU is
> offlined then the per CPU interrupt stays enabled because the teardown
> callback is NULL. I'm not convinced that this is a good idea.
> 

Yes, I will add the cleanup handle to clear IPI and disable the IPI 
irq for the CPU.

> > +
> > +	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
> > +
> > +	/* Announce that SSWI is providing IPIs */
> > +	pr_info("providing IPIs using THEAD ACLINT SSWI\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int __init aclint_sswi_early_probe(struct device_node *node,
> > +					  struct device_node *parent)
> > +{
> > +	return aclint_sswi_probe(&node->fwnode);
> > +}
> 
> What's the point of this indirection?
> 

This is make room for the future ACPI probe.

> > +
> 
> Pointless newline.
> 
> > +IRQCHIP_DECLARE(thead_aclint_sswi, "thead,c900-aclint-sswi", aclint_sswi_early_probe);
> 
> Thanks,
> 
>         tglx

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
