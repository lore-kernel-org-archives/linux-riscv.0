Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4C4C3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jo2skEDJCJn6Jmou1VOyVUrzQnC1y92vn+W4fNMYYzQ=; b=gpRr/obYwqxZKh
	ZxDInu43Lnf12+xL0VeW/yceWF+nfMNCyk582m6kdFeb1gQRXZmT10F0c0mvfY7QqL59n+MkOJGlr
	jHHJWR3+uUfGvNaFB+2Ph3vvmQv8lucq6INTZZijhDAGR6yQ09aBr4wz36uaTrFNP7Qb6m9wvglsM
	wUQCEEXVF6moJmTZ69wxzirbSJNB4U/sfhyKAtJgqqX8YXn8aHjjs+O20yG7FhvyqAhj7tPkUWaWW
	0JcCYZDDxMxbkEi6K7PwcXj88HM39ga+xQCEDsGWdcFCPHipCpCb0/Kk+eFeMRahiAfxfJ7I8n4aY
	w3+KKQ8NygWw2GsZJqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOj0-00000008mrg-10IL;
	Mon, 12 May 2025 08:41:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOeZ-00000008m20-3vhF
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:36:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-30a8cbddce3so3470952a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039011; x=1747643811; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ejc+fT9oBiZc6vlLfCLO2KcJoR0VUYj8MUaNRpcLSKk=;
        b=GkPt8KS9cUQmZb6A0bAL8s/eTqzlsvAzJlWfeqZOMWkymNP5QJr/df9yeBmHRNkGFH
         dENN3saTt38t+N5cBD0MnA+V99qeYr0WhOE2hKxarKws8gsUYvzfs1zb1bHOOWH9qDT7
         uX84ZlnZfUP8qp4JwlXbRKkIFf1w+myVKTV227+cjy9Ef5ndOBrUC+Tgt7BvJ31k6eKt
         8pkf2HBosCC0OFOET4/ftr6IoRGzB1eMboH4VhXWbcR/J1OZiMEiSyfFXRSOzfqBa2It
         sIDyjJ2lppcuiRgq/atGL5Ql2GzOpNn75YBNH/ekaglBxymlawbsBnY+5oJMVYSMCt6+
         4OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039011; x=1747643811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ejc+fT9oBiZc6vlLfCLO2KcJoR0VUYj8MUaNRpcLSKk=;
        b=qTCeUrxlNmFtcNzAhtvBIduAoRlCOvvpeCz6tNnjqHfkmwp6KaP5Ch7j9NXyc29mZT
         NAb/plh+YRL9CJuSIEyE7p1RJTRUygXx0uUgjxWG3r2Mr55WetkP76FbRhAI/EQtDh9/
         ZxLQk7anjtXuGvJIHlGkkczwbq259Cq3CGrekfu1q9z0CaXUYRYNrEv1xQBPUlNpUGW4
         QAkkT6cwPlZLhoNONo8I/22SRiYxs8/CHiMPJJ5J3Jen+d+SCjjbkUcFAOx9PPi80LpV
         Nsweg1bIVVlnleWhn6PEugDDROpNTUKq5I35mB+uWTywx4mrpDx2cVWfgN8OyQCKwT9A
         bjzw==
X-Forwarded-Encrypted: i=1; AJvYcCVyjADDGyYrXggNGw2TjwNKd3+1aQNwsI/A0bVf016mQRUFCbn4fbsNq40Nqfuq3XP+2lZgHkFCWepPOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyETaW5KBGPWPuWfAhJUfnQrNZX8jYdk64gCcGw8m470Ok9k+tX
	jdl5lIqUCL7TtjXkpQ4FJQ90GuQX0MKO2avacn+YXdjXuCLT7OQZnuMPDQ1TE/M=
X-Gm-Gg: ASbGncuaBYlxImrU3HeEbLQXanCSi/PgwencU0jaVO7iScfuvV6sC4nCYHxmiTjjsWv
	Gs4XdwSixafZRIUG0ENQfVMufMQE12pH5OPaLCSUliqYWFhiIY0C2vktJW9gt9vOShXuYroyK66
	V7Ot3PIVWsFzQ2If7aE9FQBzQ+ab9qzATWl0+wStBjuJRr4GH8lsygj1tmLmAgffYFHQ1eAfZYF
	UqXYxuHQwuugwpBvl4XDH4vgHgHGFSUnELDNxCt+rBN2XRWqsiDoTUdRz1pG6assKaaGwrZypeF
	3Ihu6U0YWSMqsLyPsPpKHni7kdO1MCTJcUZiA0AwSCCkjId8br4jxPHx7oU=
X-Google-Smtp-Source: AGHT+IETI+63sqf5lJSJNfnuKUbP5ALGJFrOUXpQSYU1rR9FXckU+YWdjPI/7RMywkT9jw7jl9sPHg==
X-Received: by 2002:a17:90b:4c8d:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-30c3d65e2a5mr21634709a91.33.1747039010926;
        Mon, 12 May 2025 01:36:50 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e760acsm6089961a91.47.2025.05.12.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:36:50 -0700 (PDT)
Date: Mon, 12 May 2025 14:06:37 +0530
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
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aCGzFVXFBVRbMUKz@sunil-laptop>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-21-apatel@ventanamicro.com>
 <aCGjEdNVH3ughITd@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aCGjEdNVH3ughITd@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_013651_977147_B772050E 
X-CRM114-Status: GOOD (  17.89  )
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

On Mon, May 12, 2025 at 10:28:17AM +0300, Andy Shevchenko wrote:
> On Sun, May 11, 2025 at 07:09:36PM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> > mailbox driver.
> 
> ...
> 
> > -		if (is_of_node(dev_fwnode(dev)))
> > +		if (is_of_node(dev_fwnode(dev))) {
> >  			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> > +		} else {
> 
> You probably want to have this as
> 
> 		} else if (is_acpi_..._node()) { // you should decide if it is data, device or any type of ACPI node you match with
> 
Sure.

> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> >  	}
> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> > +	if (!acpi_disabled)
> 
> Hmm... Why do you need this check? What for?
> 
When we boot with DT, ACPI_COMPANION(dev) will return NULL which will
cause a crash in acpi_dev_clear_dependencies(). Let me know if I am
missing something.

> > +		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
> > +#endif
> 
Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
