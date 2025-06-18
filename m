Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F18FC7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 05:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0T9lxVyqhhmXSb6Mn31gQf2KJdeHX7miBQCg5ZVQCQU=; b=My6rhq9csgH5pU
	6H3YtalQ465Ve92iZrbmDSEgQy/aCBc20LGHsSYnDVDPTXwPl1ri2Si4BFMNYbRUX4j+oV74GW3qb
	8EJZ1YqVWF5jsJCcq00TKB3pp8/28A2QH5cfw4+cgGNMNjZh2XUeq7jVAfbIcwM/wY4UTXLbYu9ZF
	xVjF1vTt+Dqt3EL2uU3dIRVcvZbq7KeEvfwW9wDr858zX3n92oU6poSMS0LYKrHLB7HVaaGZ7/NxR
	6yc1a6hnk/izucFAVrr3oQFQP1uVF/riOCufrsJaq2VJYRefLyDCYOZ9Ft3fazAnuAbKOKwXy3W8o
	c/b26Yc/jsJjDdDTECOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRl26-000000094Vh-2A9O;
	Wed, 18 Jun 2025 05:08:22 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRl25-000000094VH-0Pv7
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 05:08:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-235e1d710d8so80806955ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750223300; x=1750828100; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0piupPu8V/gl6O7trlkzEQzKsY2tqiYS+DKkqKrrgIw=;
        b=iWo/3JRMl0/KSedmtwtzPLTp7qtLJqKyrGbB3wB3+7OZRHymdoehPPJ+mPPPwZ6izZ
         u1QgRGuUaXs4MyckCeiHczhNMXHFGI07MkIOCWwD/PikRa1XzDy1hMYMDTUBXqFWR052
         ruUzLgL8HP3Ug2OHsBQrrfnsG+/UsU+lARt7HzJbW3Iw+JI1Oc3JcWZh68Eu2g4TZ2gC
         uSJYaqv+7JRVn9G7lZ0Z7Rq6Ws49rFXASBlX7pzi2N8MkPnlgElAPKTIltIP4bT/F59C
         IhOqd/wi68b/Nj+vB7dpgP9wpPfbdri3Hjn1ljpTQDxjzm9iYW2IOPAUyrUWsmZMy9Yg
         5E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750223300; x=1750828100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0piupPu8V/gl6O7trlkzEQzKsY2tqiYS+DKkqKrrgIw=;
        b=kGxtsXe8B3MAElVfXXYYts/Xa6DCSI2eoD0NqcIgF9NBzurb6Cf7UBx1kpl4gbPL3Z
         HuRS2h4/KMX14HHuVkK9BzGmcIAkrkSApOwrnWPjdzPXVgiOlE/A6gt0USZZOJb0zRz+
         cV+CZADCN1qYnS6nQAiAnfdbZJ2o/aUGFgeteid/3qv60sm89Z2nXLIPz3gYF3m+0I/W
         BkaJ0HduN2jdU34hUBJcwEOExQgiZogd9RoqvdVasXDdivkbOK+9pr0YH8AJnlkQKWR6
         76veYs7VZYuUAuOgwgpCS1G1f9rh1kb7i6a7s1Y1iiPvl7N9Ys2VEVdvKQoLAMFv1SQ/
         HT4A==
X-Forwarded-Encrypted: i=1; AJvYcCVqd6RygiUlqZIjMR38QuS6xZQvTpVXNX9oswKV1VrTCLyzfDKGjFKCfuy9rAP1TUlEp16Fql3CwzeF3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPStk/8FTkLBUC3sN/XGwxUwLqtWXTtGxukUatp1h1oe/WXFvZ
	2hcKVIreEGn3eepEFdSsPfoW9ipznvyi/0HHcx4fLXaQkZFwzOK4hMz5vsDHOAnqCP4=
X-Gm-Gg: ASbGncsHHXcjq/ZI/esKUP/neCJ96knUzOHZHYd62yYmzTEfHTaVNUTxLwuc+BR4K5+
	oCx0vAecxHm9b9aM5bp4PkXST3U1bbZTSGhxdaT6VfFA7ybxLefddGGr5qNTtShk4S6PUnxQpfC
	M6t0bhNYvma4C5LbDIKO9o3ZAdHSdT/QFKjNiJ9HIW89bbiOEtt1AFOHkeYUbqkHk1c9Kw1qT7v
	GJy4OdDKF8Esr+10pa+SFsVJ1lUJGqgqN2HwqKue9WheXse4WjGC1N5v0DMf6BquwdhUl68dJQS
	YQhTrrd8p3hMwj7UX+lJeWz+WUSwLVtNVq8fxCw/rpHvFJJTJzr7DrLkZLzknA1IyWFt8Q==
X-Google-Smtp-Source: AGHT+IFQmeYov3M4TJeicSZPxmrAUyfFLdsmh1502m8UPHV9igXkcxtyc+FtIrcqYue77oYSTt8fUA==
X-Received: by 2002:a17:903:348f:b0:235:88b:2d06 with SMTP id d9443c01a7336-2366b337f3cmr135541935ad.6.1750223299794;
        Tue, 17 Jun 2025 22:08:19 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb54desm90646085ad.179.2025.06.17.22.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:08:19 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:38:05 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <aFJJternIoBDAxrz@sunil-laptop>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-22-apatel@ventanamicro.com>
 <87frg3irgq.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87frg3irgq.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_220821_143953_AD1CDAD2 
X-CRM114-Status: GOOD (  22.02  )
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

On Fri, Jun 13, 2025 at 05:36:21PM +0200, Thomas Gleixner wrote:
> On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:
> > @@ -211,6 +213,9 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct rpmi_sysmsi_priv *priv;
> > +	struct irq_domain *msi_domain;
> > +	struct fwnode_handle *fwnode;
> > +	u32 id;
> >  	int rc;
> >  
> >  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > @@ -241,6 +246,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
> >  	}
> >  	priv->nr_irqs = rc;
> >  
> > +	fwnode = dev_fwnode(dev);
> > +	if (is_acpi_node(fwnode)) {
> > +		u32 nr_irqs;
> > +
> > +		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
> > +					     &nr_irqs, NULL);
> > +		if (rc) {
> > +			dev_err(dev, "failed to find GSI mapping\n");
> > +			return rc;
> > +		}
> > +
> > +		/* Update with actual GSI range */
> > +		if (nr_irqs != priv->nr_irqs)
> > +			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
> > +	}
> > +
> >  	/* Set the device MSI domain if not available */
> >  	if (!dev_get_msi_domain(dev)) {
> >  		/*
> > @@ -250,8 +271,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
> >  		 * then we need to set it explicitly before using any platform
> >  		 * MSI functions.
> >  		 */
> > -		if (dev_of_node(dev))
> > +		if (is_of_node(fwnode)) {
> >  			of_msi_configure(dev, dev_of_node(dev));
> > +		} else if (is_acpi_device_node(fwnode)) {
> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> 
> msi_domain is only used here and so it should be declared in this scope
> and not at the top of the function.
> 
Yes, let me change in the next revision. Thanks!

> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> 
> Other than that:
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thank you!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
