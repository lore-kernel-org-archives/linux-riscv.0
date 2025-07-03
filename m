Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4CDC83F04
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 12:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOcqDRaWpTpYi2c1m5Er9LLusEwGIZGYnWztmQccTyM=; b=nUJbjYNMBqDBVe
	NHYXWb7Fvsim8yrDQiW85iWQscyWN7ULsYfIF0YztPExBERLT2o6SaKNE8mbUJc6QRXl2zAryPd3q
	uiJK6kjHBk34kzjYNjdTF41hwB5JccEUbiCe8me5Y8/s8cEV6YA+9FZ7wz2aHAG0MNmqET/57FeKd
	qYJhNKKbuc0lIgY0/TWrD+cuoIKgyPcoZ3xAZeLJ8Thu8RWji2YgDhUGiqWKJO6iLktjr8r5os9Hk
	pHjHtD6JD20sS0jjWDYjni8sYRhOAYisNzAkLzs4si1DcU39FzspVTgTJgAHZXLQkefOyWJ1vw9Kp
	+qmFrAU/eg87TbYKXM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIcI-0000000BFLz-26xt;
	Thu, 03 Jul 2025 12:00:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHaL-0000000B3rT-2bBv
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 10:54:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-234d3261631so56827515ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751540073; x=1752144873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s+0RaBS3vJpNgepBHSmk/I/U4Dvicv46WDE7RU8TKg=;
        b=g0hlo4m6A7SC4DxwP/oqp0AM3YVInq/yGPj+1esoP7nXJxaljiSxmnAOOXDrqSta7R
         KzO5TqhSjnFIv8WRmiThTp76J8UrEhZZe8cb2N1IA4BwhHDTGOlUj5xi/DO3/6ZADiiO
         WGTDHuQUb59m7oxmQRT4lWu/ZM79v78N6QutQM+K7MtDvCiychh3XPnP+b8YlYtdfao1
         fNwlolHlrwU9ZNbX5aR6VEmZ5MGlhUDY56m8PmBPwUd+lp7UlKqOKQHjT/qeFtiuHbTS
         obZi4JH9Ifd8cd23HS+0Vi7YFLdMIFEsgvzebp8TN28VqkUkjnq4u9qNLQCVxcUve53h
         5hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540073; x=1752144873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s+0RaBS3vJpNgepBHSmk/I/U4Dvicv46WDE7RU8TKg=;
        b=DeLd03AWL5KE/NpZIk76D+ni15oZBYc7EbrjRIGWtQl0V0aQs9znUC3ugLir9TJY+4
         SRcsDjl0QhgyxWCwIOKw26NOvnqfUNHqlrLTXlRyLqf+BJAWTrIxVuIA36xaT0qbLGV7
         HlfLf2oyURwo0IdBjooadPofu3rxwRa+yDqKgTkE1boEPRnB1w2vrkG9EzyLn8J6qcev
         hQTh66yGW6KLIOHrZDC/rh0nc9ExXLdwcH6Jq+7ULXGecH49no4dmFT8VObU0f/b4rsF
         fvH2Oo2sseKq56lShVU6kaTp/WlknEohXeI3LwDje+NxVAp38+OXKJVM3yRYlTg4TssY
         zAsA==
X-Forwarded-Encrypted: i=1; AJvYcCVU4q/0qxFQLH9ixi4SKZW1tgZSCjS3LbgoGhBXIvyqCjyN7sR94rn+tWxbFJOvN6imwei6+JzBzs+ZMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVxIeYHOJTJOIvqmkK/9T2tdZv3lFzuXQACgumg9wYQYyUo2fY
	pVDxlr/JykwqTFn168HoSAsNEQLVaA06LpW7FA5n4YGdI9NMjBVj9lJWoZ2qLZJnv/M=
X-Gm-Gg: ASbGnculXjt8+4Uiq2IEvGqKBUrI4mNVpmVHg4uzHJ8aEkqX8SoXtfGNi6JNCd7hQ3G
	Yxb0BtZLYhtZqASb/vbFFB4fegTjB8+/atmeIe9FjfPseckWghqmQzoPgUEzFyQg5rgJjL1DfDr
	4LuEu40UtsTANRNB+WZwkz4vhq1ELMp9psYavJ1T9zP/vs6e9svj6/Ft+Zd5LoTPNgpCP2s4ZT0
	SBRuR6cs9sfmiMZIEdgJ4Oys9y2HryUBLhLTnx+Kyc5lYN5/aYa6lhUiaeslkWqshYHkRQMHbDT
	M1QImdBloi92quLr63Ty/v8DSOEj/olINMW2428HbRghCHs7Htv+cJ+ODlh4F6Uo3QCYYg==
X-Google-Smtp-Source: AGHT+IFq25HTQ9QEIhNCp27zmZLx97EGsAxug71BXz+j7RxWXx0ck3JUwKi8dLTS3DtAE17Jq1LekQ==
X-Received: by 2002:a17:903:2307:b0:234:8a4a:adad with SMTP id d9443c01a7336-23c797fd795mr34397665ad.26.1751540072871;
        Thu, 03 Jul 2025 03:54:32 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b9344sm158881255ad.192.2025.07.03.03.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:54:32 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:24:18 +0530
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
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
Message-ID: <aGZhWlxxQG0Z8awP@sunil-laptop>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-22-apatel@ventanamicro.com>
 <aGUl_S9irfhlHmy2@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGUl_S9irfhlHmy2@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_035433_660026_F352A698 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, Jul 02, 2025 at 03:28:45PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 02, 2025 at 10:43:42AM +0530, Anup Patel wrote:
> > From: Sunil V L <sunilvl@ventanamicro.com>
> > 
> > Add ACPI support for the RISC-V SBI message proxy (MPXY) based
> > mailbox driver.
> 
> ...
> 
> > -		if (dev_of_node(dev))
> > +		if (is_of_node(fwnode)) {
> >  			of_msi_configure(dev, dev_of_node(dev));
> > +		} else if (is_acpi_device_node(fwnode)) {
> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> 
> Actually you don't need to have the if-else-if if I am not mistaken.
> The OF does almost the same as it's done in the second branch for ACPI case.
> How many MSI parents this may have?
> 
OF already has a well defined interface to configure the MSI domain. The
mechanisms existing today are different for DT vs ACPI to find out the
fwnode of the MSI controller. So, it is done differently.

In RISC-V case at least, there will be only one MSI parent.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
