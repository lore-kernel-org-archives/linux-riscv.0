Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BD2C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6gGXAYAi4eVU/InvGoROjCFvXe5s1YFhIuhBTcNCdA=; b=H86Q4i8l3T56nE
	DcguHrbpuwCJnVv3FrLP8fcmFFKo4/QnesxDC+3iHdt1y4fCGOHcglfrDTqXqK1+rfHSHc5sbE9ry
	rJ2Q3tHibRMhP9Tpl9bZObr4dZYJc6SnXSmaf2QBYce/I7zOv9/nN0If6DTx8yLhBhkafSWgHQl0J
	gKFZx2gn5/KMCOe8WQAkHyQhG34KdtaPxe+j61XhDhFZ1ib2PopeltYek/xfLXvJ4jbispRdWkh1s
	BpSB4vohWln0wdyUe8maxcIpOQ7PrGpCXIXY2+4n+HUqpZVoYqFI5U3OhXW7SKyeRpCPm5vAiYZTZ
	rXAATLdoNioQaN+NAwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2So9-0000000CAtI-2eyv;
	Thu, 02 May 2024 09:32:53 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2So5-0000000CAsI-2PA5
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 09:32:51 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ea2436de79so4012080a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714642367; x=1715247167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvW/lnO7fBno/xaBzZIt3Emz2T8DvtxIkgq7/bGwou8=;
        b=jZ7qCxzqQ90UPjPVAPtGCTfQ0uN5B8TFBgKgtXjisBPq0qYlqlBTZNDrqfJHXxmkj3
         oBHvW3T6hhgd7qDAp2vX0iGXCnBAw00xOHH8ike8Zw2rCiUo3JH5pG38GUi+3jApZ9kD
         hKyWM1sFdDXMrTIAXaCNgtxLjdcKw8Ep7j971h3GDOGsOnOPxAkjwUTiZjgkJxybgR3C
         v0DmUCjwI7S5oz8ueysZSdxOAXkJMvY1Z1HDlU3E7t7UjFvy+NUbIKTF5aMG9RojOMOA
         EHlA7MmciAAnELN8R65Ibg256NBUvX3b2IhKsYbJu5uprkBOFN7vCWqtmLdFlt/1M3o3
         6idA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714642367; x=1715247167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvW/lnO7fBno/xaBzZIt3Emz2T8DvtxIkgq7/bGwou8=;
        b=w1rAl5ocCW4slf8num8uMGXcBu1m3dKXP94wsRRcEaMgGK5lhsRTkav5jONTiK1whU
         2kpk15cvlv+dLc8QVv30b/NcxR7eJmIK/LSbUz9F35oBRFmfJ9x04Et3iIM8LhYjHBVY
         lpGPZYgD3SbKadfjMeAIbUlI5DUWPj72FkRFDYoyPSfPgdVWtMPTo3cShYqsl5NaHJO3
         mXOOSDq8mDkzfDJimUlnbJFNFDcNQJ/p9TYVQu9++Y1rcWGOJOwz1oCvbHXL4mKJ+U5r
         YnqCxqhOWW7fDkXfnyJNP58cDAJSfEYkE+fnilu2q6LZYnd8zoPg2J4YnZ8hV7V/ryz2
         J1xg==
X-Forwarded-Encrypted: i=1; AJvYcCU72LtLNz0jQ9i/8F0BV67WQbN5Q8Z15uxoPwYSpNdukG+viO+mCVXUi8Q+e/s3+nDfqJU2cqxbcwjgtFqwzWZ90r5G73dBIY1rmNeTF8ha
X-Gm-Message-State: AOJu0YwIw3NfoBoKajVEftjNUSZUwuYgEq9z9WuZgsoZpJeioLE6liqN
	OGHt8hZypoQMNiGfRhgqjM/jY51qg43jHVjlQjNf+9VE233Z8JEQVkrK2mBtgqc=
X-Google-Smtp-Source: AGHT+IF4b+lPGskb1gHK2IpUgfNkpEMYBXho2rUofukPTZVb0za3mVEu5Rsh7KTHfVzjAbIKdeiEtg==
X-Received: by 2002:a05:6359:4c9e:b0:18f:673e:fce2 with SMTP id kk30-20020a0563594c9e00b0018f673efce2mr6283164rwc.6.1714642367069;
        Thu, 02 May 2024 02:32:47 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.19])
        by smtp.gmail.com with ESMTPSA id l25-20020a63ba59000000b0060795a08227sm692025pgu.37.2024.05.02.02.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 02:32:46 -0700 (PDT)
Date: Thu, 2 May 2024 15:02:33 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v5 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <ZjNdsWP46su9drAK@sunil-laptop>
References: <20240501121742.1215792-9-sunilvl@ventanamicro.com>
 <20240501165615.GA758227@bhelgaas>
 <ZjNcDyLRm9c7BAi3@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNcDyLRm9c7BAi3@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_023249_647164_61CF0465 
X-CRM114-Status: GOOD (  26.66  )
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

On Thu, May 02, 2024 at 12:25:35PM +0300, Andy Shevchenko wrote:
> On Wed, May 01, 2024 at 11:56:15AM -0500, Bjorn Helgaas wrote:
> > On Wed, May 01, 2024 at 05:47:33PM +0530, Sunil V L wrote:
> > > RISC-V platforms need to use dependencies between PCI host bridge, Link
> > > devices and the interrupt controllers to ensure probe order. The
> > > dependency is like below.
> > > 
> > > Interrupt controller <-- Link Device <-- PCI Host bridge.
> > > 
> > > If there is no dependency added between Link device and PCI Host Bridge,
> > > then the PCI end points can get probed prior to link device, unable to
> > > get mapping for INTx.
> > > 
> > > So, add the link device's HID to dependency honor list and also clear it
> > > after its probe.
> > > 
> > > Since this is required only for architectures like RISC-V, enable this
> > > code under a new config option and set this only in RISC-V.
> 
> ...
> 
> > > +	if (IS_ENABLED(CONFIG_ARCH_ACPI_DEFERRED_GSI))
> > > +		acpi_dev_clear_dependencies(device);
> > 
> > This is really a question for Rafael, but it doesn't seem right that
> > this completely depends on a config option.
> 
> +1 here, fells like a hack and looks like a hack.
> 
I can remove the config option. I just thought this would probably never
required to be called on other architectures.

Unless there is an objection, I will remove it in next version.

Thanks!
Sunil
> > Is there a reason this wouldn't work for all architectures, i.e., what
> > would happen if you just called acpi_dev_clear_dependencies()
> > unconditionally?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
