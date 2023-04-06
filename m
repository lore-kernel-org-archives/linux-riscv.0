Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E8FC76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 03:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmhbWulmhXNEeIwyFvTtwEiw1Aua/IdvRltEHcT8r/M=; b=3praG/JOPqBQ5g
	hg4GEZRk3JXU8UuvGLlOWk78iGU5xCnHM057EdppHljY178ftAWnh4lJLGIf4oUD/HaF4ac5z9eQa
	aCmFJoV9PxQHbNQs/ExPQNg6yOxW0mZsTjGuORYsNbFVC7u6qLa53tf6EM1/GVbozHSF5UyByH3Rc
	r28lQ3xBniOznN2oiadUPqIXG+5E6D++aOPqhowLVFD2VM2Kjgzr5o8xwnkg1LXjMksO9NXxK3eeN
	c7rMBDlseESHSy4QHIzQRE9nhPTwJuvOBpmzSumejeGmdhMkI4/aLsEnAY+8Xpz8+D5k+mS7JjImF
	tMPyfJ/zn1k/7w6TofVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkGbH-006FU4-08;
	Thu, 06 Apr 2023 03:47:51 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkGbE-006FTU-1s
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 03:47:50 +0000
Received: by mail-oo1-xc35.google.com with SMTP id f7-20020a4ab647000000b0054101f316c7so2578025ooo.13
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680752866; x=1683344866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YOQyXiF6H32qjkbnMHBLAnQGR5UU6PO5KDbekZHdUSo=;
        b=HJTZeaB3FWyeKAWAaoBXmGAq3xziEUF0GuRnpfvm6j4J4qHmlC76aYg3Sby0RPiigC
         nIxmToYWBSZn6qx8L0udvCx/Zj/VeP3MB3xREKMduoBAY/ws2ndZKtY7hh7AuUlVmnCu
         i5eHBVnyZe877m6WyTMryR806FB5XFZsWRx5sXP0BSSDDIa+2Ol5RgXw8zFpWp4/dkcJ
         J60mskmq1TPD0JSqGqrFzFV1kjwJ3Uw8l4i/qaV9AsX5ngf78v32HDqkz1NwxvT9lomI
         aOYlqLKIDEq3dqH1FmJHRK87ICzOfor25rbAvuzC1Ry2KdPbNaDn21jRpkxLsHKL3etx
         Yzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680752866; x=1683344866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOQyXiF6H32qjkbnMHBLAnQGR5UU6PO5KDbekZHdUSo=;
        b=W2xFRBs46DA7gSh/uogDN5hElmg1WQLETO908D6o0t3YMdCmuLOMQKX0eTr6xrX1/6
         s3OCk4B/TX26VC+DG8RoBKhaD+E/T5hvEgsnrU8qtOeyAnidlCXr4q9CaCWqG50DMx1s
         qkFA6LI1WjDDI4k54W4uGipEJRBlY/KLeDRHXE9RUTBOiP8XZMxlSyAtnE+4xsx3Vflr
         KSGm2TS1P+AEG5i2bJx1Zt6xXGLQnXU8VbUJCsYkSpCSj5OWSlFStqgx/008gP1585vs
         5AVu2W0Ox7wefIiSuZxtkfLAZatcWJ5YRzLBI0ZrjecTxKiZoYMVMljEjT135k6nGiSX
         K4mQ==
X-Gm-Message-State: AAQBX9dLLXuMDaivP1iFqp0OBL4lQVzY+63nG/JzoXdXIteC39fS0nRO
	F+BvioyWQumbFENaC7ENK5lESw==
X-Google-Smtp-Source: AKy350ZkL5S/RfJe6PTFOfG3x5lJGeLEQLGO93kjuxHnHTjvtMezmwr1ISkQU/V4CeeOWnC/nvBXXA==
X-Received: by 2002:a4a:414c:0:b0:538:4d29:30cb with SMTP id x73-20020a4a414c000000b005384d2930cbmr4467173ooa.8.1680752866306;
        Wed, 05 Apr 2023 20:47:46 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id w127-20020a4a5d85000000b00525398a1144sm88871ooa.32.2023.04.05.20.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 20:47:46 -0700 (PDT)
Date: Thu, 6 Apr 2023 09:17:34 +0530
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
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH V4 15/23] irqchip/riscv-intc: Add ACPI support
Message-ID: <ZC5A1oBOhOn4R0tm@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-16-sunilvl@ventanamicro.com>
 <qxftlofleo2bpyqa5lyshiluc5cd37u4hljn4bh7noxv7g5pno@ldvh6gkyrlzu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <qxftlofleo2bpyqa5lyshiluc5cd37u4hljn4bh7noxv7g5pno@ldvh6gkyrlzu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_204748_624067_8B7A7F6D 
X-CRM114-Status: GOOD (  29.18  )
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

On Wed, Apr 05, 2023 at 05:48:47PM +0200, Andrew Jones wrote:
> On Tue, Apr 04, 2023 at 11:50:29PM +0530, Sunil V L wrote:
> > Add support for initializing the RISC-V INTC driver on ACPI
> > platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  drivers/irqchip/irq-riscv-intc.c | 74 ++++++++++++++++++++++++++------
> >  1 file changed, 61 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> > index f229e3e66387..6b476fa356c0 100644
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
> > @@ -133,24 +158,47 @@ static int __init riscv_intc_init(struct device_node *node,
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
> 
> The ACPI version doesn't output this error when riscv_intc_init_common()
> fails. It should probably be consistent. Either removing it here, if the
> errors output within riscv_intc_init_common() are sufficient, or adding
> it to the ACPI version.
> 
> >  		return rc;
> >  	}
> >  
> > -	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> > -
> > -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> > -
> >  	return 0;
> >  }
> >  
> >  IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> > +
> > +#ifdef CONFIG_ACPI
> > +
> > +static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
> > +				       const unsigned long end)
> > +{
> > +	int rc;
> > +	struct fwnode_handle *fn;
> > +	struct acpi_madt_rintc *rintc;
> > +
> > +	rintc = (struct acpi_madt_rintc *)header;
> > +
> > +	/*
> > +	 * The ACPI MADT will have one INTC for each CPU (or HART)
> > +	 * so riscv_intc_acpi_init() function will be called once
> > +	 * for each INTC. We only do INTC initialization
> > +	 * for the INTC belonging to the boot CPU (or boot HART).
> > +	 */
> > +	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
> > +		return 0;
> > +
> > +	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
> > +	if (!fn) {
> > +		pr_err("unable to allocate INTC FW node\n");
> > +		return -ENOMEM;
> > +	}
> > +
> > +	rc = riscv_intc_init_common(fn);
> > +	return rc;
> 
> nit: If we don't add the error message here, then rc can be removed and we
> can just do
> 
>   return riscv_intc_init_common(fn);
> 
> And, if we remove the error above, then we reduce the return there too.
> 
Make sense. Thanks!. Will update in next revision.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
