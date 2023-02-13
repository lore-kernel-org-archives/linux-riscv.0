Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F35C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2bp3CsaJa1GCppzTyCMEkqeibqGfrcIo3FBoipVY/o=; b=byXMEp8PxwMthg
	1onr29+cHmNdJi0h37gsz3nYBmpPt1UfaeTuYfk824HHkyUrNvm1nD+kEddtysfgv320V2qcWrlqO
	QX5d5f57EDIRrKljbgGbw0YUYKLL8bgjVKsRqkSowjFB5I0WhE/+voSVd5Ej+JZwP8VwuUoi9acGJ
	RuNsToH0yWJUz6FiULkrECPNYwyHFnlI0twt2P8KpxLvy1NJsfvPuW7KQlR6uog0OLnr9+CW7gBme
	t4E8HF3X1JpQu08O/h1qI1cUgaeTfwhSoA9r08QxX6+vxP2r/MG/ZDXMHjaWaBXQm+RdXV0Wx0VN3
	F0xeoI3xEsXNBxCtOUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRahj-00FBgZ-1D; Mon, 13 Feb 2023 15:25:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRahh-00FBfh-08
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 15:25:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id w5so13813568plg.8
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNfsb97cJzUdtaFYoYtlJPsp0WgsDGOiTJIw3fsXmGc=;
        b=UoHX4/xGzz6PNGpqbsGARaUG+1vmTyq7b2+J2eS1iM1qujXKo7t86A4bramcIv370T
         azfMZvqAYcpsg7RDNBs5hgrH4974iGQ47Vx1ageovgd4sWojolhsoXRrox+7F4gKFDLX
         G6LdmJyvv4q9EnvV6kVfWYE3Rl4y74hP3Hayoe5U5tliazCJBgnXIpcGtGu+edoz4KkJ
         1+7paXdmCzBdOukfaUrORpHezFhiw99q2n4WnJBtC1SnBMwndIhqRt0gF2hhE9eFE031
         9L95cv/aS5fzxkbZRLgr5L4P3tAtAvHMjwjPEqsZT1jU5h3N+GjNWCD2IMS2wCZ6jkDW
         PHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNfsb97cJzUdtaFYoYtlJPsp0WgsDGOiTJIw3fsXmGc=;
        b=pkIcNVQ3ASGsOug4eDkDeZnmTdPeYWPSEmff5QrJqwdEo6KJLX1nBjXOBcwefZ/1CQ
         HVnKKxJTAqCHzuBV5FTU0NLOf/ORw9QhjGwIjSuh3lZwCQPeirnt5KnxBynuXvl9QlTQ
         E4i6JGBcXnAjeKlK02WukSWWvXmKRoudbPighqOX7w452Xny8JxmpLBpozwwiBdRi+QV
         dDLI197COyyP0QpWOqqO5S5QrnEO8o9/WiMuAsK9VkauPWi+EA7B/T9n4si7f0M2PdBp
         j61OSbYBmxHvlX//TOJCJzTAg4ElZBZPlLv9v5LpQwtbwR7a48cNEyD2OqaE75X0i7xU
         WNHw==
X-Gm-Message-State: AO0yUKXeTVPxfGXizXZy9uZ+etTd5996YhcXni9Vhs2GHzrdyymj8Xr6
	y+SOA19stSDgI7XLRaP5JfVZQw==
X-Google-Smtp-Source: AK7set8tb53lJAdH640whwYNdv6aF5uGIiD0eDiAvysUdUDEt30iBZ5bxMC8Jsl6jKrogkmK8bbD/g==
X-Received: by 2002:a17:90b:1b04:b0:234:1d1d:6ae6 with SMTP id nu4-20020a17090b1b0400b002341d1d6ae6mr848123pjb.1.1676301915245;
        Mon, 13 Feb 2023 07:25:15 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id w9-20020a637b09000000b004fbb48e3e5csm1549444pgc.77.2023.02.13.07.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:25:14 -0800 (PST)
Date: Mon, 13 Feb 2023 20:55:07 +0530
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
Subject: Re: [PATCH 11/24] RISC-V: ACPI: irqchip/riscv-intc: Add ACPI support
Message-ID: <Y+pWU+799GSUsGDP@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-12-sunilvl@ventanamicro.com>
 <Y+QY9DCf6JPBNVS7@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+QY9DCf6JPBNVS7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_072517_058165_C195D8D6 
X-CRM114-Status: GOOD (  20.94  )
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

On Wed, Feb 08, 2023 at 09:49:40PM +0000, Conor Dooley wrote:
> Hey Sunil,
> 
> On Mon, Jan 30, 2023 at 11:52:12PM +0530, Sunil V L wrote:
> > Add support for initializing the RISC-V INTC driver on ACPI based
> > platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> 
> > +static int __init
> > +riscv_intc_acpi_init(union acpi_subtable_headers *header,
> > +		     const unsigned long end)
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
> > +	 * for each INTC. We only need to do INTC initialization
> > +	 * for the INTC belonging to the boot CPU (or boot HART).
> > +	 */
> > +	if (riscv_hartid_to_cpuid(rintc->hart_id) != smp_processor_id())
> > +		return 0;
> > +
> > +	fn = irq_domain_alloc_named_fwnode("RISCV-INTC");
> > +	WARN_ON(fn == NULL);
> 
> Is there a reason that you do not just check this as !fn?
> 
> > +	if (!fn) {
> 
> This is a repeated check from the WARN_ON(), no?
> 
> > +		pr_err("unable to allocate INTC FW node\n");
> 
> Why do you need a WARN_ON() & the pr_err() here?
> 
You are right. Will remove the WARN_ON.

> > +		return -1;
> 
> Why not an actual ERRNO?
>
Okay. 

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
