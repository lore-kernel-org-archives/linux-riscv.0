Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ADEC25B79
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 04:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3XkVTeiiMiq9nLfNB5o/yVrOuMzoRfz+H72JaeWbNY=; b=t6LZLkoa6y1SM3
	qZ+lzry2HtDaN6tthNMxFutvmZcTAZz3M6PzrSHOhF6Xd2/l+s5gZ8Hlthdy4e+anlTTTsUceP58b
	cPtYyIz5Pz359S6nDoulQmD6WP8TbpOlwC1jdkMs13qSS9yS9Q8BtNXHOODh6AHmN9C/CZZrNasG/
	BopYyqtvVSQpyGAJPRAUyh2GVqiuaV9kGi5FLLQ7jp9kHuHGO0VfvV2ESnzy2uP1zglZwIGa9Oz1E
	rfO9b48jzyHrQSr/mFRCWXXWbItXb9dT5ashPyOCKZ8kmceN5TvOMyaaMVwohpjDkMSzWOEZMSWN5
	M5ZJHhZjVK0iizbfmYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBS5m-0000000DlDg-3pdi;
	Mon, 27 May 2024 04:36:14 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBS5i-0000000DlCP-2Vag
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 04:36:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f4a52b9589so2682465ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 May 2024 21:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716784567; x=1717389367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCL45r5HwUdhMGMoKs1ELoA50Buz5dFrdewkzzL6SwI=;
        b=jIU2ap7DsrDiHRl9gxwipRwQ4vo7Ngfhy5qrpx0n7CKKVxlKa9eVk4B/9F5FbbR8at
         VFpBV2Y4VjC016uVVbDE13YAQqkqQ40PWFogoc5I3QkdtexlGINDHscZfzCOa2xdFCF0
         kJFMpeUBGLO6b4dD7ee/ob8fveMPa/Hty8rBI6zXDTQ210pzKQs8/wx4rRT5wSoTFdRn
         4Fcb2KaoImHJVSbSOlihHI7tBPvOrAdOEnrWNbZGSz7Zfh5ilnoYGb5X4YTMRkyptRSr
         fbH5k6bMhdgCdUhwnHyIdg2QtJikfkd/OSyqI4HWkNU7WsSCoDsVBVDN5V2LccQD/PK5
         9VgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716784567; x=1717389367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCL45r5HwUdhMGMoKs1ELoA50Buz5dFrdewkzzL6SwI=;
        b=JOxFQClJbmBEDRvXFDg0m5nDjzalayQqss0Ras7G7552GqS3En5N/qxXafSQ+ahj1g
         mzgwBP4nImIX4JElk5io2n32H9sPzn/ciybNqHW06V6pQKGAFtHcemABpTMHXUZzOEpg
         LhoDBZIgiZMjTJFNDCKWW6FmeszwnA+k7jhvBB0OOmvfBGSuyx/EDTxovIpNxQVO0Wdj
         VnDFSJXAgC75jHVeS177KW+fX4OWmpaqDC05qaTinzdCxeKq0VWHEXKFYuH+70pNpGrY
         aLywBkADpjKPaQFwUL9H1U5ochKTxGzgvnA5EPOIJKEs3waKwXxLLgfwRBhkoVV0qqGc
         WBvw==
X-Forwarded-Encrypted: i=1; AJvYcCU5GYFbWMjqUhWmDQqcTJ11uMKINA7EhT5Kwl8h2oYS1ATYTAbbc7gWk4HqhOBDvM2iDjjXfmmwK4SjWjY+97Jh/fSMDvaH4YoHin6GDzyG
X-Gm-Message-State: AOJu0YwLQVfvhHV8hoIyOB+76zoYvBodjogWzN2LOfmlVwuZeQgnpXFR
	dr8aVJfP0jvT5ikihhF6/TJNSPuzCJgqQVUI9Nq46KdbgBDaRr3yq7jS+WKLDds=
X-Google-Smtp-Source: AGHT+IH2qTAk+H4YWdMT+3HDQ47VPDZxZ9rT9jbAlx84jUV+F91w+En1i4ZeI520OwORxw1JjKsITQ==
X-Received: by 2002:a17:903:2306:b0:1f4:a77a:3bb9 with SMTP id d9443c01a7336-1f4a77a3ea0mr9409085ad.64.1716784566971;
        Sun, 26 May 2024 21:36:06 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c968516sm50975975ad.179.2024.05.26.21.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 21:36:06 -0700 (PDT)
Date: Mon, 27 May 2024 10:05:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 07/17] ACPI: bus: Add RINTC IRQ model for RISC-V
Message-ID: <ZlQNqiWXNpv30AGp@sunil-laptop>
References: <20240501121742.1215792-8-sunilvl@ventanamicro.com>
 <20240523215903.GA138985@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240523215903.GA138985@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_213610_669851_D31126A1 
X-CRM114-Status: GOOD (  21.40  )
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

On Thu, May 23, 2024 at 04:59:03PM -0500, Bjorn Helgaas wrote:
> On Wed, May 01, 2024 at 05:47:32PM +0530, Sunil V L wrote:
> > Add the IRQ model for RISC-V INTC so that acpi_set_irq_model can use this
> > for RISC-V.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/acpi/bus.c   | 3 +++
> >  include/linux/acpi.h | 1 +
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > index 17ee483c3bf4..6739db258a95 100644
> > --- a/drivers/acpi/bus.c
> > +++ b/drivers/acpi/bus.c
> > @@ -1190,6 +1190,9 @@ static int __init acpi_bus_init_irq(void)
> >  	case ACPI_IRQ_MODEL_LPIC:
> >  		message = "LPIC";
> >  		break;
> > +	case ACPI_IRQ_MODEL_RINTC:
> > +		message = "RINTC";
> > +		break;
> >  	default:
> >  		pr_info("Unknown interrupt routing model\n");
> >  		return -ENODEV;
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index 846a4001b5e0..c1a01fd02873 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -107,6 +107,7 @@ enum acpi_irq_model_id {
> >  	ACPI_IRQ_MODEL_PLATFORM,
> >  	ACPI_IRQ_MODEL_GIC,
> >  	ACPI_IRQ_MODEL_LPIC,
> > +	ACPI_IRQ_MODEL_RINTC,
> 
> Is the ACPI_IRQ_MODEL_RINTC value documented somewhere?  Maybe an ECR
> for the ACPI spec?
> 
> acpi_bus_init_irq() is going to pass ACPI_IRQ_MODEL_RINTC to _PIC, and
> ACPI r6.5, sec 5.8.1 only mentions the ACPI_IRQ_MODEL_PIC,
> ACPI_IRQ_MODEL_IOAPIC, and ACPI_IRQ_MODEL_IOSAPIC values.
> 
> Even the existing ACPI_IRQ_MODEL_PLATFORM, ACPI_IRQ_MODEL_GIC, and
> ACPI_IRQ_MODEL_LPIC values aren't mentioned in ACPI r6.5.
> 
Yeah, I also noticed it. I don't know the history behind this. Rafael or
someone else might have better knowledge. IMO, it is better to update
ACPI spec _PIC with all these values. If I don't see any objections, I
will raise an ECR to update the spec.

Thanks,
Sunl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
