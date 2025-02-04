Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE248C0218F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 04:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ws1q6EwS6XE1cZHnFAY6s5wnf0ZI9G4i+WCSNRoCbrk=; b=BOQIue134gBzjw
	87RQ+YdEJlfrYlw4y0YPkptP3lpHq4xBoSztFRHQoa2/8BJSzB5wpo9tW1hOlqN1+/OYaDD+4zEsU
	q+PIUECtVGqGpmcVM69EVWhtyJtS9ORojM5vCAMWcaH/iOuKymQm93gccWToWvk78BN8QjXO9jw8E
	WhjTaPodTWQTUKldj7KESFxbNTwSzTxAtynrGZMzW0f1vILGymaGOslCHQ2WfwNPZnIII/p6yha4T
	MBSkO08pcgqtTPn+GgaggYFKo9veCG5ET/P3stpbC7mtv/9JxDAmqpGbe7fc58TZ7HXW1aTtV4xQA
	HtSKNUvt9+T7cfFDjNhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAOY-0000000HDUY-3MuT;
	Tue, 04 Feb 2025 04:18:42 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAOW-0000000HDUD-2BwP
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 04:18:41 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7b6f7d7e128so574899785a.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 20:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738642719; x=1739247519; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1DvyAG/gibJ4Np4As+DdlCtpsc8Q7r5eOByPQszzk7g=;
        b=S+ySeidHvj72puIrqw479sdIkgOBcNIwI74UCXHAyGZJGpNvV0H5GaiWcVd79St/0D
         gpxoyLlck4otnCWjJlbqqha69Q2KUnARqeLLty5zLQzctE2SqvB2pIo4Pc2/JPFUjMvi
         ZherJFG8/4b2B/DLBYQ6HtB6nId+2nYor3IcAFR4fMn3UXK7V4d/8tQeZvkoMNltpfu5
         A9rtgSxHaEJ/H0SfQxtyCzOT5xKi64Kq27PhMqG048/mU0Bnq8Y+UcsLgqgTHpI6Kebv
         xuOOBBnUrNrHVyxF/Xs3fAcZD7sNAzcaKWSPoC8J4aks1vhXmtAxsEHZkYW5TCQyAC68
         Q8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738642719; x=1739247519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DvyAG/gibJ4Np4As+DdlCtpsc8Q7r5eOByPQszzk7g=;
        b=XpcGRTWXL2xnaNrGcG46Gusxzr8SRXhgrcdM1Ghn92a/N8JBFVzx+Rqo8QQg5vOHzB
         Q3a1fQjwnJ9YB7g9fLM4lXvv2pGfX2fGwTSVWZgtME7Np2RWOPLkcsdVH5SFlHQztzeX
         ycT1/gXKW7eGGSqMbjLl0beGhfgQ5XCPi3s3T0b6kx/aUnrBgpTGnIWlk+DpE9E2kZIF
         z3VcPG7IL76uwt4BizEGCaPLed/dbFRaceN5hpPEoHVdqF7Aqv6XcN6ozWYqBvK9sJ/o
         aRZJ4OGUZ9Pva8TsmjXd/YpEp4bk07+o7J1oTNJAb+CBRDxS3I6xZMTt5ybRFzdrSxv3
         sQGg==
X-Forwarded-Encrypted: i=1; AJvYcCXoD2T8wjY0CTpmy5kQlbikT+HAUgFRIEf+syeUSxZIHWGcVE33xvcbq4BXT8nj/PKGM58eO/kceeRM2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXd8XpZoXXvQ0UWcE8l5QaLdV7UAC27uWjPX0t11AKxf9PCO9E
	ybfNI1ox0m7gYAx9fAAMKg+lxR3nzHR6fFdR9uS+/VStWDEy6c3U0bTr1cOhJg0=
X-Gm-Gg: ASbGncs18ThmS4dFdAL19kS9ZgC633fdfwkm5Gklav/LnYh+u1usWREvKabaXs6IoRO
	7yyj5WsggHHdi4VSxix8eOHRFKmdX7Z2PTImtYL+Z26ZO8V5HIPSkt0TVBjvVTIYaoZ7fm0BTXn
	WRVR5nYsS3xYt79lXqOdA5RqKH8qABsWEmE1ba6rpCw6hxBI+GewoRHMwlnMe5/rniSkpzoO4Gm
	nd9yPAQ2J23Du4EB94/TgamEryMwO2YxnRRZRQ26gQIcd+3j6q6DWOGaOh7zr2BE5m2gu14+ncD
	c05yrY6M42sJcdyqDTQCOK8=
X-Google-Smtp-Source: AGHT+IE0f4QugKabfRRSBRleOS2KB1pvcyWkZ6UoqvN4crpYoZxJOEqx3b/6o3pkY3LuZEm1BmbQlA==
X-Received: by 2002:a05:620a:3d84:b0:7b1:ab32:b71e with SMTP id af79cd13be357-7c02eb7da0bmr280078885a.0.1738642719178;
        Mon, 03 Feb 2025 20:18:39 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90571csm597775385a.83.2025.02.03.20.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:18:37 -0800 (PST)
Date: Tue, 4 Feb 2025 09:48:22 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 16/17] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <Z6GVDuhNyjFQ4OKT@sunil-laptop>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-17-apatel@ventanamicro.com>
 <Z6COlL_5n2AfRADL@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6COlL_5n2AfRADL@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_201840_576985_E6486FF4 
X-CRM114-Status: GOOD (  22.01  )
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

On Mon, Feb 03, 2025 at 11:38:28AM +0200, Andy Shevchenko wrote:
> On Mon, Feb 03, 2025 at 02:19:05PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.
> 
> ...
> 
> > +	if (!is_of_node(dev->fwnode)) {
> 
> Please, use dev_fwnode(),
> 
> But why do you need this? Can't the below simply become a no-op without
> this check?
> 
> > +		rc = riscv_acpi_get_gsi_info(dev->fwnode, &priv->gsi_base, &id,
> 
> Ditto.
> 
> > +					     &priv->nr_irqs, NULL);
> > +		if (rc) {
> > +			dev_err(dev, "failed to find GSI mapping\n");
> > +			return rc;
> > +		}
> > +	}
> 
> ...
> 
> >  		 * then we need to set it explicitly before using any platform
> >  		 * MSI functions.
> >  		 */
> > -		if (is_of_node(dev->fwnode))
> > +		if (is_of_node(dev->fwnode)) {
> >  			of_msi_configure(dev, to_of_node(dev->fwnode));
> > +		} else {
> > +			struct irq_domain *msi_domain;
> > +
> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> 
> > +			if (msi_domain)
> 
> Hmm... The OF case above assumes this check is not needed. Why is it special
> otherwise?
> 
> > +				dev_set_msi_domain(dev, msi_domain);
> > +		}
> >  
> >  		if (!dev_get_msi_domain(dev))
> 
> Even here you have a check for NULL, so I believe the conditional is simply
> redundant.
> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> 
> > +	if (!acpi_disabled)
> 
> Why?
> 
> > +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> > +#endif
> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> 
> Drop this ugly ifdeffery along with ACPI_PTR(). They are more harmful than
> useful.
> 
> ...
> 
> > +static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
> > +	{ "RSCV0006", 0 },
> 
> Drop ', 0' part as it may be converted to a pointer in the future.
> 
Thanks!. Let me address your comments in next revision.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
