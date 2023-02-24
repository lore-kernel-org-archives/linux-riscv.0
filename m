Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AC4C61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhW6lvxYw4Q16xDJMDKwdSu8XPJS0M/9szWgCIfuvL8=; b=Cylqt/4NWsbo6N
	aLH4D7BUZyCZTA/4wG/RxjDImH9SBOIODLj7njsqnXaMoTwuNrYVdWnVxs9vkCeLDI35Ulf/8gYX4
	jVtazFoF6d7/EEWav5ypgXor54vRLXXgjpeHEuyVHX1xgVSsan+Lu17kenTYbR0pFSEAqnYkhDEd4
	mrBXWQzR0/EDrvWrhfXkhgr50xEJWgJWwxa0Z5ZI6Bxqy4RXv842B6D4ffCfvimAbMoesiPHS/to/
	CpMwh1yr8cvD+OQjDN0Q0dbPduyS8qy34tda4clO+CErxxX7r6KPXcJZ+YUJ/kDMCQAwajQmQ+oS0
	CQCkr3qgQ08meX8Kx34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXCh-002OLK-Vg; Fri, 24 Feb 2023 12:29:35 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXCf-002OKH-HG
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:29:34 +0000
Received: by mail-pl1-x632.google.com with SMTP id l15so17736743pls.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 04:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I64OIj5JM5jVLmuB1aGRMosStTA9JU6adN4APAydm64=;
        b=brp9cb638P51eq5ehuHgI2HFngdi1uyqvFfnsN0iNV6jajEV4Lbv4g4fsWhjOEE+j0
         Ui3ro/7bG8IoQZMs/RVYwWzfr6jFfVRUXTFjxW4WnXECCU9VONc8cvKvKstMJDqrvgcG
         FRcwRFD3shxmmND0s/fh5FpN+2n38gNFwX2kieY3QmNbi3OUH2u1tYKDZEXjW4/NcuBU
         IlH7A/Gbmz1tHnK65v+Ad3D6rvzfZeJ/lpaYkdHXsbyOX34vl3PSxEbNpJjyG+TNW4VX
         dYxdQd4byJG/hUZNn8AwtzhsgLAaB78s/8OQzAZP20Sw0C8/U31n2288sy2gG6pN5ib5
         4CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I64OIj5JM5jVLmuB1aGRMosStTA9JU6adN4APAydm64=;
        b=qtE59v4h/o0KxP53pp8k7L7kIpSA9DX2raObgdfHcjmKQHmwyY1zhLlzsVUpXJWgRP
         ZhcfYobYea1lb4jx4n13T1dLC3mdqTZEwKopizCEAgUIhRdvknOKUmYyWg+p5bbenDNr
         sif5p5rcwzYnFtygtbLpVbUVn0eUunhEJ+Ts8Yne5l8QaQEU5ZaSprQhIgBPfKEjhegW
         hB455qqiqwMGUcKwuxSKnPQR/oHp+J/CSDpZ4iuVPLAGB5UCE/gaGZrZnmV3by5Nc6hy
         vR9Mr6+ha3s9UG0B0EepfWvYaJqoLW+W2U/+RgEVpMUOlqzkDy8bZo3/iJ+JEsoi4Mu6
         w/Gw==
X-Gm-Message-State: AO0yUKWYp9m4k3eAyBKSTlD18mHEZInWzmhAT64zYB1o/rzI0b7bydbJ
	SYh77jeW4wUU2/rt6bn8hUCyqMWVuuzZH3M4
X-Google-Smtp-Source: AK7set++3aPbfhVhU7RzG1W+bNoSLXJ5kLpnrFXm+bGTgYrXsXUtOzbg4lBwpNZZFrbYZW6O3YaNXQ==
X-Received: by 2002:a17:90b:3a8f:b0:237:9cc7:28a4 with SMTP id om15-20020a17090b3a8f00b002379cc728a4mr1197994pjb.14.1677241770561;
        Fri, 24 Feb 2023 04:29:30 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id g9-20020a17090a9b8900b0022bb3ee9b68sm1458634pjp.13.2023.02.24.04.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:29:30 -0800 (PST)
Date: Fri, 24 Feb 2023 17:59:21 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
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
Subject: Re: [PATCH V2 14/21] irqchip/riscv-intc: Add ACPI support
Message-ID: <Y/itoXOnbmmYAwoJ@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-15-sunilvl@ventanamicro.com>
 <20230220193714.kuef6sfg7xmdyfty@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220193714.kuef6sfg7xmdyfty@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_042933_598357_2310BCAB 
X-CRM114-Status: GOOD (  21.81  )
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

On Mon, Feb 20, 2023 at 08:37:14PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:36PM +0530, Sunil V L wrote:
> > Add support for initializing the RISC-V INTC driver on ACPI
> > platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  drivers/irqchip/irq-riscv-intc.c | 78 +++++++++++++++++++++++++++-----
> >  1 file changed, 66 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> > index f229e3e66387..97a8db0fbc6c 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -6,6 +6,7 @@
> >   */
> >  
> >  #define pr_fmt(fmt) "riscv-intc: " fmt
> > +#include <linux/acpi.h>
> >  #include <linux/atomic.h>
> >  #include <linux/bits.h>
> >  #include <linux/cpu.h>
> > @@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
> >  	return intc_domain->fwnode;
> >  }
> >  
> > +static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> > +{
> > +	int rc;
> > +
> > +	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
> > +					       &riscv_intc_domain_ops, NULL);
> > +	if (!intc_domain) {
> > +		pr_err("unable to add IRQ domain\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	rc = set_handle_irq(&riscv_intc_irq);
> > +	if (rc) {
> > +		pr_err("failed to set irq handler\n");
> > +		return rc;
> > +	}
> > +
> > +	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> > +
> > +	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> > +
> > +	return 0;
> > +}
> > +
> >  static int __init riscv_intc_init(struct device_node *node,
> >  				  struct device_node *parent)
> >  {
> > @@ -133,24 +158,53 @@ static int __init riscv_intc_init(struct device_node *node,
> >  	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
> >  		return 0;
> >  
> > -	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
> > -					    &riscv_intc_domain_ops, NULL);
> > -	if (!intc_domain) {
> > -		pr_err("unable to add IRQ domain\n");
> > -		return -ENXIO;
> > -	}
> > -
> > -	rc = set_handle_irq(&riscv_intc_irq);
> > +	rc = riscv_intc_init_common(of_node_to_fwnode(node));
> >  	if (rc) {
> > -		pr_err("failed to set irq handler\n");
> > +		pr_err("failed to initialize INTC\n");
> >  		return rc;
> >  	}
> >  
> > -	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> > +	return 0;
> > +}
> >  
> > -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> > +IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> > +
> > +#ifdef CONFIG_ACPI
> > +
> > +static int __init
> > +riscv_intc_acpi_init(union acpi_subtable_headers *header,
> > +		     const unsigned long end)
> 
> Please keep the function and its return type on the same line. We can go
> to 100 chars.
> 
Yes, missed updating this instance. Thanks!

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
