Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E058BC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XMjAbmUo6q1AP6jiu2EFcrgvHY7QytyAB5YrDX1lX4=; b=bl/IGqaWvvSK22
	qIG1Bs07grAuFy6f4TSsIyVvpfw4RsOZEltJdyOpJRg7sf8gt9yrbiCAgzSWFmqL7jKeKGI5Etme/
	GXvN7v5CAGgN1FzCep5nqIILQqerh/ahMAgDOq03DX9k5ipkB6+D7EptQuVZnWN9yC5aCGd7SOUu/
	INsXIW0UrHHL1lLVEjnYk4DE5D52dD33dnaUK/Zx5We8qGTLSu2ID/FarZoRG5PE39NzRjCZ1BGy+
	U/ltA3vl+tnu2FZbmbA/XkZYJvAxqmma9B5ZzVGraRa04Bbv7Lxpl7q4wWVy+NQ84do8fLL/8U3FI
	6lfLIiXpFfZ2nyeR4Cmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TXv-0000000CJF3-3B9Q;
	Thu, 02 May 2024 10:20:11 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TXr-0000000CJE4-2U4A;
	Thu, 02 May 2024 10:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714645207; x=1746181207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UBlJgz5xG7D/qPa02aoxxcu20LLe8O6olWTsYyH24Fs=;
  b=RKVP+vQifCcgh/pVNlOL1CWmDzJQxFnsYoVARw5M2cUGl7d4/cjDLHkL
   UP1ogZOkAMuIhc+qDblOnSKK0oWLYUQCCSj1HDZx5o8L4MQ9OH75aFgyB
   ARZ57W63P9o1ehUbdVWhyr0GA8o371Ix224Zh+QUPCzD/aUI3KQyd4iu7
   8FZPlbS2P+EjDOX/J+/XY8o6AYJnnjMyesE8t4zm/ptJKcTCMB6J7jWDp
   tVN09s69sHVnET/beLIUgENlbcqRfnM6zuhfTIweco3Z8SGf2yOFLLVNW
   3Z2mQ/00vCUG5R4bjUqADZFF11NVvDa9apcO2zxePc7a1uKgZWmHYVOHu
   w==;
X-CSE-ConnectionGUID: DNYD9sUkQ4O0cTEmxC9ZPw==
X-CSE-MsgGUID: xlZ99WWrQSuyHx6xJPdSPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10278810"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10278810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 03:20:05 -0700
X-CSE-ConnectionGUID: aiX0mY4vQSeFpVaHn0EPsg==
X-CSE-MsgGUID: Z4pRODJ+R8ebvjkfa5L59g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27156971"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 03:20:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2TXf-00000003HNp-2W6n;
	Thu, 02 May 2024 13:19:55 +0300
Date: Thu, 2 May 2024 13:19:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v5 03/17] ACPI: bus: Add acpi_riscv_init function
Message-ID: <ZjNoy6KLtOCTe52q@smile.fi.intel.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-4-sunilvl@ventanamicro.com>
 <ZjNbvlUoCfa5UUHF@smile.fi.intel.com>
 <ZjNksbTQF1lMQ0k0@sunil-laptop>
 <ZjNnG6JqFCZGj1qv@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNnG6JqFCZGj1qv@bogus>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_032007_680021_34CB2EC2 
X-CRM114-Status: GOOD (  21.26  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <anup@brainfault.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, Andrei Warkentin <andrei.warkentin@intel.com>, linux-serial@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Marc Zyngier <maz@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 02, 2024 at 11:12:43AM +0100, Sudeep Holla wrote:
> On Thu, May 02, 2024 at 03:32:25PM +0530, Sunil V L wrote:
> > On Thu, May 02, 2024 at 12:24:14PM +0300, Andy Shevchenko wrote:
> > > On Wed, May 01, 2024 at 05:47:28PM +0530, Sunil V L wrote:
> > > > Add a new function for RISC-V to do any architecture specific
> > > > initialization. This function will be used to create platform devices
> > > > like APLIC, PLIC, RISC-V IOMMU etc. This is similar to acpi_arm_init().
> > >
> > > What is the special about this architecture that it requires a separate
> > > initialization that is _not_ going to be in other cases?
> > > Please, elaborate.
> > >
> > This init function will be used to create GSI mapping structures and in
> > future may be others like iommu. Like I mentioned, ARM already has
> > similar function acpi_arm_init(). So, it is not new right?
> 
> Just to add:
> 
> This is to initialise everything around all the arch specific tables
> which you will not have on any other architectures. We could execute
> on all architectures but the tables will never be found. The main point
> is why do we want to do that if we can optimise and skip on all other
> archs.

You need to carefully write the commit messages. Some kind of the above
paragraphs has to be in there.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
