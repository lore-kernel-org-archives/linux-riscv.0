Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C45C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 16:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JS5LxYQMB0yAqSOGpSfFCq8iXpVXUfeRVlR5zkWckOY=; b=krmx0f0J1ke5fm
	V70dXgAAiyhH8+W+YnKz3LsZf+Pj3zPWABDt2Z3Xvln/LOt3V+SUHEDiD20FOvGDn4ag8Z7oikclH
	0Euh0hc/+EyBgkgjAD/+PM9ByYP8CBo/MCUfVC/1AvzS8lwbWNkbusn/eIF0V8LiYNa89Hj4njV8l
	4M1a1HrT9TyXnrOKpO2EbrfoStNa5GvKrfc2lfvHCWeQnfDam1xtXjWGslY5utAZehD3+z/ZMLTh3
	UOUhflemaAE35gp3r6ObmC5cSSF3bBEog9YgjRnTT4phbdSwIuirStk0VfHf66soim24dDZ6fwB8y
	Om8l04pQLSm1Vo0OEWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk6IL-005A8r-0W;
	Wed, 05 Apr 2023 16:47:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk6IH-005A52-2F
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Apr 2023 16:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bEilYgmHZ7l/bQLzCewoCvoPGpsrJtc/Cg02p3y6vwY=; b=EEFz6Bp/kqvl9+i+bP2gPF/q+R
	gDWlQkLu8WHtVZs8BrOgi9eFZgywc47xE7ckuWBMH+feLV2ztJ42+97Es7URa+Uc7NFp9MQ9rIhCz
	2iPzLz0R/kjaDqhfFvOG5Ljddc+YmcvjptO4N8tfGWFN/tJ1ZVniWY83M+mJMqacolu3l2F/p6qUD
	T/luWZ7qHb3dUlA4e3WMBMfvSaBOl5ToX0VAJBLW7JpLbwyNekwaN3qSQdU9t/8M2LTHw8qwHLezp
	Se4FRC5iN8Jy1KJfWGuQPDpc+8PMjgMi+42YhQ54GfGYu4AkG2pQWE7o1vav+FCBId+TsWhGtzoiA
	AI+KJrPg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5NV-009zsl-1z
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 15:48:56 +0000
Received: by mail-wr1-x431.google.com with SMTP id y14so36706074wrq.4
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680709729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEilYgmHZ7l/bQLzCewoCvoPGpsrJtc/Cg02p3y6vwY=;
        b=Ii4Yh1EZdQ+aZCFlOdXALbTzJ1og9QLtlkYzPUC/jenIpbvCTAT0yz5svZia5Dsl1w
         mGkKFXAUN0KzkkryuKYnwJ6p3L6Z+qsljm01JFxeE7zmIjwX5cLHYn8zBvpgLlFuMuav
         8jxkSKuZH9BAdTMcA2X8UUu0G6oYMk6Lr12Ae6qn/IPyDpTnSfY2TxlOw/mYokArg6+w
         dnZdHco7kHmKFs4gJLTE/AG1qnsUKkgXLocGdcrsfiP1S/xSx/bLc4Ymz6gVsdzsjpg+
         eVaWKpeTl0R2tu3cAhkiEmGWlV62XMGm2jA++kxMNn/QtnvyzDPFk0IzPFn8j0T74gki
         kTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEilYgmHZ7l/bQLzCewoCvoPGpsrJtc/Cg02p3y6vwY=;
        b=RKaRxI5MK59405JMNBELgOB3WTzsfYZBvPTKFDfKs3wfB4VStrlI86h3InkJ8zwmOr
         tanzInrt/e2yV2KNNJ+M/eVQS0E2RAklXtCWG0mPq4o/20RoYsGKCTn04Tzk8leMAdxd
         aIsfaLx1CKeSoFHuFW6HWoiTNZQ7wvldDDxsyQNw/jdQMtv1ux4i/GgIvnksRM/6pGQh
         WgZSw98xxIsJBLq3Q7XoH+B9yaSPoDHkgvVSOlMYN76rtAS8PJSOKsEWxRNjK3HWRL2r
         NmoOk3IUNEP3hFpoM2uYcm4UE63B2uRoyteLhzcGRub9WYa/WQ+q232f2TAtB3XI+O9f
         rvXw==
X-Gm-Message-State: AAQBX9dOCtATs01cOeRjHbACqDl7rlKgyHUGDZaM2oKub3skqHX3AffB
	p8cRyrkK5harBahForLtazFesQ==
X-Google-Smtp-Source: AKy350a/4RpDuNaKeLXizakCjVT0nJJ/3/P77NUAVFXOsWcY6UUfArIEbAgLCUIHrv9hqeDQ0bOQAw==
X-Received: by 2002:adf:d0ce:0:b0:2ce:ab0a:81fe with SMTP id z14-20020adfd0ce000000b002ceab0a81femr3890449wrh.62.1680709728645;
        Wed, 05 Apr 2023 08:48:48 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y16-20020adfe6d0000000b002df7c38dc3esm15375973wrm.87.2023.04.05.08.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:48:48 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:48:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Weili Qian <qianweili@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mark Gross <markgross@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH V4 15/23] irqchip/riscv-intc: Add ACPI support
Message-ID: <qxftlofleo2bpyqa5lyshiluc5cd37u4hljn4bh7noxv7g5pno@ldvh6gkyrlzu>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-16-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404182037.863533-16-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_164853_814794_6CFAA46F 
X-CRM114-Status: GOOD (  26.65  )
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

On Tue, Apr 04, 2023 at 11:50:29PM +0530, Sunil V L wrote:
> Add support for initializing the RISC-V INTC driver on ACPI
> platforms.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/irqchip/irq-riscv-intc.c | 74 ++++++++++++++++++++++++++------
>  1 file changed, 61 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index f229e3e66387..6b476fa356c0 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #define pr_fmt(fmt) "riscv-intc: " fmt
> +#include <linux/acpi.h>
>  #include <linux/atomic.h>
>  #include <linux/bits.h>
>  #include <linux/cpu.h>
> @@ -112,6 +113,30 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
>  	return intc_domain->fwnode;
>  }
>  
> +static int __init riscv_intc_init_common(struct fwnode_handle *fn)
> +{
> +	int rc;
> +
> +	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
> +					       &riscv_intc_domain_ops, NULL);
> +	if (!intc_domain) {
> +		pr_err("unable to add IRQ domain\n");
> +		return -ENXIO;
> +	}
> +
> +	rc = set_handle_irq(&riscv_intc_irq);
> +	if (rc) {
> +		pr_err("failed to set irq handler\n");
> +		return rc;
> +	}
> +
> +	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> +
> +	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> +
> +	return 0;
> +}
> +
>  static int __init riscv_intc_init(struct device_node *node,
>  				  struct device_node *parent)
>  {
> @@ -133,24 +158,47 @@ static int __init riscv_intc_init(struct device_node *node,
>  	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
>  		return 0;
>  
> -	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
> -					    &riscv_intc_domain_ops, NULL);
> -	if (!intc_domain) {
> -		pr_err("unable to add IRQ domain\n");
> -		return -ENXIO;
> -	}
> -
> -	rc = set_handle_irq(&riscv_intc_irq);
> +	rc = riscv_intc_init_common(of_node_to_fwnode(node));
>  	if (rc) {
> -		pr_err("failed to set irq handler\n");
> +		pr_err("failed to initialize INTC\n");

The ACPI version doesn't output this error when riscv_intc_init_common()
fails. It should probably be consistent. Either removing it here, if the
errors output within riscv_intc_init_common() are sufficient, or adding
it to the ACPI version.

>  		return rc;
>  	}
>  
> -	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> -
> -	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
> -
>  	return 0;
>  }
>  
>  IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> +
> +#ifdef CONFIG_ACPI
> +
> +static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
> +				       const unsigned long end)
> +{
> +	int rc;
> +	struct fwnode_handle *fn;
> +	struct acpi_madt_rintc *rintc;
> +
> +	rintc = (struct acpi_madt_rintc *)header;
> +
> +	/*
> +	 * The ACPI MADT will have one INTC for each CPU (or HART)
> +	 * so riscv_intc_acpi_init() function will be called once
> +	 * for each INTC. We only do INTC initialization
> +	 * for the INTC belonging to the boot CPU (or boot HART).
> +	 */
> +	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
> +		return 0;
> +
> +	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
> +	if (!fn) {
> +		pr_err("unable to allocate INTC FW node\n");
> +		return -ENOMEM;
> +	}
> +
> +	rc = riscv_intc_init_common(fn);
> +	return rc;

nit: If we don't add the error message here, then rc can be removed and we
can just do

  return riscv_intc_init_common(fn);

And, if we remove the error above, then we reduce the return there too.

> +}
> +
> +IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC, NULL,
> +		     ACPI_MADT_RINTC_VERSION_V1, riscv_intc_acpi_init);
> +#endif
> -- 
> 2.34.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
