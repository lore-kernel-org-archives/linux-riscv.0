Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47027C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUIsSrPx6/3fHFgZ0IlzLqO8x+2rh8MW2fCG/K0m2eU=; b=qHTn0z2I1nox2v
	k9rt5hKoH1FMj03j454gQMdJtpf45PJJ+52RPtEvtYJaRhx9tyuvcThKbxgdSon08cKrcLBFcwWfA
	Ur9XkoPhbuOP8XX/CnYl+Nab4s4MV/dJta17RtNBWfn47c2JlA5/4g3jx5YO4n3v18ZB9uUM55vDU
	Xi/3JlJINoVZSaLFqK47Ey7ZxeZd8Uymz7bTrXoYyXDnCgxstBJYJ3hp7B7sGdnj4hg1TgA9hCV+v
	kVDoZYTSmnNjzHBpcP5RNqq2oGF8UqA3HfX+3FeL0zUrxlHptz+Zi0MqkSMr7jdbRGwF35dpKrwbd
	3q2mW/PF/oOiRKRiPQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UV9-0000000CVFM-1iNh;
	Thu, 02 May 2024 11:21:23 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UV4-0000000CVDS-3F5q
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 11:21:20 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-61be4b9869dso36020497b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714648874; x=1715253674; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9rhZwyyx5fhbpC3BrgW8PW9voWjesLYpxFqigfVNmtY=;
        b=jW1oWjWD2n/60ZCgIgjTSL45IS2+E1TreneaeLnf3NKsSToW5ACEiDizzdMFmglMGo
         pyHEKCDaC+TFKQXwP2Emc1f7lBFZfvcTxzEZ2V5GjkB1tuPnrpU3brc8ZM1HenHWYSNy
         82eFFU+nn1nCcZx7XoBFeNSr/SCb+eH19uAKv3y2ZfI2022hhzSmi7JgL/FO7MybekQb
         R9888fo/y/TIw+3HEQq3dFSfHWgWJ6on+WR2mhWnw4c6VLwifiGuAaEHXEHyuFjJP70Q
         Zu8dX8c3CyDA7JCi2iNaoaIInKLzuWq8oaX+D3sCm0W9knmLrtEX98Jo8p26i383Xg67
         FyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648874; x=1715253674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rhZwyyx5fhbpC3BrgW8PW9voWjesLYpxFqigfVNmtY=;
        b=wxh2kz67rxpZrOSUMeymprfC5eE8pYJan/NFIMpy7TsVF9SfgaZM//rHiUKrm7Mtc3
         TW5J+9zIARynYJUkRhvSvrsAnXc/v32LgqyNgUSbINDTKt5jYiDNeEaQkQBURVQLAqnY
         fFFlOkq5dDY6e4egupFYf2grbp+gGV2zfTL4KrcAPICpoPvTI/yTfoDWxlf+QIGeLlXD
         isPWZakmAcotrJBKwGXj/rZZC/PUezANnndjhu8H6q6pfQAwP9gSD8z0cygsiOFrFGFr
         PVZduGkAA2Gy5fBNrd9Eyn9n0uINn8vCm82Nz7eB1KlTMQnFvsQaOZzXBlK+ARtlKRQM
         DCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiu0jH8F0S9JVXD+rbHpvlahp7HS8zwtlBF1aeV24hon0sIx9xqj5HR/EEw/QYrpn7HOXzo8olEzGLH2ON46ZQGw4zTi4+YUd3WVTO/IQf
X-Gm-Message-State: AOJu0YxKThjJqNzl0Cav3xCe0hckOh/Ecwbb9rWSjWk2R78edOnP7U4v
	l+oJktFHTqoQdRBb+wk30wJnWkV80/ysGf7KSNOcPZ4esCQYuzl+0wszxOqUQlzuAkCox/Tbb16
	wQB0=
X-Google-Smtp-Source: AGHT+IGdb1BqZxt9QFOczg0KUBkNrWvHSOjTP2hFKx0LDlEWOPANBNbI5rvucoOu4m97AQfAwJklfQ==
X-Received: by 2002:a05:690c:6d11:b0:61b:330e:3fec with SMTP id iv17-20020a05690c6d1100b0061b330e3fecmr1843234ywb.45.1714648872054;
        Thu, 02 May 2024 04:21:12 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.19])
        by smtp.gmail.com with ESMTPSA id m24-20020a81ae18000000b0061bec8ccb67sm155149ywh.76.2024.05.02.04.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:21:11 -0700 (PDT)
Date: Thu, 2 May 2024 16:50:57 +0530
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
Subject: Re: [PATCH v5 17/17] serial: 8250: Add 8250_acpi driver
Message-ID: <ZjN3GQI3gegYOIgS@sunil-laptop>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-18-sunilvl@ventanamicro.com>
 <ZjNaR-YtVTm4pbP7@smile.fi.intel.com>
 <ZjNh0Llcx+0VHevy@sunil-laptop>
 <ZjNmdfR2J6hNnYle@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNmdfR2J6hNnYle@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_042118_929671_D63C5077 
X-CRM114-Status: GOOD (  29.88  )
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

On Thu, May 02, 2024 at 01:09:57PM +0300, Andy Shevchenko wrote:
> On Thu, May 02, 2024 at 03:20:08PM +0530, Sunil V L wrote:
> > On Thu, May 02, 2024 at 12:17:59PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 01, 2024 at 05:47:42PM +0530, Sunil V L wrote:
> 
> ...
> 
> > > > + * This driver is for generic 16550 compatible UART enumerated via ACPI
> > > > + * platform bus instead of PNP bus like PNP0501. This is not a full
> > > 
> > > This has to be told in the commit message. Anyway, we don't need a duplication
> > > code, please use 8250_pnp.
> > 
> > Thank you for the review!. Major issue with PNP0501 is, it gets enumerated
> > in a different way which causes issue to get _DEP to work.
> > pnpacpi_init() creates PNP data structures which gets skipped if the
> > UART puts _DEP on the GSI provider (interrupt controller). In that case,
> > we need to somehow reinitialize such PNP devices after interrupt
> > controller gets probed.
> 
> Then fix that code, we don't want a hack driver on top of the existing one for
> the same.
> 
> What I might think out of head is that used IRQ core for your case should
> return a deferred probe error code when it's not ready, then 8250_pnp will
> get reprobed.
> 
Deferred probe was ruled out in prior discussion. Also, deferred probe
will not work with _DEP approach. The reason is, PNP devices itself are
not getting created from the ACPI name space when they have _DEP. Hence,
serial_pnp_probe() will not be called at all.

> > I tried a solution [1] but it required several
> > functions to be moved out of __init. 
> 
> > This driver is not a duplicate of 8250_pnp. It just relies on UART
> > enumerated as platform device instead of using PNP interfaces.
> > Isn't it better and simple to have an option to enumerate as platform
> > device instead of PNP? 
> 
> Ah, then extract platform driver first from 8250_core.c.
> 
Let me know if I understand your suggestion correctly. Do you mean call
something like serial8250_acpi_init() from serial8250_init() and
register the driver directly in serial8250_acpi_init()?

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
