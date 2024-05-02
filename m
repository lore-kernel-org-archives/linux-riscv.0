Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE52DC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 10:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHuKqO9HEQMsL9nq2MXwvV3Ax4Wk4yBcMoh7l4Y5ix4=; b=qfrEG3gIPNMdqS
	HeKH4KLUoGJiA64RmCft6YF8vfzImKnIH/QApUHdUiGWYP502NHeUeS6e4XXvrHI2g0OWXAhjas2X
	5J94F6RJmuE+pdmfKqgWkMwKeAX2+wxMND79vJVZuElYbLyRvL25+kOTpvwO/jEZHT4b+sxyEPsow
	yZnz4i8m7p8+kj3zBw0vbSFfYnjzmFUExLWygx0wSyd7jMuQQqtKZiEDXVgsyeQRR7rSTq9tc0eVS
	F5a8FVPDDjv+q4ZJpCKwhAGz8Gq3qP2UALLnh/wEdPkSm6NwvGxkpV/500aiG9eG8f/owMaTZyP/S
	1ImX7vWunPA4Y5aZs71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TH4-0000000CG5e-2NxI;
	Thu, 02 May 2024 10:02:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TGz-0000000CG1b-3X9Z
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 10:02:44 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e9ffd3f96eso63222245ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714644160; x=1715248960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+kMTT3PzTLyPVaeH+DM1bYJEhGQDgrI4wH+0p7ikXNM=;
        b=UdA/x2KdoHStL3QsBrKJ6XzIE3bC52Tfh1S6NgIu0b2ybzck3OYQlYbqzobn9tKlOb
         guK1niXzfg96dA3ejDAwwHU2nBqR+IihJKXOytFkBgqi+abYddcWf8BK0Q8LEzICnhkX
         /w+iH97HdCQHEpx+az901xmZ3iiNFW2pGw8yo1PYEDiLJIeTZONjrKVug/ns0chVIkDR
         2lkHzHe8oNj176gNVV9UNkriO0y9kNxOO4i3VGNb/KJD+xlQraSqyVCVG2b3QrBiXq4t
         mxIDAfL6NMA1dYy9sAIoYb7EYjZGFy7U8oI6K/ORaQgcZb1svpth6ZjO1gC0x2/XPxIa
         zSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714644160; x=1715248960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kMTT3PzTLyPVaeH+DM1bYJEhGQDgrI4wH+0p7ikXNM=;
        b=NNBEUnaVkBK8N5Zsx1KqJ08iBtA0v7ipffGKeUfuC8aUgSPPX/GFLaxku3zsf53IXl
         4qkZECGvj9SrCrlz7RvX6Mbw6v0ign4Y3PejTv6OrNeiMZ9DF86eOK4weZ28ctVLiGeH
         VGIFjE3FUw84s+y2/MocCyt9zT4O8vuMEhmPPpcYUcuAWywuX1vgVk8sDZYL9LN9y9UY
         nHD9MXO6xDjob/uJYfu7FP1DMIcgtxhfHceHR45ODO2lleuUFtPZXZP1Aesd0F+ia82a
         GNExJrz++QbZ2ef0cd01zq20htideNmUfE8Q14yyATXuWBnNt8JKYNRXJVvSq6VNF7Db
         c1yw==
X-Forwarded-Encrypted: i=1; AJvYcCUWyEbW6Re80Yo6D2AMiUrGovXVBwacy3ke3jpsqojJL83P0ksLC+oq+dIr/EcPCY6w97YJy4LyX5UrSwJGBQPDwrFCbe/738qpLiRq9DYA
X-Gm-Message-State: AOJu0YxpK7PfleEXB0O8rMrgUNpzCCdDAsZaDpzk3Da/pZv/Ltdc0F1p
	JD3vQ2yujZqvR50d8oz9Qv7ahmCiE6vS4+Qso7GJy9PxxEFFdUfje5vk454pnWY=
X-Google-Smtp-Source: AGHT+IFMGhdu0SIDQn/0fGRllf2r0ZaqwxTF1S1fhXPFoF9kfSM7pOtZuP9eC/v0lBtCNsAcHvZnOg==
X-Received: by 2002:a17:902:ce8e:b0:1eb:5323:c320 with SMTP id f14-20020a170902ce8e00b001eb5323c320mr7103763plg.56.1714644157999;
        Thu, 02 May 2024 03:02:37 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.19])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709026e0900b001e604438791sm896026plk.156.2024.05.02.03.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 03:02:37 -0700 (PDT)
Date: Thu, 2 May 2024 15:32:25 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 03/17] ACPI: bus: Add acpi_riscv_init function
Message-ID: <ZjNksbTQF1lMQ0k0@sunil-laptop>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-4-sunilvl@ventanamicro.com>
 <ZjNbvlUoCfa5UUHF@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNbvlUoCfa5UUHF@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_030241_948703_ED6496D8 
X-CRM114-Status: GOOD (  13.70  )
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

On Thu, May 02, 2024 at 12:24:14PM +0300, Andy Shevchenko wrote:
> On Wed, May 01, 2024 at 05:47:28PM +0530, Sunil V L wrote:
> > Add a new function for RISC-V to do any architecture specific
> > initialization. This function will be used to create platform devices
> > like APLIC, PLIC, RISC-V IOMMU etc. This is similar to acpi_arm_init().
> 
> What is the special about this architecture that it requires a separate
> initialization that is _not_ going to be in other cases?
> Please, elaborate.
> 
This init function will be used to create GSI mapping structures and in
future may be others like iommu. Like I mentioned, ARM already has
similar function acpi_arm_init(). So, it is not new right?

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
