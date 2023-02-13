Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55258C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30oeM79UJpwIi6pic3DqpMJCshfNU4OxYbIX5JksEWQ=; b=hOgs3mBITiAZ5w
	Uwv73UnSVzos04VXvHw9vPrAWo7MWduUZUBs44+CMprZLXHNVOZ593nte8IAtTScbQoc7f3Tti5U9
	bXam1nxtnVq706JCo2+EadBerRtkPbXJr8iW1g9QQb15CrALVOEovtvDMMAuq28EF881SRRkynJbf
	WZm0pRRaMJ2sLnjYoPjF2IzgIRxDMheAXe/EnPotsi6GLqB7STPgt54A1KaDrdGmyoCDKX/HjbUtT
	Ev42BtNgee23brMYtLtYKvPgxmhtLGj7g5ffeyix1WcufqdtdUjJD1DqIgV95B5TQ/Sni1zSlMVUq
	mNGNvvjObB1DA9h6MPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcXf-00FfkE-Tf; Mon, 13 Feb 2023 17:23:03 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcXc-00FfjH-Rd
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:23:02 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 24so8573348pgt.7
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 09:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NKgWXn2Y3lviSOPdC3CehrW/DrYmAyletD6KjGkPpnA=;
        b=FljE3nfrktQvbnRiGPJb9iov0n9BSYS9DNocCrt7ERcuObehINAb4rt350LipoQepK
         NUhiDEWLIVYvVG+lIokSH0zfg+zKweHHl0wlSdKjqyNuJf5HTC4YJWySoW5qOZ9x+heF
         ItvhkUznCBiN7bVzMRcIJT9nZLZAcuxGVz9RTToLl7aVhWsqKSS3mrYeju157WnVDFtI
         i1WYSwJ9jXskS6zrbKVR03KFZl/au4rde0k5ckWGKsJ+jL6b8FHgl+yWT882vkmOlKxs
         iIl7UIwlw1wb7a4bC8RuEXQ1WTm4d9oFGYIvS+IGDDkjGUa3fTdmdZ76u/CMd24Wmcga
         S+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKgWXn2Y3lviSOPdC3CehrW/DrYmAyletD6KjGkPpnA=;
        b=Y+2Kp/U3a/2kgJW+MJvXJyvUpz3yJQrCsawAfBnc5Q4PowM6tXkZMdLYMVR56qBo6W
         us+0pXNMkNIWDApN9gDDW+Jv33pL5aMKAnPllKMiU38dfZojY/cV7mxHJIIOVWPpwjzo
         pru0YE0riPG4jXONPi3EXdY6/G3ucMsJlsOvOTIcCEF8m4LdGGXUXS7bCsvmITkop5WJ
         nltkw1HTmTsLSdBLr4UiLrE8pfG3pjidsxohwwcrHeQHNbOAbim9f6PBe9MlNsNRDtki
         tDbOOLxBnIQR2S6UTRRpkpoLa03SlS9EliIrH+tc6YuraKDuSQujciqzZ95RQBenfith
         xqLQ==
X-Gm-Message-State: AO0yUKWCCyvEHcvNsTcbR0mMfC09k6Qefias+0Ai8lPfpyo3gNTmfx/L
	/5t8bUo47lzWfr0HhGS17yiahA==
X-Google-Smtp-Source: AK7set+h3Ih9HypAt5vf5UEAyYTYlb4SiUZsGHHbI+IhcSLk5aOd55igK5iyPWmBDQ5P9zRcPXRSrQ==
X-Received: by 2002:aa7:8f0b:0:b0:5a8:46b0:8269 with SMTP id x11-20020aa78f0b000000b005a846b08269mr18102684pfr.31.1676308978584;
        Mon, 13 Feb 2023 09:22:58 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id c10-20020aa78e0a000000b005898fcb7c1bsm8452052pfr.177.2023.02.13.09.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:22:58 -0800 (PST)
Date: Mon, 13 Feb 2023 22:52:51 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 15/24] clocksource/timer-riscv: Refactor
 riscv_timer_init_dt()
Message-ID: <Y+px651SpESUdm4a@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-16-sunilvl@ventanamicro.com>
 <Y+Vdc09bWb9CTXyt@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+Vdc09bWb9CTXyt@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_092300_944615_0315DF24 
X-CRM114-Status: GOOD (  27.71  )
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

Hi Conor,

On Thu, Feb 09, 2023 at 08:54:11PM +0000, Conor Dooley wrote:
> Hey Sunil,
> 
> On Mon, Jan 30, 2023 at 11:52:16PM +0530, Sunil V L wrote:
> > Refactor the timer init function such that few things can be shared by
> > both DT and ACPI based platforms.
> > 
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> 
> What did Anup do here? He's not author or co-author, so the SoB chain
> looks incorrect.
> 
When I wanted to refactor, I realized Anup had done similar in his branch for
a different purpose. So, I took some of his changes and I added SOB. Let me
add him in co-developed-by:

> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 79 +++++++++++++++----------------
> >  1 file changed, 37 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 1b4b36df5484..4016c065a01c 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -119,61 +119,28 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -static int __init riscv_timer_init_dt(struct device_node *n)
> > +static int __init riscv_timer_init_common(void)
> >  {
> > -	int cpuid, error;
> > -	unsigned long hartid;
> > -	struct device_node *child;
> > -	struct irq_domain *domain;
> > -
> > -	error = riscv_of_processor_hartid(n, &hartid);
> > -	if (error < 0) {
> > -		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
> > -			n, hartid);
> > -		return error;
> > -	}
> > -
> > -	cpuid = riscv_hartid_to_cpuid(hartid);
> > -	if (cpuid < 0) {
> > -		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
> > -		return cpuid;
> > -	}
> > -
> > -	if (cpuid != smp_processor_id())
> > -		return 0;
> > +	int error;
> > +	struct fwnode_handle *intc_fwnode = riscv_get_intc_hwnode();
> > +	struct irq_domain *domain = NULL;
> >  
> > -	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> > -	if (child) {
> > -		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
> > -					"riscv,timer-cannot-wake-cpu");
> > -		of_node_put(child);
> > -	}
> 
> Uhh, where did this code go?
> Unless I've badly missed something, this has vanished in the patch.
> 
Oops! Anup's patch had moved this to a separate DT timer node instead of
cpu node which I didn't realize. Thanks for catching this. Will fix it.

> >  
> > -	domain = NULL;
> > -	child = of_get_compatible_child(n, "riscv,cpu-intc");
> > -	if (!child) {
> > -		pr_err("Failed to find INTC node [%pOF]\n", n);
> > -		return -ENODEV;
> > -	}
> > -	domain = irq_find_host(child);
> > -	of_node_put(child);
> > +	domain = irq_find_matching_fwnode(intc_fwnode, DOMAIN_BUS_ANY);
> >  	if (!domain) {
> > -		pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
> > +		pr_err("Failed to find INTC node [%pfwP]\n", intc_fwnode);
> >  		return -ENODEV;
> >  	}
> >  
> >  	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
> >  	if (!riscv_clock_event_irq) {
> > -		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
> > -		return -ENODEV;
> > +		pr_err("Failed to map timer interrupt for node [%pfwP]\n",
> > +			intc_fwnode);
> >  	}
> >  
> > -	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
> > -	       __func__, cpuid, hartid);
> >  	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
> >  	if (error) {
> > -		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> > -		       error, cpuid);
> > +		pr_err("clocksource register failed [%d]\n", error);
> 
> If you're changing this, s/register/registration/ to be grammatically
> correct I suppose.
> 
Sure.
> >  		return error;
> >  	}
> >  
> > @@ -199,7 +166,35 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >  		static_branch_enable(&riscv_sstc_available);
> >  	}
> >  
> > +	pr_info("timer registered using %s\n",
> > +		(static_branch_likely(&riscv_sstc_available)) ?
> > +		"RISC-V Sstc" : "RISC-V SBI");
> 
> Why is this needed? Isn't there a print like 3 lines above here that
> says "Timer interrupt in S-mode is available via sstc extension"?
> 
Yes, will remove it.

> > +
> >  	return error;
> >  }
> >  
> > +static int __init riscv_timer_init_dt(struct device_node *n)
> > +{
> > +	int cpuid, error;
> > +	unsigned long hartid;
> > +
> > +	error = riscv_of_processor_hartid(n, &hartid);
> > +	if (error < 0) {
> > +		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
> 
> While you're already moving this, may as well fix the grammar IMO.
> s/Not valid/Invalid/
>
Okay

Thanks!
Sunil 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
