Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8124C001DE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfEZZixloyAzNfgCLZvtqX4EGgMIiFhorT+dkWE9ijI=; b=QmIwmOQuV4Y5sX
	Mu7GZ69SCPvAZW8vV2Sl7ci1cuE8uPPewfetkDoY9qhMkt8mg4WZ4t0mTIFWdlx0KJHY0n0tV+rCh
	a73Mcwb6gr90/1c04vx4m0Ts4+cLUX1qD4SDzgB50cJSv2u2izjSk6xUwmwG2Fy+eziijS+uCa198
	1gVU/RyQi7gbmf7kPAZV9TnBPILaIDlzDzMSfDOW7FAc4NrWeM48xYrRWfqGjAPnltdaE0v5IRDTy
	xKB40J1s43ndhNYkBfMk6NqYMQNzJFuHKlwlNGDDDYr1IqZoe7d3MDkYaef1uRQoevAiHXrRgx2fu
	c3ePUMKHX1qSXJqZ2/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRq62-00BsKP-2K;
	Fri, 04 Aug 2023 08:23:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRq60-00BsJd-2F
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 08:23:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bbf0f36ce4so12846205ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691137419; x=1691742219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U1iCEOYYU/TuYkpsVb8VVtB172iQ0uWVvB+JeREIxpo=;
        b=mNBCtcy+pGxfsWGwe4DsVuDy0NZiV99ZQ4y9rP1aAfOeel/kt5pokMEdhS81rp7emX
         4q6NJxqkNJzQZR5RnuPibbIx0v6AbybMa3VEwgggL6fAkUhefeZhI2/Gz4Q4xac1Hu6h
         8MjfYa3JyEeMVEGBK5ZP+wO1LM8UPpCmHNXVAQxffB8VxXFoW2uSKKYQk2m9NR7CScok
         jix7R8iUOQ9P18rXExjcm9a74uPR2ME3+6gSWvBwejujKQMYqjSyJTaUsKXd3tTT7Ktp
         Ua49YNuBvi/++1M98fkf1zd8ApIbK50kwdYoWSkV7oJpm/agaVJjM+EgS7/TxqGrsKvq
         deDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691137419; x=1691742219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1iCEOYYU/TuYkpsVb8VVtB172iQ0uWVvB+JeREIxpo=;
        b=FMDw+wVJr7hI+AuNKfytN1DWVNJAOKYmu+sRT71ht3ABclzbNhfgnnYG7KTSZRVT3J
         WkxzLNK7npTDDRaHywu6M5d7gkEnS906j9TPNafaAMrYnMcdYVAes26Bv+Mf+oUDAk3y
         kC84a8omTcc6h4yjvxpaw6agKhTglKp8mhrbENVIjwLAzyI5Qb+2OMgn5YeSTNTOazIc
         Qk1syecCHA/U+h4/Acvdxxkn1CTEKEQG/20gyPEQ31hUl7psG08d1vMxXCmw3P/C9dm/
         V1HB6j/3oVlmUG4bfV3SQ2XReKwyK5XjiN55DuN8DdpRILIvx7lbuh4kmdDRXyL3houk
         NzZw==
X-Gm-Message-State: AOJu0Yy/5IGVBnZYg6HltIoLMJx8RaZ4+RDs4tgmWg2kwCuiiAwXoelw
	7Hv3IiReg6umfkeYLPpYcOhyWw==
X-Google-Smtp-Source: AGHT+IErTrIrbgFzVl3JfKafZGO1uGvh7W7gOxEf+8QZhTVoODvh18JAAUR9r8v3VTYouOFQkb7gqw==
X-Received: by 2002:a17:902:e5cb:b0:1bb:5b88:73da with SMTP id u11-20020a170902e5cb00b001bb5b8873damr906032plf.61.1691137419493;
        Fri, 04 Aug 2023 01:23:39 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902b18d00b001ac6b926621sm1138810plr.292.2023.08.04.01.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 01:23:39 -0700 (PDT)
Date: Fri, 4 Aug 2023 13:53:26 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Robert Moore <robert.moore@intel.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [RFC PATCH v1 05/21] arm64: PCI: Migrate ACPI related functions
 to pci-acpi.c
Message-ID: <ZMy1fgzCSICftyWz@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-6-sunilvl@ventanamicro.com>
 <ZMySSmy0sNl7Q+rh@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMySSmy0sNl7Q+rh@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_012340_732254_85222ED5 
X-CRM114-Status: GOOD (  17.33  )
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

On Fri, Aug 04, 2023 at 08:53:14AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 03, 2023 at 11:29:00PM +0530, Sunil V L wrote:
> > The functions defined in arm64 for ACPI support are required
> > for RISC-V also. To avoid duplication, copy these functions
> > to common location.
> 
> ...
> 
> >  }
> > +
> 
> Stray change.
> 
Let me remove this in next version.

> >  arch_initcall(acpi_pci_init);
> > +
> > +#if defined(CONFIG_ARM64)
> 
> ...
> 
> > +	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
> > +	if (IS_ERR(cfg)) {
> > +		dev_err(dev, "%04x:%pR error %ld mapping ECAM\n", seg, bus_res,
> > +			PTR_ERR(cfg));
> > +		return NULL;
> > +	}
> > +
> > +	return cfg;
> 
> Can be
> 
> 	cfg = pci_ecam_create(dev, &cfgres, bus_res, ecam_ops);
> 	ret = PTR_ERR_OR_ZERO(cfg);
> 	if (ret) {
> 		dev_err(dev, "%04x:%pR error %d mapping ECAM\n", seg, bus_res, ret);
> 
> but as far as I understand this is in the original code like this, so consider
> as a suggestion for further cleanups.
>

Good suggestion!. Sure, we can cleanup as a follow on patch.

Thanks,
Sunil 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
