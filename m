Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CD5C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbA8fV8u2oLQqRqvJ7KhHM/2OZJ0ascGU0W0/Sp53WQ=; b=BszewGDSwLxeMY
	l+y2v0/YquS3+bTLT1qN88attRcjxTFDbdscY0iTUKu+LfMgFtVpBZkjwXYjYRl1CW21c19ZOOrx7
	g2i4dXVTnZ7JYnuYndgUjx8jQ0iVgjVYxwxyKY0Ok+2xZ+ctFWQ/31UurztIA3moOfXc4J4oH41np
	BiIr6taHL4irGQmCKmOo6kSMjCqgOPpXuAle6OsB0B38p95aaNeTeO5eayopaCSQ0QEGGKd48Jyc9
	xw04EaEPTgxDzwgnARl1ean3FTh+fjJhLtwJVMtqFz97MzC7AdeDMoAs8YpczN0fcOnutQlwlNC2z
	psg0lurbKWMUtXJKMP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TR2-0000000CIFt-1KYo;
	Thu, 02 May 2024 10:13:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TQy-0000000CIEA-1RZU;
	Thu, 02 May 2024 10:13:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073A62F4;
	Thu,  2 May 2024 03:13:15 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F12A53F793;
	Thu,  2 May 2024 03:12:45 -0700 (PDT)
Date: Thu, 2 May 2024 11:12:43 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 03/17] ACPI: bus: Add acpi_riscv_init function
Message-ID: <ZjNnG6JqFCZGj1qv@bogus>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-4-sunilvl@ventanamicro.com>
 <ZjNbvlUoCfa5UUHF@smile.fi.intel.com>
 <ZjNksbTQF1lMQ0k0@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNksbTQF1lMQ0k0@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_031300_445028_0B26CE6D 
X-CRM114-Status: GOOD (  17.60  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Marc Zyngier <maz@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <anup@brainfault.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Andrei Warkentin <andrei.warkentin@intel.com>, linux-serial@vger.kernel.org, linux-pci@vger.kernel.org, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 02, 2024 at 03:32:25PM +0530, Sunil V L wrote:
> On Thu, May 02, 2024 at 12:24:14PM +0300, Andy Shevchenko wrote:
> > On Wed, May 01, 2024 at 05:47:28PM +0530, Sunil V L wrote:
> > > Add a new function for RISC-V to do any architecture specific
> > > initialization. This function will be used to create platform devices
> > > like APLIC, PLIC, RISC-V IOMMU etc. This is similar to acpi_arm_init().
> >
> > What is the special about this architecture that it requires a separate
> > initialization that is _not_ going to be in other cases?
> > Please, elaborate.
> >
> This init function will be used to create GSI mapping structures and in
> future may be others like iommu. Like I mentioned, ARM already has
> similar function acpi_arm_init(). So, it is not new right?
>

Just to add:

This is to initialise everything around all the arch specific tables
which you will not have on any other architectures. We could execute
on all architectures but the tables will never be found. The main point
is why do we want to do that if we can optimise and skip on all other
archs.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
